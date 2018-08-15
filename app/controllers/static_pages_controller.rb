class StaticPagesController < ApplicationController
  require 'open-uri'

  def home
    response = JSON.parse(open(
                            "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
                          ).read).first(30)
    @news = []
    response.each do |id|
      news = JSON.parse(open(
                          "https://hacker-news.firebaseio.com/v0/item/#{id}.json?print=pretty"
                        ).read, symbolize_names: true)
      @news << news
    end
    @n = 0
  end
end
