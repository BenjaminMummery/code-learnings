# code-learnings

## Bash Configuration

### `.bashrc`

- Sources the contents of .bash_functions
- Sets `python` to point to python3
- Sets the PYLINTRC environment variable
- Sets the following QoL aliases:
  - `please`: do the last command again, this time with `sudo`
  - `pytestc`: run pytest with a full coverage report
    ```
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
      ````
      
 ### `.bash_functions`
 
 - Provides the `venv` command. This does a few different things depending on the context:
   - if no venv exists, create one and activate it.
   - if a venv exists, activate it.
   - if a venv is currently active, deactivate it.
  
