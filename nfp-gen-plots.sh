#!/bin/sh

# Generate plots for NFP based data. Needs to be invoked from the
# directory the data is located.

for base in nfp-lat_cmd_sizes nfp-lat_cmd_details_cdf nfp-lat_dma_details_cdf \
            nfp-lat_dma_sizes nfp-lat_dma_sizes_byte_inc; do
    [ ! -r ${base}.dat ] && continue
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/$base.gpl
done

# Plot for PCIe CMD Latency tests sweeping over a window
for f in lat_cmd_sweep*.dat; do
    [ ! -r ${f} ] && continue
    base=`basename $f .dat`
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/nfp-lat_cmd_sweep.gpl
done

# Plot for PCIe CMD Latency tests with different offsets
for f in lat_cmd_off*.dat; do
    [ ! -r ${f} ] && continue
    base=`basename $f .dat`
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/nfp-lat_cmd_off.gpl
done

# Plot for PCIe DMA Latency tests sweeping over a window
for f in lat_dma_sweep*.dat; do
    [ ! -r ${f} ] && continue
    base=`basename $f .dat`
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/nfp-lat_dma_sweep.gpl
done

# Plot for PCIe DMA Latency tests with different offsets
for f in lat_dma_off*.dat; do
    [ ! -r ${f} ] && continue
    base=`basename $f .dat`
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/nfp-lat_dma_off.gpl
done

# Plot for PCIe DMA Bandwidth tests for different transfer sizes
for base in nfp-bw_dma_sz_sweep nfp-bw_dma_off; do
    [ ! -r ${base}.dat ] && continue
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/$base.gpl
done
for base in bw_dma_off_rd bw_dma_off_rd_cold \
            bw_dma_off_wr bw_dma_off_wr_cold; do
    [ ! -r ${base}.dat ] && continue
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/nfp-bw_dma_off.gpl
done

# Plot for PCIe DMA bandwidth tests sweeping over a window
for f in bw_dma_win_sweep*.dat; do
    [ ! -r ${f} ] && continue
    base=`basename $f .dat`
    echo $base
    gnuplot -e "base='$base'" ../gnuplot-templates/nfp-bw_dma_win_sweep.gpl
done
