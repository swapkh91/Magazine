json.data do
  json.id @article.id
  json.title @article.title
  json.body @article.body
  json.author do |author|
    author.name @article.user.name
    author.id @article.user.id
  end
end if @article.present?