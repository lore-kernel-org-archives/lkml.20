Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEB5497B9B;
	Mon, 21 Sep 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982921; cv=none; b=GcB8RPc0D8uVcXhYLqXjWnRkotUTtHe1LDPywZp6bZZO80+kjgOOZa5fP65OOQj+DST+HAZLQCVumNegOaHZzSe901weuTfl8LchtWUKD0moGPTrmTHH3P4/CSnWkGlruZi7C/Ecbpx8bGOplFTla3pAY9LfBFlrCMZhre7QoKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982921; c=relaxed/simple;
	bh=qZXASYqBzMAmR3f9E8C9eZT+lH6hKO339A1i3uU7KQU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Xdocv4dCNbTj7nckCUJCq5CHGGUQIWVLJDteuytyp9Sl1NmWf3x3rsXLlXN3IaW42QLYcCI8Rvdhas/hf4SWDDQWIKa/b/ZkmAbKPS9Lw6FEgFGNcBkW4lm8NqaS7SV1EeQagiIDooQway0niH88x8lxWVgKRRpVUYcqdFBuy5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rTzFC+Pb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ccuUw+n6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rTzFC+Pb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ccuUw+n6"
Date: Mon, 21 Sep 2026 09:28:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982918;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXmp5H3ypxpmEV9WdvR9nChvcDbyaiLqPrnYnCfvyMo=;
	b=rTzFC+PbdxuOHavePRuZXZWsGa1d3HecpayBBxZSmLXOkYTVxsd1siseIGU0qzeM/QqzFm
	KwwKBbWSaNDfyPqaLDg311eaf0vLn5HYh05RLH9RJ6xCxFetdGzG/TZOKwCoPEFTGLHRJk
	89zniv0hSWUHCBmTRAyF0LxydZnWtde1NUuGygkAAvZ2MH6m+aV/Qb9x0pDdJJDEEQMUZk
	YjfONh7Hv7SEw9OIb9F2+GwUm8T600r4kK4Qimj2IlvHe3JJiYvkgvVUVuQyj9vtSrc82T
	dCcQLQsaniCvIocEKL98Z+2dMDZL1iCVYzEfbCZ6Vjqpvh2aNVZIvaonJ6iH2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982918;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXmp5H3ypxpmEV9WdvR9nChvcDbyaiLqPrnYnCfvyMo=;
	b=ccuUw+n69vJRe/1YxziyzmdaKL7aiT0g/2ToGgwYuK2GTkdQFH4g/G2ADAyhkk9C12Ksbw
	EHh1H7YCu9yM+MAg==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting changed data
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-13-song@kernel.org>
References: <20260916184351.2720310-13-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998291637.2819794.144966346007672038.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     b229562c2f44cdec4ce4b8b78428514bccff9dc0
Gitweb:        https://git.kernel.org/tip/b229562c2f44cdec4ce4b8b78428514bccf=
f9dc0
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:05 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:02:11 +02:00

objtool/klp: Add test for rejecting changed data

Livepatching replaces functions.  Nothing can swap a variable which live
code already refers to, so a patch which changes one has to be refused
rather than applied with the old value left in place.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-13-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/changed_data.c | 16 +++++++++++-
 tools/objtool/tests/generic/test-changed-data.sh    | 18 ++++++++++++-
 2 files changed, 34 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/changed_data.c
 create mode 100755 tools/objtool/tests/generic/test-changed-data.sh

diff --git a/tools/objtool/tests/generic/fixtures/changed_data.c b/tools/objt=
ool/tests/generic/fixtures/changed_data.c
new file mode 100644
index 0000000..b524618
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/changed_data.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Data whose value differs between the two builds. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+#ifdef PATCHED
+int klp_test_data =3D 2;
+#else
+int klp_test_data =3D 1;
+#endif
+
+int target(int x)
+{
+	return x + klp_test_data;
+}
diff --git a/tools/objtool/tests/generic/test-changed-data.sh b/tools/objtool=
/tests/generic/test-changed-data.sh
new file mode 100755
index 0000000..c5c7381
--- /dev/null
+++ b/tools/objtool/tests/generic/test-changed-data.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Livepatching replaces functions, not data.  A changed data symbol must be
+# rejected.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair changed_data.c
+run_diff 255
+
+diff_log | grep -q 'changed data: klp_test_data' ||
+	fail "expected rejection, got: $(diff_log | tail -1)"
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "changed data symbol rejected"
