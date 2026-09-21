Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FC247A870;
	Mon, 21 Sep 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982871; cv=none; b=H/DPi+BHWZUyoG4kJcL7iAldJdf8ImzzAUqsj+1ApujTP7irzGx/4jb30RWzjUqzk37Y26Rc4d+sCuURNTWfcUEzd0O7o8JXZoM2jg8hGLcLD1AVoHPjfON/bgGja2DFZRZC4QJHhC2wBggHdfU/fsFZL7AzXzAMQR3hx798k6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982871; c=relaxed/simple;
	bh=JSLS/ppo1QI89d6sc92J09Ve8688jwZGyKPNSdmXC8A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=KRfZt5DYkuomR8OzOFGuuVtNfIXYbl5HzUhKzf/orDRQ8LUZyTEJJORacCltyzllmlwSBN4kDc9REJoJSh9+SUiOyUDQZlXEeM5z7CjJ2xnlH/poDjKgqmXtAMbIJthcNoqaqgIF3PAOeACAduR54Sn/gG4vr5WXmxhCwCezDfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C7Y+h/Ng; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8b6y2PIb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C7Y+h/Ng";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8b6y2PIb"
Date: Mon, 21 Sep 2026 09:27:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982867;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxsHpn718dEyS1hAoMYeJq4uqM44AqdDCE27lgAzMQA=;
	b=C7Y+h/NgMmpvQ1xOHBh1mouvQUGUkaVpTriGZ4M/HYCyoOMgUcgzVrIBT4lTTV/S4yJ98i
	GDOO2U9l+fOpj0BKzLXaEDDh9jZQ1c3S4/Upw8KEnNO8pFOQKca9/3KImyhpe3dTO07n6e
	Pak9Bu0+wZntM02wvONFihuPqqWisAE1Oy1PTLEN8lIyc4p2DAeiJIWTe3QVAY0qOejLoV
	Pa3a0pcyzrz1NFQil3jIIK0zoclXiGJewXjwGfVKK9VMb7ZbSMEfrPYs/AJz6FR46akkJj
	xrjdSpN+sIWf70h41fSqe9XSDyGn2SwsJezTpeaCtJ551ruI2aRlYHDmOoFD0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982867;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxsHpn718dEyS1hAoMYeJq4uqM44AqdDCE27lgAzMQA=;
	b=8b6y2PIbtv6qfah9vOBis625a6r56fB8Bs1x8BMgONeJIhqRqYz4n1iACgqhJsoaaBGYkz
	c4klMpoCPIhHZZDQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for data object checksums
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-47-song@kernel.org>
References: <20260916184351.2720310-47-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998286582.2819794.9176718259285531615.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     ac324798c6897a11b89667ba58a4757a57aa1505
Gitweb:        https://git.kernel.org/tip/ac324798c6897a11b89667ba58a4757a57a=
a1505
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:39 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Add test for data object checksums

klp checksum hashes a data symbol's length, its bytes, and every relocation
it carries -- as the target's name and adjusted addend, except a reference
into a string section, which contributes the string's contents instead.
Nothing covered any of it.

Each is load-bearing, and the failure is always the same shape: a checksum
which ignores one calls a changed object unchanged, klp diff leaves it out
of the patch, and the patched code goes on reading the kernel's old copy.
The string case cannot be caught by hashing bytes: the pointer is
identical, same section and same offset, and only the text it refers to
moved.

One fixture, six variants applied to the patched build alone.  Each was
verified by sabotaging the line it covers and watching the test fail:

  raw bytes            initialiser change
  length               a .bss object grows; its bytes are never hashed
  string contents      literal edited in place, pointer untouched
  reloc target name    pointer moved to another function
  reloc addend         same array, different index
  section-symbol path  the same, via a static's section symbol

Two of those needed the fixture rebuilding.  An initialised array does not
isolate the length, because growing one changes the hashed bytes too --
hence .bss, where there are none.  And a named char[] does not reach the
contents-hashing path at all: that keys on SHF_STRINGS, which the compiler
sets on the mergeable section a literal lands in and not on an array given
a section of its own.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-47-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/checksum_data.c | 116 ++++++++++-
 tools/objtool/tests/generic/test-checksum-data.sh    |  61 +++++-
 2 files changed, 177 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_data.c
 create mode 100755 tools/objtool/tests/generic/test-checksum-data.sh

diff --git a/tools/objtool/tests/generic/fixtures/checksum_data.c b/tools/obj=
tool/tests/generic/fixtures/checksum_data.c
new file mode 100644
index 0000000..6310af5
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/checksum_data.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Data objects whose checksums must move for reasons the raw bytes do not
+ * show.
+ *
+ * checksum_update_object() hashes a data symbol's length and its bytes, and
+ * then walks its relocations: a reference into a string section contributes
+ * the string's *contents*, and any other reference contributes the target
+ * symbol's name and the adjusted addend.  So three changes that leave the
+ * object's own bytes identical still have to change its checksum:
+ *
+ * Each variant is selected by a -D on the patched build only, so the origin=
al
+ * is always the baseline:
+ *
+ *   WHICH_FUNC   the function pointer points somewhere else
+ *   WHICH_STR    the string pointer points at a different literal
+ *   STR_CONTENT  the string it points at is edited in place
+ *   WHICH_SLOT   the same array, at a different index: addend only
+ *   WHICH_PRIV   likewise, but a static, reached through its section symbol
+ *
+ * The last is the interesting one.  Nothing in the pointer changes -- same
+ * section, same offset -- so a checksum that hashed only the relocation and
+ * not what it referred to would call the object unchanged, and the patched
+ * kernel would keep the old string.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int callee_a(int x);
+int callee_b(int x);
+int callee_a(int x) { return x + 1; }
+int callee_b(int x) { return x + 2; }
+
+/*
+ * String *literals*, not named arrays.  The contents-hashing path keys on
+ * SHF_STRINGS, which the compiler sets on the mergeable .rodata.str1.1 a
+ * literal lands in and not on a named char[] given a section of its own.  A
+ * fixture using the latter exercises the ordinary name-and-addend path and
+ * reports nothing when the text changes.
+ */
+#if defined(PATCHED) && defined(STR_CONTENT)
+#define MESSAGE "edited"
+#else
+#define MESSAGE "original"
+#endif
+
+/* A plain data object: only its own bytes decide the checksum. */
+#if defined(PATCHED) && defined(PLAIN_VALUE)
+int plain =3D 43;
+#else
+int plain =3D 42;
+#endif
+
+/*
+ * A .bss object, where length is the only thing there is to hash: the secti=
on
+ * has no data, so the bytes are skipped and only sym->len distinguishes this
+ * from an object of another size.  An initialised array would not isolate it
+ * -- growing one changes the hashed bytes as well.
+ */
+#if defined(PATCHED) && defined(LONGER)
+char sized[4];
+#else
+char sized[2];
+#endif
+
+/*
+ * A reference into the middle of an array: same target symbol, different
+ * addend.  Nothing else in the object changes, so this is the only way to s=
ee
+ * whether the addend is hashed at all.
+ */
+int slots[4];
+
+/*
+ * A file-local array.  A reference to a static lands on its section symbol
+ * plus an offset, so the hash has to resolve that back to the underlying
+ * object before it has a name to hash at all -- a different code path from =
the
+ * global above, and one that silently contributes nothing when it fails.
+ */
+static int priv_slots[4];
+
+struct desc {
+	int (*fn)(int arg);
+	const char *str;
+	int *slot;
+	int *priv;
+};
+
+const struct desc descriptor =3D {
+#if defined(PATCHED) && defined(WHICH_FUNC)
+	.fn =3D callee_b,
+#else
+	.fn =3D callee_a,
+#endif
+#if defined(PATCHED) && defined(WHICH_STR)
+	.str =3D "a different literal",
+#else
+	.str =3D MESSAGE,
+#endif
+#if defined(PATCHED) && defined(WHICH_SLOT)
+	.slot =3D &slots[2],
+#else
+	.slot =3D &slots[1],
+#endif
+#if defined(PATCHED) && defined(WHICH_PRIV)
+	.priv =3D &priv_slots[3],
+#else
+	.priv =3D &priv_slots[1],
+#endif
+};
+
+int target(int x)
+{
+	return descriptor.fn(x) + plain + sized[0] + (int)descriptor.str[0] +
+	       *descriptor.slot + *descriptor.priv;
+}
diff --git a/tools/objtool/tests/generic/test-checksum-data.sh b/tools/objtoo=
l/tests/generic/test-checksum-data.sh
new file mode 100755
index 0000000..e915026
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-data.sh
@@ -0,0 +1,61 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# What a data object's checksum has to cover.
+#
+# checksum_update_object() hashes the symbol's length, its bytes (when the
+# section has any -- .bss does not), and then
+# every relocation it carries -- as the target's name plus the adjusted adde=
nd,
+# except for a reference into a string section, which contributes the string=
's
+# contents instead.
+#
+# Each of those is load-bearing, and the failure is always the same shape: a
+# checksum that ignores one of them calls a changed object unchanged, klp di=
ff
+# leaves it out of the patch, and the patched code goes on reading the
+# kernel's old copy.  Nothing says so at build time.
+#
+# The string case is the one that cannot be caught by hashing bytes alone.  =
The
+# pointer is identical -- same section, same offset -- and only the text it
+# refers to moved.
+#
+# Covers the same ground as corpus/x86_64/checksum-data-basic,
+# checksum-data-func-ptr, checksum-data-string-ptr and checksum-string-reloc=
 in
+# Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# check <flag> <symbol> <what changed>
+#
+# Build the pair with one difference and require that symbol's checksum to m=
ove.
+check()
+{
+	build_pair checksum_data.c "-D$1"
+	run_checksum
+
+	assert_checksum_differs "$2"
+}
+
+# The object's own bytes.
+check PLAIN_VALUE plain
+# Its length, for a .bss object whose bytes are not hashed at all.
+check LONGER sized
+# A relocation's target: same bytes in the object, different symbol named.
+check WHICH_FUNC descriptor
+check WHICH_STR descriptor
+# The contents of a string the object points at, with the pointer untouched.
+check STR_CONTENT descriptor
+# A relocation's addend: same target symbol, different offset into it.
+check WHICH_SLOT descriptor
+# The same, for a static reached through its section symbol: the reference h=
as
+# to be resolved back to the object before there is a name or offset to hash.
+check WHICH_PRIV descriptor
+
+# Having shown five things that must change it, show one that must not: an
+# unrelated edit elsewhere in the file leaves this object alone.
+build_pair checksum_data.c -DPLAIN_VALUE
+run_checksum
+assert_checksum_matches descriptor
+
+pass "data checksums cover length, bytes, reloc targets and string contents"
