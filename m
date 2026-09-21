Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E96C496D5D;
	Mon, 21 Sep 2026 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982918; cv=none; b=XIcnFeHPWUTlklj2ENvK9V+hjGRGviC+68qWMGRYCECSQc/y86eGpvREBL+HMowVuhV9it3UJzFdyXYuxQXE4h24p/UDyjkyRCClg5fa9KG30rI/VPLzAh1i+K/VryOnpz97k6MHkz7peb1APxVK1Ja6Ksylet2FkZF2PvTkm7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982918; c=relaxed/simple;
	bh=IFPcT3S7Op2ZOG8yh+CRZV1QiLVGGgnYu5ICwRhY33I=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IZN1K9jUAAPCCgqq61yHhKd0cbwb/ZMfyb97WYIB7nxxbih4xwKPSrS465TUGSbfEykC/jjaMUQdQfRSP13qXbuwg4IDJFcPLnMNFSDu+e26iHag07aJFDrO612m4HiO1LxxLdzhNLQpKG1CVspvGs6LLqgz/lF1Jtt6szeq9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lqZV724G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CHtp7S5H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lqZV724G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CHtp7S5H"
Date: Mon, 21 Sep 2026 09:28:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982914;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLr3nk4FzohKBh3vvgRGSTCSM3GQv8RCB0tYiEpkYUs=;
	b=lqZV724GlXq6OCVnwpBQy+oj8TyVvXEzdxlyuB6Iw3it1CtmawWUnZ1I6ZmNFUX58pKnHs
	HOyyXKf3/T+z+i4pGX0yj7MaR+8qX0+CWw3AFGYwrQUn4LxoCGG8rJZAjqszCB48xR+jH0
	ve2fZE+X4Gs5qwLXOkf735Mwrl9j32foYcbbq4JRtQdMgh43NCmSYmf/sZ/F2Od2vVRWyg
	IFpP1ROCOvP4RP8seU3UTrCsJxK4+epE/yLIhTzS2UA9/Q2e11LMhq9j9OAf/CcMJojJ7E
	czI6Puo8IH7VF76lQjO/1bp3wheQmlx1rRizW2fWKqpHYhw41RAyu+qVEMoNpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982914;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLr3nk4FzohKBh3vvgRGSTCSM3GQv8RCB0tYiEpkYUs=;
	b=CHtp7S5H4bxpgfS8EjT4RjOJScuhHzphtlvY3jLcmg7Au8RiG92ht6OlAcLkBAMExFkCKo
	r92ziPREp9NaZ/Cw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for newly introduced functions
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-15-song@kernel.org>
References: <20260916184351.2720310-15-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998291309.2819794.4768328941057971683.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     960c3e352bac749c35041d683f32bdde467a2960
Gitweb:        https://git.kernel.org/tip/960c3e352bac749c35041d683f32bdde467=
a2960
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:07 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:02:40 +02:00

objtool/klp: Add test for newly introduced functions

A function added by the patch has no original to correlate against, and
still has to be carried into the livepatch or the changed caller ends up
referencing something which does not exist.

The helper is noinline so the case survives the optimiser; otherwise the
compiler folds it into its only caller and the test covers nothing.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-15-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/new_function.c | 21 ++++++++++++-
 tools/objtool/tests/generic/test-new-function.sh    | 16 +++++++++-
 2 files changed, 37 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/new_function.c
 create mode 100755 tools/objtool/tests/generic/test-new-function.sh

diff --git a/tools/objtool/tests/generic/fixtures/new_function.c b/tools/objt=
ool/tests/generic/fixtures/new_function.c
new file mode 100644
index 0000000..e7886ea
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/new_function.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Function introduced by the patch.  noinline keeps it from being folded. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+#ifdef PATCHED
+static __attribute__((noinline)) int klp_new_helper(int x)
+{
+	return x * 7;
+}
+#endif
+
+int target(int x)
+{
+#ifdef PATCHED
+	return klp_new_helper(x);
+#else
+	return x;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-new-function.sh b/tools/objtool=
/tests/generic/test-new-function.sh
new file mode 100755
index 0000000..b0b7f64
--- /dev/null
+++ b/tools/objtool/tests/generic/test-new-function.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A function added by the patch has no original to correlate against and must
+# still be carried into the livepatch.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair new_function.c
+run_diff
+
+assert_patched target
+assert_symbol klp_new_helper
+
+pass "new function carried into the patch with its caller"
