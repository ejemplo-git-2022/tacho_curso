DECLARE
    CURSOR c_empleado(p_sueldo NUMBER) IS select employee_id, first_name, last_name, salary from employees where salary >= p_sueldo;
    v_full_name VARCHAR2(200);
    v_employee_id employees.employee_id%type;
    v_first_name employees.first_name%type;
    v_last_name employees.last_name%type;
    v_salary employees.salary%type;    
BEGIN
    OPEN c_empleado(6500);
    FETCH c_empleado INTO v_employee_id, v_first_name, v_last_name, v_salary;
    WHILE c_empleado%FOUND
        LOOP
            DBMS_OUTPUT.PUT_LINE(v_first_name);            
            DELETE FROM empleados_que_ganan_mucho WHERE employee_id = v_employee_id;

            IF v_salary > 17000 THEN
                DBMS_OUTPUT.PUT_LINE('El emeplado gana mucha plata... ' || v_salary);
                v_full_name :=  v_first_name || ' ' || v_last_name;
                INSERT INTO empleados_que_ganan_mucho (employee_id, full_name, salary) VALUES (v_employee_id, v_full_name, v_salary);
            END IF;
            DBMS_OUTPUT.PUT_LINE('*************************');
            FETCH c_empleado INTO v_employee_id, v_first_name, v_last_name, v_salary;
        END LOOP;
    CLOSE c_empleado;
end;

CREATE TABLE empleados_que_ganan_mucho(employee_id  NUMBER(6) PRIMARY KEY, full_name VARCHAR2(200) NOT NULL, salary NUMBER(8,2) NOT NULL);

select * from empleados_que_ganan_mucho;
