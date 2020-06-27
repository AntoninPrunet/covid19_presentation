---
title       : covid19 App Presentation
subtitle    : 
author      : Antonin Prunet
date        : 2020-06-27
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Getting Started




- The objective of our application is to visualize the evolution of covid19 epidemic around the world.

- The initial data originates from a csv file that can be found on [Our world in data website](https://covid.ourworldindata.org/data/owid-covid-data.csv).

- But we finally work with this processed data file that can be found on [github](https://github.com/AntoninPrunet/covid19/blob/master/data/covid_data.csv).

- [User interface](https://github.com/AntoninPrunet/covid19/blob/master/ui.R) and [server](https://github.com/AntoninPrunet/covid19/blob/master/server.R) files for the app can also be found on the same [github repository](https://github.com/AntoninPrunet/covid19).

- To get started, you can play with the date slider on the left sidebar panel, change the selected countries you wish to observe in the first chart and modify the three other parameters which result in `2^3 = 8` different kinds of observations.

---

## Architecture of the application



`ui.R`


- Loading the required libraries and data.

- Definition of a Sidebar Panel with multiple inputs (`date`, `country`, `type`, `new` and `ratio`).

- And definition of a main Panel with two outputs (`plot` and `geo`).



`server.R`

- Loading the required libraries and data.

- Creation of two reactive variables: `selected_data1` for the first chart and `selected_data2` for the second chart.

- Building each one of the two outputs (`plot` and `geo`).


---

## Plotly output for `plot`


```r
library(plotly, quiet=TRUE)
library(ggplot2, quiet=TRUE)
p <- ggplot(data = data1, aes(date, value, color=location)) +
            geom_line() + ylab("Total Deaths") +
            geom_vline(xintercept = as.numeric(ymd("2020-06-02"))) + theme_bw()
ggplotly(p)
```

<img src="assets/fig/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />



---
## GoogleVis Output

```r
library(googleVis)
geo <- gvisGeoChart(data2,
                  locationvar = "location",
                  colorvar = "value",
                  option = list(projection="kavrayskiy-vii",
                                colorAxis="{colors:['white','brown']}",
                                height = 300, width = 900))
plot(geo, tag = 'chart')
```

<!-- GeoChart generated in R 3.6.3 by googleVis 0.6.5 package -->
<!-- Sat Jun 27 05:54:55 2020 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID76102bbdfbb8 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Afghanistan",
265
],
[
"Albania",
33
],
[
"Algeria",
661
],
[
"Andorra",
51
],
[
"Angola",
4
],
[
"Anguilla",
0
],
[
"Antigua and Barbuda",
3
],
[
"Argentina",
556
],
[
"Armenia",
139
],
[
"Aruba",
3
],
[
"Australia",
102
],
[
"Austria",
668
],
[
"Azerbaijan",
68
],
[
"Bahamas",
11
],
[
"Bahrain",
19
],
[
"Bangladesh",
672
],
[
"Barbados",
7
],
[
"Belarus",
240
],
[
"Belgium",
9486
],
[
"Belize",
2
],
[
"Benin",
3
],
[
"Bermuda",
9
],
[
"Bhutan",
0
],
[
"Bolivia",
343
],
[
"Bonaire Sint Eustatius and Saba",
0
],
[
"Bosnia and Herzegovina",
153
],
[
"Botswana",
1
],
[
"Brazil",
29937
],
[
"British Virgin Islands",
1
],
[
"Brunei",
2
],
[
"Bulgaria",
144
],
[
"Burkina Faso",
53
],
[
"Burundi",
1
],
[
"Cambodia",
0
],
[
"Cameroon",
199
],
[
"Canada",
7326
],
[
"Cape Verde",
4
],
[
"Cayman Islands",
1
],
[
"Central African Republic",
4
],
[
"Chad",
66
],
[
"Chile",
1113
],
[
"China",
4638
],
[
"Colombia",
969
],
[
"Comoros",
2
],
[
"Congo",
20
],
[
"Costa Rica",
10
],
[
"Cote d'Ivoire",
33
],
[
"Croatia",
103
],
[
"Cuba",
83
],
[
"Curacao",
1
],
[
"Cyprus",
17
],
[
"Czech Republic",
321
],
[
"Democratic Republic of Congo",
72
],
[
"Denmark",
576
],
[
"Djibouti",
24
],
[
"Dominica",
0
],
[
"Dominican Republic",
502
],
[
"Ecuador",
3394
],
[
"Egypt",
1005
],
[
"El Salvador",
46
],
[
"Equatorial Guinea",
12
],
[
"Eritrea",
0
],
[
"Estonia",
68
],
[
"Ethiopia",
12
],
[
"Faeroe Islands",
0
],
[
"Falkland Islands",
0
],
[
"Fiji",
0
],
[
"Finland",
320
],
[
"France",
28833
],
[
"French Polynesia",
0
],
[
"Gabon",
17
],
[
"Gambia",
1
],
[
"Georgia",
12
],
[
"Germany",
8522
],
[
"Ghana",
36
],
[
"Gibraltar",
0
],
[
"Greece",
175
],
[
"Greenland",
0
],
[
"Grenada",
0
],
[
"Guam",
5
],
[
"Guatemala",
116
],
[
"Guernsey",
13
],
[
"Guinea",
23
],
[
"Guinea-Bissau",
8
],
[
"Guyana",
12
],
[
"Haiti",
45
],
[
"Honduras",
217
],
[
"Hungary",
532
],
[
"Iceland",
10
],
[
"India",
5598
],
[
"Indonesia",
1641
],
[
"Iran",
7878
],
[
"Iraq",
215
],
[
"Ireland",
1650
],
[
"Isle of Man",
24
],
[
"Israel",
287
],
[
"Italy",
33475
],
[
"Jamaica",
9
],
[
"Japan",
894
],
[
"Jersey",
29
],
[
"Jordan",
9
],
[
"Kazakhstan",
41
],
[
"Kenya",
69
],
[
"Kosovo",
30
],
[
"Kuwait",
220
],
[
"Kyrgyzstan",
17
],
[
"Laos",
0
],
[
"Latvia",
24
],
[
"Lebanon",
27
],
[
"Lesotho",
0
],
[
"Liberia",
27
],
[
"Libya",
5
],
[
"Liechtenstein",
1
],
[
"Lithuania",
70
],
[
"Luxembourg",
110
],
[
"Macedonia",
140
],
[
"Madagascar",
6
],
[
"Malawi",
4
],
[
"Malaysia",
115
],
[
"Maldives",
6
],
[
"Mali",
78
],
[
"Malta",
9
],
[
"Mauritania",
23
],
[
"Mauritius",
10
],
[
"Mexico",
10167
],
[
"Moldova",
307
],
[
"Monaco",
5
],
[
"Mongolia",
0
],
[
"Montenegro",
9
],
[
"Montserrat",
1
],
[
"Morocco",
205
],
[
"Mozambique",
2
],
[
"Myanmar",
6
],
[
"Namibia",
0
],
[
"Nepal",
8
],
[
"Netherlands",
5962
],
[
"New Caledonia",
0
],
[
"New Zealand",
22
],
[
"Nicaragua",
35
],
[
"Niger",
65
],
[
"Nigeria",
299
],
[
"Northern Mariana Islands",
2
],
[
"Norway",
236
],
[
"Oman",
50
],
[
"Pakistan",
1621
],
[
"Palestine",
5
],
[
"Panama",
344
],
[
"Papua New Guinea",
0
],
[
"Paraguay",
11
],
[
"Peru",
4634
],
[
"Philippines",
960
],
[
"Poland",
1074
],
[
"Portugal",
1424
],
[
"Puerto Rico",
136
],
[
"Qatar",
40
],
[
"Romania",
1279
],
[
"Russia",
4855
],
[
"Rwanda",
1
],
[
"Saint Kitts and Nevis",
0
],
[
"Saint Lucia",
0
],
[
"Saint Vincent and the Grenadines",
0
],
[
"San Marino",
42
],
[
"Sao Tome and Principe",
12
],
[
"Saudi Arabia",
525
],
[
"Senegal",
42
],
[
"Serbia",
244
],
[
"Seychelles",
0
],
[
"Sierra Leone",
46
],
[
"Singapore",
24
],
[
"Sint Maarten (Dutch part)",
15
],
[
"Slovakia",
28
],
[
"Slovenia",
108
],
[
"Somalia",
79
],
[
"South Africa",
705
],
[
"South Korea",
272
],
[
"South Sudan",
10
],
[
"Spain",
27127
],
[
"Sri Lanka",
11
],
[
"Sudan",
298
],
[
"Suriname",
1
],
[
"Swaziland",
3
],
[
"Sweden",
4403
],
[
"Switzerland",
1656
],
[
"Syria",
5
],
[
"Taiwan",
7
],
[
"Tajikistan",
47
],
[
"Tanzania",
21
],
[
"Thailand",
57
],
[
"Timor",
0
],
[
"Togo",
13
],
[
"Trinidad and Tobago",
8
],
[
"Tunisia",
48
],
[
"Turkey",
4563
],
[
"Turks and Caicos Islands",
1
],
[
"Uganda",
0
],
[
"Ukraine",
727
],
[
"United Arab Emirates",
266
],
[
"United Kingdom",
39045
],
[
"United States",
105147
],
[
"United States Virgin Islands",
6
],
[
"Uruguay",
23
],
[
"Uzbekistan",
15
],
[
"Vatican",
0
],
[
"Venezuela",
17
],
[
"Vietnam",
0
],
[
"Western Sahara",
1
],
[
"Yemen",
84
],
[
"Zambia",
7
],
[
"Zimbabwe",
4
] 
];
data.addColumn('string','location');
data.addColumn('number','value');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID76102bbdfbb8() {
var data = gvisDataGeoChartID76102bbdfbb8();
var options = {};
options["width"] = 900;
options["height"] = 300;
options["projection"] = "kavrayskiy-vii";
options["colorAxis"] = {colors:['white','brown']};

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID76102bbdfbb8')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID76102bbdfbb8);
})();
function displayChartGeoChartID76102bbdfbb8() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID76102bbdfbb8"></script>
 
<!-- divChart -->
  
<div id="GeoChartID76102bbdfbb8" 
  style="width: 900; height: 300;">
</div>
