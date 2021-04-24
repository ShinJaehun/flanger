class Instrument < ApplicationRecord
  has_one_attached :image
  #serialize :image, JSON #이건 carrierwave에만 적용되는건가?

  belongs_to :user, optional: true

  validates :title, :brand, :price, :model, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }

  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS  Ibanez Charvel Washburn }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  def thumb
    return self.image.variant(resize: '400x300')
  end

  def default
    return self.image.variant(resize: '800x600')
  end
end
