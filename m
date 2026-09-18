Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71854E06D8;
	Fri, 18 Sep 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726525; cv=none; b=pN6OFaPnfDZLXc3XYnRVm+Ffu9+4InTSIPojFiJ4h+5NAmquz60kb8f5x8CA2jquwYqV8L2sEW7ta4lgXK4Q8R+300WXHtn4r6SO3hypfIsI0ug+GRszJsDS3L8bTy0RB9mUvDXHWZcfigAqpFU664IQfawFVuv8XC4BgsYwyUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726525; c=relaxed/simple;
	bh=Nb9zXe0ce9TJqI4q/zpA7TnV4P8n70y69TF8CwAGrCA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hZNECRmmcLyAe3alprELbKnWXFz6tt2qFnG2PnfKpvPj41SwOFlQxSERn8fiOzADqphlxdu4yi39FIQKi/JNkUC7DlqdEV2yO92E3zzVGQQzE8yXUTuPDl52fcuPBQ7p8AfQ9NQNU+tlm26SiJfdeGJRaQZaaM5UZyYZAkJpwR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BxReX2c0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hnVYwjka; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BxReX2c0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hnVYwjka"
Date: Fri, 18 Sep 2026 10:15:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726521;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0Xeil9WzTejgI9Wz59kBXz5KeOABgxsjJfeytwwWs=;
	b=BxReX2c0Gc+eSdMD4ltA+/LFSwsnD3VlH527JdbzTY1WOcel0mSzjLjkvKDzmP3QyQn59s
	C6iNIP805S51wg1QvnXP5fQHpjPyQ2pKr5xDm2vRAinvJVLxAVtwYOdiguY6VYLuXOtHnW
	FZ3G89PK8VK4W5KqQu0eq6UfPWFnVabWyfLqEPPB3n5ApfUFXmK9MX0vgsMtAJs8D/cTwU
	UJB+449OjjskOFGzoTdGx6ftdRQgTsLehElhQuYJZO0A6lT4Qg4KRebPT8QYCyawUm0KCp
	fdvJtAVy8Sg6Wr+5DbDnch6PaW2e27wfkWCsTzeHhMvcz5Ddj6GgUR6awFLu8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726521;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VB0Xeil9WzTejgI9Wz59kBXz5KeOABgxsjJfeytwwWs=;
	b=hnVYwjkaNFW1qfQqYMFLGmTAw1XI5kZdiccopBLiG+pdlbO5G9VBfS1+mNvUjdoxA/nFDv
	U7Y75z+Xn/Q8C8DQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for static locals which
 must not be correlated
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-40-song@kernel.org>
References: <20260916184351.2720310-40-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972651898.1720534.17679330348242127277.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     34bc77c4c640c8de199c71d81f603218551485ef
Gitweb:        https://git.kernel.org/tip/34bc77c4c640c8de199c71d81f603218551=
485ef
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:32 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:45 -07:00

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
Link: https://patch.msgid.link/20260916184351.2720310-40-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
