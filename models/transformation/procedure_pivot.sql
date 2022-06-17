with procedure_pivot as(
  select 
      *
  from 
      (select 
          claim_id
          ,procedure_cd
          ,seq_num
          ,icd_vers_flag
       from {{ var('medical_claims_procedures')}}
       )
  pivot(
      max(procedure_cd) for seq_num in (1 as procedure_code_1
                                                , 2 as procedure_code_2
                                                , 3 as procedure_code_3
                                                , 4 as procedure_code_4
                                                , 5 as procedure_code_5
                                                , 6 as procedure_code_6
                                                , 7 as procedure_code_7
                                                , 8 as procedure_code_8
                                                , 9 as procedure_code_9
                                                , 10 as procedure_code_10
                                                , 11 as procedure_code_11
                                                , 12 as procedure_code_12
                                                , 13 as procedure_code_13
                                                , 14 as procedure_code_14
                                                , 15 as procedure_code_15
                                                , 16 as procedure_code_16
                                                , 17 as procedure_code_17
                                                , 18 as procedure_code_18
                                                , 19 as procedure_code_19
                                                , 20 as procedure_code_20
                                                , 21 as procedure_code_21
                                                , 22 as procedure_code_22
                                                , 23 as procedure_code_23
                                                , 24 as procedure_code_24
                                                , 25 as procedure_code_25
                                                )
    )piv
)
, date_pivot as(
  select 
  *
  from 
      (select 
          claim_id
          ,procedure_dt
          ,seq_num
       from {{ var('medical_claims_procedures')}}
       )
  pivot(
      max(procedure_dt) for seq_num in (1 as procedure_date_1
                                                      , 2 as procedure_date_2
                                                      , 3 as procedure_date_3
                                                      , 4 as procedure_date_4
                                                      , 5 as procedure_date_5
                                                      , 6 as procedure_date_6
                                                      , 7 as procedure_date_7
                                                      , 8 as procedure_date_8
                                                      , 9 as procedure_date_9
                                                      , 10 as procedure_date_10
                                                      , 11 as procedure_date_11
                                                      , 12 as procedure_date_12
                                                      , 13 as procedure_date_13
                                                      , 14 as procedure_date_14
                                                      , 15 as procedure_date_15
                                                      , 16 as procedure_date_16
                                                      , 17 as procedure_date_17
                                                      , 18 as procedure_date_18
                                                      , 19 as procedure_date_19
                                                      , 20 as procedure_date_20
                                                      , 21 as procedure_date_21
                                                      , 22 as procedure_date_22
                                                      , 23 as procedure_date_23
                                                      , 24 as procedure_date_24
                                                      , 25 as procedure_date_25
                                                      )
            )piv
  )
  
select
  px.claim_id
  ,px.icd_vers_flag
  ,px.procedure_code_1
  ,px.procedure_code_2
  ,px.procedure_code_3
  ,px.procedure_code_4
  ,px.procedure_code_5
  ,px.procedure_code_6
  ,px.procedure_code_7
  ,px.procedure_code_8
  ,px.procedure_code_9
  ,px.procedure_code_10
  ,px.procedure_code_11
  ,px.procedure_code_12
  ,px.procedure_code_13
  ,px.procedure_code_14
  ,px.procedure_code_15
  ,px.procedure_code_16
  ,px.procedure_code_17
  ,px.procedure_code_18
  ,px.procedure_code_19
  ,px.procedure_code_20
  ,px.procedure_code_21
  ,px.procedure_code_22
  ,px.procedure_code_23
  ,px.procedure_code_24
  ,px.procedure_code_25
  ,d.procedure_date_1
  ,d.procedure_date_2
  ,d.procedure_date_3
  ,d.procedure_date_4
  ,d.procedure_date_5
  ,d.procedure_date_6
  ,d.procedure_date_7
  ,d.procedure_date_8
  ,d.procedure_date_9
  ,d.procedure_date_10
  ,d.procedure_date_11
  ,d.procedure_date_12
  ,d.procedure_date_13
  ,d.procedure_date_14
  ,d.procedure_date_15
  ,d.procedure_date_16
  ,d.procedure_date_17
  ,d.procedure_date_18
  ,d.procedure_date_19
  ,d.procedure_date_20
  ,d.procedure_date_21
  ,d.procedure_date_22
  ,d.procedure_date_23
  ,d.procedure_date_24
  ,d.procedure_date_25
from procedure_pivot px
inner join date_pivot d
	on px.claim_id = d.claim_id