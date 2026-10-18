Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E694C2270
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331862; cv=none; b=UAReZSIHayXmJ4MOrSck+0GhBTimjUM2wZBmuUtuEaAVYbyGVgVtTJUq6e03fjB24ytQsWTKXs5eiDLbdxBAbb65vaeVRnBWqZ+ZoBNW95QLGu3x0BH+SuGBDPpvc52njRmhcKnZOacRYC203VZlEKDGqaaDlbigw634Gu24HGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331862; c=relaxed/simple;
	bh=VlvgQ/fPnzlNeZ/d8s9JUAo0EmaICESF7BtkezSt8MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3UT7roys3mExZrUxAUTS9MSbBjF/ST2HvVejoRTmmKd0d00vDv6fDiP69u74iLc4UXwfKR4G/dE+V2QPWQnlaXZ3/6G8xS7BABoiNA+fudYgH0UuaFr55h4Jk61QQD9eZzux2D35Sv66hd16lNYc66bqFeTnF/zE3brhZp+gC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1KBnCm0; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1KBnCm0"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2314982eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331860; x=1792936660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtTnOVNUm4BmMYxyMUgfuuBNnwTj7EfEu/u6UU5rBMU=;
        b=m1KBnCm0961tLcDbENV1WCphvCcmAtARgJ+UL+nPcvL7diRXg2KI0GoeaV17DaJpVK
         lejsVT18z2Y7uzKnV5Nhuw+8Ob0rz/huahZQbQ6MPRaHqedhG8XsCvdIo3pjmfgbBULy
         312vc2E7w4VVWOH4/eMk2iLHYr06dIXu9QIWaW3wbbRGuXc0gdnWMIMTpm3B+pYKCMAZ
         tjv6tFjqpCce/pS1YwjxVNllGPZA8yLq+PBVvMJ6sLGXK0djFT9RcQSN0u34bRMfAPsG
         ilSRiSFYTHA6msIMUyb8muoAHCQvIZNPHpvu0LBs0kIMnIyKFSlkWjatBf3I6GxxIkfC
         nW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331860; x=1792936660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtTnOVNUm4BmMYxyMUgfuuBNnwTj7EfEu/u6UU5rBMU=;
        b=yKhyypfTNApdv5V4f+NsPsobvKYlymmlRqK7vSil0pce4a49alyDx4r5YRzF+fI6Z3
         iUk3N4ZVDPK3TdVLY4lDadHrXIauSaAH5vcRKqDelSL9sZZhlwyMIRpWoSXyeAlbxE0h
         QF39+8aEkV2Z9DhwwrdXkUdIyEahlkQEBk4ePD4R4G3jloWPJ+s4VPEBQPuTM5m8R9G6
         eFsyQuvQMjNxolk/Yj7aISiVhsRTWhIhKwc+TGaddxgRS1/LgonEbRgofzmipdfwalAY
         QmDoJFJA+gO58hFZ65qJccboOCHKMZyS1kaZOI3fX+RLKAPBiWXKykWPopaWa6GACvwR
         VTVQ==
X-Gm-Message-State: AFq9FYI90tdEA74uf2A1ytWCj4xUEL9SpKrG5ABcVoGoPa2A8GhRfQ7u
	cnaLfiVyX/mxf09Kdz16cJehLV1l6PfuxVdBL9Ybbxtv5OcePEhGcUqMiy5sX1uy
X-Gm-Gg: AYBFou3eltPA+IWHo+8LwlFj7tQAyiCCWxkx2CIqHzZBWRE1sabW6MxRht+pn9PpaQO
	u8wJOafcYdt1Ju+afwinlbfxWkGl6e/7KCFMTMVFKOlUsidtzlZM3/l5QQ9wlxKd5OYpm7sbzYG
	7P2G7FixfN3/UyXvWyA61m2abPLpip5CByZNWqDANUHDnnpjzF8kP11czF0kPalS4qI7mSbpivB
	iEgJ28tqbzXQSRd5sxzwGjXyj0rHdX40WgluUrlwdmk7pJ+8ogcNDMqux7ZXdkoLAMfWgu4wbbr
	sZB8mQIaamj/ASX0WFM18TWjB688jgCO1mS6BbUqdNGYUNd1pVvIggiifAZUbEYXy0BJ4m2PGJY
	Lx5xz8KBAwveR6d6TMVmHyAevzNySfpH+n1JbEM09Y8ofRv3bVuPCWQI8CQYNpa80/j7ROLxtdh
	jRbZCmYEkHPCgdWAIXZ25Pann6rsFxXAhukpjuvJBDK++06XsDdxRsy2cholLT0C9PcqkiNboks
	f1W1IJq4QRZLkIZB+TqmULUJ3JUYj1ZCA0N/oFA9cU=
