Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC634E56C7;
	Fri, 18 Sep 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726548; cv=none; b=I/O676BOYoLhaKU3YAT71E6mBkcyxgJRw3oIquj6GsWWX8rRzfrvw3nbQiEu/9ULblHL17ra9yvl3x0MMNfdwu5wJ8Fl5gb8Cay6G5UPNNC9/erggQ92AwX1EYCtFDJRaMiQ4k5r3gZF2LRkVR4xXQPIBB/ByxotcNEsDdjpSXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726548; c=relaxed/simple;
	bh=NXR2Vj8MovrAhubu0uRmxWEQkoQvbKR5IvpPMxOx498=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=VRTyETW/rCUj9AhqflQXNuMef47iwkKY4NHq7KB0qs82/NqWNDlcPOLDqH0xru3bqISwEsqV9OZoBplQuuVTkcmlfyEXCEYaTbkLhUc7Y3tN0An3kp3y0pNLugPQIlFkBXEXVmLLWrfLmBJiPK4ZpxvVdmXxPynvJsMhaVtfIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K4br6qKC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jVtpbLGI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K4br6qKC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jVtpbLGI"
Date: Fri, 18 Sep 2026 10:15:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726544;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EpxVdMrcQ99S9ep1Qr7mWkKRCI1h9XMaiZKXAFr6fU=;
	b=K4br6qKCKfTSafeIrd5pn7L86k5ImOZ3Tuxx1aPVLSHLzhbYmE/u3clg6t5M7ceMnMeaeI
	+kwqQlxmDORiOiYrXf0HptusYM6i1khAVfxgXbLw0l4NCGwjRxspC68U8dYEK0F7trUY/O
	kaYQzZ/rXdAaaRVO2WeEWOyavgUuJh/Z7wwelOQ3TGBWWhnzUXPmFsW8ebpxeDOjg8UjRX
	JdN82YU3X4xebCODOPZABTPAzE65bO08Vlu56D4nE6E9r/wT0KkRGestPGV939DTCq+q5v
	1tHedctW83d8w2+dLDdbtjZjhy2rxEBhlXhfohtkIgXmq3a+g2zAdZFuD2j1bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726544;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EpxVdMrcQ99S9ep1Qr7mWkKRCI1h9XMaiZKXAFr6fU=;
	b=jVtpbLGI1SMVS2Kte89mYz8JyCsEBdBz2X6LIS3jHvNQ07k08IShHqhnMB15OQjh3K0ExL
	q8U4XhScwW6mCnBw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for objects without .modinfo
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-26-song@kernel.org>
References: <20260916184351.2720310-26-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972654250.1720534.264578135134706997.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     6e9105c21abde36acc9d48a5e037cc3ac1d78bf1
Gitweb:        https://git.kernel.org/tip/6e9105c21abde36acc9d48a5e037cc3ac1d=
78bf1
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:18 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for objects without .modinfo

The module name recorded in .modinfo ends up in the livepatch's klp_object,
and also decides whether a static branch key counts as belonging to vmlinux
or to a module.  An object without one cannot be diffed.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-26-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
