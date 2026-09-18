Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A484EF148;
	Fri, 18 Sep 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726565; cv=none; b=p4qBHOkOLFm0qjMBwXj4qHELplDvWncybdb9GTRcxkSI4V487avkRk7snp7LrNHWl6uJlraw5uPHZ3hjbF9y7bwnwTlFs/ZrWEvRhdG9MS0JIp7QhF/SowF6liy4bmsi8oJWsGhrFkFoBzAGT7pdNzqcPvwiB0eqqlEqvHn2rH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726565; c=relaxed/simple;
	bh=Le7NebEfGnIC1KcOMvKwcvQgi+e1siyWQHQLEGVyMr0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SaPw3+hQHyr5YuqCtoOTWNmsw/DjDogLWGdx2swviEv91NscBRlQg/ttX6nvt6l23Avnv+0Xlb/E8gseTY2bPQI+unKFzpzhbM9MfqXzluS1aVRdW33e0LyMcN/mutNdpC7BPr24Hbip6xF/JAsEmPvHLj1DPinN0alr/btbvmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RyKiz/UQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7Wn7MmHg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RyKiz/UQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7Wn7MmHg"
Date: Fri, 18 Sep 2026 10:15:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726559;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8+ym7vt5z9y/cZ2njbEdEKJ3pGdJqKdDfbJVzzCHVc=;
	b=RyKiz/UQ+n56sqBnuuqbdvMGdYIAfDUXjevzu1hWBtXJn90HyuAwBSYl2HmlPeku3BP20P
	QJkRKDL/OwpTfK2tOEYjzrW6xqY5DAGEC/G3f/eEq32vhzmpe4xigmMjN5BgxBkN83ZW6o
	xEyjLn46byKwBoDyNBeTKbyqZxbUY9nW14QnVIgnHorRPjpgN+uyUB1I4fX7iwAo+KQ92U
	fbA+8XVzMA2etHVgm0l3wE+KpyIP2tgsnRaXEIJgiIZ2YXQmF2ecX9qPg3NjuUMrs+Txzn
	79GfilRr4DQPLDQjEuVsxg6AtHjCeykj/tt+MTxmkjgrx0ZAHi3P8ZHvtJf8UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726559;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8+ym7vt5z9y/cZ2njbEdEKJ3pGdJqKdDfbJVzzCHVc=;
	b=7Wn7MmHg2WrgJqcAVO/7kG9iRBenuS0Idippxr8ahFhCXBpk559/YrYYHMIC70wE7Ygq8X
	/30qNxJdeZPlDXDA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for static local correlation
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-16-song@kernel.org>
References: <20260916184351.2720310-16-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972655755.1720534.1888080620184905846.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     1267e8ac29f0023ec826838f02c0703a73c42d8e
Gitweb:        https://git.kernel.org/tip/1267e8ac29f0023ec826838f02c0703a73c=
42d8e
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:08 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for static local correlation

A static local must be correlated with its original rather than duplicated.
The replacement has to reach the existing variable through a klp
relocation; a fresh definition would discard whatever state the running
kernel accumulated.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-16-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
