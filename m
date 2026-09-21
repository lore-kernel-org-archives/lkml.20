Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300E490C0F;
	Mon, 21 Sep 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982899; cv=none; b=pNlNY8+MBzx/KfshyNeZxQhBSmC5xZZRfs9SCx70oo9EyYQ5/YLXxJW0rI2hby1wl4KQeZmUGsOxvmCqaSBW/eLRfgiufsQIEYjirL9sh2i8Y0tX4taeZxTvXqgrVVMBNjW3vuxo2gkh59ofBKltqvc5kxsTtwj0pz0jgYn0MzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982899; c=relaxed/simple;
	bh=Pca4j9NHXXP4Pg/fHOd0J/mkmX9XXOwu/qmNmBPxM48=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XxmSiT2SR8arV2MqMajQn1kb6ArqZ7YOzaT3fVvCEO0CNxLc0udnPSp+pfgqh5SlGQFHs1ysMpPfv2Ls6/FhEuTalLX3xBwYNY0L3qe3+wOopi0JTcJfntlsMbyjLXJYINn/fYaVoxbqASev84AVvZadnb0sDswAQ3FFehxH27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E+joDTsw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ugpckkj2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E+joDTsw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ugpckkj2"
Date: Mon, 21 Sep 2026 09:28:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982895;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxxdHSzd5R+G+2tfmGNpgGh3d06Pb7+ue177R48bOog=;
	b=E+joDTswnhYbsiHZeVzIG2x3gDgrwuDZUhaEmAwSk10FA2/CUbuH3yDo/KUs5nQk49tjrD
	OgXKBjUl3FB8yTzyxoBNht9QdfrmSzdRQj/qczRh0l2+bY5DQKm4EL+Z9IQyJqElcKbaSk
	Wn7r3ZM0LGZ66PpPV+JSAdZUu8fGfxWxwtHbZmMeHsdsSyVe2eoMWz1svLbpy/bc+KhiYO
	czRiAUzpsGz44lwuR1FigO/bn9+PamouVNU32IavNZ8Tl+whZivTFw9DXHgSRqyIPSFctS
	KWB4NEzKLNI/iSUfElJM6CgBXiTGKvGVWVui62/gqDtoHLeV6TSVYxuF0ZPkUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982895;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxxdHSzd5R+G+2tfmGNpgGh3d06Pb7+ue177R48bOog=;
	b=ugpckkj2UhTFusqYSyLBB7OKQrHcYSw8g4zxdoyRyB2G/CpnmxfZ82kB4/UPv2lya/Czc4
	NBuvcBJGxTgnKzDw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add klp diff and post-link regression tests
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-28-song@kernel.org>
References: <20260916184351.2720310-28-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289378.2819794.7294000364618132585.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     ade23d75deb3c679760c3f0f33d9b8d8ffa9f963
Gitweb:        https://git.kernel.org/tip/ade23d75deb3c679760c3f0f33d9b8d8ffa=
9f963
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:20 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:47 +02:00

objtool/klp: Add klp diff and post-link regression tests

Five tests covering behaviour the harness could reach but nothing
exercised.  Each was verified to fail against the code it guards, by
reverting the fix or sabotaging the exact line; where a first attempt
passed against broken code, the fixture was wrong and was rebuilt.

  post-link                    first coverage of the subcommand at all
  local-vs-export              local symbols must not match exports
  symvers-parse-error          Module.symvers parse error line numbers
  checksum-debug               the --debug-checksum format klp-build reads
  function-removal             the "no correlation" path

