# Project Workspace Management Script

This repository contains a Bash script designed to streamline the process of creating and deleting project workspaces, along with their associated GitHub repositories.

## Description

The script provides two main functionalities:

1. **Creating a New Project Workspace**: It sets up a new project workspace in a designated directory, initializes a Git repository, creates a corresponding private repository on GitHub, and opens the workspace in Visual Studio Code (VSCode).

2. **Deleting an Existing Project Workspace**: It deletes a specified project workspace and its associated GitHub repository after confirmation from the user.

## Usage

### Creating a New Project
To create a new project workspace, simply run the script without any arguments. You will be prompted to enter a name for your new project.

```bash
/path/to/script.sh
```

### Deleting an Existing Project
To delete an existing project workspace and its associated GitHub repository, use the `--delete` flag followed by the project name.

```bash
/path/to/script.sh --delete [ProjectName]
```

## Customization

### Workspace Directory
By default, the script uses `~/Documents/vsCodeWorkspaces/` as the location for creating project workspaces. You can modify this path in the script to suit your preferred workspace location.

Locate the following line in the script:

```bash
local workspace_dir="~/Documents/vsCodeWorkspaces/$workspace"
```

Change `~/Documents/vsCodeWorkspaces/` to your desired directory path.

### Setting Up an Alias (Optional)
For ease of use, you can set up an alias for this script in your shell configuration file (`.bashrc` or `.zshrc`).

1. Open your shell configuration file in a text editor. For example, for `zsh`, use:

   ```bash
   nano ~/.zshrc
   ```

2. Add the following line at the end of the file (adjust the path to the script as necessary):

   ```bash
   alias newproject='/path/to/script.sh'
   ```

3. Save the file and exit the editor.

4. Apply the changes by sourcing your configuration file:

   ```bash
   source ~/.zshrc
   ```

   Or simply restart your terminal.

Now you can use `newproject` to run the script.

---

*Note: Ensure that the script has execute permissions. Use `chmod +x /path/to/script.sh` to set the necessary permissions.*

---
