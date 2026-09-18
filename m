Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FE04F30EA;
	Fri, 18 Sep 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726585; cv=none; b=ZVlPQCrJ9uJUG/KpR65vsDiseG9oVXt3tIHhG8ap3BJM7iyVtDIKjNfgkLq6dcmRk8ASpzojGCwjcdWSjSfbjqf/fuR264T0l7TzF5miFKIoDE/rUwyKJuy3FMImb4FGBy5zJ+9saAVKRNa99ZRoH+TzBki3Bk2J1rsrzfc++sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726585; c=relaxed/simple;
	bh=X0gKUd77Viq2sfBqqCnmuD+/aCgbEoyeZiYLM86UNbk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=HGvq2I2m0pL0n9vZcgmqJ0/s0abOIkTIwNbeHX3G9I1gtGG9Oj2ky8aEIUB7m9Cue1nI3BncyUMik6b+IJo5oGrsi5Ex3rDggUDcYT+u79M22ePlG4hgVVSyrfCKIaYNpBNhDqVfhhVwJNYOZFtjBfb+w8yWcRCRiudFoRQaWmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X+m7jkga; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EoYkMb+K; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X+m7jkga";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EoYkMb+K"
Date: Fri, 18 Sep 2026 10:16:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726573;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiPuY36N+XvakEM/lh5m/9PKxKA/CwAly/Gw+0XvWSk=;
	b=X+m7jkgaxAo+sDnBnPlR/eryf/9sej/CCyuqIcPcCsOeZjXbCYC+FqSV7viXI+x+vlS7BX
	TuENtbHYqM+Z5PpbooE8NNKeJ2LKhHhJT9z450bPCzUfiSdzh8VJDcd9sdnq/eHpnra7U5
	xCOPOo+8EOIfIXa7LrF2Och+ueQ/53c+ZEvXXvzeuK+bx5GRmAaTwiAxamFeipMVNZ9w5M
	TIqG2oGWWk4RhXCoRUX7VYXZZtANOjpriOOAoT6jNGiq8GEpe9LlFxVZS5Rl/DEhHq8PSa
	RQVG0chzXCe0atMc7txMYR+Vz44fssK5qnBSGOc5JjEMSvDVoNfteWRx0JLaRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726573;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiPuY36N+XvakEM/lh5m/9PKxKA/CwAly/Gw+0XvWSk=;
	b=EoYkMb+Ku09MhmYLGlgakKbZvyVjmNnnAoXCH8O+TxOVCkRem5nJ1RN77uN/qboRVbHVnd
	LodQm9dsoUUkKeCw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Build klp test fixtures through the harness
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-6-song@kernel.org>
References: <20260916184351.2720310-6-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972657178.1720534.6482007347198494201.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     18289c2240be1f7122a7e696c05475c09b64f904
Gitweb:        https://git.kernel.org/tip/18289c2240be1f7122a7e696c05475c09b6=
4f904
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:42:58 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:26 -07:00

objtool/klp: Build klp test fixtures through the harness

Compiling a fixture is the one thing every test does, and it has more
invariants than it looks.

  - The flags describe the kernel a fixture stands in for, and each is
    written down with its reason.  That substitution is the whole mechanism
    by which these tests cover configurations without building a kernel --
    objtool reads no .config, so a configuration reaches it only as
    compiler flags and the bytes they produce -- and a flag with no stated
    motive is indistinguishable from a mistake.

  - -c is not one of them.  Producing an object rather than a program is
    the helper's contract, not something a test may reconsider, so it lives
    at the compile and an override cannot drop it.

  - A fixture which will not compile is a failure, not a skip.  It is far
    more often a mistake in the fixture than a compiler which cannot
    express the construct, and the two are indistinguishable once reported
    as a skip.

  - A newly produced object has no checksums in it, so producing one
    invalidates the record that checksumming has already been done.  Left
    to itself that invariant ends up in each test which rebuilds.

