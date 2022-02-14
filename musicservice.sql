create table if not exists singer (
	id serial primary key, 
	name_singer varchar(40) unique not null,
	genre varchar(40) unique not null
);

create table if not exists genre (
	id serial primary key,
	title_genre varchar (60) not null 
)

create table if not exists album (
	id serial primary key,
	title_album text not null,
	year_of_issue integer
)

create table if not exists collection (
	id serial primary key,
	title_collection text not null,
	year_of_issue integer
)

create table if not exists tracks (
	id serial primary key,
	title_track text not null,
	duration_track integer,
	id_album integer references album(id)
)

create table if not exists SingerAlbum (
	singer_id integer references singer(id),
	album_id integer references album(id),
	constraint pk primary key (singer_id, album_id)
)

create table if not exists SingerGenre (
	singer_id integer references singer(id),
	genre_id integer references genre(id),
	constraint spk primary key (singer_id, genre_id)
)

create table if not exists Digest_album (
	collection_id integer references collection(id),
	track_id integer references tracks(id),
	constraint tpk primary key (collection_id, track_id)
)