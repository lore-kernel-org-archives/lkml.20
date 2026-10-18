Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C946AF04
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318363; cv=none; b=S2+2aQndD0VT7ZBSzDgKuh/OFOmDylEndGffagP6Vm/2qRBWBvt3aoAd6ZC2mVFPHOSplsTo2WVCMKOQuwGcf5wkuKbMeucZf1OU6ivB8Y2k9HU6qs3lhfMbhayEbJapV9b8zLdF6JqXcCaDWxmDpwFSvJ8Te9PTV1PJPWYTF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318363; c=relaxed/simple;
	bh=tgGlQDGkDf8aw3Hc8AS3kKWB+B+/jN17iaMbDT83WXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2qFbmEfJLm0N8FSUnWUSUtPMzphMb38oSdQ9KTuAW8xMdcHJvKX1ymieJnC2O5NG/T5casRB0dNFoaX5+DOKaLiEAOFo79DTCz86Napq11q2hKQ878u01CNBjmNe9yljOZoD8yB9nimB3va3kNXA+OXieXl9zStaDeiP5Be8YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUe01eKk; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUe01eKk"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2161959eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792318359; x=1792923159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5gJ3+HV2+Co1aFLNrgVHCrItz3CLgnL8CWy5loFkaI=;
        b=UUe01eKkN0W90quVSz6pIXyq6dhsELYXlBIMNS8FZG51eJZmhdCb4bDMwDIB8koAq/
         kjRm0PUD+ufeQv06YBABDUQY8QbCi62QZOIVbaLk5KyUkGgpCzOf1BVKJZOlB3Uz1CFt
         GblvGXEim40FEdlL5LS6f7t2QH4a7qP7gFf6A5gkNpA5YBtVSSBPNh28AQq5C2SbICJ8
         DENRuReCfLQP2v6dioZKC/fHwb3jGTlvQqueZyoK+MfmLeRJqGWvbeyjxbT4GRK0VBMT
         GUMSLejChXrIOBtb9L2SFeFtpcrgmUTGi0DSIeVllhjtG05xIZ0FXjGisPL982VkmFzV
         1yFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318359; x=1792923159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5gJ3+HV2+Co1aFLNrgVHCrItz3CLgnL8CWy5loFkaI=;
        b=HKOtC8GD9/OYqhwWlhtR9UNG/V6NX9ynBoNyPOOQm1fJ6XsyefcODFMCRIkuQtbOBv
         RHn/Hctp5tV9T6WMnmG/Ekb6wQZ+5l0kIpwp99WuWfpCRetqzmiqLnYuG+pYIS74O6nz
         F+tLsx0LeOVYG7JluLwYoWI8sSltwSzIm0bxZYBrdSeisDbVzQXS+/sVK1jiqhWGfAFn
         Po6BNOuZHMc+bSqJxjAMoDZyi/HTaeV5UTiVj1i1F4beJ/jyrFjdXmTXofehIp9PkbvQ
         AR2ohoiPAjc1/d5X1lUzEXm88uglvOTBnyMx0rY8ghT0/xlwqnEGIcEKyzW6xvZp6SjO
         UdPg==
X-Gm-Message-State: AFq9FYJJ1Xsnnz/oV/AU+Zm7s5Bn9b3xYMnhn338dq/2Gu8+40fi0tOD
	ihFH+fi0s53mt6OF1/fEm1RbddgFTa5jCzLo3TjcAOwrUbwjH0FR8kGbFGG/vCdT
X-Gm-Gg: AYBFou35igEitweSd4ThKu5NbUdst8XzP+ZjOrx+1SVfORV1ZZWSlQMYWVp9vRFIzlS
	L4k6nJXPTN/fxyEPiGbHioAblouwHl1s0x9sywmMfnvv5bDqMaiyJJ6noskby6bcunG/P2pCD5F
	PaS9esRgupW3RLjvDHqjqe7sVBGdx1MdC+bz4l13urQ0qcOavDBHc90AJx1+dL3gRUXKhfvzoI7
	q68GR6wC4PYF5vxruiUswqwd8LDNJjPrFUOrC6a4fM58tpCh2QYhZJexU0EFYoitNRSSSgmlQdk
	UjGrPIJPGb8r0+TUJ8DyWpEBFNaAY5UsOoesYPOKP0bGdXwFuUQSYGy2MeyUM1dQeP9Z2DqLDDs
	Im7W5CyGZlxrMluET1ATM5Qkf1gBNmoQUEY6hiAG1TbNhi+cC3ESScT5uL2ZhtHV7nlXXaezjNd
	mU2uUiqeQekMS2nIPEy2DizXjDPy1Icx/YEyJc2nWWFR3d+/NUnjOOtGsutUg9XrH/mlry50/Nr
	05x01is6Hj4lOVHNeQ459SNHDuQGxtszJqL6NOg5Q==
