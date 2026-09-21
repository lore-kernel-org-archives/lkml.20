Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B1D46D571;
	Mon, 21 Sep 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982870; cv=none; b=TjemHWf1se0EPheqR4+obJuLbGp4NTyWUc4yjDnRONVKmOWQu/xDnl7HZXIhot+UFVOPxRvQgbZvTLm6QLsUAr6FZTtqTis9Dw824ja0c7Wg/fVazwZ3lVWW3B5eHppz+CVkexgegDSsRJ+WDNL/kDWgVbaAHl6IDTr/Pug1Vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982870; c=relaxed/simple;
	bh=x1hR0ul5+5G0TsgEXRzd+z60OfxG2RPrF4fdA3GGuDc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=o3WCquAln2zg8Ry84XWXEc1uscBXm8Rr/ONIa9/ULlS91CCgHC1vU2/hOcx+3GAhb26JQ4Lv2msSvQPggZ4ZYhbaZ3T1LDO+LPwsLNsem8Ok7hLdGtBLhx+A43ednB10L3zJqCoP2rYsrbTSLAU+1ZXL1zy/r6onMfCFSXUPflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AMgrThot; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b7/nbvG1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AMgrThot";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b7/nbvG1"
Date: Mon, 21 Sep 2026 09:27:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982866;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrvLBOSlOs+EtgW75XxHAaxkWwVgF3UDpzizWAXF8XE=;
	b=AMgrThotfesTssnRI4Vx+y4YAHy0hJF/uLOzZLLRn4UFlTtjwyfPdDAFlSnlDa5uouLYid
	bV11G+63eZ9t+QfOzvMspvjZazXGwfn34nv/zWja65CgtDdC9OoZ0OZ6GUDh+oNptQwUbP
	4Kx7O34rYsfPDGXkV9qvq+cPaAFiCxpHFQ9OOYXfj7/IasooOuXwQ0Wc+X0r6++F0rYVY/
	Wf4KDaVqtujkwGjynwb5x8Fy/KjpnG/RjRq1EFuQsBA2yrGdUVT/TO0+SInsMse/wS47AL
	dLVTJPec+/zlzkAoIZed3vyjoTqs4Eei42G6vgxVF0H/CSRkXyhIDqgYcNA30A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982866;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrvLBOSlOs+EtgW75XxHAaxkWwVgF3UDpzizWAXF8XE=;
	b=b7/nbvG1svXABMsM99FdlAnM/R9LtFrvk8LEErnjmxUOqNnhJYlgvG+BZ2yLVKzbpy/j6z
	scA8GX+aXSvCW+DQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for symbols with no
 checksum entry of their own
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-48-song@kernel.org>
References: <20260916184351.2720310-48-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998286428.2819794.13547189485209058647.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     c8304204100b28d274c381cf76b603affe457934
Gitweb:        https://git.kernel.org/tip/c8304204100b28d274c381cf76b603affe4=
57934
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:40 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Add test for symbols with no checksum entry of their own

.discard.sym_checksum is an array of { address, checksum } looked up by the
address a relocation points at, so the invariant is one entry per address.
calculate_checksums() skips zero-length symbols, aliases and cold parts to
keep it, and nothing checked that it does.

A duplicate entry is not a build failure.  It makes the lookup ambiguous,
and whichever checksum loses is never consulted again -- so a function
whose code changed can be read as unchanged and dropped from the patch.

The alias skip is verified the usual way: remove it and the test fails.
The other two are not isolated, and the test says so rather than implying
otherwise.  A zero-length symbol is excluded by several of the guards at
once -- its section has no data either -- so removing any one of them
changes nothing observable; the assertion stands as a check on the
behaviour, not on the line that produces it.  The cold-part skip needs a
compiler that splits functions and is not reached here at all.

Which of an aliased pair keeps the entry falls out of symbol table order,
so the test requires exactly one of the two rather than naming a winner --
as written first it named real_function and failed, because gcc kept the
alias.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-48-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/checksum_skip.c | 47 ++++++-
 tools/objtool/tests/generic/test-checksum-skip.sh    | 81 +++++++++++-
 2 files changed, 128 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_skip.c
 create mode 100755 tools/objtool/tests/generic/test-checksum-skip.sh

