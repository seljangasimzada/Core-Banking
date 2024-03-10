DROP TABLE cb_customers;

CREATE TABLE cb_customers (
    id         NUMBER
        GENERATED ALWAYS AS IDENTITY
    PRIMARY KEY,
    first_name VARCHAR2(30),
    last_name  VARCHAR2(30),
    birth_date DATE,
    gender     CHAR(1)
);

CREATE OR REPLACE PROCEDURE cb_customers_insert (
    p_first_name VARCHAR2,
    p_last_name  VARCHAR2,
    p_birth_date DATE,
    p_gender     CHAR
) IS
BEGIN
    INSERT INTO cb_customers (
        first_name,
        last_name,
        birth_date,
        gender
    ) VALUES (
        p_first_name,
        p_last_name,
        p_birth_date,
        p_gender
    );

    COMMIT;
END;

CREATE OR REPLACE PROCEDURE cb_customers_update (
    p_id         NUMBER,
    p_first_name VARCHAR2 DEFAULT NULL,
    p_last_name  VARCHAR2 DEFAULT NULL,
    p_birth_date DATE DEFAULT NULL,
    p_gender     CHAR DEFAULT NULL,
    p_result     OUT VARCHAR2
) IS
BEGIN
    UPDATE cb_customers
    SET
        first_name = nvl(p_first_name, first_name),
        last_name = nvl(p_last_name, last_name),
        birth_date = nvl(p_birth_date, birth_date),
        gender = nvl(p_gender, gender)
    WHERE
        id = p_id;

    IF SQL%rowcount = 0 THEN
        p_result := 'Not found  any data by id ' || p_id;
    END IF;
    COMMIT;
END;