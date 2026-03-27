-- 2) Nombre de sociétés sans individu mais avec un produit acheté entre 06/94 et 06/95 ?
-- Société avec un achat entre le premier juin 94 et le 31 juin 95
WITH filtered_prod AS (
    SELECT NUMSOC
    FROM PRODX
    WHERE DATE_ACHAT BETWEEN DATE('1994-06-01') AND DATE('1995-06-30')
),

-- Nombre d'individus par société
soc_without_ind AS (
    SELECT s.NUMSOC,
        COUNT(DISTINCT i.NUMIND) as nb_indiv
    FROM SOCX AS s
        LEFT JOIN INDX as i on s.NUMSOC = i.NUMSOC
    GROUP BY s.NUMSOC
)

SELECT COUNT(DISTINCT p.NUMSOC)
FROM filtered_prod as p
    INNER JOIN soc_without_ind as soc_i ON p.NUMSOC = soc_i.NUMSOC
WHERE soc_i.nb_indiv = 0;