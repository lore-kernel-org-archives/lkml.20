Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD124499F2D;
	Mon, 21 Sep 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982925; cv=none; b=J8ch+3kh2+UPlz/4+5MnY86NIA3uYz9GqGDcX44UUe4FVHJ1oOy/bffMlGb5hbZDgIV0kZcPQWHKDkUXMaoGeoBMiJ5m54SCci37QFItWaregXTrGx7HUAvdLkd0jN8Ad6E5pBaGtZEaSdEW1BJhSxvfVrtV599K9zAbG3R8iy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982925; c=relaxed/simple;
	bh=cHlTQzELhMt3115RdjG2y6VZi4o8OJAMgisMWdk+bTk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Uehdpcychhu1ACwmKl6rpYFE9Y/L4vJmUFMjk3v26NpUgTdrD1bOYNcQANwrZQJPEj4Z1d1S5ip1OYjpbGXQj+pDEetfLNJ4ECwlMbYk3n0f+N4beIX1WYcT+FxgJoYEN5CJgNVQQs3D4oZp4I8s2ivqQlZ8Z0c3lIyHo/X1k1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yCglJDmc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oGLSMAdV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yCglJDmc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oGLSMAdV"
Date: Mon, 21 Sep 2026 09:28:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982921;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCL5xnM3gMfghOk74wrZBEJdnOy8jBxSp4JKugJTUFA=;
	b=yCglJDmcnSXlpYtoFTtQkfN/jtdhZbb25+mE7WkABFqvKiA34ot9kucvBtDNI8DdQW0q3U
	wS+lvcdy1CMc838TTMBcMc1LMjEVNC78XGCtGQJtorOI7ePHXAgi1s1mHNi2/7FvSI+NFE
	Vp5y8V15DjtKLr5czvcXSsCXKBoOwcdTbrzMgLDfRYUlz/0htFEcECdCsYgsBu83Ekc2FH
	rYPCOWbbmZNPIKobOfsNYindAbq80Bm1rp3TUG4xyIVjyOJsNb+Pr9t6363RoUc+fsRyeF
	ar8QmU7qrHSjHXblrmoJfem1rRsGtvh0FnJP3Ck8iOI1bGX5T6gil9ki43JP+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982921;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCL5xnM3gMfghOk74wrZBEJdnOy8jBxSp4JKugJTUFA=;
	b=oGLSMAdVAGmnqJqRcUcRWIAQB5bJcF1RGFmZqQqGbA+3oD8QeE0nUDO2fhfgNIflgbF60I
	K1J4UjCRGzs9uXBA==
From: "tip-bot2 for Joe Lawrence" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool: Keep failing test workdirs by default
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-11-song@kernel.org>
References: <20260916184351.2720310-11-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998291948.2819794.11061150499284303367.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     9b11acaad1a63eddf4a9bf50dc9b90183bf037e1
Gitweb:        https://git.kernel.org/tip/9b11acaad1a63eddf4a9bf50dc9b90183bf=
037e1
Author:        Joe Lawrence <joe.lawrence@redhat.com>
AuthorDate:    Wed, 16 Sep 2026 11:43:03 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:01:39 +02:00

objtool: Keep failing test workdirs by default

The klp test runner deletes each test's working directory when the test
finishes.  On failure that removes diff.log, out.o and the fixture objects
before the developer can look at them, and the only hint was to re-run
(something) with --keep:

  $ make -C tools/objtool tests
  ...
  not ok - test-special-section: expected section '.kcfi_traps' in output
  ...
  # pass:49 fail:1 static-skip:1 probe-skip:0 xfail:0 xpass:0
  # re-run with --keep to hold on to what a failing test built

Change the default behavior to save failing test working directories. This
is friendlier to the drive-by tester.  Provide the power-user with a KEEP
Makefile variable that can optionally retain 'all' or 'none' of those
directories.  run-tests.sh --keep remains an alias for KEEP=3Dall.

Now that a run can be holding objects worth looking at, say where they are
when it is cut short.  A Ctrl-C left the run directory behind -- the tests
clean up after themselves as they exit, but the two levels the runner made
are its own to answer for, and nothing removed them.  Take them away from
a trap if the tests left them empty, and print the path if they did not:
under the new default the test that was running keeps what it had built,
and that is the run most worth being told about.

The trap only ever rmdirs, so it cannot overrule what a test decided to
keep; the same helper now serves the end of a normal run.

Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-11-song@kernel.org
---
 tools/objtool/Documentation/klp-test-design.txt | 14 +-
 tools/objtool/Makefile                          |  2 +-
 tools/objtool/tests/lib.sh                      | 62 +++++++++--
 tools/objtool/tests/run-tests.sh                | 92 +++++++++++++---
 4 files changed, 136 insertions(+), 34 deletions(-)

