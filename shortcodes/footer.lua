function is_empty(s)
  return s == nil or s == ''
end

return {
  ['footer'] = function(args, kwargs, meta)

    z = '<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">' ..
      '<img alt="Creative Commons-License" style="border-width:0" class="ccby"/>' ..
      '</a>' .. meta.shortauthor
    if is_empty(meta.flandersqmd.year) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.year !!!</h1>'
    else
      z = z .. ' (' .. pandoc.utils.stringify(meta.flandersqmd.year) .. ')'
    end
    if is_empty(meta.flandersqmd.doi) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.doi !!!</h1>'
    else
      local x = pandoc.utils.stringify(meta.flandersqmd.doi)
      z = z .. ' <a href="https://doi.org/' .. x .. '">' .. x .. '</a>'
    end

    return pandoc.RawInline("html", z)
  end
}
