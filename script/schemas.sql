create table Unite(
    id serial primary key,
    libelle varchar(255)
);

create table Nature(
    id serial primary key,
    libelle varchar(255)
); 

create table Corporabilite(
    id serial primary key,
    libelle varchar(255)
);

create table Rubrique(
    id serial primary key,
    libelle varchar(255),
    id_unite int references Unite(id),
    id_nature int references Nature(id),
    id_corporabilite int references Corporabilite(id)  
);

create table Charge(
    id serial primary key,
    id_rubique  int references Rubrique(id),
    prix_total decimal, 
    quantite_total decimal,
    date date
);

create table Centre (
    id serial primary key,
    libelle varchar(255)
);

CREATE TABLE Charge_centre (
    id serial PRIMARY KEY,
    id_rubique int REFERENCES Rubrique(id),
    id_centre int REFERENCES Centre(id),
    pourcentage decimal CHECK (pourcentage >= 0 AND pourcentage <= 1)
);
