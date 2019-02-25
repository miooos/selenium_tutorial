require 'csv'
require "selenium-webdriver"

bom = %w(EF BB BF).map {|e|e.hex.chr }.join
csv_file = CSV.generate(bom) do |csv|
  csv << ["No", "Title", "URL"]
end

File.open("result.csv", "w") do |file|
  file.write(csv_file)
end

d = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

d.get("https://katsulog.tech/")

urls = []
loop do
  wait.until { d.find_elements(:class, 'post').size > 0 }
  d.find_elements(:class, 'post').each do |post|
    urls << post.find_element(:tag_name, 'h2').find_element(:tag_name, 'a').attribute("href")
  end

  if d.find_elements(:xpath, '//*[@class="next page-numbers"]').size > 0
    d.find_element(:xpath, '//*[@class="next page-numbers"]').click
  else
    break
  end
end

i = 1
urls.each do |url|
  d.get(url)
  title = d.find_element(:id, 'main').find_element(:tag_name, 'h2').text
  page_url = d.current_url
  CSV.open('result.csv', 'a') do |file|
    file << [i, title, page_url]
  end
  i += 1
end