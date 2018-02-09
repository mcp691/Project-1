class UserMailer < ApplicationMailer
  default from: "matthewprimpas@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
          to: 'matthewprimpas@gmail.com',
          subject: "A new contact form message from #{name}")
  end
end
