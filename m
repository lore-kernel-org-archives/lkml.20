Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A51490BEA;
	Mon, 21 Sep 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982898; cv=none; b=tFz+K4W/JEXq44e0qE8IQf3WLt1anr72zYQi0URz1808dBxtUBr+NM/1HtPdQcUb9sdABZUUQemhsz5WOz7qDHSFgtvF1yw5cIoP5AsY8XctX7+C8mwSWGvo457RwldKsnvZoaChAvl6b55E63B/KB1qCkX13f2TSfRvymg3Ros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982898; c=relaxed/simple;
	bh=U+8msZrF2xt0r7dFpv2sR5geM6Mjl4hFWVEMtxsvG8A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=lDMXgLmIqP4mIyUTISDD8TUdWRBJhqViDGbtImzBtxO8ggZAy0bHHiApvXEmo0MPn7rEY4vXqw8GfULbVuliNVYNI9o2Gk3ac17fpWq/wg7brYWjhppt1ax6AWc9tjqVQUbeECokSaKFG6ZQkk79eg2TBOx2DxwApUs+BOKApCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YKyaTGVw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pYsz3/RL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YKyaTGVw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pYsz3/RL"
Date: Mon, 21 Sep 2026 09:28:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982893;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+9/S8q5K78LSy2OJLbENFdyMu99TZVvc3X1/KhWzt4=;
	b=YKyaTGVw6orPSo/I6/54X7AyWSkt9A7yxiID2XAtc4IP7qW00PLU6LFOTmR1B0y30BtQOC
	XjPZealvoS+ZEDDE8gFIEZNJaA24GKMRy7nO8vZdjdz0imTANykl1IUqJJBnFL+VOySl0o
	haJUxaOwSyVkqkbZQ7xVNBa6D8/sXTXnghVGuDvMMOcXCkokbPpKoPoOy2wWTuB+bpIQyh
	qtnik2Empbmn2JEs2AGadVSKsM+YH6l28LosB01S75K3FLqpJGbiQ6YtrMpwp8/HLE+Tv5
	8hJo9aS18bGA17li6lJacu4gEIkmb5uv40t/L2JUHu2hV8sivKqy6htiYbqgQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982893;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+9/S8q5K78LSy2OJLbENFdyMu99TZVvc3X1/KhWzt4=;
	b=pYsz3/RLO3tg7U3cD+yzbu9t8goynBubBthopYzURzUFS4sCrWNOgMcc1VsDBExf65/m+3
	RR8cBVNacI7GOKBA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for klp reloc section
 naming in module objects
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-29-song@kernel.org>
References: <20260916184351.2720310-29-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289237.2819794.4289918903567595594.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     2d17a35f6c9489884e6a5ff7cb0d6b150d413371
Gitweb:        https://git.kernel.org/tip/2d17a35f6c9489884e6a5ff7cb0d6b150d4=
13371
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:21 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:06:08 +02:00

objtool/klp: Add test for klp reloc section naming in module objects

klp diff names the intermediate __klp_relocs section after the object the
relocation belongs to, and post-link turns that into
.klp.rela.<object>.<sec>. Name it after the wrong object and the kernel
applies the relocation when the wrong module loads, or never.

The fixture is the first here to honour MODNAME: most hardcode
name=3Dvmlinux, so passing -DMODNAME to them silently does nothing and the
test quietly becomes a vmlinux test.

This tests the behavior of commit 07f14d6af9d7 ("objtool/klp: Fix
cross-module klp relocation section naming").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-29-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/cross_module.c | 25 ++++++++++-
 tools/objtool/tests/generic/test-module-object.sh   | 31 ++++++++++++-
 2 files changed, 56 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/cross_module.c
 create mode 100755 tools/objtool/tests/generic/test-module-object.sh

diff --git a/tools/objtool/tests/generic/fixtures/cross_module.c b/tools/objt=
ool/tests/generic/fixtures/cross_module.c
new file mode 100644
index 0000000..c170bde
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/cross_module.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A function which calls out to another object.  MODNAME selects which obje=
ct
+ * this one is, so a test can make the caller a module and the callee's owner
+ * something else.
+ */
+
+#ifndef MODNAME
+#define MODNAME "vmlinux"
+#endif
+
+/* klp diff takes the object's module name from .modinfo */
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3D" MODN=
AME;
+
+extern int other_mod_func(int x);
+
+int target(int x)
+{
+#ifdef PATCHED
+	return other_mod_func(x) + 2;
+#else
+	return other_mod_func(x) + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-module-object.sh b/tools/objtoo=
l/tests/generic/test-module-object.sh
new file mode 100755
index 0000000..95c8402
--- /dev/null
+++ b/tools/objtool/tests/generic/test-module-object.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A klp relocation section is named for the object being patched, not for the
+# object which happens to own the symbol being referenced.  Deriving it from
+# the symbol means a cross-module reference lands in a section for an object
+# the patch may not even touch, so the relocation is never applied and the c=
all
+# goes somewhere arbitrary.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_module_pair cross_module.c klp_testmod
+
+# The fixture has to have built as a module for any of this to mean anything.
+in_sections orig.o | grep -q '\.modinfo' ||
+	fail "fixture has no .modinfo"
+
+# other_mod_func belongs to a different module than the one being patched.
+add_exports other_mod other_mod_func
+run_diff
+
+# Named for the patched object ...
+assert_section __klp_relocs.klp_testmod
+# ... not for the object owning the symbol.
+assert_no_section __klp_relocs.other_mod
+
+run_post_link
+assert_klp_rela klp_testmod .text.target
+
+pass "klp relocation section named for the patched object"
