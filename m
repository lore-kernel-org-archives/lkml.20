Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2102E476CE6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322938; cv=none; b=UfeLpIgbrWvXfDR5HDKkHU5hQj8ob+pN+GB/3iF1LCrs4xVSAsvhAj0gcn6CJJd2A7HH5m+nioGkAiGKKY9JHrPjtDw4bOpT7Y+2LydumRbMF/d1A/gokHNqH4JJTEFZT6m9fuFugcXi0etb5/a7uMegQMDMCG427sCz4nhBdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322938; c=relaxed/simple;
	bh=JgbsXmeGM3IPhuwkjx2qdHvZpjaPrclkCL16FAjgun4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmcmDGsyIIx3frjoLjvk3y/RXdaZ86QlptIk2SswAN21TZPPWhePwyyVrdn6Ny4PAQtSX/IrveaW06TXgbFMbZCp0v0B9jfQdtsdQGe4G4EmEajxeYKfAySNrZX7u2EI2FJ41hlTUz2fzNlOvqY4WRRQpGRCyjSFGdL68tXWrOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaPD5D/j; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaPD5D/j"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so1285008eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322931; x=1792927731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUbBraO3pFQWfVGdbbFYqo3e+uawDNeGdfaAp9s49Zk=;
        b=GaPD5D/jzEBds15OTDsTWw4GnMqYR4Tu5L6nOOdQ9f9BODIhvftjn6Q4aW9qAf49W+
         FMNax2+GbaBwZ51n+HEQKnQk7322cLWPKS5JfbZ91CmArTruJKKRc1QO2lg9n/dQnJzq
         bTNPWyjWjHGK3ySXpQ+q6aNk0rtRjc43H877KVeoSjesNKCNy4CEy1xM0L2VcmdD+RPO
         hpi49xmY4BfRNGiZj5gYmlAP/nd5k8gohSTPKgzKE9rs3UZY6FHQao+bxFQxSN6xzEcm
         fs3D3y77O2OVxt0oUA2rDuhNvEY4ttKk+8QbnW3yOOQ6YsSs5xOCPd8q5utLDLqC93f8
         Lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322931; x=1792927731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUbBraO3pFQWfVGdbbFYqo3e+uawDNeGdfaAp9s49Zk=;
        b=gNB+ucK3RUSiR9nrLhqHWehaMBX/+eQt5X9RbbTC87Nh72IRbrYExb40kmGNSAO+sJ
         mzMSCuJUJcYs58ZIvkQ8Pwe2xHOCfhkq+jFJn3V3EdLjGmcLgL/klb7j4bqKaBiNB+J/
         5qi3/6KGf7BwaCZUjiwbWnbuHGW4C134+tac4uANIaZSNzQpxRDeCXNXqEv3j6k09a2V
         Olt8qesHpRba+Z2lLWfmHwmeaKiHKkD57Zs2lwHmA20exti/qe+hSB0k33AxS+yMGzcU
         B0oqwinFVQx3BmZVkfZOyN4dQ+fT7Tec8C+L6XrhU8R0Unah/1XciIblCBUYxeGBBThM
         p6vw==
X-Gm-Message-State: AFq9FYKZWOpb5PoTHD5SaPHSUjX3ler0MFcDYyYov03CliSqOSgksjWb
	ssr66eHBLRwiBBDs3AQIvZyMf3jRu2uZIgrshNNH0+64gB0A5z0ngQ2VpxkEiUst
X-Gm-Gg: AYBFou2ZBht/QTyCjv3Vmi4qvYbqVM/WR6TB4EBoVii5YJGELI4fyV9ENB69pv8gaGN
	F7oGmCxyUbtg7b9iOouwIkXvPfpG6WDbOJgKqs7QTNrWXorx5ionY6fa72/+kkRx8qaM2EoJoUj
	Mt3Mow+NuC7Cxc88+AnRw7BR9NX233jFZqIdj+f2iwfGQjPiDo7+W6+OHmMcbY4KXBIn1qUy4hH
	AVNE6Us7RUALs+CYwZDUdDUfI08gf202r5REde46GBADqtZNwix8+8EEyt7a/kMTKVItKo7HlGd
	8vJT1sw9AG731OgCGND3pBIcMzOs9ZY6Exu07ugK6KOtmm7/k/mUdAt9rytNrpQQcSxe1fj+QhM
	ogGDUgdwV8uakVCU/xbKBzSb3r5sJf3h9Sw6j0LSi7lusDLcyqVuE2jEgYW0b6kye6S4zwuPoXa
	oeGwEbyBbutZbUrSZ7DOR4IGuVBVnInpthSmmPA6uaBByFgfHP117TmH8B6vB9OtHRpF6ntbA3+
	sqiajl7pMNRBa/VcxfbCwb6VBUuiZ4Q5McMNcQDeg==
X-Received: by 2002:a05:693c:66d5:10b0:359:9302:a526 with SMTP id 5a478bee46e88-361a195b1bcmr7553082eec.7.1792322931131;
        Sun, 18 Oct 2026 04:28:51 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:50 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 3/7] scripts: convert extract-sys-certs.pl to Python