diff --git a/tools/objtool/tests/generic/fixtures/checksum_skip.c b/tools/obj=
tool/tests/generic/fixtures/checksum_skip.c
new file mode 100644
index 0000000..973bdc1
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/checksum_skip.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Symbols calculate_checksums() must not give an entry of their own.
+ *
+ * Three kinds are skipped, for two different reasons:
+ *
+ *   zero-length   there is nothing to hash, and an entry keyed on the
+ *                 symbol's address would collide with whatever really lives
+ *                 there.
+ *   alias         a second name for an address already checksummed.
+ *   cold part     hashed as part of its parent, which func_for_each_insn()
+ *                 walks into, so a separate entry would double-count it.
+ *
+ * An entry per address is the invariant: .discard.sym_checksum is looked up=
 by
+ * the address a relocation points at, so two entries for one address make t=
he
+ * lookup ambiguous and one of the two checksums unreachable.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+/* Zero-length: an object symbol of size 0, in a section of its own. */
+extern char empty_marker[];
+__asm__(".pushsection .data.empty_marker,\"aw\",@progbits\n"
+	".globl empty_marker\n"
+	".type empty_marker, @object\n"
+	"empty_marker:\n"
+	".size empty_marker, 0\n"
+	".popsection\n");
+
+int real_function(int x);
+int real_function(int x)
+{
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
+
+/* Alias: a second name for real_function's address. */
+int alias_function(int x) __attribute__((alias("real_function")));
+
+int target(int x)
+{
+	return real_function(x) + alias_function(x) + (int)(long)empty_marker;
+}
diff --git a/tools/objtool/tests/generic/test-checksum-skip.sh b/tools/objtoo=
l/tests/generic/test-checksum-skip.sh
new file mode 100755
index 0000000..f245535
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-skip.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Symbols which must not get a checksum entry of their own.
+#
+# .discard.sym_checksum is an array of { address, checksum } looked up by the
+# address a relocation points at, so the invariant is one entry per address.
+# calculate_checksums() skips three kinds of symbol to keep it:
+#
+#   zero-length   nothing to hash, and its address belongs to whatever really
+#                 lives there
+#   alias         a second name for an address already covered
+#   cold part     hashed into its parent, which func_for_each_insn() walks
+#                 into, so its own entry would double-count
+#
+# A duplicate entry is not a build failure.  It makes the lookup ambiguous, =
and
+# whichever checksum loses is simply never consulted again -- so a function
+# whose code changed can be read as unchanged and dropped from the patch.
+#
+# Of the three, only the alias skip is isolated here: removing it makes this
+# test fail.  A zero-length symbol is excluded by more than one of the guards
+# at once -- its section has no data either -- so no single change makes that
+# assertion fail, and it stands as a check on the behaviour rather than on t=
he
+# line which produces it.  Nothing here reaches the cold-part skip, which
+# wants a compiler that splits functions; test-cold-function covers that
+# symbol surviving into the patch, not its checksum.
+#
+# Covers the same ground as corpus/x86_64/checksum-zero-len-sym,
+# checksum-alias-skip and checksum-cold-skip in Joe Lawrence's klp-build unit
+# test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair checksum_skip.c
+
+assert_input_symbol empty_marker
+assert_input_symbol alias_function
+run_checksum
+
+# entries_for <object> [-t]
+#
+# The symbol names .discard.sym_checksum has an entry for, one per line.  Wi=
th
+# -t, what each entry points at instead: the name and its addend, which is t=
he
+# address the kernel looks the entry up by.  A name alone is not that addres=
s,
+# since a relocation against a section symbol names the section and puts the
+# offset in the addend, and several entries can then share a name honestly.
+entries_for()
+{
+	in_relocs "$1" | awk -v target=3D"${2:-}" '/rela\.discard\.sym_checksum/,/^=
$/ {
+		if ($1 !~ /^[0-9a-f]{8,}/)
+			next
+		if (target =3D=3D "-t")
+			print $5, $6, $7
+		else
+			print $5
+	}'
+}
+
+entries=3D"$(entries_for orig.o)"
+
+# The control: something real did get an entry, so an empty listing cannot
+# make the rest of this pass by default.
+echo "$entries" | grep -qx target ||
+	fail "no checksum entry for target"
+
+echo "$entries" | grep -qx empty_marker &&
+	fail "zero-length symbol got a checksum entry"
+
+# One of the two names for that address is kept and the other skipped; which
+# one falls out of symbol table order and is not the point.  Two would be.
+n=3D"$(echo "$entries" | grep -cxE 'real_function|alias_function')"
+[ "$n" =3D 1 ] ||
+	fail "expected 1 checksum entry across real_function and its alias, found $=
n"
+
+# One entry per address, which is what the skipping is for.
+dupes=3D"$(entries_for orig.o -t | sort | uniq -d)"
+[ -z "$dupes" ] ||
+	fail "two checksum entries for one address: $dupes"
+
+pass "zero-length symbols and aliases get no checksum entry of their own"
