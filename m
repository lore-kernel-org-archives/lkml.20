Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E124D7965;
	Fri, 18 Sep 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726560; cv=none; b=iZ6kBzHk8HYnhUZF0KiQRd9s9aWvqdqkTkj6GLn2l/pWkdFZ12q7YBcpUIpFtakGXzXIpLYfWJx3b87FOITq/uJl4ApLJ/o+l6ED/r7T+bFs/3j4/hlPCISrTUOlZbrP696FVU4AC4og8BMs0osjPZI0YtciRXYVxyVITS9PlZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726560; c=relaxed/simple;
	bh=bW1RGtexL3RRX8gWApS1QqAsiayaoQ82T1A/y3VNh5o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TA5jc6D9iu/FLMPv/37FJ7NoWVCWGEDNp1FiY/8WhMt8vJH5+fWRzlRngxRFnvxcKlFzxPucW++P1cIfNXdXPolJoLi378JS4Pl9vyPRNqbD0JDeFMXbv2aS4AFax97gfda57gtWvES9QzvVULYPzFDcnLa64dTV0im6/fp57iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Rfb8X6XZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bEwP5uuN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Rfb8X6XZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bEwP5uuN"
Date: Fri, 18 Sep 2026 10:15:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726556;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3cFi8QABDdcYk1Ob9RGX0yqjTFlGW4xgP8lFJxRK3Y=;
	b=Rfb8X6XZTAmK4SjXiKQ0r+obdJVB26EmyK81i1rrZJ31gh/CBNonnMxAfVKmtoXv2AGkDQ
	JT6c2L4zT2Mk8HcldO9/WgNtkjY4J/bToJ2Ewrc7a32ckg54V14Vbq+A+ycJ67KnJdfmY8
	oT9ZHacW7BU0Ei1UBsQF11nSLFHVBao19wV6g5U40ZO/9L5PFk9jXndoAJoLM4tWFe5UUd
	Djlo4FsFtlMD/NCq8YfdteobcnoYL+VIZaxH0xGr+I9ax9VpdzR+PUbekcM4YQz6vUSlJS
	Wj42HZdu0lwWhKgvx5G2VWxBzHZRwhjsjnyNqg55KKgCAdBAoPNAVcqZh/BqcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726556;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3cFi8QABDdcYk1Ob9RGX0yqjTFlGW4xgP8lFJxRK3Y=;
	b=bEwP5uuNG8sKLig9Nkk8I/+MVZ1xn3B0EkE8If49ufbkMKLNU6vY6CnsklXKCJ3q5UCj2r
	qAeAIyyPdvLa+CDw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for special section extraction
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-18-song@kernel.org>
References: <20260916184351.2720310-18-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972655470.1720534.8963060460566961784.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     51b7456cf2c3c10ba8ff2dc57fbf2e37243302ec
Gitweb:        https://git.kernel.org/tip/51b7456cf2c3c10ba8ff2dc57fbf2e37243=
302ec
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:10 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for special section extraction

create_fake_symbols() gives each special section entry a symbol so entries
can be extracted individually.  Entries with ANNOTATE_DATA_SPECIAL are
handled first; the rest have their boundaries derived from the entry or
relocation size.

The second pass has to key off whether the first one created symbols, not
off whether the section already has something at offset 0.  Clang puts an
assembler-local label at the start of .kcfi_traps, and treating that as
already handled means nothing is extracted: klp diff still reports the
changed function and succeeds, but the special section is missing from the
module.

The fixture reproduces the shape without needing CFI or x86.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-18-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/special_section.c | 24 +++++++++-
 tools/objtool/tests/generic/test-special-section.sh    | 20 ++++++++-
 2 files changed, 44 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/special_section.c
 create mode 100755 tools/objtool/tests/generic/test-special-section.sh

diff --git a/tools/objtool/tests/generic/fixtures/special_section.c b/tools/o=
bjtool/tests/generic/fixtures/special_section.c
new file mode 100644
index 0000000..d28c554
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/special_section.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Special section entry with no ANNOTATE_DATA_SPECIAL annotation and a local
+ * label at offset 0, the shape Clang produces for .kcfi_traps.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int target(int x)
+{
+	asm volatile(
+		"1:\n\t"
+		".pushsection	.kcfi_traps, \"a\"\n\t"
+		".balign	4\n\t"
+		"trap_marker:\n\t"
+		".long		1b - .\n\t"
+		".popsection\n\t");
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-special-section.sh b/tools/objt=
ool/tests/generic/test-special-section.sh
new file mode 100755
index 0000000..b6a9139
--- /dev/null
+++ b/tools/objtool/tests/generic/test-special-section.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A .kcfi_traps entry belonging to a patched function must be extracted even
+# without ANNOTATE_DATA_SPECIAL and with a local label already at offset 0.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair special_section.c
+
+in_symbols orig.o | grep -q 'trap_marker' ||
+	probe_skip "fixture produced no .kcfi_traps on this arch"
+
+run_diff
+
+assert_patched target
+assert_section ".kcfi_traps"
+
+pass ".kcfi_traps extracted despite a local label at offset 0"
