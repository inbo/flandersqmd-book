function is_empty(s)
  return s == nil or s == ''
end

local function pdf_footer(meta)
  local z
  if is_empty(meta.flandersqmd.doi) then
    if tonumber(pandoc.utils.stringify(meta.displaycolophon)) > 0 then
      if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
        z = "!!! missing flandersqmd.doi !!!"
      else
        if is_empty(meta.flandersqmd.reportnr) then
          z = "!!! missing flandersqmd.reportnr !!! \\DTMnow"
        else
          z = pandoc.utils.stringify(meta.flandersqmd.reportnr) .. " \\DTMnow"
        end
      end
    else
      z = "\\DTMnow"
    end
  else
    z = pandoc.utils.stringify(meta.flandersqmd.doi)
  end
  return pandoc.RawInline("latex", z)
end

--[[format person]]
local function title_person(person, i, type)
  local res = ''
  if i > 1 then
    res = res .. ', '
  end
  if is_empty(person.name) then
    res = res .. '!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!'
  else
    if is_empty(person.name.given) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!'
    else
      res = res .. pandoc.utils.stringify(person.name.given)
    end
    if is_empty(person.name.family) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
  end
  return res
end

local function title_author(meta)
  if is_empty(meta.flandersqmd.author) then
    z = '!!! Missing flandersqmd.author !!!'
  else
    z = ''
    for i, person in pairs(meta.flandersqmd.author) do
      z = z .. title_person(person, i, 'author')
    end
  end
  return pandoc.RawInline("latex", z)
end

--[[format colophon person]]
local function colophon_person(res, person, i, type, affiliations)
  if i > 1 then
    res = res .. ', '
  end
  if is_empty(person.name) then
    res = res .. '!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!'
  else
    if not is_empty(person.orcid) then
      res = res .. '\\href{https://orcid.org/' .. pandoc.utils.stringify(person.orcid) .. '}{'
    end
    if is_empty(person.name.given) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!'
    else
      res = res .. pandoc.utils.stringify(person.name.given)
    end
    if is_empty(person.name.family) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
    if not is_empty(person.affiliation) then
      local indices = {}

      -- Helper to find the 1-based index of an affiliation in meta_affiliations
      local function get_affil_index(target_affil)
        local target_str = pandoc.utils.stringify(target_affil)
        for idx, m_affil in ipairs(affiliations) do
          if pandoc.utils.stringify(m_affil) == target_str then
            return idx
          end
        end
        return nil
      end

      -- Check if person.affiliation is a List or a single value
      if pandoc.utils.type(person.affiliation) == 'List' then
        for _, affil in ipairs(person.affiliation) do
          local idx = get_affil_index(affil)
          if idx then
            table.insert(indices, tostring(idx))
          end
        end
      else
        local idx = get_affil_index(person.affiliation)
        if idx then
          table.insert(indices, tostring(idx))
        end
      end

      -- If we found matching affiliations, append them as a LaTeX superscript
      if #indices > 0 then
        res = res .. '\\textsuperscript{' .. table.concat(indices, ',') .. '}'
      end
    end
    if not is_empty(person.orcid) then
      res = res .. ' \\includegraphics[height=\\fontsizebase]{orcid.eps}}'
    end
  end
  return res
end

--[[format colophon person]]
local function corresponding_person(person, i, type)
  local res = ''
  if not is_empty(person.corresponding) then
    if is_empty(person.email) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' has no e-mail element!!!'
    else
      x = pandoc.utils.stringify(person.email)
      res = res .. '\\href{mailto:' .. x .. '}{' .. x .. '} '
    end
  end
  return res
end

local function colophon_author(meta)
  local z = ''
  if is_empty(meta.flandersqmd.author) then
    z = '!!! Missing flandersqmd.author !!!'
  else
    for i, person in pairs(meta.flandersqmd.author) do
      z = colophon_person(z, person, i, 'author', meta.affiliation)
    end
  end
  return pandoc.RawInline("latex", z)
end