X-Received: by 2002:a05:693c:8353:b0:34d:2c1a:9892 with SMTP id 5a478bee46e88-361a274b361mr7381421eec.40.1792331860411;
        Sun, 18 Oct 2026 06:57:40 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 4/7] scripts: convert headerdep.pl to Python
Date: Sun, 18 Oct 2026 10:57:19 -0300
Message-ID: <20261018135722.27410-5-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018135722.27410-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
 <20261018135722.27410-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of headerdep.pl in Python 3
(stdlib only). Same include graph construction, same cycle
detection, same GraphViz output mode (--graph).

Verified byte-for-byte identical to the Perl version on a
synthetic cyclic include chain.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/headerdep.py | 137 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100755 scripts/headerdep.py

diff --git a/scripts/headerdep.py b/scripts/headerdep.py
new file mode 100755
index 000000000..4b9a57ab1
--- /dev/null
+++ b/scripts/headerdep.py
@@ -0,0 +1,137 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Detect cycles in the header file dependency graph.
+# Vegard Nossum <vegardno@ifi.uio.no>
+
+import argparse
+import os
+import re
+import sys
+
+deps = {}
+opt_include = []
+
+
+def strip(filename):
+    for inc in opt_include:
+        prefix = inc + '/'
+        if filename.startswith(prefix):
+            return filename[len(prefix):]
+    return filename
+
+
+def search(filename):
+    if os.path.isfile(filename):
+        return filename
+    for inc in opt_include:
+        path = f'{inc}/{filename}'
+        if os.path.isfile(path):
+            return path
+    return None
+
+
+def parse_all(headers):
+    queue = list(headers)
+    while queue:
+        h = queue.pop()
+        if h in deps:
+            continue
+        deps[h] = []
+        path = search(h)
+        if path is None:
+            continue
+        with open(path) as f:
+            lines = f.readlines()
+        for i, line in enumerate(lines):
+            m = re.match(r'^#\s*include\s*<(.*?)>', line)
+            if m:
+                dep = m.group(1)
+                queue.append(dep)
+                deps[h].append((i + 1, dep))
+
+
+def print_cycle(cycle):
+    # Shift line numbers to align with the "In file included" message
+    cycle = list(cycle)
+    for i in range(len(cycle) - 1):
+        cycle[i] = (cycle[i + 1][0], cycle[i][1])
+    cycle[-1] = (0, cycle[-1][1])
+
+    first = cycle.pop(0)
+    last = cycle.pop() if cycle else None
+
+    msg = 'In file included'
+    if last is not None:
+        print(f'{msg} from {last[1]},')
+    for hdr in reversed(cycle):
+        marker = ' <-- here' if last is not None and hdr[1] == last[1] else ''
+        print(f'{" " * len(msg)} from {hdr[1]}:{hdr[0]}{marker}')
+    print(f'{first[1]}:{first[0]}: warning: recursive header inclusion')
+
+
+def detect_cycles(headers, opt_all):
+    queue = [[(0, h)] for h in headers]
+    while queue:
+        top = queue.pop()
+        name = top[-1][1]
+        for dep in deps.get(name, []):
+            chain = top + [(dep[0], dep[1])]
+            if any(c[1] == dep[1] for c in top):
+                print_cycle(chain)
+                if not opt_all:
+                    return
+                continue
+            queue.append(chain)
+
+
+def mangle(name):
+    return name.replace('/', '__').replace('.', '_').replace('-', '_')
+
+
+def graph():
+    print('digraph {')
+    print()
+    print('\t/* vertices */')
+    for h in deps:
+        print(f'\t{mangle(h)} [label="{h}"];')
+    print()
+    print('\t/* edges */')
+    for h in deps:
+        for dep in deps[h]:
+            print(f'\t{mangle(h)} -> {mangle(dep[1])};')
+    print('}')
+
+
+def main(argv):
+    global opt_include
+
+    p = argparse.ArgumentParser(add_help=False)
+    p.add_argument('--all', action='store_true')
+    p.add_argument('--graph', action='store_true')
+    p.add_argument('-I', dest='includes', action='append', default=[])
+    p.add_argument('files', nargs='*')
+    p.add_argument('-h', '--help', '--version', action='store_true')
+    args = p.parse_args(argv)
+
+    if args.help:
+        print(f'Usage: {sys.argv[0]} [options] file...')
+        return 0
+
+    opt_include = list(args.includes) + ['include']
+    # Match Perl: grep { strip($_) } keeps the ORIGINAL path, using
+    # strip() only as a truthiness filter. This makes deps keys
+    # consistent with the Perl version (e.g. 'include/x.h', not 'x.h').
+    headers = [h for h in args.files if strip(h)]
+
+    parse_all(headers)
+
+    if args.graph:
+        graph()
+    else:
+        detect_cycles(headers, args.all)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

