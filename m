Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12D74EFFD5;
	Fri, 18 Sep 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726583; cv=none; b=VneQGmMH37QPIYbBgW/SlqdBMIc297h04f+J14La8Pdgx+IStWnSqpoe86+3coLZ/cakAcvr6RxcIBz/DLDTZOWsVrD9fdHdti7qnkTjb83M4rbxf5Lz5BBhQw0/RjLC1KkUzxgOIFGF8i4tHChI6OcWeJ43LlO6ZbVMYgZKH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726583; c=relaxed/simple;
	bh=IZrcUq+3CcL6QnuMPEM6FG+aOTm+X/gXOl59uaVp57M=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TDoC7AYANtcbIcK/PRpE9iFZgDRKfHG7woUluxJhawwGSZWER1Q7SBi/QB6mkfID/Mnp8oJXgrmhnqj12o6HPpMGT6o+j6ziYUU1NZLU6uZjL3FoJWs5bM/mLROtVkkGxqRj4V7j9WqXB/VPnZrmD43WvLx30zNYC35U3oQHG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bG6dunud; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rX8EKDx5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bG6dunud";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rX8EKDx5"
Date: Fri, 18 Sep 2026 10:16:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726572;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzLoX+TlRETmNt52UtrDyk2mEbId7E6rQdNDbWTE3yg=;
	b=bG6dunud4GM0DeTekx5owGLLpG5AON6YYCLlxvAZZEMSxjKVP9neOmRtcS+Nt1nGfnCEl7
	jro7SMWCc00h3+kWq3M5mHt370mbI6PaKkb1vYZm5iPuROK1G/PagoaHOiT+Ww2HyYPB3V
	htq+Fi4ur2cWD0NFEBhCNw4Pc+RI+9P8dtlDCTB8cNpccd1cT4mKcXAA2Nk+9mzs36v1uF
	H/51WFdVjinNj4mqAQu+zqcbs64vtoioSYmhWWC0S/wkx5KDBhJLw4uT4hwEcaJVTYrIC6
	DQfYIlWvJG7gUf55AzLY02pb4FcO5O9GgQ/c792b1Kfz510NuEzpl4W3YBxllg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726572;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzLoX+TlRETmNt52UtrDyk2mEbId7E6rQdNDbWTE3yg=;
	b=rX8EKDx5kcyZUmYCWUvNj1kt6l5xuQTDno4IBJufLws4ejQXyb+9QN3JdYuHThLVHhdVit
	vGStpCVDQ25EIPDw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Grow the klp test harness vocabulary
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-7-song@kernel.org>
References: <20260916184351.2720310-7-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972657034.1720534.16982877098320694841.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     9e57c64b4a77f60d51f2f9740268103057ef9587
Gitweb:        https://git.kernel.org/tip/9e57c64b4a77f60d51f2f9740268103057e=
f9587
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:42:59 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:26 -07:00

objtool/klp: Grow the klp test harness vocabulary

Assertions for what klp diff produces, and for what went into it.

The output side covers the things a livepatch is made of: cloned sections
and symbols, klp symbols and their sympos, tombstones, relocations by
section and by count, the converted .klp.rela sections and their
SHF_RELA_LIVEPATCH flag, SHN_LIVEPATCH symbols, recorded checksums, and klp
diff's own diagnostics -- a rejection for the wrong reason is not a pass.

The input side matters just as much, and is easier to forget.  A test which
asserts only on the output passes when the compiler never emitted the
construct under test, and reads as coverage it does not have.  So there are
two forms, and the difference between them is a statement about why the
thing might be absent:

  require_*  the compiler cannot produce it here     -> skip
  assert_*   the fixture is supposed to produce it   -> fail

Names are quoted before they reach grep.  Nearly every name here contains
dots -- .text.target, .klp.rela.vmlinux -- and an unescaped dot matches any
character, so an assertion for one section could be satisfied by a
different one whose name merely lines up.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-7-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/lib.sh | 364 +++++++++++++++++++++++++++++++++++-
 1 file changed, 360 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/tests/lib.sh b/tools/objtool/tests/lib.sh
