require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")

urls = [];
d.find_elements(:class, 'post').each do |post|
  urls << post.find_element(:tag_name, 'h2').find_element(:tag_name, 'a').attribute('href')
end

urls.each do |url|
  puts url
end
sleep 3
