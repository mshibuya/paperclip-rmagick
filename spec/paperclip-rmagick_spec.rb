require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PaperclipRmagick" do
  before do
    @monster = Monster.new
    @monster.image = File.open("#{File.dirname(__FILE__)}/support/monster.png")
    @monster.save
  end

  describe 'thumb' do
    subject{ @monster.image.queued_for_write[:thumb] }
    it "should be generated" do
      should_not be_nil
    end
  end

  describe 'vertical' do
    subject{ @monster.image.queued_for_write[:vertical] }
    it "should be generated" do
      should_not be_nil
    end
  end

  describe 'frame' do
    subject{ @monster.image.queued_for_write[:frame] }
    it "should be generated" do
      should_not be_nil
      system("open #{subject.path}")
    end
  end
end
