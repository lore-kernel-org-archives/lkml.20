Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAE8496D37;
	Mon, 21 Sep 2026 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982916; cv=none; b=qp02QKk33bMXOs6V/ULxzRlnTpkG2uLk404U71fgRbnjamR8QYCaActjxpqslyYTvHjML1U3qXoVUdg2wuvGH3vtViCoz8D/tgtCcxWhZgzfZwrmQSbXOOM37m11ivsxAGDTHYZlO42r3Ak4l/NECO7xvE/hxCqcDCej5xOf3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982916; c=relaxed/simple;
	bh=fNM215QzB9zZmnlBsNfLo3Z9xMy3jgVo8ihJ876uUnU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=B8gHwUGG13QZVeguQf+i1KAZ2TlDaDWNjAWIL8nJQNR3YRp0QXa1M/EIqGnbpKoYzMoPvyy5uvup++iSAd/3jCZ+hfUdeqkFtVanmUhnIRzukKFNtoROG5876pIfvuj+YZWC/JoQ3KUYqndJlttVZJdp6yZ3mPYqjiStZFkuZ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g9yzirpF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hZqKFjr9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g9yzirpF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hZqKFjr9"
Date: Mon, 21 Sep 2026 09:28:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982913;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Z9anMvUByyjyZAD3TsCQ7Iox6ygYj1unKQGt3jqyuY=;
	b=g9yzirpF/iwDZEl459iEqcvCLRaiNI/uULIhGxSdlluhyuiZx/IWP02dKdpBYZDYmPXsXE
	W9aYnCj+0K82ftbS89LBXV3bhCxWcdtumiDJhQZn7l1wWVm61TZdVkJqKs1HQp4nsdedCw
	0cPJNCM5Bzu2EAVtRIUaj1BUBeGy4P4tZYr6lthBEaCwuK6/QYThsbJqflRKCQN3NmNhIl
	RnP++Wm1b42RCQhM0V33ohBqXrD6D7pbfWPPa7NvUGWotr6voYeQ+ZcfMDSlT4O2MtF4U2
	Pl5HNytTzixVzzVeg5g7X+Uq/W35iZEMd/mEJchNDTkDD8Kn9TN9jvprsjzQxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982913;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Z9anMvUByyjyZAD3TsCQ7Iox6ygYj1unKQGt3jqyuY=;
	b=hZqKFjr9otOIHp7zUOPY1iZKGM4TAZnZ34tYDvyfc3L5v1ODqvPvn/fOLo/Ibj42Hp3LkK
	ZQG9SmsrGgCc5QBQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for static local correlation
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-16-song@kernel.org>
References: <20260916184351.2720310-16-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998291161.2819794.291200813497418288.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     fbb79ff9a6638aeb5b7a5f7db25afd033e6edd96
Gitweb:        https://git.kernel.org/tip/fbb79ff9a6638aeb5b7a5f7db25afd033e6=
edd96
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:08 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:02:47 +02:00

objtool/klp: Add test for static local correlation

A static local must be correlated with its original rather than duplicated.
The replacement has to reach the existing variable through a klp
relocation; a fresh definition would discard whatever state the running
kernel accumulated.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-16-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/static_local.c | 17 +++++++++-
 tools/objtool/tests/generic/test-static-local.sh    | 24 ++++++++++++-
 2 files changed, 41 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/static_local.c
 create mode 100755 tools/objtool/tests/generic/test-static-local.sh

diff --git a/tools/objtool/tests/generic/fixtures/static_local.c b/tools/objt=
ool/tests/generic/fixtures/static_local.c
new file mode 100644
index 0000000..f2f025d
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/static_local.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Static local in a patched function. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int target(int x)
+{
+	static int counter;
+
+	counter +=3D 1;
+#ifdef PATCHED
+	return x + counter + 1;
+#else
+	return x + counter;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-static-local.sh b/tools/objtool=
/tests/generic/test-static-local.sh
new file mode 100755
index 0000000..d57efa6
--- /dev/null
+++ b/tools/objtool/tests/generic/test-static-local.sh
@@ -0,0 +1,24 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A static local must be correlated with the original, not duplicated: a sec=
ond
+# copy would discard the state the running kernel accumulated.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_local.c
+
+in_symbols orig.o | grep -q 'counter' ||
+	probe_skip "compiler emitted no distinct static local symbol"
+
+run_diff
+assert_patched target
+
+out_symbols | grep -q '\.klp\.sym\..*\.counter' ||
+	fail "static local not referenced through a klp relocation"
+
+out_symbols | grep 'counter' | grep -qvE 'UND|\.klp\.(sym|tombstone)' &&
+	fail "static local was given a fresh definition"
+
+pass "static local correlated rather than duplicated"
