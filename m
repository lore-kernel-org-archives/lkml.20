Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C64E36D2;
	Fri, 18 Sep 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726541; cv=none; b=dV1xj5il52jKk77CAQiNqeGynpSqquBIkJi8GvUfckjsmcVYc4GJ5jyOUuKtrUsvWbtltv3CVdUvgCBg9SRte7iesLOmPLCPaU5Oy7CF/cqV+VAPqkyx0O9SCLm92ivUwnq40OsnzYuPN/ntmsH1Kd8+6lB3ZR4EK5Pg8yLRHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726541; c=relaxed/simple;
	bh=ZJCkwIIhz6nJjJifWvDEqkQXuCHB7BB1QLHKKj9NruQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=teRbTLKLVDJgvLfvOpZcKUIiECvF2fiS4HRQ1lOIyZh+pRjKzXUxEb1wJPd7t7nOULJ5lRgnkT3UqG6RuEoMv6u2taKQ1mcI/lu6jZhMXvRrUWDYYN60zXLzh9+b0qo8fFvad6qzq6mS3F6AooN1rAm+e9wRahfZripKqx7je+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zWQXWOv1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NyGAEZBu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zWQXWOv1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NyGAEZBu"
Date: Fri, 18 Sep 2026 10:15:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726535;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20Ujmdr0d3sNyRdw78aiEQAIQqw7zfP08epgNuTfKHQ=;
	b=zWQXWOv1S0Gav0GOn3A8IkE+VYh82/DQ8CLw7CCTIomuTy52Dke8Ic5Jec/Vbs2nFG03rh
	juSJCVQvR/Maf4FGpgrtoqKvOUA9affoBNaHbLYv9yuOHAwm0izVH91GcxK66vK/ceThF9
	GwKtfUarcqOw02QTWflx8Ui2cn5/Crqn4xh3gODCXMAczwJbYhJ4eDMs/zHh+i8fDmPo/N
	OlIWwoN4EyrSUNJWtO2wf9bCK65bzugnxUo0rvZ9Cp6RNb46NyRDSfgU/LD4SRsYP6K2ZP
	7e0muFoJpS+YPp9xabFkLrShgpR2zDRbOmLUrryWTtGMGqO8ReUv5ULVnqxOKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726535;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=20Ujmdr0d3sNyRdw78aiEQAIQqw7zfP08epgNuTfKHQ=;
	b=NyGAEZBubUJkB5h5jxNcdzzi/jPG+VE92vYqZpBkjPzX6Ae4wPo2p2bAszFmHoHA68ke6f
	iTtlrm/PRXsfzQCA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for the contents of the
 klp_funcs list
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-32-song@kernel.org>
References: <20260916184351.2720310-32-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972653333.1720534.10042331576640998286.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     64205061f5e240498a242e6a2f8b27e0db15dc75
Gitweb:        https://git.kernel.org/tip/64205061f5e240498a242e6a2f8b27e0db1=
5dc75
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:24 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:29 -07:00

objtool/klp: Add test for the contents of the klp_funcs list

The patch list is what livepatch acts on, and asserting only that it exists
does not say it is right.  A function that should have been patched and is
missing leaves the bug in place; one that should not be there patches code
nobody changed.

The fixture changes two of three functions and asserts on all three: the
two by name, and the third by its absence.  It checks the strings in
.rodata.klp.str1.1 as well as the relocations, since the names the kernel
matches on are real strings.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-32-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/klp_funcs.c      | 31 +++++++-
 tools/objtool/tests/generic/test-klp-funcs-content.sh | 45 ++++++++++-
 2 files changed, 76 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/klp_funcs.c
 create mode 100755 tools/objtool/tests/generic/test-klp-funcs-content.sh

diff --git a/tools/objtool/tests/generic/fixtures/klp_funcs.c b/tools/objtool=
/tests/generic/fixtures/klp_funcs.c
new file mode 100644
index 0000000..3f0d3e2
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/klp_funcs.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Two changed functions and one untouched, so the patch's function list has=
 a
+ * length worth checking and something that must not appear in it.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int first(int x)
+{
+#ifdef PATCHED
+	return x + 11;
+#else
+	return x + 1;
+#endif
+}
+
+int second(int x)
+{
+#ifdef PATCHED
+	return x + 22;
+#else
+	return x + 2;
+#endif
+}
+
+int third(int x)
+{
+	return x + 3;
+}
diff --git a/tools/objtool/tests/generic/test-klp-funcs-content.sh b/tools/ob=
jtool/tests/generic/test-klp-funcs-content.sh
new file mode 100755
index 0000000..32fbd5f
--- /dev/null
+++ b/tools/objtool/tests/generic/test-klp-funcs-content.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# .init.klp_funcs is the list the kernel walks to decide what to patch, and
+# .init.klp_objects points at it.  Existing tests assert only that the secti=
ons
+# exist, which they do whether the list names the right functions, the wrong
+# ones, or none at all -- and a patch module with an empty function list loa=
ds
+# perfectly happily and patches nothing.
+#
+# Each entry pairs a name string in .rodata.klp.str1.1 with a relocation to =
the
+# new function, so both halves are checkable.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair klp_funcs.c
+run_diff
+
+assert_section .init.klp_funcs
+assert_section .init.klp_objects
+
+# Two functions changed, so two entries, each contributing a name relocation
+# and a function relocation.
+assert_reloc_count .init.klp_funcs 4
+
+# The functions that changed are named ...
+assert_reloc_sym .init.klp_funcs first
+assert_reloc_sym .init.klp_funcs second
+# ... and the one that did not is absent, from the list and from the patch.
+assert_no_reloc_sym .init.klp_funcs third
+assert_not_patched third
+
+# The names the kernel matches on are real strings, not just relocations.
+# readelf prints one per line as "[ offset]  <string>", so compare the whole
+# name: a word-boundary match would also accept ".text.first", since a dot is
+# not a word character.
+for name in first second; do
+	out_strings .rodata.klp.str1.1 | awk -v n=3D"$name" '$NF =3D=3D n' | grep -=
q . ||
+		fail "no '$name' string in .rodata.klp.str1.1"
+done
+
+# The object list has to reach the function list, or nothing is walked.
+assert_reloc_sym .init.klp_objects .init.klp_funcs
+
+pass "klp_funcs lists exactly the changed functions, by name and relocation"
