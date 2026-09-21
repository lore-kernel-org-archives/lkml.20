Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6355447C0EE;
	Mon, 21 Sep 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982929; cv=none; b=M371ii8SuVXcEK+AcUlI/6dhKnRdD7f/KFv07VzYBuRUbBw+MJBw6wI+K95ci8Bl990gRuYeWJi/32nz17kcOgyA4HlKK8mKn+oreT//sdh6745o5nIYab9y5AUQI/ns4PN9g3rftpWriEFgiwG5WVX96XoeuXhiNnJyFROLZVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982929; c=relaxed/simple;
	bh=kds7WIKqfb09KlxS5DoSwSJKulz4sbfhbxjowJeDf08=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=eBV2EzmgvPV+Y5mtWvvVKm24z9yKoGKM/fU8Kn+sKyUHFa7BM8l6OiiYoRlk7q+VOUiy04+eT2ZTYXDMPm1i7QhWDjo9X+s6QQpZfuemG9K6p5PYP80+qSOP4z2nmf0USMlQnat41nCtZKUMNFVAhWmIteMnmc6A0RSRDDcw11Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q6/gp73+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MRKQac8+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q6/gp73+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MRKQac8+"
Date: Mon, 21 Sep 2026 09:28:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982925;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVuRJMs+wZ8Ib2NGbZJleq2gPjj49fWeNKktImQ/L+Y=;
	b=Q6/gp73+Q4wDmWwlxfm8UWykqJymjxSzxe6fKctKcEgev7yl3clc3THn3TKEoIj1/63+dq
	Oab6HAmO4yYiyUOe1va5AqctADiTs+B3JUMW+tpD6HyfsnckHfG8IpVcngsHRCkb+TSlz9
	jsEJWUI8chCxdB0Hn1W4EV2kfl9qvlDL8kDhNvzgPT6qoZTeVX9rt96M55xbYQJf4tL0jE
	2qv5Ha0PyCUshtVo464gH0XKMKLd7YdS4L1z3BUsYE6LiKhh39dZKGUb7/1zs7/nlu6Uqc
	TL3v8ZIgd+KSE9umSwSa2NYYULPLNAtpfegGV2fc7tzedlM3Rze65ssgf+IbeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982925;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVuRJMs+wZ8Ib2NGbZJleq2gPjj49fWeNKktImQ/L+Y=;
	b=MRKQac8+lGZIr2A36KZRvtBJobDXl0HrX+U3garLzKZ9UKLnR0EC6yzEB6Q4xVK6pyAShC
	GFqrx1UtJ9cvBeCA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Give each run one working directory,
 one per test inside it
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-8-song@kernel.org>
References: <20260916184351.2720310-8-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998292415.2819794.11089097347795142069.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     8593055b7a4015761b3a4bbc3a64371bc42d1d12
Gitweb:        https://git.kernel.org/tip/8593055b7a4015761b3a4bbc3a64371bc42=
d1d12
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:00 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:01:10 +02:00

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

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-8-song@kernel.org
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
