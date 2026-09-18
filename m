Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED394E1C83;
	Fri, 18 Sep 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726529; cv=none; b=bAriYbHKHc6y4bXEpptQ1RxzJ98CNmemfyRcu6BqEejnt6HdrwK3+zSxu2ZhU0IBBRixXN4vovLLks6xGWqX5lV4WACWw56jEwSb8B/74MngTIyZ2pP/l3MV28c+pi+qGLKROtea8qkVQemsinX5XtJlRISGp0sr3fbqL+DNevE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726529; c=relaxed/simple;
	bh=SBewaxIxxD+iWYK50g80BEpEkl3N4/7NYM8bQ0n3ry0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IIVAxg3N0xc8yiYlJZIuInfgVn4rRJgC8ZC6WhplyzLhvxdEmxqqUY9ovmmB4orarfyQYLvfGg+idPgF1no4jZ7sDGXsIb7f3eo04Z7Cm8RiHQj3ZW4PXuD2GmMZJWRy1DvJSjKuUu0Y9mDJPYTCJetlOLtKHsn0OatJTE9uJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aE5JHiXg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xnErTbx8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aE5JHiXg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xnErTbx8"
Date: Fri, 18 Sep 2026 10:15:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6OAKnFdToZXbzR6nDY76U6elbHf3vBqVUs1rIKfoKo=;
	b=aE5JHiXgmIBY9rBoT5Q3KoEuyO4+04KbmM6D6LSp45Lplt2rzPjmjTf/t0kNtT4u9YLU4T
	1PfPBfSDkgKUEBzRdI9mhz0okznuy879pGLmEczV3R56oVegJtYv1lMuurU5A8QkrzLFqN
	oBP8oiIpeLN0dsyFbVO/HQz41ExWThxABEVR5/4aRL5jHKGn0C7hvFShKRTJWKKqmZI32l
	7aEwnbqKX1N1guFzLW6fSd5VfOBxSI9JBVsoWNQqiJZx5TbcOvFe94Q5z/iWOkqWoB0494
	4z1J2bpfk8tDz4qV4vupI6LabjeEtfF6qn/tj+usTtoLn1K446Uj468sjLlo0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6OAKnFdToZXbzR6nDY76U6elbHf3vBqVUs1rIKfoKo=;
	b=xnErTbx8VU4sP0OIoIgkcWzT2cvytRdw34iBBTvcdFy7tGWPkGFE6wnwOayaiq/hEw0a8Y
	0GygB8mzo/RKDiCQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for sympos in module objects
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-38-song@kernel.org>
References: <20260916184351.2720310-38-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972652288.1720534.2140248786398178752.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     4acb0ba0ac49da65d9031ab0c0a9427d66557ebd
Gitweb:        https://git.kernel.org/tip/4acb0ba0ac49da65d9031ab0c0a9427d665=
57ebd
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:30 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:44 -07:00

objtool/klp: Add test for sympos in module objects

klp-sympos.c had no coverage at all.  sympos disambiguates same-named
symbols for livepatch, counting from 1, with 0 meaning the name is unique.
Resolving to the wrong one is not a load failure -- it is a patch quietly
wired to the wrong object.

Covers the module path, where the position is a count in symbol table order
and klp diff can work it out from the object alone.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-38-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/sympos_dup.c | 32 +++++++++-
 tools/objtool/tests/generic/test-sympos.sh        | 51 ++++++++++++++-
 2 files changed, 83 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/sympos_dup.c
 create mode 100755 tools/objtool/tests/generic/test-sympos.sh

diff --git a/tools/objtool/tests/generic/fixtures/sympos_dup.c b/tools/objtoo=
l/tests/generic/fixtures/sympos_dup.c
new file mode 100644
index 0000000..7eded9b
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/sympos_dup.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A static whose name recurs in every translation unit that includes it.
+ * Compiled once for a single-copy object and twice, partially linked, for o=
ne
+ * with duplicates -- which is the only case where sympos is non-zero.
+ *
+ * FUNC_NAME keeps the referencing functions distinct so both get patched.
+ * Only the first copy carries .modinfo; two would be a second thing to
+ * disambiguate and is not what this fixture is about.
+ */
+
+#ifndef FUNC_NAME
+#define FUNC_NAME use_a
+#endif
+
+#ifndef NO_MODINFO
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+#endif
+
+/* volatile so it survives as an STT_OBJECT rather than being folded away */
+static volatile int dup_counter =3D 1;
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
diff --git a/tools/objtool/tests/generic/test-sympos.sh b/tools/objtool/tests=
/generic/test-sympos.sh
new file mode 100755
index 0000000..b71d493
--- /dev/null
+++ b/tools/objtool/tests/generic/test-sympos.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# sympos is what livepatch uses to tell duplicate symbol names apart in the
+# patched object: which "dup_counter" of several the relocation means.  Get =
it
+# wrong and the patch resolves to the wrong object at load time, silently.
+#
+# klp_find_sympos() reports 0 when a name is unique and a 1-based position w=
hen
+# it is not, so both need checking -- always reporting a position, or never,
+# each looks right in one of the two cases.
+#
+# This is the module path, counting symbol table order.  vmlinux is reordered
+# by the final link and goes through .klp.symid instead; that needs a linked
+# vmlinux next to vmlinux.o and is not covered here.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# One copy: the name is unique, so there is nothing to disambiguate.
+build_one sympos_dup.c orig.o    -DFUNC_NAME=3Duse_a
+build_one sympos_dup.c patched.o -DFUNC_NAME=3Duse_a -DPATCHED
+run_diff
+
+assert_klp_sympos dup_counter 0
+
+# Two copies: positions, in symbol table order.
+for p in "" "-DPATCHED"; do
+	# shellcheck disable=3DSC2086
+	build_one sympos_dup.c "a$p.o" -DFUNC_NAME=3Duse_a $p
+	# shellcheck disable=3DSC2086
+	build_one sympos_dup.c "b$p.o" -DFUNC_NAME=3Duse_b -DNO_MODINFO $p
+done
+partial_link "$workdir/orig.o"    "$workdir/a.o"         "$workdir/b.o" ||
+	probe_skip "partial link unavailable"
+partial_link "$workdir/patched.o" "$workdir/a-DPATCHED.o" "$workdir/b-DPATCH=
ED.o" ||
+	probe_skip "partial link unavailable"
+
+# Without duplicates in the input there is nothing for sympos to number.
+[ "$(count_input_symbols orig.o dup_counter)" =3D 2 ] ||
+	fail "fixture did not produce two dup_counter symbols"
+
+run_diff
+
+assert_klp_sympos dup_counter 1
+assert_klp_sympos dup_counter 2
+# ... and nothing still claiming the name is unique
+out_symbols | grep -qE '\.klp\.sym\.[^.]+\.dup_counter,0([[:space:]]|$)' &&
+	fail "sympos 0 emitted for a duplicated symbol"
+
+pass "sympos numbers duplicate symbols and stays 0 for unique ones"
