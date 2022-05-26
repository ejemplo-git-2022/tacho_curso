create or replace PACKAGE BODY primer_paquete IS
    PROCEDURE ejemplo1(ID_EMPLEADO employees.employee_id%TYPE) IS
        r_empleado employees%ROWTYPE;
    BEGIN
        SELECT * INTO r_empleado FROM employees WHERE employee_id = ID_EMPLEADO;
        DBMS_OUTPUT.PUT_LINE(r_empleado.first_name || ' ' || r_empleado.last_name);
    END ejemplo1;

    FUNCTION ejemplo2(ID_EMPLEADO employees.employee_id%TYPE) 
        RETURN employees.salary%TYPE
    IS
        v_salario employees.salary%TYPE;
    BEGIN
        SELECT salary INTO v_salario FROM  employees WHERE employee_id = ID_EMPLEADO;
        RETURN v_salario;
    END ejemplo2;
END primer_paquete;