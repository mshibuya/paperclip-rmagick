# coding: utf-8

class Tableless < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  def self.columns_hash
    @columns_hash ||= Hash[columns.map { |column| [column.name, column] }]
  end

  def self.column_names
    @column_names ||= columns.map { |column| column.name }
  end

  def self.column_defaults
    @column_defaults ||= columns.map { |column| [column.name, nil] }.inject({}) { |m, e| m[e[0]] = e[1]; m }
  end

  def self.primary_key
    :id
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    if validate && !valid?
      false
    else
      self.id = 1
      true
    end
  end
end

class Monster < Tableless
  column :name, :string
  column :image_file_name, :string

  has_attached_file :image, :styles => {
    :thumb => ["80x80>"],
    :vertical => ["40x80!"],
    :frame => { :geometry => "80x80>", :filter_method => :frame_filter }
  }, :processors => [:rmagick]

  def frame_filter(img)
    base = Magick::ImageList.new(File.open("#{File.dirname(__FILE__)}/base.png")).first
    base = base.composite!(img, 6, 6, Magick::SrcOverCompositeOp)
    img.destroy!
    frame = Magick::ImageList.new(File.open("#{File.dirname(__FILE__)}/frame.png")).first
    base.composite!(frame, 0, 0, Magick::SrcOverCompositeOp)
    frame.destroy!
    base
  end
end