build_one handles a single object for the tests which need more than two or
different names; build_pair and build_module_pair are expressed in terms of
it, so none of the above can be lost by going around them.

run_checksum comes out of run_diff for the same reason: a test which wants
checksums without a diff should not have to run one.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-6-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/lib.sh | 205 ++++++++++++++++++++++++++++++++----
 1 file changed, 186 insertions(+), 19 deletions(-)

diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index 1531caa..a4513ae 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -131,13 +131,35 @@ EOF
=20
 [ -n "${KLP_TEST_PREFLIGHT:-}" ] || klp_preflight
=20
-# klp-build compiles the kernel this way; klp diff needs per-symbol sections=
 to
-# extract individual functions.
-FIXTURE_CFLAGS=3D"-c -O2 -ffunction-sections -fdata-sections -fno-asynchrono=
us-unwind-tables"
+# What every fixture is built with.  These describe the kernel a fixture sta=
nds
+# in for; -c is build_one's contract rather than a property of that kernel, =
so
+# it lives at the compile where an override cannot drop it.
+#
+#   -O2					the kernel's default
+#   -ffunction-sections -fdata-sections	klp-build passes these itself, throu=
gh
+#					KCFLAGS, whatever the configuration
+#   -fno-asynchronous-unwind-tables	arch/x86/Makefile sets this always, so
+#					kernel objects carry no .eh_frame
+#   -fno-common				the kernel's Makefile sets it, so an
+#					uninitialised global there lands in
+#					.bss rather than being SHN_COMMON,
+#					which has no section and so no
+#					checksum
+#
+# A test overrides it; see tools/objtool/Documentation/klp-write-tests.txt.
+FIXTURE_CFLAGS=3D"-O2 -ffunction-sections -fdata-sections -fno-common \
+		-fno-asynchronous-unwind-tables"
=20
 test_name=3D"$(basename "$0" .sh)"
 workdir=3D
=20
+# The pair run_diff() and the checksum helpers work on.  build_pair() names
+# them again and make_vmlinux_pair() repoints orig_obj at the image it links,
+# but a test which builds its objects itself with build_one() sets neither, =
so
+# the default belongs here.
+orig_obj=3Dorig.o
+patched_obj=3Dpatched.o
+
 pass() { echo "ok - $test_name${1:+: $1}"; exit 0; }
 fail() { echo "not ok - $test_name: $1"; exit 1; }
=20
@@ -217,17 +239,78 @@ clang_only()
 	declared_skip "clang only${1:+: $1}"
 }