X-Received: by 2002:a05:7022:3f03:b0:147:a685:9125 with SMTP id a92af1059eb24-1850c223256mr7490273c88.2.1792318358793;
        Sun, 18 Oct 2026 03:12:38 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm17967876c88.14.2026.10.18.03.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:12:38 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 1/4] scripts: convert bootgraph.pl to Python
Date: Sun, 18 Oct 2026 07:12:24 -0300
Message-ID: <20261018101227.7680-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018101227.7680-1-breno3011alves@gmail.com>
References: <20261018101227.7680-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of bootgraph.pl in Python 3 (stdlib only).
Same CLI (-h, -header), same SVG output, same error handling.

One intentional change: the Perl version has an unreachable
'exit 1' after 'help(1); exit 1;' (help() already calls exit 0),
so it always returned 0 even on error. The Python version
returns exit 1 when no data is found in dmesg.

Tested with a synthetic dmesg containing three initcalls;
generated SVG is byte-for-byte identical to the Perl output.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/bootgraph.py | 194 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100755 scripts/bootgraph.py

diff --git a/scripts/bootgraph.py b/scripts/bootgraph.py
new file mode 100755
index 000000000..6839d2824
--- /dev/null
+++ b/scripts/bootgraph.py
@@ -0,0 +1,194 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright 2008, Intel Corporation
+# Authors: Arjan van de Ven <arjan@linux.intel.com>
+#
+# Turn dmesg output into an SVG graphic showing which initcalls take
+# how much time. The kernel must be compiled with CONFIG_PRINTK_TIME
+# and booted with "initcall_debug" on the command line.
+#
+# usage:
+#     dmesg | python3 scripts/bootgraph.py > output.svg
+
+import argparse
+import re
+import subprocess
+import sys
+
+RE_CALLING     = re.compile(r'([0-9.]+)\] calling  ([a-zA-Z0-9_.]+)\+')
+RE_PID         = re.compile(r'@ ([0-9]+)')
+RE_ASYNC_WAIT  = re.compile(r'([0-9.]+)\] async_waiting @ ([0-9]+)')
+RE_RETURNED    = re.compile(r'([0-9.]+)\] initcall ([a-zA-Z0-9_.]+)\+.*returned')
+RE_ASYNC_CONT  = re.compile(r'([0-9.]+)\] async_continuing @ ([0-9]+)')
+RE_STOP        = re.compile(r'(Write protecting the|Freeing unused kernel memory)')
+
+STYLES = [
+    'fill:rgb(0,0,255);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(0,255,0);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(255,0,20);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(255,255,20);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(255,0,255);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(0,255,255);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(0,128,255);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(0,255,128);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(255,0,128);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(255,255,128);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(255,128,255);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+    'fill:rgb(128,255,255);fill-opacity:0.5;stroke-width:1;stroke:rgb(0,0,0)',
+]
+STYLE_WAIT = 'fill:rgb(128,128,128);fill-opacity:0.5;stroke-width:0;stroke:rgb(0,0,0)'
+
+HEADERSTEP = 20
+XHEADER    = 15
+YHEADER    = 25
+
+
+def usage(exit_code=1):
+    stream = sys.stdout if exit_code == 0 else sys.stderr
+    print('Usage:', file=stream)
+    print('1) dmesg | python3 scripts/bootgraph.py [OPTION] > output.svg',
+          file=stream)
+    print('2) python3 scripts/bootgraph.py -h', file=stream)
+    print('', file=stream)
+    print('Options:', file=stream)
+    print('\t-header\tInsert kernel version and date', file=stream)
+    sys.exit(exit_code)
+
+
+def parse_dmesg(stream):
+    """Return (start, end, types, pids, count, first, last)."""
+    start, end, types, pids, pidctr = {}, {}, {}, {}, {}
+    done = False
+    first, last, count = 99999.0, 0.0, 0
+
+    for line in stream:
+        m = RE_CALLING.search(line)
+        if m:
+            func = m.group(2)
+            if not done:
+                start[func] = float(m.group(1))
+                types[func] = 0
+                first = min(first, start[func])
+            mp = RE_PID.search(line)
+            if mp:
+                pids[func] = int(mp.group(1))
+            count += 1
+
+        m = RE_ASYNC_WAIT.search(line)
+        if m:
+            pid = int(m.group(2))
+            pidctr[pid] = pidctr.get(pid, 0) + 1
+            func = f'wait_{pid}_{pidctr[pid]}'
+            if not done:
+                start[func] = float(m.group(1))
+                types[func] = 1
+                first = min(first, start[func])
+            pids[func] = pid
+            count += 1
+
+        m = RE_RETURNED.search(line)
+        if m and not done:
+            end[m.group(2)] = float(m.group(1))
+            last = end[m.group(2)]
+
+        m = RE_ASYNC_CONT.search(line)
+        if m:
+            pid = int(m.group(2))
+            func = f'wait_{pid}_{pidctr.get(pid, "")}'
+            end[func] = float(m.group(1))
+            last = end[func]
+
+        if RE_STOP.search(line):
+            done = True
+
+    return start, end, types, pids, count, first, last
+
+
+def emit_svg(out, start, end, types, pids, first, last, header):
+    out.write('<?xml version="1.0" standalone="no"?> \n')
+    out.write('<svg width="2000" height="100%" version="1.1" '
+              'xmlns="http://www.w3.org/2000/svg">\n')
+
+    if header:
+        version = subprocess.check_output(['uname', '-a'], text=True).rstrip()
+        date = subprocess.check_output(['date'], text=True).rstrip()
+        out.write(f'<text transform="translate({XHEADER},{YHEADER})">'
+                  f'Kernel version: {version}</text>\n')
+        cyheader = YHEADER + HEADERSTEP
+        out.write(f'<text transform="translate({XHEADER},{cyheader})">'
+                  f'Date: {date}</text>\n')
+
+    mult = 1950.0 / (last - first)
+    threshold2 = (last - first) / 120.0
+    threshold = threshold2 / 10
+
+    stylecounter = 0
+    rows, rowscount = {}, 1
+
+    for key in sorted(start.keys(), key=lambda k: start[k]):
+        duration = end[key] - start[key]
+        if duration < threshold:
+            continue
+        pid = pids.get(key)
+        if pid not in rows:
+            rows[pid] = rowscount
+            rowscount += 1
+        s = (start[key] - first) * mult
+        s2, s3 = s + 6, s + 1
+        e = (end[key] - first) * mult
+        w = e - s
+        y = rows[pid] * 150
+        y2 = y + 4
+        style = STYLES[stylecounter]
+        stylecounter = (stylecounter + 1) % 12
+        if types[key] == 1:
+            y += 15
+            out.write(f'<rect x="{s:.15g}" width="{w:.15g}" y="{y}" '
+                      f'height="115" style="{STYLE_WAIT}"/>\n')
+        else:
+            out.write(f'<rect x="{s:.15g}" width="{w:.15g}" y="{y}" '
+                      f'height="145" style="{style}"/>\n')
+            if duration >= threshold2:
+                out.write(f'<text transform="translate({s2:.15g},{y2}) '
+                          f'rotate(90)">{key}</text>\n')
+            else:
+                out.write(f'<text transform="translate({s3:.15g},{y2}) '
+                          f'rotate(90)" font-size="3pt">{key}</text>\n')
+
+    # top timeline
+    time = first
+    step = (last - first) / 15.0
+    while time < last:
+        s3 = (time - first) * mult
+        tm = int(time * 100) / 100.0
+        out.write(f'<text transform="translate({s3:.15g},89) rotate(90)">{tm:.15g}</text>\n')
+        time += step
+
+    out.write('</svg>\n')
+
+
+def main(argv):
+    parser = argparse.ArgumentParser(add_help=False)
+    parser.add_argument('-h', '--help', action='store_true')
+    parser.add_argument('-header', '--header', action='store_true')
+    args = parser.parse_args(argv)
+
+    if args.help:
+        usage(0)
+
+    start, end, types, pids, count, first, last = parse_dmesg(sys.stdin)
+
+    if count == 0:
+        print("No data found in the dmesg. Make sure that 'printk.time=1' and",
+              file=sys.stderr)
+        print("'initcall_debug' are passed on the kernel command line.",
+              file=sys.stderr)
+        usage(1)
+
+    emit_svg(sys.stdout, start, end, types, pids, first, last, args.header)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

