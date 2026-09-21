Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAEA476CE6;
	Mon, 21 Sep 2026 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982903; cv=none; b=S6qcjOiNFxJkyXxtGjUyQH+zKqCC2H94HQ2mcYzQji3j1tbUwTGxTcEpI9Tn3274NsLqeRKangS1Arv4zbRBgfn2KM4oEi//xq9wNccOTqBHK9SdBZJ3PT6uNOrYkJSk6mqs4pFh1vOwNLq5NDe9+nI1Zu6i43zTi1KmB9ysTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982903; c=relaxed/simple;
	bh=2++EZbrVcAD0z++n+QTPHlpsj9Ckb9tqWXsTRBIqrUk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=f7B/M51K7DZkBOgCwxtTxTWktbnYzlal6b+E3MnEf8loOhxp76YZQHG3O8g5rO9snf0ZicDIHKYF1dPAMLR+B9C8QWaGamR8Vp4spo9+CBhfVmwtNCkkhd2wjKSMoI805dMEgLgmvylneGy7Bb2/hreyBvtIArP0g5QMPiSlPtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4SMahL1b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qDhmcHt4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4SMahL1b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qDhmcHt4"
Date: Mon, 21 Sep 2026 09:28:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982899;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvKg7eSsfC9HkxCAU2fOVGF6fSzzfCrlS5RxgT+62gw=;
	b=4SMahL1bH6Mz+NdOKRweCrhDwh4TwJtYd5oa7eWIYMpNqWUGFxyfL6j7sEnWeMU4MYMCw2
	JDO6k+bQfpcN1x6NpFpBif9alh7hNtmNaYUlVWHspr6MxNG0B28Us5MOXwZoNFWO3RZnVW
	ECg8gJq7grH63at/bJPTWbJo1HMRalCxBLP9i/nY7WyJLT26i2WVzo3tvFE9AOAA24f8TM
	/2Blj1M0U3aaCt5tKEvq5MWbub6opjS6A+7Qv3pwtp8ysgj5Zwq5X2jlovWUCqmmmDK2wu
	AyfozaIJFF2Mfljyk5gmCinLXHjvIHqrNrL4hXT9N47904POgOK6yeqUQzui4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982899;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvKg7eSsfC9HkxCAU2fOVGF6fSzzfCrlS5RxgT+62gw=;
	b=qDhmcHt4EXZ1IV+Vec35/Nv2DyAJCfiP7FAf/EuxLl86EQOwR/AbeCe0GCY490hmdDWPnf
	sBhrcn0ge7LlyEBA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for correlation across
 ThinLTO name mangling
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-25-song@kernel.org>
References: <20260916184351.2720310-25-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289826.2819794.8599034460062266985.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     7fd24723f1601340ee09bca93989bd1fb4515783
Gitweb:        https://git.kernel.org/tip/7fd24723f1601340ee09bca93989bd1fb45=
15783
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:17 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:27 +02:00

objtool/klp: Add test for correlation across ThinLTO name mangling

ThinLTO promotes the file-local symbols an imported function touches,
renaming them name.llvm.<hash>.  The hash is content derived, so it changes
whenever the module does:

  original: counter.llvm.13663304415433785070
  patched:  counter.llvm.10543383937958011340

Correlating the two objects therefore requires demangling the suffix;
matching raw names would see two unrelated symbols and treat the variable
as new.

The resulting klp relocation also has to name the original symbol, since
that is the one in the running kernel's kallsyms.  Naming the patched
build's symbol produces a relocation which can never be resolved.

ThinLTO is a clang feature, so the test declares itself clang-only.  It
also needs an lld from the same LLVM release as $CC; a mismatched pair
fails with "Invalid summary version", which reads like a broken test rather
than a broken environment, so probe for a working lld and skip if there is
none.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-25-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/thinlto_local.c | 39 +++++++++-
 tools/objtool/tests/generic/test-thinlto-local.sh    | 48 +++++++++++-
 2 files changed, 87 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/thinlto_local.c
 create mode 100755 tools/objtool/tests/generic/test-thinlto-local.sh

diff --git a/tools/objtool/tests/generic/fixtures/thinlto_local.c b/tools/obj=
tool/tests/generic/fixtures/thinlto_local.c
new file mode 100644
index 0000000..fe9f9e6
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/thinlto_local.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Two translation units (TU_B selects the second) linked with ThinLTO.
+ * Importing bump() promotes the file-local counter, renaming it
+ * counter.llvm.<hash>.  The hash is content derived, so it differs between =
the
+ * original and patched builds.
+ */
+
+#ifdef TU_B
+
+extern int bump(void);
+
+int other_entry(void)
+{
+	return bump() + bump();
+}
+
+#else
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+static int counter;
+
+int bump(void)
+{
+	return ++counter;
+}
+
+int target(void)
+{
+#ifdef PATCHED
+	return counter + 1;
+#else
+	return counter;
+#endif
+}
+
+#endif
diff --git a/tools/objtool/tests/generic/test-thinlto-local.sh b/tools/objtoo=
l/tests/generic/test-thinlto-local.sh
new file mode 100755
index 0000000..a266263
--- /dev/null
+++ b/tools/objtool/tests/generic/test-thinlto-local.sh
@@ -0,0 +1,48 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Correlating ThinLTO-promoted locals requires demangling the .llvm.<hash>
+# suffix, and the resulting klp relocation must name the original symbol: th=
at
+# is the one in the running kernel's kallsyms.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+clang_only "ThinLTO requires clang"
+
+find_thinlto_toolchain ||
+	probe_skip "no matching clang/lld pair for a ThinLTO link; set THIN_LD to o=
ne"
+
+build_thinlto()		# $1 output object, $2 extra flags
+{
+	$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $2 \
+		-c "$FIXTURES_DIR/thinlto_local.c" -o "$workdir/tu_a.o" 2>/dev/null || ret=
urn 1
+	$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections $2 -DTU_B \
+		-c "$FIXTURES_DIR/thinlto_local.c" -o "$workdir/tu_b.o" 2>/dev/null || ret=
urn 1
+	"$THIN_LD" -r "$workdir/tu_a.o" "$workdir/tu_b.o" -o "$1" 2>/dev/null || re=
turn 1
+}
+
+build_thinlto "$workdir/orig.o" "" ||
+	probe_skip "ThinLTO build failed ($THIN_CC, $THIN_LD)"
+build_thinlto "$workdir/patched.o" -DPATCHED ||
+	probe_skip "ThinLTO build failed ($THIN_CC, $THIN_LD)"
+
+orig_sym=3D"$(in_symbols orig.o    | grep -o 'counter\.llvm\.[0-9]*' | head =
-1)"
+new_sym=3D"$( in_symbols patched.o | grep -o 'counter\.llvm\.[0-9]*' | head =
-1)"
+
+[ -n "$orig_sym" ] && [ -n "$new_sym" ] ||
+	probe_skip "$THIN_CC did not promote the local symbol"
+
+# Equal hashes would make plain name matching work, testing nothing.
+[ "$orig_sym" !=3D "$new_sym" ] ||
+	probe_skip "$THIN_CC gave the same ThinLTO hash for both builds"
+
+run_diff
+assert_patched target
+
+out_symbols | grep -q "\.klp\.sym\.vmlinux\.$orig_sym," ||
+	fail "expected a klp relocation naming $orig_sym"
+out_symbols | grep -q "\.klp\.sym\.vmlinux\.$new_sym," &&
+	fail "klp relocation names $new_sym, which the running kernel does not have"
+
+pass "ThinLTO-mangled local correlated across differing hashes ($THIN_CC, $T=
HIN_LD)"
