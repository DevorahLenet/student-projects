/* Devorah Sachs */
/*Assignment: write queries to get the desired information from the vet database.
Results for queries shown below.*/

/* TASK 01 */
SELECT cl_id, cl_name_last, an_id, an_type, an_name
FROM vt_clients
LEFT JOIN vt_animals using(cl_id);

/* TASK 02 */
SELECT an_id, an_type, an_name, ex_id, ex_date, srv_id
FROM vt_animals
LEFT JOIN vt_exam_headers using(an_id)
LEFT JOIN vt_exam_details using(ex_id);

/* TASK 03 */
SELECT cl_id, cl_name_last
FROM vt_clients
WHERE cl_id IN(SELECT cl_id
               FROM vt_animals
               WHERE an_type NOT IN ('snake', 'lizard', 'turtle', 'chelonian'));
                                     
/* TASK 04 */                                     
SELECT srv_id, srv_list_price, srv_desc, srv_type
FROM vt_services
WHERE srv_list_price >= 100 AND srv_id NOT IN (SELECT srv_id
                                              FROM vt_exam_details);                                    
/* TASK 05 */                                    
SELECT cl_id, cl_name_last
FROM vt_clients
WHERE cl_id NOT IN(SELECT cl_id
                  FROM vt_animals);
                                    
/* TASK 06 */                                     
SELECT cl_id, cl_name_last
FROM vt_clients
WHERE cl_id IN (SELECT cl_id
                FROM vt_animals
                WHERE an_type = 'dog') 
AND cl_id IN (SELECT cl_id
              FROM vt_animals
              WHERE an_type IN('snake', 'lizard', 'turtle', 'chelonian'));
    
/* TASK 07 */                               
SELECT cl_id, cl_name_last
FROM vt_clients                               
WHERE cl_id IN (SELECT cl_id
                FROM vt_animals
                WHERE an_type = 'dog') 
AND cl_id NOT IN (SELECT cl_id
              FROM vt_animals
              WHERE an_type IN('snake', 'lizard', 'turtle', 'chelonian'));                               




/* Here is the output for my queries:


**Query #1**

    /* Devorah Sachs */
    
    /* TASK 01 */
    SELECT cl_id, cl_name_last, an_id, an_type, an_name
    FROM vt_clients
    LEFT JOIN vt_animals using(cl_id);

| cl_id | cl_name_last | an_id | an_type   | an_name         |
| ----- | ------------ | ----- | --------- | --------------- |
| 3560  | Monk         | 10002 | cat       | Gutsy           |
| 3560  | Monk         | 11015 | bird      | Kenny           |
| 3560  | Monk         | 11025 | bird      |                 |
| 3560  | Monk         | 11028 | bird      |                 |
| 3560  | Monk         | 11029 | bird      |                 |
| 3560  | Monk         | 12035 | bird      | Mr Peanut       |
| 3560  | Monk         | 12038 | porcupine | Gutsy           |
| 3561  | Pickett      | 15001 | turtle    | Big Mike        |
| 5699  | Biederbecke  | 15002 | turtle    | George          |
| 411   | Carter       | 15165 | dog       | Burgess         |
| 411   | Carter       | 15401 | lizard    | Pinkie          |
| 3423  | Hawkins      | 16002 | porcupine | Fritz           |
| 1825  | Harris       | 16003 | cat       | Ursula          |
| 1825  | Harris       | 16043 | dog       | Ursula          |
| 1825  | Harris       | 16044 | dog       | Triton          |
| 5699  | Biederbecke  | 17002 | porcupine | Fritzchen       |
| 3561  | Pickett      | 17025 | lizard    | 25              |
| 7152  | Brubeck      | 17026 | lizard    | 3P#_26          |
| 7152  | Brubeck      | 17027 | lizard    | 3P#_25          |
| 6426  | Hawkins      | 19845 | dog       | Pinkie          |
| 411   | Carter       | 21001 | hedgehog  | Yoggie          |
| 1825  | Harris       | 21002 | hedgehog  | Edger           |
| 6426  | Hawkins      | 21003 | dog       | Calvin Coolidge |
| 3561  | Pickett      | 21004 | snake     | Gutsy           |
| 3423  | Hawkins      | 21005 | dormouse  | Koshka          |
| 3423  | Hawkins      | 21006 | hamster   | Koshka          |
| 1852  | Dalrymple    | 21007 | snake     | Pop 22          |
| 5689  | Biederbecke  | 21205 | dog       | Manfried        |
| 4087  | Turrentine   | 21305 | dog       | Spot            |
| 4087  | Turrentine   | 21306 | dog       | Shadow          |
| 4087  | Turrentine   | 21307 | dog       | Buddy           |
| 4087  | Turrentine   | 21314 | cat       | Adalwine        |
| 4534  | Montgomery   | 21315 | cat       | Baldric         |
| 5698  | Biederbecke  | 21316 | cat       | Etta            |
| 5698  | Biederbecke  | 21317 | cat       | Manfried        |
| 5698  | Biederbecke  | 21318 | cat       | Waldrom         |
| 1852  | Dalrymple    | 21320 | olinguito | Morris          |
| 1852  | Dalrymple    | 21321 | olinguito | Morton          |
| 254   | Boston       |       |           |                 |
| 5686  | Biederbecke  |       |           |                 |
| 6897  | Drake        |       |           |                 |
| 7212  | Davis        |       |           |                 |

