Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF134CB8B7;
	Fri, 18 Sep 2026 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726502; cv=none; b=GIkMpsBRJUnWQjiy2Risg0h/gt6NG+6jlu/36KGDvzTCDa4QKEIfkNHKOPsoJBd3hOC1Bu+komDXzXcpQHqYGUCfxbeKwv9zsiZ9hQeND0tJkiqnl3aRQmpiFavoLRMnw/KcbChQx3TAFksvt3x50yw+pfXolO1ajxwqePs7tmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726502; c=relaxed/simple;
	bh=bqZ5U7hYXFvo1Pdc8YKLNQI/V2Z5AttQpYzn25i+2es=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Bb6mVZE9kSdmLAAf9BKgdfEwQN0f+eDPZvilTtFGSEQlD8m2DquaPBbPPYa7AF2bXaeNNVF8R/5fDGfJfbN+uY2j0mUgZCpZzW5yZ9nuL6Q8DqbMLyopcNeOax5/wkFZgblBENc//ZbLOw8XeCHx4vGYHZBibMKtjuahcq8nXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=al4574YL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jlrS1IWB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="al4574YL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jlrS1IWB"
Date: Fri, 18 Sep 2026 10:14:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726498;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPlBRxdkJgSnic2HondeRp9AHQMr50Cd697ym6mRoVQ=;
	b=al4574YL0XoSGauomTmkeL+uOP++c5/qjKkaTnIhh78YNRZ/BkBszu90h1G6vPaQG2kDpI
	ZIpibwZbRlXubvzrVnuTVoK9VqT5md2Dw6OMT0zqFYV9Y4yCqKfsjRyZGl3usLoUUS7sS6
	WmMPz9RrkI1y4kGgQYAf5Dvb3OdZGIKNDOzrEskigShzfxGHBhARxnVJgHKcZmHlCfY4PR
	zEXaxbPGseXpYWe23uU/ch1QEqBKLyrS1j2Ibx1DTHNCjAcSoR1gWNpN/2Wzzn0s9mj9HU
	8ZtTgQrldsIm+X1imGan1qESb1UNpuJU8qTjLZT6yxsXLw9otVkNdJhLpzrw+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726498;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPlBRxdkJgSnic2HondeRp9AHQMr50Cd697ym6mRoVQ=;
	b=jlrS1IWB+6Z8/ByRTLzuI/22N55EqWb5sXf6dVrkO0xmAIJjPuLNyuL0vHCW+i7yu0vMms
	WQQiGHN7R7G9hqCg==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for the alignment of cloned
 data sections
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-54-song@kernel.org>
References: <20260916184351.2720310-54-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972649674.1720534.17274764026198811548.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     be1044af0c4d9319427ab35aa915b9af01d7608a
Gitweb:        https://git.kernel.org/tip/be1044af0c4d9319427ab35aa915b9af01d=
7608a
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:46 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

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
Link: https://patch.msgid.link/20260916184351.2720310-54-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
