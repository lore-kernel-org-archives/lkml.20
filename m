Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466594B826E;
	Fri, 18 Sep 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726567; cv=none; b=CFeuR/kM8Kl/uEfOSfClWqsRZTZxwk2cKd2fM2i6C6+O11cVupUKQeZG5S+5TsHqAG+DFRANw2AtaBU4DzlUIwdM5C/eMRhkIZ83QEhftysQ7di6vCK4jDixWm9x8xYWcIovgKdJJq9m+KGOR0COOt3dIyTC5nNfljSkoE4IP/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726567; c=relaxed/simple;
	bh=NDylQv8QY046ZvXnSTCjkuVHOOu+quqY2RDh9/Pkt/w=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Nktvx1oJwInw/ZAgbqFV+HKMJlVSsRoEWo2K/2J/VTqKMPtNBiGZPo9THVMiV/O9+mfnJf4yW2j1Y5z0rKrke6prHXjpr92pMUxLwoXQ3VOxZ3faNIyK2t5xkHDfPHe6XGXpA7ExI/AHw9ZM/8w0VnXYyxlkRhJXhbS0uWj8mvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v6Eo474b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oK1mNwQS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v6Eo474b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oK1mNwQS"
Date: Fri, 18 Sep 2026 10:16:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726563;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lphX6Q2uLTMRACCxxpEsaFHYiyyXZRpcXNc0f6Ve3Zw=;
	b=v6Eo474bE7pqlLtue4qQ4geHVbeCV4BOyEbxdWRaM4mcolsLmP7SAgDTH9bXDUqAxgLMiG
	djfFO1QAxGCCIwmVEfERDozhFeTeDxJYaFeBqr7pY0ltGZRgzl2oJ6zjSTVi242iB2Pqsr
	LcEDcRbZUXt3bceVOsHHvN367c6yKmJ9SOKdSxgDCoSN1DXN+NNCqf4LZ6T1iF9P3uBu9Y
	xM5uJnjQoKvT2L1oYpuo1WTf8ro6hLCc/Oq4QCV7Cz/q+Kw+qaIf+dIcTfj6Z9COBaj0Kg
	VESNvxkRHJD0KtzMx19UJlBUAaTZPBOVivgekdptfwHh1WuzikHuvagANNfWMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726563;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lphX6Q2uLTMRACCxxpEsaFHYiyyXZRpcXNc0f6Ve3Zw=;
	b=oK1mNwQSOJBkf8cTEeFybxUqjdhbVWSU9fXpk96G49AHEFd2Rh9LzUCjTcm8dKUlJnm+qi
	eGxVaIds40HlPRAQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting changed data
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-13-song@kernel.org>
References: <20260916184351.2720310-13-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972656181.1720534.6333986718788277312.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     6a73fa640753cbf93163771c7fc70b06a165de3e
Gitweb:        https://git.kernel.org/tip/6a73fa640753cbf93163771c7fc70b06a16=
5de3e
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:05 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for rejecting changed data

Livepatching replaces functions.  Nothing can swap a variable which live
code already refers to, so a patch which changes one has to be refused
rather than applied with the old value left in place.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-13-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
