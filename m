Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968A4B44AD;
	Fri, 18 Sep 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726536; cv=none; b=UUc0Ah6fkgZWCb0T67zUuwDXih0OpV+JYp5lWMScqOmkFpCbxtnhihJuTicKSF5mtlYKCiaZBUD5Ky5ZzFli0wLQY+QFRYx5tC0CLEsiww9bKCAl08xGesIzZY7GMHN90a7zhuvYOJkLiT/bA7yeALpXOD3VY1WxQpfNJ/OfVB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726536; c=relaxed/simple;
	bh=8W79zYiUsG4PaZYGerKXYmidyjhUWephxcpvr6fHyCc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=AjXI8dSLYxVpyg9m+wXPAXLauohfzdqptWDQ4k2YBc01cW9OVlZndoHCZNA5H5vh+OJTJG+3MVUyicfGT8XOGqz+C4YnX7cGWuG5W4LZ0Dr4R/lHK8gflDZWTBaRXM1TSeO5S/sq6FQJ7Lr7vqXA67NAQOaq0HwgGwBJh24OeKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iQVS4uoh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8WVYj2Qd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iQVS4uoh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8WVYj2Qd"
Date: Fri, 18 Sep 2026 10:15:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726528;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5Vrud+pnbr9I5vmSAMawcjAc1j+gsBKe4ZgTco8pxk=;
	b=iQVS4uohpma91fVifc4+95mApsUm7XneCiRrUZUoZghkp6o5Tvp0oAcXqCu5bwaULONdR8
	SY8tYqneCH2LPex1Zyp5RyhlyoQ+2cFMkmK0+5VTJTx/wEmUo1M4l0l0kf95nCJ9drHI7M
	5QnwOMVEvxk7dPHyUhxHM7LYXqrrBYeblcJTrm8a4YAHfaB4WFJyi9pPAJ/fx0IaYthGF+
	FVhUYnN2eI/rMECzx7c0/MOJ9zT0ODtpeMl7C/IG+hDTV/JR7S0k+zskI8j9wGVIBW3Xj7
	s2qwpucO6ifTEPwdNKNQupYiJ3yfYD5zdp9B8G3DVp9gL0+ZMQ+2Ht2/P7eHVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726528;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5Vrud+pnbr9I5vmSAMawcjAc1j+gsBKe4ZgTco8pxk=;
	b=8WVYj2QdLvmGMjx6RnKb5u0CFb1CvjzHcXbJ+7TEuegu9Lj9LD8f4h5qN/YqkeRf3Mp6db
	cq6RsGy6MzWsWaAQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for recorded checksum values
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-36-song@kernel.org>
References: <20260916184351.2720310-36-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972652700.1720534.5279771302264811833.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     4f49c0a593a51cfee15456c079def320fc0ccad1
Gitweb:        https://git.kernel.org/tip/4f49c0a593a51cfee15456c079def320fc0=
ccad1
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:28 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:29 -07:00

objtool/klp: Add test for recorded checksum values

Whether klp diff treats a function as changed is decided by its checksum,
and until now nothing looked at one.  A test asserting only that the right
functions were cloned cannot tell a correct checksum from one that happens
to differ.

Asserts both directions -- the changed function's checksum moves, the
untouched one's does not -- and that checksumming identical input twice
gives the same answer, since otherwise every rebuild reports spurious
changes.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-36-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-checksum-value.sh | 37 +++++++++++++-
 1 file changed, 37 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-checksum-value.sh

diff --git a/tools/objtool/tests/generic/test-checksum-value.sh b/tools/objto=
ol/tests/generic/test-checksum-value.sh
new file mode 100755
index 0000000..feae6a1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-value.sh
@@ -0,0 +1,37 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# The per-function checksums klp checksum records are what klp diff uses to
+# decide which functions changed.  A checksum covering too little misses a r=
eal
+# change and the patch silently omits the function; one covering too much, or
+# unstable across identical input, clones functions nobody patched and drags
+# their dependencies in with them.
+#
+# test-basic covers which functions got cloned, which is downstream of this =
and
+# passes for either kind of wrong checksum as long as the two errors do not
+# happen to cancel.  This checks the checksums themselves.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+
+assert_input_symbol changed
+assert_input_symbol untouched
+
+run_checksum
+
+# The edited function's checksum has to move, the untouched one's must not.
+assert_checksum_differs changed
+assert_checksum_matches untouched
+
+# And it has to be a function of the code, not of the build: checksumming the
+# same input twice has to give the same answer, or every rebuild reports
+# spurious changes.
+first=3D"$(checksum_of orig.o changed)"
+build_pair basic.c
+run_checksum
+[ "$(checksum_of orig.o changed)" =3D "$first" ] ||
+	fail "checksum for 'changed' differs between builds of identical source"
+
+pass "checksums track the changed function and are stable across rebuilds"
