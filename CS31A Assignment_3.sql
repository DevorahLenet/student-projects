/* Devorah Sachs */
/*Assignment: write queries to get the desired information from the vet database.
Results for queries shown below.*/

/* PART ONE */
/* TASK 01 */
select cl_name_first, cl_name_last, cl_phone
from vt_clients
where cl_phone is not null
order by cl_id;

/* TASK 02 */
select distinct srv_id
from vt_exam_details
where ex_fee >= 75;

/* TASK 03 */
select cl_id, an_type
from vt_animals
where an_type in ('snake', 'chelonian', 'crocodilian', 'lizard')
order by cl_id;

/* TASK 04 */
select cl_id, an_id, an_type, an_name
from vt_animals
where an_type in ('cat', 'dog');

/* TASK 05 */
select ex_id, ex_date, srv_id, ex_fee
from vt_animals 
inner join vt_exam_headers using(an_id)
inner join vt_exam_details using(ex_id)
where an_type in ('hamster', 'capybara', 'porcupine', 'dormouse')
order by ex_id, srv_id;

/* TASK 06 */
select cl_id, ex_id, ex_date, srv_id, ex_fee
from vt_animals
inner join vt_exam_headers using(an_id)
inner join vt_exam_details using(ex_id)
where ex_fee not between 25 and 200
order by ex_date, srv_id;

/* PART TWO */
/* TASK 01 */
select cl_id, an_id, an_type, an_name
from vt_animals AN
where an_type in('dog', 'cat');

/* TASK 02 */
select CL.cl_id, cl_name_last
from vt_clients CL
left join vt_animals AN
on CL.cl_id = AN.cl_id
where AN.an_id is Null;

/* TASK 03 */
select cl_id, cl_name_last
from vt_clients CL
left join vt_animals AN using(cl_id)
where an_type not in('hamster', 'capybara', 'porcupine', 'dormouse')
or an_id is null;

/* TASK 04 */
select cl_id, cl_name_last, an_id, an_name, an_type
from vt_clients CL
inner join vt_animals AN using(cl_id)
left join vt_exam_headers using(an_id)
where ex_id is null
order by cl_id, ex_id;

/* TASK 05 */
select cl_id, cl_name_last
from vt_clients CL
inner join vt_animals AN using(cl_id)
where an_type not in('hamster', 'capybara', 'porcupine', 'dormouse');

/* TASK 06 */
select CL.cl_id, cl_name_last, an_id, an_name, an_dob
from vt_clients CL
inner join vt_animals AN 
on CL.cl_id = AN.cl_id
where an_type not in('dog', 'cat', 'bird')
and cl_state in('NY', 'MA');

/* TASK 07 */
select *
from vt_services SV
left join vt_exam_details Exd using(srv_id)
where srv_list_price > 100 and Exd.srv_id is null;


/* From here on is the program output as copied from DB fiddle:

**Query #1**

    /* Devorah Sachs */
    
    /* PART ONE */
    /* TASK 01 */
    select cl_name_first, cl_name_last, cl_phone
    from vt_clients
    where cl_phone is not null
    order by cl_id;

| cl_name_first | cl_name_last | cl_phone     |
| ------------- | ------------ | ------------ |
| James         | Carter       | 510.258.4546 |
| Jack          | Dalrymple    | 701.328.2725 |
| Coleman       | Hawkins      | 937.258.5645 |
| Theo          | Monk         | 212.582.6245 |
| Wilson        | Pickett      | 212.584.9871 |
| Stanley       | Turrentine   | 619.231.1515 |
|               | Biederbecke  | 217.239.6945 |
|               | Biederbecke  | 415.239.6945 |
| Sue           | Biederbecke  | 217.239.6875 |
| Sam           | Biederbecke  | 415.239.6875 |
| Dave          | Brubeck      | 258.257.2727 |

---
**Query #2**

    /* TASK 02 */
    select distinct srv_id
    from vt_exam_details
    where ex_fee >= 75;

