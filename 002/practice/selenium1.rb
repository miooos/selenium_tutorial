require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://www.google.com")
sleep 3
