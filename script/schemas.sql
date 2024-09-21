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
    libelle varchar(255),
    estProductif boolean
);

CREATE TABLE Charge_centre (
    id serial PRIMARY KEY,
    id_rubique int REFERENCES Rubrique(id),
    id_centre int REFERENCES Centre(id),
    pourcentage decimal CHECK (pourcentage >= 0 AND pourcentage <= 1)
);

CREATE TABLE Product (
    id serial primary key,
    libelle varchar(255)
);

CREATE OR REPLACE VIEW v_cout_total_par_centre AS
SELECT 
    c.id AS centre_id,
    c.libelle AS centre_libelle,
    COALESCE(SUM(CASE WHEN n.libelle = 'F' THEN ch.prix_total END), 0) AS total_charges_fixes,
    COALESCE(SUM(CASE WHEN n.libelle = 'V' THEN ch.prix_total END), 0) AS total_charges_variables,
    COALESCE(SUM(ch.prix_total), 0) AS cout_total
FROM 
    Centre c
LEFT JOIN 
    Charge_centre cc ON c.id = cc.id_centre
LEFT JOIN 
    Rubrique r ON cc.id_rubique = r.id
LEFT JOIN 
    Charge ch ON r.id = ch.id_rubique
LEFT JOIN 
    Nature n ON r.id_nature = n.id
GROUP BY 
    c.id, c.libelle;


CREATE OR REPLACE VIEW v_cout_total_direct AS
SELECT 
    SUM(v.cout_total) AS cout_total_direct
FROM 
    v_cout_total_par_centre v
JOIN 
    Centre c ON v.centre_id = c.id
WHERE 
    c.estProductif = true;


CREATE OR REPLACE VIEW v_cout_total_general AS -- ty cout total general raha atambatra daoly ny repartition anle centre non productif  
SELECT 
    SUM(v.cout_total) AS cout_total_direct
FROM 
    v_cout_total_par_centre v


CREATE OR REPLACE FUNCTION get_total_general(id_centre_nonProductif INT) -- ty cout total raha selectionner-na le centre non productif anaovana  repartition 
RETURNS DECIMAL AS $$
DECLARE
    total_productive DECIMAL;
    total_non_productive DECIMAL;
BEGIN
    SELECT 
        SUM(v.cout_total) INTO total_productive
    FROM 
        v_cout_total_par_centre v
    JOIN 
        Centre c ON v.centre_id = c.id
    WHERE 
        c.estProductif = true;

    SELECT SUM(cout_total) INTO total_non_productive
    FROM v_cout_total_par_centre
    WHERE centre_id = id_centre_nonProductif;

    RETURN COALESCE(total_productive, 0) + COALESCE(total_non_productive, 0);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE VIEW v_unitaire_rubrique AS
SELECT 
    r.libelle AS rubrique,
    ch.prix_total / NULLIF(ch.quantite_total, 0) AS prix_unitaire,
    ch.prix_total,
    ch.quantite_total
FROM 
    Charge ch
JOIN 
    Rubrique r ON ch.id_rubique = r.id
WHERE 
    ch.quantite_total IS NOT NULL
ORDER BY 
    r.libelle;
