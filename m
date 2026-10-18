Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C44346E5D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321620; cv=none; b=qxWn0o0ldsM2yO6dZ0lImcA4CXUcZS52phaTS6ckWxbbADFYTOvWAYuaqnSlyACxJhACoLoeN9WEKqZZG/tyi56pKHZaUZnmBJ/yxBLwJby0gUCRuBPrCe/d2fr1Xmg+k2IT7Svk4TZH5Byl0eD/uypg0Ebdby5IJ58xKjWa/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321620; c=relaxed/simple;
	bh=zhN92FfYCH53jpESLHCiEhwAvRfoOCv8dvVDXirrkgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRcUtuKMF+ZWccGl8J9WyU10FbHFj027D34BGixMVaktMv94EjPEJHm+2TN73vY5RyrY8nhl9BUtupI1N5KOh5O6YyiCcIsIJdq7rf0eIlS5dlYpzPJYLY4KD8nDx4iO6P2YXapnjdkwaTY4ePugcvJ10uaqiT3Jk/WSfovmBD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/vwNtSc; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/vwNtSc"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so1669225eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792321617; x=1792926417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxyhP7L+C4UcDX4+OsAjNzEz0kw5dnOiAkHApfXnYWI=;
        b=c/vwNtScbX6ADbk5OKUA75gKzcv6EmNKfboIRD0/pw8evWajV2/qzqYzAFDGGMvUvx
         sd9blKcVsTytvGCDHlz11rVn6Hk0WXrNvfAvb2z6PoDJhmnkDOB/Pdpc2myT8eqWJ1+s
         gfGF+xV0lTF+GeP5SomCmk6H/nz470dS0MBHNjBJSDS3qZLqfsPEgrdhIvBUsvSRFJaQ
         dlKymqt4QTxigjgz+xe7rdJ+6IU/r6A1MM8zqGrbph00QUViRXmlAj5YHzDKbv26Rnqs
         WTzJ3Ukls4Ruxwg2LCQra/cNVjOk+/Unkk8AmPknenV6b9efdlpzdXHj5VLQQJf22OHY
         i4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792321617; x=1792926417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxyhP7L+C4UcDX4+OsAjNzEz0kw5dnOiAkHApfXnYWI=;
        b=KNsrTXy/jml4hHEZcdmq1+U/rS39CxSNDtpoOvdCyG3PxgwEVMjFvb1aHuwuc6GB7S
         CMRUeH/GOaKsI7TG8mGu1vGfQfPasQNfcpkrJQfTdMIw+nIf/bMLzbDGz497H4+YsdP4
         7i2EkIJd53Hvuk2hYswwzPUe3m3rIzGQalrQhL3E/obsw4MIVJTxBf3qG4ioqFp8B6SH
         G5qib7mO4Zr+lf5MSZB4w6mVmgbhAHWCKMRWcvKvSp18fSCGCH5qqUTn5dzN/fCrgNMO
         GJH1WKCMiD99CJLwMpvXcmRK+UcGzh0R/AJ+mFCDuXYD7SA+SSpxyvmQH1vFX4kr29oZ
         PUsA==
X-Gm-Message-State: AFq9FYLiZRwUMUjUjS2fHSpk4jR2y2GjG/hETze6ByPSBSQTiCORYIo9
	BwW+3qQf0E1VxAY+hsfyGjEruC3Nyfa4TEVI2DITWouh0oQnHnup0/sAkpAOSwAW