---
**Query #2**

    /* TASK 02 */
    SELECT an_id, an_type, an_name, ex_id, ex_date, srv_id
    FROM vt_animals
    LEFT JOIN vt_exam_headers using(an_id)
    LEFT JOIN vt_exam_details using(ex_id);

| an_id | an_type   | an_name         | ex_id | ex_date    | srv_id |
| ----- | --------- | --------------- | ----- | ---------- | ------ |
| 21306 | dog       | Shadow          | 2228  | 2015-04-04 | 398    |
| 21307 | dog       | Buddy           | 2205  | 2015-04-08 | 105    |
| 21307 | dog       | Buddy           | 2205  | 2015-04-08 | 101    |
| 21307 | dog       | Buddy           | 2205  | 2015-04-08 | 602    |
| 21320 | olinguito | Morris          | 2289  | 2015-04-11 | 523    |
| 21320 | olinguito | Morris          | 2290  | 2015-04-11 | 524    |
| 21320 | olinguito | Morris          | 2290  | 2015-04-11 | 613    |
| 21316 | cat       | Etta            | 2300  | 2015-05-08 | 108    |
| 10002 | cat       | Gutsy           | 2352  | 2015-05-12 | 108    |
| 10002 | cat       | Gutsy           | 2352  | 2015-05-12 | 615    |
| 21006 | hamster   | Koshka          | 2389  | 2015-05-20 | 523    |
| 21006 | hamster   | Koshka          | 2389  | 2015-05-20 | 110    |
| 12038 | porcupine | Gutsy           | 2400  | 2015-06-02 | 461    |
| 11028 | bird      |                 | 3002  | 2015-10-02 | 106    |
| 11029 | bird      |                 | 3003  | 2015-10-02 | 106    |
| 16002 | porcupine | Fritz           | 4243  | 2015-06-08 | 461    |
| 16002 | porcupine | Fritz           | 4255  | 2015-07-08 | 461    |
| 21317 | cat       | Manfried        | 4612  | 2015-07-23 | 602    |
| 21317 | cat       | Manfried        | 4612  | 2015-07-23 | 603    |
| 21317 | cat       | Manfried        | 4612  | 2015-07-23 | 606    |
| 21317 | cat       | Manfried        | 4612  | 2015-07-23 | 612    |
| 15002 | turtle    | George          | 4514  | 2015-08-10 | 104    |
| 15002 | turtle    | George          | 4514  | 2015-08-10 | 112    |
| 15002 | turtle    | George          | 4514  | 2015-08-10 | 113    |
| 16002 | porcupine | Fritz           | 4203  | 2015-08-03 | 524    |
| 21001 | hedgehog  | Yoggie          | 4282  | 2015-08-23 | 523    |
| 21001 | hedgehog  | Yoggie          | 4282  | 2015-08-23 | 110    |
| 21001 | hedgehog  | Yoggie          | 4282  | 2015-08-23 | 615    |
| 16002 | porcupine | Fritz           | 4233  | 2015-09-03 | 524    |
| 17002 | porcupine | Fritzchen       | 3105  | 2015-10-10 | 523    |
| 17002 | porcupine | Fritzchen       | 3105  | 2015-10-10 | 110    |
| 17026 | lizard    | 3P#_26          | 3010  | 2015-10-22 | 104    |
| 17026 | lizard    | 3P#_26          | 3010  | 2015-10-22 | 605    |
| 17027 | lizard    | 3P#_25          | 3001  | 2015-10-24 | 104    |
| 17025 | lizard    | 25              | 3202  | 2015-10-03 | 341    |
| 15401 | lizard    | Pinkie          | 3513  | 2015-11-06 | 104    |
| 15401 | lizard    | Pinkie          | 3513  | 2015-11-06 | 110    |
| 16003 | cat       | Ursula          | 3552  | 2015-11-10 | 308    |
| 16003 | cat       | Ursula          | 3552  | 2015-11-10 | 615    |
| 17027 | lizard    | 3P#_25          | 3304  | 2015-11-06 | 341    |
| 17027 | lizard    | 3P#_25          | 3304  | 2015-11-06 | 113    |
| 17025 | lizard    | 25              | 3306  | 2015-11-06 | 104    |
| 17025 | lizard    | 25              | 3306  | 2015-11-06 | 687    |
| 17025 | lizard    | 25              | 3306  | 2015-11-06 | 112    |
| 19845 | dog       | Pinkie          | 3390  | 2015-11-22 | 105    |
| 19845 | dog       | Pinkie          | 3390  | 2015-11-22 | 101    |
| 17025 | lizard    | 25              | 3411  | 2015-12-29 | 341    |
| 17025 | lizard    | 25              | 3412  | 2015-12-30 | 341    |
| 16003 | cat       | Ursula          | 3413  | 2015-12-01 | 308    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 602    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 603    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 604    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 625    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 606    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 607    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 612    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 613    |
| 16003 | cat       | Ursula          | 3612  | 2015-12-23 | 615    |
| 21003 | dog       | Calvin Coolidge | 3392  | 2015-12-26 | 398    |
| 21003 | dog       | Calvin Coolidge | 3392  | 2015-12-26 | 400    |
| 21003 | dog       | Calvin Coolidge | 3392  | 2015-12-26 | 113    |
| 16002 | porcupine | Fritz           | 3393  | 2015-12-23 | 748    |
| 16002 | porcupine | Fritz           | 3393  | 2015-12-23 | 749    |
| 17027 | lizard    | 3P#_25          | 3409  | 2015-12-27 | 104    |
| 21005 | dormouse  | Koshka          | 3486  | 2015-12-31 | 461    |
| 15001 | turtle    | Big Mike        | 4101  | 2016-01-02 | 104    |
| 15001 | turtle    | Big Mike        | 4101  | 2016-01-02 | 615    |
| 15002 | turtle    | George          | 4102  | 2016-01-08 | 104    |
| 16002 | porcupine | Fritz           | 4103  | 2016-01-08 | 461    |
| 12035 | bird      | Mr Peanut       | 3104  | 2016-01-09 | 106    |
| 12035 | bird      | Mr Peanut       | 3104  | 2016-01-09 | 613    |
| 17026 | lizard    | 3P#_26          | 3325  | 2016-01-15 | 104    |
| 17026 | lizard    | 3P#_26          | 3325  | 2016-01-15 | 604    |
| 16003 | cat       | Ursula          | 3420  | 2016-01-01 | 108    |
| 15001 | turtle    | Big Mike        | 3494  | 2016-01-22 | 104    |
| 15001 | turtle    | Big Mike        | 3288  | 2016-01-31 | 104    |
| 15001 | turtle    | Big Mike        | 3288  | 2016-01-31 | 112    |
| 15001 | turtle    | Big Mike        | 3288  | 2016-01-31 | 687    |
| 16002 | porcupine | Fritz           | 3322  | 2016-02-10 | 748    |
| 16002 | porcupine | Fritz           | 3321  | 2016-02-17 | 748    |
| 17025 | lizard    | 25              | 3324  | 2016-02-25 | 104    |
| 17025 | lizard    | 25              | 3324  | 2016-02-25 | 687    |
| 17025 | lizard    | 25              | 3324  | 2016-02-25 | 112    |
| 16002 | porcupine | Fritz           | 3323  | 2016-02-25 | 524    |
| 16002 | porcupine | Fritz           | 3323  | 2016-02-25 | 687    |
| 11015 | bird      | Kenny           |       |            |        |
| 11025 | bird      |                 |       |            |        |
| 15165 | dog       | Burgess         |       |            |        |
| 16043 | dog       | Ursula          |       |            |        |
| 16044 | dog       | Triton          |       |            |        |
| 21002 | hedgehog  | Edger           |       |            |        |
| 21004 | snake     | Gutsy           |       |            |        |
| 21007 | snake     | Pop 22          |       |            |        |
| 21205 | dog       | Manfried        |       |            |        |
| 21305 | dog       | Spot            |       |            |        |
| 21314 | cat       | Adalwine        |       |            |        |
| 21315 | cat       | Baldric         |       |            |        |
| 21318 | cat       | Waldrom         |       |            |        |
| 21321 | olinguito | Morton          |       |            |        |

