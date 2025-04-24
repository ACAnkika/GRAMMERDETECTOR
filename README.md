# GRAMMERDETECTOR
# GrammarDetector

**A simple Python-based command-line tool for detecting grammatical errors in text.**

## Overview

GrammarDetector is a lightweight tool designed to help you identify potential grammatical mistakes in your writing. It leverages the power of the `language_tool_python` library to analyze text and highlight possible errors, along with suggestions for correction.

**Key Features:**

* **Simple Command-Line Interface:** Easy to use directly from your terminal.
* **Error Detection:** Identifies common grammatical errors such as spelling mistakes, punctuation issues, subject-verb agreement problems, and more.
* **Suggestion Display:** Provides potential corrections for the detected errors.
* **Customizable Language:** Supports checking grammar in various languages (depending on the capabilities of `language_tool_python`).
* **Input from Files or Direct Text:** Analyze text directly entered in the command line or from a specified text file.

## Installation

1.  **Prerequisites:** Ensure you have Python 3.6 or higher installed on your system.

2.  **Install via pip:**
    ```bash
    pip install grammar-detector-cli
    ```
    *(Note: The actual package name on PyPI might be slightly different. If the above command fails, try searching for "grammar-detector" on PyPI: [https://pypi.org/](https://pypi.org/))*

    Alternatively, if you have the source code:
    ```bash
    git clone [repository_url]
    cd grammar-detector
    pip install .
    ```

3.  **Install LanguageTool (if not already installed):**
    `language_tool_python` often requires a running LanguageTool server or a local installation of LanguageTool. The library might handle downloading a lightweight version automatically, but for full functionality, consider installing LanguageTool separately:
    * Download LanguageTool from the official website: [https://languagetool.org/download](https://languagetool.org/download)
    * Follow the installation instructions for your operating system.

4.  **Ensure LanguageTool is accessible:** If you installed LanguageTool separately, make sure the `languagetool-server` is running in the background, or configure `language_tool_python` to point to your local installation.

## Usage

GrammarDetector can be used in two main ways:

**1. Analyzing text directly from the command line:**

```bash
grammardetect "This sentense has some missstakes."
