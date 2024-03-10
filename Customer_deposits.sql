CREATE TABLE cb_customer_deposits (
    id                 NUMBER
        GENERATED ALWAYS AS IDENTITY
    PRIMARY KEY,
    customer_id        NUMBER,
    deposit_product_id NUMBER,
    contract_no        VARCHAR2(30),
    deposit_amount     NUMBER(22, 2),
    profit_amount      NUMBER(22, 2),
    start_date         DATE
);

CREATE OR REPLACE PROCEDURE cb_customer_deposits_insert (
    p_customer_id        NUMBER,
    p_deposit_product_id NUMBER,
    p_contract_no        VARCHAR2,
    p_deposit_amount     NUMBER,
    p_profit_amount      NUMBER,
    p_start_date         DATE
) IS
BEGIN
    INSERT INTO cb_customer_deposits (
        customer_id,
        deposit_product_id,
        contract_no,
        deposit_amount,
        profit_amount,
        start_date
    ) VALUES (
        p_customer_id,
        p_deposit_product_id,
        p_contract_no,
        p_deposit_amount,
        p_profit_amount,
        p_start_date
    );

    COMMIT;
END;

CREATE OR REPLACE PROCEDURE cb_customer_deposits_update (
    p_id                 NUMBER,
    p_customer_id        NUMBER DEFAULT NULL,
    p_deposit_product_id NUMBER DEFAULT NULL,
    p_contract_no        VARCHAR2 DEFAULT NULL,
    p_deposit_amount     NUMBER DEFAULT NULL,
    p_profit_amount      NUMBER DEFAULT NULL,
    p_start_date         DATE DEFAULT NULL
) IS
BEGIN
    UPDATE cb_customer_deposits
    SET
        customer_id = nvl(p_customer_id, customer_id),
        deposit_product_id = nvl(p_deposit_product_id, deposit_product_id),
        contract_no = nvl(p_contract_no, contract_no),
        deposit_amount = nvl(p_deposit_amount, deposit_amount),
        profit_amount = nvl(p_profit_amount, profit_amount),
        start_date = nvl(p_start_date, start_date)
    WHERE
        id = p_id;

    COMMIT;
END;