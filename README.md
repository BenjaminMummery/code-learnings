# code-learnings

<!--TOC-->

- [code-learnings](#code-learnings)
  - [Home Configuration Files](#home-configuration-files)
    - [Installation](#installation)
    - [.git-template](#git-template)
    - [`.bash_functions`](#bash_functions)
    - [`.bash_profile`](#bash_profile)
    - [`.bashrc`](#bashrc)
    - [`.coveragerc`](#coveragerc)
    - [`.gitconfig`](#gitconfig)
    - [`.gitignore`](#gitignore)
    - [`.pre-commit-config.yaml`](#pre-commit-configyaml)
  - [Tips and Tricks](#tips-and-tricks)

<!--TOC-->

## Home Configuration Files

### Installation

Copy the contents of the `home_config_files` dir to your home directory. In your global python environment, run:

```bash
pip install pre-commit
```

### .git-template

Template for new git repos. Sets all hooks to point to pre-commit so that they can be centrally managed.

### `.bash_functions`

- Provides the `venv` command. This does a few different things depending on the context:
  - if no venv exists, create one and activate it.
  - if a venv exists, activate it.
  - if a venv is currently active, deactivate it.

### `.bash_profile`

- Sources [`.bashrc`](#bashrc) if we're in an interactive shell.

### `.bashrc`

- Sources the contents of [`.bash_functions`](#bash_functions).
- Sets `python` to point to python3
- Sets the PYLINTRC environment variable
- Sets the following QoL aliases:
  - `please`: do the last command again, this time with `sudo`
  - `pytestc`: run pytest with a full coverage report

    ```text
    $ pytestc

    ================================== test session starts ===================================
    platform darwin -- Python 3.8.10, pytest-7.1.2, pluggy-1.0.0
    rootdir: /Users/benjaminmummery/Documents/Projects/pre-commit-hooks
    plugins: mock-3.8.1, shutil-1.7.0, git-1.7.0, cov-3.0.0
    collected 49 items  

    tests/system/test_add_msg_issue.py ...............                                 [ 30%]
    tests/unit/test_add_msg_issue.py ..................................                [100%]

    ---------- coverage: platform darwin, python 3.8.10-final-0 ----------
    Name                                  Stmts   Miss  Cover   Missing
    ---------------------------------------------------------------------------------
    add_msg_issue_hook/__init__.py            0      0   100%
    add_msg_issue_hook/add_msg_issue.py      63     10    84%   158-171
    ---------------------------------------------------------------------------------
    TOTAL                                    63     10    82%
    ```

  - `mnt`: human readable mounted drive information
  - `gh`: search command history.

    ```bash
    $ gh pyt
    1002  python3
    1017  pytestc
    ```
  - `pcinit`: create a symbolic link to `~/.pre-commit-config.yaml` in the current working directory. We use this to share pre-commit configurations across repos.

### `.coveragerc`

Configuration for pytest-cov.

- Ignores coverage on anything in `./tests/`.
- Doesn't complain about missed coverage on debug-only code (`def __repr__` or `if self\.debug`).
- Doesn't complain if tests don't hit defensive assertion code (`raise AssertionError` or `raise NotImplementedError`).
- Doesn't complain if non-runable code isn't run (`if 0:` or `if __name__ == .__main__.:`)

### `.gitconfig`

Global config file for git. The main feature here is the `[core]:excludesfile` entry which points to `~/.gitignore`. This means that the [.gitignore](#gitignore) file in the HOME directory will be applied to all repose, saving you the effort of adding things like `venv` to the gitingnore in every single repo. This can be augmented with gitignore files in individual repos.

You may wish to alter the `[core]:editor` entry to your preferred editor.

### `.gitignore`

Global .gitignore file. The [.gitconfig](#gitconfig) file included above tells git where to find this.

Most of the exclusions are pretty standard, we will draw attention to `*scratch*`, which excludes any file with "scratch" somewhere in their name or path. We use this for test files or quick notes which should never be committed.

### `.pre-commit-config.yaml`

Configuration file for `pre-commit`. In our experience, a shared configuration is the most useful approach, so we use this as the single source of truth anc create symlinks to it with the `pcinit` command alias provided by our [`.bashrc`](#bashrc).## Tips and Tricks

## Tips and Tricks

The tips_and_tricks directory contains notes on useful habits, shortcuts, and techniques.
