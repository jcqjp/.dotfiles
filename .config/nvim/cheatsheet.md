## Utiliser :help

exemple: :help motion ou :help dd

## Autoformat

leader gf

## Multi curseur

Utiliser ctrl n au lieu de ctrl d pour selectionner plusieurs mots et leur ajouter des curseurs.
Puis i pour insérer des caractères au début et a pour insérer à la fin. c pour remplacer etc...


### Basic usage:
- select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
- create cursors vertically with Ctrl-Down/Ctrl-Up
- select one character at a time with Shift-Arrows
- press n/N to get next/previous occurrence
- press [/] to select next/previous cursor
- press q to skip current and get next occurrence
- press Q to remove current cursor/selection
- start insert mode with i,a,I,A

## VIM Motions

#### Structure de base

```text
[commande][nombre][motion]
```

- nombre : combien de fois (optionnel)
- commande : ce qu'on fait (supprimer, copier, etc.)
- motion : où/quoi (mouvement)

> Répeter la commande l'applique sur toute la ligne
> Exemple:
> yy copie toute la ligne
> cc remplace toute la ligne
> dd supprime toute la ligne

#### Motions principales

Commande Action
dd Supprimer la ligne courante
3dd Supprimer 3 lignes (courante + 2 dessous, "faire 3x dd")
d2j Supprimer vers 2 lignes en bas
d3k Supprimer vers 3 lignes en haut

---

### Commandes

#### Edition

Commande Action
i Insert avant le curseur
a Insert après le curseur
I Insert début de ligne
A Insert fin de ligne
o Nouvelle ligne en dessous
O Nouvelle ligne au-dessus
s Supprime caractère et insert
S Supprime ligne et insert

#### Suppresion

Commande Action
x Supprime le caractère sous le curseur
X Supprime le caractère avant
dd Supprime la ligne entière
dw Supprime un mot
d$ ou D Supprime jusqu'en fin de ligne
diw Supprime le mot (inner word)
ciw Supprime le mot et insert

# Copier Coller

Commande Action
yy ou Y Copie la ligne
yw Copie un mot
y$ Copie jusqu'en fin de ligne
p Colle après
P Colle avant
"\*p Colle du presse-papier système

---

### Motions

#### Basiques

Commande Action
h ← gauche
j ↓ bas
k ↑ haut
l → droite
w mot suivant
b mot précédent
e fin du mot
$ fin de ligne
0 début de ligne
^ premier caractère non-blanc

---

### Avancés

Commande Action
gg début du fichier
G fin du fichier
50G ligne 50
} paragraphe suivant
{ paragraphe précédent
% parenthèse correspondante

---

## Nvim Commands

gc Commande
gc pour entrer en mode commentaire, puis 5k pour commenter 5 lignes vers le haut.
