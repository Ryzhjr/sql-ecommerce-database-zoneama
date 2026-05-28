-- Contraintes --

USE ecommerce;

-- evite d'avoir des valeurs inférieurs ou égale à zéro là où ce serait illogique
-- un produit ne peut pas prendre 0 heure ou moins de m'ain d'oeuvre pour etre fabriqué
-- un produit ne peut pas avoir un prix moyen inferieur ou égale à 0
-- la quantité d'un produit d'une ligne de commande ne peut pas etre inférieur ou égal à 0
ALTER TABLE ProduitFabrique ADD CONSTRAINT chk_heures_main_oeuvre CHECK (heures_main_oeuvre >= 0);
ALTER TABLE ProduitApprovisionne ADD CONSTRAINT chk_prix_achat_moyen CHECK (prix_achat_moyen >= 0);
ALTER TABLE LigneCommande ADD CONSTRAINT chk_quantite CHECK (quantite >= 0);


-- rajoute des UNIQUE sur les noms produits et les emails des fournisseurs pour éviter les doublons
ALTER TABLE Produit ADD CONSTRAINT unique_nom_produit UNIQUE(nom);
ALTER TABLE Fournisseur ADD CONSTRAINT unique_email_fournisseur UNIQUE(email);