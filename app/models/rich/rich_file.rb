require 'cgi'
require 'mime/types'
require 'kaminari'
module Rich
  class RichFile
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Paperclip if Object.const_defined?(:Paperclip)

    field :owner_type, type: String
    field :owner_id, type: String
    field :uri_cache, type: String
    field :simplified_type, type: String
    field :rich_file_file_name, type: String
    field :rich_file_content_type, type: String
    field :rich_file_file_size, type: String
    field :rich_file_updated_at, type: DateTime

    scope :images, ->{ where(simplified_type: 'image')}
    scope :files, ->{ where(simplified_type: 'file')}

    paginates_per Rich.options[:paginates_per]
  end
end
