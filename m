Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0FD469859;
	Mon, 21 Sep 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982945; cv=none; b=jieGHbNryKZZTO2AQY3A+iLpgsmCd7w9HWvDZP2Jt5QaMCiZ8RY51b7diQwwyBzGzBQTwcLazvBHpwfw+wBcTRkG0kMdwDzqeVlp7NJ7ikGqX2jzyWr//VWIoM9HXN+djGs4gNxip2B7rF42bWg+4CsHB0nlNpB7h1b/IZhPwBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982945; c=relaxed/simple;
	bh=8Com1Y1RD9VfPyf8gAx7fUukaoUxHY9NeKu9opIWjYM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Fov6JZZNPHaRbb7qM4afxMkxc9F7lpK14uYoUuixhHf20nlbNwvZ+2ZEdkQdaPP8wj99v1PHNuzLJy7+hS+sQoQi/dLJY0iUPIQz2tAQqd7XMhkfCVNIVYJWFtJcteDIFIhk7FGcA3P8SO7MQM2y9/6DeEg0k7y9o6dgOb9xkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CSzWiV+c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LIQx9VLK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CSzWiV+c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LIQx9VLK"
Date: Mon, 21 Sep 2026 09:28:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982933;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZLZzf0XWnCLWbw80HNSFVAokHmULMNc0vaILtbdFvc=;
	b=CSzWiV+cgINGbvlgeZpX1qiUJm1A4QOsVE9CXo5cy4Ec5lvrNHQazY2wHTMA0Es/k+CZ+d
	H0fJGxzi46Uzn0YtJof9NiP4wusbVnMmPvZJjzajxWyWAtpVYnyX2PldW6v1Pxzei4xC4P
	s8fhzp3GEh9dBH2X78ejc/7xmIzzKpZl5S0+eb7KvV9U3peJXTNYM8CVr7WUtqARNARolj
	7DyAVppFWeoP7b2xcSs8KISAs3FA+ADUixEZ05DvWY9YYCphKgvSGMg54PMm5YCYj1m7rq
	4pXcrORsGuCs42URtdjhjvaRZm99Te421h3peKf5GxCo1iWYDrp8UL9lMq3p9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982933;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZLZzf0XWnCLWbw80HNSFVAokHmULMNc0vaILtbdFvc=;
	b=LIQx9VLKPGLf1EUvoijsvpbSAv+woKDEQ5cSdCfVEKuLvOsr22sc4WMz6i6v0bTJO2IUE/
	aipgVqejXryzUQAA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Check the klp test environment once,
 before any test
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-3-song@kernel.org>
References: <20260916184351.2720310-3-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998293177.2819794.11430436709958672929.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     c009fabc865200029173eb40db62f407225043d4
Gitweb:        https://git.kernel.org/tip/c009fabc865200029173eb40db62f407225=
043d4
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:42:55 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 10:54:35 +02:00

objtool/klp: Check the klp test environment once, before any test

Every test checked for itself that objtool exists, was built with klp
support, and that $CC runs.  Three problems with that: it is the same work
done 40 times, a missing objtool reads as a per-test skip rather than as a
suite which cannot run, and a run in which everything skipped still exits
0.

Do it once, before any test, in klp_preflight() in lib.sh, and export the
answers where the tests can read them.  If the suite cannot run the whole
run fails and says why; a test which gets as far as running can assume its
environment.

Nothing is written down, so nothing can go stale.  Sourcing lib.sh runs the
checks, which means a test run by hand establishes its own answers rather
than inheriting those of some earlier run with a different CC, and a test
is never handed an empty value for where objtool is or which architecture
it is on: either the exports are set or the run has already failed.

