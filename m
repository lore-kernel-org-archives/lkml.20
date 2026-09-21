Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4227F47987B;
	Mon, 21 Sep 2026 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982911; cv=none; b=ktogOMhidJj6ei/5BEOeivR2+1DYWrAw8LsJkzf9EWXmBOqu11wVJyK8ANySMY395d/pWVpXkQi/0bKzU9CfcxYUrODJvNjgkwbF2jeBGg3FkOOe1dvGhZ4C3zYzpqfMj8Fn3M9BhxZgDZZ56a4mkQX80Sx4Rr3WU9nPJy8Twu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982911; c=relaxed/simple;
	bh=R+OdJAxX2RjS9CRCkJwT3JbLy2H1jRHm4womZZN0pIk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Q+LryUprh76oNmKGmYnoNYUgvAxV4UwQrkPjRixOyU02albQZMyQET7JveI222PCRXgz9nO56LrsJuiE68dpFT5EDWrY339PYicDgjrX5Lm6Yd6KVBDFb/hqbmGFmhn7o87T+83rOL45aE4owRcMHU6Q4MEbmp0YMBYbm4OJhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=leIEeQQE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/3ainNGg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="leIEeQQE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/3ainNGg"
Date: Mon, 21 Sep 2026 09:28:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982908;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EErho289tG/+ExpguMmPhYE5nEwVaiXlRperJwqjN5U=;
	b=leIEeQQEOOGGJxYYJdlbch7AIO44h2dHJ1ygqIcxrFQCueNcWC9oabDe7xHyG29G/RcOYZ
	LLPbhKtpUZ8/zngGVtYGobDokiJSE+BpltZ+JQX7bGwYenoiHFqfHICG4cdkKKX2eRuIZU
	+PX3ixAqmgEE3UVfWYXVnBNEdP/RhRtsRrNg3Vk9CEDbxGIcn6vFoGlewxG/9bgNF+41N+
	ZbHCHoLE6OcgOnuFPeC6iEE5L29uTPSgV6Ak3/htznZtOaU4D1OdwjhetenA9sOtZKstQH
	Z9VErtyZtYaU72oJdpr/xuNp7+LMrgY2lac30vW3fLKxJhO80Pn7Vqm+SvSW+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982908;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EErho289tG/+ExpguMmPhYE5nEwVaiXlRperJwqjN5U=;
	b=/3ainNGgGysDBH+PAnVUXMkopGkS6nF8l9Mst+4yD+dTv4tAUiHLJBMlohnvZaJBUHcAlU
	u6Sowd9mThhCOSDQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for selective special
 section extraction
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-19-song@kernel.org>
References: <20260916184351.2720310-19-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998290714.2819794.14662370429783379196.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     229ad17366de138ae8c4492d0c965d93bc848f4c
Gitweb:        https://git.kernel.org/tip/229ad17366de138ae8c4492d0c965d93bc8=
48f4c
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:11 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:03:07 +02:00

objtool/klp: Add test for selective special section extraction

Two functions contribute entries to one special section but only one is
patched.  Cloning the neighbouring entry drags in whatever it points at,
which is how a livepatch ends up holding relocations against unrelated
code.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-19-song@kernel.org
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
