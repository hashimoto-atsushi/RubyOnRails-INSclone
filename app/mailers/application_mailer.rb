class ApplicationMailer < ActionMailer::Base
  default from: ENV['COMPANY_MAIL']
  layout 'mailer'
end
