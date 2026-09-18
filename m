Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060A4E7808;
	Fri, 18 Sep 2026 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726554; cv=none; b=byrOnKEYOHpB6mkzr36qK48Vm2ewvVYr6bCGB06DHKLjk1MXpy95YhEoyrQsVZ8w+gohu+ERiCFbcMNSVygPj9VJkiEPG57iLCp3iDqnAUicMcGZ+Y2OEvNdLXXvJcmOwoL54wDRHVcj4wILYrmcruf7wMMZkoApICkta4/t4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726554; c=relaxed/simple;
	bh=533qTNweqcf+OxS25VVfOo5vQlzvvBwecbaB914qbwg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ecdg7nyaTGlF5rO8LSoL1mMGwRpgJMfrnQIHhSODpUOjm4/R9AAHCiexuNt19ghXU8AwYcUH97cIhPBNsTv0oJd2+N1TWLJoufIRKXECK7yYLOXg0gzD0axdQCOqT4Qh2in6Qow2ro1WdMp/NYrQZD0HTOONr5jI/rcjcHFdwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CPgUHowi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/pM8vSlg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CPgUHowi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/pM8vSlg"
Date: Fri, 18 Sep 2026 10:15:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726548;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzdVlLMcmN69KMAhq+MJmfwyQKKTYNh7SElIokbcRjc=;
	b=CPgUHowiWxNRbST11POFkhRMGQshMfSrjwqTKjaszpouHRzY4yWzAkNaPZTOR8Hwykyay4
	P7n0koDuS8qW8uLcLR+0dKqhsgcFsApanWqoiptp222x0m1rBXWTT4vDCnYCBB6mtSXmCG
	d1YsLj/EcVmIKZgoS7fHi5F7xNr35982xqUU7EyZPMHkNXNSCxYx/2v0Eyb+ETDFYRTHw6
	JrUq1zOhz9TW3/QgUtoDAIj8EIMqRNjCSNjnIif/pFqW+RrsbZIpKCjFOAKcNrpSm6Ok6D
	Mga8yGbLKdZDUyXUPz5rLquOcnF5BtRzxSOMB/d5g06xu/SUUUAKIMWoEeq/Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726548;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzdVlLMcmN69KMAhq+MJmfwyQKKTYNh7SElIokbcRjc=;
	b=/pM8vSlg0yj4lu6shhdCG53xpeHs3LuqBkPFj4q3ZMgPbHwnuaYgJANVAjcn6RNO27WRoO
	OEOkSK92rPXx8HCw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for symids in discarded sections
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-23-song@kernel.org>
References: <20260916184351.2720310-23-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972654702.1720534.2765960196381161886.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     9e0b518e549b531c849d6b1cdf3725c8c503ca80
Gitweb:        https://git.kernel.org/tip/9e0b518e549b531c849d6b1cdf3725c8c50=
3ca80
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:15 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for symids in discarded sections

.klp.symid records duplicate-named locals so klp diff can work out their
sympos.  Symbols in sections the vmlinux link throws away have to be left
out, or the table references symbols which no longer exist and the link
fails:

  `__exitcall_foo' referenced in section `.klp.symid' of vmlinux.o:
      defined in discarded section `.exitcall.exit' of vmlinux.o

Two translation units are compiled from one fixture and partially linked so
the result has duplicate locals, which symid_needed() requires.  One
duplicate is in a live section and one in .exitcall.exit.

Checking the live duplicate as well keeps the test honest: it would
otherwise pass just as happily if symid generation stopped working
entirely.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-23-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/symid_discarded.c | 25 +++++-
 tools/objtool/tests/generic/test-symid-discarded.sh    | 44 +++++++++-
 2 files changed, 69 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/symid_discarded.c
 create mode 100755 tools/objtool/tests/generic/test-symid-discarded.sh

diff --git a/tools/objtool/tests/generic/fixtures/symid_discarded.c b/tools/o=
bjtool/tests/generic/fixtures/symid_discarded.c
new file mode 100644
index 0000000..573cc2d
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/symid_discarded.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Compiled twice and partially linked so the result has duplicate locals,
+ * which is what symid_needed() requires.  dup_normal is in a live section,
+ * dup_discarded in one the vmlinux link throws away.  DISCARDED_SEC selects
+ * which discarded section, since there is more than one and each was its own
+ * bug.
+ */
+
+#ifndef DISCARDED_SEC
+#define DISCARDED_SEC ".exitcall.exit"
+#endif
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+static int dup_normal =3D 1;
+
+static void *dup_discarded
+	__attribute__((section(DISCARDED_SEC), used)) =3D &dup_normal;
+
+int FUNC_NAME(void)
+{
+	return dup_normal + (dup_discarded !=3D (void *)0);
+}
diff --git a/tools/objtool/tests/generic/test-symid-discarded.sh b/tools/objt=
ool/tests/generic/test-symid-discarded.sh
new file mode 100755
index 0000000..388a249
--- /dev/null
+++ b/tools/objtool/tests/generic/test-symid-discarded.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# .klp.symid must not reference symbols in sections the vmlinux link discard=
s.
+# Each such section has been its own bug, found only when someone built a
+# config where a duplicate happened to land there, so cover the whole list
+# rather than whichever one was reported last.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# Allocated sections which vmlinux.lds.h discards unconditionally.  A symid
+# referencing one of these fails the vmlinux link outright:
+#
+#   `__exitcall_hid_exit' referenced in section `.klp.symid' of vmlinux.o:
+#   defined in discarded section `.exitcall.exit' of vmlinux.o
+for sec in .exitcall.exit .no_trim_symbol; do
+	build_one symid_discarded.c a.o \
+		-DFUNC_NAME=3Duse_a -DDISCARDED_SEC=3D"\"$sec\""
+	build_one symid_discarded.c b.o \
+		-DFUNC_NAME=3Duse_b -DDISCARDED_SEC=3D"\"$sec\""
+
+	# --klp-symids only runs on a file named vmlinux.o
+	rm -f "$workdir/vmlinux.o"
+	partial_link "$workdir/vmlinux.o" "$workdir/a.o" "$workdir/b.o" ||
+		probe_skip "partial link unavailable"
+
+	"$OBJTOOL" --klp-symids --link "$workdir/vmlinux.o" ||
+		fail "objtool --klp-symids failed"
+
+	symids=3D"$(in_relocs vmlinux.o |
+		  awk '/rela.klp.symid/,/^$/')"
+
+	# Without this the test would also pass if symid generation stopped
+	# entirely.
+	echo "$symids" | grep -q 'dup_normal' ||
+		fail "$sec: no symid for the duplicate in a live section"
+
+	echo "$symids" | grep -q 'dup_discarded' &&
+		fail "symid emitted for a symbol in discarded section $sec"
+done
+
+pass "no symids for symbols in discarded sections"
