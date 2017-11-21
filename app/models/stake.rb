class Stake < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :season
  mount_uploader :invoice, AttachmentUploader

  scope :paid, ->() { where(paid: true)}
end
