#!/bin/bash

vyatta_sbin=/opt/vyatta/sbin

wr=$vyatta_sbin/vyatta-cfg-cmd-wrapper

opt_cmd=$1
shift
cmdline=$*

cfg_stdin ()
{
  while read line
  do
    eval $wr "$line"
  done
}

cfg_cmdline ()
{
  eval $wr $cmdline
}

. /etc/bash_completion

$wr begin

if [ "${opt_cmd}" = "-c" ]
then
  cfg_cmdline
else
  cfg_stdin
fi

$wr commit

$wr end
