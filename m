Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693304DE720;
	Fri, 18 Sep 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726517; cv=none; b=tW5cviDorN9FEJlu2PFxMXv0sszhQDfER1w31Dtit/1f88NndsRsLZTWdT66CBERNjxz7C9V5O9mTYmkljf8foU4ussue+f/Q2OQ2rtxIbPUtgMR99TAUOmNm3kzo3Ls8NeqkiI1e5Fqoq7zYO/Yx4zwOa3y+xEMXsSymqoj91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726517; c=relaxed/simple;
	bh=sUW15yrYxzF0nncz9pb+5IyK0xRm5xpn7QrL1KaY0A8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=s9JZxG+VwTTXwqcUv3Fs726zsuqFcbhLrcuYvv7bwo7YPHp50lwDlKjmMmQY3fXRctVDo4hQ1PJFSb9BrFRNLAJGOc3a+tFiKJjJwJrS+o/8K2YbhQ8GpFL6BRiKUIDkBbGY3a6/+EjlXWKJJ/344E3XOknkD6OoyjG9fQ+1Waw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jLpnnq5W; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Dhh9pKaT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jLpnnq5W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Dhh9pKaT"
Date: Fri, 18 Sep 2026 10:15:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726511;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsGFZE4mr9dVDAtQlt2d7op/AMnOJUd0OCeyF+LfMeY=;
	b=jLpnnq5WU97Q/O9MgLt3DSDIdZce58nKb1Gni3mvjKcY5NZEhuMj44caoQCSDMzNITg68D
	YsaqjIdqSQblFZcMgIZD9PcPmQlVOFJ/zn8lQmMsHLKryHSCG0g+O/jXEE7B1+RT6DFFx6
	1/Yt5q5NDLKvS3jByNHP4ElcvV4ttI2HL/hJZYdC/eXh7aqG46tgeYwuhYqEehxqTpx+a0
	5dGyYcd51R3dCkLm8rhwyuzbKkb1zGuYh4iHQAS5wyYM3f+4+ih0PQLG055UFLoanB3qfr
	CJnts6fIPsTDZIQg+CmEmNk74BnzxY8CGX8Qdq9+cEX4QBITlDIe+dsG+0jEeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726511;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsGFZE4mr9dVDAtQlt2d7op/AMnOJUd0OCeyF+LfMeY=;
	b=Dhh9pKaTlaHv+Tt6h+Q2vbDZR5x+E+zQPhQfE+wUT8sidaA3MmPCSKY7LFzxQB2oJaBHi/
	xTVJ8HUGP25jS2Dg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Test a hand-built livepatch module's
 static call keys
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-45-song@kernel.org>
References: <20260916184351.2720310-45-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972650997.1720534.13091258200065320927.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     57569598499ee6fda7b5e1fd8c2e9b02b91c0636
Gitweb:        https://git.kernel.org/tip/57569598499ee6fda7b5e1fd8c2e9b02b91=
c0636
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:37 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:45 -07:00

objtool/klp: Test a hand-built livepatch module's static call keys

__SCK__* static call keys are not exported; modules are given read-only
access at load time.  Livepatch modules built by klp-build do have full
access to theirs, and commit 164c9201e1da ("objtool: Add base objtool
support for livepatch modules") added a check on that basis -- but a
livepatch module can also be written by hand, as everything under
samples/livepatch is, and such a module hits an unexported key as soon as
it does anything expanding to a static call.  With
CONFIG_MEM_ALLOC_PROFILING_DEBUG that includes allocating memory, which is
how livepatch-shadow-fix1 came to fail to build.

Cover it, with the plain module as a control: it takes the same path and
has always been accepted, so a test that built only the livepatch variant
could not tell this fix from the check being deleted.

This is objtool's ordinary check pass rather than a klp subcommand, which
is the first test here to exercise it -- and is the point, since that pass
is what runs over a hand-built livepatch module during a normal kernel
build.

Verified by reverting commit f495054bd12e ("objtool/klp: Fix unexported
static call key access for manually built livepatch modules"): objtool
reports "can't find static_call_key symbol: __SCK__klp_test_call" and the
test fails, under both gcc and clang.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-45-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/x86/fixtures/static_call_no_key.c  | 32 +++++++-
 tools/objtool/tests/x86/test-manual-klp-static-call.sh | 40 +++++++++-
 2 files changed, 72 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/static_call_no_key.c
 create mode 100755 tools/objtool/tests/x86/test-manual-klp-static-call.sh

diff --git a/tools/objtool/tests/x86/fixtures/static_call_no_key.c b/tools/ob=
jtool/tests/x86/fixtures/static_call_no_key.c
new file mode 100644
index 0000000..748ba7c
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/static_call_no_key.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A static call to a trampoline whose key symbol this object cannot see.
+ *
+ * That is the normal situation for a module: __SCK__* keys are not exported,
+ * and read-only access is granted at load time instead.  objtool's static c=
all
+ * handling has to accept it for any module, including a livepatch module bu=
ilt
+ * by hand rather than by klp-build.
+ *
+ * LIVEPATCH adds the .modinfo tag which makes objtool treat this as a
+ * livepatch module.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D
+#ifdef LIVEPATCH
+	"\0livepatch=3DY"
+#endif
+	"\0name=3Dklp_testmod";
+
+/*
+ * The trampoline is undefined here, exactly as it is for a module calling a
+ * static call defined in vmlinux.  No __SCK__klp_test_call accompanies it.
+ */
+extern void __SCT__klp_test_call(void);
+
+int target(int x)
+{
+	__asm__ volatile("call __SCT__klp_test_call\n\t" ::: "memory");
+
+	return x + 1;
+}
diff --git a/tools/objtool/tests/x86/test-manual-klp-static-call.sh b/tools/o=
bjtool/tests/x86/test-manual-klp-static-call.sh
new file mode 100755
index 0000000..6c4d275
--- /dev/null
+++ b/tools/objtool/tests/x86/test-manual-klp-static-call.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# objtool's static call handling must accept a livepatch module which cannot
+# see a static call's key symbol.
+#
+# __SCK__* keys are not exported; modules get read-only access at load time
+# instead.  Livepatch modules built by klp-build do have full access to their
+# keys, and a check was added on the strength of that -- but a livepatch mod=
ule
+# can also be written by hand, and samples/livepatch is full of them.  One of
+# those needs a key it cannot see as soon as it does anything that expands t=
o a
+# static call, which with CONFIG_MEM_ALLOC_PROFILING_DEBUG includes allocati=
ng
+# memory:
+#
+#   samples/livepatch/livepatch-shadow-fix1.o: error: objtool: static_call:
+#     can't find static_call_key symbol: __SCK__WARN_trap
+#
+# The module built without the livepatch tag is the control: it takes the sa=
me
+# path and has always been accepted, so a test which only built the livepatch
+# one could not tell this fix from the check being removed altogether.
+#
+# Fixed by f495054bd12e ("objtool/klp: Fix unexported static call key access
+# for manually built livepatch modules").
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# Not a klp subcommand: this is objtool's ordinary check pass, which is what
+# runs over a hand-built livepatch module during a normal kernel build.
+for tag in "" -DLIVEPATCH; do
+	build_one static_call_no_key.c mod.o $tag
+
+	"$OBJTOOL" --module --static-call "$workdir/mod.o" \
+		> "$workdir/objtool.log" 2>&1 ||
+		fail "objtool rejected a ${tag:+livepatch }module which cannot" \
+		     "see its static call key: $(tail -1 "$workdir/objtool.log")"
+done
+
+pass "livepatch module accepted without access to its static call key"
