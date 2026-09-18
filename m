Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C14EC670;
	Fri, 18 Sep 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726558; cv=none; b=WCuZlVxm4hemvLQ+PHJSp/KLcoH+0nFPdw5raiqyxn0gJw1U4ykUkBfGKypbgg928iGzbQWhCpbyNkb1ssc5n1blQ6Yq9iMViRUEMOf0XdCNMB5EC9aTHz2pBM0NggugNe8aWx4vJAVLTzcLjSXtWACArwz4j1/nHVESFXAKWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726558; c=relaxed/simple;
	bh=BOZDomQffXLr1fJwko6M7fmHPFcnJvEANuu2onYQI9o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Al1fus/hLpPCKgJtOTxsJtNtuq/f0XkSgOBP2r2JSu9NmX9L68W+JPcWXcqrF2CRYmBM822drq7IjOb1gNW1Tg1yLv15eoHAx1W91Pzidu97oEisQEaXh6sdoU5iVMTxsYAySfAReGSZlaqQiVsjf3KI61hYt8fPgxLmggcnJ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kiw0xA9O; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=stI9GkuC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kiw0xA9O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="stI9GkuC"
Date: Fri, 18 Sep 2026 10:15:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726554;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qL/TTzVHBaw8w2EZcUoXrxklZQY6iKvG370qgzUaBvM=;
	b=Kiw0xA9OQXqlWeqAJuArVpv/JcBqrXs5w9NF2oYf1b+ycVYkmlEBe00iLLlnq/b1mZkbV+
	WEvUUoHl4oWr4SZpGQQiGwG0L4p//lhY3uF6bvxuRRIF56yzr9QZM2YQBAqnvI3tdMaql+
	tvdgMOozUTX+l3wc6EXDtaJkD6CzKHA4ZCEMD2m0ZOS+45cVqptfHz0TLsYrB+sXUlotzB
	WzIXKzlvUCbyPjdnkmwbuUPicWYYiy2EXcwrxXi88nLTNU/729nFJJ1+wPMwUP6YFRw/an
	RbXbAUFGpbTJknshegrLXvZP1uyRUP38Abt794qgI5k6nmifj+0KzxL6ggH4cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726554;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qL/TTzVHBaw8w2EZcUoXrxklZQY6iKvG370qgzUaBvM=;
	b=stI9GkuCRDUjJ00TGIcFtULX0Fcf1vGpxJjzyseNaj+lSP1JfxITlLGCxxhIcqSSNYu4gx
	0k4aFwucuQgG9qBQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for selective special
 section extraction
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-19-song@kernel.org>
References: <20260916184351.2720310-19-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972655318.1720534.16052466813249231193.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     2b77d5104c9b201709a07a58a31a2944dc325da2
Gitweb:        https://git.kernel.org/tip/2b77d5104c9b201709a07a58a31a2944dc3=
25da2
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:11 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for selective special section extraction

Two functions contribute entries to one special section but only one is
patched.  Cloning the neighbouring entry drags in whatever it points at,
which is how a livepatch ends up holding relocations against unrelated
code.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-19-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/special_section_shared.c | 31 +++++++-
 tools/objtool/tests/generic/test-special-section-shared.sh    | 26 ++++++-
 2 files changed, 57 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/special_section_shar=
ed.c
 create mode 100755 tools/objtool/tests/generic/test-special-section-shared.sh

diff --git a/tools/objtool/tests/generic/fixtures/special_section_shared.c b/=
tools/objtool/tests/generic/fixtures/special_section_shared.c
new file mode 100644
index 0000000..f54e24f
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/special_section_shared.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Two functions contribute to one special section; only one is patched. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int other(int x)
+{
+	asm volatile(
+		"2:\n\t"
+		".pushsection	.kcfi_traps, \"a\"\n\t"
+		".balign	4\n\t"
+		".long		2b - .\n\t"
+		".popsection\n\t");
+	return x * 5;
+}
+
+int target(int x)
+{
+	asm volatile(
+		"1:\n\t"
+		".pushsection	.kcfi_traps, \"a\"\n\t"
+		".balign	4\n\t"
+		".long		1b - .\n\t"
+		".popsection\n\t");
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-special-section-shared.sh b/too=
ls/objtool/tests/generic/test-special-section-shared.sh
new file mode 100755
index 0000000..05c6110
--- /dev/null
+++ b/tools/objtool/tests/generic/test-special-section-shared.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Only the patched function's special section entry may be extracted.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair special_section_shared.c
+
+has_input_section orig.o .kcfi_traps ||
+	probe_skip "fixture produced no .kcfi_traps on this arch"
+
+run_diff
+
+assert_patched     target
+assert_not_patched other
+assert_section     ".kcfi_traps"
+
+entries=3D"$(out_relocs | awk '/rela\.kcfi_traps/,/^$/' | grep -c 'target')"
+[ "$entries" =3D 1 ] || fail "expected one .kcfi_traps entry, found $entries"
+
+out_relocs | awk '/rela\.kcfi_traps/,/^$/' | grep -q 'other' &&
+	fail "the untouched function's entry was dragged in"
+
+pass "only the patched function's entry extracted"
