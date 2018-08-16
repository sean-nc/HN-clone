class StaticPagesController < ApplicationController
  require 'open-uri'
  require 'will_paginate/array'

  def home
    url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    @response = JSON.parse(open(url).read)
    @response = @response.paginate(page: params[:page], per_page: 15)
    @n = 0

    respond_to do |format|
      format.html
      format.js
    end
  end
end
