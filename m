Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8106463B8C;
	Mon, 21 Sep 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982853; cv=none; b=Q0I5zIPILpAJ5g0LYNXRxskChAH+TgeI26drzGqzR3JBMON46P+E1WQomoQC7fIOsDMQqFNBlsCiMeslkebOdqnWk7VZtnAaGJ9PN/C9OdSMhjbiWH3n1laOs3rTYjM6OXlhnnc/ODHbU+RzJ8aFEa1m58OxM/uqcACRWnerwGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982853; c=relaxed/simple;
	bh=ip+wWogsOVJ4nOWV8plS85Z0zv2KX++KlQSigDQQQ90=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=fPssHdY2yjTT2jnPO1o0v/ImwUxpuQ/F0Mz152qp/Oigpuy/zbUJWL1DZKuio/JPqJln/W33OlTmcK49p+SoQu3YlkYyHf/QG0rzWarO+k5Ly0wkQfA0hn+lsnGkncGolnkkqN5inPiEqzMAt/SLUqLnt8Ybq6bkSDNCGsNraIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0QvyXSvW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kXU/ZKKb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0QvyXSvW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kXU/ZKKb"
Date: Mon, 21 Sep 2026 09:27:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982850;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzWeWDGId5TYZldwNxoCNcakWC0gsf3JwdNOjsmwXMg=;
	b=0QvyXSvWKk4cQnMQEHAWwXobXaVtBFCWLQfPNmHAZtJ542+/YsdKObHbxe/MVrRJ/cDHbw
	Rg7WKkoYh20nvSeSE23eyCnQHXWKLuRzm1dKbl+wR0IAVQv2fTAzDmGKC4AKQoWCIJWdZN
	en/SsZrbPCRbSA/t38tx8mp0vhKksE0jKWGj70mYL1PH/sqlEnMOuFZPXxFXgfK0mTeySK
	bPmd45rWc+vp/loVf5rcoPdEdllgVxOutIRd5LgNWDZmxM8RbZHPJowVHcEZwmFMeIa5Es
	MKDp53VPMJQOLBOdg8W24fUmHRXkHfxXhMCGdkfSov8+bSgG0o3aSyKK9lc+GQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982850;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzWeWDGId5TYZldwNxoCNcakWC0gsf3JwdNOjsmwXMg=;
	b=kXU/ZKKbo5pId7cv2MyqdW6i2emzbuRPtg1leKUSH+JjXxeqKwPrVXllugwokH5IFak/ZF
	W7jkLu6Crg/CI9AQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for Clang switch jump tables
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-58-song@kernel.org>
References: <20260916184351.2720310-58-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998284853.2819794.1652038306061377368.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     317cf7bbfa3de0fb61451e9b0b11d20831fb9f9a
Gitweb:        https://git.kernel.org/tip/317cf7bbfa3de0fb61451e9b0b11d20831f=
b9f9a
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:50 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:08 +02:00

objtool/klp: Add test for Clang switch jump tables

For a dense enough switch Clang emits the targets as a table in
.rodata..Lswitch.table.<function> -- named after the function but not part
of it.  The patched function indexes into that table, so a clone which does
not bring it along jumps through whatever the kernel's copy holds, which
after a patch that changed the switch is the wrong set of targets.  An
indirect jump to a stale address reports nothing at build or load time.

The fixture asserts its own premise twice over, since both halves depend on
what this Clang chose to do: that a table was built rather than a chain of
comparisons, and that the added case actually changed it.

objtool has no switch-specific code -- the table is carried by the general
mechanism for data a cloned function references -- so this guards that
mechanism reaching an easily-mishandled shape rather than a particular
line, and the test says so.  Making the table uncorrelated, the nearest
available sabotage, does not change the outcome.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-58-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/switch_rodata.c | 31 ++++++-
 tools/objtool/tests/generic/test-switch-rodata.sh    | 53 +++++++++++-
 2 files changed, 84 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/switch_rodata.c
 create mode 100755 tools/objtool/tests/generic/test-switch-rodata.sh

diff --git a/tools/objtool/tests/generic/fixtures/switch_rodata.c b/tools/obj=
tool/tests/generic/fixtures/switch_rodata.c
new file mode 100644
index 0000000..817ddac
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/switch_rodata.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A switch dense enough that Clang builds a jump table for it, in a section=
 of
+ * its own: .rodata..Lswitch.table.<function>.
+ *
+ * The table belongs to the function and has to travel with it.  It is named
+ * after the function but is not part of it, so klp diff has to associate the
+ * two rather than treating the table as unrelated data.
+ *
+ * The patch adds a case, which changes the table's contents and length.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+const char *status_to_string(unsigned int c)
+{
+	switch (c) {
+	case 0: return "idle";
+	case 1: return "running";
+	case 2: return "stopped";
+	case 3: return "error";
+	case 4: return "paused";
+	case 5: return "waiting";
+	case 6: return "starting";
+	case 7: return "stopping";
+#ifdef PATCHED
+	case 8: return "completed";
+#endif
+	}
+	return "unknown";
+}
diff --git a/tools/objtool/tests/generic/test-switch-rodata.sh b/tools/objtoo=
l/tests/generic/test-switch-rodata.sh
new file mode 100755
index 0000000..fb27e96
--- /dev/null
+++ b/tools/objtool/tests/generic/test-switch-rodata.sh
@@ -0,0 +1,53 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A Clang switch jump table travels with the function it belongs to.
+#
+# For a dense enough switch Clang emits the targets as a table in
+# .rodata..Lswitch.table.<function>, named after the function but not part of
+# it.  klp diff has to associate the two: the patched function indexes into
+# that table, so a clone which does not bring it along jumps through whatever
+# the kernel's copy holds -- which, when the patch changed the switch, is the
+# wrong set of targets.
+#
+# That is an indirect jump to a stale address, not a missing symbol, so noth=
ing
+# reports it at build or load time.
+#
+# objtool has no switch-specific code: the table is carried by the general
+# mechanism for data a cloned function references.  So this is a regression
+# test on that mechanism reaching a shape it is easy to get wrong, not a gua=
rd
+# on a particular line -- making the table uncorrelated, the nearest sabotag=
e,
+# does not change the outcome.
+#
+# Covers the same ground as corpus/x86_64-llvm-switch-rodata/
+# clang-switch-rodata-assoc in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+clang_only "only Clang emits switch jump tables in their own section"
+
+setup
+build_pair switch_rodata.c
+
+# The premise: this Clang really did build a table rather than a chain of
+# comparisons, and the added case really did change it.
+tbl=3D.rodata..Lswitch.table.status_to_string
+has_input_section orig.o "$tbl" ||
+	probe_skip "this clang built no jump table for the switch"
+# readelf prefixes each line with "[nn]", which splits into one or two fields
+# depending on the index, so strip it before counting columns.
+tbl_size()
+{
+	in_sections "$1" | sed 's/^ *\[[ 0-9]*\] *//' |
+		awk -v s=3D"$tbl" '$1 =3D=3D s { print $5 }'
+}
+[ "$(tbl_size orig.o)" !=3D "$(tbl_size patched.o)" ] ||
+	fail "fixture's added case did not change the jump table"
+
+run_diff
+
+assert_patched status_to_string
+assert_section "$tbl"
+assert_reloc_sym .text.status_to_string "$tbl"
+
+pass "Clang switch jump table carried with the function it belongs to"
