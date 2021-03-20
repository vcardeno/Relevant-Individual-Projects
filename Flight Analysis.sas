/* Import datasets 

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/469246139_T_ONTIME_REPORTINGFeb2019.csv"
	dbms = csv out = febflightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/469246139_T_ONTIME_REPORTINGMay2019.csv"
	dbms = csv out = mayflightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/469246139_T_ONTIME_REPORTINGAug2019.csv"
	dbms = csv out = augflightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/469246139_T_ONTIME_REPORTINGNov2019.csv"
	dbms = csv out = novflightdata replace;
run;

*/ 

/* Import datasets */
proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Feb2015FlightData.xlsx"
	dbms = xlsx out = feb2015flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/May2015FlightData.xlsx"
	dbms = xlsx out = may2015flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Aug2015FlightData.xlsx"
	dbms = xlsx out = aug2015flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Nov2015FlightData.xlsx"
	dbms = xlsx out = nov2015flightdata replace;
run;


proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Feb2016FlightData.xlsx"
	dbms = xlsx out = feb2016flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/May2016FlightData.xlsx"
	dbms = xlsx out = may2016flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Aug2016FlightData.xlsx"
	dbms = xlsx out = aug2016flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Nov2016FlightData.xlsx"
	dbms = xlsx out = nov2016flightdata replace;
run;


proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Feb2017FlightData.xlsx"
	dbms = xlsx out = feb2017flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/May2017FlightData.xlsx"
	dbms = xlsx out = may2017flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Aug2017FlightData.xlsx"
	dbms = xlsx out = aug2017flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Nov2017FlightData.xlsx"
	dbms = xlsx out = nov2017flightdata replace;
run;


proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Feb2018FlightData.xlsx"
	dbms = xlsx out = feb2018flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/May2018FlightData.xlsx"
	dbms = xlsx out = may2018flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Aug2018FlightData.xlsx"
	dbms = xlsx out = aug2018flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Nov2018FlightData.xlsx"
	dbms = xlsx out = nov2018flightdata replace;
run;


proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Feb2019FlightData.xlsx"
	dbms = xlsx out = feb2019flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/May2019FlightData.xlsx"
	dbms = xlsx out = may2019flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Aug2019FlightData.xlsx"
	dbms = xlsx out = aug2019flightdata replace;
run;

proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/Nov2019FlightData.xlsx"
	dbms = xlsx out = nov2019flightdata replace;
run;



proc contents data = febflightdata;
run;

proc contents data = mayflightdata;
run;

proc contents data = augflightdata;
run;

proc contents data = novflightdata;
run;


/* Sample 25000 points randomly from each dataset */
proc surveyselect data=feb2015flightdata method=srs sampsize=25000 seed=12345 out=feb2015samp;
run;

proc surveyselect data=may2015flightdata method=srs sampsize=25000 seed=12345 out=may2015samp;
run;

proc surveyselect data=aug2015flightdata method=srs sampsize=25000 seed=12345 out=aug2015samp;
run;

proc surveyselect data=nov2015flightdata method=srs sampsize=25000 seed=12345 out=nov2015samp;
run;

proc surveyselect data=feb2016flightdata method=srs sampsize=25000 seed=12345 out=feb2016samp;
run;

proc surveyselect data=may2016flightdata method=srs sampsize=25000 seed=12345 out=may2016samp;
run;

proc surveyselect data=aug2016flightdata method=srs sampsize=25000 seed=12345 out=aug2016samp;
run;

proc surveyselect data=nov2016flightdata method=srs sampsize=25000 seed=12345 out=nov2016samp;
run;

proc surveyselect data=feb2017flightdata method=srs sampsize=25000 seed=12345 out=feb2017samp;
run;

proc surveyselect data=may2017flightdata method=srs sampsize=25000 seed=12345 out=may2017samp;
run;

proc surveyselect data=aug2017flightdata method=srs sampsize=25000 seed=12345 out=aug2017samp;
run;

proc surveyselect data=nov2017flightdata method=srs sampsize=25000 seed=12345 out=nov2017samp;
run;

proc surveyselect data=feb2018flightdata method=srs sampsize=25000 seed=12345 out=feb2018samp;
run;

proc surveyselect data=may2018flightdata method=srs sampsize=25000 seed=12345 out=may2018samp;
run;

proc surveyselect data=aug2018flightdata method=srs sampsize=25000 seed=12345 out=aug2018samp;
run;

proc surveyselect data=nov2018flightdata method=srs sampsize=25000 seed=12345 out=nov2018samp;
run;

proc surveyselect data=feb2019flightdata method=srs sampsize=25000 seed=12345 out=feb2019samp;
run;

proc surveyselect data=may2019flightdata method=srs sampsize=25000 seed=12345 out=may2019samp;
run;

proc surveyselect data=aug2019flightdata method=srs sampsize=25000 seed=12345 out=aug2019samp;
run;

proc surveyselect data=nov2019flightdata method=srs sampsize=25000 seed=12345 out=nov2019samp;
run;

