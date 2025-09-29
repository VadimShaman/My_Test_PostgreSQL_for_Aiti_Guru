SELECT 
    parent.id AS "ID категории",
    parent.name AS "Категория",
    COUNT(child.id) AS "Количество дочерних категорий"
FROM catalog parent
LEFT JOIN catalog child ON child.parent_id = parent.id
GROUP BY parent.id, parent.name
HAVING COUNT(child.id) > 0
ORDER BY "Количество дочерних категорий" DESC;