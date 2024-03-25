-- Devoir 207
-- Nom: RIBALTCHENKO , Prenom: Carel

-- Feuille SAE2.04 Exploitation d'une base de donn�es
-- 
-- Veillez � bien r�pondre aux emplacements indiqu�s.
-- Seule la premi�re requ�te est prise en compte.

-- +-----------------------+--
-- * Question 207403 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quelles sont les formations offertes par l'IUT d'Orl�ans en 2023? On veut le num�ro de formation, la fili�re, le nom (fil_lib_voe_acc)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | num_form | fil_lib_voe_acc                                          | select_form         | num_fili | fili              |
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | etc...
-- = Reponse question 207403.

select num_form, fil_lib_voe_acc, select_form, num_fili, fili
from FORMATION natural join FILIERE natural join VOEUX natural join ETABLISSEMENT 
where g_ea_lib_vx = "I.U.T d'Orléans";

-- +-----------------------+--
-- * Question 207425 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quels sont les �tablissements de la Creuse qui offrent un BTS? On veut le code uai, le nom de l'�tablissement ( g_ea_lib_vx) et la ville.

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------+------------+------+
-- | cod_uai  | g_ea_lib_vx                      | ville_etab | FILI |
-- +----------+----------------------------------+------------+------+
-- | etc...
-- = Reponse question 207425.

select cod_uai, g_ea_lib_vx, ville_etab, FILI
from ETABLISSEMENT natural join VOEUX natural join FORMATION natural join FILIERE natural join DEPARTEMENT
where departement = "Creuse";

-- +-----------------------+--
-- * Question 207458 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Combien de candidats ont �t� class�s lors de la phase principale de 2023 par les diff�rents �tablissements qui d�livrent le BUT QLIO? On veut le code uai, le nom et la ville de l'�tablissement et le nombre de class�s lors de la phase principale (nb_cla_pp)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | cod_uai  | g_ea_lib_vx                                         | ville_etab         | nb_cla_pp |
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | etc...
-- = Reponse question 207458.

select cod_uai, g_ea_lib_vx, ville_etab, nb_cla_pp
from ETABLISSEMENT natural join VOEUX natural join STATS natural join FORMATION natural join FILIERE
where session = 2023 and FILI = 'BUT' and fil_lib_voe_acc='Qualité, logistique industrielle et organisation';

-- +-----------------------+--
-- * Question 207492 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  La liste des lyc�es publics du Loiret

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------+-------------------------+
-- | cod_uai  | g_ea_lib_vx                            | ville_etab              |
-- +----------+----------------------------------------+-------------------------+
-- | etc...
-- = Reponse question 207492.

<@643852334513913866> select cod_uai, g_ea_lib_vx, ville_etab
from ETABLISSEMENT natural join DEPARTEMENT
where contrat_etab = 'Public' and dep_lib='Loiret' and g_ea_lib_vx LIKE 'Lycée%';

-- +-----------------------+--
-- * Question 207548 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des d�partements dans lesquels il n'y a aucune offre de Licence

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-----+-------------------------+
-- | dep | dep_lib                 |
-- +-----+-------------------------+
-- | etc...
-- = Reponse question 207548.

select dep, dep_lib 
from DEPARTEMENT
except 
select dep, dep_lib 
from DEPARTEMENT natural join ETABLISSEMENT natural join VOEUX natural join FORMATION natural join FILIERE
where FILI='Licence';

-- +-----------------------+--
-- * Question 207560 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements qui offrent � la fois une licence de Droit et une licence informatique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+--------------------------------------------------------------+----------------+
-- | cod_uai  | g_ea_lib_vx                                                  | ville_etab     |
-- +----------+--------------------------------------------------------------+----------------+
-- | etc...
-- = Reponse question 207560.

select cod_uai, g_ea_lib_vx, ville_etab
from ETABLISSEMENT natural join VOEUX natural join FORMATION natural join FILIERE
where FILI='Licence' and fil_lib_voe_acc='Droit'
intersect
select cod_uai, g_ea_lib_vx, ville_etab
from ETABLISSEMENT natural join VOEUX natural join FORMATION natural join FILIERE
where FILI='Licence' and fil_lib_voe_acc='Informatique';

