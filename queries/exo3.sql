-- 3) Nombre d'individus dans la région parisienne avec un produit X et dont la société n'a pas encore de produit y
-- Individu ayant un produit X
WITH filtered_ind AS (
    SELECT NUMSOC,
        NUMIND
    FROM PRODX
    WHERE CODE_PROD = 'X'
),

-- Société sans produit Y
filtered_soc AS (
    SELECT NUMSOC,
        SUM(
            CASE
                WHEN CODE_PROD = 'Y' THEN 1
                ELSE 0
            END
        ) as nb_Y
    FROM PRODX
    GROUP BY NUMSOC

) -- Jointure pour avoir le nombre d'individus ayant un produit X qui font partie d'une société parisienne sans produit y
SELECT COUNT(DISTINCT fi.NUMIND)
FROM filtered_ind as fi
    LEFT JOIN filtered_soc as fs ON fs.NUMSOC = fi.NUMSOC
    LEFT JOIN SOCX as s ON s.NUMSOC = fi.NUMSOC
WHERE fs.nb_Y = 0
    AND SUBSTR(s.CP, 1, 2) = '75';