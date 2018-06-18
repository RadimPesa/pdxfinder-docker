#!/bin/bash

java -jar /pdxfinder/indexer/target/indexer-1.0.0.jar -loadIRCC --irccpdx.url=file:///import-data/IRCC.json --irccpdx.variation.url=file:///import-data/IRCCVariants.json
