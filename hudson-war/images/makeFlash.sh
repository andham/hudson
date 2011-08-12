#!/bin/sh -ex
#**************************************************************************
#
# Copyright (C) 2004-2009 Oracle Corporation
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#         Kohsuke Kawaguchi
#
#**************************************************************************


# build a flashing animation image from a still picture
# Usage <src gif> <dst gif>
t=/tmp/flash$$

src=$1
dst=$2
convert $src -fill white -colorize 20% $t.80.gif
convert $src -fill white -colorize 40% $t.60.gif
convert $src -fill white -colorize 60% $t.40.gif
convert $src -fill white -colorize 80% $t.20.gif
convert $src -fill white -colorize 100% $t.0.gif
convert -delay 10 $src $t.80.gif $t.60.gif $t.40.gif $t.20.gif $t.0.gif $t.20.gif $t.40.gif $t.60.gif $t.80.gif -loop 0 $dst

rm $t.*.gif