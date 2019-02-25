# 開いているページのURLを所得する
def getUrl(d, urls)
  d.find_elements(:class, 'post').each do |post|
    urls << post.find_element(:tag_name, 'h2').find_element(:tag_name, 'a').attribute('href')
  end
  return urls
end


# main処理
require 'selenium-webdriver'

d = Selenium::WebDriver.for :chrome
d.get("https://katsulog.tech/")

urls = []

# 1ページ目のurlを取得する
urls = getUrl(d, urls)

# 2ページ目に画面遷移
d.find_element(:xpath, '//*[@id="main"]/nav/div/a[2]').click

# 2ページ目のurlを取得する
urls = getUrl(d, urls)

urls.each do |url|
  puts url
end

sleep 3



