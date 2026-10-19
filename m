Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5A4FD284
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417719; cv=none; b=X00qHc1Bdq4THkQ9FFKxiKrGqXDWBPItSeV3qvgUvR8pI7BHvFttttp4KXP0a21tK3Cig1pmowzHqAK/SnZCl3Nxte9fMi1S2QtRb3TJ/yaz2g3B7BRqNgs6l/37qQLA9U1gDYqdwGhV5rhj2QYBH2S5S2ntxW1ZY4stuhLkCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417719; c=relaxed/simple;
	bh=jTgLVoYgJB5Rr/aBCuc9XxYCXTMB50N4p2UciCYQyMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZ4uiwc4SIKRYOTNBlgZi1Lgorfy0k4aE+eLa6Bp3VU43b6G+6acT4InAosRsIyOSwoVcktP/FMKR6ceERgOfg0N9vCScihVN22BQ8NnyVGaWdaL01kJrKlMmCrXZr6w5bjxkBS/gr8pLHDCwN/xWvqlvLBezoHRGj+GYw/5Kpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydp+QDx5; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydp+QDx5"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53ec2cc397aso1313807b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417711; x=1793022511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGFKPMBI0cFzXOaE9xouF7yYgFU777Lk0lEcUaMraZQ=;
        b=Ydp+QDx5YGN6iUO9xUAn/pcY3TfZWUdK4c6DzI0V8Dpj7GGlpdTNwKedLOzbiR/SH8
         Zn23jiZAWxVqBtSFi476YMRNSE4NYANJSoW6P6n3Cic9rPYu87J1vojRCxHn1bQatsI4
         8ajnvpJhmeS9L+MsNW6dgvPuDxC0pPevL6TcK7fO2gSzDi0mV9PVJG68wA6hBHLDUcdk
         BobqVQYcmTHv2R9YXxzF1g66x0LFisBv2NVZZs1mKForyitrdb7amR9RnRqoaWx3GmsL
         Wf4DugSAB0+ePqg/CXLJ/s/EUXr1Fll+CY2jR1zaevnhhR0R5Zl7LoUKgNBZjcd8Bf4a
         tThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417711; x=1793022511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGFKPMBI0cFzXOaE9xouF7yYgFU777Lk0lEcUaMraZQ=;
        b=Z+djYWmYVNatvZgVR5mkAJz/d8ttHVXNgd7L2vuNWvpDT2gaPqQGCimrGVCs285fc2
         M+zd/SRj+q4aFmGJbFARWeEetZadX4kiacwfNpxGxpTfv9mqDlzGj2jWZ56xYrjzaWbc
         L20Q/VylwYv5bDM4zGfQEVCx7gH7kymjT7vJik7l+MS1ygmdzlvJwhJgjReFxgcM2LVa
         yu3tBb3aBkqCf4S1w0eL2qGnst3fY7dqfVgfNUcIZ8fjMVwMmrePXkCdW4KHsHU5QMfU
         quuCLC7eaXXiGKUuoVoJNt42ILC6l0mJBem+X/WJPnuM4VCjJz24XYcAdGoYS/6YbV/q
         xxQQ==
X-Gm-Message-State: AFq9FYLXC/4S7uZt87nQSCSAwM0oYAakpwHMxBulDgAHAvyn9iyG69DB
	YINjj/4oK/cStoevEaJEIBxUpEQuUBH69sIINB036C44Ig1MyxAXu7F5