proc sql;
	create table allsamp as
	select * from feb2015samp natural full outer join may2015samp natural full outer join aug2015samp natural full outer join nov2015samp natural full outer join
				  feb2016samp natural full outer join may2016samp natural full outer join aug2016samp natural full outer join nov2016samp natural full outer join
                  feb2017samp natural full outer join may2017samp natural full outer join aug2017samp natural full outer join nov2017samp natural full outer join
                  feb2018samp natural full outer join may2018samp natural full outer join aug2018samp natural full outer join nov2018samp natural full outer join
                  feb2019samp natural full outer join may2019samp natural full outer join aug2019samp natural full outer join nov2019samp;
quit;


proc export data = work.allsamp
	outfile = "/opt/sas/home/vcarden/sasuser.viya/BlogTopics/FinalFlightSample.xlsx"
	dbms = xlsx replace;
run;
 

proc contents data = allsamp;
run;



proc import datafile="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/FinalFlightSample.xlsx" 
	dbms = xlsx out=allsamp replace;
run;


/* Let's check out the data with proc freq */
proc freq data = allsamp order=freq;
run;

/* Interesting observations:

	People fly more in the middle of the week than on the ends.
	Not that many flights towards end of months
*/

proc freq data = allsamp;
	tables day_of_week;
run;

proc freq data = allsamp;
	tables op_unique_carrier;
run;

proc freq data = allsamp;
	tables origin_city_name;
run;




/* Maybe a good idea to create some macros describing different variables */

proc contents data = allsamp;
run;



%let performancemeasures = arr_del15 arr_delay arr_time canceled carrier_delay crs_arr_time crs_dep_time dep_del15 dep_delay
						   dep_time diverted div_actual_elapsed_time div_airport_landings div_arr_delay div_reached_dest
						   late_aircraft_delay nas_delay security_delay weather_delay;
%let characteristics = cancellation_code day_of_month day_of_week dest_airport_id dest_airport_seq_id dest_city_market_id 
					   month op_carrier_airline_id op_carrier_fl_num op_unique_carrier origin_airport_id 
					   origin_airport_seq_id origin_city_market_id quarter tail_num year;


/* Let's see if we can get more observations */
proc freq data = allsamp;
	tables &characteristics;
run;

proc print data = allsamp(obs=100);
run;
/* What are some questions we might want to answer? What are some insights that might be helpful to people? 

Which airlines have the most cancelled flights/delays?
Which day of the week experienced the most cancelations/delays?
Which times were the most/least people flying?
Which airports inside specific cities were the most promptly?

Good start
*/


/* Which airlines have the most cancelled flights/delays?

Have to use categorical nominal airline variable
Can use binary indicator variable for cancelled and then continuous dep_delay variable as reponse
ONE Test of association and ONE ANOVA

*/

proc freq data = allsamp;
	tables cancelled;
run;

*population proportion of 1's: 7366/500000 = 0.014732 
*sample proportion of 1's: 0.106838
*population proportion of 0's: 1-(7366/500000) = ...
*sample proportion of 0's: 1-0.106838

*Have to oversample cancellations;
data allsampover;
	set allsamp;
	if cancelled = 1 then do i = 1 to 8;
		output;
	end;
	else if cancelled = 0 then
		output;
run;

data allsampover;
	set allsampover;
	weights = 1;
	if cancelled = 0 then weights = 8;
run;


proc freq data = allsampover;
	tables cancelled;
run;



proc freq data = allsamp order = freq;
	tables op_unique_carrier;
run;
*let's use spirit(NK) as base level


*Start with Test of Association;
proc contents data = allsamp;
run;

proc freq data = allsampover;
	tables op_unique_carrier*cancelled / chisq expected measures cl relrisk;
run;

*Reject Ho of no association due to low p-value ---> where is the association?;

proc sort data = allsamp out=allsampsorted;
	by op_unique_carrier;
run;

proc freq data = allsamp;
	tables op_unique_carrier*cancelled / chisq expected measures cl relrisk plots(only)=freqplot(scale=percent);
run;

proc freq data = allsampsorted;
	tables cancelled / plots(only)=freqplot(scale=percent);
	by op_unique_carrier;
run;




ods trace on;
*Let's do a simple logistic regression to find out which are best and worst;
proc logistic data = allsampover alpha = 0.05 plots(only)=(effect oddsratio);
	class op_unique_carrier(ref = 'NK') / param=effect;
	model cancelled(event='1') = op_unique_carrier / clodds=pl;
	weight weights;
	ods output ParameterEstimates = new_data;
run;
ods trace off;

proc print data = new_data;
	format ProbChiSq 30.29;
run;




/* yep some good stuff here, let's move on*/

*most negative coefficients: HA, G4, DL;
*most positive coefficients: MQ, YV, EV;


/* Which airlines experienced worst departure time?

/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = allsamp;
	class op_unique_carrier;
	var dep_delay;
	hist dep_delay;
	probplot dep_delay/normal;
run;

*not normal, don't think so at least;

proc glm data=allsamp plots = all /* gives diagnostic plots */; 
    class op_unique_carrier; 
    model dep_delay=op_unique_carrier; 
	means op_unique_carrier / hovtest=levene; 
run; 


*can't do ANOVA with continuous response, so let's see if we can do test of association/logistic regression with indicator variable;
proc freq data = allsamp;
	tables op_unique_carrier*dep_del15 / chisq measures expected relrisk cl plots(only)=freqplot;
run;

*Chi Sq p-value < .001 ---> reject Ho of no association--->looks like there's some association, let's see with logistic;
proc logistic data = allsamp;
	class op_unique_carrier(ref = 'NK') / param=effect;
	model dep_del15(event='1') = op_unique_carrier / clodds=pl;
	ods output ParameterEstimates = new_data;
