class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :json

  def home

  end

  protected

  def authenticate
    unless params[:apikey] == '123'
      render :json => {:message => 'NOT AUTHORIZED'}, :status => 403
      return
    end
  end
end