local-vs-export tests the behavior of commit 86a697572c62 ("objtool/klp:
Don't match local symbols against exports"), and symvers-parse-error that
of commit 51c1de134863 ("objtool/klp: Fix line numbers in Module.symvers
parse errors").

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-28-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/function_removal.c | 25 ++++-
 tools/objtool/tests/generic/test-checksum-debug.sh      | 49 ++++++++-
 tools/objtool/tests/generic/test-function-removal.sh    | 34 ++++++-
 tools/objtool/tests/generic/test-local-vs-export.sh     | 32 +++++-
 tools/objtool/tests/generic/test-post-link.sh           | 42 +++++++-
 tools/objtool/tests/generic/test-symvers-parse-error.sh | 23 ++++-
 6 files changed, 205 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/function_removal.c
 create mode 100755 tools/objtool/tests/generic/test-checksum-debug.sh
 create mode 100755 tools/objtool/tests/generic/test-function-removal.sh
 create mode 100755 tools/objtool/tests/generic/test-local-vs-export.sh
 create mode 100755 tools/objtool/tests/generic/test-post-link.sh
 create mode 100755 tools/objtool/tests/generic/test-symvers-parse-error.sh

diff --git a/tools/objtool/tests/generic/fixtures/function_removal.c b/tools/=
objtool/tests/generic/fixtures/function_removal.c
new file mode 100644
index 0000000..d65ff60
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/function_removal.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A function the patch deletes, along with its only caller's use of it.  The
+ * original has a symbol which the patched object simply does not, so there =
is
+ * nothing to correlate it against.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+#ifndef PATCHED
+int going_away(int x)
+{
+	return x + 7;
+}
+#endif
+
+int caller(int x)
+{
+#ifdef PATCHED
+	return x + 1;
+#else
+	return going_away(x);
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-checksum-debug.sh b/tools/objto=
ol/tests/generic/test-checksum-debug.sh
new file mode 100755
index 0000000..78856b1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-debug.sh
@@ -0,0 +1,49 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# "klp checksum --debug-checksum" prints a per-instruction checksum stream,
+# and klp-build -f (--show-first-changed) parses it to report where a functi=
on
+# first differs between the original and patched builds.
+#
+# It is a debugging aid, so nothing fails when it breaks: klp-build greps the
+# stream, and an unmatched grep just yields no output, which reads as "no
+# instruction changed".  That is exactly how the format drifted out from und=
er
+# it once already.  Pin the shape klp-build depends on:
+#
+#   DEBUG: <object>: checksum: <func>(): <sym>+0x<offset> <16 hex digits>
+#
+# and that --dry-run leaves the object alone, since klp-build runs this agai=
nst
+# objects it is going to checksum again for real.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+
+before=3D"$(md5sum < "$workdir/orig.o")"
+
+"$OBJTOOL" klp checksum --dry-run --debug-checksum=3Dchanged \
+	"$workdir/orig.o" > "$workdir/debug.log" 2>&1 ||
+	fail "klp checksum --debug-checksum failed"
+
+# --dry-run has to mean it: klp-build checksums these objects again afterwar=
ds,
+# and "already has .discard.sym_checksum, skipping" would lose the real run.
+[ "$(md5sum < "$workdir/orig.o")" =3D "$before" ] ||
+	fail "--dry-run modified the object"
+has_input_section orig.o .discard.sym_checksum &&
+	fail "--dry-run created .discard.sym_checksum"
+
+grep -qE '^DEBUG: .*: checksum: changed\(\): [^ ]+\+0x[0-9a-f]+ [0-9a-f]{16}=
$' \
+	"$workdir/debug.log" ||
+	fail "unexpected --debug-checksum format: $(head -1 "$workdir/debug.log")"
+
+# This is the pattern klp-build greps with.  Keep it working verbatim.
+grep -qE "^DEBUG: .*checksum: changed\(\): " "$workdir/debug.log" ||
+	fail "klp-build's --show-first-changed pattern no longer matches"
+
+# Only the requested function, or klp-build attributes instructions to the
+# wrong one.
+grep -qE 'checksum: untouched\(\)' "$workdir/debug.log" &&
+	fail "--debug-checksum=3Dchanged also dumped untouched()"
+
+pass "--debug-checksum format is the one klp-build -f parses"
diff --git a/tools/objtool/tests/generic/test-function-removal.sh b/tools/obj=
tool/tests/generic/test-function-removal.sh
new file mode 100755
index 0000000..df76e81
--- /dev/null
+++ b/tools/objtool/tests/generic/test-function-removal.sh
@@ -0,0 +1,34 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A patch which deletes a function leaves a symbol in the original with no
+# counterpart in the patched object.  klp diff cannot correlate it, and must
+# say so and carry on: livepatching cannot remove code from a running kernel,
+# so what matters is that the surviving caller is patched and the deleted
+# function is not dragged into the patch module.
+#
+# Cloning it would be worse than useless -- dead code in the patch, plus
+# whatever it references, resolved against a kernel where it may not exist.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair function_removal.c
+
+# One-sided by construction: present in the original, gone from the patched.
+has_input_symbol orig.o going_away ||
+	fail "fixture has no going_away in the original"
+has_input_symbol patched.o going_away &&
+	fail "fixture still has going_away in the patched object"
+
+run_diff
+
+assert_diff_log 'no correlation: going_away'
+
+# The caller changed, so it is patched ...
+assert_patched caller
+# ... and the deleted function comes along in no form at all.
+assert_not_patched going_away
+assert_no_symbol going_away
+
+pass "deleted function reported as uncorrelated and left out of the patch"
diff --git a/tools/objtool/tests/generic/test-local-vs-export.sh b/tools/objt=
ool/tests/generic/test-local-vs-export.sh
new file mode 100755
index 0000000..5b91101
--- /dev/null
+++ b/tools/objtool/tests/generic/test-local-vs-export.sh
@@ -0,0 +1,32 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# find_export() matched on symbol name alone, so a static function or variab=
le
+# sharing a name with an export was mistaken for a reference to that export.
+# For a vmlinux export that means no klp relocation at all: the normal
+# relocation left behind is resolved by the module loader to the vmlinux
+# symbol, and the patched code quietly reads and writes the wrong object.
+#
+# Exports are always global, so a local symbol is never one.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_local.c
+
+# The static the fixture uses.  Compilers mangle statics variously -- gcc sa=
ys
+# counter.0, clang says target.counter -- so find what this one produced rat=
her
+# than assuming a shape.
+local_sym=3D"$(in_symbols orig.o |
+	awk '$4 =3D=3D "OBJECT" && $5 =3D=3D "LOCAL" && $8 ~ /counter/ { print $8; =
exit }')"
+[ -n "$local_sym" ] ||
+	fail "fixture produced no local 'counter' symbol"
+
+# Contrive the collision: something else exports that same name.
+export_syms "$local_sym" counter
+run_diff
+
+# Still treated as the local it is, not as the export.
+assert_klp_sym "$local_sym" vmlinux
+
+pass "local symbol not mistaken for an export of the same name"
diff --git a/tools/objtool/tests/generic/test-post-link.sh b/tools/objtool/te=
sts/generic/test-post-link.sh
new file mode 100755
index 0000000..a6d40ae
--- /dev/null
+++ b/tools/objtool/tests/generic/test-post-link.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# klp post-link converts the intermediate __klp_relocs.* sections into the
+# .klp.rela.* form the kernel applies at patch load.  Getting this wrong is
+# invisible at build time: the module links and loads, and the relocations a=
re
+# simply never applied.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_local.c
+
+# An unexported symbol is what produces a klp relocation in the first place.
+# The static local is renamed by the compiler -- counter.0 with gcc -- so the
+# fixture's premise is that some local of that shape exists, not that a symb=
ol
+# called "counter" does.  Find it first; everything below names it.
+local_sym=3D"$(in_symbols orig.o |
+	     awk '$4 =3D=3D "OBJECT" && $5 =3D=3D "LOCAL" && $8 ~ /counter/ { print=
 $8; exit }')"
+[ -n "$local_sym" ] || fail "fixture produced no local 'counter' symbol"
+
+run_diff
+assert_section __klp_relocs.vmlinux
+
+# Nothing has converted them yet.
+assert_no_section ".klp.rela.vmlinux..text.target"
+
+# The original relocation is neutralised by pointing it at a tombstone, which
+# is what stops the module loader resolving it behind livepatch's back.
+#
+# Compilers mangle a static local differently -- gcc says counter.0, clang
+# target.counter -- so find what this one produced rather than assuming.
+assert_tombstone "$local_sym"
+
+run_post_link
+
+# One .klp.rela section per base section, carrying SHF_RELA_LIVEPATCH, again=
st
+# a symbol in SHN_LIVEPATCH for the kernel to resolve.
+assert_klp_rela vmlinux .text.target
+assert_livepatch_sym "$local_sym"
+
+pass "klp relocations converted to .klp.rela with SHN_LIVEPATCH symbols"
diff --git a/tools/objtool/tests/generic/test-symvers-parse-error.sh b/tools/=
objtool/tests/generic/test-symvers-parse-error.sh
new file mode 100755
index 0000000..d597f28
--- /dev/null
+++ b/tools/objtool/tests/generic/test-symvers-parse-error.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A malformed Module.symvers has to be reported against the line it is on.
+# Module.symvers has tens of thousands of lines and is generated, so a wrong
+# line number sends whoever has to fix it to the wrong place, and "line 1" is
+# wrong in a way that looks plausible.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+
+# Three well-formed lines, then one with no tabs at all.
+export_syms a b c
+echo 'this line has no fields' >> "$workdir/Module.symvers"
+
+run_diff 255
+
+assert_diff_log 'malformed Module.symvers'
+assert_diff_log 'at line 4'
+
+pass "malformed Module.symvers reported against the offending line"