| srv_id |
| ------ |
| 105    |
| 602    |
| 523    |
| 524    |
| 108    |
| 615    |
| 461    |
| 603    |
| 110    |
| 605    |
| 604    |
| 625    |
| 106    |

---
**Query #3**

    /* TASK 03 */
    select cl_id, an_type
    from vt_animals
    where an_type in ('snake', 'chelonian', 'crocodilian', 'lizard')
    order by cl_id;

| cl_id | an_type |
| ----- | ------- |
| 411   | lizard  |
| 1852  | snake   |
| 3561  | lizard  |
| 3561  | snake   |
| 7152  | lizard  |
| 7152  | lizard  |

---
**Query #4**

    /* TASK 04 */
    select cl_id, an_id, an_type, an_name
    from vt_animals
    where an_type in ('cat', 'dog');

| cl_id | an_id | an_type | an_name         |
| ----- | ----- | ------- | --------------- |
| 3560  | 10002 | cat     | Gutsy           |
| 411   | 15165 | dog     | Burgess         |
| 1825  | 16003 | cat     | Ursula          |
| 1825  | 16043 | dog     | Ursula          |
| 1825  | 16044 | dog     | Triton          |
| 6426  | 19845 | dog     | Pinkie          |
| 6426  | 21003 | dog     | Calvin Coolidge |
| 5689  | 21205 | dog     | Manfried        |
| 4087  | 21305 | dog     | Spot            |
| 4087  | 21306 | dog     | Shadow          |
| 4087  | 21307 | dog     | Buddy           |
| 4087  | 21314 | cat     | Adalwine        |
| 4534  | 21315 | cat     | Baldric         |
| 5698  | 21316 | cat     | Etta            |
| 5698  | 21317 | cat     | Manfried        |
| 5698  | 21318 | cat     | Waldrom         |

---
**Query #5**

    /* TASK 05 */
    select ex_id, ex_date, srv_id, ex_fee
    from vt_animals 
    inner join vt_exam_headers using(an_id)
    inner join vt_exam_details using(ex_id)
    where an_type in ('hamster', 'capybara', 'porcupine', 'dormouse')
    order by ex_id, srv_id;

| ex_id | ex_date    | srv_id | ex_fee |
| ----- | ---------- | ------ | ------ |
| 2389  | 2015-05-20 | 110    | 50     |
| 2389  | 2015-05-20 | 523    | 60     |
| 2400  | 2015-06-02 | 461    | 275    |
| 3105  | 2015-10-10 | 110    | 150    |
| 3105  | 2015-10-10 | 523    | 50.5   |
| 3321  | 2016-02-17 | 748    | 0      |
| 3322  | 2016-02-10 | 748    | 29.5   |
| 3323  | 2016-02-25 | 524    | 20     |
| 3323  | 2016-02-25 | 687    | 45     |
| 3393  | 2015-12-23 | 748    | 29.5   |
| 3393  | 2015-12-23 | 749    | 0      |
| 3486  | 2015-12-31 | 461    | 275    |
| 4103  | 2016-01-08 | 461    | 275    |
| 4203  | 2015-08-03 | 524    | 20     |
| 4233  | 2015-09-03 | 524    | 20     |
| 4243  | 2015-06-08 | 461    | 275    |
| 4255  | 2015-07-08 | 461    | 275    |

---
**Query #6**

    /* TASK 06 */
    select cl_id, ex_id, ex_date, srv_id, ex_fee
    from vt_animals
    inner join vt_exam_headers using(an_id)
    inner join vt_exam_details using(ex_id)
    where ex_fee not between 25 and 200
    order by ex_date, srv_id;

