require 'cgi'
require 'mime/types'
require 'kaminari'
module Rich
  class RichFile
    include Mongoid::Document
    include Mongoid::Timestamps

    scope :images, ->{ where(simplified_type: 'image')}
    scope :files, ->{ where(simplified_type: 'file')}

    paginates_per Rich.options[:paginates_per]
  end
end
