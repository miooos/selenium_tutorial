require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")
puts d.find_element(:id, 'post-224').text
puts d.find_elements(:class, 'post').count
sleep 3