local function reviewer(meta)
  local z = ''
  if is_empty(meta.flandersqmd.reviewer) then
    z = '!!! Missing flandersqmd.reviewer !!!'
  else
    for i, person in pairs(meta.flandersqmd.reviewer) do
      z = colophon_person(z, person, i, 'reviewer', meta.affiliation)
    end
  end
  return pandoc.RawInline("latex", z)
end

local function corresponding(meta)
  if is_empty(meta.flandersqmd.author) then
    z = '!!! Missing flandersqmd.author !!!'
  else
    z = ''
    for i, person in pairs(meta.flandersqmd.author) do
      if z == '' then
        z = corresponding_person(person, i, 'author')
      end
    end
    if z == '' then
      x = meta.translation.email
      z = '\\href{mailto:' .. x .. '}{' .. x .. '} '
    end
  end
  return pandoc.RawInline("latex", z)
end

local function client(client, tag, url, logo)
  if is_empty(client) then
    pandoc.RawInline("latex", "")
  end
  z = '\\textbf{' .. tag .. ":}"
  for i, x in pairs(client) do
    z = z .. "\\\\" .. pandoc.utils.stringify(x)
  end
  if not is_empty(url) then
    x = pandoc.utils.stringify(url)
    z = z .. "\\\\\n\\url{" .. x .. "}"
  end
  if not is_empty(logo) then
    x = pandoc.utils.stringify(logo)
    z = z .. "\\\\ \\vspace{\\fontsizebase} \\includegraphics[height = 15mm, keepaspectratio]{" .. x .. "}"
  end
  return pandoc.RawInline("latex", z)
end

local function get_affiliation(meta)
  local seen_affiliations = {}
  local unique_affiliations = pandoc.List()

  -- Helper function to deduplicate and store affiliations
  local function add_affiliation(affil)
    -- Stringify the AST element to get a comparable string key
    local text_key = pandoc.utils.stringify(affil)

    if not seen_affiliations[text_key] then
      seen_affiliations[text_key] = true
      unique_affiliations:insert(affil)
    end
  end

  for _, author in ipairs(meta.flandersqmd.author) do
    if author.affiliation then
      -- 3. Handle both lists of affiliations and single affiliation strings
      if pandoc.utils.type(author.affiliation) == 'List' then
        for _, affil in ipairs(author.affiliation) do
          add_affiliation(affil)
        end
      else
        -- It's a single value (e.g., Inlines)
        add_affiliation(author.affiliation)
      end
    end
  end

  return unique_affiliations
end

local display_affiliation = function(unique_affiliations)
  local z = ''
  for i, affil in ipairs(unique_affiliations) do
    if (i > 1) then
      z = z .. '\\\\\n'
    end
    z = z .. '\\textsuperscript{' .. i .. '}' .. pandoc.utils.stringify(affil)
  end
  return pandoc.RawInline("latex", z)
end

return {
  {
    Meta = function(meta)
      meta.pagefooter = pdf_footer(meta)
      meta.title_author = title_author(meta)
      meta.affiliation = get_affiliation(meta)
      meta.colophon_author = colophon_author(meta)
      meta.reviewer = reviewer(meta)
      meta.affiliation = display_affiliation(meta.affiliation)
      meta.corresponding = corresponding(meta)
      if not is_empty(meta.flandersqmd.client) then
        meta.client = client(
          meta.flandersqmd.client, meta.translation.client,
          meta.flandersqmd.clienturl, meta.flandersqmd.clientlogo
        )
      end
      if not is_empty(meta.flandersqmd.cooperation) then
        meta.cooperation = client(
          meta.flandersqmd.cooperation, meta.translation.cooperation,
          meta.flandersqmd.cooperationurl, meta.flandersqmd.cooperationlogo
        )
      end
      if not is_empty(meta.flandersqmd.floatbarrier) then
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "section") then
          meta.floatbarriersection = true
        end
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "subsection") then
          meta.floatbarriersubsection = true
        end
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "subsubsection") then
          meta.floatbarriersubsubsection = true
        end
      end
      return meta
    end
  }
}
