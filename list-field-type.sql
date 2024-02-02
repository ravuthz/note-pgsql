SELECT table_schema, table_name, column_name, data_type, column_default
FROM information_schema.columns
WHERE table_catalog = '<calalog name>'
    AND table_schema NOT IN ('pg_catalog', 'information_schema')
    AND data_type IN ('boolean', 'ARRAY', 'uuid')
   OR (data_type = 'date' AND column_default::varchar NOT IN ('uuid_generate_v4()', 'false', '0', 'true', '1'))
ORDER BY table_schema, table_name;
