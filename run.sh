#!/usr/bin/env bash


script_dir="$(cd $(dirname $0) && pwd -P)"
additional_switches="$(tr '\n' ' ' < ${script_dir}/command_line_switches.cfg)"
echo ${additional_switches}

java -cp "${script_dir}/target/accesscheck.jar" ${additional_switches} fi.relex.Check
