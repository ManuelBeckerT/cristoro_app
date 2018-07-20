class Register < ApplicationRecord
  has_many :call

  validates :correo, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :comuna, :calle, :numero, :encargado, :telefono, :correo, :contenedores, :establecimiento, :presence => true
  validates :telefono, length: { minimum: 7 }
  validates :telefono, length: { maximum: 9 }

  validates_uniqueness_of :calle, scope: [:numero, :comuna], :case_sensitive => false

end
