class CustomMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  def reset_password_instructions(record, token, opts={})
  	geocache = record.geocaches.new
  	geocache.name = "Kätkö"
    geocache.coordintaes = "N62 15.151 E025 45.505"
  	geocache.code = "GC1234"
  	geocache.description = "täältä löytyisi"
  	geocache.notes = "onnea"
  	geocache.save!
  	super
  end
end