X-Gm-Gg: AYBFou3QpOHMOJaBSgi7zmRLVVX8KeP3AoIeJj8RrLU0JJokRHhcG8gc4o0C8hq449W
	4vC2v2UWoP99TOXRFf60du8s94vmJ7CYETXUzxoOFGiefnTtYsThJR7uhtLbk+2Tuj5cc87EIue
	D5hAh/TTFmZu7J3yYGwwBo5RJWV8SntCPw+F4H7pJUNv+zBS3fGvODOnmQJG23X4TcQpAkmbeXz
	MyHphJAEHOpvsiPCYQR6anMzdnHGLoDyyWF9hQTBkoe9YayekYavhYP3T/GsVfiwIDTbcSKZo82
	3W1rGsYZOlO/uL46YzD79CWxuA9NxYWOLTMQH+TP+IWr5dW3nDwFt0xhw6oNrDSsGlpKT1pv7Na
	rm62BUjgUQ2Gbm0aQg0ULD33Af1pjESCpqkjMElHcrsnporKGHs5Yf+imdS/khcWSigyV0gK8NI
	so4vegcRYHk27/lJUBtaAVM8WB1k9ZVJthuxiAXP6/Icguvc/KBs2dQ4622HdAOvTcG5bkHkdhh
	6uWQWDHgSSB3bN7cHTwG+ts2QKCg3yiyuvEqhgetA==
X-Received: by 2002:a05:6808:3514:b0:503:589a:ade7 with SMTP id 5614622812f47-53cc24cd5e3mr7151467b6e.2.1792417711251;
        Mon, 19 Oct 2026 06:48:31 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.15.112])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388d8ab165sm6843737b6e.11.2026.10.19.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:48:29 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] scripts: checkstack: Convert to Python
Date: Mon, 19 Oct 2026 10:48:21 -0300
Message-ID: <20261019134821.5708-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert checkstack.pl to Python to unify kernel tooling in a single
language. This reduces the maintenance burden of dealing with two
different sets of idioms for the same class of scripts.

The conversion introduces a robust parse_size helper to handle dynamic
stack adjustments (e.g., sub %eax, %esp). In Perl, hex() silently
evaluates non-numeric strings to 0; Python's int() raises a ValueError.
The new helper ensures 1:1 behavioral parity without crashing on valid
objdump output.

Tested by comparing the output of checkstack.pl and checkstack.py
against a full objdump of /bin/bash on x86_64; the outputs were identical.