| cl_id | ex_id | ex_date    | srv_id | ex_fee |
| ----- | ----- | ---------- | ------ | ------ |
| 3560  | 2400  | 2015-06-02 | 461    | 275    |
| 3423  | 4243  | 2015-06-08 | 461    | 275    |
| 3423  | 4255  | 2015-07-08 | 461    | 275    |
| 5698  | 4612  | 2015-07-23 | 602    | 222    |
| 3423  | 4203  | 2015-08-03 | 524    | 20     |
| 5699  | 4514  | 2015-08-10 | 112    | 15     |
| 3423  | 4233  | 2015-09-03 | 524    | 20     |
| 3561  | 3202  | 2015-10-03 | 341    | 20     |
| 7152  | 3010  | 2015-10-22 | 605    | 535    |
| 1825  | 3552  | 2015-11-10 | 308    | 2.25   |
| 1825  | 3413  | 2015-12-01 | 308    | 5      |
| 1825  | 3612  | 2015-12-23 | 602    | 222    |
| 3423  | 3393  | 2015-12-23 | 749    | 0      |
| 6426  | 3392  | 2015-12-26 | 400    | 21     |
| 3561  | 3411  | 2015-12-29 | 341    | 20     |
| 3561  | 3412  | 2015-12-30 | 341    | 20     |
| 3423  | 3486  | 2015-12-31 | 461    | 275    |
| 3423  | 4103  | 2016-01-08 | 461    | 275    |
| 3423  | 3321  | 2016-02-17 | 748    | 0      |
| 3423  | 3323  | 2016-02-25 | 524    | 20     |

---
**Query #7**

    /* PART TWO */
    /* TASK 01 */
    select cl_id, an_id, an_type, an_name
    from vt_animals AN
    where an_type in('dog', 'cat');

| cl_id | an_id | an_type | an_name         |
| ----- | ----- | ------- | --------------- |
| 3560  | 10002 | cat     | Gutsy           |
| 411   | 15165 | dog     | Burgess         |
| 1825  | 16003 | cat     | Ursula          |
| 1825  | 16043 | dog     | Ursula          |
| 1825  | 16044 | dog     | Triton          |
| 6426  | 19845 | dog     | Pinkie          |
| 6426  | 21003 | dog     | Calvin Coolidge |
| 5689  | 21205 | dog     | Manfried        |
| 4087  | 21305 | dog     | Spot            |
| 4087  | 21306 | dog     | Shadow          |
| 4087  | 21307 | dog     | Buddy           |
| 4087  | 21314 | cat     | Adalwine        |
| 4534  | 21315 | cat     | Baldric         |
| 5698  | 21316 | cat     | Etta            |
| 5698  | 21317 | cat     | Manfried        |
| 5698  | 21318 | cat     | Waldrom         |

---
**Query #8**

    /* TASK 02 */
    select CL.cl_id, cl_name_last
    from vt_clients CL
    left join vt_animals AN
    on CL.cl_id = AN.cl_id
    where AN.an_id is Null;

| cl_id | cl_name_last |
| ----- | ------------ |
| 254   | Boston       |
| 5686  | Biederbecke  |
| 6897  | Drake        |
| 7212  | Davis        |

---
**Query #9**

    /* TASK 03 */
    select cl_id, cl_name_last
    from vt_clients CL
    left join vt_animals AN using(cl_id)
    where an_type not in('hamster', 'capybara', 'porcupine', 'dormouse')
    or an_id is null;

| cl_id | cl_name_last |
| ----- | ------------ |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3561  | Pickett      |
| 5699  | Biederbecke  |
| 411   | Carter       |
| 411   | Carter       |
| 1825  | Harris       |
| 1825  | Harris       |
| 1825  | Harris       |
| 3561  | Pickett      |
| 7152  | Brubeck      |
| 7152  | Brubeck      |
| 6426  | Hawkins      |
| 411   | Carter       |
| 1825  | Harris       |
| 6426  | Hawkins      |
| 3561  | Pickett      |
| 1852  | Dalrymple    |
| 5689  | Biederbecke  |
| 4087  | Turrentine   |
| 4087  | Turrentine   |
| 4087  | Turrentine   |
| 4087  | Turrentine   |
| 4534  | Montgomery   |
| 5698  | Biederbecke  |
| 5698  | Biederbecke  |
| 5698  | Biederbecke  |
| 1852  | Dalrymple    |
| 1852  | Dalrymple    |
| 254   | Boston       |
| 5686  | Biederbecke  |
| 6897  | Drake        |
| 7212  | Davis        |

