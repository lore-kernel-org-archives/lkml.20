Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D06476059
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322928; cv=none; b=YWGo3ScBlSXo9UNjz4p3PKOh2jGV5FrX0NFwwa1QW9/6QmrU54xw6a9xhSMncu/RluMtBoV/9J3CIRDv2IgOrLnCltGTH4u0VM0FLsoiZijut09iK0G1ikx5y8C9Wv2ZcrTboZ254acdLYS++FuU/M4w68zNw+Hp6JyZotZdwEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322928; c=relaxed/simple;
	bh=VLprP5i4WV9z0+jdB38T6Tcjj9uibgnoBxVH2syAm38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TL1YLUtCQ+5HS6YpEfR443BtFXEXwa3hlxsAkk8taYOX9BL0MBIwqeGihdUUFraPGQ8IKS7d1IfwMAp0jtzlLYSncnoRqD339UIK3Zw/RtaXDOs2v8JEMJA+LWdBUPn1rIBtxTuMawFm99bBpJN2fOMVtL7OywOheSuP6HVAjLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrUOvfRP; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrUOvfRP"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so3450406eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322926; x=1792927726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eg1h+olUuPULaPJhH4b45fxV+IydvVkZq4meRb8O9k=;
        b=NrUOvfRP/MCI2sk1d7nrM9reLvWomNiAzTokwDPDTseuhxTZNFGb8oDR4+wy2jqsRi
         0UvFe1DdL2ktbrkPgwvBSY3D1ErC2nuIQ0maKXPigMHTnbvCLvJGN06q3O7H4ccwlp5m
         gXZvnfrvGWdsQmQfX+AjMew76l/F+0PAdDgWWu0nbnq42dkAqyxnHredGmVlmRnKJtIk
         yDYltprxfpP0l3XGQaHmiNtyHB+/q5/rCXUNcYM0/y3t64gHxgYSuo9gJf+Rx87mtVlv
         jOgRdDEl3pmiNLjjrQ4cSmYUj1qBTeVkwAvamKrXwLEfDDEGVN6/4/bJ2/8knZhYqTUx
         g6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322926; x=1792927726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eg1h+olUuPULaPJhH4b45fxV+IydvVkZq4meRb8O9k=;
        b=fgSFzJQ+vq9bkqyycDLK3YG0DIVvCMBp3TTLIYT3XqlPr1X5e82/gnGgymfWiG/I2n
         pIijySI0L0qDgWHC3tAV11bP0evOcNgZ+Tvj5KArWgiEh87z+g5eFVo+564Y8MqqHKKi
         jKzsxqIf2sIHZDJV5mYvoyBLN8jdU9EU5u2xscAoigBe29N6q4jSj8Avii7KPWjinRfX
         2kjBWKuhLsiBVzVytwuTv81dXCayFORfMu2nKgrZ6dtDPNd4nW7w3d63/n6wt+FcV02I
         /QthkkU5iCNUZ2pH9EDmOk1DD1yejneDWDeFo7jSkz9t6F4hDB5LwsajM/AkdN+dtx3F
         iO0Q==
X-Gm-Message-State: AFq9FYL/nlcCrMwccrgNVZ5ZFjHKV5hX8e/XZN61uNx7bNOV/0McqWVl
	5pNPtaWtAui2BIMyqn5+/sH8mrkYzI2oKOw2B625Ti3vy3/y7+xGPnEfs4LcSlNz
X-Gm-Gg: AYBFou1s0BO+kiu+C4umE9sevzqcAvo3rGHmEjHSugHWjQ8SBxVrzwOtXcRrNEoj/0+
	3p0f2ct9nRhal7D3lFSjUJVye6AlXtTmA1mcmRN4IW6vPUwurOtdeois4qIZdeZ8XI30INgQHmE
	eAdQ9hdLJGd1Iv5eTcF/RcKlzRNinpoBdaqOq5bK/PFQp7jyIUhhiWejehfLxl+sf30on/w4C9I
	V9YRw9WMdPKoTvlhBhoiGmt7X59eizLPJ2/VUywIZS9RmswjmWfp+2NaiXUebpBvS65kzpQCWXx
	F2SWKXIOEBXk0jcuAL1IjkIy2AcPCfEaMs7H5rhlS8Y3gc3GNFhtPxVgA1LfceEUUuAedwnUCfq
	xWiSwTgybzkvo3CIQ6r4BRZxYYDEFkTfhDrOuBtEKtEiVh0BrUT/4TwnvoZjgFVvBofDALnpWW+
	jrWFb6y//bNfwAM5jp/msgXS2BgGjiMkSa7alkWmgzbCxLvGmf1kBrCxW8D3ZIcsVUzD9XN4/XV
	H/z9aMjsHlljLtsbIiPVfNQS4hNgdt4ssJR62ViMg==
X-Received: by 2002:a05:7300:a214:b0:35e:ebb1:8e5a with SMTP id 5a478bee46e88-361a1b5251cmr6556148eec.26.1792322926033;
        Sun, 18 Oct 2026 04:28:46 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm42560779eec.24.2026.10.18.04.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:28:45 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH 1/7] scripts: convert checkstack.pl to Python
Date: Sun, 18 Oct 2026 08:28:32 -0300
Message-ID: <20261018112838.16355-2-breno3011alves@gmail.com>
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

Faithful re-implementation of checkstack.pl in Python 3
(stdlib only). Same per-architecture regexes for x86/x86_64,
arm, arm64, m68k, mips, nios2, openrisc, parisc, powerpc,
s390, sparc, riscv and loongarch.

Verified byte-for-byte identical to the Perl version on a
synthetic objdump stream for x86_64.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/checkstack.py | 143 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100755 scripts/checkstack.py

