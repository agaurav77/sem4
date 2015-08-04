SET SERVEROUTPUT ON;
DECLARE
  CURSOR C IS (SELECT * FROM DEPT);
  S NUMBER;
BEGIN
  FOR X IN C
  LOOP
    -- FIND TOTAL SALARY
    S := DEPT_SAL(X.DEPTNO);
    
    -- CHECK
    DBMS_OUTPUT.PUT_LINE('S = ' || S);
    IF (S < 10000) THEN
      DBMS_OUTPUT.PUT_LINE('GOING FOR IT');
      FOR Y IN (SELECT * FROM MYEMP WHERE DEPTNO = X.DEPTNO)
      LOOP
        UPDATE MYEMP SET SALARY = 1.1*Y.SALARY WHERE EMPNO = Y.EMPNO;
      END LOOP;
    END IF;
    
  END LOOP;
END;