run;


proc print data = new_data;
	format ProbChiSq 30.29;
run;
*most delayed: B6, F9, VX;
*least delayed: HA, AS, DL;









/* Which days of the week have the most cancellations? */
proc freq data = allsamp order = freq;
	tables day_of_week;
run;
*median is 4;

*Test of Assocation;
proc freq data = allsampover;
	tables day_of_week*cancelled / chisq measures expected relrisk cl plots(only)=freqplot(scale=percent);
run;

*MH test has p-value <.001 ---> reject hypothesis of no assocation;

proc sort data = allsamp out = allsampsorted;
	by day_of_week;
run;

proc freq data = allsampsorted;
	tables cancelled / plots(only)=freqplot(scale=percent);
	by day_of_week;
run;

*can't tell anything from this, let's try logistic regression;

ods trace on;
*Let's do a simple logistic regression to find out which are best and worst;
proc logistic data = allsampover alpha = 0.05 plots(only)=(effect oddsratio);
	class day_of_week(ref='3') / param=effect;
	model cancelled(event='1') = day_of_week / clodds=pl clparm=pl;
	weight weights;
	ods output ParameterEstimates = new_data;
run;
ods trace off;

proc print data = new_data;
	format ProbChiSq 30.29;
run;

proc logistic data = allsamp;
	class day_of_week(ref = '4') / param=effect;
	model cancelled(event='1') = day_of_week / clodds=pl;
run;

* a little something maybe, but I doubt it;



/* Which days of week have most departure delay? */

/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = allsamp;
	class day_of_week;
	var dep_delay;
	hist dep_delay;
	probplot dep_delay/normal;
run;

*not normal, don't think so at least;

proc glm data=allsamp plots = all /* gives diagnostic plots */; 
    class op_unique_carrier; 
    model dep_delay=op_unique_carrier; 
	means op_unique_carrier / hovtest=levene; 
run; 


*let's try test of association/logistic regression with dep_del15;
proc freq data = allsamp;
	tables day_of_week*dep_del15 / chisq measures expected relrisk cl oddsratio plots(only)=freqplot;
run;

*looks like there's some difference, let's do logistic;
proc logistic data = allsamp;
	class day_of_week(ref = '4') / param=effect;
	model dep_del15(event='1') = day_of_week / clodds=pl;
run;

*looks like there's the least delays on Saturday and most on Thursday and Friday;


proc freq data = allsamp order=freq;
	tables day_of_week;
run;


/* What periods of time were the most/least people flying? 

	Let's look at day of the week and day of the month */



*Day of Week;
*let's try to do an ANOVA with days of the week as categories;

/* Have to construct number of flights for each day */

proc sort data = allsamp out = allsampflightsperday;
	by year month day_of_week day_of_month;
run;


data allsampflightsperday2;
	set allsampflightsperday;
	by year month day_of_week day_of_month;
	numflightsperday + 1;
	if First.day_of_month = 1 then numflightsperday = 0;
	if last.day_of_month = 1 then output;
	keep year month day_of_week day_of_month numflightsperday;
run;

proc print data = allsampflightsperday2(obs=1000);
run;


*can now run an ANOVA with this, let's check assumptions;
/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = allsampflightsperday2;
	class day_of_week;
	var numflightsperday;
	hist numflightsperday;
	probplot numflightsperday/normal;
run;

*looks approximately normal;

proc glm data=allsampflightsperday2 plots = all /* gives diagnostic plots */; 
    class day_of_week; 
    model numflightsperday=day_of_week; 
	means day_of_week / hovtest=levene; 
run; 

*reject Ho for equality of variances ---> looks like 4 and 5 have significantly different variances, let's bin them and see;

data allsampflightsperday2rev;
	set allsampflightsperday2;
	where day_of_week in (1, 2, 3, 5, 6, 7);
run;

proc glm data=allsampflightsperday2rev plots = all /* gives diagnostic plots */; 
    class day_of_week; 
    model numflightsperday=day_of_week; 
	means day_of_week / hovtest=levene; 
run; 

*it' still fucked, try w/o 5;
data allsampflightsperday2revi;
	set allsampflightsperday2;
	where day_of_week in (1, 2, 3, 6, 7);
run;

proc glm data=allsampflightsperday2revi plots = all /* gives diagnostic plots */; 
    class day_of_week; 
    model numflightsperday=day_of_week; 
	means day_of_week / hovtest=levene; 
run; 

*can do it this way, but let's see if we can figure out 4 and 5;


proc print data = allsampflightsperday2;
	where day_of_week in (4,5);
run;

*looks like outliers come from reduction of flights on Thanksgiving every year ---> let's drop those;
data wothanksgiving;
	set allsampflightsperday2;
	where not (month = 11 and day_of_month >=23 and day_of_month <= 28);
run;

proc print data = wothanksgiving;
run;

*now let's try all the ANOVA stuff again;
/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = wothanksgiving;
	class day_of_week;
	var numflightsperday;
	hist numflightsperday;
	probplot numflightsperday/normal;
run;

*looks approximately normal;

proc glm data=wothanksgiving plots = all /* gives diagnostic plots */; 
    class day_of_week; 
    model numflightsperday=day_of_week; 
	means day_of_week / hovtest=levene; 
