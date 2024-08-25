#Musik_play app

Inicializamos con 2 scaffold uno para canciones con su titulo
y el otro scaffold de la playlist con el nombre de la playlist

verificamos que las tablas esten bien y migramos la base de datos con

rails db:migrate

Agregaremos la llave foranea que seria song a playlist con el siguiente comando

rails g migration AddPlaylistToSongs playlist:references

luego migramos nuevamente

rails db:migrate

relacionando los modelos

en el modelo de playlist

class Playlist < ApplicationRecord
  has_many :songs
end

en el modelo de song

class Song < ApplicationRecord
  belongs_to :playlist
end


establecemos una ruta

root "playlists#index"

modificamos el formulario para asociar una cancion
a una playlist

en el controlador de song le asignamos todas las playlist
para elegir una

 def new
    @song = Song.new
    @playlist = Playlist.all
  end

  agreggar a los params el playlist_id
   def song_params
      params.require(:song).permit(:title, :playlist_id)
    end

    queremos mostrar la playlist y poder agregarle canciones
    primero en la vista de show de playlist lo iteramos


<h4> Canciones </h4>

<ul>
  <% @playlist.songs.each do |song| %>
    <li> <%= song.title %> </li>
  <% end %>
</ul>

agregamos un link para editar la cancion 

<%= link_to "agregar cancion" %>

crearemos una ruta anidada para acceder desde el show, se accedera primero a la 
playlist luego a la cancion al formulario de creacion de la cancion, o sea dentro 
de la playlist se tendra el formulario de la cancion 

el comando git status | grep es una atajo para buscar archivos en la terminal
 como en la imagen 

 ![captura ](/app/assets/images/captures/Captura%20de%20pantalla%202024-08-25%20a%20la(s)%2019.10.36.png)