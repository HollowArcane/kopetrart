INSERT INTO Unite (libelle) VALUES
('KG'),
('NB'),
('Cons periodique'),
('LITRES'),
('Loyer mensuel'),
('KW'),
('Heures de travail (HT)'),
('Sal mens ou HT');


INSERT INTO Nature (libelle) VALUES
('V'),
('F');


INSERT INTO Rubrique (libelle, id_unite, id_nature) VALUES
('ACHAT SEMENCES', (SELECT id FROM Unite WHERE libelle = 'KG'), (SELECT id FROM Nature WHERE libelle = 'V')),
('ACHAT ENGRAIS&ASSIMILES', (SELECT id FROM Unite WHERE libelle = 'KG'), (SELECT id FROM Nature WHERE libelle = 'V')),
('ACHAT EMBALLAGE', (SELECT id FROM Unite WHERE libelle = 'NB'), NULL),
('FOURNIT DE MAGASIN', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('FOURNIT BUR', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('PIEC RECH VEHICULES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('EAU ET ELECTRICITE', (SELECT id FROM Unite WHERE libelle = 'KW'), (SELECT id FROM Nature WHERE libelle = 'V')),
('GAZ,COMBUST,CARBURANT,LUBRIF', (SELECT id FROM Unite WHERE libelle = 'LITRES'), (SELECT id FROM Nature WHERE libelle = 'V')),
('LOCATION TERRAINS', (SELECT id FROM Unite WHERE libelle = 'Loyer mensuel'), (SELECT id FROM Nature WHERE libelle = 'F')),
('ENTRETIENS ET REPARATIONS', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('ASSURANCES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('PHOTOCOPIES ET ASSIMILES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('TELEPHONE', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('ENVOI COLIS(LETTRE&DOC...)', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('HONORAIRES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('FRAIS DE TRANSPORT', (SELECT id FROM Unite WHERE libelle = 'KG'), (SELECT id FROM Nature WHERE libelle = 'V')),
('VOYAGES ET DEPLACEMENT', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('MISSION(DEPL+HEBERGT+REST°)', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('COMMISIONS BANQUES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('AUTRES CHARGES EXTERNE', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V')),
('CUEILLEURS', (SELECT id FROM Unite WHERE libelle = 'KG'), (SELECT id FROM Nature WHERE libelle = 'V')),
('IMPOTS ET TAXES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('SALAIRES M.O.TEMPORAIRES', (SELECT id FROM Unite WHERE libelle = 'Heures de travail (HT)'), (SELECT id FROM Nature WHERE libelle = 'V')),
('SALAIRES PERMANENTS', (SELECT id FROM Unite WHERE libelle = 'Sal mens ou HT'), (SELECT id FROM Nature WHERE libelle = 'F')),
('CNAPS:COTISATION PATRONALE', (SELECT id FROM Unite WHERE libelle = 'Sal mens ou HT'), (SELECT id FROM Nature WHERE libelle = 'F')),
('ORGANISME SANITAIRE : COTISATION PATRONALE', (SELECT id FROM Unite WHERE libelle = 'Sal mens ou HT'), (SELECT id FROM Nature WHERE libelle = 'F')),
('AUTRES CHARGES DU PERSONNEL', (SELECT id FROM Unite WHERE libelle = 'Sal mens ou HT'), (SELECT id FROM Nature WHERE libelle = 'V')),
('AMORTISSEMENTS', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'F')),
('CHARGES FINANCIERES', (SELECT id FROM Unite WHERE libelle = 'Cons periodique'), (SELECT id FROM Nature WHERE libelle = 'V'));


INSERT INTO Charge (id_rubique, prix_total, quantite_total, date) VALUES
((SELECT id FROM Rubrique WHERE libelle = 'ACHAT SEMENCES'), 4321600, 10, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'ACHAT ENGRAIS&ASSIMILES'), 60000000, 11, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'ACHAT EMBALLAGE'), 7796400, 122, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'FOURNIT DE MAGASIN'), 4446700, 13, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'FOURNIT BUR'), 2783700, 12, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'PIEC RECH VEHICULES'), 14373200, 1, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'EAU ET ELECTRICITE'), 34637200, 2, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'GAZ,COMBUST,CARBURANT,LUBRIF'), 35675400, 3, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'LOCATION TERRAINS'), 9742000, 4, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'ENTRETIENS ET REPARATIONS'), 4987300, 5, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'ASSURANCES'), 5927200, 6, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'PHOTOCOPIES ET ASSIMILES'), 450900, 7, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'TELEPHONE'), 8236300, 8, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'ENVOI COLIS(LETTRE&DOC...)'), 789500, 9, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'HONORAIRES'), 8538100, 10, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'FRAIS DE TRANSPORT'), 3200000, 11, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'VOYAGES ET DEPLACEMENT'), 1934000, 123, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'MISSION(DEPL+HEBERGT+REST°)'), 16222500, 13, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'COMMISIONS BANQUES'), 31523800, 14, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'AUTRES CHARGES EXTERNE'), 3142800, 14, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'CUEILLEURS'), 31784800, 15, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'IMPOTS ET TAXES'), 5029800, 15, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'SALAIRES M.O.TEMPORAIRES'), 89267100, 16, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'SALAIRES PERMANENTS'), 71735100, 1, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'CNAPS:COTISATION PATRONALE'), 36320600, 2, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'ORGANISME SANITAIRE : COTISATION PATRONALE'), 654600, 3, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'AUTRES CHARGES DU PERSONNEL'), 15956700, 4, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'AMORTISSEMENTS'), 28639600, 5, CURRENT_DATE),
((SELECT id FROM Rubrique WHERE libelle = 'CHARGES FINANCIERES'), 23007600, 6, CURRENT_DATE);


