class HomeController < ApplicationController
	
  def index
  	    @homepage = Setting.where(setting_name: "homepage").first
  end
end