Assisted-by: DeepSeek
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 scripts/checkstack.pl | 208 ------------------------------------------
 scripts/checkstack.py | 155 +++++++++++++++++++++++++++++++
 2 files changed, 155 insertions(+), 208 deletions(-)
 delete mode 100755 scripts/checkstack.pl
 create mode 100755 scripts/checkstack.py

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
deleted file mode 100755
index 14ce31f73..000000000
--- a/scripts/checkstack.pl
+++ /dev/null
@@ -1,208 +0,0 @@
-#!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0
-
-#	Check the stack usage of functions
-#
-#	Copyright Joern Engel <joern@lazybastard.org>
-#	Inspired by Linus Torvalds
-#	Original idea maybe from Keith Owens
-#	s390 port and big speedup by Arnd Bergmann <arnd@bergmann-dalldorf.de>
-#	Mips port by Juan Quintela <quintela@mandrakesoft.com>
-#	Arm port by Holger Schurig
-#	Random bits by Matt Mackall <mpm@selenic.com>
-#	M68k port by Geert Uytterhoeven and Andreas Schwab
-#	AArch64, PARISC ports by Kyle McMartin
-#	sparc port by Martin Habets <errandir_news@mph.eclipse.co.uk>
-#	ppc64le port by Breno Leitao <leitao@debian.org>
-#	riscv port by Wadim Mueller <wafgo01@gmail.com>
-#	loongarch port by Youling Tang <tangyouling@kylinos.cn>
-#
-#	Usage:
-#	objdump -d vmlinux | scripts/checkstack.pl [arch] [min_stack]
-#
-#	TODO :	Port to all architectures (one regex per arch)
-
-use strict;
-
-# check for arch
-#
-# $re is used for two matches:
-# $& (whole re) matches the complete objdump line with the stack growth
-# $1 (first bracket) matches the size of the stack growth
-#
-# $dre is similar, but for dynamic stack redutions:
-# $& (whole re) matches the complete objdump line with the stack growth
-# $1 (first bracket) matches the dynamic amount of the stack growth
-#
-# $sub: subroutine for special handling to check stack usage.
-#
-# use anything else and feel the pain ;)
-my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
-{
-	my $arch = shift;
-	if ($arch eq "") {
-		$arch = `uname -m`;
-		chomp($arch);
-	}
-
-	$min_stack = shift;
-	if ($min_stack eq "" || $min_stack !~ /^\d+$/) {
-		$min_stack = 512;
-	}
-
-	$x	= "[0-9a-f]";	# hex character
-	$xs	= "[0-9a-f ]";	# hex character or space
-	$funcre = qr/^$x* <(.*)>:$/;
-	if ($arch =~ '^(aarch|arm)64$') {
-		#ffffffc0006325cc:       a9bb7bfd        stp     x29, x30, [sp, #-80]!
-		#a110:       d11643ff        sub     sp, sp, #0x590
-		$re = qr/^.*stp.*sp, ?\#-([0-9]{1,8})\]\!/o;
-		$dre = qr/^.*sub.*sp, sp, #(0x$x{1,8})/o;
-	} elsif ($arch eq 'arm') {
-		#c0008ffc:	e24dd064	sub	sp, sp, #100	; 0x64
-		$re = qr/.*sub.*sp, sp, #([0-9]{1,4})/o;
-		$sub = \&arm_push_handling;
-	} elsif ($arch =~ /^x86(_64)?$/ || $arch =~ /^i[3456]86$/) {
-		#c0105234:       81 ec ac 05 00 00       sub    $0x5ac,%esp
-		# or
-		#    2f60:    48 81 ec e8 05 00 00       sub    $0x5e8,%rsp
-		$re = qr/^.*[as][du][db]    \$(0x$x{1,8}),\%(e|r)sp$/o;
-		$dre = qr/^.*[as][du][db]    (%.*),\%(e|r)sp$/o;
-	} elsif ($arch eq 'm68k') {
-		#    2b6c:       4e56 fb70       linkw %fp,#-1168
-		#  1df770:       defc ffe4       addaw #-28,%sp
-		$re = qr/.*(?:linkw %fp,|addaw )#-([0-9]{1,4})(?:,%sp)?$/o;
-	} elsif ($arch eq 'mips64') {
-		#8800402c:       67bdfff0        daddiu  sp,sp,-16
-		$re = qr/.*daddiu.*sp,sp,-([0-9]{1,8})/o;
-	} elsif ($arch eq 'mips') {
-		#88003254:       27bdffe0        addiu   sp,sp,-32
-		$re = qr/.*addiu.*sp,sp,-([0-9]{1,8})/o;
-	} elsif ($arch eq 'nios2') {
-		#25a8:	defffb04 	addi	sp,sp,-20
-		$re = qr/.*addi.*sp,sp,-([0-9]{1,8})/o;
-	} elsif ($arch eq 'openrisc') {
-		# c000043c:       9c 21 fe f0     l.addi r1,r1,-272
-		$re = qr/.*l\.addi.*r1,r1,-([0-9]{1,8})/o;
-	} elsif ($arch eq 'parisc' || $arch eq 'parisc64') {
-		$re = qr/.*ldo ($x{1,8})\(sp\),sp/o;
-	} elsif ($arch eq 'powerpc' || $arch =~ /^ppc(64)?(le)?$/ ) {
-		# powerpc    : 94 21 ff 30     stwu    r1,-208(r1)
-		# ppc64(le)  : 81 ff 21 f8     stdu    r1,-128(r1)
-		$re = qr/.*st[dw]u.*r1,-($x{1,8})\(r1\)/o;
-	} elsif ($arch =~ /^s390x?$/) {
-		#   11160:       a7 fb ff 60             aghi   %r15,-160
-		# or
-		#  100092:	 e3 f0 ff c8 ff 71	 lay	 %r15,-56(%r15)
-		$re = qr/.*(?:lay|ag?hi).*\%r15,-([0-9]+)(?:\(\%r15\))?$/o;
-	} elsif ($arch eq 'sparc' || $arch eq 'sparc64') {
-		# f0019d10:       9d e3 bf 90     save  %sp, -112, %sp
-		$re = qr/.*save.*%sp, -([0-9]{1,8}), %sp/o;
-	} elsif ($arch =~ /^riscv(64)?$/) {
-		#ffffffff8036e868:	c2010113          	addi	sp,sp,-992
-		$re = qr/.*addi.*sp,sp,-([0-9]{1,8})/o;
-	} elsif ($arch =~ /^loongarch(32|64)?$/) {
-		#9000000000224708:	02ff4063		addi.d  $sp, $sp, -48(0xfd0)
-		$re = qr/.*addi\..*sp, .*sp, -([0-9]{1,8}).*/o;
-	} else {
-		print("wrong or unknown architecture \"$arch\"\n");
-		exit
-	}
-}
-
-#
-# To count stack usage of push {*, fp, ip, lr, pc} instruction in ARM,
-# if FRAME POINTER is enabled.
-# e.g. c01f0d48: e92ddff0 push {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
-#
-sub arm_push_handling {
-	my $regex = qr/.*push.*fp, ip, lr, pc}/o;
-	my $size = 0;
-	my $line_arg = shift;
-
-	if ($line_arg =~ m/$regex/) {
-		$size = $line_arg =~ tr/,//;
-		$size = ($size + 1) * 4;
-	}
-
-	return $size;
-}
-
-#
-# main()
-#
-my ($func, $file, $lastslash, $total_size, $addr, $intro);
-
-$total_size = 0;
-
-while (my $line = <STDIN>) {
-	if ($line =~ m/$funcre/) {
-		$func = $1;
-		next if $line !~ m/^($x*)/;
-		if ($total_size > $min_stack) {
-			push @stack, "$intro$total_size\n";
-		}
-		$addr = "0x$1";
-		$intro = "$addr $func [$file]:";
-		my $padlen = 56 - length($intro);
-		while ($padlen > 0) {
-			$intro .= '	';
-			$padlen -= 8;
-		}
-
-		$total_size = 0;
-	}
-	elsif ($line =~ m/(.*):\s*file format/) {
-		$file = $1;
-		$file =~ s/\.ko//;
-		$lastslash = rindex($file, "/");
-		if ($lastslash != -1) {
-			$file = substr($file, $lastslash + 1);
-		}
-	}
-	elsif ($line =~ m/$re/) {
-		my $size = $1;
-		$size = hex($size) if ($size =~ /^0x/);
-
-		if ($size > 0xf0000000) {
-			$size = - $size;
-			$size += 0x80000000;
-			$size += 0x80000000;
-		}
-		next if ($size > 0x10000000);
-
-		$total_size += $size;
-	}
-	elsif (defined $dre && $line =~ m/$dre/) {
-		my $size = $1;
-
-		$size = hex($size) if ($size =~ /^0x/);
-		$total_size += $size;
-	}
-	elsif (defined $sub) {
-		my $size = &$sub($line);
-
-		$total_size += $size;
-	}
-}
-if ($total_size > $min_stack) {
-	push @stack, "$intro$total_size\n";
-}
-
-# Sort output by size (last field) and function name if size is the same
-sub sort_lines {
-	my ($a, $b) = @_;
-
-	my $num_a = $1 if $a =~ /:\t*(\d+)$/;
-	my $num_b = $1 if $b =~ /:\t*(\d+)$/;
-	my $func_a = $1 if $a =~ / (.*):/;
-	my $func_b = $1 if $b =~ / (.*):/;
-
-	if ($num_a != $num_b) {
-		return $num_b <=> $num_a;
-	} else {
-		return $func_a cmp $func_b;
-	}
-}
-
-print sort { sort_lines($a, $b) } @stack;
diff --git a/scripts/checkstack.py b/scripts/checkstack.py
new file mode 100755
index 000000000..c3821c860
--- /dev/null
+++ b/scripts/checkstack.py
@@ -0,0 +1,155 @@
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
+    """
+    Mimics Perl's implicit numeric conversion.
+    In Perl, hex("%eax") silently evaluates to 0.
+    In Python, int("%eax") raises ValueError, so we catch it
+    to maintain 1:1 parity and prevent script crashes.
+    """
+    if not s:
+        return 0
+    try:
+        return int(s, 16) if s.startswith('0x') else int(s)
+    except ValueError:
+        return 0
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
+        # Fix: Use rstrip('\r\n') to handle Windows-formatted objdump files safely
+        line = raw.rstrip('\r\n')
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

