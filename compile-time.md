# Compile Time

| Configuration                         | Original | Patched |
| ------------------------------------- | -------- | ------- |
| opt_level=z lto=off codegen_units=16  | 51.7s    | 46.3s   |
| opt_level=z lto=off codegen_units=1   | 67.7s    | 67.6s   |
| opt_level=z lto=thin codegen_units=16 | 55.9s    | 55.9s   |
| opt_level=z lto=thin codegen_units=1  | 76.2s    | 69.4s   |
| opt_level=z lto=fat codegen_units=16  | 92.1s    | 91.7s   |
| opt_level=z lto=fat codegen_units=1   | 97.2s    | 97.3s   |
| opt_level=3 lto=off codegen_units=16  | 83.9s    | 83.4s   |
| opt_level=3 lto=off codegen_units=1   | 103.9s   | 103.6s  |
| opt_level=3 lto=thin codegen_units=16 | 68.6s    | 68.6s   |
| opt_level=3 lto=thin codegen_units=1  | 115.2s   | 115.6s  |
| opt_level=3 lto=fat codegen_units=16  | 140.2s   | 137.2s  |
| opt_level=3 lto=fat codegen_units=1   | 141.9s   | 142.5s  |