index a4513ae..817915e 100644
--- a/tools/objtool/tests/lib.sh
+++ b/tools/objtool/tests/lib.sh
@@ -216,9 +216,42 @@ setup()
 export_syms()
 {
 	: > "$workdir/Module.symvers"
+	add_exports vmlinux "$@"
+}
+
+# add_exports <object> [symbol...]
+#
+# Append exports owned by one object, without clearing what is already there,
+# so a test can describe a kernel where several objects export things.
+#
+# Which object owns a symbol is not cosmetic: a reference to a vmlinux symbol
+# is applied when the patch module loads, and a reference to a module's symb=
ol
+# when that patched module loads, so klp diff files them in different sectio=
ns.
+add_exports()
+{
+	local owner=3D"$1"; shift
+
+	add_exports_ns "$owner" "" "$@"
+}
+
+# add_exports_ns <object> <namespace> [symbol...]
+#
+# Exports in a symbol namespace, the last field of a Module.symvers line.
+#
+# A "module:<names>" namespace is EXPORT_SYMBOL_FOR_MODULES(), where the mod=
ule
+# loader grants access by matching the importing module's name against the
+# list.  A livepatch module is never on that list, so such a symbol has to be
+# referenced the way an unexported one is.  Ordinary namespaces are not
+# special here.
+add_exports_ns()
+{
+	local owner=3D"$1" ns=3D"$2"; shift 2
+
+	local sym
+
 	for sym in "$@"; do
-		printf '0x00000000\t%s\tvmlinux\tEXPORT_SYMBOL\t\n' \
-			"$sym" >> "$workdir/Module.symvers"
+		printf '0x00000000\t%s\t%s\tEXPORT_SYMBOL\t%s\n' \
+			"$sym" "$owner" "$ns" >> "$workdir/Module.symvers"
 	done
 }
=20
@@ -481,12 +514,87 @@ out_relocs()   { $READELF -r -W "$workdir/out.o" 2>/dev=
/null; }
 out_symbols()  { $READELF -s -W "$workdir/out.o" 2>/dev/null; }
 diff_log()     { cat "$workdir/diff.log"; }
=20
+# out_strings <section>
+#
+# The strings in one section of the output, for the names livepatch matches =
on.
+out_strings() { $READELF -p "$1" "$workdir/out.o" 2>/dev/null; }
+
+# Checks on the input objects, to run before klp diff.  The two forms differ=
 in
+# what an absent construct means:
+#
+#   require_*  the compiler cannot produce it here	-> skip
+#   assert_*   the fixture is supposed to produce it	-> fail
+
+in_sections() { $READELF -S -W "$workdir/$1" 2>/dev/null; }
+in_symbols()  { $READELF -s -W "$workdir/$1" 2>/dev/null; }
+in_relocs()   { $READELF -r -W "$workdir/$1" 2>/dev/null; }
+
+# count_input_symbols <object> <name>
+#
+# How many object symbols of exactly that name the input has.  Deliberately =
not
+# a grep: readelf lists section symbols too, and a newer binutils prints the=
ir
+# name -- ".data.<name>" -- where an older one leaves the column blank.  A d=
ot
+# is not a word character, so "grep -w <name>" counts that line as well, and
+# the same object gives a different answer depending on which readelf reads =
it.
+count_input_symbols()
+{
+	in_symbols "$1" | awk -v n=3D"$2" '$4 =3D=3D "OBJECT" && $8 =3D=3D n' | wc =
-l
+}
+
+# re_quote <string>
+#
+# A string as a literal basic regular expression.  Nearly every name these
+# assertions match on contains a dot -- .text.target, .klp.rela.vmlinux -- a=
nd
+# an unescaped dot matches any character, so an assertion for one section ca=
n be
+# satisfied by a different one whose name merely lines up.
+re_quote() { printf '%s' "$1" | sed 's|[].[^$*\\/]|\\&|g'; }
+
+has_input_section() { in_sections "$1" | grep -q "[[:space:]]$(re_quote "$2"=
)[[:space:]]"; }
+has_input_symbol()  { in_symbols "$1" | awk -v n=3D"$2" '$NF =3D=3D n' | gre=
p -q .; }
+
+assert_input_section()
+{
+	local obj
+
+	for obj in "$orig_obj" "$patched_obj"; do
+		has_input_section "$obj" "$1" ||
+			fail "fixture produced no section '$1' in $obj"
+	done
+}
+
+assert_input_symbol()
+{
+	local obj
+
+	for obj in "$orig_obj" "$patched_obj"; do
+		has_input_symbol "$obj" "$1" ||
+			fail "fixture produced no symbol '$1' in $obj"
+	done
+}
+
+require_input_section()
+{
+	local obj
+
+	for obj in "$orig_obj" "$patched_obj"; do
+		has_input_section "$obj" "$1" ||
+			probe_skip "compiler produced no section '$1' here"
+	done
+}
+
 assert_section()
 {
-	out_sections | grep -q "[[:space:]]$1[[:space:]]" ||
+	out_sections | grep -q "[[:space:]]$(re_quote "$1")[[:space:]]" ||
 		fail "expected section '$1' in output"
 }
