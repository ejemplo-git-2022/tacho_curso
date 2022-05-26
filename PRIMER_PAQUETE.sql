create or replace PACKAGE primer_paquete IS
    PROCEDURE ejemplo1(ID_EMPLEADO employees.employee_id%TYPE);
    FUNCTION ejemplo2(ID_EMPLEADO employees.employee_id%TYPE) RETURN employees.salary%TYPE;
END primer_paquete;