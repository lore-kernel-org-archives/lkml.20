Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728A4C9E12;
	Fri, 18 Sep 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726504; cv=none; b=AQxaNhlGpMhX1nzCstAdXAbNZYjMCsCu4IqyzUaWmnbl0MfviI/juZNcZc2MxDuzH10+zw6Raht3d0Z4m+hCr/+u5R/SMaVs5M6S1d+WUJibGV5ZN/otlmHD/ZmBAf7T4Atl63tWSz2ZhdGgIr5COWo/Q3sdGRiUjENdBZd317s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726504; c=relaxed/simple;
	bh=b1Jy0bGhkxdpC5/7Zkh+tqu+CsqRCLHXdf34uOXRcq0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PB+ajosBl+h73N3L1twLVU/MF+s/8cXjCBPR6jzr1xtcoiN0vu/L6dUpQE3IeCJVMa3DStzxv3ijoJfhDeG/SuZ2c1YNUGWyhffvxKrc0QkXBzDtgA53wEB6H/SrOP5bvoSQAlffIer5OorVaSKeiCGoZb4fBiXwt1d2eVD7NT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0nwNP2gb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZMrT5PIc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0nwNP2gb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZMrT5PIc"
Date: Fri, 18 Sep 2026 10:14:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726499;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0hDdsKaQ1cNH0Od0QMGtmPeOCwKmViGPvtiffIOHFg=;
	b=0nwNP2gb4eNqPDfakv9Pd/luCnOLisWJfXTdxOYAXbja7GGME3af7eoP5kbb+dMIx254w9
	F6Ps4g+nFtcCJHCxNqppaEhhItJtbS/cswrgZ8sPywS+o3tPeQan8X83L7g79QOSCPLBDs
	etuWc060N/c/RNLqF+bm1ol8k4/RZcw9qg21wUEbOQTIFYigTDM15ZLdL27l0L5RyZX7mP
	EayoFnnQRgPTBuI0Hc/ZNyml8wecGaJ+cxxd3QPnULJT5PcWo+9ai44zLCrqNPZpIgfRh0
	pWpcm1mOreSxveFR8N3caJYAephJUOBsyPrYOkUQiQXV7VZ9q3zg0z0gLAD5Tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726499;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0hDdsKaQ1cNH0Od0QMGtmPeOCwKmViGPvtiffIOHFg=;
	b=ZMrT5PIcQYgtBMOJcp8uIUOXsdiBqy7mEGAKOkmCbWvKhAt4GRkRRahv5uiRF7KRDVOYle
	A+0SEY17aC7yFgAA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for alternative replacement
 code in checksums
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-53-song@kernel.org>
References: <20260916184351.2720310-53-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972649812.1720534.2817317879096014263.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     16261dd3ea560abc3037620a51e514bec664a25e
Gitweb:        https://git.kernel.org/tip/16261dd3ea560abc3037620a51e514bec66=
4a25e
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:45 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

objtool/klp: Add test for alternative replacement code in checksums

checksum_update_insn() walks insn->alts after hashing the instruction
itself: the alternative's type, and where the replacement forms a group,
its feature number and every instruction in it.  A patch which edits only
the replacement -- code that runs on some CPUs and not others -- still has
to move the function's checksum.

When it does not, klp diff calls the function unchanged and leaves it out.
The patch ships the old replacement, and the bug is fixed only on machines
whose CPU takes the other arm.  Which machines those are depends on the
feature bit, so it presents as a machine-specific bug rather than a missing
patch.

insn->alts is built by objtool's check pass, not by the compiler, so the
pair goes through that first.  --mcount is the action used: it is the
cheapest one that does not also need --link.

Two of the three paths are isolated.  Skipping the alts walk and dropping
the feature hash both make this fail, and the second of those only exists
inside the alt_group branch, so reaching it proves the grouped path is
taken.  The alternative's type is hashed but not varied here -- the fixture
emits one kind of alternative -- so that line is covered without being
isolated, as is the in_alt recursion guard, which wants nested
alternatives.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-53-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/x86/fixtures/checksum_alt.c | 66 ++++++++++++++++-
 tools/objtool/tests/x86/test-checksum-alt.sh    | 45 +++++++++++-
 2 files changed, 111 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/checksum_alt.c
 create mode 100755 tools/objtool/tests/x86/test-checksum-alt.sh

