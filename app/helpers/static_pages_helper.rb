module StaticPagesHelper

  def news_time(time)
    time_difference = (Time.now.utc - Time.at(time)).to_i

    if time_difference < 3600
      new_time = (time_difference / 60).round
      new_time.to_s + " minute".pluralize(new_time) + " ago"
    elsif time_difference >= 3600 && time_difference < 86400
      new_time = (time_difference / 3600).round
      new_time.to_s + " hour".pluralize(new_time) + " ago"
    else
      new_time = (time_difference / 86400).round
      new_time.to_s + " day".pluralize(new_time) + " ago"
    end
  end

  def news_url(url)
    return if url.blank?
    url = url.to_s
    url = url.sub(/www./, '') if url.include? "www."
    URI.parse(url).host
  end

  def news_comments(comments)
    if comments.nil? || comments == 0
      "discuss"
    else
      comments.to_s + " comment".pluralize(comments)
    end
  end
end
