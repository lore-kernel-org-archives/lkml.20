Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF49478E2C;
	Mon, 21 Sep 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982908; cv=none; b=RWV9+3o+37ZpJq2B4eKuAbvEz5YUbhMLgSlBR+Taj5Jij4VXVkjrT9UK+w3/llJL9D+zcX24F8B23Dtfwrbt5+0YNWFvWYoQauQ2jHJcoH8gkXZNFELgi9g1FM8+xW6vH9FWgGl7Uu15CAAquN2jD1NvYgzq7n1oExG+RUFEZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982908; c=relaxed/simple;
	bh=aYIUnfQdObe10rg8peNbgaQwXqCzYH7wakCLyDuRBP0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jLYMsFdktI+eGl8SgKa08b0iamQoYBrL79n5n3NEdbnADe7zrDFBDjJklaMB0SiOTORa5SuqT/sjKtwgmmpbnwsJFnWVQRoraQ5EGYQzs0t+cF2jsDst6va2/WJV3fVgSGYz+FKF+dfQ9CI51RUGjK8f6pJlyXDCWDe23jr1ikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jFMt7glh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pv/jKKiG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jFMt7glh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pv/jKKiG"
Date: Mon, 21 Sep 2026 09:28:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982904;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGVJS5Xba8RuRgY/JwPP/NdkJ3Bj41FVslbhJd7R4eE=;
	b=jFMt7glhf3zUyJAFs+WJin1nHpSHdXEzYlShtB57KRPo9WpkY6ZHrsYiZDilehBojIlZT1
	GmnZ9HkCPyWGF4V8dfSLPecgPaiO5PR5yeki/x5XkfGwC+sDo6iLmkTOuJjCm+Ip9XLvR1
	Yqjo8ySey+yAP6BdhkxOtidMEvZcroQrl+2o+2IK5mAdR/eqlYxdPDkWAGXLQ+QBe+rTV9
	IpKFchUvclKF5encSsJgHxOelZhwZgxm32fshWmnrbEZOHhguxMt5dTHRfGFnR6OhNx9/X
	rmLZgGDMxM6g33MuLVwaIY/GOl6BAAdQoLKNXzdFN1Mb8OHnT13NddLDF2DI5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982904;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGVJS5Xba8RuRgY/JwPP/NdkJ3Bj41FVslbhJd7R4eE=;
	b=Pv/jKKiGXCXgdN+FoKFHG+eRVaBN+0goj30gW23sSTzG1zwE3plvmlpuiAZAcX1GZoUbgV
	lNS3/Z7JSqijH6CA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting module-owned
 static call keys
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-22-song@kernel.org>
References: <20260916184351.2720310-22-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998290274.2819794.1169974420472548116.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     93d298f097a41cf1cd0a167abd664f2e90020a44
Gitweb:        https://git.kernel.org/tip/93d298f097a41cf1cd0a167abd664f2e900=
20a44
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:14 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:04 +02:00

objtool/klp: Add test for rejecting module-owned static call keys

Static calls carry the same constraint as static branches.  Check that a
vmlinux-owned key is accepted and a module-owned one is refused.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-22-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/static_call.c         | 59 +++++++-
 tools/objtool/tests/generic/test-static-call-module-key.sh | 36 ++++-
 2 files changed, 95 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/static_call.c
 create mode 100755 tools/objtool/tests/generic/test-static-call-module-key.sh

diff --git a/tools/objtool/tests/generic/fixtures/static_call.c b/tools/objto=
ol/tests/generic/fixtures/static_call.c
new file mode 100644
index 0000000..4a0c4c2
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/static_call.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Static call site in a patched function, laid out by hand as for
+ * jump_label.c.  MODNAME selects whether the key belongs to vmlinux or a
+ * module.
+ *
+ * objtool's check pass would emit the site, and klp-write-tests.txt says to
+ * let it.  Not here: it does not emit the ANNOTATE_DATA_SPECIAL describing
+ * the entry boundaries -- in the kernel that comes from the static_call
+ * macros -- and NO_ANNOTATE below has to be able to take it away.  A fixture
+ * which varies the annotation has to write the entry that goes with it.
+ *
+ * NO_ANNOTATE drops the ANNOTATE_DATA_SPECIAL block from the patched build,
+ * leaving .static_call_sites with no annotation to describe its entry
+ * boundaries.  The section carries no entsize either, so klp diff has to fa=
ll
+ * back on the annotations it can still see -- and when the patched object is
+ * the only one that lost them, the two sides disagree about how the section=
 is
+ * divided up.
+ *
+ * NEW_CALL puts the call site behind PATCHED, so the patch introduces one
+ * where the original had none.  The .static_call_sites entry is then new, w=
ith
+ * nothing in the original to correlate it against.
+ */
+
+#ifndef MODNAME
+#define MODNAME "vmlinux"
+#endif
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3D" MODN=
AME;
+
+long __SCK__klp_test_call;
+
+int target(int x)
+{
+#if defined(NEW_CALL) && !defined(PATCHED)
+	/* The original has no static call at all. */
+	return x + 1;
+#else
+	__asm__ volatile(
+		"1:	nop\n\t"
+		".pushsection	.static_call_sites, \"aw\"\n\t"
+		".balign	8\n\t"
+		"912:\n\t"
+#if !(defined(PATCHED) && defined(NO_ANNOTATE))
+		".pushsection	.discard.annotate_data, \"M\", @progbits, 8\n\t"
+		".long		912b - ., 1\n\t"
+		".popsection\n\t"
+#endif
+		".long		1b - ., %c0 - .\n\t"
+		".popsection\n\t"
+		:: "i" (&__SCK__klp_test_call));
+#endif
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-static-call-module-key.sh b/too=
ls/objtool/tests/generic/test-static-call-module-key.sh
new file mode 100755
index 0000000..260c4af
--- /dev/null
+++ b/tools/objtool/tests/generic/test-static-call-module-key.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# As for static branches, a static call key owned by a module must be reject=
ed
+# while a vmlinux-owned one is accepted.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_call.c
+
+has_input_section orig.o .static_call_sites ||
+	probe_skip "fixture produced no .static_call_sites on this arch"
+
+run_diff
+assert_patched target
+
+# The accepted half has to show the entry was carried, not just that the
+# function was: dropping the section silently would leave the patched call
+# unregistered, and "target was cloned" cannot tell the two apart.
+assert_section .static_call_sites
+assert_reloc_sym .static_call_sites target
+
+rm -f "$workdir/out.o"
+build_pair static_call.c -DMODNAME=3D'"klp_testmod"'
+run_diff 255
+
+diff_log | grep -q 'unsupported static call key __SCK__klp_test_call' ||
+	fail "expected rejection, got: $(diff_log | tail -1)"
+
+# A rejection has to leave nothing behind.  out.o was removed above, so
+# anything here was written by the run which was supposed to refuse.
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "module-owned static call key rejected, vmlinux-owned accepted"
