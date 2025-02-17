function is_empty(s)
  return s == nil or s == ''
end

function translation(lang)
  local result
  if (lang == "nl-BE") then
    result = {
      author = "Geschreven door",
      author_pdf = "Auteurs",
      ccby = "Dit werk valt onder een \\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Naamsvermelding 4.0 Internationaal-licentie}.",
      citation = "Wijze van citeren",
      city = "Brussel",
      client = "Dit onderzoek werd uitgevoerd in opdracht van",
      cooperation = "Dit onderzoek werd uitgevoerd in samenwerking met",
      country = "België",
      coverdescription = "Foto cover",
      depotnr = "Depotnummer",
      export = "Exporteer referentie als",
      location = "Vestiging",
      mission = "Hier komt de missie",
      ordernr = "Opdrachtnummer",
      reviewer = "Nagelezen door",
      reviewer_pdf = "Reviewers",
      series = "Rapporten van het",
      vu = "Verantwoordelijke uitgever",
      year = "Gepubliceerd in"
    }
  elseif (lang == "fr-FR") then
    result = {
      author = "Écrit par",
      author_pdf = "Auteurs",
      ccby = "Ce rapport est sous licence \\href{https://creativecommons.org/licenses/by/4.0/deed.fr}{Creative Commons Attribution 4.0 International}.",
      citation = "Citation recommandée",
      city = "Bruxelles",
      client = "Cette étude a été commandée par",
      cooperation = "Cette étude a été menée en collaboration avec",
      country = "Belgique",
      coverdescription = "Photo de couverture",
      depotnr = "Numéro de dépôt",
      export = "Exporter la référence à",
      location = "Adresse",
      mission = "Mission statement",
      ordernr = "Numéro de commande",
      reviewer = "Examiné par",
      reviewer_pdf = "Reviewers",
      series = "Rapports de",
      vu = "Éditeur responsable",
      year = "Publié en"
    }
  else
    result = {
      author = "Written by",
      author_pdf = "Authors",
      ccby = "This work is licensed under a \\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 Generic License}.",
      citation = "Way of quoting",
      city = "Brussels",
      client = "This study was commissioned by",
      cooperation = "This study was conducted in collaboration with",
      country = "Belgium",
      coverdescription = "Cover photo",
      depotnr = "Deposit number",
      export = "Export reference to",
      location = "Location",
      mission = "Misson statement",
      ordernr = "Order number",
      reviewer = "Reviewed by",
      reviewer_pdf = "Reviewers",
      series = "Reports of the",
      vu = "Responsible publisher",
      year = "Published during"
    }
  end
  return result
end

function abbreviate_person(person, i, type, n)
  if i > 2 then
    return ''
  end
  if i == 2 and n > 2 then
    return ' et al.'
  end
  if (i > 1) then
    res = ' & '
  else
    res = ''
  end
  if is_empty(person.name) then
    res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!</h1>'
  else
    if is_empty(person.name.family) then
      res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!</h1>'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
    if is_empty(person.name.given) then
      res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!</h1>'
    else
      local x = pandoc.utils.stringify(person.name.given)
      res = res .. ', ' .. string.gsub(x, '([A-Z])[a-zàçéèïîôö]*', '%1.')
    end
  end
  return res
end

function shortauthor(author)
  n = 0
  for i, person in pairs(author) do
    n = i
  end
  z = ''
  for i, person in pairs(author) do
    z = z .. abbreviate_person(person, i, 'author', n)
  end
  return z
end

return {
  {
    Meta = function(meta)
      meta.translation = translation(pandoc.utils.stringify(meta.lang))
      if is_empty(meta.flandersqmd.author) then
        meta.shortauthor = pandoc.RawInline(
          "html",
          '<h1 class = "missing">!!! Missing flandersqmd.author !!!</h1>'
        )
      else
        meta.shortauthor = shortauthor(meta.flandersqmd.author)
      end
      return meta
    end
  }
}
