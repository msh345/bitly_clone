get '/' do
  @urls = Url.all.order('id ASC')
  erb :index
end

get '/:extension' do
  url = Url.find_by_extension(params[:extension])
  url.increment_click_count
  @redirect_url = url.name
  redirect to "#{@redirect_url}" 
end


post '/urls' do
  user_url = params[:long_url]
  extension = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
  short_url = Url.create(:name => user_url, :extension => extension)
  @error_message = short_url.errors[:name].join('')
  @urls = Url.all.order('id ASC')
  erb :index
end


