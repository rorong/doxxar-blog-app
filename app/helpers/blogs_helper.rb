module BlogsHelper
  def image_url_for_blog(blog)
    if blog.content.include?("<img")
      extract_image_src(blog.content)
    else
      asset_url("post-bg.jpg")
    end
  end
  def extract_image_src(content)
    doc = Nokogiri::HTML(content)
    img_tag = doc.at_css('img')
    img_tag['src'] if img_tag
  end
end
