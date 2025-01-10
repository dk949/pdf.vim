# pdf.vim

## Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Default mappings](#default-mappings)
4. [Configuration](#configuration)
5. [Functions](#functions)

## Introduction

A plugin to read PDF documents in vim.

## Installation

Install the plugin with you preferred plugin manager.

* Vundle example
``` vim
Plugin 'dk949/pdf.vim'
```
* Packer example
``` lua
use { 'dk949/pdf.vim', ft = { "pdf" } }
```

## Default mappings

By default pages are turned with arrow keys. The cursor still moves as normal.


## Configuration

* `g:pdf_vim_use_default_mappings`
    * If set to 0 no mappings will be created. See |pdf-vim-functions| for a
      list of available functions to map.

## Functions

* `pdf#loadPage({num})`
    * Loads page number {num}.
    * If {num} <= 0 or {num} > pages in the document, the whole document gets
      loaded as a single page.
    * Returns 1 if page was within range and 0 otherwise.

* `pdf#chPage({dir})`
    * Change page in the direction of {dir}.
    * {dir} can be either 1 or -1.
    * Cannot change to page 0 (or smaller).
    * Will display the whole document as a single page after reaching the end.

