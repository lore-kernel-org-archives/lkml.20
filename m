Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E804348987F;
	Mon, 21 Sep 2026 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982883; cv=none; b=FWiYy8MudfPR1pq0VfVDO7oXWpFrztxIkDuG7pstBnq5BGvb9a9FdpyOYH670Mlqz4U5wsZkhSq2uSAC+YqeM7i7aYZWMprdArEg6HfZHkkunhJFkU2zgh2MPZjsIVhhiwKxA1XiSqR8bihRJNz63VmG+Z4PGqZptA0n77IlgF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982883; c=relaxed/simple;
	bh=DcYG3owwwzP8IYHxB1DpuLg25yTbpFoDq1mIob2VRyk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=FR2/z3+WXUBqTSTvHHZkQyFBcrmehGPYsNac/0Q3wzv4m6pnBr/XanRXgRE94MzN+R7cWVovW0/qLuBoXNYAb+g3u77qlr38W143WOLNRAhFbID582hg7JoNf6l8B34Hd7z7GCL4KdL5zraukV37lGqscwLcAhZnDdFZt3sjjGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iXpDYVl4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qMU8ZZlY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iXpDYVl4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qMU8ZZlY"
Date: Mon, 21 Sep 2026 09:27:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982879;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voZFzEzCACZzt3Nxd261xwAyXweadlsbnVwH02fCG+8=;
	b=iXpDYVl44+msrwotetoCBm1we2jUdyFq4Uir47LclJIOpIQCSZg/lZGGmZ8yuWGZA6upwZ
	MdAvLbzhXptPJP0rBmmwrPIwoc+vdiS1tpWQUImmMZ0bhxe5LapBkVRwNwJIb2mZ4rLwyI
	n0f/DRgiujDujhNO/o5AF7to5lr7WMVbU42GzmEPi7GiLp40mgGRC5pc4F1jxRtdYVHWO1
	L7ZtZ66K7BZ2vm92YLf6owluvM10JOfN9Vpe6WLVU7v7opvuSoc7X4PGohTevz8m4d+oE0
	6RjMLqAzA1agq9Jc+5Fb2RV2Te2QUIIVFdY+IOFBTBPQg453uxK9bFmkaqrFpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982879;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voZFzEzCACZzt3Nxd261xwAyXweadlsbnVwH02fCG+8=;
	b=qMU8ZZlYibsISS0E4CRafkthFSdhA4JpPfVokBrQhqTcnY8CUdlKd1ML0nyZ6Ff55fmqtK
	gObJr3MxkL1YNFAA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for sympos resolved against
 a linked vmlinux
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-39-song@kernel.org>
References: <20260916184351.2720310-39-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998287775.2819794.2501605033279873925.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     1a50e18ba3427ce9d22c5ff28499cca242fa7f73
Gitweb:        https://git.kernel.org/tip/1a50e18ba3427ce9d22c5ff28499cca242f=
a7f73
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:31 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for sympos resolved against a linked vmlinux

vmlinux is not like a module: the final link reorders sub-sections, so a
symbol's position has to come from the linked image rather than from symbol
table order.  klp diff bridges that with .klp.symid, and looks for it only
when the object it was handed is called vmlinux.o with a vmlinux beside it.

This was assigned to an end-to-end test on the assumption that it needs a
real kernel build.  It needs "ld -r" and "ld -e 0", and takes a fraction of
a second.

The fixture places the static appearing first in the symbol table at the
higher address, and the link passes --sort-section=3Dname to force the
reordering the kernel's linker script performs.  Without that the two ways
of computing sympos agree, and a first version passed with the vmlinux path
disabled.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-39-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/sympos_vmlinux.c | 40 +++++++-
 tools/objtool/tests/generic/test-sympos-vmlinux.sh    | 57 ++++++++++-
 2 files changed, 97 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/sympos_vmlinux.c
 create mode 100755 tools/objtool/tests/generic/test-sympos-vmlinux.sh

