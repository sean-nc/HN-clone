class StaticPagesController < ApplicationController
  require 'open-uri'
  require 'will_paginate/array'

  def home
    url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    @response = JSON.parse(open(url).read)
    per_page = 15
    @response = @response.paginate(page: params[:page], per_page: per_page)

    if params[:page].blank?
      @n = 0
    else
      @n = per_page * (params[:page].to_i - 1)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
