Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534EE48EC66;
	Mon, 21 Sep 2026 09:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982890; cv=none; b=D3NrhBDYLjwb+JJxfWHeCeAwtNLnsJIddu/8mnu+HKPZiDAvZS6eedveGpMsVy80UVZzrh/y4G9UCmK0r96DbN1YlZj1qtqLIgNUhw1CJClRGDSkCkqACGolHPCG1Y2NLtFw3PMugcFQRzHqcKEDJcvl7sn99TrYW+i+Y7MSnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982890; c=relaxed/simple;
	bh=5PwXuCvTxMV7mZHiUsm6chjNyhSTp1E6o88bjDUg9l0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=etgBPgZ8Tc5n5ZH5H0X9kzkhoQdJNBklXhy6SlpzyUmdfP7HV9MUM46P8Aa90rxxE8/sVp959tdEgz4LCJ68SxAFEPj6vmuHv61EOGYE8VQhDfFsfdFazsWSKbzCyA/HRMH8wOsipA0hKx9UK6keF708AjQgsQlGTe7VsABDisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yzQESvgm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6dSA6tc1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yzQESvgm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6dSA6tc1"
Date: Mon, 21 Sep 2026 09:28:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982886;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ce6bUuZqFma54Kb0a5VJSMYGO7eTmHyG2Jlr6PqFGw=;
	b=yzQESvgmONfhi7egpEUR6oXeT6GYmU2lgIbUEU2rbQnPgaTDVI9FW/c3zypHA1Hhz1SmXz
	tqcLmnj4F1rHykn0ngYHw8rjqxfuJC4TlM1//DGOqwep1Yil9va0wOwkrM/0nnWO0SRhci
	8xp+V4LIMXuuvjPS0gZuPzPvXYJIruo2xmespu3bxi7/4Ojv4ybpzSY8ovdbFQ6SSymJ1a
	Cww5SnE6fS3kqHK4aTsCuEQ37XUQCOvaFVhfveVEzfpl7QA6JhD/sDPS2gxkO/UQcfaLGd
	DGpzrskQ9gdDOWlPromeig7O1NnE/lsowqQH/8aGtmTd+XT14wqQiyy+kgGzvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982886;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ce6bUuZqFma54Kb0a5VJSMYGO7eTmHyG2Jlr6PqFGw=;
	b=6dSA6tc1GvuMXQC8JsulEv1tEPiJPrtlTVPXVT9PoeXt2CjRzNt/agPoRifbuhtqI/BBag
	VF/xnFwVMgASHlBQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for new references to
 exported symbols
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-34-song@kernel.org>
References: <20260916184351.2720310-34-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998288507.2819794.304715400168520819.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     6549ce0dd1be2400ecdd8693e47c189c54562a4e
Gitweb:        https://git.kernel.org/tip/6549ce0dd1be2400ecdd8693e47c189c545=
62a4e
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:26 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for new references to exported symbols

A patch may introduce a reference the original object did not have.  That
is fine when the export belongs to vmlinux, and not fine when it belongs to
a module: the livepatch would gain a module dependency nobody declared, and
late module patching lets the patch load first.

This tests the behavior of commit 72d76d0c18eb ("objtool/klp: Allow new
references to module exports").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-34-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/new_export_ref.c | 35 ++++++++-
 tools/objtool/tests/generic/test-new-export-ref.sh    | 46 ++++++++++-
 2 files changed, 81 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/new_export_ref.c
 create mode 100755 tools/objtool/tests/generic/test-new-export-ref.sh

diff --git a/tools/objtool/tests/generic/fixtures/new_export_ref.c b/tools/ob=
jtool/tests/generic/fixtures/new_export_ref.c
new file mode 100644
index 0000000..73210aa
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/new_export_ref.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A reference which only exists in the patched build.  The symbol has no tw=
in
+ * in the original object, so what klp diff may do with it depends entirely =
on
+ * whether Module.symvers says it is exported, and by what.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+extern int newly_referenced(int x);
+
+/*
+ * A reference both builds have.  When Module.symvers says a module exports
+ * this one, the original already depends on that module, which is what makes
+ * a new reference to it safe -- the loader will not let the patched module
+ * load without it.  EXISTING_DEP leaves it out, for the case where there is
+ * no such dependency to inherit.
+ */
+extern int existing_dep(int x);
+
+int target(int x)
+{
+#ifdef EXISTING_DEP
+	int base =3D existing_dep(x);
+#else
+	int base =3D x;
+#endif
+
+#ifdef PATCHED
+	return newly_referenced(base);
+#else
+	return base + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-new-export-ref.sh b/tools/objto=
ol/tests/generic/test-new-export-ref.sh
new file mode 100755
index 0000000..f0be2cf
--- /dev/null
+++ b/tools/objtool/tests/generic/test-new-export-ref.sh
@@ -0,0 +1,46 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A reference the patch adds has no counterpart in the original object.  klp
+# diff used to reject any such reference needing a klp relocation, which rul=
ed
+# out patches that call something they did not call before -- a common enough
+# thing for a fix to do.
+#
+# Module.symvers is what makes it safe: it says the symbol exists and who ow=
ns
+# it.  But that is only sufficient for a vmlinux export.  A new reference to=
 a
+# module's export is a dependency the patch module does not declare, and the
+# relocation would resolve only if that module happened to be loaded, so it
+# stays an error.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair new_export_ref.c
+
+# Exported by vmlinux, in a module: namespace so it needs a klp relocation
+# rather than an ordinary one.  Allowed.
+export_syms
+add_exports_ns vmlinux module:kvm newly_referenced
+run_diff
+assert_klp_sym newly_referenced vmlinux
+
+# Exported by a module the patched object does not depend on.  Rejected, and
+# for that reason rather than some other.
+export_syms
+add_exports other_mod newly_referenced
+run_diff 255
+assert_diff_log 'undeclared module dependency'
+
+# ... unless the original already referenced something that module exports.
+# The loader will not let the patched object load without other_mod, so the
+# klp relocation has something to resolve against, and klp diff allows it.
+# This is the other half of the rule, and it fails in the opposite direction:
+# refusing here would reject a patch which is safe to apply.
+rm -f "$workdir/out.o"
+build_pair new_export_ref.c -DEXISTING_DEP
+export_syms
+add_exports other_mod newly_referenced existing_dep
+run_diff
+assert_klp_sym newly_referenced other_mod
+
+pass "new reference allowed for vmlinux and for a module already depended on"
