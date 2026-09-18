Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7A4C0436;
	Fri, 18 Sep 2026 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726584; cv=none; b=luFjhhyW1+Kjo9D4Wcf0hBh/yCFcolaEPlzccJQjV9Koglx3oKv2wODTKVMxkaoAP7b3NxxahULSOqTkrTe44Vxs6KsuXLWuIDQGYaXOxIR9UJuia4oBmmHIecMDEW77EIQTFhFhhxgq1Ehmmv7jQmTK/Qv3tk0VAFTkCfVsU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726584; c=relaxed/simple;
	bh=jUkZEzOfdreRkwh3jAFP2NArspmCUHkajuvVoRDY+k0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Wxra2nEIxVGPt6jwxnTG3ZvPPy0FCmxhoA6hYWMHbBkPykNlsEIGIZhQ9STaZsGOSzNDL2PBTmnpkO7ujiVo8wHcNRyE3L9dzbsN016T2bP4g5mnYCHCiVElLdrPBTFOmLPEenmInRc6TRXeEzfv7TUrD12akbVbkmiil7FA/Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nqd8rZfM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xln+9mqr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nqd8rZfM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xln+9mqr"
Date: Fri, 18 Sep 2026 10:16:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726575;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMD7+AgfKzy5CJkY7ZwGRHmyHRX0uZ4SEAHmiC1o8BA=;
	b=nqd8rZfMHe4RX+mNDbfjKOXqM70kNxV4vecEamvb1rjqhuX0o5vIAlhQOhBmCHuvZlVyeQ
	pOWleRwoW40o6MQ9dPfsv/FZF0tP7MJ+453X0zgKWHKRAsKXEmEaEKfI/R+lHagRZFXU6X
	rJZ8dmGqCRsLnif7KAYH1YNjybqXdn7zlcflXGH8IGrgLByLl1glHMbWSloxIuNEdsRxHA
	flDUxRdSLfOzXqiWybtRQxWasAPwLjQYfuUW1876vQnSGTbbdLsHA2quJ/v1i6Vy1vktGG
	TMCpUau+FxetS4duSlrN1hzX1ZPKhExH74A/13V1z3a5Qbcw1u3NKCOFx1A+Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726575;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMD7+AgfKzy5CJkY7ZwGRHmyHRX0uZ4SEAHmiC1o8BA=;
	b=xln+9mqrfl6nDBqjTAHYEHhDxZbBzrkc53dd+Q5iWIt/raTw3SVoktMJ4tqTz/SPNiHKL8
	+QRPD0TGMuR9rCCg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Classify klp test outcomes
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-5-song@kernel.org>
References: <20260916184351.2720310-5-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972657321.1720534.6678499199144387636.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     6fdf5af30f1e092b83df6b37ca63947babded5b4
Gitweb:        https://git.kernel.org/tip/6fdf5af30f1e092b83df6b37ca63947babd=
ed5b4
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:42:57 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:26 -07:00

objtool/klp: Classify klp test outcomes

A test could pass, fail, or skip, and the runner reported only the exit
status of the last one to fail.  Skips are the interesting case: they are
how a suite quietly stops testing anything.

Three kinds, and the runner counts them separately:

  declared   the test said in advance it does not apply here, e.g. gcc_only
             on a clang run.  Expected indefinitely.
  probe      the construct did not turn up in the built object this time.
             Weaker: one which becomes permanent is a fixture that stopped
             testing anything.
  undeclared counted as a failure.  A test which gives up for a reason it
             never declared is a hole, not an outcome.

xfail and xpass come with them, so a known failure is reported rather than
commented out and forgotten, and one which starts passing says so instead
of going quietly green.

The result line is what gets classified, not the whole of a test's output:
objtool warns on stderr and the runner captures it, and a stray line ahead
of the result would otherwise leave the exit status to decide -- counting
an expected failure, which exits 0, as a pass.

Every test owes the plan exactly one result line, so a substituted verdict
replaces the test's own rather than being printed beside it, and a test
which dies before reporting gets a result of its own instead of being
inferred from its exit status.

Also: a TAP version line, LC_ALL=3DC so the order tests run in and the
behaviour of grep's character ranges inside them do not depend on the
invoking shell's locale, and fail() on stdout with every other verdict.

