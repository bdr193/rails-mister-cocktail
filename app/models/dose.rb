class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient }
  validates :ingredient, presence: true
  # validates :cocktail, uniqueness: { scope: :ingredient, case_sensitive: false, message: “You can’t repeat an ingredient for the same cocktail!” }

end
