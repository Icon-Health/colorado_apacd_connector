with diagnois_pivot as(
  select 
      *
  from 
      (select 
        claim_id
        ,dx_cd
        ,icd_seq_num
        ,icd_vers_flag
      from {{ source('COAPCD', 'Medical_Claims_Dx') }}
      )
  pivot(
      max(dx_cd) for icd_seq_num in (1 as diagnosis_code_1
                                              , 2 as diagnosis_code_2
                                              , 3 as diagnosis_code_3
                                              , 4 as diagnosis_code_4
                                              , 5 as diagnosis_code_5
                                              , 6 as diagnosis_code_6
                                              , 7 as diagnosis_code_7
                                              , 8 as diagnosis_code_8
                                              , 9 as diagnosis_code_9
                                              , 10 as diagnosis_code_10
                                              , 11 as diagnosis_code_11
                                              , 12 as diagnosis_code_12
                                              , 13 as diagnosis_code_13
                                              , 14 as diagnosis_code_14
                                              , 15 as diagnosis_code_15
                                              , 16 as diagnosis_code_16
                                              , 17 as diagnosis_code_17
                                              , 18 as diagnosis_code_18
                                              , 19 as diagnosis_code_19
                                              , 20 as diagnosis_code_20
                                              , 21 as diagnosis_code_21
                                              , 22 as diagnosis_code_22
                                              , 23 as diagnosis_code_23
                                              , 24 as diagnosis_code_24
                                              , 25 as diagnosis_code_25
                                              )
    )piv
)
, poa_pivot as(
  select 
    *
  from 
      (select 
        claim_id
        ,poa_cd
        ,poa_seq_num
      from {{ source('COAPCD', 'Medical_Claims_Dx') }}
      )
  pivot(
      max(poa_cd) for poa_seq_num in (1 as diagnosis_poa_1
                                              , 2 as diagnosis_poa_2
                                              , 3 as diagnosis_poa_3
                                              , 4 as diagnosis_poa_4
                                              , 5 as diagnosis_poa_5
                                              , 6 as diagnosis_poa_6
                                              , 7 as diagnosis_poa_7
                                              , 8 as diagnosis_poa_8
                                              , 9 as diagnosis_poa_9
                                              , 10 as diagnosis_poa_10
                                              , 11 as diagnosis_poa_11
                                              , 12 as diagnosis_poa_12
                                              , 13 as diagnosis_poa_13
                                              , 14 as diagnosis_poa_14
                                              , 15 as diagnosis_poa_15
                                              , 16 as diagnosis_poa_16
                                              , 17 as diagnosis_poa_17
                                              , 18 as diagnosis_poa_18
                                              , 19 as diagnosis_poa_19
                                              , 20 as diagnosis_poa_20
                                              , 21 as diagnosis_poa_21
                                              , 22 as diagnosis_poa_22
                                              , 23 as diagnosis_poa_23
                                              , 24 as diagnosis_poa_24
                                              , 25 as diagnosis_poa_25
                                              )
    )piv
)
, final as(
  select dx.claim_id
    ,dx.icd_vers_flag
    ,dx.diagnosis_code_1
    ,dx.diagnosis_code_2
    ,dx.diagnosis_code_3
    ,dx.diagnosis_code_4
    ,dx.diagnosis_code_5
    ,dx.diagnosis_code_6
    ,dx.diagnosis_code_7
    ,dx.diagnosis_code_8
    ,dx.diagnosis_code_9
    ,dx.diagnosis_code_10
    ,dx.diagnosis_code_11
    ,dx.diagnosis_code_12
    ,dx.diagnosis_code_13
    ,dx.diagnosis_code_14
    ,dx.diagnosis_code_15
    ,dx.diagnosis_code_16
    ,dx.diagnosis_code_17
    ,dx.diagnosis_code_18
    ,dx.diagnosis_code_19
    ,dx.diagnosis_code_20
    ,dx.diagnosis_code_21
    ,dx.diagnosis_code_22
    ,dx.diagnosis_code_23
    ,dx.diagnosis_code_24
    ,dx.diagnosis_code_25
    ,poa.diagnosis_poa_1
    ,poa.diagnosis_poa_2
    ,poa.diagnosis_poa_3
    ,poa.diagnosis_poa_4
    ,poa.diagnosis_poa_5
    ,poa.diagnosis_poa_6
    ,poa.diagnosis_poa_7
    ,poa.diagnosis_poa_8
    ,poa.diagnosis_poa_9
    ,poa.diagnosis_poa_10
    ,poa.diagnosis_poa_11
    ,poa.diagnosis_poa_12
    ,poa.diagnosis_poa_13
    ,poa.diagnosis_poa_14
    ,poa.diagnosis_poa_15
    ,poa.diagnosis_poa_16
    ,poa.diagnosis_poa_17
    ,poa.diagnosis_poa_18
    ,poa.diagnosis_poa_19
    ,poa.diagnosis_poa_20
    ,poa.diagnosis_poa_21
    ,poa.diagnosis_poa_22
    ,poa.diagnosis_poa_23
    ,poa.diagnosis_poa_24
    ,poa.diagnosis_poa_25
  from diagnois_pivot dx
    inner join poa_pivot poa
    on dx.claim_id = poa.claim_id
)

select * from final
