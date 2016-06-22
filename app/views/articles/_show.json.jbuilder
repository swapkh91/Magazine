json.data do
  json.id @article.id
  json.title @article.title
  json.body @article.body
  json.author @article.user
end if @article.present?