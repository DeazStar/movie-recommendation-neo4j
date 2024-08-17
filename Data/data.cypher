// Create People nodes
CREATE (p1:Person {name: "Alice"})
CREATE (p2:Person {name: "Bob"})
CREATE (p3:Person {name: "Charlie"})
CREATE (p4:Person {name: "David"})
CREATE (p5:Person {name: "Eve"})
CREATE (p6:Person {name: "Frank"})
CREATE (p7:Person {name: "Grace"})
CREATE (p8:Person {name: "Heidi"})
CREATE (p9:Person {name: "Ivan"})
CREATE (p10:Person {name: "Judy"});

// Create Movies with a rating property
CREATE (m1:Movie {title: "The Matrix", genre: "Sci-Fi", rating: 4.8})
CREATE (m2:Movie {title: "Inception", genre: "Sci-Fi", rating: 4.7})
CREATE (m3:Movie {title: "Titanic", genre: "Romance", rating: 4.1})
CREATE (m4:Movie {title: "The Godfather", genre: "Crime", rating: 4.9})
CREATE (m5:Movie {title: "The Dark Knight", genre: "Action", rating: 4.6})
CREATE (m6:Movie {title: "Pulp Fiction", genre: "Crime", rating: 4.3})
CREATE (m7:Movie {title: "The Shawshank Redemption", genre: "Drama", rating: 4.9})
CREATE (m8:Movie {title: "Forrest Gump", genre: "Drama", rating: 4.5})
CREATE (m9:Movie {title: "The Lion King", genre: "Animation", rating: 4.4})
CREATE (m10:Movie {title: "Toy Story", genre: "Animation", rating: 4.2})
CREATE (m11:Movie {title: "Finding Nemo", genre: "Animation", rating: 4.3})
CREATE (m12:Movie {title: "The Lord of the Rings", genre: "Fantasy", rating: 4.8})
CREATE (m13:Movie {title: "Star Wars", genre: "Sci-Fi", rating: 4.7})
CREATE (m14:Movie {title: "Jurassic Park", genre: "Sci-Fi", rating: 4.1})
CREATE (m15:Movie {title: "Harry Potter", genre: "Fantasy", rating: 4.5})
CREATE (m16:Movie {title: "The Avengers", genre: "Action", rating: 4.6})
CREATE (m17:Movie {title: "Gladiator", genre: "Action", rating: 4.2})
CREATE (m18:Movie {title: "Braveheart", genre: "Drama", rating: 4.3})
CREATE (m19:Movie {title: "Schindler's List", genre: "Drama", rating: 4.9})
CREATE (m20:Movie {title: "La La Land", genre: "Musical", rating: 4.0})
CREATE (m21:Movie {title: "The Notebook", genre: "Romance", rating: 3.9})
CREATE (m22:Movie {title: "Casablanca", genre: "Romance", rating: 4.6})
CREATE (m23:Movie {title: "Die Hard", genre: "Action", rating: 4.1})
CREATE (m24:Movie {title: "Mad Max: Fury Road", genre: "Action", rating: 4.4})
CREATE (m25:Movie {title: "Interstellar", genre: "Sci-Fi", rating: 4.7});

// Match people to movies and create WATCHED relationships
MATCH (p1:Person {name: "Alice"}), (m1:Movie {title: "The Matrix"})
CREATE (p1)-[:WATCHED]->(m1);

MATCH (p1:Person {name: "Alice"}), (m5:Movie {title: "The Dark Knight"})
CREATE (p1)-[:WATCHED]->(m5);

MATCH (p1:Person {name: "Alice"}), (m9:Movie {title: "The Lion King"})
CREATE (p1)-[:WATCHED]->(m9);

MATCH (p1:Person {name: "Alice"}), (m14:Movie {title: "Jurassic Park"})
CREATE (p1)-[:WATCHED]->(m14);

MATCH (p1:Person {name: "Alice"}), (m18:Movie {title: "Braveheart"})
CREATE (p1)-[:WATCHED]->(m18);

MATCH (p2:Person {name: "Bob"}), (m2:Movie {title: "Inception"})
CREATE (p2)-[:WATCHED]->(m2);

MATCH (p2:Person {name: "Bob"}), (m6:Movie {title: "Pulp Fiction"})
CREATE (p2)-[:WATCHED]->(m6);

MATCH (p2:Person {name: "Bob"}), (m11:Movie {title: "Finding Nemo"})
CREATE (p2)-[:WATCHED]->(m11);

MATCH (p2:Person {name: "Bob"}), (m15:Movie {title: "Harry Potter"})
CREATE (p2)-[:WATCHED]->(m15);

MATCH (p2:Person {name: "Bob"}), (m19:Movie {title: "Schindler's List"})
CREATE (p2)-[:WATCHED]->(m19);

MATCH (p3:Person {name: "Charlie"}), (m3:Movie {title: "Titanic"})
CREATE (p3)-[:WATCHED]->(m3);

MATCH (p3:Person {name: "Charlie"}), (m7:Movie {title: "The Shawshank Redemption"})
CREATE (p3)-[:WATCHED]->(m7);

MATCH (p3:Person {name: "Charlie"}), (m12:Movie {title: "The Lord of the Rings"})
CREATE (p3)-[:WATCHED]->(m12);

MATCH (p3:Person {name: "Charlie"}), (m16:Movie {title: "The Avengers"})
CREATE (p3)-[:WATCHED]->(m16);

MATCH (p3:Person {name: "Charlie"}), (m20:Movie {title: "La La Land"})
CREATE (p3)-[:WATCHED]->(m20);

