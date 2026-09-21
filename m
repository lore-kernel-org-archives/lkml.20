Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA446E01E;
	Mon, 21 Sep 2026 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982882; cv=none; b=W2UqOrPNn5CqlNCudxYqGOezpZOE1On52DhQB4LmggZZshqCw5HkJtrdyEwYmO+cYc9Z9kEc9rKRyI+By691/bR7N+KF0ILwCUTqITDZSLLnHiug4BhuTXsywCfVWwMlVR6rveuOZmNBTDjRDpvZKU46QrpmOT2uOZDTvGFob10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982882; c=relaxed/simple;
	bh=KXV1NmsIB/bkCugx3NAiEiGY4HbmT4/LQf48/AqXtDQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Kr24qSUsuIbbN7tJLqGrv3BEzydpG0ZamnmAqaWDW2b5Jp4EPq/oGKOOBUGdjHKTLsDSrIBXAEwyp32EjJJeIqIKi2O4M6P50accNdbgp2sqUXKPj02bR1l+l/tEGZPRHjOcc4+uR3zCShl6jGHN1Nt63lE0+i8THKCIlmts2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Opm+PqTs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/+fPD1KQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Opm+PqTs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/+fPD1KQ"
Date: Mon, 21 Sep 2026 09:27:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982877;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0EHRFf9iNujXJKqjBOABXq5THK5qsBJYIFHoaNWFpc=;
	b=Opm+PqTsJsUAaokN0A/Cy2T+QHV7pRt9qZLBUPePnnvM40BKUWiE7sOSn0k0kfTnfryMbd
	7sjC/O30WxgRbMeRPpXpAwtSerZ5A3M7MZGw8BMcGfpDmw6Xa1BjNNU6LwqT8GD57EMSv0
	feGNE7mczsZ8oXaztVSqo+QBCaCQix+Ia1YX24WfDl+LZE7yqvzSNfD7MQLa7PzHIDtldx
	QfTrJ2yX2F9mXVObMuZ9K6PaaY29dfag51xM2I3aZeLqnzi5s6OGcDqizqAnFaMXgDlC5F
	uHQNE6chArz8RT5IhtLJTXtbfB/LD4TE6E0i/YmkAB4EknUbHnL0Ilv8bhAZqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982877;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0EHRFf9iNujXJKqjBOABXq5THK5qsBJYIFHoaNWFpc=;
	b=/+fPD1KQ5mteqFT8qrtZ+KLOSim7HH0uZOwj6MhoRn7BIt6eIG8jxxjL0WKvLyNk/UsU9K
	0Wz6tan0O4bybFAg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for static locals which
 must not be correlated
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-40-song@kernel.org>
References: <20260916184351.2720310-40-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998287626.2819794.3114897171275093819.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     2e49f7a8391ac75f25fc56f63747b86dcd320baf
Gitweb:        https://git.kernel.org/tip/2e49f7a8391ac75f25fc56f63747b86dcd3=
20baf
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:32 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for static locals which must not be correlated

Most static locals have to be correlated so the patched code keeps using
the running kernel's copy.  Two kinds must not: anything in .data..once,
the flag behind WARN_ONCE and friends, and the well-known names the kernel
generates for per-instance things (__warned, __key, __func__).

Sharing a .data..once flag means a patch inherits "already warned" from
before it was applied, and the warning it was meant to surface never fires.

The fixture deliberately does not name its .data..once variable __warned:
the name rule would then catch it and the section rule would go untested.
gcc spells these <var>.<id> and Clang <func>.<var>, so both are covered.

This tests the behavior of commit ff529864e738 ("objtool/klp: Fix
.data..once static local non-correlation") and commit 84c304a534b8
("objtool/klp: Fix is_uncorrelated_static_local() for Clang").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-40-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/static_local_uncorrelated.c | 41 ++++++=
+++++++++++++++++++++++++++++++++++
 tools/objtool/tests/generic/test-static-local-uncorrelated.sh    | 41 ++++++=
+++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/static_local_uncorre=
lated.c
 create mode 100755 tools/objtool/tests/generic/test-static-local-uncorrelate=
d.sh

diff --git a/tools/objtool/tests/generic/fixtures/static_local_uncorrelated.c=
 b/tools/objtool/tests/generic/fixtures/static_local_uncorrelated.c
new file mode 100644
index 0000000..cb4cdd7
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/static_local_uncorrelated.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Static locals of three kinds, in one patched function.
+ *
+ * Most static locals must be correlated, so the patched code keeps using the
+ * running kernel's copy.  Two kinds must not:
+ *
+ *   - anything in .data..once, the flag behind WARN_ONCE and friends.  Shar=
ing
+ *     it would mean a patch inherits "already warned" from before the patch.
+ *   - the well-known names the kernel generates for such things (__warned,
+ *     __key, __func__, ...), which are per-instance by nature.  gcc names t=
hem
+ *     <var>.<id> and Clang <func>.<var>, so both spellings have to be caugh=
t.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int target(int x)
+{
+	/*
+	 * A .data..once variable whose name is *not* on the list below, so
+	 * only the section can disqualify it.  Naming it __warned would let
+	 * the name rule catch it and the section rule go untested.
+	 */
+	static int once_flag __attribute__((section(".data..once")));
+	/* a never-correlate name, in an ordinary section */
+	static int __key;
+	/* and one that must be correlated */
+	static int ordinary;
+
+	if (!once_flag)
+		once_flag =3D 1;
+	__key +=3D x;
+	ordinary +=3D x;
+
+#ifdef PATCHED
+	return __key + ordinary + once_flag + 2;
+#else
+	return __key + ordinary + once_flag + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-static-local-uncorrelated.sh b/=
tools/objtool/tests/generic/test-static-local-uncorrelated.sh
new file mode 100755
index 0000000..d771158
--- /dev/null
+++ b/tools/objtool/tests/generic/test-static-local-uncorrelated.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Some static locals must not be correlated with their counterparts in the
+# running kernel; the patched code has to use a fresh copy instead.
+#
+# .data..once holds the "have we warned yet" flags behind WARN_ONCE.  Correl=
ate
+# one and the patched function inherits the flag from before the patch, so t=
he
+# warning the patch was written to produce never fires.  The same goes for t=
he
+# names the kernel generates for per-instance state -- __warned, __key,
+# __func__ and friends.
+#
+# Both directions matter, so an ordinary static local is here too: a rule th=
at
+# refuses to correlate anything would pass a test that only checks the
+# refusals.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_local_uncorrelated.c
+run_diff
+
+# Compilers mangle static locals differently -- gcc gives __key.1, Clang
+# target.__key -- so match on the base name.
+
+# Correlated: referenced through a klp symbol, pointing at the kernel's copy.
+out_symbols | grep -q '\.klp\.sym\..*ordinary' ||
+	fail "ordinary static local was not correlated"
+
+# Not correlated: no klp symbol, and a copy cloned into the patch instead.
+out_symbols | grep -q '\.klp\.sym\..*__key' &&
+	fail "__key was correlated; it must use a fresh copy"
+# .sbss/.sdata on the architectures with a small-data area.
+out_sections | grep -qE '\.s?(bss|data)[^ ]*__key' ||
+	fail "__key was neither correlated nor cloned"
+
+out_symbols | grep -q '\.klp\.sym\..*once_flag' &&
+	fail ".data..once variable was correlated; it must use a fresh copy"
+assert_section '.data..once'
+
+pass "per-instance static locals cloned, ordinary ones correlated"
