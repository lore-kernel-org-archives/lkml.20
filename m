Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B818493D5E;
	Mon, 21 Sep 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982908; cv=none; b=U+NbTrpo0t/JUmS+gq1IEPJpHkCTGAgvFdCINeQzEqCAcTCtCKetZ5rl9VeG1+7COPt5V/gwugioroRqR9ZDiUz/m7LAThKlNOatk1iIrMVSodfYXAE3v5M7sMbGLulEXdC3XjrFRNUMP79YVb7qkMr1/7X2IA8vg/4Dj1onRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982908; c=relaxed/simple;
	bh=sjmDeFkvq55sxBa7RPhKDcRFcATmAK4gZDoDQHt64m8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CRmctB5g7L/GI1nWkwI+slL6aF9rjawJAJ27z09luLoCcv1DHZc8HMLT6lCJrpJGrK3VO5Nmu3l+h+JBk0f53aqBiX/J7Iecrw8SszCCQ9HzguVHfGpAPum9xhj3JNW0XKxByRsmNCZJhWdWLFWsckYDEtx67bKUtmAfn2pNesk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DYgiFCHO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vZy9viDW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DYgiFCHO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vZy9viDW"
Date: Mon, 21 Sep 2026 09:28:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982905;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWk/3mODOA87AaZcfz9l0/HFZwzzywWdWZoHjYfjLnA=;
	b=DYgiFCHOur+vFfvVipsh5VndB/HQey/2QO0YTaRvW6U3+CwHWltx3A8HSWLuyXAw6RdHcy
	2r3gqIQgkbQL6Dpdn1nXKCOta2cF0aWyki9n9xbtcLH7A710va2W5TqTzTeIjrUjUjxliM
	4Na/zAF6gGPgaAF+t4Fy22PMDohQLed4ViKCgdIf0VYMqnuiQ1IUtWy2x2kVQrbmD8IMtA
	+nFM/rTLKSJBdZPsElxBLrjo6/KxowSfGYzk5R2NT1l4ew/NNu55SmA7PuFGhtDXXM+jFH
	K/kDbZQBa5MN5PTko3B7bJzdAcXaMwZV0dJDtgyyAJ56x821TCMp6XwbGs8OZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982905;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWk/3mODOA87AaZcfz9l0/HFZwzzywWdWZoHjYfjLnA=;
	b=vZy9viDWh5ENsJH5sUzQ5woXZENEKE1Fv3i4y2XJ7WDjYDKF6BCsDjAEXNFoyj0CYoA7fy
	n/sUfwhAZn6cChAg==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting module-owned
 static branch keys
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-21-song@kernel.org>
References: <20260916184351.2720310-21-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998290432.2819794.17661875977133745759.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     bd5e5fc7d6456e0669f47a3e10150ad05ae9d249
Gitweb:        https://git.kernel.org/tip/bd5e5fc7d6456e0669f47a3e10150ad05ae=
9d249
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:13 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:04:58 +02:00

objtool/klp: Add test for rejecting module-owned static branch keys

A static branch key belonging to a module cannot be reached with a klp
relocation: the patch may be applied after that module's static branch init
has run, which corrupts the code.  Emitting one anyway produces a module
which loads and then BUG()s the first time the key changes state, so klp
diff has to refuse it.

The fixture differs from the accepted case only in the module name recorded
in .modinfo.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-21-song@kernel.org
---
 tools/objtool/tests/generic/test-jump-label-module-key.sh | 22 +++++++-
 1 file changed, 22 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-jump-label-module-key.sh

diff --git a/tools/objtool/tests/generic/test-jump-label-module-key.sh b/tool=
s/objtool/tests/generic/test-jump-label-module-key.sh
new file mode 100755
index 0000000..7c3f82c
--- /dev/null
+++ b/tools/objtool/tests/generic/test-jump-label-module-key.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A static branch key owned by a module cannot be reached with a klp
+# relocation and must be rejected.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair jump_label.c -DMODNAME=3D'"klp_testmod"'
+
+has_input_section orig.o __jump_table ||
+	probe_skip "fixture produced no __jump_table on this arch"
+
+run_diff 255
+
+diff_log | grep -q 'unsupported static branch key klp_test_key' ||
+	fail "expected rejection, got: $(diff_log | tail -1)"
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "module-owned static branch key rejected"
