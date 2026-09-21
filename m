Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91D47D465;
	Mon, 21 Sep 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982945; cv=none; b=ZkHVSXJz2PevPO+CX7lZiRbLmy5l9gCKge7LpupjRbjOIRjeVe09ifbezhIN0AFsAwLLgMxLlfcIn3tW9DmeQspO7MDS112j1e5lzXoecwGu3bq9DMGeMU9lDFIxmPi1e/k+CtYx+c/jqoER1m+1G4K83V6OH1sMLy/cgXBIm5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982945; c=relaxed/simple;
	bh=R5WRGvysW5vk3fK0sVav36+0ecU3kdgEeUHocOU4P1E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=oET20CK0/z85jqItT5GeTG11UQ665pwl+qxTh+9sRRBBqggLjpxkNio7GsUYDGPobrYxsHb1Kuf00PjlB/rjUP0Ums4brUoftiT0+2Rkih/7ty88gRp8a/+OUw76+tQWI8gfcwcLnJQ0Tpik47aCO4M0M0opiJMt5Xtmh4ZncvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HcBpm5i4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1y+b3XGH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HcBpm5i4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1y+b3XGH"
Date: Mon, 21 Sep 2026 09:28:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982931;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+RTmrY9WT3Fu5WFqzPd2a6ODWgh0A7Zdvi68KlS8Tk=;
	b=HcBpm5i4r/eY19orhgB6m5iw+ISKxYi8hvhdTf64qWDKwu/Yi7iFpPrpWDhnigVzQX4F5h
	lp27fGBJ4MMTC+COdyBv58sWHQ1A6r8+aC4xbBlBG19ktRUsa1gw7Bzfnk/J/603BU2Mbl
	scMkwvheI147ID3PTwX6b0bBBOSO2tAz9jD0PvbsmMglFAsXT3yMdjXKeb0YsgKtLwx5Fz
	dy+C0DZz0lS+im9vxl1yL36WOnrrh4GbPOW8FNQUOX80JKRc1kf7GatRSvaFLaTxJTriTU
	ySGnYYhryN20ewnMBl+MrkV7FvYknaxgys+fl5mVrsUSDqh2xWOOBkK0fNt8hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982931;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+RTmrY9WT3Fu5WFqzPd2a6ODWgh0A7Zdvi68KlS8Tk=;
	b=1y+b3XGHS6WmEmKwZbMoGXaGZ872/8FnnIEWyZhpZKKXXfm7Vs+sP714VNEnDzvydwbB/0
	0uwbSg1XN8T8N5Ag==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Group the klp tests by architecture
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-4-song@kernel.org>
References: <20260916184351.2720310-4-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998293027.2819794.8942527865755591922.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     d76312b8a1f69be71ec38d04d69fbcdd0520ff89
Gitweb:        https://git.kernel.org/tip/d76312b8a1f69be71ec38d04d69fbcdd052=
0ff89
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:42:56 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 10:54:41 +02:00

objtool/klp: Group the klp tests by architecture

Which architecture a test is for is expressed by where it lives: tests are
in generic/ or in a directory named for their architecture, each carrying
its own fixtures, and the runner executes generic/ plus the one that
matches.  A test which cannot apply here is then not run at all, rather
than running in order to announce that it did not.

Layout does this better than a declaration would.  There is no x86_only(),
and no lookup letting a fixtures/<arch>/ file shadow a generic one of the
same name -- an arch-specific test simply carries its own fixtures.

Compilers cannot work the same way: CI varies CC over the same tree, so a
compiler requirement stays a declaration in the test.

What a run leaves out is reported once:

  # not run: 5 tests in x86/ (this run is arm64)

Silence would have been cheaper and wrong.  A run covering less than the
tree holds must not look like a run that covered all of it.

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-4-song@kernel.org
---
 tools/objtool/tests/fixtures/basic.c         | 20 +-----------
 tools/objtool/tests/generic/fixtures/basic.c | 20 +++++++++++-
 tools/objtool/tests/generic/test-basic.sh    | 17 +++++++++-
 tools/objtool/tests/lib.sh                   | 27 ++++++++++++--
 tools/objtool/tests/run-tests.sh             | 36 ++++++++++++++++---
 tools/objtool/tests/test-basic.sh            | 17 +---------
 6 files changed, 92 insertions(+), 45 deletions(-)
 delete mode 100644 tools/objtool/tests/fixtures/basic.c
 create mode 100644 tools/objtool/tests/generic/fixtures/basic.c
 create mode 100755 tools/objtool/tests/generic/test-basic.sh
 delete mode 100755 tools/objtool/tests/test-basic.sh

