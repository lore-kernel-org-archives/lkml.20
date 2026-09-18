Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A845D1A5;
	Fri, 18 Sep 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726499; cv=none; b=RM3l8rMh/6UY7RyjCOXoUF8e+iF7Zn7TOF3s6GTOYgMo54veLOXbRCcJYu0777ZlhGUNrqGxpw4G+A3cOD0idcKGQbQpZKmftPF/6Uwu7+Mx9WWioX+xekUXrxi/kcnDvSTXn/f2NcD4y7YPqkRR1QR4p976iVLoCdEu33cok4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726499; c=relaxed/simple;
	bh=Ek5jtU7mbIdgsBC05VDf4xdz4JNo4ya/+THcp8pGXlo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=QBYqMXGcIXkG2ysQBELHjlLYNAMLbHXIlQJhHZ47d7GcNBmGhDZ56ZaFDQxgUHNMPQHmaggOCtx1/iWciF9hKTjH5Grt5Yuxa0zn2ghbhvpQfB9e+yHofv6Go7RO51kPdVz9nLHfOfaerkNwUWZ4dr5NCervgzdkkbJ5ijbgRac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ov6ZjF7d; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6aFJ08RR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ov6ZjF7d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6aFJ08RR"
Date: Fri, 18 Sep 2026 10:14:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726495;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSmLp4HhyGi0CljH17SNTQBResRHqP0CgVJEYY/tN0c=;
	b=ov6ZjF7dD1HiNt3uhH9ImByqdduNTkQGbO05LadIG4bz17bwZAjIJJwkgMuOganBCD4Dgl
	NFClGtecMUtLpLZ0kjVBFsFokCuBm0MFKDBYB5Mwy5v82HN9L8mpF+2T5lNZYxuzJ6uJoJ
	fOIQ/F7hWFY/q2gLG4gfnIhNG/7Ht6csybs48xF32oAPyVcZO5+cRDLTYbn/UTOePmfzoa
	1Yq3ydlhR47T6l+v/46Z9Oj2MWHogFdZOkslz3OxVmN572aSCYLMeisF/bwBEYqHJmxbQ0
	3s5WWkhduIVjOIjMxAc2beuWBEHLFf9Wo6ghTcQfecWMnkHt3UnIUW7ZXkZclQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726495;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSmLp4HhyGi0CljH17SNTQBResRHqP0CgVJEYY/tN0c=;
	b=6aFJ08RRW76zCyHN8IApELUlAoAO+9U3lvaJ4KxR0jGLCLF7JaeQZB2JwKhHPivl4v8M1s
	dDXZuOupnkRooJAg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for absolute and
 __ADDRESSABLE symbols
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-56-song@kernel.org>
References: <20260916184351.2720310-56-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972649392.1720534.8622661675441840946.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     6f893470dc01bea8ab9033c6e310eb46902869fd
Gitweb:        https://git.kernel.org/tip/6f893470dc01bea8ab9033c6e310eb46902=
869fd
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:48 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

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
Link: https://patch.msgid.link/20260916184351.2720310-56-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
