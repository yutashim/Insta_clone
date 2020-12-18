class NotificationMailer < ApplicationMailer
  def notification_mail(post)
    @post = post
    mail to: post.user.email, subject: '投稿完了のメール'
  end
end
