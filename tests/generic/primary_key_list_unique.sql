{% test primary_key_list_unique(model, primary_key_list) %}
    SELECT 
    {% for attribute in primary_key_list -%}
        {{ attribute }} {% if not loop.last %},{% endif %}
    {% endfor %}
    , COUNT(*)
    FROM {{ model }} 
    GROUP BY     
    {% for attribute in primary_key_list -%}
        {{ attribute }} {% if not loop.last %},{% endif %}
    {% endfor %}
    HAVING COUNT(*) > 1
{% endtest %}