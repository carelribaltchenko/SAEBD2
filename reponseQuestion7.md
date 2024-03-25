# QUESTION 7

## 1)

requette pour avoir V : ```SQL
select num_reg, count(num_form)
from REGION natural join DEPARTEMENT natural join ETABLISSEMENT natural join STATS
where session=2022 group by num_reg
```

moyenne de V: