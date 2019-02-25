require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://www.yahoo.co.jp")
sleep 3
