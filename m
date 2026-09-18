Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5244EF121;
	Fri, 18 Sep 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726565; cv=none; b=lJPF3+pFk9C5nq712AEc5tCPH3K2BOqybzJ8SmbvRXCxPlI0IJIXc7NJpKZFd8gWFZfSeO0a9qfRd/OY4Hq0xB7rV+2QCFL8Njfc034ViRvIEiSxsdwuhpZNxsc5oy4ZUu618Cv3mPY3eodYCF6YBaHkoMZAXwuvl7kmYSb/NOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726565; c=relaxed/simple;
	bh=z7pEtX/HdCYmSflx4WuarsM0bdCeLbLk9Tjjw3v7DlI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WmE55tSlpaEL/TuJ4K2XXAJ6eYTHOeThYA/jsFkcRcARSw/jhubYkp+e+UUyeXOGezW0awsmr0vCZW17ZiGN3GfahVxg4o9Zz0pB9xYJkh5hqbHCj2AggcWWErL2OP859M6oHGIU6DYA+eOy6FCqkPEeAYXJQmqYT9vhPEMtusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MJ/e+Vxn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9gCcot4k; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MJ/e+Vxn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9gCcot4k"
Date: Fri, 18 Sep 2026 10:15:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726560;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fE2xQKUHiyqJOVTLtPTVUVGisFaxgSbA8n/HhtKibMc=;
	b=MJ/e+Vxn1RuJ5Dfsv4qHLXivRJyJ/E4n8BR/HmeFVoFV2N5ab8qk9ZtCDhY5ZScJFh/oQz
	wzjGRWnoRa5VNymD5fT6jXEQpJ+zjIoqCCVD92qQW/l9UYwBOE7vAnmBCrtiu/SyKzwujH
	tLe2WWCDWLwy55r6gO2hv9a+3vwcX+gi5B2fZKsD2GUYQS267ViJyRLBwOds8KDHVlKFAF
	Z5jRJR5Ell3vt8zQxBJqeZ01dGG+N/IYFcBl2MC+Y900G/gxvrXUsJwcrEmLZH7LjUKeTU
	tKJzRakdRb+1172PdUCF5581aoOsYFILbY9pbUbhsLyAKfdA/EbizNz0Xo3GDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726560;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fE2xQKUHiyqJOVTLtPTVUVGisFaxgSbA8n/HhtKibMc=;
	b=9gCcot4klm3CJl4AbdAxGZbBucRZtM2QlHohNFnVW43FTB5I/6Xzz1WnrlJF9bQwbu+SZh
	oTJVRdHr1S/Um9Bg==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for newly introduced functions
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-15-song@kernel.org>
References: <20260916184351.2720310-15-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972655899.1720534.17590896067712543850.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     10aedc2ce2edc1a95e83da123ba76ea2eba07480
Gitweb:        https://git.kernel.org/tip/10aedc2ce2edc1a95e83da123ba76ea2eba=
07480
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:07 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for newly introduced functions

A function added by the patch has no original to correlate against, and
still has to be carried into the livepatch or the changed caller ends up
referencing something which does not exist.

The helper is noinline so the case survives the optimiser; otherwise the
compiler folds it into its only caller and the test covers nothing.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-15-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
