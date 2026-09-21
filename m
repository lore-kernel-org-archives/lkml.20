Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406046E01D;
	Mon, 21 Sep 2026 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982873; cv=none; b=HXxByk3M0br/7jDOim+Lp8wVKiq51oj+YXPWnqFga1S/8uJYW77BD+qkz7OZ2hNzQZFrgSU1SPUYmZtQY0W0DS2nB7PR6ucJTODNLOKgYCcf9cphhnSJy9a2HeDfQ640SUljeEKYb/hvrGCub9dBJXvb2iQTFEvK1BJ3i8t4uGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982873; c=relaxed/simple;
	bh=037NdwAbcZBWMUhPtdPYws+5458b8tCsA1ByCEsDXTQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=smGVorVbMEF0+c23bLAP7HcxVBTGxXI/q9H+Q2OzGcL84Rlb44qVPSlfOYU+kBleq/N54xN0cdT6Z+0RDYGHXo2Ea3GLrzzXjvbv4RNqztUidjl7C4up1PmCJEk1yr31kF3yn5/UczgfZnCu97yuDk8BNv/POxr6FO0B8LvJRpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kYvLYn2n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CHwccvA2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kYvLYn2n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CHwccvA2"
Date: Mon, 21 Sep 2026 09:27:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982869;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ae0u/N5stW2xvWgU5pf0d3ZRcwhRiqTx9K5P9yPzhCk=;
	b=kYvLYn2nfFkwbT3kGGupVceMT9km1KoxXceobSoGhHOvZJt31qH+hm99BkWj627E+JQcOY
	k+1Z7SRDdbKfCSEsk0S79Gxxj0Qbb6T5PVxLG8sxulA9a02FHlo29C+c7Z51JxNT7gu8Rp
	IS3M8q/fdUNvCL4ChB994UoqMKsJVbjft1WdpqM/Ji36ZGEtg7bKYBGYxGCmybAr6MyyZl
	zmDJ5XCdlFI7bO8+5m7FC+WK6QVyz2DY8t/M50LIWSDiY3jyMmEL0rI3ChVnq59498ljeg
	wzOfwyum5HHO2rdYb1qLBssZORUWS+1AV6/iC5u/97X5WmYdjDSgvLPEhN5I9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982869;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ae0u/N5stW2xvWgU5pf0d3ZRcwhRiqTx9K5P9yPzhCk=;
	b=CHwccvA2vMcsBJhXtbVRet4NyBlfGijVD5nc55Jzfy9qRA7tueAb0GoaqUkN7zAoKpubQH
	MZfz4F4TUmBQaoBQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Test text annotations on alternative
 replacements
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-46-song@kernel.org>
References: <20260916184351.2720310-46-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998286733.2819794.10740792850898601989.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     c4717a1628dda5b48e68544d82bddf2fe3465615
Gitweb:        https://git.kernel.org/tip/c4717a1628dda5b48e68544d82bddf2fe34=
65615
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:38 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Test text annotations on alternative replacements

The kernel annotates instructions inside an ALTERNATIVE's replacement
wherever objtool has to be told something about them -- a retpoline-safe
indirect branch, a deliberately absent ENDBR.  klp diff dropped those
annotations, for two reasons: replacement code has no real symbol, so the
NOTYPE fake symbol objtool invents for it was not recognised as worth
keeping a reference to, and .discard.annotate_insn was processed before
.altinstructions, so the replacement it named had no clone yet.

Nothing fails at build time when the annotation goes missing.  It surfaces
later as objtool warning about, or rejecting, the very code the annotation
was there to explain.

The fixture keeps the replacement label global, as empty_alternative.c
does, so the relocations name it instead of .altinstr_replacement plus an
addend -- which klp diff rejects outright.  The label is still NOTYPE,
which is the property under test.  The test asserts the relocation as well
as the section, since an entry whose relocation was dropped would otherwise
pass.

