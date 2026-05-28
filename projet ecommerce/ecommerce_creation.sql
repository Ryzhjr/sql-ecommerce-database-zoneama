-- Creation BD --

-- Ici, nous avons réécrit sous forme SQL ce que nous avons fait sur looping
-- En respectant les règles de conversion et de FN

-- créer la database ecommerce
CREATE database ecommerce;

-- utilise cette meme database
USE ecommerce;

-- Auto increment pour ne pas avoir a specifier l'id quand on ajoute des valeurs
CREATE TABLE Fournisseur(
   id_fournisseur INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   PRIMARY KEY(id_fournisseur)
);

-- Auto increment pour ne pas avoir a specifier l'id quand on ajoute des valeurs
-- ON DELETE CASCADE pour supprimer les lignes si l'une de ses clés étrangères est supprimée
CREATE TABLE Commande(
   id_commande INT NOT NULL AUTO_INCREMENT,
   date_commande DATE NOT NULL,
   id_fournisseur INT NOT NULL,
   PRIMARY KEY(id_commande),
   FOREIGN KEY(id_fournisseur) REFERENCES Fournisseur(id_fournisseur) ON DELETE CASCADE
);

-- Auto increment pour ne pas avoir a specifier l'id quand on ajoute des valeurs
CREATE TABLE Produit(
   id_produit INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(100) NOT NULL,
   type ENUM('fabrique', 'approvisionne') NOT NULL,
   PRIMARY KEY(id_produit)
);

-- ON DELETE CASCADE pour supprimer les lignes si l'une de ses clés étrangères est supprimée
CREATE TABLE ProduitFabrique(
   id_produit INT,
   heures_main_oeuvre DECIMAL(5,2) NOT NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_produit) REFERENCES Produit(id_produit) ON DELETE CASCADE
);

-- ON DELETE CASCADE pour supprimer les lignes si l'une de ses clés étrangères est supprimée
CREATE TABLE ProduitApprovisionne(
   id_produit INT,
   prix_achat_moyen DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_produit) REFERENCES Produit(id_produit) ON DELETE CASCADE
);

-- Auto increment pour ne pas avoir a specifier l'id quand on ajoute des valeurs
-- ON DELETE CASCADE pour supprimer les lignes si l'une de ses clés étrangères est supprimée
CREATE TABLE LigneCommande(
   id_ligne INT NOT NULL AUTO_INCREMENT,
   date_livraison DATE NOT NULL,
   quantite INT NOT NULL,
   id_produit INT NOT NULL,
   id_commande INT NOT NULL,
   PRIMARY KEY(id_ligne),
   FOREIGN KEY(id_produit) REFERENCES ProduitApprovisionne(id_produit) ON DELETE CASCADE,
   FOREIGN KEY(id_commande) REFERENCES Commande(id_commande) ON DELETE CASCADE
);

-- Table intermédiaire nécessaire car un fournisseur peut fournir  0 ou plusieurs produits
-- et un produit peut etre fourni par 1 ou plusieurs fournisseurs

-- ON DELETE CASCADE pour supprimer les lignes si l'une de ses clés étrangères est supprimée
CREATE TABLE Fournir(
   id_fournisseur INT,
   id_produit INT,
   PRIMARY KEY(id_fournisseur, id_produit),
   FOREIGN KEY(id_fournisseur) REFERENCES Fournisseur(id_fournisseur) ON DELETE CASCADE,
   FOREIGN KEY(id_produit) REFERENCES ProduitApprovisionne(id_produit) ON DELETE CASCADE
);
