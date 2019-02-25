require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")

titles = [];
d.find_elements(:class, 'post').each do |post|
  titles << post.find_element(:tag_name, 'h2').text
end

titles.each do |title|
  puts title
end

sleep 3
