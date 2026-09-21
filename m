Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E388846EC66;
	Mon, 21 Sep 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982945; cv=none; b=EC13Psa/iRkZQNMXGBAJaZtz7rFOA7+qznlVwEcY1HJzTermEL82YRWPsJd9kFv5tbnlNeJHBzmGsnmaje9eAHN5pz7tocJ40opUz9crzBqLYapjhkdP5+XmsE1eJ3qOlm5JOxoYcBOPxUh1wU2b62PLnF+zSea+A9kJbdXJ0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982945; c=relaxed/simple;
	bh=4rBM/T8cZnL1E+bg/FDG8tAUoFRsM+v2i+cffYMvaO8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=EsHjKvdklyht5eScwElzk2+QX7T1M3pkK7O9CqSY+CbcoN8wYXwaA18YIX7ujt+CtdmcfQQYKyglSylscmdozalZ6X2y1Zjd1X2B3cw0V+Z94DifVuQ6vsWLdZL/keF4XKtYm2eXw/JPoiXnDir2qHajBAZICN/X0RFqVj8Udww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AX7CqBVP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JkPe01UX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AX7CqBVP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JkPe01UX"
Date: Mon, 21 Sep 2026 09:28:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982935;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHb4Vr/atknre+nPgaYkEUMvCMMMNa+EbEJGr7TPilY=;
	b=AX7CqBVPxrY49W3AmA8iT1q7LxYN7+2JM57rI52evsCyOoB1FmGo8C89Ybz2oH/jvIj+GR
	Fo2MUpbAj1HAgL3pOYsWXS8mHvisO7BPfdHazaWBG/QnOdXgdVqN8rHTpq5XFQ7sd4Ie8y
	BFlCV8eASYG1oSz78WlDKWbtlV3gEYaBsJpiGonAbqXVvCUAiK/D7sDbHoaDmG8p79NuWF
	/OQ/MDdJ2ivYj5AjY4XBkd44uCNB8QGTBg1hyIvLLXPGisFQn0MneecZfY3YZme6FqrrVp
	Vm+UQHOcJtQb2Idikt3VeaZWynG6G2TwKPv6TwbGiFenn81HzXCfUrYxyP5/Xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982935;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHb4Vr/atknre+nPgaYkEUMvCMMMNa+EbEJGr7TPilY=;
	b=JkPe01UXMljweWP/w7ZfddxqC/ZSmwI3BL57mlb8zv4tC7Yl5DgwZUMVoG3UwNvSRr19PM
	dcd1w3GXpK+LPKCA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool: Add test harness for the klp subcommands
Cc: Puranjay Mohan <puranjay@kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-2-song@kernel.org>
References: <20260916184351.2720310-2-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998293330.2819794.5298941485467303794.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     cff27d90769da941f6897a9d9152670af7b71f95
Gitweb:        https://git.kernel.org/tip/cff27d90769da941f6897a9d9152670af7b=
71f95
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:42:54 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 10:50:49 +02:00

objtool: Add test harness for the klp subcommands

"objtool klp checksum" and "objtool klp diff" work on object files alone,
with no kernel, vmlinux or configuration involved, so they can be tested
directly. That is worth doing: most klp generation bugs so far have been in
symbol correlation, special section extraction and relocation conversion,
and several of them failed silently, producing a livepatch which built
cleanly but was missing data.

A test compiles a fixture twice, as the original and (with -DPATCHED) the
patched object, runs both through klp checksum, diffs them and asserts on
the result.  Fixtures are compiled at test time rather than committed as
binaries: codegen varies between compilers and architectures, and that
variation is where a good number of these bugs come from.

Assertions check properties rather than compare against recorded output.
Golden files would need re-recording for every compiler change and would
report churn instead of regressions.

klp diff resolves symbols against Module.symvers, so the harness writes
one. Whether a symbol is listed there decides between an ordinary
relocation and a klp relocation, which makes it the main knob tests use.

Run with:

  make -C tools/objtool tests

Tests skip when objtool was built without klp support or when a fixture
does not build for the target architecture.  A missing objtool binary fails
instead of skipping, since that means a broken invocation rather than an
environment which cannot run the test.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Co-developed-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-2-song@kernel.org
---
 tools/objtool/Makefile               |   5 +-
 tools/objtool/tests/fixtures/basic.c |  20 +++-
 tools/objtool/tests/lib.sh           | 179 ++++++++++++++++++++++++++-
 tools/objtool/tests/run-tests.sh     |  20 +++-
 tools/objtool/tests/test-basic.sh    |  17 ++-
 5 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 tools/objtool/tests/fixtures/basic.c
 create mode 100644 tools/objtool/tests/lib.sh
 create mode 100755 tools/objtool/tests/run-tests.sh
 create mode 100755 tools/objtool/tests/test-basic.sh

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 4cc2e75..0f34abb 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -153,6 +153,9 @@ clean: $(LIBSUBCMD)-clean
 mrproper: clean
 	$(call QUIET_CLEAN, objtool) $(RM) $(OBJTOOL)
=20
+tests: $(OBJTOOL)
+	$(Q)OBJTOOL=3D$(abspath $(OBJTOOL)) $(srctree)/tools/objtool/tests/run-test=
s.sh
+
 FORCE:
=20
-.PHONY: clean mrproper FORCE
+.PHONY: clean mrproper tests FORCE
diff --git a/tools/objtool/tests/fixtures/basic.c b/tools/objtool/tests/fixtu=
res/basic.c
new file mode 100644
index 0000000..811529e
--- /dev/null
+++ b/tools/objtool/tests/fixtures/basic.c
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
diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
new file mode 100644
index 0000000..7b29db7
--- /dev/null
+++ b/tools/objtool/tests/lib.sh
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Helpers for the objtool klp tests.  A test builds a fixture twice, as the
+# original and (with -DPATCHED) the patched object, runs both through
+# "klp checksum" and diffs them, then asserts on the result.
+#
+# Assertions check properties rather than compare against recorded output:
+# codegen varies between compilers and golden files would report churn inste=
ad
+# of regressions.
+
+TESTS_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
+FIXTURES_DIR=3D"$TESTS_DIR/fixtures"
+
+OBJTOOL=3D"${OBJTOOL:-$TESTS_DIR/../objtool}"
+CC=3D"${CC:-gcc}"
+
+# klp-build compiles the kernel this way; klp diff needs per-symbol sections=
 to
