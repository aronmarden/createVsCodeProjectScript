#!/bin/bash

# Function to delete a project workspace and its associated GitHub repository
delete_project() {
    local workspace="$1"
    local workspace_dir="$HOME/Documents/vsCodeWorkspaces/$workspace"
    local confirm_phrase="I understand this will delete everything in $workspace"

    echo "WARNING: You are about to irreversibly delete the entire directory $workspace_dir and its associated GitHub repository."
    read -p "Are you sure you want to proceed? (y/N) " confirm_delete

    if [[ $confirm_delete == 'Y' || $confirm_delete == 'y' ]]; then
        read -p "Type the exact phrase to confirm: '$confirm_phrase' " typed_phrase
        if [[ "$typed_phrase" == "$confirm_phrase" ]]; then
            echo "Deleting workspace and GitHub repository..."
            rm -rf "$workspace_dir"
            gh repo delete "$workspace" --confirm
            echo "Deletion complete."
        else
            echo "Phrase mismatch. Operation aborted."
        fi
    else
        echo "Operation aborted."
    fi
}

# Main script logic for creating a new project or deleting an existing one
if [[ $1 == '--delete' ]]; then
    delete_project "$2"
else
    # Ask for the new project name
    read -p "What do you want to call your new project? " PROJECT_NAME

    # Define the directory where the project will be created
    WORKSPACE_DIR="$HOME/Documents/vsCodeWorkspaces/$PROJECT_NAME"

    # Create a new directory for the workspace
    echo "Creating new workspace directory at $WORKSPACE_DIR"
    mkdir "$WORKSPACE_DIR"
    cd "$WORKSPACE_DIR"
    echo "Changed directory to $WORKSPACE_DIR"

    # Initialize the directory as a Git repository
    echo "Initializing a new Git repository in the workspace"
    git init

    # Create the .gitignore file with the specified rules
    echo "Creating .gitignore file"
    cat <<EOL > .gitignore
**/node_modules/
*.ignore
EOL

    # Add .gitignore to the repository
    git add .gitignore
    git commit -m "Add .gitignore file"

    # Create a new private repository on GitHub
    echo "Creating a new private repository on GitHub named $PROJECT_NAME"
    gh repo create "$PROJECT_NAME" --private --source=. --confirm

    # Open the new workspace in VSCode
    echo "Opening VSCode in the new workspace"
    code .

    echo "Workspace setup complete!"
fi