run; 

*all set, let's fucking go;


*ANOVA;
proc glm data=wothanksgiving; 
    class day_of_week; 
    model numflightsperday=day_of_week /* y = x */; 
run; 

*p-value < .001 ---> sig difference, let's see where;

*Post-Hoc;
proc glm data=wothanksgiving 
         plots(only)=(diffplot(center) /* diffogram */ controlplot /* Dunnett's Control */);
    class day_of_week;
    model numflightsperday=day_of_week;
    lsmeans day_of_week / pdiff=all /* Tukey */
                         adjust=tukey;
    * lsmeans day_of_week / pdiff=control('Average/Typical') /* specifies control */
                         adjust=dunnett;   /* Dunnett */ 
run;

/* looks like Saturday and Sunday have significantly different number of flights than everyone else, including each other;







*Now let's look at number of flights for day of month;

/* don't think you can really do it for day of month specifically cause sample size is too small--->let's group it into beginning, middle, and end of month;
*/

proc sort data = allsamp out = allsampflightsperdayofmonth;
	by year month day_of_month day_of_week;
run;

data allsampflightsperday3;
	set allsampflightsperdayofmonth;
	by year month day_of_month day_of_week;
	monthsection = 0;
	if (day_of_month >=1 and day_of_month <= 10) then
		monthsection = 1;
	else if (day_of_month >= 11 and day_of_month <= 20) then
		monthsection = 2;
	else if (day_of_month >= 21 and day_of_month <= 31) then 
		monthsection = 3;
run;

proc freq data = allsampflightsperday3;
	tables day_of_month monthsection;
run;

*good;

proc sort data = allsampflightsperday3 out = allsampflightsperday3;
	by monthsection year month day_of_month;
run;	


data allsampflightsperday3;
	set allsampflightsperday3;
	by monthsection year month day_of_month;
	numflights + 1;
	if (first.monthsection = 1 or first.month = 1) then numflights = 0;
	keep year month day_of_month monthsection day_of_week numflights;
	if last.month;
run;

proc print data = allsampflightsperday3;
run;

*think this worked, let me try proc freq to see;
proc freq data = allsampflightsperday3;
	tables monthsection*day_of_month;
run;

proc print data = allsamp;
	where month = 2 and day_of_month > 28;
run;

proc freq data = allsamp;
	tables month*day_of_month;
run;

*yep all good;


*Now run an ANOVA across monthsection;

/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = allsampflightsperday3;
	class monthsection;
	var numflights;
	hist numflights;
	probplot numflights/normal;
run;

*not normal across monthsections 2 and 3;


*let's try putting it into smaller chunks;
proc sort data = allsamp out = allsampflightsperdayofmonth2;
	by year month day_of_month day_of_week;
run;

data allsampflightsperday3v2;
	set allsampflightsperdayofmonth2;
	by year month day_of_month day_of_week;
	monthsection = 0;
	if (day_of_month >=1 and day_of_month <= 8) then
		monthsection = 1;
	else if (day_of_month >= 9 and day_of_month <= 16) then
		monthsection = 2;
	else if (day_of_month >= 17 and day_of_month <= 24) then 
		monthsection = 3;
	else if (day_of_month >= 24 and day_of_month <= 31) then 
		monthsection = 4;
run;

proc freq data = allsampflightsperday3v2;
	tables day_of_month monthsection;
run;

*good;

proc sort data = allsampflightsperday3v2 out = allsampflightsperday3v2;
	by monthsection year month day_of_month;
run;	


data allsampflightsperday3v2;
	set allsampflightsperday3v2;
	by monthsection year month day_of_month;
	numflights + 1;
	if (first.monthsection = 1 or first.month = 1) then numflights = 0;
	keep year month day_of_month monthsection day_of_week numflights;
	if last.month;
run;


/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = allsampflightsperday3v2;
	class monthsection ;
	var numflights;
	hist numflights;
	probplot numflights/normal;
run;

*I think we can do it for sections 1, 2, and 3--->basically first 3 weeks--->test next assumption;

proc glm data=allsampflightsperday3v2 plots = all /* gives diagnostic plots */; 
    class monthsection; 
    model numflights=monthsection; 
	means monthsection / hovtest=levene; 
run; 

*Big problem with section 4, let's try 2 - way ANOVA with month as well and see what happens;
*nah, not enough data points, let's just bin section 4;

data allsampflightsperday3v2;
	set allsampflightsperday3v2;
	where monthsection ne 4;
run;


/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = allsampflightsperday3v2;
	class monthsection;
	var numflights;
	hist numflights;
	probplot numflights/normal;
run;

*I think we can do it for sections 1, 2, and 3--->basically first 3 weeks--->test next assumption;

proc glm data=allsampflightsperday3v2 plots = all /* gives diagnostic plots */; 
    class monthsection; 
    model numflights=monthsection; 
	means monthsection / hovtest=levene; 
run; 

*nothing doing here;







/* What about different airports in the same cities? */

*let's find out what's there;
proc contents data = allsamp;
run;

proc print data = allsamp(obs=100);
run;

proc sort data = allsamp out = allsampcity;
	by origin_city_name;
run;

proc print data = allsampcity;
	var origin_airport_id;
	by origin_city_name;
run;


proc sql;
	select distinct(origin_airport_id), origin_city_name, origin
	from allsamp
	order by origin_city_name;
run;

