require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")
puts d.find_element(:id, 'post-224').find_element(:tag_name, 'h2').text
sleep 3

