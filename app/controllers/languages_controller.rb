class LanguagesController < ApplicationController
  def search
    LangStorage.new
    result = SearchEngine.new(params[:query]).result
    render json: result
  end
end
