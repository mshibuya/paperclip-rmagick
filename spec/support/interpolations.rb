Paperclip::Interpolations.module_eval do
  # Returns the Rails.root constant.
  def rails_root attachment, style_name
    File.expand_path('../../', File.dirname(__FILE__))
  end

  # Returns the Rails.env constant.
  def rails_env attachment, style_name
    ENV['RAILS_ENV'] || 'test'
  end
end
