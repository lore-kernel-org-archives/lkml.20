Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05907471267;
	Mon, 21 Sep 2026 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982859; cv=none; b=ojOFJXykjwqQYR7HRglEmGGYx5jQLPVQYePf2dB0Bka3wlehHFK2adVX8584PSYsnVUQ9H2d3YQuT07cmDSGECd3pg3bHRVEFPkj4hWHXw/kHARyob/DsaZ7qO9Txv/wmQKcjgqSS1Q0DH2PTM8F7cAgIU4kErdeTE28VTUQNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982859; c=relaxed/simple;
	bh=g6EneXUrsXa+QLxBACNrPR9A7U6XueblwtDJ8lIt+zY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tgt/XhuxBEi3dTvQrjfRoYIhOr6uzzZyXB3DLCQgXnPMYwDGFZxVChGNVKFxyrrjuZN33/Y50C0l8B4HuOvcWF5djkc1Ogbc9gAveCSk9AkkK78KYEplwMQKLo7kvHzpgTl2KXIggXWMK8gIZ4qB0w6xyeZuq71dp0hjT1gyC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QQ0NjxP0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j4Zg+x+b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QQ0NjxP0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j4Zg+x+b"
Date: Mon, 21 Sep 2026 09:27:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982855;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccVIufu/Jomy+TGUwntgKm8ISabXPIPMbSDcDltgJ1w=;
	b=QQ0NjxP0BOkbhHGpZWzDwaFv+JGMHbje4hZtLyhklnXAHG/4XNxrn1Ypt0IvFYIXvnnVyN
	jZ/nEZYZ5q5f3PiCvN/+hN8tcvmPRm8CdXqmb0MFFh+tjfczVpoDQEsyP3FLc9nNm9Podd
	exEbn71mBf66rheHCyfO0vvJST8iRFbOGBT1rjwnKH3Xf8pzkRfywhwxJmeI/Se0qvBkSq
	DkVtLYeFN9QMuRyP2aAVdCXe5SwsMVmIKh6LjwCfREzpcLSUMCflv2u0qTdg6Nthd7yvzI
	VnE9mIv2dR21gAmEBDeBXT+HEga98SJZl/QXvubzZ1H2iiRXZUCw+62L/vFjPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982855;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccVIufu/Jomy+TGUwntgKm8ISabXPIPMbSDcDltgJ1w=;
	b=j4Zg+x+bkArwl0EToCzMzPZPAJW+trvCxWMrIwQEgy8dgtajK7MudyMd9QYOX52dAlc4mC
	nErzFFCaNARIFEAQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for a patch which strips a
 data annotation
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-55-song@kernel.org>
References: <20260916184351.2720310-55-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998285334.2819794.4401948325927506826.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     794b162b37c00a516eef83d37327fcc9238cca94
Gitweb:        https://git.kernel.org/tip/794b162b37c00a516eef83d37327fcc9238=
cca94
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:47 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

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
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-55-song@kernel.org
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
