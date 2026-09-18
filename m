Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4304CB8B1;
	Fri, 18 Sep 2026 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726502; cv=none; b=eb2qTd7Qr2kbIlDGzvH4NFR9pqys9/n7sLoQDXD9bvZxZ0fK8zkjUKwt5bA6JkxGwl9BBBZ7CtOCDv0qVCKFfE/8f7zOLzE5ZGMf0Q+QoTkjR50eytu5AXL7UjB0Pzcodm00vCd08gPwTq2WEnQ+pqaZ3q7/xK2ReX4J8tAySPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726502; c=relaxed/simple;
	bh=i3nplX8BLKbAUtAWOsJHDwQlmsMDc4BpOXcA4si+PDg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Aom46RJDm10/Gz3Mw083Qjzi1wn5AlGhEq7+bEM7BgAcB4pZiTpyt9NJPtFR1u1CS4wIef1vuIVNxMrF08LbBNSkjCykMGQ7V5P+u+L77cP1MlJNh1p+nSAO0LdvQ+FV2q6NeznTo3U2DgnmskVzFVt4OzU+a5lZykrUDNkxB7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4svGGToo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o/XCMhpN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4svGGToo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o/XCMhpN"
Date: Fri, 18 Sep 2026 10:14:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726496;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnZv5pTFC6VGE83YiPL1ieGLTgK4llSkjHAnrHg5MjA=;
	b=4svGGToogf++3KZj+HuTYuvsepo/7uUA+BFXYMofbzt6y7dzwkDGbawkzM9wFbZk9cxYo1
	mhNfiOdnL2S/O2yQGcnoOMJLsX90GJxUbKJcYgM6/kiZTNOwhscetyh2UhvUqO2hytgSZL
	6c8vZOtz0xYZ3iKBoaKTDvhTgJTNuoRCAa7QDsj5nE1kn3cH73OmYVZp8QpSF0jpi3vlUY
	x3fE/L9NprwIA5c58ZiofZNPX2RD1K8RZgR5SxpHp8r9rHENyz+BOY9/NhaqM3Ci6Ynq05
	8FAGMOKd7AN4X6W/dNVFWj8Eqm/FvHqobz6sB6uXBpUKnQ9WFimyeqqCrnprrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726496;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnZv5pTFC6VGE83YiPL1ieGLTgK4llSkjHAnrHg5MjA=;
	b=o/XCMhpNlm/6H+oFNXS6WXobQWnbzAnmVI035O1xcIHNWxdHoaIqS6nGiaFhkJ5/zFHVJs
	lFzV76kW0rrpZsDw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for a patch which strips a
 data annotation
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-55-song@kernel.org>
References: <20260916184351.2720310-55-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972649523.1720534.1892729467241174210.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     5a07dbf3b6b77c0f808288bb6f176cfa557360be
Gitweb:        https://git.kernel.org/tip/5a07dbf3b6b77c0f808288bb6f176cfa557=
360be
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:47 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

objtool/klp: Add test for a patch which strips a data annotation

klp diff needs entry boundaries for a special section: either an entsize,
or ANNOTATE_DATA_SPECIAL annotations naming where each entry starts.
.static_call_sites has no entsize, so the annotations are all there is --
and a patch can remove the last one in a translation unit while leaving the
section itself in place, so that only the patched side has lost them.

The section still has to be handled.  Dropping it leaves the patched
function's static call unregistered; misreading its boundaries attaches the
entry to the wrong code.  Neither is reported at build time.

Give the fixture a NO_ANNOTATE knob and assert the premise -- annotation
present in the original, absent in the patched object, section present in
both -- before asserting the result.

Fixed by commit 3de711fba73a ("objtool/klp: Fix create_fake_symbols()
skipping entsize-based sections").  Verified by making klp diff skip
.static_call_sites when cloning special sections: the test fails.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-55-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-static-call-annotate-stripped.sh | 42 +++++=
+++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-static-call-annotate-str=
ipped.sh

diff --git a/tools/objtool/tests/generic/test-static-call-annotate-stripped.s=
h b/tools/objtool/tests/generic/test-static-call-annotate-stripped.sh
new file mode 100755
index 0000000..818b047
--- /dev/null
+++ b/tools/objtool/tests/generic/test-static-call-annotate-stripped.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A patch may remove the last ANNOTATE_DATA_SPECIAL in a translation unit wh=
ile
+# leaving the special section it described in place.
+#
+# klp diff needs entry boundaries for a special section: either an entsize, =
or
+# annotations naming where each entry starts.  .static_call_sites has no
+# entsize, so the annotations are all there is -- and when the patched object
+# is the only side that lost them, the two sides no longer agree on how the
+# section divides up.
+#
+# The section must still be handled.  Dropping it would leave the patched
+# function's static call unregistered; misreading its boundaries would attach
+# the entry to the wrong code.  Either way nothing is reported at build time.
+#
+# Fixed by commit 3de711fba73a ("objtool/klp: Fix create_fake_symbols()
+# skipping entsize-based sections").
+#
+# Covers the same ground as corpus/x86_64/static-call-annotate-stripped in J=
oe
+# Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_call.c -DNO_ANNOTATE
+
+# The premise: the original describes its entry, the patched one no longer
+# does, and both still have the section itself.
+has_input_section orig.o .discard.annotate_data ||
+	fail "fixture produced no annotation in the original"
+has_input_section patched.o .discard.annotate_data &&
+	fail "patched object still has the annotation; nothing was stripped"
+assert_input_section .static_call_sites
+
+run_diff
+
+assert_patched target
+assert_section .static_call_sites
+assert_reloc_sym .static_call_sites target
+
+pass "static call site kept when the patch strips its data annotation"