=20
+# build_one <fixture.c> <output object> [cflags...]
+build_one()
+{
+	local fixture out
+	fixture=3D"$FIXTURES_DIR/$1"
+	out=3D"$workdir/$2"
+	shift 2
+
+	[ -f "$fixture" ] || fail "missing fixture $fixture"
+
+	# run_checksum only runs once per workdir.  A fresh object has no
+	# checksums in it, so anything built now needs that to happen again.
+	rm -f "$workdir/.checksummed"
+
+	$CC -c $FIXTURE_CFLAGS "$@" -o "$out" "$fixture" 2>"$workdir/cc.log" ||
+		fail "$(basename "$fixture") does not build: $(tail -1 "$workdir/cc.log")"
+}
+
 # build_pair <fixture.c> [cflags...]
 build_pair()
 {
-	local fixture=3D"$FIXTURES_DIR/$1"; shift
+	local fixture=3D"$1"; shift
=20
-	[ -f "$fixture" ] || fail "missing fixture $fixture"
+	# Name what this builds.  A test may run several segments, and
+	# make_vmlinux_pair() repoints orig_obj at the image it links, so
+	# without this the next run_diff() would still be reading that.
+	orig_obj=3Dorig.o
+	patched_obj=3Dpatched.o
+
+	build_one "$fixture" orig.o "$@"
+	build_one "$fixture" patched.o "$@" -DPATCHED
+}
=20
-	$CC $FIXTURE_CFLAGS "$@" -o "$workdir/orig.o" "$fixture" 2>"$workdir/cc.log=
" ||
-		probe_skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
-	$CC $FIXTURE_CFLAGS "$@" -DPATCHED -o "$workdir/patched.o" "$fixture" 2>"$w=
orkdir/cc.log" ||
-		probe_skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
+# run_objtool_check <objtool arguments...>
+#
+# Run objtool's ordinary check pass over the pair, as the kernel build does.
+#
+# Some of what klp diff consumes is produced by this pass rather than by the
+# compiler: .static_call_sites, .mcount_loc, .ibt_endbr_seal, ORC.
+#
+# Only module objects see it before klp-build -- with CONFIG_KLP_BUILD the
+# per-object pass is deferred, so built-in objects reach klp diff exactly as
+# the compiler left them.
+run_objtool_check()
+{
+	local obj
+
+	# This rewrites both objects, so checksums taken before it describe
+	# something that no longer exists.  As in build_one(), drop the marker
+	# so run_checksum() takes them again.
+	rm -f "$workdir/.checksummed"
+
+	for obj in "$orig_obj" "$patched_obj"; do
+		"$OBJTOOL" "$@" "$workdir/$obj" ||
+			fail "objtool $* failed on $obj"
+	done
+}
+
+run_checksum()
+{
+	# Checksums live in the objects, and a test may ask for them more than
+	# once -- diffing the same pair again with a different Module.symvers,
+	# say.  objtool does the right thing when asked twice, leaving the
+	# object alone, but it says so, and that warning would be most of what
+	# a passing run prints.  Remember instead, and keep quiet.
+	[ -e "$workdir/.checksummed" ] && return 0
+
+	"$OBJTOOL" klp checksum "$workdir/$orig_obj" ||
+		fail "klp checksum $orig_obj failed"
+	"$OBJTOOL" klp checksum "$workdir/$patched_obj" ||
+		fail "klp checksum $patched_obj failed"
+	touch "$workdir/.checksummed"
 }
=20
 # run_diff [expected exit status]