diff --git a/tools/objtool/Documentation/klp-test-design.txt b/tools/objtool/=
Documentation/klp-test-design.txt
index ec56bfb..67d20bf 100644
--- a/tools/objtool/Documentation/klp-test-design.txt
+++ b/tools/objtool/Documentation/klp-test-design.txt
@@ -199,10 +199,11 @@ source layout::
         generic/test-basic/{orig.o,patched.o,out.o,Module.symvers,...}
         x86/test-kcfi/...
=20
-``--keep`` leaves it and reports the one path.  Otherwise each test removes =
its
-own directory and the runner ``rmdir``s the run's -- which fails if anything
-was left behind, so a test which dies without cleaning up is reported rather
-than silently leaking.
+By default (``KEEP=3Dfailed``) only failing tests keep their directories; the
+runner reports where they are.  ``KEEP=3Dall`` keeps every test's directory;
+``KEEP=3Dnone`` removes them all.  The runner ``rmdir``s the run directory w=
hen
+it is empty -- which fails if anything was left behind unexpectedly, so a te=
st
+which dies without cleaning up is reported rather than silently leaking.
=20
=20
 Running
@@ -216,7 +217,10 @@ Running
     CC=3Dclang make -C tools/objtool tests  # the other toolchain
     LLVM=3D1 make -C tools/objtool tests    # and its binutils too
=20
-    tools/objtool/tests/run-tests.sh --keep basic   # one test, keep its obj=
ects
+    make -C tools/objtool tests KEEP=3Dall    # keep every test's workdir
+    make -C tools/objtool tests KEEP=3Dnone   # remove all workdirs
+
+    tools/objtool/tests/run-tests.sh basic  # one test; failures kept by def=
ault
=20
 A run covers one compiler and one architecture; CI runs the combinations.
=20
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index e9a4cc8..d3db966 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -155,7 +155,7 @@ mrproper: clean
=20
 tests: $(OBJTOOL)
 	$(Q)OBJTOOL=3D$(abspath $(OBJTOOL)) ARCH=3D$(ARCH) CROSS_COMPILE=3D$(CROSS_=
COMPILE) \
-		$(srctree)/tools/objtool/tests/run-tests.sh
+		KEEP=3D$(KEEP) $(srctree)/tools/objtool/tests/run-tests.sh
=20
 FORCE:
=20
diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 294b99c..4da168d 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -163,8 +163,8 @@ workdir=3D
 orig_obj=3Dorig.o
 patched_obj=3Dpatched.o
=20
-pass() { echo "ok - $test_name${1:+: $1}"; exit 0; }
-fail() { echo "not ok - $test_name: $1"; exit 1; }
+pass() { KLP_TEST_REPORTED=3D1; echo "ok - $test_name${1:+: $1}"; exit 0; }
+fail() { KLP_TEST_FAILED=3D1; echo "not ok - $test_name: $*"; exit 1; }
=20
 # Two kinds of skip, and the runner tells them apart.
 #
@@ -177,8 +177,19 @@ fail() { echo "not ok - $test_name: $1"; exit 1; }
 #
 # A bare skip() is neither, and the runner counts it as a failure: a test wh=
ich
 # gives up for a reason it never declared is a hole, not an outcome.
-declared_skip() { echo "ok - $test_name # SKIP (declared) $*"; exit 0; }
-probe_skip()    { echo "ok - $test_name # SKIP (probe) $*"; exit 0; }
+declared_skip()
+{
+	KLP_TEST_REPORTED=3D1
+	echo "ok - $test_name # SKIP (declared) $*"
+	exit 0
+}
+
+probe_skip()
+{
+	KLP_TEST_REPORTED=3D1
+	echo "ok - $test_name # SKIP (probe) $*"
+	exit 0
+}
 skip()          { echo "ok - $test_name # SKIP $*"; exit 0; }
=20
 # TAP directives.  A test which is known to fail reports it rather than being
@@ -187,26 +198,55 @@ skip()          { echo "ok - $test_name # SKIP $*"; exi=
t 0; }
 # which is the point.
 xfail()
 {
+	KLP_TEST_REPORTED=3D1
 	echo "not ok - $test_name${1:+: $1} # TODO known failure"
 	exit 0
 }
=20
 xpass()
 {
+	KLP_TEST_FAILED=3D1
 	echo "ok - $test_name${1:+: $1} # TODO expected failure, but passed"
 	exit 1
 }
