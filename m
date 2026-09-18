Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BBE4E324C;
	Fri, 18 Sep 2026 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726536; cv=none; b=EForEbv9PNj1c+QTWiKxzbS0G0ocdu3krbShYSU3gRjciuPoSoEsz2pjuUUAkl+Prg+kR8m5nzpHJvuldz5SsmLPlvh6Hpd+vgBORdUO9uLxIS94ep1RBb9khF2o/68XBoz5nqYoo6HhxtTcn7hP3X/l3blOvDg4Qvv60V1vUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726536; c=relaxed/simple;
	bh=0sLs+vKMu/SmpDKfgQVJw8vaIQu3uN5gYaxd/uMyd1M=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tI0yLy7KZNk7/oMq3GFpZWke72P32jRQfP/ZSvKaVUCMno8LZGARIULq43y5gVO3OWDdpA9o4388/bn/K0RhjYHb6yAay/KoRwYkK8QzaofCOhy298YRHtCj20ZnSEm+J33bW+Ogw6VXAk37Yxs2BWp/ov2rTcOnUmeb/UNjztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c1fwg3rN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oEMZbKdH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c1fwg3rN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oEMZbKdH"
Date: Fri, 18 Sep 2026 10:15:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726530;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYZd5J0f6lV9DnuyUYAf3qhYB7QnO/bsz/1y4xf8ItQ=;
	b=c1fwg3rNHfAzaA5B8igz8kjOVNaAtftyiVRn6oo0EzGGGrFFlqvk4NBGIVnszRkouUtXsU
	FUpzWuH/ePviUzfyrAQ7XDbbMnt2KZG1w3aMrdYCBf1cXs3SPww+yWjmmGoTY8aHN61cyT
	9lAxwUifMBY5xx+Me+Z8/Dk1d1QX81YAEQtlGAb6MIyGeooR0vSS9/YXXk5Mq2uzBz60Lb
	UzGkdlZY8DMAa3HKju+RpYgBcaNDKkSWxRkxlwBSb7s4JH2Xm//OB/235IBWtyuTIcLjkR
	3PrljwRE4z4aZ+rEMQ1azCBEbbbZGP+0bgqsam9bQ2Eg2pjxw0LHJXoDyEM04g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726530;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xYZd5J0f6lV9DnuyUYAf3qhYB7QnO/bsz/1y4xf8ItQ=;
	b=oEMZbKdHTj25gtLwlNhMUTg2v+mkCmUML9v6Xve7yI3Fu57s36LyGd+e2f0KOV9ojD5XlH
	MPfJ+9ep/YWDBgBA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for empty x86 alternative
 replacements
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-35-song@kernel.org>
References: <20260916184351.2720310-35-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972652876.1720534.7405181979025426722.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     a249e6986f4cde3c88a09cdd44a7d88d44aea730
Gitweb:        https://git.kernel.org/tip/a249e6986f4cde3c88a09cdd44a7d88d44a=
ea730
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:27 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:29 -07:00

objtool/klp: Add test for empty x86 alternative replacements

ALTERNATIVE_2("orig", "repl", ft1, "", ft2) produces a second entry whose
replacement is empty.  Its replacement offset still carries a relocation,
but the label it points at is the end of the previous replacement -- which
is also where the next one begins.  The value is meaningless and only ever
used with a length of zero, so cloning must not follow it.

The first version of this fixture passed with the fix reverted, because the
empty entry pointed at its own end label rather than at the neighbour's
replacement.  It has to reach into another function's replacement to
distinguish the behaviour.

