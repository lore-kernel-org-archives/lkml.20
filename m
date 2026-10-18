Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFE3BED66
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321616; cv=none; b=W4lo4D+lEySM1/0Lptp5B9nPiyIu2hOgxBhdNpIeFsH7/WoSEF/VsP9bfurwlORYDX/BcYD2jiJ1SVsmLif/vkm2mMFu/ApSTH6He/Zq1DRhlzFrkbmrtmm28etfeeFHYIPRgxbd43LCQsWD//zSnNG5gr1MnicuhQ/allpMJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321616; c=relaxed/simple;
	bh=PinUGq/UNhMghCvtJLwPb1uDVVbjfHV9AW/9VuO03nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QktjOBdV6owcaMyNM3PsvllFjgfPDLcbYDxVy3U4ez6+nijSiva0ZRsBVRLZjjteTzpXpKIQtI1OxH9HKicWDDeMDpz8zNLW6dEM89d32UXjH1NqD07reZioSU5JBweBlGYMIf9bBkx8S8DdU0BFmh4UR58AdKRd2WWSN0xAKw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZpRkNM6; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZpRkNM6"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so3134935eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321614; x=1792926414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UacQs99vJtJ1xOGzd+IyU/dCkd0oo+Yt1hFHykOswVc=;
        b=PZpRkNM6A04ITmWkhQ6ydm/qXDtilzj+eGeeBdpeVxk0lic1LIQv4687sxRVvdJB57
         A5YlQOHI2xveX9wHONC4Ucaq/hzBh86i/lsqeZJGFM3A8tlWoo5zff1TG8B5woVVrhLq
         fwLpLDecdqLn0bvw/yme4hMx8bNhBSPvlmoiYSfwaNFOGQS5DQ5yWrusJoUmFuq1Cv/p
         uoA6Ng2bDhwIiWDf0iIthVJEa4bnlNh1E5oajJUXwQVYKHJo3Ia20eVjewmIk+43NZnP
         TQ1SHXPz1So9aXOHolHaq8zw/TAoscKZiwf6XKy6IUKlTqUXnXrnap6g3wiuFXzjz5Vq
         cQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321614; x=1792926414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UacQs99vJtJ1xOGzd+IyU/dCkd0oo+Yt1hFHykOswVc=;
        b=WDUEy7y00xbo0FiJGAR6R+vuC3d1S56JgK9B/YbHy5tOKrkv9jUxmtVE3qDHp2jTOk
         QNLxlnE7TJjJv1YjW9LCyI58aQjaROvuq6iK+upSYSa9Q7Id+RuLrQhQTyWBKogkE/oT
         RPByscAZYUfzTrbi/b/jCGaXDTmbFBe/CZQ6N+lLOVG6SJ+sLb9ouXXrFkF/Vf9sHOBt
         5RIfnFCToHaw/37trFc6LuWOAQVZFlXKAMOfQiuFP/7gp7vKVvipPDEJ48AsrVnSevsI
         5aGNxeC254aFyHhTd0n/GXlp6cqKCQj3iNdCfCmgHJhe2l8XpwawXRxO16b+FfshVZNw
         Jekg==
X-Gm-Message-State: AFq9FYKkqurBm1ydoKYy2nIZAnAQe3brIEzZMvQ3P6QEziSntQXiowl4
	eiaRLLsLez8OayOCPAFILoV9F02xwYD+1zESRVGFxye3LUZUX/bRkWIotkS7xI84
X-Gm-Gg: AYBFou0Z+zZMYcwJMv4og2PrNQMP0CeCldKrSMKXOYRGO/bgrduPo3VlnpGcijYBmB3
	zw9Vy/n+Akod7iY+QTDH+PHW18sRCFHx3SoR44pBoSlRFQ14gMxRHcTmh+iFyJvgY3yE6g6M66J
	S/hsFfr7XVVDkE08CGRk1ot00oPWzitJgauwgbQb1DLchQVul7HanOkkPR83gG/U1LELAA1h6LT
	j3S0OPdmLjxjy8371bWcIngIIt3Ix9EXzs24A66DjpoyTreVuI/e9q7L4P7KrjANOeKGWoa8jsr
	bwsKt/FZduybSecxbp8BLxn01GINWExcWy7fyKv/dTJwtaewrewChghk6Ki0QQKZhzUMWGu93WJ
	w2yAG7dCk09S1X8MZ9wB+IO19i+LZBMZeW4YQqYpWBRGlMSQx5Ci2Y07B3McWQ/lyCbpo1kAMVh
	5jlBE0Yj3lfNwz2d+CmiusVGdgHL5Jh+klVMkPbw3VUpQHWbypTN2fDnEUxEmAqrUFDR2Ydk9sh
	W8QvOs60ySlYWr0ZagywsxUupUrqyJ+d75FA6yfsSE=