diff --git a/tools/objtool/tests/generic/fixtures/sympos_vmlinux.c b/tools/ob=
jtool/tests/generic/fixtures/sympos_vmlinux.c
new file mode 100644
index 0000000..d5e7099
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/sympos_vmlinux.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Two translation units with a same-named static, placed so that the linker
+ * puts them in the opposite order to the one they appear in the symbol tabl=
e.
+ *
+ * VARSEC selects the section the static lands in.  Linking with
+ * --sort-section=3Dname then orders them alphabetically rather than by obje=
ct
+ * order, so the first symbol in the symbol table ends up at the *higher*
+ * address.  That is the whole point: counting symbol table order and reading
+ * the linked image's addresses now give different answers, which is what ma=
kes
+ * it possible to tell which one klp diff used.
+ *
+ * Only use_a is patched, so exactly one sympos is emitted and there is noth=
ing
+ * to attribute.
+ */
+
+#ifndef FUNC_NAME
+#define FUNC_NAME use_a
+#endif
+#ifndef VARSEC
+#define VARSEC ".data.mmm"
+#endif
+
+#ifndef NO_MODINFO
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+#endif
+
+/* volatile so it survives as an STT_OBJECT rather than being folded away */
+static volatile int dup_counter __attribute__((section(VARSEC))) =3D 1;
+
+int FUNC_NAME(int x)
+{
+	dup_counter +=3D x;
+#ifdef PATCHED
+	return dup_counter + 1;
+#else
+	return dup_counter;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-sympos-vmlinux.sh b/tools/objto=
ol/tests/generic/test-sympos-vmlinux.sh
new file mode 100755
index 0000000..b2b4400
--- /dev/null
+++ b/tools/objtool/tests/generic/test-sympos-vmlinux.sh
@@ -0,0 +1,57 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# sympos for vmlinux, which is resolved differently from sympos for a module.
+#
+# A module's .ko preserves symbol table order, so klp diff can count -- that=
 is
+# what test-sympos covers.  vmlinux cannot be counted: the final link reorde=
rs
+# sub-sections, so the order in vmlinux.o is not the order the running kernel
+# has.  klp diff bridges that with .klp.symid, a table of { id, address }
+# emitted into vmlinux.o whose addresses the linker resolves, read back out =
of
+# the linked vmlinux.
+#
+# Getting it wrong points the relocation at a different symbol of the same
+# name.  Nothing fails to build or load; the patched code uses the wrong
+# object.
+#
+# The fixture is arranged so the two answers differ: the static that comes
+# first in the symbol table is placed at the *higher* address, so counting
+# gives 1 and reading the linked image gives 2.  Without that, both paths ag=
ree
+# and the test cannot tell them apart.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# use_a's static sorts last by section name, use_b's first.  Only use_a is
+# patched, so exactly one sympos comes out.
+build_one sympos_vmlinux.c orig_a.o    -DFUNC_NAME=3Duse_a -DVARSEC=3D'".dat=
a.zzz"'
+build_one sympos_vmlinux.c patched_a.o -DFUNC_NAME=3Duse_a -DVARSEC=3D'".dat=
a.zzz"' -DPATCHED
+build_one sympos_vmlinux.c b.o         -DFUNC_NAME=3Duse_b -DVARSEC=3D'".dat=
a.aaa"' -DNO_MODINFO
+
+make_vmlinux_pair "$workdir/orig_a.o" "$workdir/b.o" \
+	       -- "$workdir/patched_a.o" "$workdir/b.o"
+
+[ "$(count_input_symbols vmlinux.o dup_counter)" =3D 2 ] ||
+	fail "fixture did not produce two dup_counter symbols"
+has_input_section vmlinux.o .klp.symid ||
+	fail "objtool --klp-symids emitted no .klp.symid table"
+has_input_section vmlinux .klp.symid ||
+	fail ".klp.symid did not survive the link"
+
+# The premise: symbol table order and address order must disagree, or the te=
st
+# proves nothing.
+first_addr=3D"$(in_symbols vmlinux | awk '$8 =3D=3D "dup_counter" { print $2=
; exit }')"
+low_addr=3D"$(in_symbols vmlinux | awk '$8 =3D=3D "dup_counter" { print $2 }=
' | sort | head -1)"
+[ "$first_addr" !=3D "$low_addr" ] ||
+	probe_skip "linker did not reorder the two statics"
+
+assert_input_symbol dup_counter
+run_diff
+
+# Address order says 2.  Counting symbol table order would say 1.
+assert_klp_sympos dup_counter 2
+out_symbols | grep -q 'dup_counter,1' &&
+	fail "sympos 1 emitted: counted symbol table order instead of reading the l=
inked vmlinux"
+
+pass "vmlinux sympos taken from the linked image, not from symbol table orde=
r"
