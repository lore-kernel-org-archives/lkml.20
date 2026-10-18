Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E2645D5C9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322935; cv=none; b=Q4P5C8ciFGFqF1JysgkgIZ7XRdpxOZnu4UmbF12z/oy3lB6hVJ2iEFqRRLbYR2wcmd3375DjcSL8AxDR3UlPDNRT2dS2bluTHV5Bbqv2y9U05boQVBpfIdl4Z7AFOGc0tvawGZR5HoQthmxX0xYC69jHmVOsrSegT16yx/grgVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322935; c=relaxed/simple;
	bh=VlvgQ/fPnzlNeZ/d8s9JUAo0EmaICESF7BtkezSt8MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNFpStZxuxD12S9wumuQ6OokzvNoicUJWEnsd2ICOO51YUFM6nJ4MxzqRNWF9/ET2c1yDyB0R16NYKscsj8x07ABZ/KNeQtNsA9kn4Mbqyrmdhue6Nap0WCLOGhJm7P19RqpjJfCUVP1XBjTlxGCA5YETr8CTdctB8rC4WqccKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4/1OZOQ; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4/1OZOQ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so2994451eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322934; x=1792927734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtTnOVNUm4BmMYxyMUgfuuBNnwTj7EfEu/u6UU5rBMU=;
        b=U4/1OZOQ5gSEETS3Eg8Kqj18+eFJLs8VZrLzDBH3jacK81mIS6hmS+c2V/ZdyV3COP
         JttBtLq5R0yI8TJK4uVpe9UeMC4M/Vb4KWp1gghd8UhFPJ6Fw6wMc11PeDfYhdxPHzYP
         xpk/WXzZiJM5A9donu01TRPL2//TGK45JYkxwl33mA/xrKuNZm3KHiKEf/DdDRABFB07
         zQTcswndySYjIxtmii7j84Rd8GJXFHYTSe0LyUP9c5Sh4XBUUeZZqWPfUfpg55QT5wzx
         DP2dtNY/ewJZ3j5p3TJKn971Xwa5LXLRrt8w/la1pCTcNoXPdY5m0J901BGz9CGVkI1N
         enSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322934; x=1792927734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtTnOVNUm4BmMYxyMUgfuuBNnwTj7EfEu/u6UU5rBMU=;
        b=kySay1pylnVtIHky5vHbyvwthISL95VhkYnnmsO9PbRYwaR6TQgCSNx3N71x6pnEEV
         RxshGZv+gDTVyhbDhC7HVGxzu43ekcc1ezNJydC4UAZfOEB0IUtnB3kTrA3kMub+6c+3
         to8CO4Wa8+3M597d3p89cNnpKjteMDQzHe/Dm2xw1YxCK7JSNkigpxgGcK/iymcJnRZF
         CnbLVO9+G6gB0QX3ygkIVtN5hyd5lznxDIRRztfXI5h2gVp6L7vYQwfepLQR8OJfyhuO
         pXGpTQuK33HYgseOx5HFwfThZ+IMujNbH8k7hkHp7VfE0MTrX/TpXzndQFovLtMymhqG
         llQw==
X-Gm-Message-State: AFq9FYLnCh8TdIugLeYxA946JE8lF8DwUb/VWD2MnQiuPAr1e/7ugdFU
	tpnvMHy/IW8Llkzar+8IOv3jzlIPw3f2UpiKZrWe6O7Z26lWkJ0SYrjzzr6KKpfA
X-Gm-Gg: AYBFou3sN16jkT8iUatd6CrAdpav6ijGQFM74Ix/4man6ZFPO/BId2BG+IconNLqdPf
	AeiL6SQTHr6xQe7Yu8m8rItnHzQCSR6VBtG6cj8kPkYLxSqCbVoVLyH8nnAXMxvH0WY4dWItGCt
	Fs04qcvvq90auZGNGXc7GEhDMR50SNCsHxDuI6DQiG16Zji+XRnzPnCD7hGUFE42142iRCLwC5l
	BxRtpZ8zqMiLZLWvjaA2xjhqqI9fbFLvXvi1RunzmE8ojqQvkrkBCEgZ6qL1aseCKr88VLYO2aC
	dKzG48eSM1KxsrVasNue5Z9F6U64F2yVT9pLxl/r2zW+8DMqEMAy9Ow1PYvVrmkwbiGW5B+AWXN
	Dgi/b7KM2WlzzojOxPhT9R2kThfDjVyssDQgndo8Z0z89e6WY82tplhOcP98Rfr2151JqiqfqzM
	HeqrtaAtpInWQSnH7Ute5RdTexl3QvgMKlwx3l7V+LQAI1uGkf8VGJnbgA61dbtWarIJCn/uuMC
	EXKk74y7XiTzIJRfX8aIVSy/V/R7L7gqqb4b9ruQQ==
X-Received: by 2002:a05:7301:1885:b0:361:7edc:1541 with SMTP id 5a478bee46e88-361a126f7b2mr6780003eec.7.1792322933466;
        Sun, 18 Oct 2026 04:28:53 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:52 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 4/7] scripts: convert headerdep.pl to Python
Date: Sun, 18 Oct 2026 08:28:35 -0300
Message-ID: <20261018112838.16355-5-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018112838.16355-1-breno3011alves@gmail.com>
References: <20261018112838.16355-1-breno3011alves@gmail.com>
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

