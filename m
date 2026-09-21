Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B1D486B8C;
	Mon, 21 Sep 2026 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982879; cv=none; b=NwBM08mOjpB2sqRofwuzLRHE6S3GFf9Ht5i9710LlHf0x8NojDaM8kZXJrKrZCFAcCIvsYk8ISoYvlTsf+xMmW2QtnxvSd/ozJjKVHPBivR1GNuotO3nF/kfpUDrtxv0WO5fb9cMDfVw8ax+kTspuv0CC8tO1uPSKbsAJwB65WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982879; c=relaxed/simple;
	bh=Lfy9YAv6jx6DjVpOddlqgLw4/5DRZPaX0OZJ0J1SJcc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mjt4drMEaSQQ3jpfPJ/SVvPNt4bmZNpoQhT5sS/bvhu8Mmu8h44YqhTFfKq4UaDBGE2s/1lIqD4gYQl5g2Tx3DVVjtOSHxUHc4tTATig+HlhvUw7EPkJLTIXJw3OKUlffJKFyHRdGtQVWHKx1XwNBH42tnL85k/tpPDMZvqsnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Q9nBifls; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L0ymX43K; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Q9nBifls";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L0ymX43K"
Date: Mon, 21 Sep 2026 09:27:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982876;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtAzH+Qh7jUrJKHfegqSnBcUvUvC9Jvv0Oc1TmzcJWM=;
	b=Q9nBifls+ggosE6M87rQ/V2pHEQ1AOD1O0L95qHeSy/kUBe3a8r+IxiXiNPwfifsAiI/ny
	EvIfcZBp86bZm9UbIrkXBjGh+nRvgssS0uyU+HrsP8hX7x2f3CvM1hmMG8auYJlXKZY+wI
	hzCmejLnwwAp1JeZK7OaM8kL5SI5Fr1ulpUlakwS13xOR+rO+BFlxQ7owfgzODmuW1b/zT
	MC3L1yrkxm0xmyQXiEHTmY36u8VLfZenoYFc56pXItAgzuRHdSoHq/wEl674ACK+nSMsEk
	UseQ+c/+kaTh26QHvvaTYu4a+2W4QbilFI2wX/EaWmL2h2S1pN33cpumicwTCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982876;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtAzH+Qh7jUrJKHfegqSnBcUvUvC9Jvv0Oc1TmzcJWM=;
	b=L0ymX43KALwdI/gZdU/v4wOd6Mpx1pFFsIUvQdtLvP2UZPWqGJUp/l8DPhgWpsG1CUhRH8
	rAuNbZmUj9q1xMCA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for __bug_table, __ex_table
 and __mcount_loc extraction
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-41-song@kernel.org>
References: <20260916184351.2720310-41-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998287491.2819794.4267780323283873093.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     ce30479ff1d69654e455cf06b043839d43b63628
Gitweb:        https://git.kernel.org/tip/ce30479ff1d69654e455cf06b043839d43b=
63628
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:33 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Add test for __bug_table, __ex_table and __mcount_loc extraction

Three special sections with no coverage.  An entry that is not carried into
the patch is not a build failure: the patched function simply loses its
WARN_ON location, its exception fixup, or its ftrace callsite, and nobody
finds out until one of them is needed.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-41-song@kernel.org
---
 tools/objtool/tests/x86/fixtures/special_sections.c | 77 ++++++++++++-
 tools/objtool/tests/x86/test-special-sections.sh    | 42 +++++++-
 2 files changed, 119 insertions(+)
 create mode 100644 tools/objtool/tests/x86/fixtures/special_sections.c
 create mode 100755 tools/objtool/tests/x86/test-special-sections.sh

