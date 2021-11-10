# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

    urls = [
    'https://www.google.com/imgres?imgurl=https%3A%2F%2Fres.cloudinary.com%2Fjerrick%2Fimage%2Fupload%2Ff_jpg%2Cfl_progressive%2Cq_auto%2Cw_1024%2Fy3mdgvccfyvmemabidd0.jpg&imgrefurl=https%3A%2F%2Fvocal.media%2Fgeeks%2Fthe-funniest-star-wars-parodies-spoofs-and-sketches&tbnid=PxVZGOV_iZQL5M&vet=12ahUKEwiT1vDg4Y70AhWVqnIEHc3hAnUQMygAegUIARC1AQ..i&docid=TOFSYS-33UHtdM&w=1024&h=683&itg=1&q=star%20wars%20funny&ved=2ahUKEwiT1vDg4Y70AhWVqnIEHc3hAnUQMygAegUIARC1AQ',
    'https://media-cldnry.s-nbcnews.com/image/upload/streams/2013/October/131016/8C9394934-tdy-kardashian-ring-131016-new.jpg'
    ]

    User.destroy_all
    users = User.create([
        {username: 'Josh'},
        {username: 'Caleb'},
        {username: 'Alvin'}
    ])

    Artwork.destroy_all
    artworks = Artwork.create!([
        { title: 'Star Wars', image_url: urls.first, artist_id: users.first.id}, 
        { title: 'Lord of the Rings', image_url: urls.last, artist_id: users.second.id}
    ])

    ArtworkShare.destroy_all
    artwork_shares = ArtworkShare.create!([
        {artwork_id: artworks.first.id, viewer_id: users.third.id},
        {artwork_id: artworks.second.id, viewer_id: users.third.id}
    ])

end