# oracle_trigger
L'objectif de cette démonstration est de mettre a jour (d'une manière autonome via un trigger STARTER ) la table PONT par les candidats  retenus par ordre de mérite après chaque modification (insertion, supression ou update)dans la table CANDIDAT, Ainsi que la table PONT contient la colonne: SALAIRE qui se calcule (d'une manière autonome via un trigger STARTER)en fonction du note attribué à un candidat (par la formule NOTE*1000 DH) après chaque (insertion, supression ou update)dans la table CANDIDAT.  


le modéle de données est comme suivant:
                                                  CANDIDAT N ----- 1  RECRUTEUR
                                                  |
                                                  |
                                                  |
                 [mis à jour et calcule de salire via le trigger(déclancheur) STARTER ]
                                                  |
                                                  |
                                                  |
                                                TABLE: PONT
                                             
                                             
l'Export de base de donnée ORACLE de nom  SALAFIN qui contient tous les objets nécessaires (tables , contraintes, triggers, insertions.... ).

NB: la table RESULTAT est une table de passage de valeurs depuis PONT et CANDIDAT pour faciliter les mises  à jours.  
NB: veuillez créer un utilisateur (schema) SALAFIN avant d'exporter lae bas de donnée. 

POUR TESTER LES TRAITEMENTS, VEUILLEZ INSERER, MODIFER OU SUPPRIMER un candidat puis retourner vers la table PONT pour voir le changement.    
                                            
                                             
                                             
 
