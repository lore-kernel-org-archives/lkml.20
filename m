Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E344C6F04
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331856; cv=none; b=TcZcqH3vpboQVUH2okRAQgnhWnXd7uqJqDedFxTsWkAJDM33t1gs0jbenBx5knKiDYv7AnxJnkuu+re1z4nr0yVRtV45XGmc+ilD/2F0QM2nOofE2jxWyvvJZ7BY+PpqLYMnieqJnxgvU2TUvNo833CmQNnVbBpk22t7m2ssWkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331856; c=relaxed/simple;
	bh=VLprP5i4WV9z0+jdB38T6Tcjj9uibgnoBxVH2syAm38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J29IhQEDKypzHc+bMgEoaeVTxVTzHUdNC09D4vrqdYcUuNiV+J5wAVbK3GyWtPOT3uCmz68zlnLbztYx2U2T192tAgB4NEwlZiMenw/oibNhKKgNgBixyh0lbR9kkskB2q0B7YeI8QxoMZ5p6YA/uR+gQNtq72p5WDgjbDyzAEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSuFpgSg; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSuFpgSg"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35943f55c06so1880880eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792331853; x=1792936653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eg1h+olUuPULaPJhH4b45fxV+IydvVkZq4meRb8O9k=;
        b=JSuFpgSgJVDajCz+xgQXpyrp4i0ui1qpcMvOysrY9kLQVN/4Loae7r+i/HNfjW6pB4
         FFdNpGO21VmiyosYsa5kSAiNi62Q1zQNDg3eRSYTVAQF3cdMtjysTR9Jz+fUpDN/5YkB
         poaz75Jz2dipjd2Uf0dFGE8S71P0YCWG2SmsWDWn7lH6HZbrwLW44yRDtEOPoLXen4PP
         q1xBa9gxWkpKYXXGwRQ0jaYX/X/iAv7+LEuOwwlQmphi798tAhd7FojSe8VEqsuj3/74
         3pA/addYe160b+WQzip1r7Yb9Sx1RQ2RJHQRmz0N8T2c8O5ew0jGCmt5Orsx4qUz2mT/
         2BgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331853; x=1792936653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eg1h+olUuPULaPJhH4b45fxV+IydvVkZq4meRb8O9k=;
        b=aLpm7Q0KPO3cDbvjI9I0C/R4eCoUZSVs/ylCRIa0WGDSztsgyzs6TRfFD+RJ5Ov2x8
         bBerjpvqRmO1MtZgdOfTwZOilzXQBR+6O9Z/RGD5lRj4qsr/yw2EA8d1JApiZOwzDtio
         xjwBbpQOkAjqnvPvDhUeULqAdI6zw3oGrKExlHxBbOooucuAUlO8J1uhpcoWt1oWpP0h
         Fc8vVc67rjv9nhJIP1v7BMxMoq3OpHe3TNu28Iipy7DD9AV2n0XkJ8q0HJH96wvX5t9i
         /Db10+cr/1kz54BcMiMckLbLcFC9dGhOuOrBMfYa23z/URt0NbwdEU6DjGZk7XZKzLJK
         aWdQ==
X-Gm-Message-State: AFq9FYI3buZSv1V1jbhwulJNmyNc5YPfEkW0I6DNTwtYPxp2DLrMWoh/
	WsXQ+LqzgXrQo4cJjaKTIcgpeHWIplOCh/D4Q6FPH8eaLbYh1oIgRghqOj/tIWXc
X-Gm-Gg: AYBFou3pbs+mJsvTByRTaV+/2Sf5G8rUCdQHmFlW+9yUcloei/A8TpGjyj2toVJ3eo4
	kZFMl5h9J4fHRQ0jFanhdAqOLeJDWSAO5GtnRtkF9CD2rsEqcVh3UfwXaO/dn3WIsD67DpWSYV2
	H42lARO50Ib/YHo8fK4Rrw4ntvMQOJFLoHizbFfQdcyYCUKYS4a8ShH0CAk+QUB8hzhEVzWgLjQ
	lFLWAqblLe/BSXrVHf3K7m5gyo5PZSB8ujoyTlW7FfOJVImMGlXuX0eaLtlzkcpIWGH2QBjx6qb
	ciEUfKYktxQrWtEC9DzkUpjrTGEcHW9THRa6bD+dS0ElgP88v2y01LcfNSaMuVRk0OBylHPlrMX
	4h7JO9OrfRm3fz0RHYND+mcZki5BI3DBRfDImROZ4s2tey4rwq8pSop2IDMoEkAPySJ8G119aJz
	xr7e6xowtQfjgh+QLkM4id+Ag93sUfWeAFUZ16jf++SaOgyMWrb+0R1O9rGkGYlXfo6o1qvuJwT
	OqMoVGlroxC1er01ci5BAlSlEmRO69MOiY4ajnNCw==
X-Received: by 2002:a05:7300:6708:b0:351:77a3:55f1 with SMTP id 5a478bee46e88-3602eb94623mr10694490eec.19.1792331852609;
        Sun, 18 Oct 2026 06:57:32 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm27653533eec.6.2026.10.18.06.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:57:30 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v2 1/7] scripts: convert checkstack.pl to Python
Date: Sun, 18 Oct 2026 10:57:16 -0300
Message-ID: <20261018135722.27410-2-breno3011alves@gmail.com>
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