---
**Query #3**

    /* TASK 03 */
    SELECT cl_id, cl_name_last
    FROM vt_clients
    WHERE cl_id IN(SELECT cl_id
                   FROM vt_animals
                   WHERE an_type NOT IN ('snake', 'lizard', 'turtle', 'chelonian'));

| cl_id | cl_name_last |
| ----- | ------------ |
| 411   | Carter       |
| 1825  | Harris       |
| 1852  | Dalrymple    |
| 3423  | Hawkins      |
| 3560  | Monk         |
| 4087  | Turrentine   |
| 4534  | Montgomery   |
| 5689  | Biederbecke  |
| 5698  | Biederbecke  |
| 5699  | Biederbecke  |
| 6426  | Hawkins      |

---
**Query #4**

    /* TASK 04 */                                     
    SELECT srv_id, srv_list_price, srv_desc, srv_type
    FROM vt_services
    WHERE srv_list_price >= 100 AND srv_id NOT IN (SELECT srv_id
                                                  FROM vt_exam_details);

There are no results to be displayed.

---
**Query #5**

    /* TASK 05 */                                    
    SELECT cl_id, cl_name_last
    FROM vt_clients
    WHERE cl_id NOT IN(SELECT cl_id
                      FROM vt_animals);

| cl_id | cl_name_last |
| ----- | ------------ |
| 254   | Boston       |
| 5686  | Biederbecke  |
| 6897  | Drake        |
| 7212  | Davis        |

---
**Query #6**

    /* TASK 06 */                                     
    SELECT cl_id, cl_name_last
    FROM vt_clients
    WHERE cl_id IN (SELECT cl_id
                    FROM vt_animals
                    WHERE an_type = 'dog') 
    AND cl_id IN (SELECT cl_id
                  FROM vt_animals
                  WHERE an_type IN('snake', 'lizard', 'turtle', 'chelonian'));

| cl_id | cl_name_last |
| ----- | ------------ |
| 411   | Carter       |

---
**Query #7**

    /* TASK 07 */                               
    SELECT cl_id, cl_name_last
    FROM vt_clients                               
    WHERE cl_id IN (SELECT cl_id
                    FROM vt_animals
                    WHERE an_type = 'dog') 
    AND cl_id NOT IN (SELECT cl_id
                  FROM vt_animals
                  WHERE an_type IN('snake', 'lizard', 'turtle', 'chelonian'));

| cl_id | cl_name_last |
| ----- | ------------ |
| 1825  | Harris       |
| 4087  | Turrentine   |
| 5689  | Biederbecke  |
| 6426  | Hawkins      |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/pKaHfoDBuZUUXKPRz8qyCL/0)
 */



