import xarray as xr
import os

grib_dir = r"E:\grib"
nc_dir = r"E:\nc"

os.makedirs(nc_dir, exist_ok=True)

years = range(1940, 2024)

for year in years:
    grib_file = os.path.join(grib_dir, f"{year}.grib")
    nc_file = os.path.join(nc_dir, f"{year}.nc")

    if os.path.exists(grib_file):
        print(f"Procesando {grib_file}...")

        ds = xr.open_dataset(grib_file, engine="cfgrib")

        ds.to_netcdf(nc_file)

        ds.close()

        print(f"Archivo convertido: {nc_file}")
    else:
        print(f"Archivo no encontrado: {grib_file}")

print("Conversión completada.")