Co-developed-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-5-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/lib.sh       |  67 ++++++++++++--
 tools/objtool/tests/run-tests.sh | 148 +++++++++++++++++++++++++-----
 2 files changed, 186 insertions(+), 29 deletions(-)

diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index fdea9b7..1531caa 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -139,8 +139,38 @@ test_name=3D"$(basename "$0" .sh)"
 workdir=3D
=20
 pass() { echo "ok - $test_name${1:+: $1}"; exit 0; }
-fail() { echo "not ok - $test_name: $1" >&2; exit 1; }
-skip() { echo "ok - $test_name # SKIP $1"; exit 0; }
+fail() { echo "not ok - $test_name: $1"; exit 1; }
+
+# Two kinds of skip, and the runner tells them apart.
+#
+#   declared_skip  the test said in advance it does not apply here, e.g.
+#                  gcc_only on a clang run.  Expected indefinitely.
+#   probe_skip     the construct did not turn up in the built object this
+#                  time.  Weaker: it may appear on another compiler version,
+#                  and one which becomes permanent is a fixture that quietly
+#                  stopped testing anything.
+#
+# A bare skip() is neither, and the runner counts it as a failure: a test wh=
ich
+# gives up for a reason it never declared is a hole, not an outcome.
+declared_skip() { echo "ok - $test_name # SKIP (declared) $*"; exit 0; }
+probe_skip()    { echo "ok - $test_name # SKIP (probe) $*"; exit 0; }
+skip()          { echo "ok - $test_name # SKIP $*"; exit 0; }
+
+# TAP directives.  A test which is known to fail reports it rather than being
+# commented out and forgotten, and one which starts passing again says so
+# instead of quietly going green: the expectation has to be removed by hand,
+# which is the point.
+xfail()
+{
+	echo "not ok - $test_name${1:+: $1} # TODO known failure"
+	exit 0
+}
+
+xpass()
+{
+	echo "ok - $test_name${1:+: $1} # TODO expected failure, but passed"
+	exit 1
+}
=20
 cleanup() { [ -n "$workdir" ] && rm -rf "$workdir"; }
=20
@@ -170,6 +200,23 @@ export_syms()
 	done
 }
=20
+# gcc_only / clang_only <reason>
+gcc_only()
+{
+	case "$($CC --version 2>/dev/null | head -1)" in
+	*[Gg][Cc][Cc]*)	return 0 ;;
+	esac
+	declared_skip "gcc only${1:+: $1}"
+}
+
+clang_only()
+{
+	case "$($CC --version 2>/dev/null | head -1)" in
+	*clang*)	return 0 ;;
+	esac
+	declared_skip "clang only${1:+: $1}"
+}
+
 # build_pair <fixture.c> [cflags...]
 build_pair()
 {
@@ -178,9 +225,9 @@ build_pair()
 	[ -f "$fixture" ] || fail "missing fixture $fixture"
=20
 	$CC $FIXTURE_CFLAGS "$@" -o "$workdir/orig.o" "$fixture" 2>"$workdir/cc.log=
" ||
-		skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
+		probe_skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
 	$CC $FIXTURE_CFLAGS "$@" -DPATCHED -o "$workdir/patched.o" "$fixture" 2>"$w=
orkdir/cc.log" ||
-		skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
+		probe_skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
 }
=20
 # run_diff [expected exit status]
@@ -226,16 +273,20 @@ partial_link()
=20
 # find_thinlto_toolchain
 #
-# Set $THIN_CC and $THIN_LD to a clang and lld from the same LLVM release.  A
+# Set $THIN_LD to an lld from the same LLVM release as $CC (or THIN_CC).  A
 # mismatched pair fails with "Invalid summary version", which reads like a
 # broken test rather than a broken environment.
