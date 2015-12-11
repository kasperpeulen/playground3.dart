#!/bin/bash

# Fast fail the script on failures.
set -e

# Install global tools.
pub global activate tuneup

pub global activate grinder

grind travis