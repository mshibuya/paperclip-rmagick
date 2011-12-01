require 'paperclip'

module Paperclip
  class Rmagick < Thumbnail
    def make
      src = @file
      dst = Tempfile.new([@basename, @format ? ".#{@format}" : ''])
      dst.binmode

      begin
        img = ::Magick::ImageList.new(File.expand_path(src.path)).first
        if options[:filter_method]
          img = attachment.instance.send(options[:filter_method], img)
        end
        img.send(*parse_geometry)
        img.write("#{@format ? "#{@format}:" : ''}#{File.expand_path(dst.path)}")
        img.destroy!
      rescue NameError
        raise "RMagick is not loaded. Please add following line to your Gemfile.\ngem 'rmagick', :require => 'RMagick'"
      rescue ::Magick::ImageMagickError
        raise PaperclipError, "There was an error processing the thumbnail for #{@basename}" if @whiny
      end
      dst
    end

  private

    def parse_geometry
      geometry = @target_geometry
      method = if geometry && geometry.to_s.match(/[^\d]$/)
        case geometry.to_s[-1,1]
        when '!'
          :resize!
        when '>'
          :resize_to_fit!
        when '^'
          :resize_to_fill!
        end
      else
        :resize_to_fit!
      end
      [method, geometry.width.to_i, geometry.height.to_i]
    end
  end
end
