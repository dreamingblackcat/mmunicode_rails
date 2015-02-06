require_relative "../lib/acitverecord_mmunicode.rb"
require 'active_record'
require 'sqlite3'
require 'yaml'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
 
# Create a demo table
ActiveRecord::Schema.define(:version => 0) do
  create_table :posts do |t|
    t.text :body
    t.string :title
  end
end

ActiveRecord::Schema.define(:version => 0) do
	  create_table :books do |t|
	    t.text :author
	    t.string :title
	    t.integer :age
	  end
end

class Post < ActiveRecord::Base
	include AcitveRecordMmunicode
	mm_unicodify :title,:body

end