CREATE TABLE cb_deposit_products (
    id            NUMBER
        GENERATED ALWAYS AS IDENTITY
    PRIMARY KEY,
    currency_id   NUMBER,
    product_name  VARCHAR2(100),
    term          NUMBER(4),
    interest_rate NUMBER(10, 2)
);

CREATE OR REPLACE PROCEDURE cb_deposit_products_insert (
    p_currency_id   NUMBER,
    p_product_name  VARCHAR2,
    p_term          NUMBER,
    p_interest_rate NUMBER
) IS
BEGIN
    INSERT INTO cb_deposit_products (
        currency_id,
        product_name,
        term,
        interest_rate
    ) VALUES (
        p_currency_id,
        p_product_name,
        p_term,
        p_interest_rate
    );

    COMMIT;
END;

CREATE OR REPLACE PROCEDURE cb_deposit_products_update (
    p_id            NUMBER,
    p_currency_id   NUMBER DEFAULT NULL,
    p_product_name  VARCHAR2 DEFAULT NULL,
    p_term          NUMBER DEFAULT NULL,
    p_interest_rate NUMBER DEFAULT NULL
) IS
BEGIN
    UPDATE cb_deposit_products
    SET
        currency_id = nvl(p_currency_id, currency_id),
        product_name = nvl(p_product_name, product_name),
        term = nvl(p_term, term),
        interest_rate = nvl(p_interest_rate, interest_rate)
    WHERE
        id = p_id;

    COMMIT;
END;