Verified by reverting commit 62a7a01fde87 ("objtool/klp: Fix extraction of
text annotations for alternatives"): the output has no
.discard.annotate_insn at all and the test fails, under both gcc and clang.

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-46-song@kernel.org
---
 tools/objtool/tests/x86/fixtures/alt_annotate.c | 57 ++++++++++++++++-
 tools/objtool/tests/x86/test-alt-annotation.sh  | 38 +++++++++++-
 2 files changed, 95 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/alt_annotate.c
 create mode 100755 tools/objtool/tests/x86/test-alt-annotation.sh

diff --git a/tools/objtool/tests/x86/fixtures/alt_annotate.c b/tools/objtool/=
tests/x86/fixtures/alt_annotate.c
new file mode 100644
index 0000000..af44d32
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/alt_annotate.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * An x86 alternative whose replacement instruction carries a text annotatio=
n.
+ *
+ * The kernel does this wherever an ALTERNATIVE contains something objtool h=
as
+ * to be told about -- a retpoline-safe indirect branch, an intentionally
+ * missing ENDBR -- so the .discard.annotate_insn entry references an address
+ * inside .altinstr_replacement rather than inside a function.
+ *
+ * Two things make that awkward for klp diff, and both are why this fixture
+ * exists.  Replacement code has no real symbol: objtool invents a NOTYPE fa=
ke
+ * symbol for it, so an annotation pointing there does not reference a FUNC.
+ * And .discard.annotate_insn has to be cloned after .altinstructions, or the
+ * replacement it names has no clone to point at yet.
+ *
+ * struct alt_instr is written out by hand as in empty_alternative.c: s32
+ * instr_offset, s32 repl_offset, u32 ft_flags, u8 instrlen, u8 replacementl=
en,
+ * with an entsize so klp diff can find the entry boundaries.
+ * .discard.annotate_insn entries are s32 offset, s32 type; type 2 is
+ * ANNOTYPE_RETPOLINE_SAFE.
+ *
+ * The replacement label is global so the relocations name it rather than
+ * .altinstr_replacement plus an addend, which klp diff cannot convert.  It =
is
+ * still NOTYPE, which is the shape that matters here.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int target(int x)
+{
+	asm volatile(
+		"661:	nop\n\t"
+		".pushsection .altinstr_replacement, \"ax\"\n\t"
+		".globl target_repl\n\t"
+		"target_repl:\n\t"
+		"	nop\n\t"
+		/* The annotation lands inside the replacement. */
+		".pushsection .discard.annotate_insn, \"M\", @progbits, 8\n\t"
+		".long target_repl - .\n\t"
+		".long 2\n\t"
+		".popsection\n\t"
+		"target_repl_end:\n\t"
+		".popsection\n\t"
+		".pushsection .altinstructions, \"aM\", @progbits, 14\n\t"
+		".long 661b - .\n\t"
+		".long target_repl - .\n\t"
+		".long 0\n\t"
+		".byte 1\n\t"
+		".byte target_repl_end - target_repl\n\t"
+		".popsection\n\t");
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/x86/test-alt-annotation.sh b/tools/objtool/t=
ests/x86/test-alt-annotation.sh
new file mode 100755
index 0000000..96760e6
--- /dev/null
+++ b/tools/objtool/tests/x86/test-alt-annotation.sh
@@ -0,0 +1,38 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A text annotation on an instruction inside an alternative's replacement mu=
st
+# be carried into the patch.
+#
+# The kernel annotates replacement code wherever objtool has to be told
+# something about it -- a retpoline-safe indirect branch, a deliberately abs=
ent
+# ENDBR.  Two things made klp diff drop those annotations:
+#
+#   - replacement code has no real symbol, so objtool invents a NOTYPE fake
+#     one, and the extraction only kept references to FUNC symbols;
+#   - .discard.annotate_insn was processed before .altinstructions, so the
+#     replacement it referenced had no clone to point at yet.
+#
+# Nothing fails at build time when the annotation goes missing.  It surfaces
+# later as objtool warning about, or rejecting, the patched code it was there
+# to explain.
+#
+# Fixed by 62a7a01fde87 ("objtool/klp: Fix extraction of text annotations for
+# alternatives").
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair alt_annotate.c
+
+assert_input_section .altinstructions
+assert_input_section .discard.annotate_insn
+
+run_diff
+
+# The annotation has to survive, and to still name the replacement.  Checking
+# only the section would pass on an entry whose relocation was dropped.
+assert_section .discard.annotate_insn
+assert_reloc_sym .discard.annotate_insn target_repl
+
+pass "text annotation on an alternative replacement carried into the patch"
