#! /bin/bash -x
wagePerHr=20
partTimeHrs=4
fullTimeHrs=8
isPresent=1
hrsPerDay=8
isPartTime=1
isFillTime=2
empHrs=0
noOfWorkingDays=20
totalWorkHrs=0
noOfDays=0

function attendance()
{
        if [[ $((RANDOM%2)) -eq $isPresent ]]
        then
                echo "Employee is Present"
        else
                echo "Employee Is Absent"
        fi
}

function dailyWage()
{
        if [[ $((RANDOM%2)) -eq $isPresent ]]
        then
                dailySalary=$(($wagePerHr * $hrsPerDay ))
                echo "Salary is.."$dailySalary
        else
                echo "Salary = 0"
        fi
}

function checkPartTime()
{
        if [[ $((RANDOM%3)) -eq $isPartTime ]]
        then
                echo "Employee Is Part Time"
                empHrs=4
        elif [[ $((RANDOM%3)) -eq $isFulltime ]]
        then
                echo "Employee is Full Time"
                empHrs=8
        else
                empHrs=0
        fi
        dailySalary=$(($empHrs * $wagePerHr))
        echo "Salary is.."$dailySalary
}

function usingCase()
{
        random=$((RANDOM%3))
        case $random in
                1)
                dailySalary=$(($partTimeHrs * $wagePerHr ))
                echo "Salary is.."$dailySalary;;
                2)
                dailySalary=$(($fullTimeHrs * $wagePerHr ))
                echo "Salary is.."$dailySalary;;
                *)
                echo "Salary is.. 0";;
esac
}

function wageForMonth()
{
        for (( i=1; i<=$noOfWorkingDays; i++ ))
        do
                random=$((RANDOM%3))
                case $random in
                        1)
                        empHrs=4;;
                        2)
                        empHrs=8;;
                        *)
                        empHrs=0;;
                        esac
                salary=$(($wagePerHr*$empHrs))
                echo $salary
                totalSalary=$(($totalSalary + $salary ))
        done
echo "Total Wage of Month.."$totalSalary
}


function findHrs()
{
        while [[ totalWorkHrs -lt 100 && noOfDays -lt $noOfWorkingDays  ]]
        do
      random=$((RANDOM%3))
      case $random in
         1)
         empHrs=4 ;;
         2)
         empHrs=8 ;;
         *)
         empHrs=0 ;;
       esac
        ((noOfDays++))
        echo "Working Hours On Day $noOfDays.."
        getWorkingHrs $empHrs
   done

}

function getWorkingHrs()
{
        local empHours
        empHours=$1
        totalWorkHrs=$(($totalWorkHrs + $empHours))
        echo  $totalWorkHrs
}

function wageForMonth()
{
   while [[ totalWorkHrs -lt 100 && noOfDays -lt $noOfWorkingDays  ]]
	do
		((noOfDays++))
		empHrs=$(findHrs $((RANDOM%3)) )
		totalWorkHrs=$(($totalWorkHrs + $empHrs ))
      dailyWage[noOfDays]=$(wageCalculate $empHrs )
   done
totalSalary=$(($totalWorkHrs * $wagePerHr))
echo "Daily Wage.."${dailyWage[@]}
echo "Day Numbers.."${!dailyWage[@]}
echo "Total Wage of Month.."$totalSalary
}
wageForMonth
