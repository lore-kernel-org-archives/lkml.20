Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0961495AE3;
	Mon, 21 Sep 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982913; cv=none; b=mCoKF6SWPuLv13W6P2bWOyvFJ51RUVbrQkWjlQ+HGB3TlT40dIwHJoRgtN7qYg6UjXq7+Lht1rHiBsR0tfFEHorz7LAaIMUT3/FFbfqiafwpsBJww78KyGbOVlD4xm5QSdbHImSGsES0Jo6u2P60OkAgZP6hDMOgtY6QiZPxUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982913; c=relaxed/simple;
	bh=yIFpU+wcbGYdL44hmr6V5vurfSYJvQ+xotCpU/jHbno=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tOFBylt6E7WIShpavKnrEdt6cY4Fb1lsUuF5DTBRgYfonHYUL50EH4VXjEzrViOJIxCtu/WlWn1HEwmchSR29ra0Rb1h+1wmdjv8JEM4kvbHPgt88Umz/9Q2cTX/VSlIboz3lgrWNNwVIvZ7M8r8L4BcuLv8ww5LMML0fxg0UIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wkJ570sF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CzGU/U+4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wkJ570sF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CzGU/U+4"
Date: Mon, 21 Sep 2026 09:28:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982910;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBPoE5IBQmG4u/24pOytUCOjQxJP+q5E5U3chM8BLC8=;
	b=wkJ570sFmmfuVl3+3a7LhxDe+OSh0rXSa7MuHteupVnFdv59kUTh5eP7mrjcCRTM+NXwGY
	2Hf/Wrma6TF0Gkmvdh11WEmAh/Xjymd6E3bp34v0hW16nsq3VSEj8dhpPJUPSZr/BH4t+A
	HFRCfzW7UjFL9F6CLf1AMnwjthV2f7YhqM8pp1BVvM2llt1JL5N2OTZyTV25aFaM8fZhlf
	hzz8SF4auP8l3c7Aj/MkTK3dCO7Ei+9BM44BCMQGwhoTpw8bG312SJ18kW7LS459OGUM7i
	3QwHseY1Uho/sOvdo3tUYX5uLdR95BhiaZfiB6IMZIEUeGvT3pzUSq5jRjwN3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982910;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBPoE5IBQmG4u/24pOytUCOjQxJP+q5E5U3chM8BLC8=;
	b=CzGU/U+4MHlkYyZZSIB99ay4FkLXHm79fY5rjeXik2rszydUqvzUnb87NxtHn782897Sce
	JKiVow+Cv7R9JCCA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for special section extraction
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-18-song@kernel.org>
References: <20260916184351.2720310-18-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998290862.2819794.13991562118304853764.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     996edd14fb2003461295c8c48e9df7ef373bc492
Gitweb:        https://git.kernel.org/tip/996edd14fb2003461295c8c48e9df7ef373=
bc492
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:10 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:03:00 +02:00

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
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-18-song@kernel.org
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
