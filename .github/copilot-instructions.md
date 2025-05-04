Här är ett utkast till en `copilot-instructions.md`-fil som du kan använda för ett generellt Python-projekt som körs i Docker. Den använder GitHub Copilots nya anpassningsmöjligheter enligt [den officiella dokumentationen](https://code.visualstudio.com/docs/copilot/copilot-customization).

````markdown
# copilot-instructions.md

## Project context

This is a general-purpose Python project that is developed and executed in a Docker container. The source code is located in the `src/` directory. Unit tests are located in the `tests/` directory. The project uses a `Makefile` to simplify common tasks such as building the image, running the container, and executing tests.


## Language and communication

- All **code**, **comments**, **docstrings**, and **documentation** must be written in **English**
- This applies even when the developer communicates in Swedish in discussions or commit messages
- Variable names, function names, and error messages must also be in English

## Codebase conventions

- Python version: 3.9 or later
- Use [PEP8](https://peps.python.org/pep-0008/) style guidelines
- Type annotations should be used consistently
- Logging should use the standard `logging` module (not `print`)
- All code should include docstrings using Google-style or reStructuredText format
- When applicable, break code into small, testable functions
- Avoid global state unless explicitly required
- If a script is meant to be run directly, it must have:
  ```python
  if __name__ == "__main__":
      ...
````

## Docker environment

* All development and testing is done inside Docker
* The container is built from a `Dockerfile` located in the root
* The container should mount the current directory to `/app`
* Dependencies are installed via `requirements.txt`
* Run the container using `make run`, which maps the source and allows interactive execution
* Tests are run with `make test` (typically calling `pytest` inside the container)

## GitHub Copilot usage guidelines

* Prefer suggesting code that is Docker-aware (e.g., paths inside `/app`, port mappings, environment variables)
* When suggesting shell commands, assume they are run from inside the container unless stated otherwise
* For package installation, suggest adding it to `requirements.txt` and rebuilding the image
* When a script accesses files, assume file paths are relative to the project root and mounted into the container
* Prefer clear and simple code with type annotations over clever but hard-to-read solutions
* When a new module or function is created, suggest including a matching unit test in the `tests/` directory

## Testing

* Use `pytest` for unit testing
* Test files are named `test_*.py` and placed under `tests/`
* Coverage is tracked using `pytest-cov`
* Mock external services or I/O where possible
* All public methods and functions must have corresponding tests

## Output format

* Code suggestions should follow the format and conventions used in existing files
* When completing a partial function or method, complete the entire block
* Prefer multi-line suggestions when clarity benefits
* Avoid abbreviations or non-standard naming unless required by context

```

Vill du även inkludera exempel på hur man kör kommandon i Docker, eller särskilda konventioner för `Makefile`-användning?
```
