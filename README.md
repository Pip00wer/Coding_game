# Coding Game — Exercices SQL

Exercices SQL réalisés dans le cadre d'un entretien technique (Coding Game / John Paul).  
Les données sont **factices** et ont été générées uniquement pour tester les requêtes.

## Objectif

Résoudre trois problèmes SQL sur un schéma relationnel simplifié (sociétés, individus, produits).

| Exercice | Énoncé |
|----------|--------|
| `exo1.sql` | Sociétés avec au moins 2 individus dont au moins un en fonction informatique (`DI`) |
| `exo2.sql` | Sociétés sans individu mais avec un achat entre juin 1994 et juin 1995 |
| `exo3.sql` | Individus en région parisienne avec un produit X, dans une société sans produit Y |

## Technologies

- SQL (syntaxe PostgreSQL / Oracle-like : `VARCHAR2`, `DATE()`)
- Schéma : tables `SOCX`, `INDX`, `PRODX`

## Mise en place de la base

```bash
# Créer les tables
psql -U <user> -d <database> -f database/create_table.sql

# Insérer les données de test
psql -U <user> -d <database> -f database/insert_data.sql
```

Adapter la commande selon votre SGBD (PostgreSQL, Oracle, etc.).

## Exécuter les requêtes

```bash
psql -U <user> -d <database> -f queries/exo1.sql
psql -U <user> -d <database> -f queries/exo2.sql
psql -U <user> -d <database> -f queries/exo3.sql
```

## Structure

```
coding_game/
├── database/
│   ├── create_table.sql
│   └── insert_data.sql
├── queries/
│   ├── exo1.sql
│   ├── exo2.sql
│   └── exo3.sql
└── README.md
```

## Auteur

Louis Daviet
