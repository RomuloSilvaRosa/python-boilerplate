# Project Name

This project aims to ...
## Table of Contents
- [Project Name](#project-name)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Common Errors](#common-errors)
  - [Generate docs](#generate-docs)
  - [Linting and Cleaning](#linting-and-cleaning)
  - [Contributing](#contributing)
  - [Documentation](#documentation)
  - [Maintainers](#maintainers)

## Prerequisites

Before running the project, make sure you have the following prerequisites:

- Python 3.x installed
- AWS CLI configured with appropriate permissions
- Required Python packages installed (see `requirements.txt`)
- `make` command-line tool available (for development environment)



## Common Errors

The following errors could appear in the project:

- `NoCredentialsError`: This error occurs when the AWS CLI is not configured with appropriate credentials. Make sure you have configured the AWS CLI with valid credentials.


- `ModuleNotFoundError`: This error occurs when a required module or package is not installed. Check the `requirements.txt` file and make sure all the required packages are installed by running `pip install -r requirements.txt`.

- `ClientError`: This error occurs when there is an issue with the AWS service API request. It could be due to incorrect permissions or invalid input parameters. Check the AWS service documentation for more information on specific error codes and messages.
## Generate docs

 ```shell
  make docs
  ```

## Linting and Cleaning

During the development process, the project includes linting and cleaning functionalities provided by the `Makefile`. Here are the available targets for linting and cleaning:

- `lint`: This target removes unused imports and variables, and formats the code using the `black` tool. It also checks for linting errors using `pyflakes`. To run linting, execute the following command:

  ```shell
  make lint
  ```

- `clean`: This target deletes all `.pyc` and `__pycache__` files. To clean the project, execute the following command:

  ```shell
  make clean
  ```

## Contributing

Contributions to this project are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

To contribute to the project, follow these steps:

1. Create a non-production branch
2. Make your desired changes.
3. Test your changes to ensure they work as intended.
4. Lint and generate docs.
5. Create a pull request on the original repository to propose your changes.

Please make sure to follow the project's coding style and guidelines.

## Documentation
- [`Documentation`](./docs/DOCUMENTATION.md)
## Maintainers

This project is maintained by the XXX team:

- [XXX](XXX@somoseducacao.com.br)

Feel free to reach out to any of the maintainers with questions or concerns.