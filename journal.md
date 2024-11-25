
# Journal de bord du projet encadré

## Séance 1&2
Création de l'espace git avec dépot local de clone, apprentissage des commandes Git tels que git clone, vim...etc.Inscription tardive donc j'ai râté les trois premières séances, perdue dans les cours et j'essaye de rattrapée un peu. Mon Git est en désordre, en espérant qu'il sera propre après les vacances de fin octobre.  

### Commandes bases
- cd changer de répertoire
- sudo permission
- pwd afficher le chemin absolu du répertoire courant
- cat nom_du_fichier afficher le contenu d’un fichier dans le terminal
- wc -l compter le nb de lignes, de mots et de caractères dans un fichier
- echo afficher des messages ou des variables dans le terminal
- grep “chaine” nom_fichier  rechercher les lignes contenant la chaîne
- head nom_du_fichier afficher les premières lignes d’un fichier
- ls lister les fichiers et répertoires
- ld lister les fichiers et répertoires avec des informations détaillées
- ls -lh afficher la liste des fichiers avec détails supplémentaire
- mkdir nom_du_repertoire créer un nouveau répertoire
- rm nom_du_fichier supprimer un fichier
- rmdir supprimer un répertoire vide
- cp source destination copier un fichier d’une source vers une destination
- mv source destination déplacer un fichier d’une source vers une destination
- nano ouvre le fichier spécifié avec l’éditeur de texte Nano
- vim ouvre le fichier spécifié avec l’éditeur de texte Vim
- git clone fichier clone dépot local et distanciel

## Séance 3
### Envoyer des modifications local/à distance
- git add ajouter un fichier à l’index
- git commit -m “ “ faire un commit avec un message
- git push envoie les commits locaux vers le dépôt distant
- git pull récupère et fusionne les modifications depuis le dépôt distant
### Modification/suppressions des commits précédents
- git status vérifier l’état du dépôt
- git log affiche l’historique des commits avec des informations détaillés
- git reset –soft/hard id_commit annuler les commits, hard pour supprimer les modifications
- git revert id_commit annuler un commit sans modifier l’historique, crée un nouveau commit qui annule les modifications apportées un commit spécifique
- git checkout – nom_du_fichier restaure le fichier à son dernier état validé
- Tag
- git tag nom_du_tag/git push origin nom_du_tag ajouter un tag
- git tag -d nom_du_tag/git push origin –delete nom_du_tag supprimer un tag localement/à distance

## Séance 4
- *.ann sélectionner tous les fichier terminent par .ann
- cut extraire des sections spécifique d’un fichier txt ex:cut -d ',' -f 2 fichier.csv
-d délimiteur
-f champs à extraire
-c caractères à extraire
- sort trie les lignes d”un fichier txt ex:sort nombres.txt
	-n trie numérique
	-r trie en ordre inverse
	-k spécifie le champ à trier
- tail affiche les dernières lignes d’un fichier
	-n le nb de lignes à afficher
	-f suivre un fichier en temps réel
- uniq supprimer les lignes en double dans un fichier
	-c compte le nombre de fois que chaque ligne apparaît
	-d affiche uniquement les lignes qui apparaissent plusieurs fois
	-u affiche uniquement les lignes uniques

## Séance 5
### Commande lynx
- dump afficher le contenu du texte brut du site Web
- nolist sans liste
- listonly afficher la liste du site Web
- source afficher la source
### Commande curl
- i pour voir le contenu
- o sauvegarder la sortie dans un fichier
- d envoyer des données avec la méthode POST
- H “ “ ajouter des en-têtes personnalisés
- I afficher les en-têtes de réponse
- L suivre les redirections
- x utiliser un proxy
- v vérifier une URL avec SSL/TLS

## Séance 6
### Exercices
1/Pourquoi ne pas utiliser cat ?  
cat envoie tout le contenu d’un fichier à la sortie standard d’un coup, mais while read -r line permet de lire chaque ligne du fichier individuellement. Ça évite les effets indésirables d’expansion ou de transformation des espaces et des tabulations, si est plus simple pour la manipulation ligne par ligne.  
2/Comment transformer "urls/fr.txt" en paramètre du script ?  
Je peux remplacer “urls/fr.txt” par “$1”, même technique utilisée sur le cours de PRAAT.  
3/Comment afficher le numéro de ligne avant chaque URL (sur la même ligne) ?  
Ajouter \t pour les tabulations, juste après l’URL comme echo -e "${line_number}\t${line}”  

chmod +x miniprojet.sh  
./miniprojet.sh ../urls/fr.txt  

## Séance 7  
### Commande HTML  
Difficile à expliquer les commandes HTML dans journal.md.  
Utilisation du <style> pour ajouter des bordures et le fond de couleur du cellule.  
Après avoir modifier mon code je connaîs l'importance des commentaires: POUR NE PAS ME PERDRE DANS LE FUTUR.  

## Séance 8
https://xxicheese.github.io/PPE1-2024/
