Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172B46D097;
	Mon, 21 Sep 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982905; cv=none; b=LEumoOMJxYFIJRjeNcjlKXLzcQSV2rw7ai2LWCocHb/GR0xKZMr16ltP5GWzHr6xUCrmvWStIhYG+RYnU5NwxOozY6AWI+bMwf3kwfOm3b4eE4u0zqexGxVz9WkNz8oYupc2LUPCmTex2CtbCKcjtlgJTxbjWCl2HbxzvnqXKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982905; c=relaxed/simple;
	bh=3np1drNLQNge2i0igJ9IZQzNcDBzKrxGU4q27qxlnME=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Xsm9TWoWj++utNfvqLG/Z/uaAbz2pTjXphh3ZD1Az1DnzA3tvC4yOGXIsYGZQLC18ALg+/3p5DeIO/AtS2VpKYFyaXecJbD5Ijxfyf73A9ntY9SR5HmOpkn5H/8eFrkL8+BJT9anl6JwCVAiSDHBC5wA2Uls7+r7rL+nOasieuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bgjoektm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1y20+HMO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bgjoektm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1y20+HMO"
Date: Mon, 21 Sep 2026 09:28:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982901;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8q81zRAKzH9ez/MEwNnmy90EwVoTgjjjyU0RVpuP0Q=;
	b=bgjoektmVQ5ZrLUe86u2N/E2wLicjkMnWYyUt6F99ZmOMA4UmFC86SjaoC1DahA3R9Y/Zh
	f7+M/G8NjW+dY6neBjmeFrJXDDaBaXjwEQ7hchM44vMXMfyGFB2Cg2eD6Xk8rNN6siVqT6
	SleuFlvqDFhe2oJrtLyZp/K7m4CMF1SsumLNtWMPub+562sx0PSgnrNuYKpvKJXnLdBr6D
	SWdF80hYh5RUmjRTjFAhJ2DAx9SyrjV0NiZh3FkEw/u4DRxl8vavcfZTsNTLo80PRPbDu1
	k4ul8n8Whkttp1wFUxPC+uZLM3asVQqfUxNtrE8MVhRyPCjwAh54Kdogm3uQUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982901;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8q81zRAKzH9ez/MEwNnmy90EwVoTgjjjyU0RVpuP0Q=;
	b=1y20+HMOI/c4oRpu6c937E4ZyKwGAoOTS/qt7Z+lT+yMQlQD5qm3Z5JdGNI1+3JqO0LQ+o
	5sHc8WJfqyCqJ6DA==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting references to
 init code/data
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-24-song@kernel.org>
References: <20260916184351.2720310-24-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289972.2819794.15383789819699397702.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     d6f2548ec3508fac9ad0f2a7d6f4783f9f9cd119
Gitweb:        https://git.kernel.org/tip/d6f2548ec3508fac9ad0f2a7d6f4783f9f9=
cd119
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:16 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:05:20 +02:00

objtool/klp: Add test for rejecting references to init code/data

Init code and data are freed once boot finishes, so a klp relocation
against them can never resolve.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-24-song@kernel.org
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
