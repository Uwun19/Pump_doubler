# SPDX-License-Identifier: Apache-2.0
#
# Regenerates lef/tt_um_regulated_pump.lef from mag/tt_um_regulated_pump.mag.
#
# Run it from the mag/ directory:
#
#   PDK_ROOT=<your pdk root> magic -dnull -noconsole \
#       -rcfile $PDK_ROOT/sky130A/libs.tech/magic/sky130A.magicrc mag/export_lef.tcl
#
# The "-hide -pinonly" flags matter. Without them Magic exports the whole net
# connected to each port label, which puts port geometry on li1/met1/met2/met3,
# merges ports that share a net into a single PIN, and makes the Tiny Tapeout
# pin check fail. With them each port becomes exactly one met4 rectangle, which
# is what the precheck expects. This is the same command the Tiny Tapeout analog
# template uses in magic_init_project.tcl.
#
# Note that this script deliberately does not rewrite gds/. Re-exporting the GDS
# from the .mag does not reproduce the committed GDS bit for bit, because Magic
# re-derives the standard cell implant and boundary layers, so the signed off
# GDS is kept as the authoritative artifact.

load tt_um_regulated_pump
lef write ../lef/tt_um_regulated_pump.lef -hide -pinonly
quit -noprompt
