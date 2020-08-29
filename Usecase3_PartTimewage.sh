#! /bin/bash -x
echo "Welcome To Employee Wage Calculation"

isPresent=1
wagePerHr=20
hrsPerDay=8
isPartTime=1
isFillTime=2
empHrs=0

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
checkPartTime