+#
+# ThinLTO is clang-only; callers must use clang_only before calling this.
+# Only $CC (or an explicit THIN_CC override) is consulted -- the harness does
+# not search for a second compiler beside a gcc $CC.
 find_thinlto_toolchain()
 {
-	local cc ld ver
+	local cc ver ld
=20
-	for cc in "${THIN_CC:-}" "$CC" clang; do
+	for cc in "${THIN_CC:-}" "$CC"; do
 		[ -n "$cc" ] || continue
-		command -v "${cc%% *}" >/dev/null 2>&1 || continue
+		command -v "${cc%% *}" >/dev/null 2>&1 || return 1
=20
 		ver=3D$($cc -dumpversion 2>/dev/null | cut -d. -f1)
=20
diff --git a/tools/objtool/tests/run-tests.sh b/tools/objtool/tests/run-tests=
.sh
index 48728a9..6b937fc 100755
--- a/tools/objtool/tests/run-tests.sh
+++ b/tools/objtool/tests/run-tests.sh
@@ -8,13 +8,51 @@
 # apply here is not run rather than reporting a skip; what was left out is
 # reported once, as a comment, so differing coverage is still visible.
 #
+# A run covers one compiler and one architecture; CI runs the combinations.
 # The harness checks the environment once up front and fails the run if the
 # suite cannot execute, rather than letting every test skip and exit 0.
=20
 set -u
=20
+# Determinism: the order test-*.sh expands in, and how grep's character rang=
es
+# and sort's collation behave inside the tests, are all locale-dependent.  A
+# suite whose results depend on the invoking shell's locale is a suite whose
+# failures cannot be reproduced.
+export LC_ALL=3DC
+
+usage()
+{
+	cat <<EOF
+usage: $(basename "$0") [test...]
+
+Run the objtool klp tests for this architecture: everything in generic/, plus
+everything in the directory named for it.  With no arguments, runs all of th=
em.
+A test may be named with or without its "test-" prefix and ".sh" suffix, and=
 is
+looked for in both directories.
+
+Environment:
+    OBJTOOL       objtool binary to test (default ../objtool)
+    CC            compiler used to build fixtures (default gcc)
+    ARCH          architecture the tests are for (default: uname -m)
+
+A test which needs something of its own says so in its skip message.
+EOF
+	exit "${1:-0}"
+}
+
 cd "$(dirname "$0")" || exit 1
=20
+while [ $# -gt 0 ]; do
+	case "$1" in
+	-h|--help)	usage ;;
+	--)		shift; break ;;
+	-*)		echo "unknown option: $1" >&2; usage 1 ;;
+	*)		break ;;
+	esac
+done
+
+echo "TAP version 13"
+
 # Sourcing the harness runs its preflight, which decides which architecture
 # this run is for -- so the test list cannot be built before it has, and the
 # tests inherit the answers rather than working them out again.
@@ -23,31 +61,99 @@ cd "$(dirname "$0")" || exit 1
 dirs=3D( generic )
 [ -d "$KLP_TEST_ARCH" ] && dirs+=3D( "$KLP_TEST_ARCH" )
=20
-tests=3D()
-for d in "${dirs[@]}"; do
-	for t in "$d"/test-*.sh; do
-		[ -f "$t" ] && tests+=3D( "$t" )
+if [ $# -gt 0 ]; then
+	tests=3D()
+	for arg in "$@"; do
+		name=3D"test-${arg#test-}"; name=3D"${name%.sh}.sh"
+		found=3D
+		for d in "${dirs[@]}"; do
+			[ -f "$d/$name" ] || continue
+			[ -x "$d/$name" ] ||
+				{ echo "not executable: $d/$name" >&2; exit 1; }
+			tests+=3D( "$d/$name" ); found=3Dy
+		done
+		[ -n "$found" ] ||
+			{ echo "no such test for $KLP_TEST_ARCH: $arg" >&2; exit 1; }
 	done
-done
-[ "${#tests[@]}" -gt 0 ] || { echo "1..0 # SKIP no tests found"; exit 0; }
-
-# Tests for another architecture are absent from this run entirely.  Say how
-# many, so a run which covers less than the tree holds does not look like one
-# that covers all of it.
-for d in */; do
-	d=3D"${d%/}"
-	case "$d" in generic|"$KLP_TEST_ARCH") continue ;; esac
-	n=3D$(ls "$d"/test-*.sh 2>/dev/null | wc -l)
-	[ "$n" -gt 0 ] || continue
-	echo "# not run: $n test$( [ "$n" =3D 1 ] || echo s ) in $d/" \
-	     "(this run is $KLP_TEST_ARCH)"
-done
+else
+	tests=3D()
+	for d in "${dirs[@]}"; do
+		for t in "$d"/test-*.sh; do
+			[ -f "$t" ] && tests+=3D( "$t" )
+		done
+	done
+	[ "${#tests[@]}" -gt 0 ] ||
+		{ echo "1..0 # SKIP no tests found"; exit 0; }
+
+	# Tests for another architecture are absent from this run entirely.  Say
+	# how many, so a run which covers less than the tree holds does not look
+	# like one that covers all of it.
+	for d in */; do
+		d=3D"${d%/}"
+		case "$d" in generic|"$KLP_TEST_ARCH") continue ;; esac
+		n=3D$(ls "$d"/test-*.sh 2>/dev/null | wc -l)
+		[ "$n" -gt 0 ] || continue
+		echo "# not run: $n test$( [ "$n" =3D 1 ] || echo s ) in $d/" \
+		     "(this run is $KLP_TEST_ARCH)"
+	done
+fi
=20
 echo "1..${#tests[@]}"