=20
+# cleanup [exit]
+#
+# Called with "exit" from the trap, when the test is over and what it built =
may
+# be worth keeping.  Called bare by a test which has finished with one segme=
nt
+# and is about to setup() another: that one is done with, whatever the outco=
me
+# of the segments still to come, so it goes.
 cleanup()
 {
 	[ -n "$workdir" ] || return 0
=20
-	if [ -n "${KLP_TEST_KEEP:-}" ]; then
-		[ -n "${KLP_TEST_WORKDIR:-}" ] || echo "# kept $workdir"
-		return 0
-	fi
-
-	rm -rf "$workdir"
+	# run-tests.sh exports KLP_TEST_KEEP, having validated it; a test run on
+	# its own reads KEEP itself, so the same setting means the same thing
+	# either way.
+	case "${KLP_TEST_KEEP:-${KEEP:-failed}}" in
+	all)	return 0 ;;
+	none)	rm -rf "$workdir" ;;
+	failed|*)
+		[ "${1:-}" =3D exit ] || {
+			rm -rf "$workdir"
+			return 0
+		}
+		# Keep what the runner is going to point at.  It counts as a
+		# failure anything which did not report an expected outcome --
+		# including a test which died before printing one, and an
+		# undeclared skip -- and none of those set KLP_TEST_FAILED, so
+		# the question to ask is whether a result was reported at all.
+		# An exit status cannot answer it: a test killed by a signal
+		# runs this trap with the status of whatever ran last.
+		[ -n "${KLP_TEST_REPORTED:-}" ] && [ -z "${KLP_TEST_FAILED:-}" ] && {
+			rm -rf "$workdir"
+			return 0
+		}
+		# run on its own there is no runner to say where it was kept
+		[ -n "${KLP_TEST_WORKDIR:-}" ] ||
+			echo "# kept $workdir"
+		;;
+	esac
 }
=20
 # setup [exported symbol...]
@@ -218,7 +258,7 @@ setup()
 	else
 		workdir=3D"$(mktemp -d)" || fail "mktemp failed"
 	fi
-	trap cleanup EXIT
+	trap 'cleanup exit' EXIT
=20
 	export_syms "$@"
 }
diff --git a/tools/objtool/tests/run-tests.sh b/tools/objtool/tests/run-tests=
.sh
index e6f1ac1..c0762f5 100755
--- a/tools/objtool/tests/run-tests.sh
+++ b/tools/objtool/tests/run-tests.sh
@@ -31,13 +31,15 @@ A test may be named with or without its "test-" prefix an=
d ".sh" suffix, and is
 looked for in both directories.
=20
 Options:
-    -k, --keep    do not delete each test's working directory; print its pat=
h,
-                  so the objects a failing test built can be looked at
+    -k, --keep    same as KEEP=3Dall (see below)
=20
 Environment:
     OBJTOOL       objtool binary to test (default ../objtool)
     CC            compiler used to build fixtures (default gcc)
     ARCH          architecture the tests are for (default: uname -m)
+    KEEP          failed  keep only failing tests (default)
+                  all     keep every test's working directory
+                  none    remove all working directories
=20
 A test which needs something of its own says so in its skip message.
 EOF
@@ -46,16 +48,28 @@ EOF
=20
 cd "$(dirname "$0")" || exit 1
=20
+keep_from_args=3D
 while [ $# -gt 0 ]; do
 	case "$1" in
 	-h|--help)	usage ;;
-	-k|--keep)	export KLP_TEST_KEEP=3D1; shift ;;
+	-k|--keep)	keep_from_args=3Dall; shift ;;
 	--)		shift; break ;;
 	-*)		echo "unknown option: $1" >&2; usage 1 ;;
 	*)		break ;;
 	esac
 done
=20
+KLP_TEST_KEEP=3D"${KEEP:-failed}"
+[ -n "$keep_from_args" ] && KLP_TEST_KEEP=3D"$keep_from_args"
+case "$KLP_TEST_KEEP" in
+all|none|failed) ;;
+*)
+	echo "invalid KEEP=3D$KLP_TEST_KEEP (want failed, all, or none)" >&2
+	exit 1
+	;;
+esac
+export KLP_TEST_KEEP
+
 echo "TAP version 13"
=20
 # Sourcing the harness runs its preflight, which decides which architecture
@@ -109,9 +123,33 @@ fi
 rundir=3D"$(mktemp -d "${TMPDIR:-/tmp}/klp-tests.XXXXXXXX")" ||
 	{ echo "Bail out! cannot create a working directory" >&2; exit 1; }
