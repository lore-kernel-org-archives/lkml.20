Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8B3BED66
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321612; cv=none; b=BmrKmA7uL0q0ACz7B2PfTGJ7Nha8AkcXsdHE1cZZKypTAltNe2fcSuCo1itasocZKpYcHmp2e8o2yWvORaMUEL6KZxnPOt0mureACUe/G+IENW7iBSCsWPu2+fnBl9UvUWvUoZzYkvSyeVbx515mkYYSaqh8B+PuzkR0gDqkzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321612; c=relaxed/simple;
	bh=8G6IOAJEgiWhWhpVc42mPIPoS4G7kUvTPmBfUJLF/ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3rVPwgB3Pn7pm9mnpAXZ2TXY9CkAiR0ncVlU3H34qwRtzSLvPRjLHfsvDbbNvU2XylorOqMGFM/i5+XxyHRInvTv8rY8CRIwBdzt29EiVEUgfgDfJroZmH1tQ9W7PHs3UBZlE0RnClIJLZAcQ3xs260qYHiKl2k4XZT6jehpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/F8vx+n; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/F8vx+n"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35943f55c06so1758615eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321610; x=1792926410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn5bYcrNXxH6FfMHBz90uaBNr6cmcEAxzEZuytilVPY=;
        b=F/F8vx+n6Q0IXsPSiLD3wdLQDGKCOM0s5JdNxXQM2oGXxQx8qD6QKIOdWrmN+KCSIJ
         LRm1G/vVl7P565UmqfbkF+jSQhWjo3a85itt9cF0+ONmEsilt5zJI4+LI/6ugd0o6iD5
         Cfc4Ul1LciaAWOBrKtvA6UANowkvDrKQkD3wvFSWzT2kdlaWvus/hzz65g9Heugtp1lY
         xD04dOstT9+EzGfSicj8OrblFTfW4GTyHJZoSHn1uusOniNT4DfBk8lVgz2zgCIiJcjk
         RqelWTOKReSc9oUXPvHqNcYbfmZwkDjL27EyjX6ootykxmTH+f8ys+nzUbBlMto8k804
         JXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321610; x=1792926410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn5bYcrNXxH6FfMHBz90uaBNr6cmcEAxzEZuytilVPY=;
        b=wxL+HpmzdMQlOl+PcrfjbDCY+ENNDxXCUXAvBwRMyh/ByzftoF0vGrqddFEqkuuUhQ
         Dp2FygFuiu3tBaaoYy1GedPIVemHW+mJVCiZht4wsOVCxHnpIUcIHleJ7f3qdsVA6wQ9
         EDkmBAYkZgpZdjPb2fwkyp6nhnuq2CLaRcCWRJM1vROms7EXCirVoOKqm+vMQrHofzZj
         +0j1NZwe+S0uZGMYYV7ilCMkY+oFaS/Pssdz8KqaBXVarwyWNDNgm1HmYWjS5eTulHhJ
         UZZyUJeoI3lqdTuflT1oM3HmNwMRkU53/VpiN+3yl4/QxV2ryjVBLenPy0kviIlJbLXB
         wJrw==
X-Gm-Message-State: AFq9FYID5NjY06kAS6v0UtNkqSj1HzLHtMlue0J4tEeX9iSOuxNyqHlK
	cKzQ1V13ilR3vPjRziHz7lmE/KNymgTCWdtof+nLxZFT21gIIW7unigx9+MvXCn9
X-Gm-Gg: AYBFou2HymXvhPm9ZM3jarWr1a6C66qzobSUlqCTN8lrAZED4vaeOPeY1gJjUVQqmw7
	vNTQlhBhilFq6GaobtwVJv09Ioj5Rbk1qtc+Lcy8/a+QI2q2oZ8Vn4a2+EYsiexCqTmsv3FvRwL
	9oe4kyQYEVyMXoPTFtyzC8Sm/eCu7eVxUDKA4qgMRRTSwstp+bwrfe2juMJpZ5D56Hrb8IyFFMH
	pl1fBq8j/uVXJ5xAnvPcnBKlaMAwyNK3Fo6bh5FG24G1ca8vcEY6Uj/Vl7ZdsOJRlHbSC1TqjiN
	SeaTlwpz3kcFxgeebHkDQAoPLGV5+5AT9p1ylRbPJxtDJhs2685QWh5mx1krJ0ZmgKAJbhxQGef
	GXfm8JnieTHkkVqpRX4/HNh+65ng/4uKin6Y+4L6lQXVbLKrw3KrW48w2c+FVppGFUfG2wYtcuA
	KPUfPnEr+aR2EBu/W463zkVrIedAs5KDvRWRs9ouaDwwlHy1oc/Uob0jjyQTKDA2DiZkQEvV+Og
	ysZi0xbFdcWbsot+vbNgxJjw9+d+NdsD473Y1uaJg==
