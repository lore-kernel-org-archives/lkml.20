Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4068493D23;
	Mon, 21 Sep 2026 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982906; cv=none; b=ltaijj6tbmIMPqbbTdH5IAvW3wJL2pFMqQzyB6ydm9vAavOlJG60K9l4jqwyjWIb3zUU2v/kFuiFRocJIW2DWNtUGiV+3aH47eCLsKFzF3BG/wsXaQdiySH5WLsaToVYbKQ/+UlyQdsYDi09aZe11nXkwf0+MqM7AvsjdQYsMWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982906; c=relaxed/simple;
	bh=MQL9hlAMtzoHKT68Q3Pgz3pWrtEzUiB3fIHxnyXbngg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=AJUKr448UdNCLyU64mlItvsHmUlKXJ7Ww3nUspUBcjEr/LNKFkwcvwiVSKSjmADKHDXi80VkW7OkDyFDBqwyhtdHPg2SjLZsvjs9cGATN6u6xXhNuDGydMhYS7oENqwHk8CLIoshC25pfMDDOYLV+WMmZPyrH9i/CQHTk19YZss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c8hlz6Bq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T7R8ybNe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c8hlz6Bq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T7R8ybNe"
Date: Mon, 21 Sep 2026 09:28:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982903;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4DOjeZwwrmOQWKQJ3FlDumvvpICJp0fCGWjkWuh5+8=;
	b=c8hlz6BqSKlfm+E4A1zDnbv9intxkDpoA8rbr+qJdTiNHtbHSLFOJ2iil8c9i8outJh6LC
	w7tsRgj7dE8PZ2F/G74N+a7mjOVooZGub2IqwELFUHzMmAN+u8Tjn6ZICIAxuRAoC02ibG
	q2Papjg/bhA9dhwogISZYH9KI2Cm8Tz/+PRY5cXaR14BYGrjQa+zewppUEf/lHoSBAgvty
	hutnz8Zg0mwx9+3cCgxpUskNHYX/2syQPzpSes1lCKG10+MhIZXhtV72NkUni6PHV9QjHf
	Z8koNuv1rfAn8idgkoefjlTlyIiRQQspFmYZZTWXN4IgS3m3ebEEm50RawzIPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982903;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4DOjeZwwrmOQWKQJ3FlDumvvpICJp0fCGWjkWuh5+8=;
	b=T7R8ybNe5rXDaJaP7q5k7xQHduUMV4QVGCylLEBxb1MZZjMnGS8U4gN72eSRdRl5Ui0zCL
	MYeDhbn1lCpVrTDA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for symids in discarded sections
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-23-song@kernel.org>
References: <20260916184351.2720310-23-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998290120.2819794.10607417235549165852.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     e018004ab8fa4c68155da976125ed8645c075383
Gitweb:        https://git.kernel.org/tip/e018004ab8fa4c68155da976125ed8645c0=
75383
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:15 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:13 +02:00

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
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-23-song@kernel.org
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