Date: Sun, 18 Oct 2026 08:28:34 -0300
Message-ID: <20261018112838.16355-4-breno3011alves@gmail.com>
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

Faithful re-implementation of extract-sys-certs.pl in Python 3
(stdlib only). Same vmlinux section-table parsing, same symbol
lookup (nm with System.map fallback), same VMA-to-file-offset
translation.

Requires a vmlinux with the system certificate list to fully
test; logic is 1:1 with the Perl version.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/extract-sys-certs.py | 132 +++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100755 scripts/extract-sys-certs.py

diff --git a/scripts/extract-sys-certs.py b/scripts/extract-sys-certs.py
new file mode 100755
index 000000000..92a414eb3
--- /dev/null
+++ b/scripts/extract-sys-certs.py
@@ -0,0 +1,132 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# extract-sys-certs.py [-s <systemmap-file>] <vmlinux-file> <keyring-file>
+
+import re
+import subprocess
+import sys
+
+RE_SECTION = re.compile(
+    r'\s*([0-9]+)\s+(\S+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+'
+    r'([0-9a-f]+)\s+([0-9a-f]+)\s+2\*\*([0-9]+)')
+RE_SYMBOL = re.compile(r'([0-9a-f]+)\s([a-zA-Z])\s(\S+)')
+
+
+def parse_symbols(lines):
+    syms = {}
+    n = 0
+    for line in lines:
+        m = RE_SYMBOL.search(line)
+        if m:
+            syms[m.group(3)] = int(m.group(1), 16)
+            n += 1
+    return syms, n
+
+
+def main(argv):
+    args = list(argv)
+    sysmap = ''
+    if len(args) == 4 and args[0] == '-s':
+        sysmap = args[1]
+        args = args[2:]
+    elif len(args) != 2:
+        sys.exit(f'Format: {sys.argv[0]} [-s <systemmap-file>] '
+                 f'<vmlinux-file> <keyring-file>')
+
+    vmlinux, keyring = args
+
+    try:
+        objdump_out = subprocess.check_output(
+            ['objdump', '-h', vmlinux], text=True)
+    except (subprocess.CalledProcessError, FileNotFoundError) as e:
+        sys.exit(f'{vmlinux}: {e}')
+
+    sections = []
+    for line in objdump_out.splitlines():
+        m = RE_SECTION.search(line)
+        if not m:
+            continue
+        sections.append({
+            'name': m.group(2),
+            'len': int(m.group(3), 16),
+            'vma': int(m.group(4), 16),
+            'foff': int(m.group(6), 16),
+        })
+
+    print(f'Have {len(sections)} sections')
+
+    try:
+        nm_out = subprocess.check_output(
+            ['nm', vmlinux], text=True, stderr=subprocess.DEVNULL)
+    except (subprocess.CalledProcessError, FileNotFoundError):
+        nm_out = ''
+
+    symbols, nr = parse_symbols(nm_out.splitlines())
+
+    if nr == 0 and sysmap:
+        print(f'No symbols in vmlinux, trying {sysmap}')
+        with open(sysmap) as f:
+            symbols, nr = parse_symbols(f.readlines())
+
+    if nr == 0:
+        sys.exit('No symbols available')
+    print(f'Have {nr} symbols')
+
+    if '__cert_list_start' not in symbols or \
+            'system_certificate_list_size' not in symbols:
+        sys.exit("Can't find system certificate list")
+
+    start = symbols['__cert_list_start']
+    size_sym = symbols['system_certificate_list_size']
+
+    found = None
+    size = 0
+    buf = b''
+    with open(vmlinux, 'rb') as f:
+        for sec in sections:
+            s_vma = sec['vma']
+            s_len = sec['len']
+            s_vend = s_vma + s_len
+
+            if start < s_vma or start >= s_vend:
+                continue
+
+            if size_sym < s_vma or size_sym > s_vend:
+                sys.exit('Certificate list size was not found on the same section')
+
+            if found is not None:
+                sys.exit(f"Cert object in multiple sections: "
+                         f"{sec['name']} and {found['name']}")
+
+            size_off = size_sym - s_vma + sec['foff']
+            f.seek(size_off)
+            packed = f.read(8)
+            if len(packed) != 8:
+                sys.exit(vmlinux)
+            size = int.from_bytes(packed, sys.byteorder)
+            end = start + size
+
+            print(f'Have {size} bytes of certs at VMA 0x{start:x}')
+            if end > s_vend:
+                sys.exit(f"Cert object partially overflows section {sec['name']}")
+            found = sec
+
+        if found is None:
+            sys.exit('Cert object not inside a section')
+
+        print(f"Certificate list in section {found['name']}")
+        foff = start - found['vma'] + found['foff']
+        print(f'Certificate list at file offset 0x{foff:x}')
+        f.seek(foff)
+        buf = f.read(size)
+        if len(buf) != size:
+            sys.exit(f'Short read on {vmlinux}')
+
+    with open(keyring, 'wb') as f:
+        f.write(buf)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