X-Received: by 2002:a05:7301:e2f:b0:354:53af:7f2 with SMTP id 5a478bee46e88-3602ddd1da9mr10819068eec.11.1792321609763;
        Sun, 18 Oct 2026 04:06:49 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:49 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 2/7] scripts: convert checkversion.pl to Python
Date: Sun, 18 Oct 2026 08:06:33 -0300
Message-ID: <20261018110638.9947-3-breno3011alves@gmail.com>
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

Faithful re-implementation of checkversion.pl in Python 3
(stdlib only). Same comment/string stripping, same
line-number reporting.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/checkversion.py | 121 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 scripts/checkversion.py

diff --git a/scripts/checkversion.py b/scripts/checkversion.py
new file mode 100755
index 000000000..4016cb5cb
--- /dev/null
+++ b/scripts/checkversion.py
@@ -0,0 +1,121 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# checkversion finds uses of macros in <linux/version.h> without the
+# corresponding #include; or includes of <linux/version.h> without any
+# use.
+# Copyright (C) 2003, Randy Dunlap <rdunlap@infradead.org>
+
+import re
+import sys
+
+SKIP_FILES = (
+    'include/generated/uapi/linux/version.h',
+    'usr/include/linux/version.h',
+)
+
+RE_VERSION_MACROS = re.compile(
+    r'LINUX_VERSION_CODE|(?<!\w)KERNEL_VERSION|LINUX_VERSION_MAJOR'
+    r'|LINUX_VERSION_PATCHLEVEL|LINUX_VERSION_SUBLEVEL')
+RE_INCLUDE_Q = re.compile(r'^\s*#\s*include\s*"linux/version\.h"')
+RE_INCLUDE_A = re.compile(r'^\s*#\s*include\s*<linux/version\.h>')
+
+
+def strip_comments(line, in_comment):
+    """Return (line_without_comments, in_comment)."""
+    out = []
+    i = 0
+    while i < len(line):
+        if in_comment:
+            end = line.find('*/', i)
+            if end == -1:
+                return ''.join(out), True
+            i = end + 2
+            in_comment = False
+        else:
+            start = line.find('/*', i)
+            if start == -1:
+                out.append(line[i:])
+                break
+            out.append(line[i:start])
+            i = start + 2
+            in_comment = True
+    return ''.join(out), in_comment
+
+
+def strip_strings(line, in_string):
+    """Return (line_without_strings, in_string)."""
+    out = []
+    i = 0
+    while i < len(line):
+        if in_string:
+            end = line.find('"', i)
+            if end == -1:
+                return ''.join(out), True
+            i = end + 1
+            in_string = False
+        else:
+            start = line.find('"', i)
+            if start == -1:
+                out.append(line[i:])
+                break
+            out.append(line[i:start])
+            i = start + 1
+            in_string = True
+    return ''.join(out), in_string
+
+
+def check_file(path, debugging=False):
+    try:
+        with open(path, 'r') as f:
+            lines = f.readlines()
+    except OSError as e:
+        print(f"Can't open {path}: {e}", file=sys.stderr)
+        return
+
+    in_comment = False
+    in_string = False
+    version_linenr = 0
+    uses_version = False
+
+    for idx, raw in enumerate(lines, 1):
+        line, in_comment = strip_comments(raw, in_comment)
+        if in_comment and not line.strip():
+            continue
+
+        if RE_INCLUDE_Q.search(line):
+            version_linenr = idx
+
+        line, in_string = strip_strings(line, in_string)
+        if in_string and not line.strip():
+            continue
+
+        if RE_INCLUDE_A.search(line):
+            version_linenr = idx
+
+        if RE_VERSION_MACROS.search(line):
+            uses_version = True
+            if version_linenr:
+                break
+
+    if uses_version and not version_linenr:
+        print(f"{path}: {len(lines)}: need linux/version.h")
+    if version_linenr and not uses_version:
+        print(f"{path}: {version_linenr} linux/version.h not needed.")
+    if debugging:
+        if version_linenr and uses_version:
+            print(f"{path}: version use is OK ({version_linenr})")
+        if not version_linenr and not uses_version:
+            print(f"{path}: version use is OK (none)")
+
+
+def main(argv):
+    for path in argv:
+        if any(skip in path for skip in SKIP_FILES):
+            continue
+        check_file(path)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

