class Register < ApplicationRecord
  has_many :call

  validates :correo, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :comuna, :calle, :numero, :encargado, :telefono, :correo, :contenedores, :establecimiento, :presence => true
  validates :telefono, length: { minimum: 8 }
end
