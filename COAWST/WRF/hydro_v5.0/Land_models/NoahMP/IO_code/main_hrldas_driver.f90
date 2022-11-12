

























































































































































































!  Program Name:
!  Author(s)/Contact(s):
!  Abstract:
!  History Log:
! 
!  Usage:
!  Parameters: <Specify typical arguments passed>
!  Input Files:
!        <list file names and briefly describe the data they include>
!  Output Files:
!        <list file names and briefly describe the information they include>
! 
!  Condition codes:
!        <list exit condition or error codes returned >
!        If appropriate, descriptive troubleshooting instructions or
!        likely causes for failures could be mentioned here with the
!        appropriate error code
! 
!  User controllable options: <if applicable>

program Noah_hrldas_driver
! this is the main program to drive HRLDAS-Noah, HRLDAS-NoahMP, and other Land models.

! this is used to drive NoahMP
   use module_noahmp_hrldas_driver, only: land_driver_ini, land_driver_exe

   implicit none
   integer :: ITIME, NTIME

   call land_driver_ini(NTIME)
   do ITIME = 1, NTIME
       call land_driver_exe(ITIME)
   end do

   write(6,*) "NTIME = ",NTIME, " ITIME =", ITIME
   call hydro_finish() 

END 


