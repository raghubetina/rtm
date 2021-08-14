class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!
end
