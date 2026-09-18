Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408E4D0A07;
	Fri, 18 Sep 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726506; cv=none; b=jjNi4TrcqRkoXxiHA7aIYMc2xeAWch1aS6effZiMYzEZ6jeRpRaNV9ssrvTuq3nES5uqS9l88Cp14rlTR58IbzWpR2GCVKVFobYO9cZ2tuAUWIsplnIMH0JSGA9yIkNknSNsQRw+edLehaBLFWTKv5Mz7mnICwBaWnXoieKC7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726506; c=relaxed/simple;
	bh=LlIPKowCIQoVbWg0guj8pgqL7/hYLESlQijFSO1l4Z0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=R98amH06xd8Jzjpglw/hLAFZyblq930wM3WxUkpFzba0W0LXwjJVRB0Bjh/LR4jcZO1P0LML8hOkDLm/bDO+HzMJq8L4FmBGn0qyCu9Vkh13xP5JlbDrv7sgLExmA0NLI2aYinbVAESQeYdWe2ncb8+UmYEaTRxm4gHBbhCnibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JZ6d+C5H; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OQ+KE5RZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JZ6d+C5H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OQ+KE5RZ"
Date: Fri, 18 Sep 2026 10:14:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726501;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmHVp74/jBY8InDtXDLzuI1Xi+JLOIgMsP3Ec45ZkyM=;
	b=JZ6d+C5HHf1TYJj6ccuWpPt5vIACGi9YR0QvjBQQZx+TfMT9xwannWZwJSJgy05xvIFh+Y
	QEoVrxUyiu07v0GAeFI9wNvykVDK4rzeUnyRytRvB+SQyxBWjEggebE7DFKi+9oJObX+Z7
	Gq7wjZnXmXi9UvqUIZcxrintlwGUrIiddZIEWBRJqVkvKEDpMpsQCjwrLLy68bW+MG2AP9
	70Vxytxd+EiQvDL+sOcMa5Ggz1prJxHMsmojW4leQ2tR3lOvm8+Jq9NNB/93OAXGQDyrGk
	YqlwgcoxtALG0cvEVEiIxzCfTOq5/Q+ZzY6I6Kq7ZIu7FXTv9/IGJQwQ9YeOeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726501;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmHVp74/jBY8InDtXDLzuI1Xi+JLOIgMsP3Ec45ZkyM=;
	b=OQ+KE5RZxYLbpVUpolbQyapkFXubEO7JKk42ETGgzB0nWL2Ak9XqPsfZFieCrC1gpU4WD+
	2T0iy2/Bps8KQ8Bw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for instruction operand checksums
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-52-song@kernel.org>
References: <20260916184351.2720310-52-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972649948.1720534.6713696078488946294.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     b27d3fa2a5247474c7fded48349faddb1a665531
Gitweb:        https://git.kernel.org/tip/b27d3fa2a5247474c7fded48349faddb1a6=
65531
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:44 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

objtool/klp: Add test for instruction operand checksums

checksum_update_insn() hashes an instruction's bytes and then what any
relocation on it refers to: a string section contributes the string's
contents, anything else the target symbol's name and adjusted addend, with
a reference to a static resolved through its section symbol first.

None of that shows up in the bytes.  A rel32 operand is zero in the object
and supplied by the relocation, so calling a different function, editing a
literal the code passes, or reading a different index of an array all leave
the encoded instruction byte-identical.  A checksum stopping at the bytes
reports the function unchanged and the patch silently does not contain the
fix.

test-checksum-position is the other half: what must *not* change the
checksum when a function merely moves.

Each of the four is verified by sabotaging the line it covers.  The static
case needed a writer the compiler cannot see through -- without one it
proves the array is never written, folds every read to zero, and emits no
relocation at all, so the reference under test does not exist and the
variant passes having compared two identical objects.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-52-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/checksum_insn.c | 78 +++++++++++-
 tools/objtool/tests/generic/test-checksum-insn.sh    | 49 +++++++-
 2 files changed, 127 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_insn.c
 create mode 100755 tools/objtool/tests/generic/test-checksum-insn.sh

