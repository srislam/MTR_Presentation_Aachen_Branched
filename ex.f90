PROGRAM TEST
IMPLICIT NONE
INTEGER :: iter, n
!------------------------
DO iter=1,n ! Nonlinear iteration
DO istep=1,nstep ! Runge-Kutta
  IF(istep .EQ. 1) then
	CALL calc_timestep
	CALL calc_jacob
  ENDIF
  CALL calc_res
  CALL update !SGS
ENDDO
CALL MG_restriction/prolongation ! Multigrid
ENDDO
END PROGRAM