*Chicago, IL
*Columbus, OH
*Dallas/Fort Worth, TX
*Houston, TX
*Mobile, AL
*New York, NY/Newark, NY/Islip, NY
*Phoenix, AZ
*Washington, DC
*Williston, ND
*Los Angeles, CA/Burbank, CA
*San Francisco, CA/Oakland, CA
*Norfolk, VA/Newport News, VA


/* Have to separate data just for these specific airports */

*Chicago, IL;
data chicagodata;
	set allsamp;
	where origin_city_name = "Chicago, IL";
run;

proc freq data = chicagodata;
	tables origin_airport_id;
run;


*Test for Association for Cancellations;
proc freq data = chicagodata;
	tables origin_airport_id*cancelled / chisq expected measures cl relrisk oddsratio plots(only)=freqplot;
run;

*no association;

*Test for Assocation with DepDelay15 Indicator;
proc freq data = chicagodata;
	tables origin_airport_id*dep_del15 / chisq expected measures cl relrisk plots(only)=freqplot(scale=percent);
run;

*not really
*appears to be some association, let's try logistic;
proc logistic data = chicagodata;
	class origin_airport_id / param=reference;
	model dep_del15(event='1') = origin_airport_id;
run;

*13232 is significantly more odds of delayed by more than 15 minutes than other one;
*Midway has more odds of delay than O'Hare;







*Columbus, OH;
data columbusdata;
	set allsamp;
	where origin_city_name = "Columbus, OH";
run;

*Test of Association for Cancellations;
proc freq data = columbusdata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*no association;

*Test of Association for DepartureDel15;
proc freq data = columbusdata;
	tables origin_airport_id*dep_del15 / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*no association;



*Dallas/Fort Worth, TX;
data dfwdata;
	set allsamp;
	where origin_city_name like "Dallas%";
run;

proc freq data = dfwdata;
	tables origin_airport_id;
run;

*Test of Association for Cancellations;
proc freq data = dfwdata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*no association;

*Test of Association for DepDelay15;
proc freq data = dfwdata;
	tables origin_airport_id*dep_del15 / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant assocation, logistic;

proc logistic data = dfwdata;
	class origin_airport_id / param=reference;
	model dep_del15(event='1') = origin_airport_id / clodds=pl;
run;
*11259 with significantly more delays;



*Houston, TX;
data houstondata;
	set allsamp;
	where origin_city_name = "Houston, TX";
run;

proc freq data = houstondata;
	tables origin_airport_id;
run;

*Test for Association for Cancellation;
proc freq data = houstondata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant assocation, logistic;
proc logistic data = houstondata;
	class origin_airport_id / param=reference;
	model cancelled(event='1') = origin_airport_id / clodds=pl clparm=pl;
	weight weights;
run;
*12191 significantly more cancellations;

*Test of Association for DepDelay15;
proc freq data = houstondata;
	tables origin_airport_id*dep_del15 / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant assocation, logistic;

proc logistic data = houstondata;
	class origin_airport_id / param=reference;
	model dep_del15(event='1') = origin_airport_id / clodds=pl clparm=pl;
run;
*12191 with significantly more delays;



*Mobile, AL;
data mobiledata;
	set allsamp;
	where origin_city_name = "Mobile, AL";
run;
*not enough data;


*New York, NY/Newark, NJ/Islip, NY;
data newyorkdata;
	set allsamp;
	where origin_city_name = "New York, NY" or origin_city_name = "Newark, NJ" or origin_city_name = "Islip, NY";
run;

proc freq data = newyorkdata;
	tables origin_airport_id;
run;

*Test for Association for Cancellations;
proc freq data = newyorkdata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant assocation, logistic;
proc logistic data = newyorkdata;
	class origin_airport_id(ref = '12478') / param=effect;
	model cancelled(event='1') = origin_airport_id / clodds=pl clparm=pl;
	weight weights;
run;
*12478 with significantly less cancellations;

*Test for Association for Departure Delays;
proc freq data = newyorkdata;
	tables origin_airport_id*dep_del15 / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant associations;
proc logistic data = newyorkdata;
	class origin_airport_id(ref = '12478') / param=effect;
	model dep_del15(event='1') = origin_airport_id / clodds=pl clparm=pl;
run;
*a few with significant differences;


proc print data = allsamp;
	var origin_airport_id origin_city_name;
run;


*Phoenix, AZ;
data phoenixdata;
	set allsamp;
	where origin_city_name = "Phoenix, AZ";
run;

*Test for Association for Cancellations;
proc freq data = phoenixdata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*one airport doesn't have enough data;


*Washington, DC;
data dcdata;
	set allsamp;
	where origin_city_name = "Washington, DC";
run;

proc freq data = dcdata;
	tables origin_airport_id;
run;

*Test for Association for Cancellations;
proc freq data = dcdata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant assocation, logistic;
proc logistic data = dcdata;
	class origin_airport_id / param=reference;
	model cancelled(event='1') = origin_airport_id / clodds=pl;
	weight weights;
run;
*11278 with significantly more cancellations;


*Test for Association for Departure Delays;
proc freq data = dcdata;
	tables origin_airport_id*dep_del15 / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*nothing doing;




*Williston, ND;
data willistondata;
	set allsamp;
	where origin_city_name = "Williston, ND";
run;
*not enough data;


