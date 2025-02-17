function translation_entity(result, lang)
  if (lang == "nl-BE") then
    result.address = "INBO Brussel, Herman Teirlinckgebouw, Havenlaan 88 bus 73, 1000 Brussel"
    result.city = "Brussel"
    result.mission = "Het INBO is het onafhankelijk onderzoeksinstituut van de Vlaamse overheid dat via toegepast wetenschappelijk onderzoek, data- en kennisontsluiting het biodiversiteitsbeleid en -beheer onderbouwt en evalueert."
    result.name = "Instituut voor Natuur- en Bosonderzoek"
    result.series = "Rapporten van het"
    result.url = "https://www.vlaanderen.be/inbo"
    result.url_text = "vlaanderen.be/inbo"
  elseif (lang == "fr-FR") then
    result.address = "INBO Bruxelles, Herman Teirlinckgebouw, Avenu du Port 88 boîte 73, 1000 Bruxelles"
    result.city = "Bruxelles"
    result.mission = "l'Institut de Recherche sur la Nature et les Forêts ('Instituut voor Natuur- en Bosonderzoek', INBO) est un institut de recherche indépendant du gouvernement flamand, qui étaye et évalue la politique et la gestion en matière de biodiversité par la recherche scientifique appliquée, l'intégration et la dissémination publique de données et de connaissances."
    result.name = "l'Institut de Recherche sur la Nature et les Forêts"
    result.series = "Rapports de"
    result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
    result.url_text = "vlaanderen.be/inbo"
  else
    result.address = "INBO Brussels, Herman Teirlinckgebouw, Havenlaan 88 bus 73, 1000 Brussels"
    result.city = "Brussels"
    result.mission = "The Research Institute for Nature and Forest (INBO) is an independent research institute of the Flemish government. Through applied scientific research, open data and knowledge, integration and disclosure, it underpins and evaluates biodiversity policy and management."
    result.name = "Research Instute for Nature and Forest"
    result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
    result.url_text = "vlaanderen.be/inbo"
  end
  result.issn_nr = "1782-9054"
  result.vu_name = "Hilde Eggermont"
  return result
end

return {
  {
    Meta = function(meta)
      meta.entity = translation_entity(meta.translation, pandoc.utils.stringify(meta.lang))
      return meta
    end
  }
}
