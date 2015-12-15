class WelcomeController < ApplicationController
  def index
    puts ENV['SENDGRID_USERNAME']
    puts ENV['SENDGRID_PASSWORD']
  end

  def about
  end
end
