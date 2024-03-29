select
    cast(h.claim_id as String) as claim_id
    ,cast(d.line_no as int) as claim_line_number
    ,cast(h.member_id as String) as patient_id
    ,cast(h.service_start_dt as date) as claim_start_date
    ,cast(h.service_end_dt as date) as claim_end_date
    ,cast(h.admit_dt as date) as admission_date
    ,cast(h.discharge_dt as date) as discharge_date
    ,cast(d.service_start_dt as date) as claim_line_start_date
    ,cast(d.service_end_dt as date) as claim_line_end_date
--    ,cast(h.claim_type_cd as String) as claim_type
    ,cast(h.Principal_Diagnosis_Cd as String) as principal_diagnosis_cd
    ,cast(h.bill_type_cd as String) as bill_type_code
    ,case 
      when place_of_service_cd = '  ' then '00'
      when place_of_service_cd = '1 ' then '01'
      when place_of_service_cd = '1'  then '01'
      when place_of_service_cd = '2 ' then '02'
      when place_of_service_cd = '2'  then '02'
      when place_of_service_cd = '3 ' then '03'
      when place_of_service_cd = '3'  then '03'
      when place_of_service_cd = '8 ' then '08'
      else place_of_service_cd 
    end as place_of_service_code
--    ,cast(d.place_of_service_cd as String) as place_of_service_code
    ,cast(d.revenue_cd as String) as revenue_center_code
    ,case 
      when place_of_service_cd is not null and place_of_service_cd != '  ' then 'P'
      when d.revenue_cd is not null then 'I'
      when h.bill_type_cd is not null then 'I'
      when d.revenue_cd is not null and h.bill_type_cd is not null then 'I'
    end as claim_type 
    ,cast(h.admit_source_cd as String) as admit_source_code
    ,cast(h.admit_type_cd as String) as admit_type_code
    ,cast(h.discharge_status_cd as String) as discharge_disposition_code
    ,cast(drg.msdrg_cd as String) as ms_drg
    ,cast(d.service_qty as int) as service_unit_quantity
    ,cast(d.cpt4_cd as String) as hcpcs_code
    ,cast(d.cpt4_mod1_cd as String) as hcpcs_modifier_1
    ,cast(d.cpt4_mod2_cd as String) as hcpcs_modifier_2
    ,cast(d.cpt4_mod3_cd as String) as hcpcs_modifier_3
    ,cast(d.cpt4_mod4_cd as String) as hcpcs_modifier_4
    ,cast(null as String) as hcpcs_modifier_5
    ,cast(d.service_provider_id as String) as physician_npi
    ,cast(d.service_provider_id as String) as facility_npi
    ,cast(h.paid_dt as date) as paid_date
    ,cast(d.plan_paid_amt as float64) as paid_amount
    ,cast(d.charge_amt as float64) as charge_amount
    ,cast((d.Plan_Covered_Amt + d.Member_Liability_Amt) as float64) as allowed_amount
    ,cast(null as String) as adjustment_type_code
    ,cast(dx.diagnosis_code_1 as String) as diagnosis_code_1
    ,cast(dx.diagnosis_code_2 as String) as diagnosis_code_2
    ,cast(dx.diagnosis_code_3 as String) as diagnosis_code_3
    ,cast(dx.diagnosis_code_4 as String) as diagnosis_code_4
    ,cast(dx.diagnosis_code_5 as String) as diagnosis_code_5
    ,cast(dx.diagnosis_code_6 as String) as diagnosis_code_6
    ,cast(dx.diagnosis_code_7 as String) as diagnosis_code_7
    ,cast(dx.diagnosis_code_8 as String) as diagnosis_code_8
    ,cast(dx.diagnosis_code_9 as String) as diagnosis_code_9
    ,cast(dx.diagnosis_code_10 as String) as diagnosis_code_10
    ,cast(dx.diagnosis_code_11 as String) as diagnosis_code_11
    ,cast(dx.diagnosis_code_12 as String) as diagnosis_code_12
    ,cast(dx.diagnosis_code_13 as String) as diagnosis_code_13
    ,cast(dx.diagnosis_code_14 as String) as diagnosis_code_14
    ,cast(dx.diagnosis_code_15 as String) as diagnosis_code_15
    ,cast(dx.diagnosis_code_16 as String) as diagnosis_code_16
    ,cast(dx.diagnosis_code_17 as String) as diagnosis_code_17
    ,cast(dx.diagnosis_code_18 as String) as diagnosis_code_18
    ,cast(dx.diagnosis_code_19 as String) as diagnosis_code_19
    ,cast(dx.diagnosis_code_20 as String) as diagnosis_code_20
    ,cast(dx.diagnosis_code_21 as String) as diagnosis_code_21
    ,cast(dx.diagnosis_code_22 as String) as diagnosis_code_22
    ,cast(dx.diagnosis_code_23 as String) as diagnosis_code_23
    ,cast(dx.diagnosis_code_24 as String) as diagnosis_code_24
    ,cast(dx.diagnosis_code_25 as String) as diagnosis_code_25
    ,cast(dx.diagnosis_poa_1 as String) as diagnosis_poa_1
    ,cast(dx.diagnosis_poa_2 as String) as diagnosis_poa_2
    ,cast(dx.diagnosis_poa_3 as String) as diagnosis_poa_3
    ,cast(dx.diagnosis_poa_4 as String) as diagnosis_poa_4
    ,cast(dx.diagnosis_poa_5 as String) as diagnosis_poa_5
    ,cast(dx.diagnosis_poa_6 as String) as diagnosis_poa_6
    ,cast(dx.diagnosis_poa_7 as String) as diagnosis_poa_7
    ,cast(dx.diagnosis_poa_8 as String) as diagnosis_poa_8
    ,cast(dx.diagnosis_poa_9 as String) as diagnosis_poa_9
    ,cast(dx.diagnosis_poa_10 as String) as diagnosis_poa_10
    ,cast(dx.diagnosis_poa_11 as String) as diagnosis_poa_11
    ,cast(dx.diagnosis_poa_12 as String) as diagnosis_poa_12
    ,cast(dx.diagnosis_poa_13 as String) as diagnosis_poa_13
    ,cast(dx.diagnosis_poa_14 as String) as diagnosis_poa_14
    ,cast(dx.diagnosis_poa_15 as String) as diagnosis_poa_15
    ,cast(dx.diagnosis_poa_16 as String) as diagnosis_poa_16
    ,cast(dx.diagnosis_poa_17 as String) as diagnosis_poa_17
    ,cast(dx.diagnosis_poa_18 as String) as diagnosis_poa_18
    ,cast(dx.diagnosis_poa_19 as String) as diagnosis_poa_19
    ,cast(dx.diagnosis_poa_20 as String) as diagnosis_poa_20
    ,cast(dx.diagnosis_poa_21 as String) as diagnosis_poa_21
    ,cast(dx.diagnosis_poa_22 as String) as diagnosis_poa_22
    ,cast(dx.diagnosis_poa_23 as String) as diagnosis_poa_23
    ,cast(dx.diagnosis_poa_24 as String) as diagnosis_poa_24
    ,cast(dx.diagnosis_poa_25 as String) as diagnosis_poa_25
    ,cast(dx.icd_vers_flag as String) as diagnosis_code_type
    ,cast(px.icd_vers_flag as String) as procedure_code_type
    ,cast(px.procedure_code_1 as String) as procedure_code_1
    ,cast(px.procedure_code_2 as String) as procedure_code_2
    ,cast(px.procedure_code_3 as String) as procedure_code_3
    ,cast(px.procedure_code_4 as String) as procedure_code_4
    ,cast(px.procedure_code_5 as String) as procedure_code_5
    ,cast(px.procedure_code_6 as String) as procedure_code_6
    ,cast(px.procedure_code_7 as String) as procedure_code_7
    ,cast(px.procedure_code_8 as String) as procedure_code_8
    ,cast(px.procedure_code_9 as String) as procedure_code_9
    ,cast(px.procedure_code_10 as String) as procedure_code_10
    ,cast(px.procedure_code_11 as String) as procedure_code_11
    ,cast(px.procedure_code_12 as String) as procedure_code_12
    ,cast(px.procedure_code_13 as String) as procedure_code_13
    ,cast(px.procedure_code_14 as String) as procedure_code_14
    ,cast(px.procedure_code_15 as String) as procedure_code_15
    ,cast(px.procedure_code_16 as String) as procedure_code_16
    ,cast(px.procedure_code_17 as String) as procedure_code_17
    ,cast(px.procedure_code_18 as String) as procedure_code_18
    ,cast(px.procedure_code_19 as String) as procedure_code_19
    ,cast(px.procedure_code_20 as String) as procedure_code_20
    ,cast(px.procedure_code_21 as String) as procedure_code_21
    ,cast(px.procedure_code_22 as String) as procedure_code_22
    ,cast(px.procedure_code_23 as String) as procedure_code_23
    ,cast(px.procedure_code_24 as String) as procedure_code_24
    ,cast(px.procedure_code_25 as String) as procedure_code_25
    ,cast(px.procedure_date_1 as date) as procedure_date_1
    ,cast(px.procedure_date_2 as date) as procedure_date_2
    ,cast(px.procedure_date_3 as date) as procedure_date_3
    ,cast(px.procedure_date_4 as date) as procedure_date_4
    ,cast(px.procedure_date_5 as date) as procedure_date_5
    ,cast(px.procedure_date_6 as date) as procedure_date_6
    ,cast(px.procedure_date_7 as date) as procedure_date_7
    ,cast(px.procedure_date_8 as date) as procedure_date_8
    ,cast(px.procedure_date_9 as date) as procedure_date_9
    ,cast(px.procedure_date_10 as date) as procedure_date_10
    ,cast(px.procedure_date_11 as date) as procedure_date_11
    ,cast(px.procedure_date_12 as date) as procedure_date_12
    ,cast(px.procedure_date_13 as date) as procedure_date_13
    ,cast(px.procedure_date_14 as date) as procedure_date_14
    ,cast(px.procedure_date_15 as date) as procedure_date_15
    ,cast(px.procedure_date_16 as date) as procedure_date_16
    ,cast(px.procedure_date_17 as date) as procedure_date_17
    ,cast(px.procedure_date_18 as date) as procedure_date_18
    ,cast(px.procedure_date_19 as date) as procedure_date_19
    ,cast(px.procedure_date_20 as date) as procedure_date_20
    ,cast(px.procedure_date_21 as date) as procedure_date_21
    ,cast(px.procedure_date_22 as date) as procedure_date_22
    ,cast(px.procedure_date_23 as date) as procedure_date_23
    ,cast(px.procedure_date_24 as date) as procedure_date_24
    ,cast(px.procedure_date_25 as date) as procedure_date_25