+# extract individual functions.
+FIXTURE_CFLAGS=3D"-c -O2 -ffunction-sections -fdata-sections -fno-asynchrono=
us-unwind-tables"
+
+test_name=3D"$(basename "$0" .sh)"
+workdir=3D
+
+pass() { echo "ok - $test_name${1:+: $1}"; exit 0; }
+fail() { echo "not ok - $test_name: $1" >&2; exit 1; }
+skip() { echo "ok - $test_name # SKIP $1"; exit 0; }
+
+cleanup() { [ -n "$workdir" ] && rm -rf "$workdir"; }
+
+# setup [exported symbol...]
+setup()
+{
+	# A relative $OBJTOOL is relative to the objtool directory, not to the
+	# tests which run from tests/.
+	[ -x "$OBJTOOL" ] || [ ! -x "$TESTS_DIR/../$OBJTOOL" ] ||
+		OBJTOOL=3D"$TESTS_DIR/../$OBJTOOL"
+
+	# Not finding objtool is a broken invocation, not an environment which
+	# cannot run the test.  Skipping here would read as a pass.
+	[ -x "$OBJTOOL" ] || fail "objtool not found at '$OBJTOOL', build it first"
+
+	# run_diff() runs objtool from inside the test's working directory, so
+	# a relative path would resolve against that instead.
+	OBJTOOL=3D"$(realpath "$OBJTOOL")"
+
+	"$OBJTOOL" klp 2>&1 | grep -q checksum ||
+		skip "objtool built without klp support (needs libxxhash)"
+	command -v "${CC%% *}" >/dev/null || skip "no compiler ($CC)"
+
+	workdir=3D"$(mktemp -d)" || fail "mktemp failed"
+	trap cleanup EXIT
+
+	export_syms "$@"
+}
+
+# export_syms [symbol...]
+#
+# Rewrite Module.symvers so exactly these symbols are exported by vmlinux.
+# Whether a symbol is listed decides between an ordinary relocation and a klp
+# relocation, so tests flip it to cover both.
+export_syms()
+{
+	: > "$workdir/Module.symvers"
+	for sym in "$@"; do
+		printf '0x00000000\t%s\tvmlinux\tEXPORT_SYMBOL\t\n' \
+			"$sym" >> "$workdir/Module.symvers"
+	done
+}
+
+# build_pair <fixture.c> [cflags...]
+build_pair()
+{
+	local fixture=3D"$FIXTURES_DIR/$1"; shift
+
+	[ -f "$fixture" ] || fail "missing fixture $fixture"
+
+	$CC $FIXTURE_CFLAGS "$@" -o "$workdir/orig.o" "$fixture" 2>"$workdir/cc.log=
" ||
+		skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
+	$CC $FIXTURE_CFLAGS "$@" -DPATCHED -o "$workdir/patched.o" "$fixture" 2>"$w=
orkdir/cc.log" ||
+		skip "fixture does not build here: $(tail -1 "$workdir/cc.log")"
+}
+
+# run_diff [expected exit status]
+run_diff()
+{
+	local expect=3D"${1:-0}" rc=3D0
+
+	# Checksums live in the objects, so only generate them once even when a
+	# test diffs the same pair again with a different Module.symvers.
+	if [ ! -e "$workdir/.checksummed" ]; then
+		"$OBJTOOL" klp checksum "$workdir/orig.o" ||
+			fail "klp checksum orig.o failed"
+		"$OBJTOOL" klp checksum "$workdir/patched.o" ||
+			fail "klp checksum patched.o failed"
+		touch "$workdir/.checksummed"
+	fi
+
+	# klp diff looks for Module.symvers relative to the working directory.
+	( cd "$workdir" && "$OBJTOOL" klp diff orig.o patched.o out.o ) \
+		> "$workdir/diff.log" 2>&1 || rc=3D$?
+
+	[ "$rc" =3D "$expect" ] ||
+		fail "klp diff exited $rc, expected $expect: $(tail -2 "$workdir/diff.log"=
)"
+}
+
+cc_supports()
+{
+	echo 'int f(void) { return 0; }' > "$workdir/flagtest.c"
+	$CC $1 -c "$workdir/flagtest.c" -o "$workdir/flagtest.o" 2>/dev/null
+}
+
+# partial_link <output> <object...>
+#
+# "ld -r" through the compiler driver so the link targets the same
+# architecture as the objects.
+partial_link()
+{
+	local out=3D"$1"; shift
+
+	$CC -r -nostdlib -o "$out" "$@" 2>/dev/null ||
+		$CC -r -nostdlib -fuse-ld=3Dlld -o "$out" "$@" 2>/dev/null
+}
+
+# find_thinlto_toolchain
+#
+# Set $THIN_CC and $THIN_LD to a clang and lld from the same LLVM release.  A
+# mismatched pair fails with "Invalid summary version", which reads like a
+# broken test rather than a broken environment.
+find_thinlto_toolchain()
+{
+	local cc ld ver
+
+	for cc in "${THIN_CC:-}" "$CC" clang; do
+		[ -n "$cc" ] || continue
+		command -v "${cc%% *}" >/dev/null 2>&1 || continue
+
+		ver=3D$($cc -dumpversion 2>/dev/null | cut -d. -f1)
+
+		for ld in "${THIN_LD:-}" "ld.lld-$ver" ld.lld; do
+			[ -n "$ld" ] || continue
+			command -v "$ld" >/dev/null 2>&1 || continue
+
+			echo 'int probe(void) { return 0; }' > "$workdir/probe.c"
+			$cc -flto=3Dthin -O2 -c "$workdir/probe.c" \
+				-o "$workdir/probe.o" 2>/dev/null || continue
+			"$ld" -r "$workdir/probe.o" -o "$workdir/probe.elf" \
+				2>/dev/null || continue
+
+			THIN_CC=3D"$cc"
+			THIN_LD=3D"$ld"
+			return 0
+		done
+	done
+
+	return 1
+}
+
+out_sections() { readelf -S -W "$workdir/out.o" 2>/dev/null; }
+out_relocs()   { readelf -r -W "$workdir/out.o" 2>/dev/null; }
+out_symbols()  { readelf -s -W "$workdir/out.o" 2>/dev/null; }
+diff_log()     { cat "$workdir/diff.log"; }
+
+assert_section()
+{
+	out_sections | grep -q "[[:space:]]$1[[:space:]]" ||
+		fail "expected section '$1' in output"
+}
+
+assert_patched()
+{
+	assert_section ".text.$1"
+}
+
+assert_not_patched()
+{
+	out_sections | grep -q "[[:space:]].text.$1[[:space:]]" &&
+		fail "function '$1' should not have been cloned"
+	return 0
+}
diff --git a/tools/objtool/tests/run-tests.sh b/tools/objtool/tests/run-tests=
.sh
new file mode 100755
index 0000000..ab1dea5
--- /dev/null
+++ b/tools/objtool/tests/run-tests.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Run the objtool klp tests.  Each test-*.sh prints one TAP result line.
+
+set -u
+
+cd "$(dirname "$0")" || exit 1
+
+tests=3D( test-*.sh )
+[ "${tests[0]}" =3D "test-*.sh" ] && { echo "1..0 # SKIP no tests found"; ex=
it 0; }
+
+echo "1..${#tests[@]}"
+
+rc=3D0
+for t in "${tests[@]}"; do
+	./"$t" || rc=3D1
+done
+
+exit $rc
diff --git a/tools/objtool/tests/test-basic.sh b/tools/objtool/tests/test-bas=
ic.sh
new file mode 100755
index 0000000..6b76996
--- /dev/null
+++ b/tools/objtool/tests/test-basic.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Only functions whose code changed get cloned into the patch.
+
+. "$(dirname "$0")/lib.sh"
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
