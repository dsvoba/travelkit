Product.destroy_all if Product.any?
products = [
  {
    name: "ElecTrek Products Roll-Up Organizer- Compact Water-resistant organizes and protects electronic accessories including adaptors, chargers, USB drives, cables and cords. ",
    description: "Get rid of your annoying jumble of accessories for your electronic devices (laptop, cellphone, ipad, tablet, mini-tablet, etc). Stop losing necessary and expensive items as you travel or work remotely. Instead, keep them accessible and organized in a single, convenient unit that will roll-up and fit into small spaces for easy access in your briefcase, backpack or carry-all.",
    price: 12.99,
    image: "https://images-na.ssl-images-amazon.com/images/I/7152FBJA6pL._SX679_.jpg"
  },
  {
    name: "Electronics Organizer, Jelly Comb Electronic Accessories Cable Organizer Bag Waterproof Travel Cable Storage Bag for Charging Cable, Cellphone, Mini Tablet (Up to 7.9'') ",
    description: "This lightweight Electronics Accessories Case helps you to carry your chargers and accessories anywhere when traveling. The extra hand strp allows you to hold the case with one hand easily.",
    price: 13.99,
    image: "https://images-na.ssl-images-amazon.com/images/I/7152FBJA6pL._SX679_.jpg"    
  },
  {
    name: "BAGSMART Portable Shockproof EVA Hard Drive Case Travel Electronic Organizer for Cables, Charger, USB, Black",
    description: "The BAGSMART hand carrying case is an excellent way to store or transport portable external hard drives. Additionally, it is ideal for your small electronics accessories like your power bank, portable chargers, cable, SD cards,USB flash drives or other devices.Just using the case wherever you sit down to work or go on a business trip, everything would be well-organized.",
    price: 19.99,
    image: "https://images-na.ssl-images-amazon.com/images/I/71mwAPGNzdL._SL1500_.jpg"
  },
  {
    name: "BOVKE Power Bank Carrying Case for RAVPower 16750mAh 13000mAh 13400mAh Portable External Charger Battery Power Bank EVA Shockproof Travel Storage Case Bag, Black",
    description: 'BOVKE Premium Hard EVA Case Protects and Stores the Portable Charger External Battery Power Bank and USB Cable Built-in Soft Mesh Pocket to hold USB Cable and Memory Card Soft Shock absorbent pad Protects your Portable Charger Bank against Scratch and damaged Hand Strap for keeping your devices safe and Convenience External dimension: 6.22" x 4.48" x 1.88" inch, Internal dimension: 5.35" x 3.5" x 1.18 inch.',
    price: 7.99,
    image: "https://images-na.ssl-images-amazon.com/images/I/71zAKj-7NgL._SL1000_.jpg"
  }
].each do |p|
  product = Product.new(p)
  if product.valid?
    product.save
  else
    puts "Prodcut error: #{product.errors.messages}"
    exit
  end
end
puts "Products seeded!"