@@ -235,18 +318,10 @@ run_diff()
 {
 	local expect=3D"${1:-0}" rc=3D0
=20
-	# Checksums live in the objects, so only generate them once even when a
-	# test diffs the same pair again with a different Module.symvers.
-	if [ ! -e "$workdir/.checksummed" ]; then
-		"$OBJTOOL" klp checksum "$workdir/orig.o" ||
-			fail "klp checksum orig.o failed"
-		"$OBJTOOL" klp checksum "$workdir/patched.o" ||
-			fail "klp checksum patched.o failed"
-		touch "$workdir/.checksummed"
-	fi
+	run_checksum
=20
 	# klp diff looks for Module.symvers relative to the working directory.
-	( cd "$workdir" && "$OBJTOOL" klp diff orig.o patched.o out.o ) \
+	( cd "$workdir" && "$OBJTOOL" klp diff "$orig_obj" "$patched_obj" out.o ) \
 		> "$workdir/diff.log" 2>&1 || rc=3D$?
=20
 	[ "$rc" =3D "$expect" ] ||
@@ -267,10 +342,102 @@ partial_link()
 {
 	local out=3D"$1"; shift
=20
+	rm -f "$workdir/.checksummed"
+
 	$CC -r -nostdlib -o "$out" "$@" 2>/dev/null ||
 		$CC -r -nostdlib -fuse-ld=3Dlld -o "$out" "$@" 2>/dev/null
 }
=20
+# link_vmlinux <output> <object...>
+#
+# Link objects into an executable, the way the kernel's final link produces
+# vmlinux from vmlinux.o.  Entry point 0 and no libc: nothing runs it, it on=
ly
+# has to be a linked image with resolved addresses.
+#
+# The sub-sections have to come out in name order rather than object order,
+# the way the kernel's linker script gathers .text.unlikely and .data.. apart
+# from the rest.  That reordering is the entire reason .klp.symid exists: a
+# link which preserves order cannot tell a correct sympos from one that mere=
ly
+# counted, and the caller checks the two orders really did diverge.
+#
+# A linker script rather than --sort-section=3Dname, because lld accepts that
+# option and ignores it -- so on a host where only lld can link the target, =
the
+# test would quietly stop testing the thing it is named for.
+#
+# Three attempts because a cross run has neither $LD nor the compiler's defa=
ult
+# linker able to touch the target: on an arm64 host linking x86 objects, only
+# lld will do it.
+link_vmlinux()
+{
+	local out=3D"$1" lds=3D"$workdir/sort.lds"; shift
+
+	echo 'SECTIONS { .data : { *(SORT_BY_NAME(.data.*)) } }' > "$lds"
+
+	$LD -e 0 -T "$lds" -o "$out" "$@" 2>/dev/null ||
+		$CC -nostdlib -Wl,-e,0 -Wl,-T,"$lds" \
+			-o "$out" "$@" 2>/dev/null ||
+		$CC -nostdlib -fuse-ld=3Dlld -Wl,-e,0 -Wl,-T,"$lds" \
+			-o "$out" "$@" 2>/dev/null
+}
+
+# make_vmlinux_pair <orig object...> -- <patched object...>
+#
+# Build the vmlinux.o / vmlinux pair klp diff needs to resolve sympos the way
+# it does for built-in code, and point the diff at it.
+#
+# For a module, sympos is a count in symbol table order, which klp diff can =
do
+# from the object alone.  vmlinux is different: the final link reorders
+# sub-sections, so the position comes from the linked image, bridged by
+# .klp.symid.  klp diff only looks for that when the object it was handed is
+# called vmlinux.o and a vmlinux sits beside it -- so both the name and the
+# linked image matter.
+make_vmlinux_pair()
+{
+	local orig=3D() patched=3D() seen=3D arg
+
+	for arg in "$@"; do
+		if [ "$arg" =3D -- ]; then seen=3Dy; continue; fi
+		if [ -n "$seen" ]; then patched+=3D( "$arg" ); else orig+=3D( "$arg" ); fi
+	done
+
+	# Both sides have to have been named.  Without this, forgetting the --
+	# leaves one list empty, the link of nothing fails, and the test skips
+	# saying the toolchain cannot link -- which is a test bug wearing the
+	# costume of an environment one.
+	[ "${#orig[@]}" -gt 0 ] && [ "${#patched[@]}" -gt 0 ] ||
+		fail "make_vmlinux_pair needs objects either side of --"
+
+	partial_link "$workdir/vmlinux.o" "${orig[@]}" ||
+		probe_skip "partial link unavailable"
+	partial_link "$workdir/patched.o" "${patched[@]}" ||
+		probe_skip "partial link unavailable"
+
+	"$OBJTOOL" --klp-symids --link "$workdir/vmlinux.o" ||
+		fail "objtool --klp-symids failed"
+
+	link_vmlinux "$workdir/vmlinux" "$workdir/vmlinux.o" ||
+		probe_skip "cannot link a vmlinux here"
+
+	orig_obj=3Dvmlinux.o
+}
+
+# build_module_pair <fixture.c> <module name> [cflags...]
+#
+# Build the pair as objects belonging to a module rather than to vmlinux.  k=
lp
+# diff reads the object's module name from .modinfo, and that decides which
+# object a relocation is attributed to and whether a reference counts as
+# cross-module, so a good deal of the code has a module path the vmlinux
+# fixtures never reach.
+#
+# The fixture defines its .modinfo name from MODNAME.  Passing that through
+# -D needs two levels of quoting, which is easy to get wrong at the call sit=
e.
+build_module_pair()
+{
+	local fixture=3D"$1" modname=3D"$2"; shift 2
+
+	build_pair "$fixture" -DMODNAME=3D"\"$modname\"" "$@"
+}
+
 # find_thinlto_toolchain
 #
 # Set $THIN_LD to an lld from the same LLVM release as $CC (or THIN_CC).  A
