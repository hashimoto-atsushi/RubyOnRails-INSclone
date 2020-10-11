class BlogMailer < ApplicationMailer
  def blog_mail(mailer, blog)
    @mailer = mailer
    @blog = blog
    debugger
    mail to: @mailer.email, subject: "#{@mailer.name}さん、画像投稿 完了のお知らせ"
  end
end
