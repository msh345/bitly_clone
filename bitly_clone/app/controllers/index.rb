get '/' do
  # let user create new short URL, display a list of shortened URLs

  @urls = Url.all
  erb :index
end

# e.g., /q6bda
get '/:extension' do
  url_object = Url.where(:extension => params[:extension])
  # @count = url_object.first.click_count.to_i
  # @count += 1
  # @count.save
  @redirect_url = url_object.first.name
  redirect to "#{@redirect_url}" 
end

post '/urls' do
  # create a new Url
  user_url = params[:long_url]
  extension = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
  Url.create(:name => user_url, :extension => extension)
  redirect to "/"
end


