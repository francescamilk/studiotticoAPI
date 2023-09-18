require 'csv'

def seed_csv(brand)
    CSV.foreach("db/catalogs/#{brand}_cat.csv", headers: :first_row) do |row|
        Glass.create!(
            sku: row['sku'].upcase,
            name: row['name'].capitalize,
            brand: row['brand'].capitalize,
            price: row['price'].to_f,
            color: row['color'].capitalize,
            frame: row['frame'].capitalize,
            material: row['material'].capitalize,
            measure: row['measure'],
            woman: row['woman'] == 'true',
            man: !(row['woman'] == 'true')
        ) 
    end
end

puts 'Clearing db...'
Glass.destroy_all

# # ARMANI
# puts 'Loading Armani catalog...'
# seed_csv("armani")

# # MIU MIU 
# puts 'Loading Miu Miu catalog...'
# seed_csv("miumiu")

# VOGUE
puts 'Loading Vogue catalog...'
seed_csv("vogue")

puts 'Loading images...'
Glass.all.each do |glass|
    glass.photos.attach(io: File.open("./app/assets/images/#{glass.brand.downcase}/#{glass.sku}_01.png"), filename: "#{glass.sku}_01.png", content_type: "image/png")
    glass.photos.attach(io: File.open("./app/assets/images/#{glass.brand.downcase}/#{glass.sku}_02.png"), filename: "#{glass.sku}_02.png", content_type: "image/png")
    glass.photos.attach(io: File.open("./app/assets/images/#{glass.brand.downcase}/#{glass.sku}_03.png"), filename: "#{glass.sku}_03.png", content_type: "image/png")
    glass.photos.attach(io: File.open("./app/assets/images/#{glass.brand.downcase}/#{glass.sku}_04.png"), filename: "#{glass.sku}_04.png", content_type: "image/png")
    glass.photos.attach(io: File.open("./app/assets/images/#{glass.brand.downcase}/#{glass.sku}_05.png"), filename: "#{glass.sku}_05.png", content_type: "image/png")
end

puts 'All done!'