X-Received: by 2002:a05:7301:4242:b0:353:599e:4f8f with SMTP id 5a478bee46e88-361a2644656mr7165706eec.29.1792321614412;
        Sun, 18 Oct 2026 04:06:54 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:53 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 4/7] scripts: convert generate_initcall_order.pl to Python
Date: Sun, 18 Oct 2026 08:06:35 -0300
Message-ID: <20261018110638.9947-5-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018110638.9947-1-breno3011alves@gmail.com>
References: <20261018110638.9947-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faithful re-implementation of generate_initcall_order.pl in
Python 3 (stdlib only). Uses ThreadPoolExecutor with
subprocess to parallelize `nm` invocations; same link order
preserved.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/generate_initcall_order.py | 119 +++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100755 scripts/generate_initcall_order.py

diff --git a/scripts/generate_initcall_order.py b/scripts/generate_initcall_order.py
new file mode 100755
index 000000000..8ac466f34
--- /dev/null
+++ b/scripts/generate_initcall_order.py
@@ -0,0 +1,119 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Generates a linker script that specifies the correct initcall order.
+# Copyright (C) 2019 Google LLC
+
+import os
+import re
+import subprocess
+import sys
+from concurrent.futures import ThreadPoolExecutor
+
+NM     = os.environ.get('NM') or sys.exit("ERROR: NM not set?")
+OBJTREE = os.environ.get('objtree') or '.'
+
+RE_INITCALL = re.compile(r'[a-z]\s+__initcall__(\S*)__(\d+)_(\d+)_(.*)$')
+RE_FUNC_LEVEL = re.compile(r'^(.*)((early|rootfs|con|[0-9])s?)$')
+RE_ARCHIVE_HDR = re.compile(r'^(.+):$')
+
+
+def find_initcalls(index, file):
+    """Return list of (level, secname) for one object/archive."""
+    if not os.path.isfile(file):
+        sys.exit(f"ERROR: file {file} doesn't exist?")
+    try:
+        output = subprocess.check_output(
+            [NM, '--defined-only', file],
+            stderr=subprocess.DEVNULL, text=True)
+    except (subprocess.CalledProcessError, FileNotFoundError) as e:
+        sys.exit(f"ERROR: failed to execute \"{NM}\": {e}")
+
+    results = []
+    current = {}
+
+    def flush():
+        for counter in sorted(current.keys(), key=int):
+            e = current[counter]
+            secname = f"{e['module']}__{counter}_{e['line']}_{e['function']}"
+            results.append((e['level'], secname))
+
+    for raw in output.splitlines():
+        line = raw.strip()
+        m = RE_ARCHIVE_HDR.match(line)
+        if m:
+            flush()
+            current = {}
+            continue
+
+        m = RE_INITCALL.search(line)
+        if not m:
+            continue
+        module = m.group(1) or ''
+        counter = m.group(2)
+        line_no = m.group(3)
+        symbol = m.group(4)
+
+        fm = RE_FUNC_LEVEL.match(symbol)
+        if not fm:
+            sys.exit(f"ERROR: invalid initcall name {symbol} in "
+                     f"{file}({m.group(1)})")
+        function, level = fm.group(1), fm.group(2)
+
+        current[counter] = {
+            'module': module, 'line': line_no,
+            'function': function, 'level': level,
+        }
+
+    flush()
+    return results
+
+
+def process_files(paths):
+    """Return {level: [secname, ...]} preserving link order."""
+    njobs = int(os.environ.get('PARALLELISM')
+                or os.cpu_count() or 1)
+
+    indexed = [(i, os.path.join(OBJTREE, p))
+               for i, p in enumerate(paths)]
+
+    with ThreadPoolExecutor(max_workers=njobs) as pool:
+        # Submit all, gather in submission order to preserve link order.
+        futures = [pool.submit(find_initcalls, i, f)
+                   for i, f in indexed]
+        results_by_index = [f.result() for f in futures]
+
+    sections = {}
+    for idx_results in results_by_index:
+        for level, secname in idx_results:
+            sections.setdefault(level, []).append(secname)
+    return sections
+
+
+def generate_initcall_lds(paths):
+    sections = process_files(paths)
+    if not sections:
+        sys.exit("ERROR: no initcalls?")
+
+    print("SECTIONS {")
+    for level in sorted(sections):
+        if level == 'con':
+            section = '.con_initcall.init'
+        else:
+            section = f".initcall{level}.init"
+        print(f"\t{section} : {{")
+        for secname in sections[level]:
+            print(f"\t\t*({section}..{secname}) ;")
+        print("\t}")
+    print("}")
+
+
+def main(argv):
+    if not argv:
+        sys.exit("usage: generate_initcall_order.py <object files...>")
+    generate_initcall_lds(argv)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

