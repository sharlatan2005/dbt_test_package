-- DLT_FLAG должен принимать значения 'I', 'U', 'D' и только их
{% test dds_source_dlt_stat_correct(model, column_name) %}
    select {{ column_name }} from {{ model }}
    where UPPER({{ column_name }}) not in ('I', 'U', 'D')
{% endtest %}