Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFDE4BE44C;
	Fri, 18 Sep 2026 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726579; cv=none; b=SJfHGkWolUly5wMdoaukABE8pFJT4uhYlrDhuuLpY8Q/PisjD9kQ4Ht1ZWbGktNFFkckPAQrnC2V1YW3CqtR2ypgSd0VcO4AZUE0MMj3B1/Qg5lKLQDE5S0tGtmk+q/j+wQWMCkd+KIDOlSa7PSwpRg+cQn/1qtKFJp9RPzMvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726579; c=relaxed/simple;
	bh=bCBtGaooq1SeTkGZP537t4xB/O+UN683GWGCqjBxWYw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ROp6U43mvUkm68H0POfljZY8Opaq7kkQ5zsFVL4isxmLT9YaToQTFDp9GlG7tEfCwOTFZ0sj+ONaQnMoNL3ocxcnpsTwKv4zlty98FFU4qSd85cDznOzKKUtvbgnY0Bg5nra1gH3RR6SMva9NesDnMv85WUsxiMpNE1jerEO9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D6S+Flo1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4YV/JUN9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D6S+Flo1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4YV/JUN9"
Date: Fri, 18 Sep 2026 10:16:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq2J7Qw6UREuiWU041Q2L9/OnK7w3k9pRpqEwCIhjk8=;
	b=D6S+Flo1DHlkF9SbODVFwzyfX8GUXBPZK1EIGbgWvAw1oc51V47xvjY4bNmmIr+Za+C+yI
	3jfFxvVJvk9GG83WcB3xnnfrKSESsfGKgG+ZUUBoCRUkN27gsLOGGSp+Ynbj4eHU2SGjxb
	8yYnvgiJT81/bFX9XI7PDH0RQiHgGdLmEnLSmIonZO+Dc+Z2MEemFkHhQrDfGXujXHIuM5
	Y2XnfI9S9Q7Lwoby9Jyjp9QhyFSARFdQIKW4K7AY6XSm/ILPkR2vyLvIadA7p/F6LVdv4p
	7zeNPWjTwQg/7eHn3FSMbAZ678nE04WvAV9W9WSiis7ow+yUzrT/FpXtolzU0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726570;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq2J7Qw6UREuiWU041Q2L9/OnK7w3k9pRpqEwCIhjk8=;
	b=4YV/JUN9moyx2/apS1W+3PZ0WtuHM+/PRkfSii5xliRzm4sKT/89xu69BurtMg6WPfHynE
	OJYXdqmy9mcPl5DA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Give each run one working directory,
 one per test inside it
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-8-song@kernel.org>
References: <20260916184351.2720310-8-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972656901.1720534.10912714907697815413.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     00de45f4de3f39e191a7a81be2f38f7e325535ab
Gitweb:        https://git.kernel.org/tip/00de45f4de3f39e191a7a81be2f38f7e325=
535ab
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:00 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:26 -07:00

objtool/klp: Give each run one working directory, one per test inside it

Each test made its own mktemp directory, so a run scattered them through
/tmp among everything else using the same names, and there was no way to
inspect what a failing test built -- the objects are gone the moment it
exits, which is right every time but the one that matters.

Give the run one directory and each test a subdirectory of it, named for
the test and nested the way the source is:

  /tmp/klp-tests.3zC6oyfd/
    generic/test-basic/{orig.o,patched.o,out.o,Module.symvers,...}
    x86/test-kcfi/...

--keep then reports one path instead of forty, and removing it is one
command.  A test run by hand still falls back to a temp directory of its
own, and still says where that went.

Detecting a leak comes free.  Cleanup is now "remove each test's directory,
then rmdir the run's", and the rmdir fails if anything is left -- so a test
which dies without running its own cleanup is reported rather than quietly
leaving something behind.

preflight names the directory the tests build under, since mktemp honours
TMPDIR and a run in a container is otherwise silent about where its work
went.  The runner says what to do only when it is relevant: on a failure
without --keep, that the option exists; with it, how many directories are
waiting.  Usage text is not read while something is broken.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-8-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/lib.sh       | 23 ++++++++++++++++++-----
 tools/objtool/tests/run-tests.sh | 26 ++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 817915e..82e6b0d 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -126,6 +126,7 @@ klp_preflight()
 #   objtool   $OBJTOOL (klp: yes)
 #   compiler  $cc_version
 #   arch      $KLP_TEST_ARCH$([ "$arch" =3D "$host" ] || echo "  (host $host=
, cross)")
+#   tmpdir    ${TMPDIR:-/tmp}  (each test builds in a fresh directory here)
 EOF
 }
