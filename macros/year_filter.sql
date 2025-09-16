{% macro year_filter(column_name, year_offset=0) %}
    YEAR({{ column_name }}) = 2018 + {{ year_offset }}
{% endmacro %}