json.articles do
  json.data @articles do |article|
    json.id article.id
    json.title article.title
    json.body article.body
    json.author article.user
  end
end