preflight answers only whether the suite can run at all -- not what the
compiler is capable of.  A test needing a particular compiler feature
probes for it and skips; that costs one compile and keeps the reason next
to the test that has to justify it.

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-3-song@kernel.org
---
 tools/objtool/Makefile           |   3 +-
 tools/objtool/tests/lib.sh       | 124 ++++++++++++++++++++++++------
 tools/objtool/tests/run-tests.sh |   7 ++-
 3 files changed, 112 insertions(+), 22 deletions(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 0f34abb..e9a4cc8 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -154,7 +154,8 @@ mrproper: clean
 	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
=20
 tests: $(OBJTOOL)
-	$(Q)OBJTOOL=3D$(abspath $(OBJTOOL)) $(srctree)/tools/objtool/tests/run-test=
s.sh
+	$(Q)OBJTOOL=3D$(abspath $(OBJTOOL)) ARCH=3D$(ARCH) CROSS_COMPILE=3D$(CROSS_=
COMPILE) \
+		$(srctree)/tools/objtool/tests/run-tests.sh
=20
 FORCE:
=20
diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 7b29db7..46bdb98 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -11,8 +11,104 @@
 TESTS_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
 FIXTURES_DIR=3D"$TESTS_DIR/fixtures"
=20
+# The kernel's convention: CROSS_COMPILE is the one knob, with per-tool
+# overrides for what it does not cover.  objtool itself is always a host bin=
ary
+# -- it is built with HOSTCC and only reads ELF -- so an arm64 machine can r=
un
+# the x86 tests against x86 objects given a compiler that emits them.
+#
+# readelf reads any target, so it rarely needs overriding, and either GNU
+# readelf or llvm-readelf will do: the assertions match on fields rather than
+# on columns, and where the two spell something differently -- "OS [0xff20]"
+# against "OS[0xff20]" for SHN_LIVEPATCH -- they accept both.  BFD's objcopy=
 is
+# usually built for the host's target alone, and llvm-objcopy is the
+# target-agnostic replacement.
+CROSS_COMPILE=3D"${CROSS_COMPILE:-}"
+CC=3D"${CC:-${CROSS_COMPILE}gcc}"
+LD=3D"${LD:-${CROSS_COMPILE}ld}"
+READELF=3D"${READELF:-${CROSS_COMPILE}readelf}"
+OBJCOPY=3D"${OBJCOPY:-${CROSS_COMPILE}objcopy}"
+
 OBJTOOL=3D"${OBJTOOL:-$TESTS_DIR/../objtool}"
-CC=3D"${CC:-gcc}"
+
+# klp_preflight
+#
+# Check the environment once, before any test runs, and report what was foun=
d.
+#
+klp_preflight()
+{
+	local tmp tool cc_version host cc_arch
+
+	bail() { echo "Bail out! $*" >&2; exit 1; }
+
+	# A relative $OBJTOOL is relative to the objtool directory, not tests/.
+	[ -x "$OBJTOOL" ] || [ ! -x "$TESTS_DIR/../$OBJTOOL" ] ||
+		OBJTOOL=3D"$TESTS_DIR/../$OBJTOOL"
+
+	[ -x "$OBJTOOL" ] ||
+		bail "objtool not found at '$OBJTOOL' -- build it first"
+
+	# run_diff() runs objtool from inside the test's working directory, so
+	# a relative path would resolve against that instead.
+	OBJTOOL=3D"$(realpath "$OBJTOOL")"
+
+	"$OBJTOOL" klp 2>&1 | grep -q checksum ||
+		bail "objtool was built without klp support; install libxxhash (>=3D 0.8) =
and rebuild"
+
+	command -v "${CC%% *}" >/dev/null || bail "compiler not found: $CC"
+
+	for tool in "$READELF" "$OBJCOPY" "$LD"; do
+		command -v "${tool%% *}" >/dev/null || bail "$tool not found"
+	done
+
+	tmp=3D"$(mktemp -d)" || bail "mktemp failed"
+	echo 'int probe(void) { return 0; }' > "$tmp/probe.c"
+	$CC -c -o "$tmp/probe.o" "$tmp/probe.c" 2>/dev/null ||
+		{ rm -rf "$tmp"; bail "$CC cannot compile a trivial object"; }
+
+	# $CC, $ARCH and objtool have to agree about the target, and cross runs
+	# are where they stop agreeing: plain "CC=3Dclang ARCH=3Dx86_64" on an arm64
+	# box selects the x86 tests and then builds arm64 objects, because clang
+	# needs --target=3D to emit anything but the host's.
+	#
+	# Ask objtool rather than comparing machine names.  It rejects an object
+	# it was not built for -- "unexpected ELF machine type" -- so one check
+	# covers every way the three can disagree, and says so once instead of
+	# failing every test for the same reason.
+	"$OBJTOOL" klp checksum "$tmp/probe.o" >/dev/null 2>&1 ||
+		{ rm -rf "$tmp"
+		  bail "objtool rejects an object built by '$CC'; they target" \
+		       "different architectures (set CROSS_COMPILE, or" \
+		       "--target=3D for clang)"; }
+
+	# BFD objcopy is usually built for the host's target alone, and
+	# checksum_of() needs it to read the object under test.
+	$OBJCOPY -O binary --only-section=3D.text "$tmp/probe.o" "$tmp/probe.bin" 2=
>/dev/null ||
+		{ rm -rf "$tmp"
+		  bail "$OBJCOPY cannot read objects built by '$CC'; install" \
+		       "binutils-multiarch or set OBJCOPY=3Dllvm-objcopy"; }
+	# $ARCH only chooses which directory of tests runs, so it can disagree
+	# with what $CC builds without objtool noticing -- and the result is the
+	# wrong set of tests, quietly.
+	case "$($READELF -hW "$tmp/probe.o" | sed -n 's/.*Machine: *//p')" in
+	*X86-64*|*Intel*80386*)	cc_arch=3Dx86 ;;
+	*AArch64*)		cc_arch=3Darm64 ;;
+	*)			cc_arch=3D ;;
+	esac
+	rm -rf "$tmp"
+
+	KLP_TEST_PREFLIGHT=3Ddone
+	export OBJTOOL CC KLP_TEST_PREFLIGHT
+
+	cc_version=3D"$($CC --version 2>/dev/null | head -1)"
+	cat <<EOF
+# preflight
+#   objtool   $OBJTOOL (klp: yes)
+#   compiler  $cc_version
+#   arch      $KLP_TEST_ARCH$([ "$arch" =3D "$host" ] || echo "  (host $host=
, cross)")
+EOF
+}
+
+[ -n "${KLP_TEST_PREFLIGHT:-}" ] || klp_preflight
=20
 # klp-build compiles the kernel this way; klp diff needs per-symbol sections=
 to
 # extract individual functions.
