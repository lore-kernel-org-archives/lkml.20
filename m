Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9246EF72;
	Mon, 21 Sep 2026 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982858; cv=none; b=rasMCHTpmg11yujBsr/Bmnf+NLcdnzGMXPn4jJSoKfAq1VvYRWZBnEVcylnCn5d6foqX665a6YYmYESt41I3ADeith4gxqkgLb8UABNIVY6lkCuiY66911/PrNpRE1M9/WQcW0tPvUR89aJVhaSB+J1K/pAiiAUM/7ocjF9wz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982858; c=relaxed/simple;
	bh=Yd77PTANMBZR0bCEKGh0T0ek3z6aj6rO3UTwb/yDX1E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=naUC71EY0GSNrAiM0rbWG/Jr1pU1VFiK8vPEuytSTXMCex40QoBhuO+AcO03yJK95+J/n48HINQAnApUSfzaLu0o+E5dKYAXlfITbEHQjiVDW0/VTDpNdv1y2WqqyJdYaYMRs8iUVeR66r3mApqmqL4Ko0BtlcCHOc1iCnOmC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zI3OZjB2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xtuFES5h; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zI3OZjB2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xtuFES5h"
Date: Mon, 21 Sep 2026 09:27:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982853;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VT9XFAxteWMb4qXhRdGPYy/RSWgrFRMevbJiIuCU8A=;
	b=zI3OZjB21iSbJkVWj8IaZab5W4AhD/zcffJ60Vk8VnlgLEQ/DSUz2iMY4q4IjAzEiHoB5C
	tEGObDTO4rNnGIXgGVx/2alD+TPeDdGhggC6ZxXZEpGA4bTZFnpa2vOjaGnPm8ObqIjhDy
	9hLDyv2y06k1EJoBAfYBFDEMa7Cf3AC9REaFq11P1oCIqrmVFCvXuZ9fmu1677U/hzlUep
	4ABFFf3kDzGn3UUvtEajSwA+1bmqjjGk0EK+8jsLQMhjPPkHVAyHFtHW2HxPo03Rk9nH6W
	i3ity7RL7pnTfq47GhJSBjsPKeLVpBg12zcfVeSWy5Kzo+4bzLgNrEPePRhz3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982853;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VT9XFAxteWMb4qXhRdGPYy/RSWgrFRMevbJiIuCU8A=;
	b=xtuFES5hXdXbKLkpPAFGZG5aF4HaC9mIdn6s3Z74hMdBVRGLVoldSKAniyLDRHn79uEuFN
	CMIiBQChwrC5e3Dw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for absolute and
 __ADDRESSABLE symbols
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-56-song@kernel.org>
References: <20260916184351.2720310-56-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998285167.2819794.10584531895931503263.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     91c6748459855f3782d445f1a6362a20240fc14e
Gitweb:        https://git.kernel.org/tip/91c6748459855f3782d445f1a6362a20240=
fc14e
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:48 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:08 +02:00

objtool/klp: Add test for absolute and __ADDRESSABLE symbols

A SHN_ABS symbol has no section, so any walk of sym->sec which does not
check dereferences NULL, and the kernel has plenty of them -- from linker
scripts and from .set in assembly.  __ADDRESSABLE() emits a pointer into
.discard.addressable purely to keep a symbol referenced; it means nothing
to a livepatch and is discarded at link time, but it is a relocation like
any other and gets looked at.

Neither is what the patch changes.  What this guards against is not a wrong
answer but a crash or an error on input the kernel produces routinely,
which would make every function near one unpatchable.

Not isolated to a single line, and the test says so: the absolute symbol
here has zero length, so it is excluded before the section check is reached
and removing that check alone changes nothing observable.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-56-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/abs_and_addressable.c | 44 ++++++-
 tools/objtool/tests/generic/test-abs-and-addressable.sh    | 50 +++++++-
 2 files changed, 94 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/abs_and_addressable.c
 create mode 100755 tools/objtool/tests/generic/test-abs-and-addressable.sh

