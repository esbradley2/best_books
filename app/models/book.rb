class Book < ActiveRecord::Base
  validates :title, :author, :num_pages, presence: true
  validates :num_pages, numericality: { only_integer: true }
  validate :author_must_be_high_quality

  # validates :author, format: { without: /stephanie meyer/, message: "Can't be Stephanie Meyer"}

  def author_must_be_high_quality
    if author == "stephanie meyer"
      errors.add(:author, "must be high quality")
    end

  end
end
