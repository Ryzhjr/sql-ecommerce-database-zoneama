USE ecommerce;

-- Insertion de 10 fournisseurs différents
-- !! Ne pas mettre d'email en doublon, contraintes qui l'empeche
INSERT INTO Fournisseur (nom, email) VALUES
('Fournisseur A', 'contact@fournisseurA.com'),
('Fournisseur B', 'contact@fournisseurB.com'),
('Fournisseur C', 'contact@fournisseurC.com'),
('Fournisseur D', 'contact@fournisseurD.com'),
('Fournisseur E', 'contact@fournisseurE.com'),
('Fournisseur F', 'contact@fournisseurF.com');

-- Insertion de produits (10 fabriqué et 10 approvisionné)
INSERT INTO Produit (nom, type) VALUES
-- Produits Fabriqués
('Chaise en bois', 'fabrique'),
('Table en verre', 'fabrique'),
('Armoire', 'fabrique'),
('Étagère', 'fabrique'),
('Lit en métal', 'fabrique'),
('Bureau en bois', 'fabrique'),
('Canapé', 'fabrique'),
('Bibliothèque', 'fabrique'),
('Commode', 'fabrique'),
('Table basse', 'fabrique'),
('Meuble TV', 'fabrique'),
('Porte en bois', 'fabrique'),
-- Produits Approvisionnés
('Vis en acier', 'approvisionne'),
('Panneaux MDF', 'approvisionne'),
('Peinture blanche', 'approvisionne'),
('Verre trempé', 'approvisionne'),
('Clous galvanisés', 'approvisionne'),
('Colle à bois', 'approvisionne'),
('Tissu pour canapé', 'approvisionne'),
('Plaques de métal', 'approvisionne'),
('Poignées de porte', 'approvisionne'),
('Ressorts pour canapé', 'approvisionne'),
('Vernis protecteur', 'approvisionne'),
('Charnières en acier', 'approvisionne');

-- Insertion des produits fabriqués
INSERT INTO ProduitFabrique (id_produit, heures_main_oeuvre) VALUES
(1, 5.00),  -- Chaise en bois
(2, 8.00),  -- Table en verre
(3, 10.00), -- Armoire
(4, 4.00),  -- Étagère
(5, 7.00),  -- Lit en métal
(6, 6.00),  -- Bureau en bois
(7, 15.00), -- Canapé
(8, 9.00),  -- Bibliothèque
(9, 8.50),  -- Commode
(10, 5.50), -- Table basse
(11, 7.50), -- Meuble TV
(12, 6.50); -- Porte en bois

-- Insertion des produits approvisionnés
INSERT INTO ProduitApprovisionne (id_produit, prix_achat_moyen) VALUES
(13, 1.50),   -- Vis en acier
(14, 12.00),  -- Panneaux MDF
(15, 25.00),  -- Peinture blanche
(16, 30.00),  -- Verre trempé
(17, 2.00),   -- Clous galvanisés
(18, 5.50),   -- Colle à bois
(19, 20.00),  -- Tissu pour canapé
(20, 50.00),  -- Plaques de métal
(21, 3.50),   -- Poignées de porte
(22, 18.00),  -- Ressorts pour canapé
(23, 8.00),   -- Vernis protecteur
(24, 6.00);   -- Charnières en acier

-- Insertion de 10 commandes
INSERT INTO Commande (date_commande, id_fournisseur) VALUES
('2025-03-01', 1),
('2025-03-05', 2),
('2025-03-10', 3),
('2025-03-15', 4);

-- Insertion de lignes de commande (produits approvisionnés uniquement)
INSERT INTO LigneCommande (date_livraison, quantite, id_produit, id_commande) VALUES
('2025-03-07', 100, 13, 1), -- Commande vis en acier au fournisseur A
('2025-03-07', 100, 14, 1), -- Commande panneaux MDF au fournisseur A
('2025-03-12', 50, 14, 2), -- Commande panneaux MDF au fournisseur B
('2025-03-18', 30, 15, 2), -- Commande peinture blanche au fournisseur B
('2025-03-20', 20, 18, 3), -- Commande colle à bois au fournisseur C
('2025-03-20', 200, 17, 3), -- Commande clous galvanisés au fournisseur C
('2025-03-28', 80, 19, 4); -- Commande tissu pour canapé au fournisseur D

-- Association Fournisseur / Produits approvisionnés
INSERT INTO Fournir (id_fournisseur, id_produit) VALUES
(1, 13),  -- Fournisseur A fournit vis en acier
(1, 14),  -- Fournisseur A fournit panneaux MDF
(2, 15),  -- Fournisseur B fournit peinture blanche
(2, 14),  -- Fournisseur B fournit panneaux MDF
(3, 17),  -- Fournisseur C fournit clous galvanisés
(3, 18),  -- Fournisseur C fournit colle à bois
(4, 19),  -- Fournisseur D fournit tissu pour canapé
(5, 20),  -- Fournisseur E fournit plaques de métal
(6, 21);  -- Fournisseur F fournit poignées de porte