diff --git a/tools/objtool/tests/generic/fixtures/abs_and_addressable.c b/too=
ls/objtool/tests/generic/fixtures/abs_and_addressable.c
new file mode 100644
index 0000000..6392ff9
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/abs_and_addressable.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Two constructs which appear all over the kernel and must not upset klp
+ * checksum or klp diff.
+ *
+ * An absolute symbol (SHN_ABS) has no section, so anything walking sym->sec
+ * without checking dereferences NULL.  The kernel makes them with linker
+ * scripts and with .set in asm; VDSO and the fixed-address per-cpu bases are
+ * the usual sources.
+ *
+ * __ADDRESSABLE() emits a pointer into .discard.addressable purely to keep a
+ * symbol referenced.  It is discarded at link time and means nothing to a
+ * livepatch, but the pointer is a relocation like any other and has to surv=
ive
+ * being looked at.
+ *
+ * Neither is the subject of the patch; the point is that their presence does
+ * not disturb the function that is.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+/* SHN_ABS, referenced from code. */
+extern char abs_sym[];
+__asm__(".globl abs_sym\n"
+	".set abs_sym, 0x1234\n");
+
+int helper(int x);
+int helper(int x) { return x + 1; }
+
+/* The shape of __ADDRESSABLE(helper). */
+__asm__(".pushsection .discard.addressable, \"aw\"\n"
+	".balign 8\n"
+	".quad helper\n"
+	".popsection\n");
+
+int target(int x)
+{
+#ifdef PATCHED
+	return helper(x) + (int)(long)abs_sym + 1;
+#else
+	return helper(x) + (int)(long)abs_sym;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-abs-and-addressable.sh b/tools/=
objtool/tests/generic/test-abs-and-addressable.sh
new file mode 100755
index 0000000..6adb23e
--- /dev/null
+++ b/tools/objtool/tests/generic/test-abs-and-addressable.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# An absolute symbol and an __ADDRESSABLE() pointer must not disturb the
+# function being patched.
+#
+# A SHN_ABS symbol has no section, so any walk of sym->sec which does not ch=
eck
+# dereferences NULL -- and the kernel has plenty, from linker scripts and fr=
om
+# .set in assembly.  __ADDRESSABLE() emits a pointer into .discard.addressab=
le
+# to keep a symbol referenced; it means nothing to a livepatch and is discar=
ded
+# at link time, but it is a relocation like any other and gets looked at.
+#
+# Neither is what the patch changes.  The failure this guards against is not=
 a
+# wrong answer but a crash or an error on input the kernel produces routinel=
y,
+# which would make any function near one unpatchable.
+#
+# Not isolated to a single guard: the absolute symbol here has zero length, =
so
+# it is excluded before the section check is reached and removing that check
+# alone changes nothing observable.  This stands as a check on the behaviour
+# rather than on the line which produces it.
+#
+# Covers the same ground as corpus/x86_64/checksum-abs-sym-skip and
+# addressable-symbols in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair abs_and_addressable.c
+
+# The premise: the fixture really did produce both.
+in_symbols orig.o | grep -q 'ABS.*abs_sym' ||
+	probe_skip "assembler did not make abs_sym absolute here"
+assert_input_section .discard.addressable
+
+# Checksumming has to survive them, and still see the function that changed.
+run_checksum
+assert_checksum_differs target
+assert_checksum_matches helper
+
+# So does the diff.
+run_diff
+assert_patched target
+assert_not_patched helper
+
+# An absolute symbol has no address to record a checksum against, so it gets
+# no entry -- the reference to it is what mattered, not the symbol itself.
+in_relocs orig.o | awk '/rela\.discard\.sym_checksum/,/^$/' | grep -qw abs_s=
ym &&
+	fail "absolute symbol got a checksum entry"
+
+pass "absolute and __ADDRESSABLE symbols do not disturb the patched function"
