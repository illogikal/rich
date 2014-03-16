require 'cgi'
require 'mime/types'
require 'kaminari'
require 'mongoid'
module Rich
  class RichFile

    scope :images, ->{ where(simplified_type: 'image')}
    scope :files, ->{ where(simplified_type: 'file')}

    paginates_per Rich.options[:paginates_per]
  end
end
