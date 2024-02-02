SELECT nsp.nspname, relname, conname, contype
   FROM pg_catalog.pg_constraint cons
   JOIN pg_catalog.pg_class cls ON cls.oid = cons.conrelid
   JOIN pg_catalog.pg_namespace nsp ON nsp.oid = cls.relnamespace
WHERE nsp.nspname NOT IN ('pg_catalog', 'information_schema')
AND nsp.nspname = <schema name>' AND relname = '<table name>'


-- The contype column in the pg_constraint table of the PostgreSQL catalog represents the type of constraint. Each value corresponds to a different type of constraint:
-- c = Check constraint
-- f = Foreign key constraint
-- p = Primary key constraint
-- u = Unique constraint
-- t = Constraint trigger
-- x = Exclusion constraint
