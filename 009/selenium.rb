require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome

d.get("https://katsulog.tech/")

urls = []
loop do
  d.find_elements(:class, 'post').each do |post|
    urls << post.find_element(:tag_name, 'h2').find_element(:tag_name, 'a').attribute("href")
  end

  if d.find_elements(:xpath, '//*[@class="next page-numbers"]').size > 0
    d.find_element(:xpath, '//*[@class="next page-numbers"]').click
  else
    break
  end
end

urls.each do |url|
  puts url
end

sleep 3
