require 'cgi'
require 'mime/types'
require 'kaminari'
module Rich
  class RichFile
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Paperclip if Object.const_defined?(:Paperclip)

    field :owner_type
    field :owner_id
    field :uri_cache
    field :simplified_type

    scope :images, ->{ where(simplified_type: 'image')}
    scope :files, ->{ where(simplified_type: 'file')}

    paginates_per Rich.options[:paginates_per]
  end
end