=20
-rc=3D0
+pass=3D0 fail=3D0 static_skip=3D0 probe_skip=3D0 xfail=3D0 xpass=3D0
+
 for t in "${tests[@]}"; do
-	./"$t" || rc=3D1
+	out=3D"$(./"$t" 2>&1)"
+	rc=3D$?
+
+	# A test prints one result line, but it is not necessarily the only
+	# thing it prints: objtool warns on stderr, and the runner captures
+	# that.  Classify the result line itself rather than the whole of the
+	# output, or a stray line ahead of it makes every pattern below miss and
+	# the exit status decide -- which would count an expected failure, which
+	# exits 0, as a pass.
+	result=3D"$(printf '%s\n' "$out" | grep -E '^(ok|not ok)' | tail -1)"
+	rest=3D"$(printf '%s\n' "$out" | grep -Ev '^(ok|not ok)')"
+
+	# Classify from the result line, not the exit status: a skip and a pass
+	# both exit 0, and telling them apart is the point of counting.
+	#
+	# The two skip kinds differ in what they promise.  A static skip was
+	# declared before the test ran ("clang does not do this"), so it is
+	# expected indefinitely.  A probe skip means the construct did not turn
+	# up this time, which is weaker and worth watching: one that becomes
+	# permanent is a fixture that quietly stopped testing anything.
+	case "$result" in
+	*"# SKIP (declared)"*)	static_skip=3D$((static_skip + 1)) ;;
+	*"# SKIP (probe)"*)	probe_skip=3D$((probe_skip + 1)) ;;
+	*"# SKIP"*)
+		# An undeclared skip: the test gave up for a reason it never
+		# said it might.  That is a hole, not an expected outcome.
+		#
+		# Replace the line rather than adding one.  Every test owes the
+		# plan exactly one result, and a consumer counting them is
+		# entitled to say so when the totals disagree.
+		rest=3D"$rest${rest:+$'\n'}was: $result"
+		result=3D"not ok - $(basename "$t" .sh): undeclared skip"
+		result=3D"$result (use gcc_only/clang_only or require_input_*)"
+		fail=3D$((fail + 1)) ;;
+	"not ok"*"# TODO"*)	xfail=3D$((xfail + 1)) ;;
+	"ok"*"# TODO"*)		xpass=3D$((xpass + 1)) ;;
+	"not ok"*)		fail=3D$((fail + 1)) ;;
+	"ok"*)			pass=3D$((pass + 1)) ;;
+	*)
+		# No result line at all: the test died before reporting.
+		rest=3D"$rest${rest:+$'\n'}exited $rc without a result line"
+		result=3D"not ok - $(basename "$t" .sh): no TAP result"
+		fail=3D$((fail + 1)) ;;
+	esac
+
+	echo "$result"
+	[ -n "$rest" ] && printf '%s\n' "$rest" | sed 's/^[^#]/# &/'
+
 done
=20
-exit $rc
+echo "# pass:$pass fail:$fail static-skip:$static_skip" \
+     "probe-skip:$probe_skip xfail:$xfail xpass:$xpass"
+
+[ "$fail" =3D 0 ] && [ "$xpass" =3D 0 ]
