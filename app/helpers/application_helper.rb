# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def partial(*args)
    render(*args)
  end
  
  def main_nav(label, link)
    opts = {}
    opts[:class] = "selected" if (params[:path] && params[:path].first) == link.split('/').reject{|x| x.blank?}.first
    link_to label, link, opts
  end
  
  def sub_nav(label, link)
    opts = {}
    opts[:class] = "active" if request.env['REQUEST_URI'].gsub(/\/$/, "") == link.gsub(/\/$/, "")
    link_to label, link, opts
  end
  
  def is_simple?
    params[:controller] == 'contacts' or params[:controller] == 'vertebra'
  end

  def is_home?
    params[:controller] == 'home'
  end

  def is_railshosting?
    params[:action] == 'rails_hosting'
  end
  
  def customer_quotes
    quotes = Dir["app/views/shared/customer_quotes/*"].map{|x| File.basename(x)}.map{ |x| x.gsub(/^_([^.]*).*/, '\1')}
    partial "shared/customer_quotes/#{quotes[rand(quotes.size)]}"
  end
  
  def partners
    partners = Dir["app/views/shared/partners/*"].map{|x| File.basename(x)}.map{ |x| x.gsub(/^_([^.]*).*/, '\1')}
    partial "shared/partners/#{partners[rand(partners.size)]}"
  end
  
  def random_banner
    banners = Dir["app/views/shared/banners/*"].map{|x| File.basename(x)}.map{ |x| x.gsub(/^_([^.]*).*/, '\1')}
    partial "shared/banners/#{banners[rand(banners.size)]}"
  end
  
  def random_customer_video
    # This needs cleanup
    if params[:watch] == "pivotallabs" || params[:watch] == "bleacherreport" || params[:watch] == "spongecell"
      partial "static/customers/banners/#{params[:watch]}"
    else
      videos = Dir['app/views/static/customers/banners/*'].map{|x| File.basename(x)}.map{ |x| x.gsub(/^_([^.]*).*/, '\1')}
      partial "static/customers/banners/#{videos[rand(videos.size)]}"
    end
  end
  
  def embed_vimeo(id, height, width)
    '<object width="'+width+'" height="'+height+'">
      <param name="allowfullscreen" value="true" />
      <param name="allowscriptaccess" value="always" />
      <param name="wmode" value="opaque" />
      <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id='+id+'&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=ffffff&amp;fullscreen=1" />
      <embed src="http://vimeo.com/moogaloop.swf?clip_id='+id+'&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=ffffff&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" wmode="opaque" width="'+width+'" height="'+height+'"></embed>
    </object>'
  end
end