X-Gm-Gg: AYBFou3WV9KMlqfVF7DTxxljDrucGy7mdNKzp9Nj/d/DAYB8GzCtRCpGFKpDOtkGYb/
	CQZ4pxd1HOOYf3SwMO0CHWxoKe/TgK/uTf8ExoPbkg+CZ46PXoDAsOca1S3Xmr/GzE00xryyXWR
	ZGYm1XmE7SimK4uvcWXEmwxCtZ8AiGvPxh555lK3yBXvyJsFoANxrL2WzuqFuQNSyS9v9c/c3rw
	a9JVZDxTEMVKMoXd2bmekkHxB/Nu2ixwB7d3L22/YHyclyX7zRdCHWsUi0luYZHOloNsIiSLrua
	Q5oBXawyf0oEvqjMFdUMgCBNnEYJCgPCZ5sarU5LfD2ESwVPtG0Z73cZLSU3ZkMnPFsHN0MekDP
	1vf58eWygfc4VUFxorUukvSBYNoF900zI1ULNU0MsezLqDeislTUBE9u+7MQjlYhtSyNxID7yJt
	NH6kuvvDatbFFWNLnOu7B0sakDK2h1sqpFdDsxVpOzCu9TdbLWJ7dZ3R/pqI3fpQKL0IwS/9FeN
	z8LzAAvfgzqlSu7ITAA7XtuckKCN9TJ3mZLWLAKAg==
X-Received: by 2002:a05:693c:415a:20b0:361:aca0:522b with SMTP id 5a478bee46e88-361aca053bcmr7248408eec.11.1792321616888;
        Sun, 18 Oct 2026 04:06:56 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm28647706eec.3.2026.10.18.04.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:06:56 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 5/7] scripts: convert get_maintainer.pl to Python
Date: Sun, 18 Oct 2026 08:06:36 -0300
Message-ID: <20261018110638.9947-6-breno3011alves@gmail.com>
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

Faithful re-implementation of get_maintainer.pl in Python 3
(stdlib only). Same MAINTAINERS parsing, same file-pattern
matching, same output format including role annotations.

Verified byte-for-byte identical to the Perl version for:
  - scripts/checkpatch.pl (file mode)
  - 0001-scripts-convert-bootgraph.pl-to-Python.patch (patch mode)
  - --git-chief-penguins mode

Not implemented: --interactive, --self-test, --git-blame.
These can be added in follow-up patches.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/get_maintainer.py | 607 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 607 insertions(+)
 create mode 100755 scripts/get_maintainer.py

