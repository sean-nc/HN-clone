class StaticPagesController < ApplicationController
  require 'open-uri'
  require 'will_paginate/array'

  def home
    url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    @response = JSON.parse(open(url).read).take(5)
    per_page = 30
    @response = @response.paginate(page: params[:page], per_page: per_page)

    params[:page].blank? ? @n = 0 : @n = per_page * (params[:page].to_i - 1)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
