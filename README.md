# PCIe Bench data

This repository contains the data from running the microbenchmark on a
number of different systems. The directories follow the certain
naming convention (see below).

There are also some scripts to visualise/plot the data using
`gnuplot`. For Netronome NFP results, `cd` in the result directory and
execute `../nfp-gen-plots.sh`. This will use `gnuplot` templates in
`./gnuplot-templates` to generate a large number of plots. Note, not
all data is plotted. Feel free to add additional templates/plots.

Some of the plots require a `bw_calc.dat` file to be present,
containing the effective bandwidth for the PCIe configuration used
when running the test. `bw_calc.dat` can be generated with
[`pcie_bw.py`](https://github.com/pcie-bench/pcie-model/blob/master/pcie_bw.py).


## Naming convention

The data from each test configuration is stored in a directory
following this convention:

`<card>_<Host CPU>_<Model>_[<Topology>][_<Misc>]`

The major parts of the directory name are separated by `_` while the
minor sub-parts inside the major part are separated by `-`.



### Host CPU naming conventions

The host CPU contains several sub-parts. First is the CPU
architecture.  For Intel CPUs we use the following abbreviations (tock
is a major new micro-architecture, while tick typically denotes a
process shrink):

- `nb` Netburst
- `core` Core (tock) and Penryn (tick)
- `nhm` Nehalem (tock) and Westmere (tick)
- `snb` Sandy Bridge (tock)
- `ib`  Ivy Bridge (tick)
- `hsw` Haswell (tock)
- `bdw` Broadwell (tick)
- `sl`  Skylake (tock)

The second portions contains the CPU model number as reported by
`/proc/cpuinfo`.

Examples are: `snb-Xeon-E5-2630` or `hsw-Xeon-E5-2620v3`


### Computer model naming conventions

The computer model name should contain the name of the vendor and the
model number of the machine.  For example: `dell-t620` of `hp-z440`.


### Optional Topology naming conventions

The topology portion of the name should only be used for results from
systems with multiple sockets.  The topology is expressed in the
format `sX-sY-sZ`, where `X` is the socket the PCIe device is plugged
into, `Y` is the socket the memory got allocated from, and `Z` is the
socket the control program, and therefore the cache thrashing/warming,
was executed.


### Miscellaneous naming conventions

The last section of the directory name should contain other
significant information.  Use, for example, `iommu` if the IO-MMU was
enabled, `iommu-nosp` if the IO-MMU was used with Super Page support
disabled.  Other options would be `gen2x4` if the device, which is
natively a PCIe gen3 x8 device, is used in a PCIe gen2 x4 slot.

