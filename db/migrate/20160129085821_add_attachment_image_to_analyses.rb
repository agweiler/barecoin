class AddAttachmentImageToAnalyses < ActiveRecord::Migration
  def self.up
    change_table :analyses do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :analyses, :image
  end
end