from {{ source('COAPCD', 'Medical_Claims_Header') }}  h
inner join {{ source('COAPCD', 'medical_claims_line') }} d
	on d.claim_id = h.claim_id and d.member_id = h.member_id
left join {{ ref('procedure_pivot')}} px
	on h.claim_id = px.claim_id
left join {{ ref('diagnosis_pivot')}} dx
	on h.claim_id = dx.claim_id
left join {{ source('COAPCD', 'Claim_Level_Value_Add_DRG') }} drg
	on h.claim_id = drg.claim_id
where h.claim_id not in (
    select distinct claim_id from (
        select distinct h.claim_id ,   cast(h.claim_id as String) || '-' ||cast(d.line_no as int) as unique_number, count(*) as c
        from {{ source('COAPCD', 'Medical_Claims_Header') }} h
        inner join {{ source('COAPCD', 'medical_claims_line') }} d
            on d.claim_id = h.claim_id and d.member_id = h.member_id
        left join {{ ref('procedure_pivot')}} px
            on h.claim_id = px.claim_id
        left join {{ ref('diagnosis_pivot')}} dx
            on h.claim_id = dx.claim_id
        left join {{ source('COAPCD', 'Claim_Level_Value_Add_DRG') }} drg
            on h.claim_id = drg.claim_id
        group by h.claim_id, unique_number
        having c > 1
        and unique_number is not null
        ) as dupes
)