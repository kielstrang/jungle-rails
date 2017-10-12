class OrderMailer < ApplicationMailer
  def receipt_email(order, user)
    mail(to: user.email, subject: "Your Jungle Order")
  end
end
