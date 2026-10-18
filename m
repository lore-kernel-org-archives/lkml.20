Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2024C2270
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331867; cv=none; b=iFWgpGImIlAnqBPAxSdSkktBPN3LVg5+j5vTBIuUQc74msrhrMzmPAtYdHsQueeBYFM+PhdDDaLLr4JNvjD5qg2GuoVSyMLAluev+wiKg9VV1dF7//cifQ4nraWUfSfMDttwsdJJ0w0ba9FFWOOx5uMRCkY7iSQx7cVv43BVTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331867; c=relaxed/simple;
	bh=WI2TJn+JG862l3FckPQY9HhlcFAeft03zFPm1PH1ErM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOHn5Y0SfuxYEZqh3lTGtytrSWg/cFnk+DkML9fMSurjOgxa6PmIx7Zebt8hfUXnLmwajv4RkAvt4CdC39ctnG3PiSMWHgQL83jINRdcp2iKMPerD6E+zFgSKxujgNs2RoGy0IaBgILE0aArktbMhNitr8CrsP/tyNrGSi9QNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0n9eLPi; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0n9eLPi"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so1881069eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331865; x=1792936665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk9gvnlYdYnZT1OlRJ74uGhJ4XyvFT8OtWFbja8w0NE=;
        b=O0n9eLPiPQ9ptOLC+XifAYCH2Tq+fZ/92XxqC78LQsXF9t6412FP5AdEmBEDniw2p6
         m0Lj+ZkRfXHVRBaixikw1QqPxYheqbqn4BX3ctwiNAgaiAhz6Sj/g9SwdPbvUBf5F3S9
         8CgKuD7t7RaBjrlHLVDj0neKP3Bs5TanL0JIht8HS9lyjml/I40S38gBONglhp8/a9Nm
         huRf9eZX1lqYP3sjZehTVOr93rkERW1ry7/Og6ULb4WCmwT5oAC6O5XLzDmCKk5cRAt/
         NhtZ4bS0TKFdyJrThBinZYIYX52drTdX2kAWM32jjNMTYKpZRSk7BV1yyBtK6UNURq/l
         ppMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331865; x=1792936665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mk9gvnlYdYnZT1OlRJ74uGhJ4XyvFT8OtWFbja8w0NE=;
        b=Byr94+AbzDlD5elPmzX5NTOUOz5kTOJPB37IoQXEwcW5a2h2ZUQITYT36kgm5uRkFK
         NIY9gUEjdrgaBDi5PZyQhBjNgiRJQLmRPXuQ2r/BCt79PFIPcID+prlFCvXnRiVnIwu4
         5ZeUapoJzH/dguhM/xXNFmiotJ98HqNqJlz3GUaohL2/OpGfI05hpJSiyw6hFq6xz6p9
         uVFnBDV8KFnjkI3VItj7tK0H1AKAAEtOvX6/JS8NQVsP4D1qx6rzh4Uf+x4p4zA+w+L5
         aoFQe9D9eDElUmLc2XnKhqRxOk0nTPTmcYbZX5O8xf2hnnOHVVUvVfMLUUjG18z0OE64
         3r8g==
X-Gm-Message-State: AFq9FYL4OS1Gt/ufIIErRqAdYgi3BL0xOSdsZ3rq6rg3LngQgiWAolYN
	PyFSt4Gz8spzdb7j/hEn+yI6svl/igPREqAkAfHBDA25Oasb3nSe8EuwdCCvlrnK