=20
@@ -194,15 +195,27 @@ xpass()
 	exit 1
 }
=20
-cleanup() { [ -n "$workdir" ] && rm -rf "$workdir"; }
+cleanup()
+{
+	[ -n "$workdir" ] || return 0
+
+	if [ -n "${KLP_TEST_KEEP:-}" ]; then
+		[ -n "${KLP_TEST_WORKDIR:-}" ] || echo "# kept $workdir"
+		return 0
+	fi
+
+	rm -rf "$workdir"
+}
=20
 # setup [exported symbol...]
 setup()
 {
-	# The environment was checked once when this file was sourced, so there
-	# is nothing to verify here: objtool exists at the resolved path, has
-	# klp support, and $CC works.
-	workdir=3D"$(mktemp -d)" || fail "mktemp failed"
+	if [ -n "${KLP_TEST_WORKDIR:-}" ]; then
+		workdir=3D"$KLP_TEST_WORKDIR"
+		mkdir -p "$workdir" || fail "cannot create $workdir"
+	else
+		workdir=3D"$(mktemp -d)" || fail "mktemp failed"
+	fi
 	trap cleanup EXIT
=20
 	export_syms "$@"
diff --git a/tools/objtool/tests/run-tests.sh b/tools/objtool/tests/run-tests=
.sh
index 6b937fc..e6f1ac1 100755
--- a/tools/objtool/tests/run-tests.sh
+++ b/tools/objtool/tests/run-tests.sh
@@ -23,13 +23,17 @@ export LC_ALL=3DC
 usage()
 {
 	cat <<EOF
-usage: $(basename "$0") [test...]
+usage: $(basename "$0") [-k|--keep] [test...]
=20
 Run the objtool klp tests for this architecture: everything in generic/, plus
 everything in the directory named for it.  With no arguments, runs all of th=
em.
 A test may be named with or without its "test-" prefix and ".sh" suffix, and=
 is
 looked for in both directories.
=20
+Options:
+    -k, --keep    do not delete each test's working directory; print its pat=
h,
+                  so the objects a failing test built can be looked at
+
 Environment:
     OBJTOOL       objtool binary to test (default ../objtool)
     CC            compiler used to build fixtures (default gcc)
@@ -45,6 +49,7 @@ cd "$(dirname "$0")" || exit 1
 while [ $# -gt 0 ]; do
 	case "$1" in
 	-h|--help)	usage ;;
+	-k|--keep)	export KLP_TEST_KEEP=3D1; shift ;;
 	--)		shift; break ;;
 	-*)		echo "unknown option: $1" >&2; usage 1 ;;
 	*)		break ;;
@@ -98,12 +103,18 @@ else
 	done
 fi
=20
+# One directory for the whole run, one per test inside it, mirroring the
+# source layout.  A run then leaves a single thing behind instead of 39
+# scattered among everything else using mktemp.
+rundir=3D"$(mktemp -d "${TMPDIR:-/tmp}/klp-tests.XXXXXXXX")" ||
+	{ echo "Bail out! cannot create a working directory" >&2; exit 1; }
+
 echo "1..${#tests[@]}"
=20
 pass=3D0 fail=3D0 static_skip=3D0 probe_skip=3D0 xfail=3D0 xpass=3D0
=20
 for t in "${tests[@]}"; do
-	out=3D"$(./"$t" 2>&1)"
+	out=3D"$(KLP_TEST_WORKDIR=3D"$rundir/${t%.sh}" ./"$t" 2>&1)"
 	rc=3D$?
=20
 	# A test prints one result line, but it is not necessarily the only
@@ -156,4 +167,15 @@ done
 echo "# pass:$pass fail:$fail static-skip:$static_skip" \
      "probe-skip:$probe_skip xfail:$xfail xpass:$xpass"
=20
+# A failure is the one time the objects matter, and by default they are
+# already gone.  Say so then rather than in the usage text nobody reads while
+# something is broken.
+if [ -n "${KLP_TEST_KEEP:-}" ]; then
+	echo "# working directories kept in $rundir -- inspect, then rm -rf it"
+elif ! rmdir "$rundir"/*/ "$rundir" 2>/dev/null; then
+	echo "# $rundir was not empty; a test did not clean up after itself"
+elif [ "$fail" !=3D 0 ] || [ "$xpass" !=3D 0 ]; then
+	echo "# re-run with --keep to hold on to what a failing test built"
+fi
+
 [ "$fail" =3D 0 ] && [ "$xpass" =3D 0 ]