@@ -30,23 +126,9 @@ cleanup() { [ -n "$workdir" ] && rm -rf "$workdir"; }
 # setup [exported symbol...]
 setup()
 {
-	# A relative $OBJTOOL is relative to the objtool directory, not to the
-	# tests which run from tests/.
-	[ -x "$OBJTOOL" ] || [ ! -x "$TESTS_DIR/../$OBJTOOL" ] ||
-		OBJTOOL=3D"$TESTS_DIR/../$OBJTOOL"
-
-	# Not finding objtool is a broken invocation, not an environment which
-	# cannot run the test.  Skipping here would read as a pass.
-	[ -x "$OBJTOOL" ] || fail "objtool not found at '$OBJTOOL', build it first"
-
-	# run_diff() runs objtool from inside the test's working directory, so
-	# a relative path would resolve against that instead.
-	OBJTOOL=3D"$(realpath "$OBJTOOL")"
-
-	"$OBJTOOL" klp 2>&1 | grep -q checksum ||
-		skip "objtool built without klp support (needs libxxhash)"
-	command -v "${CC%% *}" >/dev/null || skip "no compiler ($CC)"
-
+	# The environment was checked once when this file was sourced, so there
+	# is nothing to verify here: objtool exists at the resolved path, has
+	# klp support, and $CC works.
 	workdir=3D"$(mktemp -d)" || fail "mktemp failed"
 	trap cleanup EXIT
=20
@@ -155,9 +237,9 @@ find_thinlto_toolchain()
 	return 1
 }
=20
-out_sections() { readelf -S -W "$workdir/out.o" 2>/dev/null; }
-out_relocs()   { readelf -r -W "$workdir/out.o" 2>/dev/null; }
-out_symbols()  { readelf -s -W "$workdir/out.o" 2>/dev/null; }
+out_sections() { $READELF -S -W "$workdir/out.o" 2>/dev/null; }
+out_relocs()   { $READELF -r -W "$workdir/out.o" 2>/dev/null; }
+out_symbols()  { $READELF -s -W "$workdir/out.o" 2>/dev/null; }
 diff_log()     { cat "$workdir/diff.log"; }
=20
 assert_section()
diff --git a/tools/objtool/tests/run-tests.sh b/tools/objtool/tests/run-tests=
.sh
index ab1dea5..f6a3e1b 100755
--- a/tools/objtool/tests/run-tests.sh
+++ b/tools/objtool/tests/run-tests.sh
@@ -2,6 +2,9 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Run the objtool klp tests.  Each test-*.sh prints one TAP result line.
+#
+# The harness checks the environment once up front and fails the run if the
+# suite cannot execute, rather than letting every test skip and exit 0.
=20
 set -u
=20
@@ -10,6 +13,10 @@ cd "$(dirname "$0")" || exit 1
 tests=3D( test-*.sh )
 [ "${tests[0]}" =3D "test-*.sh" ] && { echo "1..0 # SKIP no tests found"; ex=
it 0; }
=20
+# Sourcing the harness runs its preflight, and exports what it found so the
+# tests inherit it rather than working it out again.
+. ./lib.sh
+
 echo "1..${#tests[@]}"
=20
 rc=3D0
