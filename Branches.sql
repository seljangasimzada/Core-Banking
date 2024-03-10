CREATE TABLE cb_branches (
    id      NUMBER
        GENERATED ALWAYS AS IDENTITY
    PRIMARY KEY,
    name    VARCHAR2(30),
    address VARCHAR2(30)
);

CREATE OR REPLACE PROCEDURE cb_branches_insert (
    p_name    VARCHAR2,
    p_address VARCHAR2
) IS
BEGIN
    INSERT INTO cb_branches (
        name,
        address
    ) VALUES (
        p_name,
        p_address
    );

    COMMIT;
END;

CREATE OR REPLACE PROCEDURE cb_branches_update (
    p_id      NUMBER,
    p_name    VARCHAR2 DEFAULT NULL,
    p_address VARCHAR2 DEFAULT NULL
) IS
BEGIN
    UPDATE cb_branches
    SET
        name = nvl(p_name, name),
        address = nvl(p_address, address)
    WHERE
        id = p_id;

    COMMIT;
END;