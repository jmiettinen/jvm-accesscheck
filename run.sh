#!/usr/bin/env bash


script_dir="$(cd $(dirname $0) && pwd -P)"
additional_switches="$(tr '\n' ' ' < ${script_dir}/command_line_switches.cfg)"

java -version
echo ""
echo "Used switches: ${additional_switches}"
echo ""

java -cp "${script_dir}/target/accesscheck.jar" ${additional_switches} fi.relex.Check
