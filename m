Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CB84ED1BC;
	Fri, 18 Sep 2026 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726561; cv=none; b=Y5Qntku4XHhzYkXO9el81kyVZgHC7b0U38Kb2PDpMSKbazewy0Ix/Bt81E1V6ghc56PnXSlrg11uN9I8GRYRrjSooYNKFN+pW0H/WFRr8TnDSxix7q8TBKhvTtoKjs12NRjU5tSCd8Yj4P5pZm7rhJLkbcTP4bk0qB9Uf50WIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726561; c=relaxed/simple;
	bh=UXZuK3h35W9ZOtCX1F6OxoP74bVtWLMF0K6Ma4kFpuU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=T3eKePB7Ga93bbh85KtU5auosgiZfQlf5dniMWlcleqHrgJFPSR/e2pjbWAx4aYXh+HsucnPqil+AmRgSi1G5HA22InFYpHd4VpWiMLYjAW7zmoASHp1WomcpJZPd4d8sg9ISPMc/uZeaWKU6d5AZOWuNhEv2/h7XpGwzsaAKNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EVuM0csv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nr5BzF1L; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EVuM0csv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nr5BzF1L"
Date: Fri, 18 Sep 2026 10:15:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726557;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lo3zPE8p7nlXKXQyj2YeDmy9qkXLgzdOJyDPEJaMpYE=;
	b=EVuM0csvOSD8ACY5TCRuuXzMI9uwSUnEW+/JeRJ02fMdfcm7AuvfHk9l5yOr4XZpcRnYa+
	ATFMlgo8M79v1iU1FE5dZdf+sJb+w2PIQhlyVhzoVr3Yg9wfiDmZQIXR1Tkt60FlNC0395
	VixHozVD38eHs1TlPRmpsBuEKtPNu1+5f0pUKUyUayQ/RnLwU5QFQoWbdA9ZFtdPUJW8+w
	LKc11HP2F96IEiBpR4c7ql7ezXjazbp3pG4l3XKnGMbJrSB7UIDHK3r4W+BDZXHoBRiPcV
	hG7/H//c8CztpIGLfLYp+OJUljv1yI6YGPNtBGT6aEbHFIFLdVQ86tGrkmutQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726557;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lo3zPE8p7nlXKXQyj2YeDmy9qkXLgzdOJyDPEJaMpYE=;
	b=nr5BzF1Lc4IxwaOvYXz5dmVujawV13SfPp7G1JuXh286+qjvBM/aF+AFVU6R3nyFMOcFr2
	KeIzKQFzIBifFBCA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for cold function halves
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-17-song@kernel.org>
References: <20260916184351.2720310-17-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972655618.1720534.12949420732559587808.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     97f87f3486bfde9829b8e8ae28b2b55ac151045d
Gitweb:        https://git.kernel.org/tip/97f87f3486bfde9829b8e8ae28b2b55ac15=
1045d
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:09 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for cold function halves

The compiler splits unlikely code into a separate foo.cold symbol.  Both
halves are the same function and both belong in the livepatch: carrying
only the hot part leaves the cold path branching into unpatched code.

GCC needs -freorder-blocks-and-partition to split reliably.  The flag is
probed rather than assumed, and the test skips when the compiler declines
to split at all.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-17-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/cold_function.c | 21 ++++++-
 tools/objtool/tests/generic/test-cold-function.sh    | 39 +++++++++++-
 2 files changed, 60 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/cold_function.c
 create mode 100755 tools/objtool/tests/generic/test-cold-function.sh

diff --git a/tools/objtool/tests/generic/fixtures/cold_function.c b/tools/obj=
tool/tests/generic/fixtures/cold_function.c
new file mode 100644
index 0000000..f6d4109
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/cold_function.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Function the compiler may split into a hot part and a foo.cold part. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+static void __attribute__((cold, noinline)) slow_path(int x)
+{
+	__asm__ volatile("" :: "r"(x));
+}
+
+int target(int x)
+{
+	if (__builtin_expect(x < 0, 0))
+		slow_path(x);
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-cold-function.sh b/tools/objtoo=
l/tests/generic/test-cold-function.sh
new file mode 100755
index 0000000..a02652f
--- /dev/null
+++ b/tools/objtool/tests/generic/test-cold-function.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Both halves of a split function belong to the patch; carrying only the hot
+# part leaves the cold path branching into unpatched code.
+
+. "$(dirname "$0")/../lib.sh"
+
+# Clang does not split functions into a cold part at all, so there is nothing
+# for this test to look at there.  A given gcc may or may not split, which i=
s a
+# version property rather than a compiler choice -- that stays a probe below.
+gcc_only "clang does not split functions into a cold part"
+
+setup
+
+split_flag=3D-freorder-blocks-and-partition
+cc_supports "$split_flag" || split_flag=3D
+
+build_pair cold_function.c $split_flag
+
+# Find what the compiler called the cold half -- target.cold, target.cold.0,
+# depending on version -- and name it exactly from here on.
+cold_sym=3D"$(in_symbols orig.o | awk '$NF ~ /^target\.cold/ { print $NF; ex=
it }')"
+[ -n "$cold_sym" ] ||
+	probe_skip "compiler did not split the function into a cold part"
+
+run_diff
+
+assert_patched target
+# Match the name field exactly, and require it to be defined.  Had the cold
+# half been left behind, the branch to it would appear as an undefined
+# .klp.sym.vmlinux.target.cold,0 -- a different name, which happens to conta=
in
+# this one.  Asking about a column instead of the name would not tell them
+# apart: readelf prints SHN_LIVEPATCH as "OS [0xff20]" and llvm-readelf as
+# "OS[0xff20]", so the fields either side of the name shift between the two.
+out_symbols | awk -v n=3D"$cold_sym" '$NF =3D=3D n && $(NF - 1) !=3D "UND"' =
| grep -q . ||
+	fail "cold half ($cold_sym) was not carried into the patch"
+
+pass "cold half carried into the patch with its parent"
