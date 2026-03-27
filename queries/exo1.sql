-- 1) Nombre de sociétés avec au moins deux individus dont au moins une fonction informatique(fonction= ‘DI’) ?
-- Calcul du nombre d'individu avec une fonction informatique par entreprise
WITH filtered_ind AS (
    SELECT NUMSOC,
        COUNT(DISTINCT NUMIND) as nb_indiv,
        SUM(
            CASE
                WHEN (FONCTION) = 'DI' THEN 1
                ELSE 0
            END
        ) as nb_DI
    FROM INDX
    GROUP BY NUMSOC
)

-- Filtrage sur le nombre d'individu et le nombre d'individus avec une fonction informatique
SELECT COUNT(DISTINCT NUMSOC)
FROM filtered_ind
WHERE nb_indiv >= 2
    AND nb_DI >= 1;