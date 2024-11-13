-- SNAPSHOT_DATE не должна быть больше сегодняшней даты
{% test dds_source_snpt_date_correct(model, column_name, date_load) %} 
    select {{ column_name }} from {{ model }}
    where {{ column_name }} > TO_DATE('{{ date_load }}', 'YYYY-MM-DD')
{% endtest %}