-- +-----------------------+--
-- * Question 207593 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements de l'acad�mie de Versailles qui n'offrent que des Licences

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | cod_uai  | g_ea_lib_vx                                                                     | ville_etab          |
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | etc...
-- = Reponse question 207593.

select distinct cod_uai, g_ea_lib_vx, ville_etab
from ETABLISSEMENT natural join VOEUX natural join FORMATION natural join FILIERE natural join DEPARTEMENT natural join ACADEMIE
where acad_mies= "Versailles" AND cod_uai NOT IN
(select cod_uai
from ETABLISSEMENT natural join VOEUX natural join FORMATION natural join FILIERE natural join DEPARTEMENT natural join ACADEMIE
where FILI!='Licence');

-- +-----------------------+--
-- * Question 207616 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre d'�tablissements publics par acad�mie

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +---------------------+-------+
-- | acad_mies           | nb_et |
-- +---------------------+-------+
-- | etc...
-- = Reponse question 207616.

select acad_mies, count(*) nb_et 
from ACADEMIE natural join DEPARTEMENT natural join ETABLISSEMENT
group by num_aca
having contrat_etab = 'public';

-- +-----------------------+--
-- * Question 207661 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre de places offertes en BTS en 2023 par r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+---------------+
-- | region_etab_aff            | nb_places_bts |
-- +----------------------------+---------------+
-- | etc...
-- = Reponse question 207661.

select region_etab_aff, SUM(capa_fin) nb_places_bts
from REGION natural join DEPARTEMENT natural join ETABLISSEMENT natural join VOEUX natural join STATS natural join FORMATION natural join FILIERE
where FILI='BTS' and session=2023
GROUP BY region_etab_aff;



-- +-----------------------+--
-- * Question 207694 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la ou les formations qui ont re�u le plus de voeux en phase principale en 2023

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-------------+--------------+-------------------+-----------+
-- | cod_uai  | g_ea_lib_vx | ville_etab   | fili              | nb_voe_pp |
-- +----------+-------------+--------------+-------------------+-----------+
-- | etc...
-- = Reponse question 207694.

select cod_uai, g_ea_lib_vx, ville_etab, fili, nb_voe_pp
from ETABLISSEMENT natural join VOEUX natural join STATS natural join FORMATION natural join FILIERE
where session = 2023 and nb_voe_pp in (select max(nb_voe_pp) from STATS where session = 2023);

-- +-----------------------+--
-- * Question 207740 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des r�gions qui ont re�u plus de voeux en 2022 qu'en 2023

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------------+
-- | region_etab_aff         |
-- +-------------------------+
-- | etc...
-- = Reponse question 207740.

with region22 as (select region_etab_aff, sum(voeux) voeux22 
                  from REGION natural join DEPARTEMENT natural join ETABLISSEMENT natural join VOEUX natural join STATS
                  where session = 2022 group by region_etab_aff)

with region23 as (select region_etab_aff, sum(voeux) voeux23 
                  from REGION natural join DEPARTEMENT natural join ETABLISSEMENT natural join VOEUX natural join STATS
                  where session = 2023 group by region_etab_aff)

select region_etab_aff 
from region22 natural join region23
where voeux22>voeux23;


-- +-----------------------+--
-- * Question 207751 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 1er graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+---------+
-- | fili              | nb_form |
-- +-------------------+---------+
-- | etc...
-- = Reponse question 207751.

select fili, count(*) as nb_form
from FILIERE natural join FORMATION natural join VOEUX natural join STATS natural join ETABLISSEMENT natural join DEPARTEMENT natural join ACADEMIE
where acad_mies = "Orléans-Tours" and session=2023 group by fili;

-- +-----------------------+--
-- * Question 207807 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 2eme graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+----------+
-- | filiere           | nb_voeux |
-- +-------------------+----------+
-- | etc...
-- = Reponse question 207807.

select FILI, ifnull(SUM(capa_fin),0) as nb_voeux
from FILIERE natural left join FORMATION natural left join VOEUX natural left join STATS
where session=2023 and select_form='formation sélective' group by FILI;
