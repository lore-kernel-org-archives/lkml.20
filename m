Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EA94E01EC;
	Fri, 18 Sep 2026 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726520; cv=none; b=Pi51Nj7gPxkMu0FWRMlvu8TWFv30KO6dplQBihv8EUH4DDg0wiNtEaokGARNYTfM5Oh9bIM3blRXZkxJqDKaRmqoTXOqbjeHkjoyqeQJCnIXBZiBgAWEJuugB5DkOLFp9SmgR20F3NoueBmXckZAIxHN21BLG5+weQ2xk8te7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726520; c=relaxed/simple;
	bh=a2zI3JWgziOusNQf/4H6dQyIryFSe4si0STs/8IljrY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IUHbEHtjFSAvIo9sz/nuWW8WPlmZuSx5vQQeuXdEA9gtquJoqGUG9IWG/SK2mkieffyTRVGOdndwyrIWdl55Ukb5+zvnB57Ar+SfXt9QqgHXD59X/9xNGYaFRVKagmF340nNhuqTrh1LTcR6Oct4TvKixJSFkMrEOia+NMbySTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=evMn7z/C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ANgXUS2f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="evMn7z/C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ANgXUS2f"
Date: Fri, 18 Sep 2026 10:15:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726515;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdzB78aqYEwIbKVi8Tnr011s+oqa7N2As1HANG2Pr58=;
	b=evMn7z/Cr6vNeVS9sApIz2Zu3pSpv8s5vvhJdliat0Pnxvfen1oKyHhbU109thvJbfk55w
	XfLeBJjYF5nbaBoEWFwLO7qvgjyfwfgJmDWES/zb351mQ2hiqp3ArysQZBZ0JRe1kMlKvd
	6VabNp1CZJIIZkmg5uaZdF1fxn4mgS+/zVoNlm9m29SqMC3dmc4JCmvXTzOPoj6YgZK/20
	f81tgSVipa3joHuMmD8xi9afu7HkQvqF2KL8wpLFPN11kIc1BRqOyJIIoW9jLhBF77v0r/
	deCnsnSwkZBhseug+GBgaLzzW3XMSO9SDdDV8sFzpHEFWG8xFKIhM8NCWHYELg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726515;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdzB78aqYEwIbKVi8Tnr011s+oqa7N2As1HANG2Pr58=;
	b=ANgXUS2f8tDr7EQeTv2CeLKdLdmvgY2Sh43wU3hW7QyHk4SY7JkGX1i7tFmbiswzOJP995
	AVpduQGnkf/nnXCg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for symbols whose linkage
 the patch changes
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-43-song@kernel.org>
References: <20260916184351.2720310-43-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972651339.1720534.17629867960483443115.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     af969f2b79e49dbd4b466380260c35847047d679
Gitweb:        https://git.kernel.org/tip/af969f2b79e49dbd4b466380260c3584704=
7d679
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:35 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:45 -07:00

objtool/klp: Add test for symbols whose linkage the patch changes

A patch can move a symbol between static and global without renaming it:
dropping "static" from a helper so something else can call it, or adding it
to one that is no longer shared.  Correlation keys off more than the name,
so a symbol whose binding moved has to still pair with itself.

Failing to is not a build failure.  The symbol looks new, and a new data
symbol is either rejected or cloned as a second copy -- at which point the
patched code updates its own private variable while the rest of the kernel
keeps reading the original.

The test covers both directions in one fixture, a function going global and
a variable going static, and asserts the outcome rather than the absence of
a warning: each symbol resolves back to the kernel's copy through a klp
symbol, and neither is cloned into the patch.

An earlier version asserted only that no "no correlation" or "changed data"
message appeared, and passed with correlation deliberately broken.  What
the messages say and what the patch contains are not the same question.

Verified to fail with correlation made to require matching symbol bindings.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-43-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/local_to_global.c   | 34 ++++-
 tools/objtool/tests/generic/test-local-to-global-flip.sh | 63 +++++++-
 2 files changed, 97 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/local_to_global.c
 create mode 100755 tools/objtool/tests/generic/test-local-to-global-flip.sh