diff --git a/tools/objtool/tests/fixtures/basic.c b/tools/objtool/tests/fixtu=
res/basic.c
deleted file mode 100644
index 811529e..0000000
--- a/tools/objtool/tests/fixtures/basic.c
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* One changed function and one unchanged function. */
-
-/* klp diff takes the object's module name from .modinfo */
-static const char __modinfo[]
-	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
-
-int untouched(int x)
-{
-	return x * 3;
-}
-
-int changed(int x)
-{
-#ifdef PATCHED
-	return x + 2;
-#else
-	return x + 1;
-#endif
-}
diff --git a/tools/objtool/tests/generic/fixtures/basic.c b/tools/objtool/tes=
ts/generic/fixtures/basic.c
new file mode 100644
index 0000000..811529e
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/basic.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/* One changed function and one unchanged function. */
+
+/* klp diff takes the object's module name from .modinfo */
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int untouched(int x)
+{
+	return x * 3;
+}
+
+int changed(int x)
+{
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-basic.sh b/tools/objtool/tests/=
generic/test-basic.sh
new file mode 100755
index 0000000..562edfb
--- /dev/null
+++ b/tools/objtool/tests/generic/test-basic.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Only functions whose code changed get cloned into the patch.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+run_diff
+
+assert_patched     changed
+assert_not_patched untouched
+assert_section     ".init.klp_funcs"
+assert_section     ".init.klp_objects"
+
+pass "changed function cloned, unchanged function left alone"
diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 46bdb98..fdea9b7 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -9,7 +9,10 @@
 # of regressions.
=20
 TESTS_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
-FIXTURES_DIR=3D"$TESTS_DIR/fixtures"
+
+# Tests live in generic/ or in an architecture directory beside it, and each
+# carries its own fixtures.
+FIXTURES_DIR=3D"$(cd "$(dirname "$0")/fixtures" 2>/dev/null && pwd)"
=20
 # The kernel's convention: CROSS_COMPILE is the one knob, with per-tool
 # overrides for what it does not cover.  objtool itself is always a host bin=
ary
@@ -36,7 +39,7 @@ OBJTOOL=3D"${OBJTOOL:-$TESTS_DIR/../objtool}"
 #
 klp_preflight()
 {
-	local tmp tool cc_version host cc_arch
+	local tmp tool cc_version arch host cc_arch
=20
 	bail() { echo "Bail out! $*" >&2; exit 1; }
=20
@@ -96,8 +99,26 @@ klp_preflight()
 	esac
 	rm -rf "$tmp"
=20
+	# Normalize to the kernel's SRCARCH.
+	case "${ARCH:-$(uname -m)}" in
+	x86_64|i?86)	arch=3Dx86 ;;
+	aarch64*)	arch=3Darm64 ;;
+	*)		arch=3D"${ARCH:-$(uname -m)}" ;;
+	esac
+
+	case "$(uname -m)" in
+	x86_64|i?86)	host=3Dx86 ;;
+	aarch64*)	host=3Darm64 ;;
+	*)		host=3D"$(uname -m)" ;;
+	esac
+
+	[ -z "$cc_arch" ] || [ "$cc_arch" =3D "$arch" ] ||
+		bail "ARCH says $arch but '$CC' builds $cc_arch objects;" \
+		     "the $arch tests would run against the wrong architecture"
+
+	KLP_TEST_ARCH=3D"$arch"
 	KLP_TEST_PREFLIGHT=3Ddone
-	export OBJTOOL CC KLP_TEST_PREFLIGHT
+	export OBJTOOL CC KLP_TEST_ARCH KLP_TEST_PREFLIGHT
=20
 	cc_version=3D"$($CC --version 2>/dev/null | head -1)"
 	cat <<EOF
diff --git a/tools/objtool/tests/run-tests.sh b/tools/objtool/tests/run-tests=
.sh
index f6a3e1b..48728a9 100755
--- a/tools/objtool/tests/run-tests.sh
+++ b/tools/objtool/tests/run-tests.sh
@@ -3,6 +3,11 @@
 #
 # Run the objtool klp tests.  Each test-*.sh prints one TAP result line.
 #
+# Tests live in generic/ and in a directory per architecture.  A run executes
+# generic/ plus the one matching this architecture, so a test which cannot
+# apply here is not run rather than reporting a skip; what was left out is
+# reported once, as a comment, so differing coverage is still visible.
+#
 # The harness checks the environment once up front and fails the run if the
 # suite cannot execute, rather than letting every test skip and exit 0.
=20
@@ -10,13 +15,34 @@ set -u
=20
 cd "$(dirname "$0")" || exit 1
=20
-tests=3D( test-*.sh )
-[ "${tests[0]}" =3D "test-*.sh" ] && { echo "1..0 # SKIP no tests found"; ex=
it 0; }
-
-# Sourcing the harness runs its preflight, and exports what it found so the
-# tests inherit it rather than working it out again.
+# Sourcing the harness runs its preflight, which decides which architecture
+# this run is for -- so the test list cannot be built before it has, and the
+# tests inherit the answers rather than working them out again.
 . ./lib.sh
=20
+dirs=3D( generic )
+[ -d "$KLP_TEST_ARCH" ] && dirs+=3D( "$KLP_TEST_ARCH" )
+
+tests=3D()
+for d in "${dirs[@]}"; do
+	for t in "$d"/test-*.sh; do
+		[ -f "$t" ] && tests+=3D( "$t" )
+	done
+done
+[ "${#tests[@]}" -gt 0 ] || { echo "1..0 # SKIP no tests found"; exit 0; }
+
+# Tests for another architecture are absent from this run entirely.  Say how
+# many, so a run which covers less than the tree holds does not look like one
+# that covers all of it.
+for d in */; do
+	d=3D"${d%/}"
+	case "$d" in generic|"$KLP_TEST_ARCH") continue ;; esac
+	n=3D$(ls "$d"/test-*.sh 2>/dev/null | wc -l)
+	[ "$n" -gt 0 ] || continue
+	echo "# not run: $n test$( [ "$n" =3D 1 ] || echo s ) in $d/" \
+	     "(this run is $KLP_TEST_ARCH)"
+done
+
 echo "1..${#tests[@]}"
=20
 rc=3D0
diff --git a/tools/objtool/tests/test-basic.sh b/tools/objtool/tests/test-bas=
ic.sh
deleted file mode 100755
index 6b76996..0000000
--- a/tools/objtool/tests/test-basic.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/bash
-# SPDX-License-Identifier: GPL-2.0
-#
-# Only functions whose code changed get cloned into the patch.
-
-. "$(dirname "$0")/lib.sh"
-
-setup
-build_pair basic.c
-run_diff
-
-assert_patched     changed
-assert_not_patched untouched
-assert_section     ".init.klp_funcs"
-assert_section     ".init.klp_objects"
-
-pass "changed function cloned, unchanged function left alone"
