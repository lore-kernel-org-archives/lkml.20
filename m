Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0D146984A;
	Mon, 21 Sep 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982853; cv=none; b=TTxc1BuPBe9VgsTbRoBzcltyavUApDcBdWP3ztywl5F7WHxsG18Hjefn2PnuFCvZDeojx//0hktbEQJxqcyxJRA3o9YIJqnQzT1ywwXI/Tt1fPZU/inD2aPazzLc8WUTb83dF2KOQBBn2FLf0kqBTyKvWLP9oXTUXDwt4IIFX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982853; c=relaxed/simple;
	bh=4WwYfJqegZk/nw2Gfu5Rd13U9VtUIGm8s9GWgL8nqKk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UpR3DzotxUoFet6Q80PhVQXmbv4jc9wNJTRoIjfskbHnMMir6IGeX93730bQGYNcB2PU3E6PGho3/SbcYMZQsydetltk4g7GTK5bjQzVROEGsqVQheLjMGPf5r+P0iFqVLRs1JjUVHCvgjVl9xjqJK1crZRyjduunnBppn52Yjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XSCq2edE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tiav5CLd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XSCq2edE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tiav5CLd"
Date: Mon, 21 Sep 2026 09:27:26 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982849;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXfl8NJj/94AFyCHr/I9cK1swnsR1AWNT2cj03m888s=;
	b=XSCq2edEHxMl1yaYJFri72uKCaYnTnMhDmWIECl9fgJO8lzjFq4jQYFbmEgPHhG9j15G+W
	C6bVr9V9PEKKmYJU7prEUovNbd+mt26ECUEsu+u5NisOgxpldPG6qHqMCz+VPJL2PepZXZ
	nla8IO3ZxJZJRfaiGokhENbBZ8zrpJcZDumxZpX7GRoMUO/nHxln3IzTBkhVuiWtEvPc54
	0CNVPIxH3EWL/OM6NJXoTkd2NbC/SAXbEFYcfub4YqXyZdYHTmJBqGUTiHRgMC/7drhafx
	D6nvMoA6FBubus1nkPYo7gFTTz7QhP/+JkB87NHydze0idafg7XPVQp2ork3IQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982849;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXfl8NJj/94AFyCHr/I9cK1swnsR1AWNT2cj03m888s=;
	b=Tiav5CLdNYJ6jpWZlmB+CNi1L8/wZLzqQmdjiaoODXo4g7mse95zCc74AoxSA4zo4lHVt0
	Np2UsRue5y0MWpAQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for ThinLTO symbols sharing
 a demangled name
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-59-song@kernel.org>
References: <20260916184351.2720310-59-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998284674.2819794.7926800810733323319.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     945537271df1e3680be9b32af7041ac20f1184fb
Gitweb:        https://git.kernel.org/tip/945537271df1e3680be9b32af7041ac20f1=
184fb
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:51 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:08 +02:00

objtool/klp: Add test for ThinLTO symbols sharing a demangled name

A file-local symbol which ThinLTO has to make visible is renamed
helper.llvm.<hash>.  With two such helpers in one link, the original and
the patched object hold two each, all four spelled differently, and
demangling gives "helper" for every one of them -- so the name alone cannot
say which corresponds to which.

Three translation units, two with a static helper of the same name and a
third calling into both, which is what forces the promotion.  Only one
helper changes: paired correctly that means exactly one is cloned, and
paired the wrong way round the other is, or both are.  Had both bodies
changed, both would be cloned either way and the test would prove nothing
-- which is how the first version of this was written.

The outcome is asserted, not the machinery.  With the clang tested here the
pairing survives disabling the .llvm.<hash> suffix map and stubbing out
llvm_suffix() entirely, so no single-line sabotage distinguishes it; the
tiered matcher this case was written for is not needed for this shape.  The
test says so rather than implying otherwise.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-59-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/thinlto_ambiguity.c | 57 +++++-
 tools/objtool/tests/generic/test-thinlto-ambiguity.sh    | 77 +++++++-
 2 files changed, 134 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/thinlto_ambiguity.c
 create mode 100755 tools/objtool/tests/generic/test-thinlto-ambiguity.sh

