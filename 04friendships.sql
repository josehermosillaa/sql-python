SELECT
  amigos;
#amigos  todos los usuarios que son amigos de kermit
SELECT
  CONCAT(users.first_name, " ", users.last_name) as users_name,
  CONCAT(user2.first_name, " ", user2.last_name) as friends_name
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id;
#01 todos los usuarios que son amigos de kermit
SELECT
  CONCAT(users.first_name, " ", users.last_name) as kermit_friends
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id
WHERE
  user2.first_name = "Kermit";
#02 Devuelve el recuento de todas las amistades.
SELECT
  CONCAT(users.first_name, " ", users.last_name) as users_name,
  CONCAT(user2.first_name, " ", user2.last_name) as friends_name
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id;
  
#03 descubre quien tiene mas amigos y devuelve un recuento de sus amigos
SELECT
  CONCAT(users.first_name, " ", users.last_name) as users_name,
  COUNT(CONCAT(user2.first_name, " ", user2.last_name)) as friend_count
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id GROUP BY users_name;

#amigos de amy gilver
SELECT
  CONCAT(user2.first_name, " ", user2.last_name) as Amy_friends
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id
WHERE
  users.first_name = "Amy";

#04 Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.

INSERT INTO users (first_name, last_name, created_at) values('jose', 'hermosilla', NOW());

#lo hacemos amigo
INSERT INTO friendships (user_id, friend_id, created_at) values ( 6, 2, NOW());
INSERT INTO friendships (user_id, friend_id, created_at) values ( 6, 4, NOW());
INSERT INTO friendships (user_id, friend_id, created_at) values ( 6, 5, NOW());
#05Devuelve a los amigos de Eli en orden alfabético.

SELECT
  CONCAT(user2.first_name, " ", user2.last_name) as Amy_friends
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id
WHERE
  users.first_name = "Eli" ;

#06 Eliminar a Marky Mark de los amigos de Eli.

DELETE FROM friendships WHERE id = 5;

#07Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
SELECT
  CONCAT(users.first_name, " ", users.last_name) as users_name,
  CONCAT(user2.first_name, " ", user2.last_name) as friends_name
FROM
  users
  LEFT JOIN friendships ON users.id = friendships.user_id
  LEFT JOIN users as user2 ON friendships.friend_id = user2.id;