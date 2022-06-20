select 
	distinct cast(e.member_id as String) as patient_id
    ,cast(d.member_gender_cd as String) as gender
    ,cast((d.member_dob_year||"-01-01") as datetime) as birth_date
    ,cast(d.race_1_cd as String) as race
    ,cast(d.member_zip_cd as String) as zip_code
    ,cast(d.Member_state_cd as String) as state
    ,null as deceased_flag
    ,cast(null as datetime) as death_date
    ,cast(d.payer_cd as String) as payer
    ,cast(max(e.line_of_business_cd) as String) as payer_type
    ,cast(null as String) as dual_status
    ,cast(null as String) as medicare_status
    ,cast(min(e.eligibility_month) as int) as month
    ,cast(min(extract(year from e.eligibility_dt)) as int) as year
from {{ var('member_eligibility')}} e
inner join {{ var('member_demographics')}} d
	on e.member_id = d.member_id
where d.member_id is not null
group by patient_id, member_gender_cd, member_dob_year, race_1_cd, member_zip_cd, Member_state_cd, payer_cd