MATCH (p4:Person {name: "David"}), (m4:Movie {title: "The Godfather"})
CREATE (p4)-[:WATCHED]->(m4);

MATCH (p4:Person {name: "David"}), (m8:Movie {title: "Forrest Gump"})
CREATE (p4)-[:WATCHED]->(m8);

MATCH (p4:Person {name: "David"}), (m13:Movie {title: "Star Wars"})
CREATE (p4)-[:WATCHED]->(m13);

MATCH (p4:Person {name: "David"}), (m17:Movie {title: "Gladiator"})
CREATE (p4)-[:WATCHED]->(m17);

MATCH (p4:Person {name: "David"}), (m21:Movie {title: "The Notebook"})
CREATE (p4)-[:WATCHED]->(m21);

MATCH (p5:Person {name: "Eve"}), (m10:Movie {title: "Toy Story"})
CREATE (p5)-[:WATCHED]->(m10);

MATCH (p5:Person {name: "Eve"}), (m5:Movie {title: "The Dark Knight"})
CREATE (p5)-[:WATCHED]->(m5);

MATCH (p5:Person {name: "Eve"}), (m22:Movie {title: "Casablanca"})
CREATE (p5)-[:WATCHED]->(m22);

MATCH (p5:Person {name: "Eve"}), (m3:Movie {title: "Titanic"})
CREATE (p5)-[:WATCHED]->(m3);

MATCH (p5:Person {name: "Eve"}), (m24:Movie {title: "Mad Max: Fury Road"})
CREATE (p5)-[:WATCHED]->(m24);

MATCH (p6:Person {name: "Frank"}), (m23:Movie {title: "Die Hard"})
CREATE (p6)-[:WATCHED]->(m23);

MATCH (p6:Person {name: "Frank"}), (m9:Movie {title: "The Lion King"})
CREATE (p6)-[:WATCHED]->(m9);

MATCH (p6:Person {name: "Frank"}), (m6:Movie {title: "Pulp Fiction"})
CREATE (p6)-[:WATCHED]->(m6);

MATCH (p6:Person {name: "Frank"}), (m15:Movie {title: "Harry Potter"})
CREATE (p6)-[:WATCHED]->(m15);

MATCH (p6:Person {name: "Frank"}), (m1:Movie {title: "The Matrix"})
CREATE (p6)-[:WATCHED]->(m1);

MATCH (p7:Person {name: "Grace"}), (m25:Movie {title: "Interstellar"})
CREATE (p7)-[:WATCHED]->(m25);

MATCH (p7:Person {name: "Grace"}), (m18:Movie {title: "Braveheart"})
CREATE (p7)-[:WATCHED]->(m18);

MATCH (p7:Person {name: "Grace"}), (m7:Movie {title: "The Shawshank Redemption"})
CREATE (p7)-[:WATCHED]->(m7);

MATCH (p7:Person {name: "Grace"}), (m14:Movie {title: "Jurassic Park"})
CREATE (p7)-[:WATCHED]->(m14);

MATCH (p7:Person {name: "Grace"}), (m19:Movie {title: "Schindler's List"})
CREATE (p7)-[:WATCHED]->(m19);

MATCH (p8:Person {name: "Heidi"}), (m12:Movie {title: "The Lord of the Rings"})
CREATE (p8)-[:WATCHED]->(m12);

MATCH (p8:Person {name: "Heidi"}), (m4:Movie {title: "The Godfather"})
CREATE (p8)-[:WATCHED]->(m4);

MATCH (p8:Person {name: "Heidi"}), (m8:Movie {title: "Forrest Gump"})
CREATE (p8)-[:WATCHED]->(m8);

MATCH (p8:Person {name: "Heidi"}), (m20:Movie {title: "La La Land"})
CREATE (p8)-[:WATCHED]->(m20);

MATCH (p8:Person {name: "Heidi"}), (m21:Movie {title: "The Notebook"})
CREATE (p8)-[:WATCHED]->(m21);

MATCH (p9:Person {name: "Ivan"}), (m24:Movie {title: "Mad Max: Fury Road"})
CREATE (p9)-[:WATCHED]->(m24);

MATCH (p9:Person {name: "Ivan"}), (m16:Movie {title: "The Avengers"})
CREATE (p9)-[:WATCHED]->(m16);

MATCH (p9:Person {name: "Ivan"}), (m22:Movie {title: "Casablanca"})
CREATE (p9)-[:WATCHED]->(m22);

MATCH (p9:Person {name: "Ivan"}), (m11:Movie {title: "Finding Nemo"})
CREATE (p9)-[:WATCHED]->(m11);

MATCH (p9:Person {name: "Ivan"}), (m17:Movie {title: "Gladiator"})
CREATE (p9)-[:WATCHED]->(m17);

MATCH (p10:Person {name: "Judy"}), (m13:Movie {title: "Star Wars"})
CREATE (p10)-[:WATCHED]->(m13);

MATCH (p10:Person {name: "Judy"}), (m2:Movie {title: "Inception"})
CREATE (p10)-[:WATCHED]->(m2);

MATCH (p10:Person {name: "Judy"}), (m10:Movie {title: "Toy Story"})
CREATE (p10)-[:WATCHED]->(m10);

MATCH (p10:Person {name: "Judy"}), (m25:Movie {title: "Interstellar"})
CREATE (p10)-[:WATCHED]->(m25);

MATCH (p10:Person {name: "Judy"}), (m3:Movie {title: "Titanic"})
CREATE (p10)-[:WATCHED]->(m3);

