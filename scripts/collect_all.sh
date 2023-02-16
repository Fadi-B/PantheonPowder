cd pantheon/

var=$(cat ../traces.txt)

CC_SCHEMES="bbr copa cubic fillp fillp_sheep indigo ledbat pcc pcc_experimental sprout taova vegas verus vivace sprout-ewma sprout-fadi sprout-0 sprout-5 sprout-25 sprout-50 sprout-75"

TIME=30
RUNS=1

sudo src/experiments/setup.py --setup --schemes "$CC_SCHEMES"

for line in $var
do
   mkdir "${line}"
   src/experiments/test.py local --schemes "$CC_SCHEMES" --uplink-trace /usr/share/mahimahi/traces/${line}-driving.up --downlink-trace /usr/share/mahimahi/traces/${line}-driving.down --data-dir ${line} -t ${TIME} --run-times ${RUNS} --pkill-cleanup
   src/analysis/analyze.py --data-dir ${line}
done