diff --git a/tools/objtool/tests/generic/fixtures/thinlto_ambiguity.c b/tools=
/objtool/tests/generic/fixtures/thinlto_ambiguity.c
new file mode 100644
index 0000000..b88830f
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/thinlto_ambiguity.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Three translation units linked with ThinLTO, two of which have a file-loc=
al
+ * helper of the same name.
+ *
+ * TU_C calls into both of the others, so ThinLTO imports entry_a and entry_b
+ * and with them the static helper each one calls.  A file-local symbol which
+ * has to become visible is renamed helper.llvm.<hash>, and the hash is cont=
ent
+ * derived -- so the two helpers get different hashes from each other, and
+ * TU_A's gets a different one again after the patch changes it.  Only TU_A's
+ * changes: were both bodies to change, both would be cloned whichever way
+ * they were paired, and the pairing would not be observable.
+ *
+ * That leaves klp diff with two symbols in the original and two in the patc=
hed
+ * object, all four named differently, which have to be paired up correctly.
+ * Demangling alone gives "helper" for all of them; something else has to
+ * decide which is which.
+ *
+ * Only TU_A's helper changes.  That is what makes a wrong pairing observabl=
e:
+ * paired correctly, one helper is changed and the other is not, so exactly =
one
+ * is cloned.  Paired the wrong way round, both look changed -- or the wrong
+ * one does.  If both bodies changed the outcome would be the same either way
+ * and the test would prove nothing.
+ *
+ * BASE differs between the two so their bodies are not identical to begin
+ * with.
+ */
+
+#if defined(TU_C)
+extern int entry_a(int x);
+extern int entry_b(int x);
+int glue(int x) { return entry_a(x) + entry_b(x + 1); }
+#else
+#ifdef TU_B
+#define ENTRY entry_b
+#define BASE 5
+#else
+#define ENTRY entry_a
+#define BASE 10
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+#endif
+static __attribute__((noinline)) int helper(int x, int len)
+{
+	int sum =3D 0, i;
+
+	for (i =3D 0; i < len; i++)
+#if defined(PATCHED) && !defined(TU_B)
+		sum +=3D i * 2 + BASE;	/* only TU_A's helper changes */
+#else
+		sum +=3D i + BASE;
+#endif
+	return sum + x;
+}
+
+int ENTRY(int x) { return helper(x, 4); }
+#endif
diff --git a/tools/objtool/tests/generic/test-thinlto-ambiguity.sh b/tools/ob=
jtool/tests/generic/test-thinlto-ambiguity.sh
new file mode 100755
index 0000000..34f4f3a
--- /dev/null
+++ b/tools/objtool/tests/generic/test-thinlto-ambiguity.sh
@@ -0,0 +1,77 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Two ThinLTO-promoted symbols sharing a demangled name must be paired up
+# correctly.
+#
+# A file-local symbol which ThinLTO has to make visible is renamed
+# helper.llvm.<hash>.  With two such helpers in one link the original and the
+# patched object hold two each, all four spelled differently, and demangling
+# gives "helper" for all of them -- so the name is not enough to say which
+# corresponds to which.
+#
+# Getting it wrong is silent and specific: the patch is built against the wr=
ong
+# body, so one call site gets the other helper's arithmetic.  Nothing fails =
to
+# build and nothing fails to load.
+#
+# test-thinlto-local covers the unambiguous case, one promoted symbol whose
+# hash moved.  This is the case where demangling alone is not an answer.
+#
+# The outcome is asserted, not the machinery: with the clang tested here the
+# pairing succeeds even with the .llvm.<hash> suffix map disabled and with
+# llvm_suffix() stubbed out, so no single-line sabotage distinguishes it.  T=
he
+# tiered matcher this case was written for is not needed for this shape.
+#
+# Covers the same ground as corpus/x86_64-llvm-thinlto/
+# thin-lto-demangled-ambiguity and thin-lto-demangled-global-match in Joe
+# Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+clang_only "ThinLTO requires clang"
+
+find_thinlto_toolchain ||
+	probe_skip "no matching clang/lld pair for a ThinLTO link; set THIN_LD to o=
ne"
+
+build_thinlto()		# $1 output object, $2 extra flags
+{
+	local t
+	for t in "" -DTU_B -DTU_C; do
+		$THIN_CC -flto=3Dthin -O2 -ffunction-sections -fdata-sections \
+			$2 $t -c "$FIXTURES_DIR/thinlto_ambiguity.c" \
+			-o "$workdir/tu$t.o" 2>/dev/null || return 1
+	done
+	"$THIN_LD" -r "$workdir/tu.o" "$workdir/tu-DTU_B.o" "$workdir/tu-DTU_C.o" \
+		-o "$1" 2>/dev/null || return 1
+}
+
+build_thinlto "$workdir/orig.o" "" ||
+	probe_skip "ThinLTO build failed ($THIN_CC, $THIN_LD)"
+build_thinlto "$workdir/patched.o" -DPATCHED ||
+	probe_skip "ThinLTO build failed ($THIN_CC, $THIN_LD)"
+
+# The premise: two promoted helpers per object, and exactly one of them kept
+# its hash -- the one the patch did not touch.  Without that there is nothing
+# to disambiguate.
+orig_syms=3D"$(in_symbols orig.o    | grep -oE 'helper\.llvm\.[0-9]+' | sort=
 -u)"
+new_syms=3D"$( in_symbols patched.o | grep -oE 'helper\.llvm\.[0-9]+' | sort=
 -u)"
+[ "$(echo "$orig_syms" | wc -l)" =3D 2 ] && [ "$(echo "$new_syms" | wc -l)" =
=3D 2 ] ||
+	probe_skip "ThinLTO did not promote two distinct helpers here"
+
+kept=3D"$(comm -12 <(echo "$orig_syms") <(echo "$new_syms"))"
+moved=3D"$(comm -13 <(echo "$orig_syms") <(echo "$new_syms"))"
+[ "$(echo "$kept" | wc -w)" =3D 1 ] && [ "$(echo "$moved" | wc -w)" =3D 1 ] =
||
+	probe_skip "expected one helper to keep its hash and one to move"
+
+run_diff
+
+# Exactly one helper is cloned, and it is the one whose body changed.  Cloni=
ng
+# the other, or both, is what a wrong pairing looks like.
+assert_not_patched "$kept"
+
+n=3D"$(out_sections | grep -cE '[[:space:]]\.text\.helper\.llvm\.[0-9]+[[:sp=
ace:]]')"
+[ "$n" =3D 1 ] ||
+	fail "expected 1 cloned helper, found $n"
+
+pass "ThinLTO helpers sharing a demangled name paired up correctly"
