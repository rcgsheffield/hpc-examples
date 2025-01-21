# HPC-Examples Repository

## Overview
The `hpc-examples` repository provides a collection of curated scripts and workflows for Stanage and Bessemer high-performance computing (HPC) systems. These examples are designed to help users efficiently use SLURM schedulers, manage resources, and run HPC applications.

This repository is public and intended to be used as a resource by HPC administrators, users, and maintainers for setting up and executing various HPC tasks.

---

## Repository Structure

- `docs/`
  Documentation files.

- `examples/`
  Example SLURM job scripts and workflows.

- `tests/`
  SLURM test scripts for validating application functionalityi, configurations, etc.

- `tools/`
  Helper scripts for users.

- `scripts/`
  General-purpose scripts for users.

- `configs/`
  Example configuration files for commonly used HPC applications.

---

## Key Features

### 1. SLURM Job Scripts
A comprehensive collection of SLURM scripts for different use cases:
- Optimized resource allocation.
- Parallel and distributed computing.
- Custom job arrays for batch processing.

### 2. Application Workflows
Ready-to-use examples for popular HPC applications, examples:
- Python (MPI, TensorFlow, PyTorch).
- MATLAB.
- Ansys.
- Abaqus.


---

## How to Use

1. **Clone the Repository**
   Clone the repository to your local machine or HPC system:
   ```bash
   git clone https://github.com/rcgsheffield/hpc-examples.git
   ```

2. **Navigate Through Examples**
   Browse the directory structure to locate scripts relevant to your needs. For example:
   ```bash
   cd hpc-examples/examples
   ```

3. **Run or Adapt Scripts**
   Use the scripts as-is or modify them to fit your specific requirements. For SLURM job submission:
   ```bash
   sbatch example_script.sh
   ```

4. **Refer to Documentation**
   Check the [documentation](https://docs.hpc.shef.ac.uk/) for detailed guides on using the examples and configuring your HPC environment.

---

## Contributing

We welcome contributions from the community. To contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Add your scripts or updates.
4. Submit a pull request with a detailed description of your changes.

### Contribution Guidelines
- Scripts should be well-documented with comments explaining each section.
- Follow consistent naming conventions (e.g., `slurm-<description>.sh`).
- Use descriptive, kebab-case names for files and directories.
- Include version numbers in filenames for version-specific examples.
- Ensure your scripts are tested on an HPC system.

---

## Support

If you encounter any issues or have questions, please raise an issue in the GitHub repository or contact the maintainers.

---

## License

This repository is licensed under the [MIT License](LICENSE). You are free to use, modify, and distribute the content with attribution.

---

## Resources

- [SLURM Documentation](https://slurm.schedmd.com/documentation.html)
- [Repository URL](https://github.com/rcgsheffield/hpc-examples)
- [Sheffield HPC Docs](https://docs.hpc.shef.ac.uk/)