=20
+assert_no_section()
+{
+	out_sections | grep -q "[[:space:]]$(re_quote "$1")[[:space:]]" &&
+		fail "unexpected section '$1' in output"
+	return 0
+}
+
 assert_patched()
 {
 	assert_section ".text.$1"
@@ -494,7 +602,255 @@ assert_patched()
=20
 assert_not_patched()
 {
-	out_sections | grep -q "[[:space:]].text.$1[[:space:]]" &&
+	out_sections | grep -q "[[:space:]]$(re_quote ".text.$1")[[:space:]]" &&
 		fail "function '$1' should not have been cloned"
 	return 0
 }
+
+# section_relocs <section>
+#
+# The relocations against one section.  readelf prints every relocation sect=
ion
+# in turn, so a test asking about ".smp_locks" has to cut its block out of t=
he
+# listing first.
+section_relocs()
+{
+	local sec=3D"${1//./\\.}"
+
+	out_relocs | awk "/rela$sec'/,/^\$/"
+}
+
+assert_reloc_sym()
+{
+	section_relocs "$1" | awk -v n=3D"$2" '$5 =3D=3D n' | grep -q . ||
+		fail "expected a relocation to '$2' in '$1'"
+}
+
+assert_no_reloc_sym()
+{
+	section_relocs "$1" | awk -v n=3D"$2" '$5 =3D=3D n' | grep -q . &&
+		fail "unexpected relocation to '$2' in '$1'"
+	return 0
+}
+
+# assert_reloc_count <section> <count>
+#
+# Counts relocation entries, not header or blank lines: whether a special
+# section entry was extracted once, twice or not at all is usually the whole
+# question.
+#
+# A count of zero is ambiguous on its own -- a section with no relocations a=
nd
+# no section at all both read as zero -- so require the section to exist.  A
+# test expecting nothing there wants assert_no_section.
+assert_reloc_count()
+{
+	local n
+
+	assert_section "$1"
+
+	n=3D"$(section_relocs "$1" | grep -cE '^[0-9a-f]{8,}')"
+	[ "$n" =3D "$2" ] ||
+		fail "expected $2 relocations in '$1', found $n"
+}
+
+# assert_klp_sym <symbol> [object]
+#
+# A klp symbol is named .klp.sym.<object>.<symbol>,<sympos>.  The object
+# defaults to any, since most tests care that the reference was converted at
+# all rather than which object it resolved against.
+assert_klp_sym()
+{
+	out_symbols | grep -q "\.klp\.sym\.${2:-[^.]*}\.$(re_quote "$1")," ||
+		fail "expected klp symbol for '$1'"
+}
+
+# assert_klp_sympos <symbol> <sympos>
+#
+# The number after the comma in .klp.sym.<object>.<symbol>,<sympos> says whi=
ch
+# of several same-named symbols livepatch should resolve to, counting from 1;
+# 0 means the name is unique and no disambiguation is needed.  Resolving to =
the
+# wrong one is not a load failure, it is a patch quietly wired to the wrong
+# object.
+assert_klp_sympos()
+{
+	out_symbols | grep -qE "\.klp\.sym\.[^.]+\.$(re_quote "$1"),$2([[:space:]]|=
\$)" ||
+		fail "expected klp symbol for '$1' with sympos $2, found:$(
+			out_symbols | grep -o "\.klp\.sym\.[^.]*\.$(re_quote "$1"),[0-9]*" |
+			sort -u | tr '\n' ' ')"
+}
+
+assert_no_klp_sym()
+{
+	out_symbols | grep -q "\.klp\.sym\.${2:-[^.]*}\.$(re_quote "$1")," &&
+		fail "unexpected klp symbol for '$1'"
+	return 0
+}
+
+assert_tombstone()
+{
+	out_symbols | grep -qE "\.klp\.tombstone\.$(re_quote "$1")([[:space:]]|\$)"=
 ||
+		fail "expected a tombstone for '$1'"
+}
+
+assert_symbol()
+{
+	out_symbols | awk -v n=3D"$1" '$NF =3D=3D n' | grep -q . ||
+		fail "expected symbol '$1' in output"
+}
+
+assert_no_symbol()
+{
+	out_symbols | awk -v n=3D"$1" '$NF =3D=3D n' | grep -q . &&
+		fail "unexpected symbol '$1' in output"
+	return 0
+}
+
+# assert_diff_log <regex>
+#
+# klp diff's combined output, for tests asserting on a diagnostic.  Error
+# messages are part of the interface when the whole point is that a construct
+# gets rejected, and a rejection for the wrong reason is not a pass.
+assert_diff_log()
+{
+	diff_log | grep -qE -- "$1" ||
+		fail "expected '$1' in klp diff output: $(tail -2 "$workdir/diff.log")"
+}
+
+# checksum_of <object> <symbol>
+#
+# The checksum "klp checksum" recorded for one symbol, as a hex string.
+#
+# .discard.sym_checksum is an array of { u64 addr; u64 checksum; }, where ad=
dr
+# is the target of a relocation naming the symbol.  Nothing in the section
+# itself says which symbol an entry belongs to, so the relocation is what
+# locates the entry; the checksum is the eight bytes after it.
+# Callers use this in a command substitution, where fail() would only exit t=
he
+# subshell and the test would carry on with an empty checksum.  So this retu=
rns
+# non-zero and prints nothing, and the assertions below check for that.  For
+# the same reason it does not run run_checksum() itself: that one does call
+# fail(), and from in here the message would be captured as the checksum
+# rather than ending the test.  The caller runs it first.
+checksum_of()
+{
+	local obj=3D"$workdir/$1" sym=3D"$2" off
+
+	off=3D"$($READELF -rW "$obj" 2>/dev/null |
+	       awk -v s=3D"$sym" '/rela\.discard\.sym_checksum/,/^$/ {
+			if ($5 =3D=3D s) { print $1; exit }
+	       }')"
+
+	[ -n "$off" ] || return 1
+
+	$OBJCOPY -O binary --only-section=3D.discard.sym_checksum \
+		"$obj" "$workdir/checksums.bin" 2>/dev/null || return 1
+
+	dd if=3D"$workdir/checksums.bin" bs=3D1 skip=3D$((16#$off + 8)) count=3D8 \
+		status=3Dnone | od -An -tx1 | tr -d ' \n'
+}
+
+# assert_checksum_differs <symbol> / assert_checksum_matches <symbol>
+#
+# Compare what klp checksum recorded for a symbol in the original against the
+# patched object.  This is what decides whether klp diff treats a function as
+# changed, so a test asserting only that the right functions were cloned can=
not
+# tell a correct checksum from one which happens to differ.
+checksum_pair()
+{
+	run_checksum
+
+	orig_checksum=3D"$(checksum_of "$orig_obj" "$1")"
+	patched_checksum=3D"$(checksum_of "$patched_obj" "$1")"
+
+	[ -n "$orig_checksum" ] ||
+		fail "no checksum recorded for '$1' in $orig_obj"
+	[ -n "$patched_checksum" ] ||
+		fail "no checksum recorded for '$1' in $patched_obj"
+}
+
+assert_checksum_differs()
+{
+	checksum_pair "$1"
+
+	[ "$orig_checksum" !=3D "$patched_checksum" ] ||
+		fail "checksum for '$1' unchanged at $orig_checksum, expected it to differ"
+}
+
+assert_checksum_matches()
+{
+	checksum_pair "$1"
+
+	[ "$orig_checksum" =3D "$patched_checksum" ] ||
+		fail "checksum for '$1' changed from $orig_checksum to" \
+		     "$patched_checksum, expected no change"
+}
+
+# run_post_link [expected exit status]
+#
+# klp post-link runs last in a livepatch build, converting the intermediate
+# __klp_relocs.* sections into the .klp.rela.* form the kernel consumes.  It
+# needs nothing but an object containing those sections, which is what klp d=
iff
+# produces, so it runs on out.o here rather than on a built module.  Rewrites
+# out.o in place, so the out_* helpers show the result afterwards.
+run_post_link()
+{
+	local expect=3D"${1:-0}" rc=3D0
+
+	"$OBJTOOL" klp post-link "$workdir/out.o" \
+		> "$workdir/post-link.log" 2>&1 || rc=3D$?
+
+	[ "$rc" =3D "$expect" ] ||
+		fail "klp post-link exited $rc, expected $expect:" \
+		     "$(tail -2 "$workdir/post-link.log")"
+}
+
+# The flags readelf prints for a section, or nothing when it has none.  The
+# leading "[nn]" index is stripped first so the columns can be counted.
+section_flags()
+{
+	out_sections | sed 's/^ *\[[ 0-9]*\] *//' |
+		awk -v s=3D"$1" '$1 =3D=3D s && $7 ~ /^[A-Za-z]+$/ { print $7 }'
+}
+
+# assert_section_flag <section> <letter>
+#
+# SHF_RELA_LIVEPATCH is OS-specific, so readelf renders it as "o".  A klp re=
la
+# section which lost it is an ordinary rela section, which the linker may ap=
ply
+# and the livepatch code will not.
+assert_section_flag()
+{
+	local flags; flags=3D"$(section_flags "$1")"
+
+	[ -n "$flags" ] ||
+		fail "section '$1' has no flags, expected '$2'"
+	case "$flags" in
+	*"$2"*)	;;
+	*)	fail "section '$1' has flags '$flags', expected '$2'" ;;
+	esac
+}
+
+# assert_klp_rela <object> <section>
+#
+# post-link names the converted sections .klp.rela.<object>.<section>, one p=
er
+# base section.  Also checks SHF_RELA_LIVEPATCH, since the name alone is not
+# what makes the kernel process it.
+assert_klp_rela()
+{
+	local name=3D".klp.rela.$1.$2"
+
+	out_sections | grep -q "[[:space:]]$(re_quote "$name")[[:space:]]" ||
+		fail "expected section '$name' in output"
+
+	assert_section_flag "$name" o
+}
+
+# assert_livepatch_sym <symbol>
+#
+# Symbols a klp relocation resolves against live in SHN_LIVEPATCH, which
+# readelf prints as "OS [0xff20]" -- llvm-readelf without the space, so match
+# either.  The kernel resolves these itself at patch load; anything else is a
+# symbol the module loader will try, and fail, to resolve normally.
+assert_livepatch_sym()
+{
+	out_symbols | grep -E 'OS ?\[0xff20\]' |
+		grep -qE "\.klp\.sym\.[^.]+\.$(re_quote "$1")," ||
+		fail "expected a klp symbol for '$1' in SHN_LIVEPATCH"
+}
