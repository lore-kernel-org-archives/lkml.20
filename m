Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7C4B44AD;
	Fri, 18 Sep 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726547; cv=none; b=Wyg0kam5/vusP10+yg0BBa2JASXP/iBkeak4IBVXVfrnqzFtAKN+xGyYueLu4KKm80CAeLHeGrjNu7kRkUH9VSP+P4gi1ga8TLpQTJZro/AuMTuQXo2fTX8HaDv1pqTgNGB4QximLMMn+I9oOD75G2YkHNz23m1kFWRKb5N/EpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726547; c=relaxed/simple;
	bh=fK84M+TGymUL3VSEzfKLAUcJhsxoZoRTb9A6b4Ag36A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=csMlIVekaxcTCY91dD2z30000qizzTRH8Hr0FRbfEQuXLcWFKBbLb8HmGPlYgRatVva9ngaiSje9lg7/UejFaibAiPCaRwNq8pM8sxaZ6kE+dbAyADt2Coz2znKYgmmjLqiMbemc9MvrpeQuuYeC1EPwzUoRCoGLgSSICFT7p5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GrHWatBm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Uh+Do8Co; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GrHWatBm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Uh+Do8Co"
Date: Fri, 18 Sep 2026 10:15:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726542;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjBbJwMWsgERzcRiI6dJ708J2dUa95El0zCfrwNnuj0=;
	b=GrHWatBmy2Q7MJKRZv8DET3cf7VryYL1N96tFJtujj7KJb+Xu2UhBs6iXfnVJGWswq6W/8
	pv1RmKOtithfcF7qHWc0k94sy9htCEt4B72SPoMROCYmGtzkjJmSVZh4xUJC0320BB/Z0j
	8czhcYNIgR1eYczHAczyikMCwWYjWeAot3VEGJ8/b61m8XoZHNw0f6Ob3K2kkG8gsWIld7
	7hCioE+YjMUu6L/puO0JXuvIpbzPNLKcWtthEZONegRhD/n653/315ApNkO4CA0kEGeTwI
	OjIsyddTGiXLtlWxqduAMXTUM4t9rG1Z163zhEBZE4hr6o2N+egXDJzrQqjpZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726542;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjBbJwMWsgERzcRiI6dJ708J2dUa95El0zCfrwNnuj0=;
	b=Uh+Do8CoQTmDGO33oGVpkrnwJlGHD03Sa/FUmMdH4g7LYfjlPDuZsPhXqM9PBGg+gtOtPC
	5GyAx12Ej32uiVAQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for unchecksummed input
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-27-song@kernel.org>
References: <20260916184351.2720310-27-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972654111.1720534.16211998999866758769.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     ce31e66cbb9dd05685afb1236d1d71a513a96c91
Gitweb:        https://git.kernel.org/tip/ce31e66cbb9dd05685afb1236d1d71a513a=
96c91
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:19 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for unchecksummed input

klp diff decides what changed by comparing the per-function checksums klp
checksum records in .discard.sym_checksum.  Handed an object which was
never checksummed it has to say so; silently concluding that nothing
changed would be the worst available answer.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-27-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-missing-checksum.sh | 18 +++++++++++-
 1 file changed, 18 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-missing-checksum.sh

diff --git a/tools/objtool/tests/generic/test-missing-checksum.sh b/tools/obj=
tool/tests/generic/test-missing-checksum.sh
new file mode 100755
index 0000000..89a05b1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-missing-checksum.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Without .discard.sym_checksum there is nothing to compare; concluding that
+# nothing changed would be worse than failing.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair basic.c
+
+( cd "$workdir" && "$OBJTOOL" klp diff orig.o patched.o out.o ) \
+	> "$workdir/diff.log" 2>&1 && fail "klp diff accepted an unchecksummed obje=
ct"
+
+grep -q 'sym_checksum' "$workdir/diff.log" ||
+	fail "expected a complaint about the checksum section, got: $(tail -1 "$wor=
kdir/diff.log")"
+
+pass "unchecksummed input rejected"
