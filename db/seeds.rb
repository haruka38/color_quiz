# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Color.create!(
  name: "浅葱色",
  hex: "#00A3AF",
  choices: [ "浅葱色", "麻ネギ色", "下仁田ネギ色", "青緑色" ]
)

Color.create!(
  name: "茜色",
  hex: "#B7282E",
  choices: [ "茜色", "赤丹色", "桜色", "紅色" ]
)

Color.create!(
  name: "琥珀色",
  hex: "#CA7A2C",
  choices: [ "琥珀色", "黄金色", "茶褐色", "山吹色" ]
)
