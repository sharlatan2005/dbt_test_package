{% test primary_key_list_not_null(model, primary_key_list) %}

    SELECT *
    FROM (
        {{ model }}
    )
    WHERE
    {% for attribute in primary_key_list -%}
        {{attribute}} is null {% if not loop.last -%} or {% endif -%}
    {% endfor -%}
{% endtest %}