INSERT INTO Centre (libelle, estProductif) VALUES
('Usine', true),
('Plantation', true),
('Autre', false);  -- You can adjust these names and productivity status as needed

INSERT INTO Charge_centre (id_rubique, id_centre, pourcentage) VALUES
((SELECT id FROM Rubrique WHERE libelle = 'ACHAT SEMENCES'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'ACHAT ENGRAIS&ASSIMILES'), 1, 1.0),
((SELECT id FROM Rubrique WHERE libelle = 'FOURNIT DE MAGASIN'), 1, 0.95),
((SELECT id FROM Rubrique WHERE libelle = 'FOURNIT BUR'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'PIEC RECH VEHICULES'), 1, 0.30),
((SELECT id FROM Rubrique WHERE libelle = 'EAU ET ELECTRICITE'), 1, 0.15),
((SELECT id FROM Rubrique WHERE libelle = 'GAZ,COMBUST,CARBURANT,LUBRIF'), 1, 0.10),
((SELECT id FROM Rubrique WHERE libelle = 'LOCATION TERRAINS'), 1, 0.10),
((SELECT id FROM Rubrique WHERE libelle = 'ENTRETIENS ET REPARATIONS'), 1, 0.15),
((SELECT id FROM Rubrique WHERE libelle = 'ASSURANCES'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'PHOTOCOPIES ET ASSIMILES'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'TELEPHONE'), 1, 0.60),
((SELECT id FROM Rubrique WHERE libelle = 'ENVOI COLIS(LETTRE&DOC...)'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'HONORAIRES'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'FRAIS DE TRANSPORT'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'VOYAGES ET DEPLACEMENT'), 1, 0.40),
((SELECT id FROM Rubrique WHERE libelle = 'MISSION(DEPL+HEBERGT+REST°)'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'COMMISIONS BANQUES'), 1, 0.40),
((SELECT id FROM Rubrique WHERE libelle = 'AUTRES CHARGES EXTERNE'), 1, 0.40),
((SELECT id FROM Rubrique WHERE libelle = 'CUEILLEURS'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'IMPOTS ET TAXES'), 1, 0.35),
((SELECT id FROM Rubrique WHERE libelle = 'SALAIRES M.O.TEMPORAIRES'), 1, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'SALAIRES PERMANENTS'), 2, 0.20),
((SELECT id FROM Rubrique WHERE libelle = 'CNAPS:COTISATION PATRONALE'), 2, 0.20),
((SELECT id FROM Rubrique WHERE libelle = 'ORGANISME SANITAIRE : COTISATION PATRONALE'), 2, 1.0), 
((SELECT id FROM Rubrique WHERE libelle = 'AUTRES CHARGES DU PERSONNEL'), 2, 0.40),
((SELECT id FROM Rubrique WHERE libelle = 'AMORTISSEMENTS'), 2, 0.25),
((SELECT id FROM Rubrique WHERE libelle = 'CHARGES FINANCIERES'), 2, 1.0); 
