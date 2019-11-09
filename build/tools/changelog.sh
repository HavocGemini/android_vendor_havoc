#!/bin/bash
#
# Copyright (C) 2018 Havoc-OS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Changelog=Changelog.txt
export Changelog=Changelog.txt

if [ -n "$1" ]; then changelog_days=$1; fi

if [ "$changelog_days" != "0" ]; then

echo "" > $Changelog

for i in $(seq $changelog_days);
do
export After_Date=`date --date="$i days ago" +%m-%d-%Y`
k=$(expr $i - 1)
	export Until_Date=`date --date="$k days ago" +%m-%d-%Y`

	echo " 〉 Generating day number $i ▪ $Until_Date.."
	source=$(repo forall -pc 'git log --oneline --after=$After_Date --until=$Until_Date');

	if [ -n "${source##+([:space:])}" ]; then

                echo '====================' >> $Changelog;
                echo  "     "$Until_Date    >> $Changelog;
                echo '====================' >> $Changelog;
		repo forall -pc 'git log --oneline --after=$After_Date --until=$Until_Date' | grep -v "Automatic translation import" | sed 's/^$/#EL /' | sed 's/^/ ▪ /' | sed 's/ ▪ #EL //' >> $Changelog
		echo >> $Changelog;
	fi
done

sed -i 's/▪ project /▼ /g' $Changelog
fi
cp $Changelog $OUT/system/etc/
cp $Changelog $OUT/
cp $Changelog OTA/$HAVOC_BUILD.md