diff --git a/tools/objtool/tests/x86/fixtures/special_sections.c b/tools/objt=
ool/tests/x86/fixtures/special_sections.c
new file mode 100644
index 0000000..d427988
--- /dev/null
+++ b/tools/objtool/tests/x86/fixtures/special_sections.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A special section entry belonging to a patched function.  SPECIAL_SEC pic=
ks
+ * which section, since klp diff treats eight of them alike and each needs
+ * extracting for the patched function and no other.
+ *
+ * The entry is written out by hand so the fixture builds without kernel
+ * headers.  Only the leading relocation matters to klp diff; the rest is
+ * padded to the section's real entry size, because the entries have to be t=
he
+ * right length for the boundaries between them to fall in the right places.
+ *
+ * SPECIAL_RELOCS covers __ex_table, whose entries relocate both the faulting
+ * instruction and its fixup; objtool rejects one with only the first.
+ */
+
+#ifndef SPECIAL_SEC
+#define SPECIAL_SEC "__bug_table"
+#endif
+#ifndef SPECIAL_ENTSIZE
+#define SPECIAL_ENTSIZE 12
+#endif
+#ifndef SPECIAL_RELOCS
+#define SPECIAL_RELOCS 1
+#endif
+
+#define STR_(x) #x
+#define STR(x) STR_(x)
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+/*
+ * other() gets an entry of its own, so that "the untouched function's entry
+ * was not dragged in" is a question the section can actually answer.  With
+ * only target() contributing, there is nothing for klp diff to leave behind
+ * and the negative assertion holds however the extraction behaves.
+ */
+int other(int x)
+{
+	asm volatile(
+		"3:	nop\n\t"
+		"4:\n\t"
+		".pushsection " SPECIAL_SEC ", \"aM\", @progbits, "
+			STR(SPECIAL_ENTSIZE) "\n\t"
+		".long 3b - .\n\t"
+#if SPECIAL_RELOCS > 1
+		".long 4b - .\n\t"
+		".fill " STR(SPECIAL_ENTSIZE) " - 8, 1, 0\n\t"
+#else
+		".fill " STR(SPECIAL_ENTSIZE) " - 4, 1, 0\n\t"
+#endif
+		".popsection\n\t");
+
+	return x + 9;
+}
+
+int target(int x)
+{
+	asm volatile(
+		"1:	nop\n\t"
+		"2:\n\t"
+		".pushsection " SPECIAL_SEC ", \"aM\", @progbits, "
+			STR(SPECIAL_ENTSIZE) "\n\t"
+		".long 1b - .\n\t"
+#if SPECIAL_RELOCS > 1
+		".long 2b - .\n\t"
+		".fill " STR(SPECIAL_ENTSIZE) " - 8, 1, 0\n\t"
+#else
+		".fill " STR(SPECIAL_ENTSIZE) " - 4, 1, 0\n\t"
+#endif
+		".popsection\n\t");
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/x86/test-special-sections.sh b/tools/objtool=
/tests/x86/test-special-sections.sh
new file mode 100755
index 0000000..8dfaa4f
--- /dev/null
+++ b/tools/objtool/tests/x86/test-special-sections.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# klp diff extracts entries from eight special sections.  Between them the
+# existing tests reach .kcfi_traps, __jump_table, .static_call_sites and
+# .altinstructions; __bug_table, __ex_table and __mcount_loc are covered by
+# nothing, though the same extraction code serves all of them.
+#
+# Losing an entry is quiet in every case and wrong in a different way for ea=
ch:
+# a WARN() in patched code that no longer reports where it came from, an
+# exception fixup that is simply not there when the faulting instruction tra=
ps,
+# a function ftrace can no longer see.
+
+. "$(dirname "$0")/../lib.sh"
+
+
+# section, entry size, relocations per entry
+for spec in "__bug_table 12 1" "__ex_table 12 2" "__mcount_loc 8 1"; do
+	set -- $spec
+	sec=3D$1
+
+	# A fresh workdir per section: run_diff caches its checksums.
+	setup
+	build_pair special_sections.c \
+		-DSPECIAL_SEC=3D"\"$1\"" -DSPECIAL_ENTSIZE=3D"$2" -DSPECIAL_RELOCS=3D"$3"
+
+	assert_input_section "$sec"
+	run_diff
+
+	# Extracted, and pointing at the function that was patched.
+	assert_section "$sec"
+	assert_reloc_sym "$sec" target
+	assert_patched target
+
+	# Nothing belonging to the function that was not.
+	assert_not_patched other
+	assert_no_reloc_sym "$sec" other
+
+	cleanup
+done
+
+pass "__bug_table, __ex_table and __mcount_loc entries extracted"