diff --git a/scripts/checkstack.py b/scripts/checkstack.py
new file mode 100755
index 000000000..8be3861b3
--- /dev/null
+++ b/scripts/checkstack.py
@@ -0,0 +1,143 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check the stack usage of functions.
+# Usage: objdump -d vmlinux | checkstack.py [arch] [min_stack]
+
+import platform
+import re
+import sys
+
+X = '[0-9a-f]'
+RE_FUNC = re.compile(rf'^({X}*) <(.*)>:$')
+RE_FILE = re.compile(r'(.*):\s*file format')
+
+
+def arm_push_handler(line):
+    if re.search(r'.*push.*fp, ip, lr, pc}', line):
+        return (line.count(',') + 1) * 4
+    return 0
+
+
+def config_for(arch):
+    """Return (main_re, dynamic_re, sub_fn)."""
+    if re.match(r'^(?:aarch|arm)64$', arch):
+        return (
+            re.compile(rf'^.*stp.*sp, ?#-([0-9]{{1,8}})\]!'),
+            re.compile(rf'^.*sub.*sp, sp, #(0x{X}{{1,8}})'),
+            None)
+    if arch == 'arm':
+        return (re.compile(r'.*sub.*sp, sp, #([0-9]{1,4})'), None,
+                arm_push_handler)
+    if re.match(r'^x86(?:_64)?$', arch) or re.match(r'^i[3456]86$', arch):
+        return (
+            re.compile(rf'^.*[as][du][db]    \$(0x{X}{{1,8}}),%(?:e|r)sp$'),
+            re.compile(r'^.*[as][du][db]    (%.*),%(?:e|r)sp$'),
+            None)
+    if arch == 'm68k':
+        return (re.compile(r'.*(?:linkw %fp,|addaw )#-([0-9]{1,4})'
+                           r'(?:,%sp)?$'), None, None)
+    if arch == 'mips64':
+        return (re.compile(r'.*daddiu.*sp,sp,-([0-9]{1,8})'), None, None)
+    if arch == 'mips':
+        return (re.compile(r'.*addiu.*sp,sp,-([0-9]{1,8})'), None, None)
+    if arch == 'nios2':
+        return (re.compile(r'.*addi.*sp,sp,-([0-9]{1,8})'), None, None)
+    if arch == 'openrisc':
+        return (re.compile(r'.*l\.addi.*r1,r1,-([0-9]{1,8})'), None, None)
+    if arch in ('parisc', 'parisc64'):
+        return (re.compile(rf'.*ldo ({X}{{1,8}})\(sp\),sp'), None, None)
+    if arch == 'powerpc' or re.match(r'^ppc(?:64)?(?:le)?$', arch):
+        return (re.compile(rf'.*st[dw]u.*r1,-({X}{{1,8}})\(r1\)'),
+                None, None)
+    if re.match(r'^s390x?$', arch):
+        return (re.compile(r'.*(?:lay|ag?hi).*\%r15,-([0-9]+)'
+                           r'(?:\(\%r15\))?$'), None, None)
+    if arch in ('sparc', 'sparc64'):
+        return (re.compile(r'.*save.*%sp, -([0-9]{1,8}), %sp'), None, None)
+    if re.match(r'^riscv(?:64)?$', arch):
+        return (re.compile(r'.*addi.*sp,sp,-([0-9]{1,8})'), None, None)
+    if re.match(r'^loongarch(?:32|64)?$', arch):
+        return (re.compile(r'.*addi\..*sp, .*sp, -([0-9]{1,8}).*'),
+                None, None)
+    print(f'wrong or unknown architecture "{arch}"')
+    sys.exit(1)
+
+
+def parse_size(s):
+    return int(s, 16) if s.startswith('0x') else int(s)
+
+
+def main(argv):
+    arch = argv[0] if argv else platform.machine()
+    min_stack = int(argv[1]) if len(argv) > 1 and argv[1].isdigit() else 512
+
+    main_re, dyn_re, sub_fn = config_for(arch)
+
+    stack = []
+    func = None
+    file = ''
+    intro = ''
+    total = 0
+
+    for raw in sys.stdin:
+        line = raw.rstrip('\n')
+
+        m = RE_FUNC.match(line)
+        if m:
+            func = m.group(2)
+            if total > min_stack:
+                stack.append(f'{intro}{total}\n')
+            addr = m.group(1)
+            intro = f'0x{addr} {func} [{file}]:'
+            pad = 56 - len(intro)
+            while pad > 0:
+                intro += '\t'
+                pad -= 8
+            total = 0
+            continue
+
+        m = RE_FILE.match(line)
+        if m:
+            file = m.group(1).replace('.ko', '')
+            idx = file.rfind('/')
+            if idx != -1:
+                file = file[idx + 1:]
+            continue
+
+        m = main_re.search(line)
+        if m:
+            size = parse_size(m.group(1))
+            if size > 0xf0000000:
+                size = -size + 0x80000000 + 0x80000000
+            if size > 0x10000000:
+                continue
+            total += size
+            continue
+
+        if dyn_re is not None:
+            m = dyn_re.search(line)
+            if m:
+                total += parse_size(m.group(1))
+                continue
+
+        if sub_fn is not None:
+            total += sub_fn(line)
+
+    if total > min_stack:
+        stack.append(f'{intro}{total}\n')
+
+    def key(entry):
+        m = re.search(r':\t*(\d+)$', entry)
+        size = int(m.group(1)) if m else 0
+        m = re.search(r' (.*):', entry)
+        fname = m.group(1) if m else ''
+        return (-size, fname)
+
+    for entry in sorted(stack, key=key):
+        sys.stdout.write(entry)
+    return 0
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv[1:]))
\ No newline at end of file
-- 
2.43.0