diff --git a/tools/objtool/tests/x86/fixtures/checksum_alt.c b/tools/objtool/=
tests/x86/fixtures/checksum_alt.c
new file mode 100644
index 0000000..ed342d9
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/checksum_alt.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * An x86 alternative whose replacement code is part of the patched function=
's
+ * checksum.
+ *
+ * checksum_update_insn() walks insn->alts after hashing the instruction
+ * itself, hashing the alternative's type and, when the replacement forms a
+ * group, its feature number and every instruction in it.  So editing only t=
he
+ * replacement -- code the CPU may or may not ever run -- has to move the
+ * function's checksum.
+ *
+ * It is reached through objtool's own alternative handling, so the object h=
as
+ * to go through the check pass first: insn->alts is built there, not by the
+ * compiler.
+ *
+ * struct alt_instr is written out by hand as in empty_alternative.c: s32
+ * instr_offset, s32 repl_offset, u32 ft_flags, u8 instrlen, u8 replacementl=
en.
+ *
+ * Variants, applied to the patched build only:
+ *
+ *   ALT_REPL     the replacement instruction changes; the original does not
+ *   ALT_FEATURE  the feature number changes; no code changes at all
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+/*
+ * Both spellings are two bytes, because a replacement may not be longer than
+ * the instruction it replaces: "xchg %ax, %ax" is 66 90 and two nops are
+ * 90 90.  The original below is padded to match.
+ */
+#if defined(PATCHED) && defined(ALT_REPL)
+#define REPL_INSN "	nop\n\t	nop\n\t"
+#else
+#define REPL_INSN "	xchg %ax, %ax\n\t"
+#endif
+
+#if defined(PATCHED) && defined(ALT_FEATURE)
+#define FEATURE "7"
+#else
+#define FEATURE "3"
+#endif
+
+int target(int x)
+{
+	asm volatile(
+		"661:	nop\n\t"
+		"	nop\n\t"
+		"662:\n\t"
+		".pushsection .altinstr_replacement, \"ax\"\n\t"
+		".globl target_repl\n\t"
+		"target_repl:\n\t"
+		REPL_INSN
+		"target_repl_end:\n\t"
+		".popsection\n\t"
+		".pushsection .altinstructions, \"aM\", @progbits, 14\n\t"
+		".long 661b - .\n\t"
+		".long target_repl - .\n\t"
+		".long " FEATURE "\n\t"
+		".byte 662b - 661b\n\t"
+		".byte target_repl_end - target_repl\n\t"
+		".popsection\n\t");
+
+	return x + 1;
+}
diff --git a/tools/objtool/tests/x86/test-checksum-alt.sh b/tools/objtool/tes=
ts/x86/test-checksum-alt.sh
new file mode 100755
index 0000000..74ebfca
--- /dev/null
+++ b/tools/objtool/tests/x86/test-checksum-alt.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# An alternative's replacement code counts towards the checksum of the funct=
ion
+# it belongs to.
+#
+# checksum_update_insn() walks insn->alts after hashing the instruction itse=
lf:
+# the alternative's type, and where the replacement forms a group, its featu=
re
+# number and every instruction in it.  So a patch which edits only the
+# replacement -- code that runs on some CPUs and not others -- still has to
+# move the function's checksum.
+#
+# If it does not, klp diff decides the function is unchanged and leaves it o=
ut.
+# The patch then ships the old replacement, and the bug is fixed only on
+# machines whose CPU takes the other arm.  Which machines those are depends =
on
+# the feature bit, so the failure looks like a machine-specific bug rather t=
han
+# a missing patch.
+#
+# insn->alts exists only after objtool's check pass, so the pair goes through
+# that first -- the compiler emits none of this structure itself.
+#
+# Covers the same ground as corpus/x86_64/checksum-alt-group,
+# checksum-alt-no-group and checksum-alt-recursion-guard in Joe Lawrence's
+# klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+check()
+{
+	build_pair checksum_alt.c "-D$1"
+	assert_input_section .altinstructions
+	run_objtool_check --mcount
+	run_checksum
+
+	assert_checksum_differs target
+}
+
+# The replacement instruction itself.
+check ALT_REPL
+# The feature number, with no instruction anywhere changed.
+check ALT_FEATURE
+
+pass "alternative replacement code counts towards the checksum"