This tests the behavior of commit 636f230ce21e ("objtool/klp: Ignore
replacement offset of empty x86 alternatives").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-35-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/x86/fixtures/empty_alternative.c | 77 +++++++++++-
 tools/objtool/tests/x86/test-empty-alternative.sh    | 31 ++++-
 2 files changed, 108 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/empty_alternative.c
 create mode 100755 tools/objtool/tests/x86/test-empty-alternative.sh

diff --git a/tools/objtool/tests/x86/fixtures/empty_alternative.c b/tools/obj=
tool/tests/x86/fixtures/empty_alternative.c
new file mode 100644
index 0000000..9336d74
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/empty_alternative.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * An x86 alternative with an empty replacement, as the second entry of
+ * ALTERNATIVE_2("orig", "repl", ft1, "", ft2) produces.  Its replacement
+ * offset still gets a relocation, but the label it points at is the end of =
the
+ * previous replacement, which is also where the *next* one begins -- here,
+ * neighbor()'s.  The value is meaningless; it is only ever used with a leng=
th
+ * of zero.
+ *
+ * struct alt_instr is written out by hand so the fixture builds without ker=
nel
+ * headers: s32 instr_offset, s32 repl_offset, u32 ft_flags, u8 instrlen,
+ * u8 replacementlen.  The section carries an entsize because klp diff needs
+ * either that or an ANNOTATE_DATA_SPECIAL annotation to find entry boundari=
es.
+ *
+ * The replacement labels are global so the relocations name them rather than
+ * .altinstr_replacement plus an addend.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+extern int neighbor_only(int x);
+
+int target(int x)
+{
+	asm volatile(
+		"661:	nop\n\t"
+		".pushsection .altinstr_replacement, \"ax\"\n\t"
+		".globl target_repl\n\t"
+		"target_repl:\n\t"
+		"	nop\n\t"
+		"target_repl_end:\n\t"
+		".popsection\n\t"
+		".pushsection .altinstructions, \"aM\", @progbits, 14\n\t"
+		/* a real replacement */
+		".long 661b - .\n\t"
+		".long target_repl - .\n\t"
+		".long 0\n\t"
+		".byte 1\n\t"
+		".byte target_repl_end - target_repl\n\t"
+		/* an empty one, pointing at neighbor()'s replacement */
+		".long 661b - .\n\t"
+		".long neighbor_repl - .\n\t"
+		".long 0\n\t"
+		".byte 1\n\t"
+		".byte 0\n\t"
+		".popsection\n\t");
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
+
+/*
+ * Unrelated, unpatched, and referencing a symbol nothing else does, so that
+ * dragging its replacement in is visible.
+ */
+int neighbor(int x)
+{
+	asm volatile(
+		"771:	nop\n\t"
+		".pushsection .altinstr_replacement, \"ax\"\n\t"
+		".globl neighbor_repl\n\t"
+		"neighbor_repl:\n\t"
+		"	call neighbor_only\n\t"
+		"neighbor_repl_end:\n\t"
+		".popsection\n\t"
+		".pushsection .altinstructions, \"aM\", @progbits, 14\n\t"
+		".long 771b - .\n\t"
+		".long neighbor_repl - .\n\t"
+		".long 0\n\t"
+		".byte 1\n\t"
+		".byte neighbor_repl_end - neighbor_repl\n\t"
+		".popsection\n\t");
+	return x;
+}
diff --git a/tools/objtool/tests/x86/test-empty-alternative.sh b/tools/objtoo=
l/tests/x86/test-empty-alternative.sh
new file mode 100755
index 0000000..9d40c3a
--- /dev/null
+++ b/tools/objtool/tests/x86/test-empty-alternative.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# An x86 alternative with an empty replacement still gets a relocation for i=
ts
+# replacement offset, but the label it points at is the end of the previous
+# replacement -- which is also the start of the next one.  The value is
+# meaningless, and get_alt_entry() already ignores it.
+#
+# Cloning it drags in an unrelated neighboring replacement and everything th=
at
+# replacement references.  In the reported case an empty alternative in
+# meminfo_proc_show() pulled in one from proc_kcore_init(), emitting a klp
+# relocation against init text which is long freed by the time the patch is
+# applied.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair empty_alternative.c
+
+assert_input_section .altinstructions
+assert_input_section .altinstr_replacement
+
+run_diff
+
+# target's own replacement comes along ...
+assert_symbol target_repl
+# ... neighbor's does not, nor what it references.
+assert_no_symbol neighbor_repl
+assert_no_symbol neighbor_only
+
+pass "empty alternative's replacement offset ignored when cloning"
