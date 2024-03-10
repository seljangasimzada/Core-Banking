CREATE TABLE cb_currencies (
    id   NUMBER
        GENERATED ALWAYS AS IDENTITY
    PRIMARY KEY,
    name VARCHAR2(30),
    code VARCHAR2(30)
);

CREATE OR REPLACE PROCEDURE cb_currencies_insert (
    p_name VARCHAR2,
    p_code VARCHAR2
) IS
BEGIN
    INSERT INTO cb_currencies (
        name,
        code
    ) VALUES (
        p_name,
        p_code
    );

    COMMIT;
END;

CREATE OR REPLACE PROCEDURE cb_currencies_update (
    p_id   NUMBER,
    p_name VARCHAR2 DEFAULT NULL,
    p_code VARCHAR2 DEFAULT NULL
) IS
BEGIN
    UPDATE cb_currencies
    SET
        name = nvl(p_name, name),
        code = nvl(p_code, code)
    WHERE
        id = p_id;

    COMMIT;
END;
    