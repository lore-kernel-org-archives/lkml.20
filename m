Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502146EF89;
	Mon, 21 Sep 2026 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982878; cv=none; b=fNgK5pyop20S6y6EKMSj3KZVVAyLsw+qA1Ab/ZZWQv8wc5mZjZIERMA3K9UlDxINBB5minY+eB8vM124BC/mRLXURJiuYJFXvOHrvmTZQjiHkcaOtu6L239blQWERYR2NulbxR02pP+IVnL7td0of8EOsTMMVk6fvwhFcJQKQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982878; c=relaxed/simple;
	bh=4CyvxVX1q6P6Tc9LnWq70+orYR0nJDRlbgUXMmv0XM0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=NZMpP3TR7oB8KLojaR4PWonR6VeYNhiQkHDl2EtPpoGz8D+fTtghr763l7Slz9wmsu3mfMSrrBbqu6I6uHz0p/SZYs5HxeDUvXFM5EnAh/nqWXtKkg31LRm/DT7imZ4+IoJX2Pa51V1fXaRChuZKW8ricF4SsBU9qPttFPjJ3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D574kNxL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ksl75Zl2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D574kNxL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ksl75Zl2"
Date: Mon, 21 Sep 2026 09:27:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982875;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9f3Tp893x4bhOnGYsARMzwCNLGaQq7IXmq8uhaZKtNU=;
	b=D574kNxLBCXJIh3EQw9U+DxIBgn4VyuhNq4uJ7gTHJfmUyyk3Gcs4rjZgQokr75xyF6hMs
	B7Vckwogo6EdpCta319YtHRUiNNV0xhXNq8FL24kel6ANIBmEZ/8dTaSA1LF+0kVkvyrCD
	0CnROii5M8lHak3EiPCo/JV+oGOBfsgpyo78E0EUJTSgonQrumyktS1XMHxzLNSQTvtXUL
	r71wEVQfkkxSFtJkSXAnvbTvkjrT/sNRu7y/m7hzTNjD0+pf4o8IIDc5ehGTgLUgm8xaCu
	3xXuXrx6sE8acJwR5tH49fWq6Q4nRVyACtF9Jh0lGH6kf2A9yJ+RLxd5a3b32Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982875;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9f3Tp893x4bhOnGYsARMzwCNLGaQq7IXmq8uhaZKtNU=;
	b=ksl75Zl2C2G2HQy10LHfyfWGyowF9EXMfZ7H+kW4YwANv8MktAApxXsfeyKsUZ44fAIvbJ
	IxWH4m7F+DxijUDQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for kCFI prefix symbols and traps
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-42-song@kernel.org>
References: <20260916184351.2720310-42-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998287341.2819794.14529246700104224793.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     62ef20415b92885574e093f2cbd3a8202a696365
Gitweb:        https://git.kernel.org/tip/62ef20415b92885574e093f2cbd3a8202a6=
96365
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:34 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Add test for kCFI prefix symbols and traps

Two properties, asserted separately because they fail differently:

  - the __cfi_<func> prefix symbol has to be carried with the patched
    function, or the function has no type identity and indirect calls to it
    trap;
  - its .kcfi_traps entry has to be extracted, or the trap is not
    recognised as a CFI failure and a clean report becomes an oops.

test-special-section hand-assembles a .kcfi_traps entry, which is what
makes it catch commit 7df1638df97b ("objtool/klp: Fix .kcfi_traps special
section extraction").  Nothing until now built real kCFI code.

This tests the behavior of commit da4326573ae8 ("objtool/klp: Fix kCFI trap
handling").  Commit f7ceffd21a8a ("objtool/klp: Fix kCFI prefix
finding/cloning") cannot be tested as such, its code having been rewritten
by commit fe6a87e0abac ("objtool: Improve and simplify prefix symbol
detection"); this guards the current implementation's behaviour instead.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-42-song@kernel.org
---
 tools/objtool/tests/x86/fixtures/kcfi.c | 39 ++++++++++++++++++++++++-
 tools/objtool/tests/x86/test-kcfi.sh    | 39 ++++++++++++++++++++++++-
 2 files changed, 78 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/kcfi.c
 create mode 100755 tools/objtool/tests/x86/test-kcfi.sh

diff --git a/tools/objtool/tests/x86/fixtures/kcfi.c b/tools/objtool/tests/x8=
6/fixtures/kcfi.c
new file mode 100644
index 0000000..b62fc60
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/kcfi.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * An indirect call, which under kCFI is preceded by a type check and a trap.
+ *
+ * Clang emits a __cfi_<func> prefix symbol carrying the type hash ahead of
+ * every address-taken function, and records the trap site in .kcfi_traps.
+ * Both belong to the function and both have to come with it into a patch.
+ *
+ * Needs -fsanitize=3Dkcfi, which only Clang has.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+static int impl_a(int x)
+{
+	return x + 1;
+}
+
+static int impl_b(int x)
+{
+	return x * 2;
+}
+
+__attribute__((noinline)) int (*pick(int x))(int)
+{
+	return (x & 1) ? impl_a : impl_b;
+}
+
+int target(int x)
+{
+	int (*fn)(int arg) =3D pick(x);
+
+#ifdef PATCHED
+	return fn(x) + 2;
+#else
+	return fn(x) + 1;
+#endif
+}
diff --git a/tools/objtool/tests/x86/test-kcfi.sh b/tools/objtool/tests/x86/t=
est-kcfi.sh
new file mode 100755
index 0000000..b583ef6
--- /dev/null
+++ b/tools/objtool/tests/x86/test-kcfi.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Under kCFI an indirect call checks a type hash before jumping, and traps o=
n a
+# mismatch.  Two things belong to the calling function and must come with it
+# into a patch:
+#
+#   - the __cfi_<func> prefix symbol holding the hash.  Lose it and the patc=
hed
+#     function has no type identity, so indirect calls to it trap.
+#   - its .kcfi_traps entry.  Lose that and the trap is not recognised as a
+#     CFI failure, so what should be a clean report becomes an oops.
+#
+# Neither shows up at build time.
+
+. "$(dirname "$0")/../lib.sh"
+
+clang_only "kCFI is a Clang feature"
+
+setup
+
+# Declared above that this is Clang's; a given Clang may still be too old.
+cc_supports -fsanitize=3Dkcfi ||
+	probe_skip "this clang does not support -fsanitize=3Dkcfi"
+
+build_pair kcfi.c -fsanitize=3Dkcfi
+
+assert_input_section .kcfi_traps
+assert_input_symbol __cfi_target
+
+run_diff
+
+assert_patched target
+
+# The prefix symbol comes with its function ...
+assert_symbol __cfi_target
+# ... and so does the trap entry.
+assert_section .kcfi_traps
+
+pass "kCFI prefix symbol and trap entry carried with the patched function"
