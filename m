Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82748E0F0;
	Mon, 21 Sep 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982889; cv=none; b=XCHcIaYE/6FnP9amNQK6cPT1sctAHe+4MkoU58xyobQvszEet+o+C7ngS9l2JM+zLGCMG7xrI2S0haKs5IpxkTUphPnI/am6blyoagMoS4iHeRWYPPIjBlF78mXWCgqmSDFfl6zgx2n1rPEVEr6mQq7GlDS3T8zoa43Fm463qjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982889; c=relaxed/simple;
	bh=2lj5gIqrAs6/fVYWkr5FZdPwq98QbTYHJyrZ+f2H8bg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=l3b5ZlqpcX2dVO218xOl9u49PyBO7kp+8njRvKMnvxVyx3DwmrAAW0vaOr+oQsWdKbJ2PxJUxna8AEcwt3HqOmFtgAY+PLLZ4xehu9yYKy8yJidbZHoV/ozzZgEUv2n6285xwo4asPHZccbNX/xGIdOZyX01d3zV56E1Dj5CLL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oOitfSaB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9/vZj2xZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oOitfSaB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9/vZj2xZ"
Date: Mon, 21 Sep 2026 09:28:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982885;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h6vgS/bjO2A2dh38PLOMiQTBvb70tW1h08ehK8zbH8w=;
	b=oOitfSaBYRLNtmNiUD2yzk0smdZvDERkAWUZ0aNGjVZ5fHfgU5TNtRY5WYZzQ4FGZfCg/W
	o8YQmQKK7LCdlLtOA2kwC3OppJgnHW0bHnRB2+j0hKmY1vYk6vSXot6+SXModvaCMsF+kD
	HvIO7pWlJpClrieYx3ZLbU29nkesJ4g5+NcI0Mrb1iHKHLx9ym0MmrVffVwWh/UJYlSd8i
	zM76M6xjOsq3WG3zvVkeXfEPIyvnNXIOUBX62iTycgudCY3QfSOD/9PK8R9EB/JgjlafEP
	WwgedeocdYZNlaJiLHW632EU8nGsC/ycYqwV0DDrDP9/6DN4V1aeCjIITZkehw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982885;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h6vgS/bjO2A2dh38PLOMiQTBvb70tW1h08ehK8zbH8w=;
	b=9/vZj2xZgQMsudW2zfS0eJnsnJJjdlrnRwAMqE+K1S2XPfSmgTW9j+72w6OYGybREXw224
	7VE/BWNpgKEX1HBA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for empty x86 alternative
 replacements
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-35-song@kernel.org>
References: <20260916184351.2720310-35-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998288360.2819794.18155029427842444023.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     dff07c58cae7f60e7ae08e9c005e8ec125391f98
Gitweb:        https://git.kernel.org/tip/dff07c58cae7f60e7ae08e9c005e8ec1253=
91f98
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:27 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

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
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-35-song@kernel.org
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