diff --git a/tools/objtool/tests/generic/fixtures/checksum_insn.c b/tools/obj=
tool/tests/generic/fixtures/checksum_insn.c
new file mode 100644
index 0000000..10f70a7
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/checksum_insn.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Instruction operands whose change must move a function's checksum even
+ * though the instruction bytes themselves do not.
+ *
+ * checksum_update_insn() hashes the raw bytes and then, when the instruction
+ * carries a relocation, what that relocation refers to: a string section
+ * contributes the string's contents, anything else the target symbol's name
+ * and the adjusted addend.  A reference to a static arrives as a section
+ * symbol and has to be resolved back to the object first.
+ *
+ * The bytes are identical in every case below -- a rel32 operand is zero in
+ * the object and supplied by the relocation -- so a checksum that stopped at
+ * the bytes would call all of these unchanged.
+ *
+ * Each variant applies to the patched build only:
+ *
+ *   WHICH_CALL    calls a different function
+ *   STR_CONTENT   passes a literal whose text was edited
+ *   WHICH_SLOT    reads a different index of a global array: addend only
+ *   WHICH_PRIV    the same, for a static, reached through its section symbol
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int callee_a(int x);
+int callee_b(int x);
+int sink(const char *s);
+
+int slots[4];
+
+/*
+ * A file-local array, plus a writer the compiler cannot see through.  Witho=
ut
+ * one it can prove the array is never written, folds every read to zero, and
+ * emits no relocation at all -- so the reference this is here to exercise d=
oes
+ * not exist.
+ */
+static int priv_slots[4];
+
+void set_priv(int i, int v);
+void set_priv(int i, int v)
+{
+	priv_slots[i] =3D v;
+}
+
+#if defined(PATCHED) && defined(STR_CONTENT)
+#define MESSAGE "edited"
+#else
+#define MESSAGE "original"
+#endif
+
+int target(int x)
+{
+	int r;
+
+#if defined(PATCHED) && defined(WHICH_CALL)
+	r =3D callee_b(x);
+#else
+	r =3D callee_a(x);
+#endif
+
+	r +=3D sink(MESSAGE);
+
+#if defined(PATCHED) && defined(WHICH_SLOT)
+	r +=3D slots[2];
+#else
+	r +=3D slots[1];
+#endif
+
+#if defined(PATCHED) && defined(WHICH_PRIV)
+	r +=3D priv_slots[3];
+#else
+	r +=3D priv_slots[1];
+#endif
+
+	return r;
+}
diff --git a/tools/objtool/tests/generic/test-checksum-insn.sh b/tools/objtoo=
l/tests/generic/test-checksum-insn.sh
new file mode 100755
index 0000000..e1c04a1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-insn.sh
@@ -0,0 +1,49 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# What a function's checksum has to cover beyond its instruction bytes.
+#
+# checksum_update_insn() hashes the raw bytes, and then what any relocation =
on
+# the instruction refers to: a string section contributes the string's
+# contents, anything else the target symbol's name and the adjusted addend,
+# with a reference to a static resolved back through its section symbol firs=
t.
+#
+# None of these show up in the bytes.  A rel32 operand is zero in the object
+# and supplied by the relocation, so every change below leaves the encoded
+# instruction byte-identical.  A checksum stopping at the bytes reports the
+# function unchanged, klp diff omits it, and the patch silently does not
+# contain the fix.
+#
+# test-checksum-position is the other half of this: it covers what must *not*
+# change the checksum when a function merely moves.
+#
+# Covers the same ground as corpus/x86_64/checksum-reloc-sym,
+# checksum-pc-relative-addend, checksum-string-reloc and
+# checksum-sec-sym-resolve in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# check <flag> <what it changes>
+check()
+{
+	build_pair checksum_insn.c "-D$1"
+	run_checksum
+
+	# The premise for all of them: the operand is a relocation, not bytes.
+	assert_checksum_differs target
+}
+
+check WHICH_CALL    # relocation target name
+check STR_CONTENT   # contents of a string the code passes
+check WHICH_SLOT    # addend, same target symbol
+check WHICH_PRIV    # addend via a static's section symbol
+
+# The converse: rebuilding identical source leaves it alone, so the above is
+# not just "any rebuild moves the checksum".
+build_pair checksum_insn.c
+run_checksum
+assert_checksum_matches target
+
+pass "instruction checksums cover reloc targets, addends and string contents"
