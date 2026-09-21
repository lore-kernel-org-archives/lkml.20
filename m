Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD3489FC9;
	Mon, 21 Sep 2026 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982885; cv=none; b=GK6vQmGZwERZLe3HPG0Ix+oClbgOc2hBHg3QD2ycKGjAuGk20Yi26IZo/Bz9tWjPzTXAnIJ7qgVmMdjGnysUW+gQMQzG9PhUH5MXvvW3Enbrc8ArIMUde95KxhPrSIKf+zNEV4ovoK9cQOZhM5NXkJjWiLLgISIpWlFSA8F4cbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982885; c=relaxed/simple;
	bh=5ipM/4TpBJ/dIoAIy4O0zmqozeeEmpOT8ejt1oURk9o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Nz3YAhgv2jgGiyUP++6qrus70F5q4CUT7JLOuF8dvAXsFJYN0fchnfIQogBjyEu8sBbNPYgFZt+R/YUxLM1n9wNBdkjjpTTHROOsZUJwpzcNUCtK0U4KScwSHEPZT5ivU2dU/Geap6zvLe7wdNZsVWoIQYmrhJzUOOwoozS+bAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XYXDttHr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pnZkbBh3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XYXDttHr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pnZkbBh3"
Date: Mon, 21 Sep 2026 09:27:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982880;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6w8ryZMRc6Q7zvNTDB3ap4q5IP9ZjThUfyO3RZg+nKI=;
	b=XYXDttHrkE2KyZPtY5/ZPow8fCEgoYGvH3H2ifRF5QCevZ1j0UV5Qo/2yfb37AyFnP2yOr
	8NSX1tYd5Q/eUEJJFlF5YZjmYyAyCw1DBUTqHukhQzDwjJtBweQCXBmY0hjKGiBtMCajGp
	dna7PLOHLqpAVCnTyPJR6C+a2kTY8Gb/7SA95qHd+7DxFMPIqiYJ2FDQ5L9zW8CE+Hv/LU
	pVt0fdCQ+kZ0mY0gXAmfhf1xUHOoSdlZXYHvwLx/MZ+CWLP3W/MIGBcAu4p+QAQbHdtVML
	BDcMVIRxWLnUWGGbf+3wuHDM6LhpxlIX+Z7QF9Xbjgeocyr+1VVs6Y90RVFPfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982880;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6w8ryZMRc6Q7zvNTDB3ap4q5IP9ZjThUfyO3RZg+nKI=;
	b=pnZkbBh3/Jf5AeK+bFQ9hJHwKOTIANLw/oIwh/8/iHv18jE1yml+LkmcERmb0WZRrQiawa
	g6/o3aZm8pMmLNAg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for sympos in module objects
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-38-song@kernel.org>
References: <20260916184351.2720310-38-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998287914.2819794.10135943269201374465.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     638df22cc3f894d79a2d332c34739575ba50770b
Gitweb:        https://git.kernel.org/tip/638df22cc3f894d79a2d332c34739575ba5=
0770b
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:30 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

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
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-38-song@kernel.org
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
