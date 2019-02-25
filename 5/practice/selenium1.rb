require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")
puts d.find_element(:id, 'post-224').attribute('class')
sleep 3
