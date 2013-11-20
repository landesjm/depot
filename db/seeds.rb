# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(title: 'ScubaPro MK25',
                description:
                    %{<p>
                      This apparatus is what allows you to breath air underwater
                      </p>},
                image_url: 'http://www.scubapro.com/media/55537/mk25-a700-din.jpg',
                price: 750.00)

Product.create!(title: 'ScubaPro BCD',
                description:
                    %{<p>
                      Helps maintain your bouyancy
                      </p>},
                image_url: 'http://www.scubapro.com/media/66612/seahawk-black.jpg',
                price: 650.00)
