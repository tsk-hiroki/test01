#!/bin/sh

set -xeu

ENV=$1
WORK_FILE=$(mktemp)
echo "aaaa" > ${WORK_FILE}
#cat ${WORK_FILE}


replace_yml() {
if [ ${ENV} = pr ]
then
   sed -i -e 's/aaaa/bbbb/g' ${WORK_FILE}
else
   sed -i -e 's/aaaa/cccc/g' ${WORK_FILE}
fi
}
replace_yml
echo "dddd" > ${WORK_FILE}
replace_yml
cat ${WORK_FILE}