X-Gm-Gg: AYBFou1GDIOQ8qm05h0AkuoeaihIr47HDS3lrlwEHKTLNnz7TpWO6JmSQuIqX0/rtJS
	gU1CA7q0Dg/F0tjGl4tcLEXuvGgMErjKUKHqPVtj0uQeVr4DOU6wCSlIpxRP1p8wD9f5BCCwj9W
	GtTKMSkYCQzxS5cfT5dKqPwggGBG5/hECZYA/f72TktZIHO6LsSk+BCoJbYTC8j+bO63vr4/cVN
	GQA4jhEnas0JzgnHhLgo50P+JqpB9hnS/fTWyhgVnC6qHQ5xLH+gxFW8p+ea3skzqzZkYiiCTM5
	ZBP8ZnuS960AJWJKf+jtlW3K7BfZd3XL3Z/IE7xH9zRVTrUyGbxI3+sySryW2E9xfXYD7H5gE6g
	LEPnOpJb0qSE0S3aAbzhsbR2eQm6bIymz4IwCkG6osClwqSnjLX19B/fDMLKAyC+1qNJzneQivs
	WgDeaR0KgkyF0/IVnb1QY9z3S1sI2HNz+n78Tt4KP09gXQ4bAcNN3jNHSVgO6ScXEu2BxvdnVMs
	0z8gFJp6V6S3SX2kCm931uXX/QsdZ86OQGs6HsIUQ==
X-Received: by 2002:a05:7300:d090:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3602f17908emr10640894eec.23.1792331864655;
        Sun, 18 Oct 2026 06:57:44 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:42 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 5/7] scripts: convert kconfig-sym-check.pl to Python
Date: Sun, 18 Oct 2026 10:57:20 -0300
Message-ID: <20261018135722.27410-6-breno3011alves@gmail.com>
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

Faithful re-implementation of kconfig-sym-check.pl in Python 3
(stdlib only). Same Kconfig parsing, same symbol-reference
detection, same excludes-file handling, same exit code.

Verified byte-for-byte identical to the Perl version on the
full kernel tree (~/linux).

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/kconfig/kconfig-sym-check.py | 177 +++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100755 scripts/kconfig/kconfig-sym-check.py