diff --git a/scripts/get_maintainer.py b/scripts/get_maintainer.py
new file mode 100755
index 000000000..9b36026dc
--- /dev/null
+++ b/scripts/get_maintainer.py
@@ -0,0 +1,607 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# (c) 2007, Joe Perches <joe@perches.com>
+# Print selected MAINTAINERS information for the files modified in a
+# patch, or for a file.
+#
+# usage: get_maintainer.py [OPTIONS] <patch>
+#        get_maintainer.py [OPTIONS] -f <file>
+
+import argparse
+import json
+import os
+import re
+import subprocess
+import sys
+
+V = '0.27'
+
+PENGUIN_CHIEFS = [
+    ('Linus Torvalds', 'torvalds@linux-foundation.org'),
+]
+TYPEVALUE = []
+KEYWORD_HASH = {}
+MFILES = []
+
+RE_TYPE_VALUE = re.compile(r'^([A-Z]):\s*(.*)')
+RE_RFC822 = re.compile(
+    r'^[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$')
+RE_MAILMAP_1 = re.compile(r'^([^<]+)<([^>]+)>$')
+RE_MAILMAP_2 = re.compile(r'^<([^>]+)>\s*<([^>]+)>$')
+RE_MAILMAP_3 = re.compile(r'^(.+)<([^>]+)>\s*<([^>]+)>$')
+RE_MAILMAP_4 = re.compile(r'^(.+)<([^>]+)>\s*(.+)\s*<([^>]+)>$')
+
+
+class Mailmap:
+    def __init__(self):
+        self.names = {}
+        self.addresses = {}
+
+
+MAILMAP = Mailmap()
+
+
+def which_conf(name):
+    for base in ('.', os.path.expanduser('~'), '.scripts'):
+        p = os.path.join(base, name)
+        if os.path.isfile(p):
+            return p
+    return ''
+
+
+def load_conf_args():
+    conf = which_conf('.get_maintainer.conf')
+    if not conf:
+        return []
+    args = []
+    try:
+        with open(conf) as f:
+            for line in f:
+                line = line.strip()
+                if not line or line.startswith('#'):
+                    continue
+                for tok in line.split():
+                    if tok.startswith('#'):
+                        break
+                    args.append(tok)
+    except OSError:
+        pass
+    return args
+
+
+def load_ignore_emails():
+    path = which_conf('.get_maintainer.ignore')
+    if not path:
+        return set()
+    ignore = set()
+    try:
+        with open(path) as f:
+            for line in f:
+                line = re.sub(r'#.*$', '', line).strip()
+                if line and RE_RFC822.match(line):
+                    ignore.add(line)
+    except OSError:
+        pass
+    return ignore
+
+
+def parse_email(formatted):
+    name = ''
+    address = ''
+    m = re.match(r'^([^<]+)<(.+@.*)>.*$', formatted)
+    if m:
+        name, address = m.group(1), m.group(2)
+    else:
+        m = re.match(r'^\s*<(.+@\S*)>.*$', formatted)
+        if m:
+            address = m.group(1)
+        else:
+            m = re.match(r'^(.+@\S*).*$', formatted)
+            if m:
+                address = m.group(1)
+    name = name.strip().strip('"')
+    if re.search(r'[^\w \-]', name):
+        name = '"' + name.replace('"', '\\"') + '"'
+    return name, address.strip()
+
+
+def format_email(name, address, use_name=True):
+    name = name.strip().strip('"')
+    if re.search(r'[^\w \-]', name):
+        name = '"' + name.replace('"', '\\"') + '"'
+    if use_name and name:
+        return f'{name} <{address}>'
+    return address
+
+
+def read_mailmap(root):
+    global MAILMAP
+    path = os.path.join(root, '.mailmap')
+    if not os.path.isfile(path):
+        return
+    try:
+        with open(path) as f:
+            for raw in f:
+                line = re.sub(r'#.*$', '', raw).strip()
+                if not line:
+                    continue
+                m = RE_MAILMAP_1.match(line)
+                if m:
+                    name, addr = parse_email(f'{m.group(1)} <{m.group(2)}>')
+                    MAILMAP.names[addr] = name
+                    continue
+                m = RE_MAILMAP_2.match(line)
+                if m:
+                    MAILMAP.addresses[m.group(2)] = m.group(1)
+                    continue
+                m = RE_MAILMAP_3.match(line)
+                if m:
+                    name, addr = parse_email(
+                        f'{m.group(1)} <{m.group(2)}>')
+                    MAILMAP.names[m.group(3)] = name
+                    MAILMAP.addresses[m.group(3)] = addr
+                    continue
+                m = RE_MAILMAP_4.match(line)
+                if m:
+                    name, addr = parse_email(
+                        f'{m.group(1)} <{m.group(2)}>')
+                    wrong = format_email(m.group(3).strip(), m.group(4))
+                    MAILMAP.names[wrong] = name
+                    MAILMAP.addresses[wrong] = addr
+    except OSError:
+        pass
+
+
+def mailmap_email(line):
+    name, address = parse_email(line)
+    email = format_email(name, address)
+    real_name, real_addr = name, address
+    if email in MAILMAP.names or email in MAILMAP.addresses:
+        real_name = MAILMAP.names.get(email, real_name)
+        real_addr = MAILMAP.addresses.get(email, real_addr)
+    elif address in MAILMAP.names or address in MAILMAP.addresses:
+        real_name = MAILMAP.names.get(address, real_name)
+        real_addr = MAILMAP.addresses.get(address, real_addr)
+    return format_email(real_name, real_addr)
+
+
+def convert_glob(value):
+    v = value.replace('.', r'\.')
+    v = v.replace('**', '\x00')
+    v = v.replace('*', '.*')
+    v = v.replace('?', '.')
+    v = v.replace('\x00', '(?:.*)')
+    return v
+
+
+def read_maintainer_file(path):
+    try:
+        with open(path) as f:
+            for line in f:
+                line = line.rstrip('\n')
+                m = RE_TYPE_VALUE.match(line)
+                if m:
+                    t, v = m.group(1), m.group(2)
+                    if t in ('F', 'X'):
+                        v = convert_glob(v)
+                        if os.path.isdir(v):
+                            v = re.sub(r'([^/])$', r'\1/', v)
+                    elif t == 'K':
+                        KEYWORD_HASH[len(TYPEVALUE)] = v
+                    TYPEVALUE.append(f'{t}:{v}')
+                elif line.strip() and not line.lstrip().startswith('#'):
+                    TYPEVALUE.append(line)
+    except OSError as e:
+        sys.exit(f"Can't open MAINTAINERS file '{path}': {e}")
+
+
+def read_all_maintainer_files(root, extra_path=None, find_all=False):
+    path = extra_path or os.path.join(root, 'MAINTAINERS')
+    if os.path.isdir(path):
+        if find_all:
+            for dirpath, _, files in os.walk(path):
+                if 'MAINTAINERS' in files:
+                    MFILES.append(os.path.join(dirpath, 'MAINTAINERS'))
+        else:
+            for name in os.listdir(path):
+                if not name.startswith('.'):
+                    p = os.path.join(path, name)
+                    if os.path.isfile(p):
+                        MFILES.append(p)
+    elif os.path.isfile(path):
+        MFILES.append(path)
+    else:
+        sys.exit(f"MAINTAINER file not found '{path}'")
+    if not MFILES:
+        sys.exit(f"No MAINTAINER files found in '{path}'")
+    for p in MFILES:
+        read_maintainer_file(p)
+
+
+def find_first_section():
+    i = 0
+    while i < len(TYPEVALUE):
+        if RE_TYPE_VALUE.match(TYPEVALUE[i]):
+            break
+        i += 1
+    return i
+
+
+def find_starting_index(index):
+    while index > 0 and RE_TYPE_VALUE.match(TYPEVALUE[index]):
+        index -= 1
+    return index
+
+
+def find_ending_index(index):
+    while index < len(TYPEVALUE) and RE_TYPE_VALUE.match(TYPEVALUE[index]):
+        index += 1
+    return index
+
+
+def file_match_pattern(path, pattern):
+    if pattern.endswith('/'):
+        return re.match(pattern, path) is not None
+    if re.match(pattern, path):
+        s1 = path.count('/')
+        s2 = pattern.count('/')
+        if s1 == s2 or '(?:' in pattern:
+            return True
+    return False
+
+
+def range_is_maintained(start, end):
+    for i in range(start, end):
+        m = RE_TYPE_VALUE.match(TYPEVALUE[i])
+        if m and m.group(1) == 'S' and \
+                re.search(r'maintain|support', m.group(2), re.I):
+            return True
+    return False
+
+
+def range_has_maintainer(start, end):
+    for i in range(start, end):
+        m = RE_TYPE_VALUE.match(TYPEVALUE[i])
+        if m and m.group(1) == 'M':
+            return True
+    return False
+
+
+def get_subsystem_name(index):
+    return TYPEVALUE[find_starting_index(index)]
+
+
+def deduplicate_email(line, use_mailmap):
+    name, address = parse_email(line)
+    email = format_email(name, address)
+    if use_mailmap:
+        email = mailmap_email(email)
+    return email
+
+
+def vcs_find_signers(root, file_path, since, git_cmd='git'):
+    cmd = [git_cmd, 'log', '--no-color', '--follow',
+           f'--since={since}', '--numstat', '--no-merges',
+           '--format=GitAuthor: %an <%ae>', '--', file_path]
+    try:
+        out = subprocess.check_output(cmd, cwd=root, text=True,
+                                      stderr=subprocess.DEVNULL)
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        return [], 0
+    signers = []
+    commits = 0
+    for line in out.splitlines():
+        if line.startswith('GitAuthor: '):
+            commits += 1
+        elif re.search(r'^[ \t]*(Signed-off-by|Reviewed-by|Acked-by):',
+                       line, re.I):
+            m = re.search(r':\s*(.+)$', line)
+            if m:
+                signers.append(deduplicate_email(m.group(1).strip(), True))
+    return signers, commits
+
+
+def find_maintainers(files, opts):
+    results = []  # list of (email, role)
+    seen_names = set()
+    seen_addrs = set()
+    scm, web, bug, subsystem, status = [], [], [], [], []
+
+    def add_email(line, role):
+        name, addr = parse_email(line)
+        if not addr:
+            return
+        if opts.remove_duplicates:
+            if (name and name.lower() in seen_names) or \
+               (addr.lower() in seen_addrs):
+                return
+            if name:
+                seen_names.add(name.lower())
+            seen_addrs.add(addr.lower())
+        results.append((format_email(name, addr, opts.email_usename),
+                        role))
+
+    for path in files:
+        # --- Find MAINTAINERS sections matching this file ---
+        sections = []  # list of (start, end)
+        i = find_first_section()
+        while i < len(TYPEVALUE):
+            start = find_starting_index(i)
+            end = find_ending_index(i)
+            excluded = False
+            for j in range(start, end):
+                m = RE_TYPE_VALUE.match(TYPEVALUE[j])
+                if m and m.group(1) == 'X' \
+                        and file_match_pattern(path, m.group(2)):
+                    excluded = True
+                    break
+            if not excluded:
+                for j in range(start, end):
+                    m = RE_TYPE_VALUE.match(TYPEVALUE[j])
+                    if not m:
+                        continue
+                    t, v = m.group(1), m.group(2)
+                    if t == 'F' and file_match_pattern(path, v):
+                        sections.append((start, end))
+                        break
+                    if t == 'N' and re.search(v, path):
+                        sections.append((start, end))
+                        break
+            i = end + 1
+
+        # --- Extract M/R/L/T/W/B/S from matched sections ---
+        for start, end in sections:
+            subname = TYPEVALUE[start]
+            for j in range(start + 1, end):
+                m = RE_TYPE_VALUE.match(TYPEVALUE[j])
+                if not m:
+                    continue
+                t, v = m.group(1), m.group(2)
+                if t == 'M' and opts.email_maintainer:
+                    add_email(v, f'maintainer:{subname}')
+                elif t == 'R' and opts.email_reviewer:
+                    add_email(v, f'reviewer:{subname}')
+                elif t == 'L' and opts.email_list:
+                    addr_only = v.split()[0]
+                    suffix = '' if subname == 'THE REST' else f':{subname}'
+                    if 'subscribers-only' in v:
+                        if opts.email_subscriber_list:
+                            add_email(addr_only, f'subscriber list{suffix}')
+                    elif 'moderated' in v:
+                        if getattr(opts, 'email_moderated_list', True):
+                            add_email(addr_only, f'moderated list{suffix}')
+                    else:
+                        add_email(addr_only, f'open list{suffix}')
+                elif t == 'T':
+                    scm.append(v)
+                elif t == 'W':
+                    web.append(v)
+                elif t == 'B':
+                    bug.append(v)
+                elif t == 'S':
+                    status.append(v)
+            subsystem.append(subname)
+
+        # --- git history fallback ---
+        if opts.email and opts.git_fallback:
+            signers, _ = vcs_find_signers(opts.tree_root, path,
+                                          opts.git_since)
+            for s in signers:
+                add_email(s, 'git-signer')
+
+    chief_addrs = [addr for _, addr in PENGUIN_CHIEFS]
+    if getattr(opts, 'git_chief_penguins', False):
+        results = [(e, 'chief penguin:' + (r.split(':', 1)[1]
+                                           if ':' in r else 'THE REST'))
+                   if any(addr in e for addr in chief_addrs) else (e, r)
+                   for e, r in results]
+    else:
+        results = [(e, r) for e, r in results
+                   if not any(addr in e for addr in chief_addrs)]
+
+    return results, scm, web, bug, subsystem, status
+
+
+def output_list(items, multiline, separator):
+    if not items:
+        return
+    if multiline:
+        for it in items:
+            print(it, flush=True)
+    else:
+        print(separator.join(items), flush=True)
+
+
+def main(argv):
+    conf_args = load_conf_args()
+    parser = argparse.ArgumentParser(add_help=False)
+    parser.add_argument('--email', action='store_true', default=True)
+    parser.add_argument('--no-email', dest='email', action='store_false')
+    parser.add_argument('--git', action='store_true')
+    parser.add_argument('--no-git', dest='git', action='store_false',
+                        default=True)
+    parser.add_argument('--git-fallback', action='store_true', default=True)
+    parser.add_argument('--no-git-fallback', dest='git_fallback',
+                        action='store_false')
+    parser.add_argument('--git-since', default='1-year-ago')
+    parser.add_argument('--m', dest='email_maintainer', action='store_true',
+                        default=True)
+    parser.add_argument('--no-m', dest='email_maintainer',
+                        action='store_false')
+    parser.add_argument('--r', dest='email_reviewer', action='store_true',
+                        default=True)
+    parser.add_argument('--no-r', dest='email_reviewer',
+                        action='store_false')
+    parser.add_argument('--l', dest='email_list', action='store_true',
+                        default=True)
+    parser.add_argument('--no-l', dest='email_list', action='store_false')
+    parser.add_argument('--s', dest='email_subscriber_list',
+                        action='store_true', default=False)
+    parser.add_argument('--n', dest='email_usename', action='store_true',
+                        default=True)
+    parser.add_argument('--no-n', dest='email_usename',
+                        action='store_false')
+    parser.add_argument('--remove-duplicates', action='store_true',
+                        default=True)
+    parser.add_argument('--no-remove-duplicates',
+                        dest='remove_duplicates', action='store_false')
+    parser.add_argument('--mailmap', action='store_true', default=True)
+    parser.add_argument('--no-mailmap', dest='mailmap',
+                        action='store_false')
+    parser.add_argument('--scm', action='store_true')
+    parser.add_argument('--status', action='store_true')
+    parser.add_argument('--subsystem', action='store_true')
+    parser.add_argument('--web', action='store_true')
+    parser.add_argument('--bug', action='store_true')
+    parser.add_argument('--sections', action='store_true')
+    parser.add_argument('--json', action='store_true')
+    parser.add_argument('--git-chief-penguins', action='store_true',
+                        default=False)
+    parser.add_argument('--moderated', dest='email_moderated_list',
+                        action='store_true', default=True)
+    parser.add_argument('--no-moderated', dest='email_moderated_list',
+                        action='store_false')
+    parser.add_argument('--multiline', action='store_true', default=True)
+    parser.add_argument('--no-multiline', dest='multiline',
+                        action='store_false')
+    parser.add_argument('--separator', default=', ')
+    parser.add_argument('--no-tree', dest='tree', action='store_false',
+                        default=True)
+    parser.add_argument('-f', '--file', dest='from_filename',
+                        action='store_true')
+    parser.add_argument('--maintainer-path')
+    parser.add_argument('-v', '--version', action='store_true')
+    parser.add_argument('-h', '--help', action='store_true')
+    parser.add_argument('files', nargs='*')
+
+    opts = parser.parse_args(conf_args + argv)
+
+    if opts.help:
+        parser.print_help()
+        return 0
+    if opts.version:
+        print(f'get_maintainer.py {V}')
+        return 0
+    if not opts.files:
+        sys.exit('missing patchfile or -f file')
+
+    # --sections implies no email
+    if opts.sections:
+        opts.email = False
+    elif opts.email is None:
+        opts.email = True
+
+    root = os.getcwd()
+    # If not in a tree, fall back to the nearest ancestor with MAINTAINERS.
+    cur = root
+    while cur != '/':
+        if os.path.isfile(os.path.join(cur, 'MAINTAINERS')):
+            root = cur
+            break
+        cur = os.path.dirname(cur)
+    opts.tree_root = root
+
+    read_all_maintainer_files(root, opts.maintainer_path,
+                              getattr(opts, 'find_maintainer_files', False))
+    if not TYPEVALUE:
+        print(f"[get_maintainer] warning: no MAINTAINERS entries "
+              f"parsed from {root}", file=sys.stderr)
+    if opts.mailmap:
+        read_mailmap(root)
+
+    def is_patch_format(text):
+        """Line-anchored detection (never matches regex literals)."""
+        for i, line in enumerate(text.splitlines()):
+            if i > 100:
+                break
+            if re.match(r'^(?:diff --git |diff -u |--- [^ ]|\+\+\+ b/)',
+                        line):
+                return True
+            if re.match(r'^From [0-9a-f]{40} ', line):
+                return True
+            if line == '---':
+                return True
+        return False
+
+    def vcs_file_exists(path):
+        for cmd in (['git', 'ls-files', '--error-unmatch'],
+                    ['hg', 'files']):
+            try:
+                r = subprocess.run(cmd + [path], capture_output=True,
+                                   cwd=root, timeout=5)
+                if r.returncode == 0:
+                    return True
+            except (FileNotFoundError, subprocess.TimeoutExpired):
+                continue
+        return False
+
+    files = []
+    for f in opts.files:
+        f = os.path.normpath(f)
+        if opts.from_filename:
+            if not os.path.exists(f):
+                sys.exit(f"file '{f}' not found")
+            files.append(f)
+            continue
+        try:
+            with open(f) as fh:
+                content = fh.read()
+        except OSError as exc:
+            sys.exit(f"Can't open {f}: {exc}")
+        # Match Perl's behavior: filename takes priority if it's a real
+        # file (tracked in VCS or on disk); only parse as patch when it
+        # genuinely looks like a patch.
+        if not is_patch_format(content) or vcs_file_exists(f):
+            files.append(f)
+        else:
+            for line in content.splitlines():
+                m = re.search(r'^diff --git a/(\S+) b/(\S+)', line)
+                if m:
+                    files.append(m.group(1))
+                    files.append(m.group(2))
+                    continue
+                m = re.match(r'^(?:\+\+\+|---)\s+(?:[ab]/)?(\S+)',
+                             line)
+                if m and m.group(1) != '/dev/null':
+                    files.append(m.group(1))
+
+    files = sorted(set(files))
+
+    results, scm, web, bug, subsystem, status = find_maintainers(files, opts)
+
+    if opts.json:
+        entries = []
+        for email, role in results:
+            name, addr = parse_email(email)
+            e = {'name': name, 'email': addr}
+            if role:
+                e['role'] = role
+            entries.append(e)
+        out = {'maintainers': entries}
+        if scm: out['scm'] = scm
+        if status: out['status'] = status
+        if subsystem: out['subsystem'] = subsystem
+        if web: out['web'] = web
+        if bug: out['bug'] = bug
+        print(json.dumps(out))
+        return 0
+
+    if opts.email and results:
+        formatted = [f'{e} ({r})' if r else e for e, r in results]
+        output_list(formatted, opts.multiline, opts.separator)
+    if opts.scm:
+        output_list(scm, opts.multiline, opts.separator)
+    if opts.status:
+        output_list(status, opts.multiline, opts.separator)
+    if opts.subsystem:
+        output_list(subsystem, opts.multiline, opts.separator)
+    if opts.web:
+        output_list(web, opts.multiline, opts.separator)
+    if opts.bug:
+        output_list(bug, opts.multiline, opts.separator)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

