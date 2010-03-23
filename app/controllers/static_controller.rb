class StaticController < ApplicationController
  
  def show
    @path = (['static'] + params[:path])
    begin
      render :template => @path.join('/')
    rescue ActionView::MissingTemplate
      begin
        render :template => (@path << 'index').join('/')
      rescue ActionView::MissingTemplate
        render :template => 'exceptions/not_found'
      end
    end
  end
  
end
