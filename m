Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BE4BA9EE;
	Fri, 18 Sep 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726544; cv=none; b=YTt1qIJy1khmXFvhimKwqXks41kstYh3SFxQGLjPtd/kR8Ix1UKKal4WQUEzIf41IaJ1gba5Jx5xy102wCJ4j/9xRyGTMZLbdJyqNd9pNmz7ywt6DrnstXiHUQWg1MLJlz9R8wpkvez42rfZTozLTeFqzsuo8aLcigD/h5ZOuS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726544; c=relaxed/simple;
	bh=6VCP/K6Kg6BIBgXqhnFdbdE0S0fTMkQYR67R5Scn0Lg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Yh2oGcxGrMQ2Eau11wxBlL6rzHk4RIUl8RSVV2osnYtifKhuN72sgi+r4501ngAYaPiQUjHGJTB3r83ncd9c9pAiD5EZmvUp4PL9kKb8BbVrC8xSKPf63M8Oa9r6lmYRJJHNfHb9y5Tg0qdbfX5Yj8d7HfK0YozlhUYipgP4SaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GaKEEaIH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=To48+DFt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GaKEEaIH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="To48+DFt"
Date: Fri, 18 Sep 2026 10:15:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726539;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNED9tDL1NS+qShkQGRtOhHl77V12SSp9eBKTseGEds=;
	b=GaKEEaIH7eQIA79YeQtCtY1yq7MzthzEWLA92zYGKaD36lX4czbp8kncoSz1zJLuga1NFf
	Gui79j01T/nXArupNkMNa3SeDnqLsVAODrajtXXOUGIw+xv/Me8azIMCBFzPAwyiRLKnR2
	whjbdRS/cgpeePJ6Z110EeSAlQ565zd6Un6UVJM+Vwfv6ixZzs0dABD6Wn0ylqvW7DhGr/
	C4ggeNfJZ6bRgdQOMpcCrtcq2Qlq9nifFiVeamBB0OrOVoScsdHKLRfgifwuffZpmJSV2z
	/dl6gFhJ4YGWXs8ARH84V8uEvgbqkvtIV9bMju4p6j0EQ+yPVVg398jUZ+n87w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726539;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNED9tDL1NS+qShkQGRtOhHl77V12SSp9eBKTseGEds=;
	b=To48+DFtFWwDMauUAmnJ8KH09RR3IFQy98M2UxJqbXmg6HztRldYaYCg+HnVgtH3LN8QSx
	JiB/suc4CtUbYqDw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for klp reloc section
 naming in module objects
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-29-song@kernel.org>
References: <20260916184351.2720310-29-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972653808.1720534.14296702776720255387.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     d109afac88e4bdde300a3851ec80b3af52a72665
Gitweb:        https://git.kernel.org/tip/d109afac88e4bdde300a3851ec80b3af52a=
72665
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:21 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

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
Link: https://patch.msgid.link/20260916184351.2720310-29-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