*Los Angeles/Burbank;
data ladata;
	set allsamp;
	where origin_city_name = "Los Angeles, CA" or origin_city_name = "Burbank, CA" or origin_city_name = "Long Beach, CA";
run;

*Test for Association for Cancellations;
proc freq data = ladata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*not enough data for Burbank and Long Beach;



*Bay Area;
data baydata;
	set allsamp;
	where origin_city_name = "San Francisco, CA" or origin_city_name = "Oakland, CA";
run;

*Test for Association for Cancellations;
proc freq data = baydata;
	tables origin_airport_id*cancelled / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*nothing doing;

*Test for Association for Delays;
proc freq data = baydata;
	tables origin_airport_id*dep_del15 / chisq measures relrisk cl plots(only)=freqplot(scale=percent);
run;
*significant association, logistic;
proc logistic data = baydata;
	class origin_airport_id / param=reference;
	model dep_del15(event='1') = origin_airport_id / clodds=pl;
run;
*13796 has less delays;



*Norfolk, VA/Newport News, VA;
data vadata;
	set allsamp;
	where origin_city_name = "Norfolk, VA" or origin_city_name = "Newport News/Williamsburg, VA";
run;
*not enough data;




proc contents data = allsamp;
run;


*Let's look at departure time;
proc univariate data = allsamp;
	var crs_dep_time;
run;

proc print data = allsamp(obs=100);
run;

data allsampdepanl;
	set allsamp;
	dep_time_new = put(dep_time, z4.);
	if length(dep_time_new) = 2 then dep_time_new = 00 + dep_time_new;
	if length(dep_time_new) = 3 then dep_time_new = 0 + dep_time_new;
	dep_time_hour = substr(dep_time_new, 1, 2);
	dep_time_min = input(substr(dep_time_new, 3, 2), best2.);
run;

data allsampdepanl;
	set allsampdepanl;
	if dep_time_hour = '00' and dep_time_min <= 30 then deptimedummy = 1;
	if dep_time_hour = '00' and dep_time_min > 30 then deptimedummy = 2;
	if dep_time_hour = '01' and dep_time_min <= 30 then deptimedummy = 3;
	if dep_time_hour = '01' and dep_time_min > 30 then deptimedummy = 4;
	if dep_time_hour = '02' and dep_time_min <= 30 then deptimedummy = 5;
	if dep_time_hour = '02' and dep_time_min > 30 then deptimedummy = 6;
	if dep_time_hour = '03' and dep_time_min <= 30 then deptimedummy = 7;
	if dep_time_hour = '03' and dep_time_min > 30 then deptimedummy = 8;
	if dep_time_hour = '04' and dep_time_min <= 30 then deptimedummy = 9;
	if dep_time_hour = '04' and dep_time_min > 30 then deptimedummy = 10;
	if dep_time_hour = '05' and dep_time_min <= 30 then deptimedummy = 11;
	if dep_time_hour = '05' and dep_time_min > 30 then deptimedummy = 12;
	if dep_time_hour = '06' and dep_time_min <= 30 then deptimedummy = 13;
	if dep_time_hour = '06' and dep_time_min > 30 then deptimedummy = 14;
	if dep_time_hour = '07' and dep_time_min <= 30 then deptimedummy = 15;
	if dep_time_hour = '07' and dep_time_min > 30 then deptimedummy = 16;
	if dep_time_hour = '08' and dep_time_min <= 30 then deptimedummy = 17;
	if dep_time_hour = '08' and dep_time_min > 30 then deptimedummy = 18;
	if dep_time_hour = '09' and dep_time_min <= 30 then deptimedummy = 19;
	if dep_time_hour = '09' and dep_time_min > 30 then deptimedummy = 20;
	if dep_time_hour = '10' and dep_time_min <= 30 then deptimedummy = 21;
	if dep_time_hour = '10' and dep_time_min > 30 then deptimedummy = 22;
	if dep_time_hour = '11' and dep_time_min <= 30 then deptimedummy = 23;
	if dep_time_hour = '11' and dep_time_min > 30 then deptimedummy = 24;
	if dep_time_hour = '12' and dep_time_min <= 30 then deptimedummy = 25;
	if dep_time_hour = '12' and dep_time_min > 30 then deptimedummy = 26;
	if dep_time_hour = '13' and dep_time_min <= 30 then deptimedummy = 27;
	if dep_time_hour = '13' and dep_time_min > 30 then deptimedummy = 28;
	if dep_time_hour = '14' and dep_time_min <= 30 then deptimedummy = 29;
	if dep_time_hour = '14' and dep_time_min > 30 then deptimedummy = 30;
	if dep_time_hour = '15' and dep_time_min <= 30 then deptimedummy = 31;
	if dep_time_hour = '15' and dep_time_min > 30 then deptimedummy = 32;
	if dep_time_hour = '16' and dep_time_min <= 30 then deptimedummy = 33;
	if dep_time_hour = '16' and dep_time_min > 30 then deptimedummy = 34;
	if dep_time_hour = '17' and dep_time_min <= 30 then deptimedummy = 35;
	if dep_time_hour = '17' and dep_time_min > 30 then deptimedummy = 36;
	if dep_time_hour = '18' and dep_time_min <= 30 then deptimedummy = 37;
	if dep_time_hour = '18' and dep_time_min > 30 then deptimedummy = 38;
	if dep_time_hour = '19' and dep_time_min <= 30 then deptimedummy = 39;
	if dep_time_hour = '19' and dep_time_min > 30 then deptimedummy = 40;
	if dep_time_hour = '20' and dep_time_min <= 30 then deptimedummy = 41;
	if dep_time_hour = '20' and dep_time_min > 30 then deptimedummy = 42;
	if dep_time_hour = '21' and dep_time_min <= 30 then deptimedummy = 43;
	if dep_time_hour = '21' and dep_time_min > 30 then deptimedummy = 44;
	if dep_time_hour = '22' and dep_time_min <= 30 then deptimedummy = 45;
	if dep_time_hour = '22' and dep_time_min > 30 then deptimedummy = 46;
	if dep_time_hour = '23' and dep_time_min <= 30 then deptimedummy = 47;
	if dep_time_hour = '23' and dep_time_min > 30 then deptimedummy = 48;
