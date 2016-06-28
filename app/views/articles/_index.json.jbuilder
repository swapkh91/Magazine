json.articles do
  json.data @articles do |article|
    json.id article.id
    json.title article.title
    json.body article.body
    json.author do |author|
      author.name article.user.name
      author.id article.user.id
    end
  end
end