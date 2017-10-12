class OrderMailer < ApplicationMailer
  def receipt_email(order, user)
    p @order = order
    p @user = user
    mail(to: user.email, subject: "Jungle Order #{@order.id}")
  end
end
