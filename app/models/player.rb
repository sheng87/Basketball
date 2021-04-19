class Player < ApplicationRecord

  belongs_to :user
  validates :name, presence: true

  default_scope { where(deleted_at: nil) }
  scope :available, -> { where(deleted_at: nil) }

  # def self.available
  #   where(deleted_at: nil)
  # end

  def self.deleted
    unscope(:where).where(deleted_at: true)
  end

  def real_destroy!
    super.destroy
  end

  def destroy
    update(deleted_at: Time.now)
  end
end