run;


*Get rid of portions that are less than 1% of data (keep deptimedummy 12-46);
data depanalysis;
	set allsampdepanl;
	if deptimedummy >= 12 and deptimedummy <= 46 then output;
run;





proc contents data = allsampover;
run;


*Do it for cancelled data;
data allsampdepanlover;
	set allsampover;
	dep_time_new = put(crs_dep_time, z4.);
	if length(dep_time_new) = 2 then dep_time_new = 00 + dep_time_new;
	if length(dep_time_new) = 3 then dep_time_new = 0 + dep_time_new;
	dep_time_hour = substr(dep_time_new, 1, 2);
	dep_time_min = input(substr(dep_time_new, 3, 2), best2.);
run;



data allsampdepanlover;
	set allsampdepanlover;
	if dep_time_hour = '00' and dep_time_min <= 30 then deptimedummy = 1;
	if dep_time_hour = '00' and dep_time_min > 30 then deptimedummy = 2;
	if dep_time_hour = '01' and dep_time_min <= 30 then deptimedummy = 3;
	if dep_time_hour = '01' and dep_time_min > 30 then deptimedummy = 4;
	if dep_time_hour = '02' and dep_time_min <= 30 then deptimedummy = 5;
	if dep_time_hour = '02' and dep_time_min > 30 then deptimedummy = 6;
	if dep_time_hour = '03' and dep_time_min <= 30 then deptimedummy = 7;
	if dep_time_hour = '03' and dep_time_min > 30 then deptimedummy = 8;
	if dep_time_hour = '04' and dep_time_min <= 30 then deptimedummy = 9;
	if dep_time_hour = '04' and dep_time_min > 30 then deptimedummy = 10;
	if dep_time_hour = '05' and dep_time_min <= 30 then deptimedummy = 11;
	if dep_time_hour = '05' and dep_time_min > 30 then deptimedummy = 12;
	if dep_time_hour = '06' and dep_time_min <= 30 then deptimedummy = 13;
	if dep_time_hour = '06' and dep_time_min > 30 then deptimedummy = 14;
	if dep_time_hour = '07' and dep_time_min <= 30 then deptimedummy = 15;
	if dep_time_hour = '07' and dep_time_min > 30 then deptimedummy = 16;
	if dep_time_hour = '08' and dep_time_min <= 30 then deptimedummy = 17;
	if dep_time_hour = '08' and dep_time_min > 30 then deptimedummy = 18;
	if dep_time_hour = '09' and dep_time_min <= 30 then deptimedummy = 19;
	if dep_time_hour = '09' and dep_time_min > 30 then deptimedummy = 20;
	if dep_time_hour = '10' and dep_time_min <= 30 then deptimedummy = 21;
	if dep_time_hour = '10' and dep_time_min > 30 then deptimedummy = 22;
	if dep_time_hour = '11' and dep_time_min <= 30 then deptimedummy = 23;
	if dep_time_hour = '11' and dep_time_min > 30 then deptimedummy = 24;
	if dep_time_hour = '12' and dep_time_min <= 30 then deptimedummy = 25;
	if dep_time_hour = '12' and dep_time_min > 30 then deptimedummy = 26;
	if dep_time_hour = '13' and dep_time_min <= 30 then deptimedummy = 27;
	if dep_time_hour = '13' and dep_time_min > 30 then deptimedummy = 28;
	if dep_time_hour = '14' and dep_time_min <= 30 then deptimedummy = 29;
	if dep_time_hour = '14' and dep_time_min > 30 then deptimedummy = 30;
	if dep_time_hour = '15' and dep_time_min <= 30 then deptimedummy = 31;
	if dep_time_hour = '15' and dep_time_min > 30 then deptimedummy = 32;
	if dep_time_hour = '16' and dep_time_min <= 30 then deptimedummy = 33;
	if dep_time_hour = '16' and dep_time_min > 30 then deptimedummy = 34;
	if dep_time_hour = '17' and dep_time_min <= 30 then deptimedummy = 35;
	if dep_time_hour = '17' and dep_time_min > 30 then deptimedummy = 36;
	if dep_time_hour = '18' and dep_time_min <= 30 then deptimedummy = 37;
	if dep_time_hour = '18' and dep_time_min > 30 then deptimedummy = 38;
	if dep_time_hour = '19' and dep_time_min <= 30 then deptimedummy = 39;
	if dep_time_hour = '19' and dep_time_min > 30 then deptimedummy = 40;
	if dep_time_hour = '20' and dep_time_min <= 30 then deptimedummy = 41;
	if dep_time_hour = '20' and dep_time_min > 30 then deptimedummy = 42;
	if dep_time_hour = '21' and dep_time_min <= 30 then deptimedummy = 43;
	if dep_time_hour = '21' and dep_time_min > 30 then deptimedummy = 44;
	if dep_time_hour = '22' and dep_time_min <= 30 then deptimedummy = 45;
	if dep_time_hour = '22' and dep_time_min > 30 then deptimedummy = 46;
	if dep_time_hour = '23' and dep_time_min <= 30 then deptimedummy = 47;
	if dep_time_hour = '23' and dep_time_min > 30 then deptimedummy = 48;
