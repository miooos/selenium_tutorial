require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")

urls = [];
d.find_elements(:class, 'post').each do |post|
  urls << post.find_element(:tag_name, 'h2').find_element(:tag_name, 'a').attribute('href')
end

d.find_element(:xpath, '//*[@id="main"]/nav/div/a[2]').click
sleep 3

