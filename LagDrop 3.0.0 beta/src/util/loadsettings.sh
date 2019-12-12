#!/bin/sh
loadSettings(){
    ### Setup directory variables
    export PINGMEM="cache/pingmem"
    export GEOMEMFILE="cache/geomem"
    export FILTERIGNORE="cache/filterignore"

    #Settings stored here, called from memory
    # CONSOLENAME,DIR_ROOT set from lagdrop.sh
    IFS="="
    i=0
    while read -r name value
    do
        if [ $i == 0 ] #the first line has the device name followed by the ip
        then
            export LAGDROP_CONSOLE="$value"
            export LAGDROP_CONSOLENAME="$name"
        else
            export "LAGDROP_${name}"="${value}"
        fi
        i=$((i + 1))
    done < "${DIR_ROOT}/42Kmi/options_${CONSOLENAME}".txt

    if [ $VERBOSE ] 
    then
        echo "LOADED:"
        export | grep "LAGDROP"
    fi
    
    return 
}