run;

proc freq data = allsampdepanlover;
	tables deptimedummy;
run;



*Get rid of portions that are less than 1% of data (keep deptimedummy 12-46);
data depanalysisover;
	set allsampdepanlover;
	if deptimedummy >= 12 and deptimedummy <= 46 then output;
run;



proc freq data = depanalysisover;
	tables cancelled;
run;




*Check to see if there's anything with cancellations: 
*Test of Assocation with Cancelled;
proc freq data = depanalysisover;
	tables deptimedummy*cancelled / expected chisq relrisk oddsratio cl;
run;

*looks like 80 percent or more of cells have expected counts greater than 5
*let's try delays;

proc freq data = depanalysis;
	tables deptimedummy*dep_del15 / expected chisq relrisk oddsratio cl;
run;

proc means data = depanalysis median;
	var deptimedummy;
run;

*let's use 28 as base cause it's the median deptimedummy value;
proc logistic data = depanalysis plots(only)=oddsratio;
	class deptimedummy(ref = '28') / param=effect;
	model dep_del15(event = '1') = deptimedummy / clodds=pl clparm=pl;
run;

*this doesn't actually give anything cause it's basically linear;


*what about cancellations?;
proc freq data = depanalysisover;
	tables deptimedummy*cancelled / expected chisq relrisk oddsratio cl;
run;
*there is some association, let's try logistic regression;


ods excel file="/opt/sas/home/vcarden/sasuser.viya/BlogTopics/logregparam.xlsx";
proc logistic data = depanalysisover plots(only)=oddsratio;
	class deptimedummy(ref = '28') / param=effect;
	model cancelled(event='1') = deptimedummy / clodds=pl clparm=pl;
	weight weights;
	ods output ParameterEstimates;
run;
ods excel close;



*let's try with continuous departure time variable;
proc contents data = depanalysis;
run;
/* Testing the Assumptions of a One-Way ANOVA */ 
proc univariate data = depanalysis;
	class deptimedummy;
	var dep_delay;
	hist dep_delay;
	probplot dep_delay/normal;
run;

*not normal;




*overall logistic regression for delays: day_of_week, op_unique_carrier;
proc logistic data = allsamp;
	class day_of_week op_unique_carrier / param=effect;
	model dep_del15(event='1') = day_of_week op_unique_carrier day_of_week*op_unique_carrier / clodds=pl clparm=pl;
run;

*there's a few relevant factors here and there, especially in interaction terms;



*need to subset analysis cause of significant intereactions;
*subset by airlines (Delta, Southwest, SkyWest Airlines);
*Delta;
data deltadata;
	set allsamp;
	where op_unique_carrier = 'DL';
run;

proc freq data = deltadata;
	tables day_of_week*dep_del15 / oddsratio chisq;
run;
*significant;

proc logistic data = deltadata;
	class day_of_week(ref='4') / param=effect;
	model dep_del15(event='1') = day_of_week / clodds=pl clparm=pl;
run;


*Southwest;
data swdata;
	set allsamp;
	where op_unique_carrier = 'WN';
run;

proc freq data = swdata;
	tables day_of_week*dep_del15 / oddsratio chisq;
run;
*significant;

proc logistic data = swdata;
	class day_of_week(ref = '4') / param=effect;
	model dep_del15(event='1') = day_of_week / clodds=pl clparm=pl;
run;


*SkyWest;
data oodata;
	set allsamp;
	where op_unique_carrier = 'OO';
run;

proc freq data = oodata;
	tables day_of_week*dep_del15 / oddsratio chisq;
run;

proc logistic data = oodata;
	class day_of_week(ref = '3') / param=effect;
	model dep_del15(event='1') = day_of_week / clodds=pl clparm=pl;
run;

proc freq data = oodata;
	tables day_of_week;
run;




*Thursday;
data thursdaydata;
	set allsamp;
	where day_of_week = 4;
run;

proc freq data = thursdaydata;
	tables op_unique_carrier*dep_del15 / oddsratio chisq;
run;
*significant;

proc logistic data = thursdaydata;
	class op_unique_carrier(ref = 'DL') / param=effect;
	model dep_del15(event='1') = op_unique_carrier / clodds=pl clparm=pl;
	ods output ParameterEstimates = new_data;
run;

proc print data = new_data;
	format ProbChiSq 30.29;
run;












*overall logistic regression for cancellations: day_of_week, op_unique_carrier;
proc logistic data = depanalysisover;
	class day_of_week op_unique_carrier / param=effect;
	model cancelled(event='1') = day_of_week|op_unique_carrier @2 / clodds=pl clparm=pl;
	weight weights;
run;





proc freq data = allsamp;
	tables day_of_week;
run;

