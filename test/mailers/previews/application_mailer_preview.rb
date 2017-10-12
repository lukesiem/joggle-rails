
class ApplicationMailerPreview < ActionMailer::Preview
   def email_receipt
  	ApplicationMailer.email_receipt(Order.last)
  end
  
end

