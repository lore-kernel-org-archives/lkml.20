Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCE4B923B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331860; cv=none; b=FV1iKA2KI7dS769oM/BY12H5v8wFOq7MWxuX1HnGHFrwvjFAYddSPQfxbe2dXJK4KKMV0WOA7Gl9NhAa2MTeQTj2Pu6TThm/VC7paiajcGeL3vyg6Vy5+FCY8ZF8ldmRHrEBx3r9YHFj44AxU2tiP2zujyoMbIQ/H98JGKgtgj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331860; c=relaxed/simple;
	bh=JgbsXmeGM3IPhuwkjx2qdHvZpjaPrclkCL16FAjgun4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NowftLfesofDdqoQGHcOxpwnta3hn9NiAjRxSSW9+ieMSMUjufW/Dh41VlK1l04Fm0exqqOl988dfLENXGKikOdGyBa9qBOweUdbzYfAt6Mln52MTugH5tc6gco54uWx+ZLj4Kj9c9sqmzFxGNxctoeDc8kx6lLNxUaZ2mjnuwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptpg5Hpt; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptpg5Hpt"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-354ba08cfd1so2174625eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331858; x=1792936658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUbBraO3pFQWfVGdbbFYqo3e+uawDNeGdfaAp9s49Zk=;
        b=ptpg5HptUAnzrT6e6RoyLnsgkcUwcbd1ZBYY7Q7rTEv6Qnzk3XracQex+xfyQIpB1I
         mRq2Z/6D3FdMtISH+q4zFAmX36zXbscDwewm6GdQayrPOpfYuzvVYtw4lZiE1vrb1DOJ
         pCgQq3P62apvpjiAD4cJYaktELo3SSowvMPs2PJyC+BCVJ0QBTOwGhtDLth8b0nXdzyM
         O/4REIL7ViFNEy1czhAx1LuOszNhEv7KxYbA9ZBDSPiRduqwrDumNQiMjgpPW1aXJwUg
         HJZ2RaPndMCNJUw+R8MJ0/ucPwtvFdcz/G+Qi+0CgQ8++7Sk2kO4m11WOsdkyYKHkwEE
         q6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331858; x=1792936658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUbBraO3pFQWfVGdbbFYqo3e+uawDNeGdfaAp9s49Zk=;
        b=JO5i030zSia4jxN9kGuVXq1EOFZuBOSN7yHTwWQdFky18uV16U7tFSBgloLKMC1XWt
         f5JcLh4xTupRIAthd3DGLaP1f7QohVphaub35H9+vEHI9cbVI6YEdsSm+RVeDRC1thJR
         pUp+zxfwLyjxV3FnsT6kl9T8gisPCdgrlRqVSj8HS9zeQe4/xTeqC9KKyYUq8IZBOIqr
         khWfQWMRIm/wGgcfYZ7ECMX77tV6QQ0ZcOno6lWoBRnpjkJjoFZMnBUq9hHijAbtYoUo
         4ym5aNdFySGFwrlIEMw5+rPABam8CI0xg5GFiZCXCy6A7Oy8BSDxGfrDKeoVu3P5Ar1K
         OnxA==
X-Gm-Message-State: AFq9FYLwgji+OtU06OnlW1/ql7DKkxiRSx1mLKfso7kCh9QFuzAc690H
	vBHJGK7zLzJS6ccWJJ/bC/CaKpFuJrZGVLyZvG+qJA5uAEK0bBd+zP+wWbTMmEt1
X-Gm-Gg: AYBFou2HN3yktZAPaAxvlP+OJK6gG1UDtY/fhjmpeoz/g3ElzjPBiZoHCzU2M6kadZ4
	Nu/+tFZ0swdxRgOoWNSWkG15zxHMsjm/pKh+RLS1zP8s942HJMadnEWfv/Pu+Bw/d5QnIq6CeM4
	86g7QytOsAs9qyWlbc3CdfTB2xt9VoUW0QG8UdhRmeJjx/bwajMKwbYV3/DPeWkVHShikCi8NgG
	MiV/gEP6dT09A9Kcbhxq+2R96cidtX1ZYxkWrKcF/HasfcSWANWClZOlZKo13d5AgQ/W3WrwsMI
	5HnVr2z8Ua2uXtQns+sphr8hEczuFXMWWvl0dxYU9cOA4QD9aPclX6IrDQ31j/GWqpPRnEuXH2+
	ripr8ZgX+9wjnzzuPV5gE+yhoHw/Ft6ZGjGCe7B67ZWbjIQleVi3EfUicPg3BmM7Mmmxe9pxuPM
	Yj/QQ57iiJ8t0JREvaGCw+z5qgjq5sVQrHdDy0JvSbqphWYz75sTLyFf3/aMvM92JICyGFopgql
	ruqqH0y2rDIZR7mWeEkuRv3SFW1HcsoDSGlo8Z+8MmRtMtQ+nUL
X-Received: by 2002:a05:693c:8810:10b0:361:aff7:6cc with SMTP id 5a478bee46e88-361aff70ae2mr7610910eec.19.1792331857942;
        Sun, 18 Oct 2026 06:57:37 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:37 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 3/7] scripts: convert extract-sys-certs.pl to Python
Date: Sun, 18 Oct 2026 10:57:18 -0300
Message-ID: <20261018135722.27410-4-breno3011alves@gmail.com>
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

