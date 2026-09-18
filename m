Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5564E7813;
	Fri, 18 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726552; cv=none; b=UskUvtxyc4v2QdNO5q/QrAtGR9CCk/IltWFZZ22OGBJDDfQiake2OFVRxUTd9OmMP2GX7kxnDIUtbuzIxFw/f7ot3SzTd6/hCQ7dzoC8E1FDI6IQZdFaNz1QxHtf9e0K0IImmp1SmCxBqqMldizX1484CAK5H3gsFmYSMwXkN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726552; c=relaxed/simple;
	bh=U7ER/AXn2jl027USXKwBqkK2foLUaAJwsuNHRYGiLpY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TCCDvnsQGVomQEdA8WOaRGGiCnFw9QxPB1AMId/+7T70vzo5y5XNyUkzaVTVF0PGVHH0LY7UxbupeVpIqrWxV4m428NjsoUvs22c+xunk0rt4gNM56jhY0pR3G1qp05uZU1mAJ6Uz0teIUHWjUKf6xH4l+JgjQmCzT2OGSAAT48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aGsvB+Kw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hJZtqoBD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aGsvB+Kw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hJZtqoBD"
Date: Fri, 18 Sep 2026 10:15:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726547;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnhS/fR8QkHlubCEPfrAGzxwF+d7od5K2teZY1cMvcg=;
	b=aGsvB+KwD+h7jUqShHhMPanG+QldyPokM3Z58QftI7VtTA3d6uwDXgQxU/4pwKYn0BX6Kx
	ZiLYy8LKsKhV4yL1jc/qrARUzpmp+UNJHVqB3l/zKRo2/eP7DYrb5ez822+6hVd8MDlmJa
	0B02QswZqTBbyI2+br84igoyXqN3G5Hy68f5IFk+DAlGo3AeQnXJCw1uc6Jue8Sd3N+RXE
	YruN2CgKDDSzRnx6UUfyfGvSUQjR1r5k7PsCfFD7dw0iB+eeui5l94huEM4NUSfKvP0CwX
	wp1voCXrXodxcnLImMIF8Ma5VqEJJ4SSwdESWB04XuuBjOhTmh+BrFkchI0cJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726547;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnhS/fR8QkHlubCEPfrAGzxwF+d7od5K2teZY1cMvcg=;
	b=hJZtqoBD81XjJes9xNNXQ1lOEFsZNHWq8ur8G8aObayP3397A8wU3Qv7vUVUYkjE0QJ4CS
	IYGbM5KRVdGHFHBg==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting references to
 init code/data
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-24-song@kernel.org>
References: <20260916184351.2720310-24-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972654553.1720534.30507242858964603.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     f5e03560bd71922003384a2e24154b1d08bead1c
Gitweb:        https://git.kernel.org/tip/f5e03560bd71922003384a2e24154b1d08b=
ead1c
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:16 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for rejecting references to init code/data

Init code and data are freed once boot finishes, so a klp relocation
against them can never resolve.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-24-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/init_reference.c | 17 ++++++-
 tools/objtool/tests/generic/test-init-reference.sh    | 29 ++++++++++-
 2 files changed, 46 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/init_reference.c
 create mode 100755 tools/objtool/tests/generic/test-init-reference.sh

diff --git a/tools/objtool/tests/generic/fixtures/init_reference.c b/tools/ob=
jtool/tests/generic/fixtures/init_reference.c
new file mode 100644
index 0000000..9e59bdf
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/init_reference.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Patched function referencing data in an .init section. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+/* volatile so the read cannot be folded into a constant, leaving no referen=
ce */
+static volatile int init_only __attribute__((section(".init.data"), used)) =
=3D 5;
+
+int target(int x)
+{
+#ifdef PATCHED
+	return x + init_only + 1;
+#else
+	return x + init_only;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-init-reference.sh b/tools/objto=
ol/tests/generic/test-init-reference.sh
new file mode 100755
index 0000000..921cf49
--- /dev/null
+++ b/tools/objtool/tests/generic/test-init-reference.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Init code and data are freed after boot, so a klp relocation against them =
can
+# never resolve.  Such a patch must be rejected.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair init_reference.c
+
+# The rejection can only happen if the patched build really does reference t=
he
+# init symbol.  The fixture makes init_only volatile so the read cannot be
+# folded away, and this checks that it worked: without a relocation klp diff
+# would succeed, and the failure below would read as a missing check rather
+# than as a fixture which stopped posing the question.
+# Either spelling will do.  A file-local variable is reached through its
+# section symbol -- .init.data -- and a global one by name; which of the two
+# the compiler picks is its business, and the reference is what matters.
+in_relocs "$patched_obj" |
+	awk '$5 =3D=3D ".init.data" || $5 =3D=3D "init_only"' | grep -q . ||
+	fail "patched object has no reference into .init.data; the fixture tests no=
thing"
+
+run_diff 255
+
+diff_log | grep -q "can't patch or reference init code/data" ||
+	fail "expected rejection, got: $(diff_log | tail -1)"
+
+pass "reference to init data rejected"
