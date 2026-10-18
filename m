Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381547C10D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322939; cv=none; b=F9NbRl+rQEokZjNqg0BaPM86nmnM/DSzT3JL76K8VLHdlG5HK/soiw0/s5jy6LWu4Js2w6q+9EDq+fJX9iFUiVeazSmOu52GPCvkircP9NGoJNaXMYkAJiVZK0jOt1cU7J2uSNLNekSmhHb0RQFtZn4rnj+5Knaz7VhfTkjvCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322939; c=relaxed/simple;
	bh=i5Z3/kQvRv6MdttRQMhWbN6TPi0qhuEolDhAtApCcGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTsX7CDSVN2IyWuvn/1hLHONX/kcxQXpJec2mw5GCeOiKktAHEM6SJBnCqnHvnGkDXxyyRt7Tkj0vl3VWfUBeSg3LarPlKIiOjG8V6+YQJZKfMjzy3f470bH6Nng6h+i4hv4AeST74GAxOJnH9OVS9bpJ5l6te0FALIrwOLuXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMVxilwe; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMVxilwe"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3067873eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322936; x=1792927736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6vfUV+xfoWUycON3Bin1a31lIGNUVsBJU1jJ/ORLR0=;
        b=nMVxilweWwHlu+kSG17+HgPRE+D0V6rWloMF4QnVi0pKGe85tJLUCufXHWjww0Lhrm
         r/0QG5OaVkhIIbOrd07KWqUIFErz9wpF5+uVyNDeEm83f6KtTrzRMdU5QpaypNgRXToz
         N2HKgzDo0bqAuNbCD/YaYQQq4cJ+oYr4zfLu9PT71OXOyxa3peJgXzeKbv8nI0mDTlki
         Bc/oN3rg3ZxuXwpTf6Ga+udy1wPuu88hrPkGgAtKwzEbA+UNotsRngSVjBwJORtzxjwG
         PUy3CVrAT1BESms7NOLbUKeQ2C3Ta2grsMuDX6bE2obh2/ECV505jIsz7FyuxOPafM7q
         G8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322936; x=1792927736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6vfUV+xfoWUycON3Bin1a31lIGNUVsBJU1jJ/ORLR0=;
        b=vjTiC+u5M/SDcDjLjmujiHxCOJazPPvlC0G3sYwftdHSCu9E7Z+1mfK2KJNA51ixXB
         Ps12f81UvNXw56bRf6jHnVQ3S9jc3uWYHXHr75R3/9L8x0fb9jjccdmJxHq7ptcfEXGZ
         2MpcxF4Y/sFchXJpscHcEWVoehlT+upAgm2FPovlQQ2uh2QzegtlSINVJjhO/mnaUFsB
         8rwlFeHX2oWLChHVCGvlMq0XM95ey7VlCwUPIVuzCWqI68k2mFU+RL08tFV2f3rejtc4
         GUH69oQshCpWhMrohG/zVH8r3nk81hRhQXilOSG+RztYkShcgcRtPTReKmn6V2b8tV8b
         9YwQ==
X-Gm-Message-State: AFq9FYIxmlqlOuz9DIGekK8+cIOxXp4hiZc1qLxPX7Vw0gWRNYeGZVnG
	qXGRSHVsKrBIr4Kfv4glsEef6KVwkmA7cCdkrzFV+0fA+WdLdd0HFX+X97qMPLQj
X-Gm-Gg: AYBFou1px4DvFudDSkMFFm4swQKwspEek30fB9tfZ0hapwYSdlrAMOtdHOVV2z3e2X7
	jmgegRsv0RsGN+p4hD8S/RPDtovYzzWMoT1TGpeKtOt1Oy4LWsY4nPgTN5wyl29XcXGbL4Za8F4
	1PX3MzcxIu4soIbgn14XbHbuVbREbEQpjWF3FnPHCypryGMcPCDTEjt51TkYzkbqm7HATeLyhD8
	YbXyjn/mniPQrmlzVNPkkt/wyMOdREdGKDR6PBk7wDE6mPczrtg/rnKqO7VYWwrLs0H4qtKa4jw
	MHR6VqehvXxYokLelXwOvU85/yEH0MyV23MZgzUapfb2yv+nY6n3J0t9mWILc/LbbirYz30Q3oB
	a/yloUZY/f80Qh2QXnu6F2gcnd5r8r7w27O15sMlnu1J4cfS4mKqikzM9KtAMBRXYTXs6vKhdwe
	JWA9j0Iz0yHxSr6xTe6p5p5+OUMG8SQnCA6JgdmTvXduNf7MznSq1Ycd0SYFD5lCa5iOMI3uC5b
	SEXb+m6iXSZii29fEKXavkZRUHkQCb/Zv95YcICYw==
X-Received: by 2002:a05:7300:ce0d:b0:34c:5831:8a19 with SMTP id 5a478bee46e88-361a361222emr6106007eec.40.1792322936281;
        Sun, 18 Oct 2026 04:28:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:55 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 5/7] scripts: convert kconfig-sym-check.pl to Python
Date: Sun, 18 Oct 2026 08:28:36 -0300
Message-ID: <20261018112838.16355-6-breno3011alves@gmail.com>
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

Faithful re-implementation of kconfig-sym-check.pl in Python 3
(stdlib only). Same Kconfig parsing, same symbol-reference
detection, same excludes-file handling, same exit code.

Verified byte-for-byte identical to the Perl version on the
full kernel tree (~/linux).

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/kconfig-sym-check.py | 177 +++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100755 scripts/kconfig-sym-check.py

diff --git a/scripts/kconfig-sym-check.py b/scripts/kconfig-sym-check.py
new file mode 100755
index 000000000..f15b25535
--- /dev/null
+++ b/scripts/kconfig-sym-check.py
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

