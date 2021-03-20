use "C:\Users\birdz\OneDrive\Documents\MetroMayoralData.dta", clear

drop if Flag==0

reshape long y, i(GeoName) j(year)

rename y Democ
 
save MetroMayoralData.dta, replace
 
 


use "C:\Users\birdz\OneDrive\Documents\PercentChangeGDPPerCapita.dta", clear

drop if Flag==0

drop if GeoName==""

reshape long y, i(GeoName) j(year)

rename y PercentChangeGDPPerCap
 
save PercentChangeGDPPerCapita.dta, replace



use "C:\Users\birdz\OneDrive\Documents\MetroGDPPerCapita.dta", clear

drop if Flag==0

drop if GeoName==""

reshape long y, i(GeoName) j(year)

rename y GDPPerCap
 
save MetroGDPPerCapita.dta, replace




use "C:\Users\birdz\OneDrive\Documents\MetroMayoralData.dta", clear

merge 1:1 GeoName year using PercentChangeGDPPerCapita.dta, generate(_mergePercentChangeGDPPerCapita)

merge 1:1 GeoName year using MetroGDPPerCapita.dta, generate(_mergeMetroGDPPerCapita)




destring GDPPerCap, replace
destring PercentChangeGDPPerCap, replace

sort GeoName year
bys GeoName: gen lagGDPPerCap = GDPPerCap[_n-1]

drop if PercentChangeGDPPerCap==.

label var PercentChangeGDPPerCap "Per Capita GDP Growth Rate"
label var Democ "Mayoral Party (1 if Democrat)"
label var lagGDPPerCap "Lagged Value of Per Capita GDP"


tabulate GeoName, generate(dGeoName)
tabulate year, generate(dYear)


reg PercentChangeGDPPerCap Democ dGeoName* dYear*

estimates store m1

reg PercentChangeGDPPerCap Democ lagGDPPerCap dGeoName* dYear*

estimates store m2

esttab m1 m2 /*using FirstRegression.rtf*/, keep(Democ lagGDPPerCap) se ar2 n label varwidth(30) modelwidth(30) compress /*replace*/











*Unemployment
import excel using "C:\Users\birdz\OneDrive\Documents\Notre Dame\Political Economy of Development\MayoralHistory.xlsx", sheet("Unemployment Mayoral Data") firstrow clear

save CityMayoralData.dta, replace


import excel using "C:\Users\birdz\OneDrive\Documents\Notre Dame\Political Economy of Development\MayoralHistory.xlsx", sheet("Unemployment") firstrow clear

save CityUnemployment.dta, replace


import excel using "C:\Users\birdz\OneDrive\Documents\Notre Dame\Political Economy of Development\MayoralHistory.xlsx", sheet("Population-City") firstrow clear

save CityPopulation.dta, replace



use "C:\Users\birdz\OneDrive\Documents\CityMayoralData.dta", clear

drop if Flag==0

drop if City==""

reshape long y, i(City) j(year)

rename y Democ
 
save CityMayoralData.dta, replace




use "C:\Users\birdz\OneDrive\Documents\CityUnemployment.dta", clear

drop if Flag==0

reshape long y, i(City) j(year)

rename y UnemploymentRate

keep City year UnemploymentRate Flag
 
save CityUnemployment.dta, replace




use "C:\Users\birdz\OneDrive\Documents\CityPopulation.dta", clear

drop if Flag==0

reshape long y, i(City) j(year)

rename y Population
 
save CityPopulation.dta, replace



use "C:\Users\birdz\OneDrive\Documents\CityMayoralData.dta", clear

merge 1:1 City year using CityUnemployment.dta, generate(_mergeCityUnemployment)

merge 1:1 City year using CityPopulation.dta, generate(_mergeCityPopulation)


drop if UnemploymentRate==.

label var UnemploymentRate "Unemployment Rate"
label var Democ "Mayoral Party (1 if Democrat)"
label var Population "City's Population"


tabulate City, generate(dCity)
tabulate year, generate(dYear)


reg UnemploymentRate Democ dCity* dYear*

estimates store m5

reg UnemploymentRate Population Democ dCity* dYear*

estimates store m6




esttab m5 m6 using SecondRegression.fixed, keep(Democ Population) se ar2 n label varwidth(30) modelwidth(20) replace





