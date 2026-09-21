Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388249158F;
	Mon, 21 Sep 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982902; cv=none; b=ZwVvWdf0t0dFQf9FdfVbVZW+YqPRhfMNfnYW+iDKLLch6DJKvbbIxgqvRclZdzWe5BkntF6Ltxf1HRXESyfGDQebTzVuSZYvzYCVicEvYXpYhRB4qKWWs5IvcGtIGt1bljfyixOKbowjndBuEvI6dF+9oOYYPGZxO+1KqumXT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982902; c=relaxed/simple;
	bh=tD+WCMiBJsSzI0hZBL6vTBstCr29e8uYmcXiEyoxHa4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=afk7Jm8h3Wj9k+sPfbIddCMIxVUS4EDJmbeUFvZ5E3l5itor1DxtJIdlnkYeWhy9DmiDk+Y5PZsE8JpeuSf/IjJL7LI7SuBPiirf4ww2IQyr8eRKG3JGQnHC0IUSPN4acJKyQXFdP/+FLVmLSaN6HIDEpHTNPnfUwEYDvAD8a04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AGPsbvUN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u4z3N2p4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AGPsbvUN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u4z3N2p4"
Date: Mon, 21 Sep 2026 09:28:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982898;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KmArIojSQAIZ7Ec4oEl9+sEP9ZQ0MYY3PQBB8X6WIbo=;
	b=AGPsbvUNTEnlnbkcQtFLalCr7iyYlKDqvg2Zgigye4gKRU97t8xPMdnq9Ud+qOsHYw9XnS
	biUDDAI3aJn5e0loPPvgtYhseX2v1MRGfQR3lkDPoAIrof05G1FXQ5BFlnHjTqERAA5Ies
	pOUWv0kujBTIdy4X05W3Ib1Z1GwPYgSoqNsf6aVVVpl0q4Vw9KjGVt0BGQDbkdgB+blV3z
	kIbQ+g8yXcMQvtyGGmXPf+sfEICgzDH5r8HCmxGK4oAdIDnMt2nL0T+4ZorlUyXrjNFnYT
	XgsEhWGJsTHmk02FmKgmaNDcsU7YpB6QyDHJWhDeA4worugt6AL6F2N4aC7ckQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982898;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KmArIojSQAIZ7Ec4oEl9+sEP9ZQ0MYY3PQBB8X6WIbo=;
	b=u4z3N2p4AbLaMYGEA7Q2ENFLQ9aM5GTQ9deoq6CAXQQ20W4gvUmj9p3O39RKM2b69U8uRY
	v4F0vTjVc3iSPVCA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for objects without .modinfo
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-26-song@kernel.org>
References: <20260916184351.2720310-26-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289677.2819794.15097597898648181122.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     050a0c53a6c6009be329c7034d7a4d22ea146b12
Gitweb:        https://git.kernel.org/tip/050a0c53a6c6009be329c7034d7a4d22ea1=
46b12
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:18 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:34 +02:00

objtool/klp: Add test for objects without .modinfo

The module name recorded in .modinfo ends up in the livepatch's klp_object,
and also decides whether a static branch key counts as belonging to vmlinux
or to a module.  An object without one cannot be diffed.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-26-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/no_modinfo.c   | 11 ++++++++-
 tools/objtool/tests/generic/test-missing-modinfo.sh | 16 ++++++++++++-
 2 files changed, 27 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/no_modinfo.c
 create mode 100755 tools/objtool/tests/generic/test-missing-modinfo.sh

diff --git a/tools/objtool/tests/generic/fixtures/no_modinfo.c b/tools/objtoo=
l/tests/generic/fixtures/no_modinfo.c
new file mode 100644
index 0000000..e463747
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/no_modinfo.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Deliberately has no .modinfo section. */
+
+int target(int x)
+{
+#ifdef PATCHED
+	return x + 2;
+#else
+	return x + 1;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-missing-modinfo.sh b/tools/objt=
ool/tests/generic/test-missing-modinfo.sh
new file mode 100755
index 0000000..6f242f7
--- /dev/null
+++ b/tools/objtool/tests/generic/test-missing-modinfo.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# The module name in .modinfo ends up in the livepatch's klp_object, so an
+# object without one cannot be diffed.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair no_modinfo.c
+run_diff 255
+
+diff_log | grep -q 'modinfo' ||
+	fail "expected a complaint about .modinfo, got: $(diff_log | tail -1)"
+
+pass "object without .modinfo rejected"
