-- Affiche tous les produits
SELECT * FROM Produit;

-- Afficher tout les produits approvisionnés (id, nom, prix d’achat)
SELECT Produit.id_produit, Produit.nom, Produitapprovisionne.prix_achat_moyen FROM ProduitApprovisionne 
INNER JOIN Produit ON ProduitApprovisionne.id_produit = Produit.id_produit;

-- Afficher tout les produits fabriqués (id, nom, heure de main d’œuvre)
SELECT Produit.id_produit, Produit.nom, ProduitFabrique.heures_main_oeuvre FROM ProduitFabrique 
INNER JOIN Produit ON ProduitFabrique.id_produit = Produit.id_produit;

-- Afficher tous les fournisseurs qui vendent un certain produit (nom fournisseur, email)
-- Ici le produit est un panneaux de MDF (id 14)
SELECT Fournisseur.nom, Fournisseur.email FROM Fournir 
INNER JOIN Fournisseur ON Fournir.id_fournisseur = Fournisseur.id_fournisseur 
WHERE id_produit = 14;

-- Affiche tous les produit qu'un fournisseur fourni (id, nom)
-- Ici le fournisseur est le 1 (Fournisseur A)
SELECT Produit.id_produit, Produit.nom FROM Fournir 
INNER JOIN Produit ON Fournir.id_produit = Produit.id_produit 
WHERE id_fournisseur = 1;

-- Afficher le nombre de fournisseur pour chaque produit (id produit, nb fournisseurs)
SELECT 
    p.id_produit AS id_produit, 
    COUNT(f.id_fournisseur) AS nb_fournisseurs
FROM Fournir AS f
INNER JOIN ProduitApprovisionne AS pa ON f.id_produit = pa.id_produit
JOIN Produit AS p ON pa.id_produit = p.id_produit
GROUP BY p.id_produit;

-- Afficher toutes les lignes de commandes d’une commande (id, nom produit, prix produit, quantité, prix total, date de livraison)
-- Ici la commande est la 2
SELECT 
    lc.id_ligne, 
    p.nom AS nom_produit, 
    pa.prix_achat_moyen, 
    lc.quantite,
    pa.prix_achat_moyen * lc.quantite AS prix_total,
    lc.date_livraison
FROM LigneCommande AS lc
INNER JOIN ProduitApprovisionne AS pa ON lc.id_produit = pa.id_produit
INNER JOIN Produit AS p ON lc.id_produit = p.id_produit
WHERE lc.id_commande = 2;

-- Afficher le total du prix d’une commande
SELECT SUM(pa.prix_achat_moyen * quantite) AS prix_total FROM LigneCommande lc
INNER JOIN ProduitApprovisionne pa ON lc.id_produit = pa.id_produit
WHERE id_commande = 2;

-- Afficher l'argent dépensé en commande de produit entre 2 dates
-- Ici les deux dates sont: 2025-03-01 et 2025-03-10
SELECT 
    SUM(pa.prix_achat_moyen * lc.quantite) AS total_depense
FROM LigneCommande AS lc
INNER JOIN Commande AS c ON lc.id_commande = c.id_commande
INNER JOIN ProduitApprovisionne AS pa ON lc.id_produit = pa.id_produit
WHERE c.date_commande 
BETWEEN '2025-03-01' AND '2025-03-10';