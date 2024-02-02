# PostgreSQL Note

[list-constraints.sql](./list-constraints.sql)

[list-field-type.sql](./list-field-type.sql)


### Drop all unique constraints in <schema name>
```sql
DO $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN SELECT nsp.nspname AS namespace, relname AS table_name, conname AS constaint, cons.contype
           FROM pg_catalog.pg_constraint cons
           JOIN pg_catalog.pg_class cls ON cls.oid = cons.conrelid
           JOIN pg_catalog.pg_namespace nsp ON nsp.oid = cls.relnamespace
           WHERE cons.contype = 'u'
           AND nsp.nspname = '<schema name>'
  LOOP
    EXECUTE 'ALTER TABLE ' || quote_ident(r.namespace) || '.' || quote_ident(r.table_name) ||
            ' DROP CONSTRAINT  ' || quote_ident(r.constaint) || ' CASCADE';
  END LOOP;
END$$;
```
