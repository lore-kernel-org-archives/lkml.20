Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855F46EC6A;
	Mon, 21 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982860; cv=none; b=MhMjzW2TMgFMe5G74bTcdsMJjDbF0IGlVEBWxewwo/zBB/5Lk3TX72gcikAPMb4R6KwTCNveSxg17qIDiH9IYIJ2amMEje88L4yBdKzFVKvFse+3O8yBN0+nppAciRfy/XJGKQlWl2052xEyyqT+I7EovnEev2LDuFe/Nj4ZDTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982860; c=relaxed/simple;
	bh=tLPywcEYUXVdhmVt8vSeL4afuEFZu2NYw3RnrI88HA0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Lvk//gO4PAPft59+9iJSUPQ5Dx4QXUKJzFqCNyen7dL3UkUhLBferI+y3G34nwiQTGxYACy64BvckCSNdwJomGrPnsfWEA2ZjLkzfCicmlHolqhE+q03l412liwXate72euLetZ9+d6sv9KGxQoJhOHnWbogH7S2WJYDwjzaCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WhcCvq+c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=22nHbNe5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WhcCvq+c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="22nHbNe5"
Date: Mon, 21 Sep 2026 09:27:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982856;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQ88VmrNnxd+QDNHbFWvv5g5d/9p7puwFI8IQOD8Fs0=;
	b=WhcCvq+cx9A9uclaMunGcB/5PqsXqra3BWUbYA6UUykFtlM9njIi2wPJ0o9qfyShqlWSJI
	L9nk5m5cMF9xCLDAzjLM/Ikte79lIOWgedE+bSiSo1u1tkOf6GOH3g5y/EpnaXLTQeaqYB
	MkhwNYy5bw9A6GY3nr8ViksQt6uuICrOEHZS+SQYYfMyBQ3iCh5w1Ycew9Rqjdt3y3d6aO
	g/OKg7gZb9MVgkx5xNJEk9sLo7+FkHtXmIHoEIjEk6xOK6pGLgFdZqOUPcVnMYWefURn0G
	qefHI2hibO002RR9yAtp+BbvR5Fk1Dnw9S83PCmhPT09usWe2G0y9hmni+vnXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982856;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQ88VmrNnxd+QDNHbFWvv5g5d/9p7puwFI8IQOD8Fs0=;
	b=22nHbNe5aLolBS7INefJG1eYOgmnBDKSRkVwa9yHlFE1Gw1r3Ca966DTRdaVFnJnSrIZBg
	5WcU4fRl3UjSC2Bg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for the alignment of cloned
 data sections
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-54-song@kernel.org>
References: <20260916184351.2720310-54-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998285498.2819794.14346632279473945167.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     8abe5c94bfeb9bb5cf02fa17a9337d2d7bbade75
Gitweb:        https://git.kernel.org/tip/8abe5c94bfeb9bb5cf02fa17a9337d2d7bb=
ade75
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:46 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Add test for the alignment of cloned data sections

A cloned data section has to keep its sh_addralign.  Plenty of kernel data
is aligned for correctness rather than speed -- per-CPU variables, anything
touched by an aligned vector move, structures padded to own a cacheline --
and a clone that lands under-aligned either faults on first use or silently
shares a line it was laid out to avoid.  Neither shows up until the patch
is loaded on hardware that cares.

The fixture's data is new in the patched build, so klp diff has to clone it
rather than reference the kernel's copy, and it asserts that premise before
asserting the result.

Commit 2f2600decb30 ("objtool/klp: fix data alignment in __clone_symbol()")
cannot be reverted to check this -- the revert is a no-op against the
current code, which has been rewritten since.  Verified instead by forcing
the clone's alignment to 1, which the test reports as "alignment 1,
expected 64".

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-54-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/data_alignment.c | 29 +++++++-
 tools/objtool/tests/generic/test-data-alignment.sh    | 40 ++++++++++-
 2 files changed, 69 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/data_alignment.c
 create mode 100755 tools/objtool/tests/generic/test-data-alignment.sh

diff --git a/tools/objtool/tests/generic/fixtures/data_alignment.c b/tools/ob=
jtool/tests/generic/fixtures/data_alignment.c
new file mode 100644
index 0000000..900253d
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/data_alignment.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Data with an alignment stricter than its size.
+ *
+ * A cloned data section has to keep its sh_addralign.  The kernel has plenty
+ * of data whose alignment is a correctness property rather than an
+ * optimisation -- per-CPU variables, anything touched by an aligned SSE mov=
e,
+ * cacheline-aligned locks -- and a clone that lands under-aligned faults or
+ * silently shares a cacheline it was written to avoid.
+ *
+ * The object is new in the patched build, so klp diff has to clone it rather
+ * than reference the kernel's copy.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+#ifdef PATCHED
+int aligned_data[2] __attribute__((aligned(64))) =3D { 1, 2 };
+#endif
+
+int target(int x)
+{
+#ifdef PATCHED
+	return x + aligned_data[0];
+#else
+	return x;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-data-alignment.sh b/tools/objto=
ol/tests/generic/test-data-alignment.sh
new file mode 100755
index 0000000..8e38954
--- /dev/null
+++ b/tools/objtool/tests/generic/test-data-alignment.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A cloned data section keeps its alignment.
+#
+# Plenty of kernel data is aligned for correctness rather than speed: per-CPU
+# variables, anything touched by an aligned vector move, structures padded to
+# own a cacheline. A clone that lands under-aligned either faults on first u=
se
+# or silently shares a line it was laid out to avoid, and neither shows up
+# until the patch is loaded on hardware that cares.
+#
+# Fixed by 2f2600decb30 ("objtool/klp: Fix alignment of cloned data
+# sections").
+#
+# Covers the same ground as corpus/x86_64/cloned-data-alignment in Joe
+# Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair data_alignment.c
+
+# The premise: the compiler really did over-align it, and the object is new =
in
+# the patch so it has to be cloned rather than referenced.
+want=3D"$(in_sections patched.o | sed 's/^ *\[[ 0-9]*\] *//' |
+	awk '$1 =3D=3D ".data.aligned_data" { print $NF }')"
+[ "$want" =3D 64 ] ||
+	probe_skip "compiler gave .data.aligned_data alignment '$want', not 64"
+has_input_section orig.o .data.aligned_data &&
+	fail "fixture put aligned_data in the original; nothing to clone"
+
+run_diff
+assert_section .data.aligned_data
+
+got=3D"$(out_sections | sed 's/^ *\[[ 0-9]*\] *//' |
+       awk '$1 =3D=3D ".data.aligned_data" { print $NF }')"
+[ "$got" =3D "$want" ] ||
+	fail "cloned .data.aligned_data has alignment $got, expected $want"
+
+pass "cloned data section keeps its alignment"
