require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")
puts d.find_elements(:class, 'post')[2].text
sleep 3