diff --git a/tools/objtool/tests/generic/fixtures/local_to_global.c b/tools/o=
bjtool/tests/generic/fixtures/local_to_global.c
new file mode 100644
index 0000000..3c9eb92
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/local_to_global.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A function which the patch changes from static to non-static, and a varia=
ble
+ * that goes the other way.  The names are unchanged; only the binding moves.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+/* noinline, or the static one is folded into its caller and has no symbol */
+#ifdef PATCHED
+__attribute__((noinline)) int flipped_up(int x)		/* was static */
+#else
+__attribute__((noinline)) static int flipped_up(int x)
+#endif
+{
+	return x + 1;
+}
+
+#ifdef PATCHED
+static volatile int flipped_down =3D 5;	/* was global */
+#else
+volatile int flipped_down =3D 5;
+#endif
+
+int caller(int x)
+{
+	flipped_down +=3D x;
+#ifdef PATCHED
+	return flipped_up(x) + flipped_down + 2;
+#else
+	return flipped_up(x) + flipped_down + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-local-to-global-flip.sh b/tools=
/objtool/tests/generic/test-local-to-global-flip.sh
new file mode 100755
index 0000000..45e9279
--- /dev/null
+++ b/tools/objtool/tests/generic/test-local-to-global-flip.sh
@@ -0,0 +1,63 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A patch can change a symbol's linkage without renaming it: dropping "stati=
c"
+# from a helper so something else can call it, or adding it to one that is no
+# longer shared.  Correlation keys off more than the name, so a symbol whose
+# binding moved can fail to pair with itself.
+#
+# Failing to correlate is not a build failure.  The symbol looks new, and a
+# "new" data symbol is either rejected or cloned as a second copy -- at which
+# point the patched code updates its own private variable and the rest of the
+# kernel keeps reading the original.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair local_to_global.c
+
+# Confirm the fixture really moved the bindings, in both directions.
+#
+# Match the binding and the name as fields, not as substrings of the line.
+# -ffunction-sections and -fdata-sections give these symbols sections of the=
ir
+# own, and the section symbols -- .text.flipped_up, .data.flipped_down -- are
+# always LOCAL, so "does a LOCAL line mention flipped_up" is answered by the
+# wrong symbol.  GNU readelf 2.35 happens to leave section symbol names blan=
k,
+# but llvm-readelf prints them, and a premise that holds on one readelf and
+# not the other is no premise at all.
+has_binding()   # $1 object, $2 binding, $3 symbol
+{
+	in_symbols "$1" | awk -v b=3D"$2" -v n=3D"$3" '$5 =3D=3D b && $NF =3D=3D n'=
 | grep -q .
+}
+
+has_binding orig.o    LOCAL  flipped_up ||
+	fail "flipped_up is not local in the original"
+has_binding patched.o GLOBAL flipped_up ||
+	fail "flipped_up is not global in the patched object"
+has_binding orig.o    GLOBAL flipped_down ||
+	fail "flipped_down is not global in the original"
+has_binding patched.o LOCAL  flipped_down ||
+	fail "flipped_down is not local in the patched object"
+
+run_diff
+
+assert_diff_log 'changed function: caller'
+
+# Correlated means each pairs with its own counterpart in the original, so t=
he
+# patch refers back to the kernel's copy ...
+assert_klp_sym flipped_up vmlinux
+assert_klp_sym flipped_down vmlinux
+
+# ... rather than carrying its own.  A second copy of flipped_down is the bad
+# outcome: patched code would update its private one while the rest of the
+# kernel keeps reading the original.
+assert_not_patched flipped_up
+assert_no_section .data.flipped_down
+assert_no_section .bss.flipped_down
+
+diff_log | grep -q 'no correlation' &&
+	fail "linkage change reported as an uncorrelated symbol"
+diff_log | grep -q 'changed data' &&
+	fail "linkage change reported as changed data"
+
+pass "symbols correlated across a change of linkage"