diff --git a/scripts/kconfig/kconfig-sym-check.py b/scripts/kconfig/kconfig-sym-check.py
new file mode 100755
index 000000000..f15b25535
--- /dev/null
+++ b/scripts/kconfig/kconfig-sym-check.py
@@ -0,0 +1,177 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Detect unknown symbols referenced in Kconfig files.
+# Usage: kconfig-sym-check.py <srctree> [excludes file]
+
+import os
+import re
+import subprocess
+import sys
+
+VALID = re.compile(r'^[a-zA-Z0-9_]+$')
+RE_DEF = re.compile(r'^\s*(?:config|menuconfig)\s+([a-zA-Z0-9_]+)\s*(?:#.*)?$')
+RE_HELP = re.compile(r'^\s*(?:help|---help---)$')
+RE_REF = re.compile(
+    r'^\s*(?:default|def_bool|def_tristate|select|depends\s+on|imply|'
+    r'visible\s+if|range|if|bool|tristate|int|hex|string|prompt)\s+(.+)\s*$')
+RE_STRING = re.compile(r'"(?:[^"\\]|\\.)*"|\'(?:[^\'\\]|\\.)*\'')
+RE_SKIP = re.compile(r'^\s*(?:#.*)?$')
+
+
+def indent_depth(ws):
+    col = 0
+    for c in ws:
+        if c == '\t':
+            col = (col // 8) * 8 + 8
+        else:
+            col += 1
+    return col
+
+
+def find_kconfig_files(srctree):
+    try:
+        out = subprocess.check_output(
+            ['git', '-C', srctree, 'ls-files', '*Kconfig*'],
+            text=True, stderr=subprocess.DEVNULL)
+        files = [ln.strip() for ln in out.splitlines() if ln.strip()]
+        if files:
+            return [os.path.join(srctree, f) for f in files]
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        pass
+    try:
+        out = subprocess.check_output(
+            ['find', srctree, '-name', '*Kconfig*'], text=True)
+        return [ln.strip() for ln in out.splitlines() if ln.strip()]
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        return []
+
+
+def parse_kconfig(path, configs, refs):
+    with open(path) as f:
+        raw = f.readlines()
+
+    merged = []
+    i = 0
+    while i < len(raw):
+        line = raw[i].rstrip('\n')
+        while line.endswith('\\') and i + 1 < len(raw):
+            line = line[:-1] + ' ' + raw[i + 1].rstrip('\n')
+            i += 1
+        merged.append(line)
+        i += 1
+
+    help_mode = False
+    help_level = 0
+    i = 0
+    while i < len(merged):
+        line = merged[i]
+
+        if not line.strip():
+            i += 1
+            continue
+        if line.lstrip().startswith('#'):
+            i += 1
+            continue
+
+        level = indent_depth(re.match(r'^(\s*)', line).group(1))
+
+        if help_mode and level < help_level:
+            help_mode = False
+        if help_mode:
+            i += 1
+            continue
+
+        if RE_HELP.match(line):
+            help_mode = True
+            j = i + 1
+            while j < len(merged) and RE_SKIP.match(merged[j]):
+                j += 1
+            if j >= len(merged):
+                break
+            next_level = indent_depth(
+                re.match(r'^(\s*)', merged[j]).group(1))
+            if next_level >= level:
+                help_level = next_level
+            else:
+                help_mode = False
+            i = j
+            continue
+
+        m = RE_DEF.match(line)
+        if m:
+            configs[m.group(1)] = configs.get(m.group(1), 0) + 1
+            i += 1
+            continue
+
+        m = RE_REF.match(line)
+        if m:
+            s = m.group(1)
+            s = RE_STRING.sub('', s)
+            s = re.sub(r'#.*', '', s)
+            s = re.sub(r'\$\((?:[^()]*|\((?:[^()]*|\([^()]*\))*\))*\)', '', s)
+            s = re.sub(r'%%[^%]*%%', '', s)
+            for sym in re.split(r'[^a-zA-Z0-9_]+', s):
+                if not sym or not sym[0].isalpha():
+                    continue
+                if sym in ('if', 'y', 'n', 'm'):
+                    continue
+                if re.match(r'^0[xX][0-9a-fA-F]+$', sym):
+                    continue
+                refs[sym] = refs.get(sym, 0) + 1
+        i += 1
+
+
+def main(argv):
+    if not argv:
+        s = ''
+        try:
+            s = subprocess.check_output(
+                ['git', 'rev-parse', '--show-toplevel'],
+                text=True, stderr=subprocess.DEVNULL).strip()
+        except (subprocess.CalledProcessError, FileNotFoundError):
+            pass
+        msg = f'Usage: {sys.argv[0]} <srctree> [excludes file]\n'
+        msg += 'Please provide <srctree>.'
+        if s:
+            msg += f" Is it '{s}'?"
+        sys.exit(msg + '\n')
+
+    srctree = argv[0]
+    excludes = argv[1] if len(argv) > 1 else None
+
+    files = [f for f in find_kconfig_files(srctree)
+             if '/scripts/kconfig/tests/' not in f]
+
+    configs = {}
+    refs = {}
+    for f in files:
+        parse_kconfig(f, configs, refs)
+
+    known = {}
+    if excludes:
+        with open(excludes) as f:
+            for line in f:
+                line = line.rstrip('\n')
+                if not line.strip() or line.lstrip().startswith('#'):
+                    continue
+                m = re.match(r'^\s*([a-zA-Z0-9_]+)\s*(?:#.*)?$', line)
+                if m:
+                    known[m.group(1)] = 1
+
+    ret = 0
+    for k in sorted(refs):
+        if k in configs or k in known:
+            continue
+        print(k, end='')
+        if k in ('N', 'Y', 'M'):
+            print(f" - warning: '{k}' is probably not what you want; "
+                  f"Kconfig tristate literals are always lowercase "
+                  f"('n', 'y', 'm')", end='')
+        print()
+        ret = 1
+    return ret
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