=20
+# The run's own two levels: each test's directory, and the one per source
+# directory holding them.  Take them away if the tests left them empty, and
+# say so if they did not.  Either rmdir may fail -- the glob stays unexpanded
+# when nothing was created -- so ask the directory itself rather than trusti=
ng
+# the status.  Never rm -rf: what to keep is the tests' decision, made in
+# cleanup() as each one exits, and this must not overrule it.
+reap_rundir()
+{
+	rmdir "$rundir"/*/ 2>/dev/null
+	rmdir "$rundir" 2>/dev/null
+	[ -d "$rundir" ]
+}
+
+# An interrupted run has the same directory to answer for, and the tests it
+# never reached will not clean up on their way out.  The one it was running
+# has, and under the default it kept what it had built, so say where.
+interrupted()
+{
+	reap_rundir && echo "# interrupted; what was built is in $rundir"
+	exit 130
+}
+trap interrupted INT TERM HUP
+
 echo "1..${#tests[@]}"
=20
 pass=3D0 fail=3D0 static_skip=3D0 probe_skip=3D0 xfail=3D0 xpass=3D0
+failed_dirs=3D()
=20
 for t in "${tests[@]}"; do
 	out=3D"$(KLP_TEST_WORKDIR=3D"$rundir/${t%.sh}" ./"$t" 2>&1)"
@@ -147,16 +185,16 @@ for t in "${tests[@]}"; do
 		rest=3D"$rest${rest:+$'\n'}was: $result"
 		result=3D"not ok - $(basename "$t" .sh): undeclared skip"
 		result=3D"$result (use gcc_only/clang_only or require_input_*)"
-		fail=3D$((fail + 1)) ;;
+		fail=3D$((fail + 1)); failed_dirs+=3D( "$rundir/${t%.sh}" ) ;;
 	"not ok"*"# TODO"*)	xfail=3D$((xfail + 1)) ;;
-	"ok"*"# TODO"*)		xpass=3D$((xpass + 1)) ;;
-	"not ok"*)		fail=3D$((fail + 1)) ;;
+	"ok"*"# TODO"*)		xpass=3D$((xpass + 1)); failed_dirs+=3D( "$rundir/${t%.sh}=
" ) ;;
+	"not ok"*)		fail=3D$((fail + 1)); failed_dirs+=3D( "$rundir/${t%.sh}" ) ;;
 	"ok"*)			pass=3D$((pass + 1)) ;;
 	*)
 		# No result line at all: the test died before reporting.
 		rest=3D"$rest${rest:+$'\n'}exited $rc without a result line"
 		result=3D"not ok - $(basename "$t" .sh): no TAP result"
-		fail=3D$((fail + 1)) ;;
+		fail=3D$((fail + 1)); failed_dirs+=3D( "$rundir/${t%.sh}" ) ;;
 	esac
=20
 	echo "$result"
@@ -167,15 +205,35 @@ done
 echo "# pass:$pass fail:$fail static-skip:$static_skip" \
      "probe-skip:$probe_skip xfail:$xfail xpass:$xpass"
=20
-# A failure is the one time the objects matter, and by default they are
-# already gone.  Say so then rather than in the usage text nobody reads while
-# something is broken.
-if [ -n "${KLP_TEST_KEEP:-}" ]; then
-	echo "# working directories kept in $rundir -- inspect, then rm -rf it"
-elif ! rmdir "$rundir"/*/ "$rundir" 2>/dev/null; then
-	echo "# $rundir was not empty; a test did not clean up after itself"
-elif [ "$fail" !=3D 0 ] || [ "$xpass" !=3D 0 ]; then
-	echo "# re-run with --keep to hold on to what a failing test built"
-fi
+case "$KLP_TEST_KEEP" in
+all)
+	echo "# keep=3Dall: workdirs kept in $rundir"
+	echo "# inspect: diff.log, readelf -S out.o under each test-* subdirectory"
+	echo "# cleanup: rm -rf $rundir"
+	;;
+failed)
+	if [ "${#failed_dirs[@]}" -gt 0 ]; then
+		echo "# keep=3Dfailed: ${#failed_dirs[@]} failing test(s) kept under $rund=
ir:"
+		for d in "${failed_dirs[@]}"; do
+			echo "#   ${d#"$rundir"/}/"
+		done
+		echo "# inspect: diff.log  readelf -S out.o"
+		echo "# one test: $PWD/run-tests.sh <name>"
+		echo "# cleanup: rm -rf $rundir"
+	elif reap_rundir; then
+		echo "# $rundir was not empty;" \
+		     "a test did not clean up after itself"
+	fi
+	;;
+none)
+	if reap_rundir; then
+		echo "# $rundir was not empty;" \
+		     "a test did not clean up after itself"
+	elif [ "$fail" !=3D 0 ] || [ "$xpass" !=3D 0 ]; then
+		echo "# keep=3Dnone: artifacts were removed" \
+		     "(re-run with KEEP=3Dfailed or KEEP=3Dall)"
+	fi
+	;;
+esac
=20
 [ "$fail" =3D 0 ] && [ "$xpass" =3D 0 ]
