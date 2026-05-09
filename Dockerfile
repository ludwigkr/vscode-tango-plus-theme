FROM node:22

# Set the working directory in the container
WORKDIR /app

# Install VS Code extension packaging tool globally
RUN npm install -g @vscode/vsce

# Copy the current directory contents into the container at /app
COPY . .

# Install npm dependencies (if any)
RUN npm install

# Package the VS Code extension into a .vsix file
RUN npx @vscode/vsce package

# Command to keep the container running (useful for debugging)
CMD ["tail", "-f", "/dev/null"]