---
**Query #10**

    /* TASK 04 */
    select cl_id, cl_name_last, an_id, an_name, an_type
    from vt_clients CL
    inner join vt_animals AN using(cl_id)
    left join vt_exam_headers using(an_id)
    where ex_id is null
    order by cl_id, ex_id;

| cl_id | cl_name_last | an_id | an_name  | an_type   |
| ----- | ------------ | ----- | -------- | --------- |
| 411   | Carter       | 15165 | Burgess  | dog       |
| 1825  | Harris       | 16043 | Ursula   | dog       |
| 1825  | Harris       | 16044 | Triton   | dog       |
| 1825  | Harris       | 21002 | Edger    | hedgehog  |
| 1852  | Dalrymple    | 21007 | Pop 22   | snake     |
| 1852  | Dalrymple    | 21321 | Morton   | olinguito |
| 3560  | Monk         | 11015 | Kenny    | bird      |
| 3560  | Monk         | 11025 |          | bird      |
| 3561  | Pickett      | 21004 | Gutsy    | snake     |
| 4087  | Turrentine   | 21305 | Spot     | dog       |
| 4087  | Turrentine   | 21314 | Adalwine | cat       |
| 4534  | Montgomery   | 21315 | Baldric  | cat       |
| 5689  | Biederbecke  | 21205 | Manfried | dog       |
| 5698  | Biederbecke  | 21318 | Waldrom  | cat       |

---
**Query #11**

    /* TASK 05 */
    select cl_id, cl_name_last
    from vt_clients CL
    inner join vt_animals AN using(cl_id)
    where an_type not in('hamster', 'capybara', 'porcupine', 'dormouse');

| cl_id | cl_name_last |
| ----- | ------------ |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3560  | Monk         |
| 3561  | Pickett      |
| 5699  | Biederbecke  |
| 411   | Carter       |
| 411   | Carter       |
| 1825  | Harris       |
| 1825  | Harris       |
| 1825  | Harris       |
| 3561  | Pickett      |
| 7152  | Brubeck      |
| 7152  | Brubeck      |
| 6426  | Hawkins      |
| 411   | Carter       |
| 1825  | Harris       |
| 6426  | Hawkins      |
| 3561  | Pickett      |
| 1852  | Dalrymple    |
| 5689  | Biederbecke  |
| 4087  | Turrentine   |
| 4087  | Turrentine   |
| 4087  | Turrentine   |
| 4087  | Turrentine   |
| 4534  | Montgomery   |
| 5698  | Biederbecke  |
| 5698  | Biederbecke  |
| 5698  | Biederbecke  |
| 1852  | Dalrymple    |
| 1852  | Dalrymple    |

---
**Query #12**

    /* TASK 06 */
    select CL.cl_id, cl_name_last, an_id, an_name, an_dob
    from vt_clients CL
    inner join vt_animals AN 
    on CL.cl_id = AN.cl_id
    where an_type not in('dog', 'cat', 'bird')
    and cl_state in('NY', 'MA');

| cl_id | cl_name_last | an_id | an_name  | an_dob     |
| ----- | ------------ | ----- | -------- | ---------- |
| 3560  | Monk         | 12038 | Gutsy    | 2012-04-29 |
| 3561  | Pickett      | 15001 | Big Mike | 2010-02-02 |
| 3561  | Pickett      | 17025 | 25       | 2013-01-10 |
| 7152  | Brubeck      | 17026 | 3P#_26   | 2010-01-10 |
| 7152  | Brubeck      | 17027 | 3P#_25   | 2010-01-10 |
| 3561  | Pickett      | 21004 | Gutsy    | 2011-05-12 |

---
**Query #13**

    /* TASK 07 */
    select *
    from vt_services SV
    left join vt_exam_details Exd using(srv_id)
    where srv_list_price > 100 and Exd.srv_id is null;

There are no results to be displayed.
end output */
