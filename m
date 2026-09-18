Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A54EB851;
	Fri, 18 Sep 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726555; cv=none; b=mUe6WhnggU4wufYjr+0kCK3edBnMz2U8Uijs/utk9CcyncPq9nLi54hSlfWEetyBbSfZcN7S+gdq2STdH2aw6bczD7Wcgq4wyuZu0egTZukmA4+klYFHs3+bu4PDhwD7y1Cdth+shP8NzfiqstWEkqaAEY9Nbna/u+3HpLdFzis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726555; c=relaxed/simple;
	bh=fbESsx/v/ILZJOg8Gq8/HuTwzkSWhp5414r3US84NBY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=srbr0kSUPVVEKhOTFngcrpRL1/fqfGsKG6CvonX9O2n6mwYnfDnnAjriSYvjHWc0BqYN6f3RG0xAm1r7uFFFEeGjhU0Vham7PG+XNZkhCv0EHPQoBbeoerrVFLPamDC/r2nK66WHr98bRjVMzP6O8BG13J++Pv6tODLKLwgrfsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cu+oCgDt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cmQ9+ad9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cu+oCgDt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cmQ9+ad9"
Date: Fri, 18 Sep 2026 10:15:48 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726550;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyrfL3C/OLraAsknGKjjRAHfTI+8vWxj6Rym6wYhFL8=;
	b=cu+oCgDtfP6/NSJz2waGuiKj8cVWO03U7HMmZxtkWaekEgoVamss5qcfOaTiFfTSUd8hFQ
	kiCwbFzwz2eYF3zdffrxMmzGBugbu7lr23RT0PdQxvxBO5ASBnt7UQ+i1OGaEC9ytZ5PWu
	swzo2f/uhXnmeNNHrJwEQF4ua5iWTeiajp6qtTYSisHkpz70iZMFM0+G1Eq6L6FitdZ9gj
	WSF/6GnFsiKgjOj87MIjMKmbi2glPZGWRs6RHqrO+SJd5Kdce1zMeAVI4cZfPuBRZiJ7f9
	5Y3KMlselzBJKu931uUbQ9qoUzwh7FprjHquhC4LNVgqnxVd/g6nkuRMwz6baw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726550;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyrfL3C/OLraAsknGKjjRAHfTI+8vWxj6Rym6wYhFL8=;
	b=cmQ9+ad9nNft1ovw3nDMRjJECdtSve8traE8wq4z21PP0lCqOPQwXJL0VHKpgFfzJk+wjc
	GeDoK5I9wepKRLAA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting module-owned
 static call keys
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-22-song@kernel.org>
References: <20260916184351.2720310-22-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972654861.1720534.16403215501300275465.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     902ccc30b888d61427a2b518ee342ae4e8449276
Gitweb:        https://git.kernel.org/tip/902ccc30b888d61427a2b518ee342ae4e84=
49276
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:14 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for rejecting module-owned static call keys

Static calls carry the same constraint as static branches.  Check that a
vmlinux-owned key is accepted and a module-owned one is refused.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-22-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
