Ransomware tracker data visualisation
=====================================

[Ransomware tracker](https://ransomwaretracker.abuse.ch) is a great resource for
following current ransomware campaigns. This repository includes some scripts to assist
in visualising the data from RT using [mal4s](https://github.com/secure411dotorg/mal4s).

Overview
--------

1. rt-processing.awk: an AWK script that will take the current rt feed and generate a
   well formatted mal4s file
2. rt-lastest.conf: a sample configureation file for mal4s
3. rt-latest.mal4s: sample RT data in mal4s format
4. A data directory containing some icons

### Using the script

To generate the mal4s formatted data file (rt-latest.mal4s) execute the following:

``` bash
curl -s http://ransomwaretracker.abuse.ch/feeds/csv/ |\
    grep -v ^# |\ 
    sed 's/"//g' |\
    rt-processing.awk | sort -n >\
    rt-latest.mal4s

```

Running the mal4s visualisation:

After adding the contents of the data directory to mal4s (c:\mal4s on windows), execute the following:

```
mal4s.exe -C rt-latest.conf -c 4 -f rt-latest.mal4s
```

Limitations
-----------

1. Tested on linux. Mal4s output can be used on Windows and Mac OS X systems, but generation scripts cannot.

