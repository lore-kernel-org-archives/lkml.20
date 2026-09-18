Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4494EDCDE;
	Fri, 18 Sep 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726565; cv=none; b=cN+D6PwTRxlaQ6c1Dl4iHYCyXpKeT+prsg5GVYms35mysep9Dad1slNIQIdgpT4TiEKHBUTUskeTWwrkJMOifUvqHZLMvciuGdp4XC0aA+ldrwNSd8qJtIFhcs+m5yVJjnIcVywr3x9ZcGwD3cs+9VZ0DlQsm1vNyVX83R85Z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726565; c=relaxed/simple;
	bh=N737dkCma0wsHEy5Xiq1RwHBTMbyujLBlvMv7mNGRRc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IrPLN5daV7HlfM9SS75Y0opEFkam2ben8bWph/jxuDw06V7I32frFcANs4JnTR4qYQcOMAlEnKTy5MALfrRNSApCek8s1LGrqsSFo+rYywXcgP2AhGRKX8k+jniKcCePIfY/FBsgoRcA+aY4WEb0ZivqBnSWZSCEfRUboN6FSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dlh5z05k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xdM966aD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dlh5z05k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xdM966aD"
Date: Fri, 18 Sep 2026 10:16:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726562;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c22Z//6POCFhbec3UltNEdfaNREt98Ir8N6HDR6dpF0=;
	b=dlh5z05kQTIyCGNjObFdZBL9sM8vE9iavSeNktCkfiv7bAHIkbzcl3TpRpVfgrKH+ZIRyr
	yYu5k43Qw4jbH3efRaokgzTI0sC/02QKLPiKaiPlXPGT+6sWWKy1Z938t2ggMEiLJZF0ae
	Q9DIHJ0RCTC5RqAEqDhQQvTySb5qAFOrXdcbvRxXptjtICwcnNRzmWXJOS4lPkpiIlLMkN
	id905xtmZ+VqOYLo4OhoywCN+ED1BCUwX5qX/09T0dhV6HkfdUuP/G45b+Ym+WO/AYHGlF
	j9vH0XKyg9RsRP7V2wI/LfvaUKm6inzq3xA+GDybaki9iYGjnYJRdrnCpauzHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726562;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c22Z//6POCFhbec3UltNEdfaNREt98Ir8N6HDR6dpF0=;
	b=xdM966aDjTDlj/VlXFyxoolxSRyQxzVUtc+conGFPSajtIOouugoFpA8VlKv4X91OeQiyq
	2L/r1TTaYMeoD3Dg==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for newly introduced data
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-14-song@kernel.org>
References: <20260916184351.2720310-14-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972656039.1720534.8943014015754922156.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     f85da39ef5758c3da3a2893d64110444b2128958
Gitweb:        https://git.kernel.org/tip/f85da39ef5758c3da3a2893d64110444b21=
28958
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:06 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for newly introduced data

Adding data differs from changing it: nothing in the running kernel refers
to a new variable, so it is safe and has to travel into the livepatch with
the function using it.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-14-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/fixtures/new_data.c | 23 ++++++++++++++-
 tools/objtool/tests/generic/test-new-data.sh    | 27 ++++++++++++++++-
 2 files changed, 50 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/new_data.c
 create mode 100755 tools/objtool/tests/generic/test-new-data.sh

diff --git a/tools/objtool/tests/generic/fixtures/new_data.c b/tools/objtool/=
tests/generic/fixtures/new_data.c
new file mode 100644
index 0000000..ac36462
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/new_data.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Data introduced by the patch. */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+#ifdef PATCHED
+/*
+ * Not an arithmetic progression: { 1, 2, 3, 4 } indexed by x & 3 is somethi=
ng
+ * a compiler can compute instead of load, and then target() has no reference
+ * to the array and there is nothing for klp diff to carry.
+ */
+static const int klp_new_data[4] __attribute__((used)) =3D { 7, 3, 11, 5 };
+#endif
+
+int target(int x)
+{
+#ifdef PATCHED
+	return x + klp_new_data[x & 3];
+#else
+	return x;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-new-data.sh b/tools/objtool/tes=
ts/generic/test-new-data.sh
new file mode 100755
index 0000000..acb68ff
--- /dev/null
+++ b/tools/objtool/tests/generic/test-new-data.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Data added by the patch has no counterpart in the running kernel and must =
be
+# carried into the livepatch.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair new_data.c
+
+# State the premise on both sides.  The array is new in the patched build and
+# absent from the original; if the compiler folded it into the code instead =
of
+# emitting it, the assertion below would fail without saying why.
+has_input_symbol "$orig_obj" klp_new_data &&
+	fail "fixture put klp_new_data in the original; nothing new to carry"
+has_input_symbol "$patched_obj" klp_new_data ||
+	fail "compiler did not emit klp_new_data; the fixture tests nothing"
+in_relocs "$patched_obj" | grep -q 'klp_new_data' ||
+	fail "target() does not reference klp_new_data; the fixture tests nothing"
+
+run_diff
+
+assert_patched target
+assert_symbol klp_new_data
+
+pass "new data carried into the patch"
