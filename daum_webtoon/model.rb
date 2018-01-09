# need install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/webtoon.db")

class Webtoon
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :desc, String
  property :score, String
  property :img_url, String
  property :url, String
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Webtoon.auto_upgrade!
