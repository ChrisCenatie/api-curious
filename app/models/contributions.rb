class Contributions
  require 'nokogiri'
  require 'open-uri'

  def initialize(nickname)
    @url = "https://github.com/#{nickname}"
  end

  def commits
    Nokogiri::HTML(open(@url)).at_css(".contrib-number").text.gsub("total","").rstrip.gsub(",","").to_i
  end

  def longest_streak
    Nokogiri::HTML(open(@url)).css(".contrib-column").css(".table-column").css(".contrib-number")[1].text.strip.gsub("days","").rstrip
  end

  def current_streak
    Nokogiri::HTML(open(@url)).css(".contrib-column").css(".table-column").css(".contrib-number")[2].text.strip.gsub("days","").rstrip
  end
end
