select nome_funcionario from funcionario
where sigla_depto in(select sigla_depto
from departamento
where nome_depto like '%Recursos Humanos%');

select nome_funcionario 
from funcionario 
where sigla_depto like 'mkt' or sigla_depto like 'rh';

select nome_depto, 
       sum((select salario from funcionario where sigla_depto = d.sigla_depto)) as total_salarios
from departamento d
group by nome_depto;

select nome_funcionario 
from funcionario 
where sigla_depto = 'ti' 
and salario > (
    select avg(salario) 
    from funcionario 
    where sigla_depto = 'ti'
);

select nome_depto, 
       count((select nome_funcionario 
              from funcionario 
              where sigla_depto = d.sigla_depto)) as quantidade_funcionarios
from departamento d
group by nome_depto;

SELECT nome_funcionario 
FROM funcionario 
WHERE sigla_depto = 'RH' 
AND salario > (
    SELECT AVG(salario) 
    FROM funcionario 
    WHERE sigla_depto = 'RH'
);

SELECT nome_depto, 
       (SELECT GROUP_CONCAT(nome_funcionario SEPARATOR ', ') 
        FROM funcionario 
        WHERE sigla_depto = d.sigla_depto) AS funcionarios
FROM departamento d;