require 'paperclip'

module Paperclip
  class Rmagick < Thumbnail
    def make
      src = @file
      dst = Tempfile.new([@basename, @format ? ".#{@format}" : ''])
      dst.binmode

      begin
        img = ::Magick::ImageList.new(File.expand_path(src.path)).first
        if filter = options[:rmagick_filter]
          if filter.is_a?(String) || filter.is_a?(Symbol)
            img = attachment.instance.send(filter, oldimg = img)
            oldimg.destroy! unless oldimg.equal? img
          else
            raise "PaperclipRMagick: Unsupported filter type - #{filter.inspect}"
          end
        end
        img.change_geometry!(@target_geometry.to_s) do |cols, rows, image|
          image.resize!(cols,rows)
        end
        img.write("#{@format ? "#{@format}:" : ''}#{File.expand_path(dst.path)}")
        img.destroy!
      rescue ::Magick::ImageMagickError
        raise PaperclipError, "There was an error processing the thumbnail for #{@basename}" if @whiny
      end
      dst
    end
  end
end
