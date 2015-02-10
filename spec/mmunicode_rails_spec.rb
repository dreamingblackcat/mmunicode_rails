require_relative "spec_helper.rb"
require "minitest/autorun"


describe MmunicodeRails::ActiveRecordMacro do
    	
    let(:data) do
    	{
    		zawgyi_title: "ဒါဟာေဇာ္ဂ်ီ",
			unicode_title: "ဒါဟာဇော်ဂျီ",
			mixed_title: "ဒဒါဟာေဇာ္ဂ်ီါဟာဇော်ဂျီ",
			zawgyi_body: "ယူနီကုတ္လားဗ်",
			unicode_body: "ယူနီကုတ်လားဗျ",
			mixed_body: "ယူနီကုတ္လားဗ်ယူနီကုတ်လားဗျ"
		}
    end 

	let(:post) {Post.new({title: data[:zawgyi_title],body: data[:unicode_body]})}

	it "adds the #mmunicode_convert method to the included class" do
		Post.must_respond_to :mmunicode_convert
	end

	it "raise error if the field_types are not text or string" do
		-> {
			class Book < ActiveRecord::Base
				mmunicode_convert :age
			end
			}.must_raise MmunicodeRails::ActiveRecordMacro::NotSupportedForNonStringTypesError
	end

	describe "Converting Inputs" do
		it "converts zawgyi inputs correctly" do
			Post.new({title: data[:zawgyi_title],body: data[:unicode_body]})
			post.save!
			post.title.must_equal data[:unicode_title]
			post.body.must_equal data[:unicode_body]
		end
		it "converts unicode inputs correctly" do
			Post.new({title: data[:unicode_title],body: data[:unicode_body]})
			post.save!
			post.title.must_equal data[:unicode_title]
			post.body.must_equal data[:unicode_body]
		end
		it "converts mixed zawgyi and unicode inputs correctly" do
			Post.new({title: data[:mixed_title],body: data[:mixed_body]})
			post.save!
			post.title.must_equal data[:unicode_title]
			post.body.must_equal data[:unicode_body]
		end
	end

	
end