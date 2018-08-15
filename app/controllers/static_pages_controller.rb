class StaticPagesController < ApplicationController
  require 'open-uri'

  def home
    url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    @response = JSON.parse(open(url).read)
    @n = 0
    @shift = 0

    respond_to do |format|
      format.html
      format.js
    end
  end
end
