# http://stackoverflow.com/a/6797707
Dir[Rails.root + 'lib/**/*.rb'].each do |file|
  require file
end