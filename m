Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A04B95B4;
	Fri, 18 Sep 2026 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726555; cv=none; b=SDJpg+dDVpWAGUhTDP9R58vJ346oDo4O299efHnP8++cmxX7NLDCAND+mUyWjV9Xuf8m+lr1GtLglR/p4bRYZm2ZeLFExB/xrsxb9W8X/hvj3zgn3A+rQvsJhGiqSGzNwF5sAAL2Q9eTWTGJs3MTOEaALRX/kWmT3E3Z63Muzv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726555; c=relaxed/simple;
	bh=NIY2ngcXddulCdhHzNHh5uuMA+PzcuYTOm3RdyQ9nlA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=APWDixjSGSrDjDihvVAYN8PS4PzgpoD6C7ZuWKpEQ72ePhvaDBLis48/kn1/lOfrGTDPXgrcp13a4zqqSQkxhspgH4hOouyTG/7iUT4gMlEHvjQ3FvRvcTCowBt0puqhP+Yn60GIOLkMbH46vvMvf03ZJ/Vju56W+rZvlrWAscw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4RMwSgAV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tg9KUqOZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4RMwSgAV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tg9KUqOZ"
Date: Fri, 18 Sep 2026 10:15:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726551;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzhQOHyxYjcxFg8Z+RMeJKl82IsG1w/zlSKwpe03T1M=;
	b=4RMwSgAVIj8p8IodR9uPs+wC0R8vvsz62tHh4TG23p62ErDavgkaC5uH96Of4URzj8C6Ly
	Tm4ap3cTzzqSk1JwyOaWuW/bBwPFJ0W1cftrLJxtobRCU+m4K24xt9Qkmv1aijDduqY7oD
	drLYL9vPje3XtXvugzsAlO2kZBTTy89F1YZ/BMizE0LW8McFA3S4zlBCJqap52jQmQjZKe
	clTVJTJ8SBzy39Mr2NlZRmXJ8iq+qMTDerieRv0AH8I6LsV0PHouPKt9oDm2ffWHn3qklw
	Cza7eTq6L3TCMu2VWcuZ0Wx/o8716RRUW2Zmq0NhMjNe5df0K4/gNZJ/neP7tA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726551;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RzhQOHyxYjcxFg8Z+RMeJKl82IsG1w/zlSKwpe03T1M=;
	b=Tg9KUqOZ06DW7iQxcimliJztnQb1sKk+11V1o3V0GqjoqjG/Ls7l+QAKCtNeoCox3fkiTl
	FoxG/dTYNvvd78Dw==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for rejecting module-owned
 static branch keys
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-21-song@kernel.org>
References: <20260916184351.2720310-21-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972655017.1720534.13191898175717286663.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     7be49a35ce975ef9f2ccf3aa0dc4cf92ce244918
Gitweb:        https://git.kernel.org/tip/7be49a35ce975ef9f2ccf3aa0dc4cf92ce2=
44918
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:13 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:27 -07:00

objtool/klp: Add test for rejecting module-owned static branch keys

A static branch key belonging to a module cannot be reached with a klp
relocation: the patch may be applied after that module's static branch init
has run, which corrupts the code.  Emitting one anyway produces a module
which loads and then BUG()s the first time the key changes state, so klp
diff has to refuse it.

The fixture differs from the accepted case only in the module name recorded
in .modinfo.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-21-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-jump-label-module-key.sh | 22 +++++++-
 1 file changed, 22 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-jump-label-module-key.sh

diff --git a/tools/objtool/tests/generic/test-jump-label-module-key.sh b/tool=
s/objtool/tests/generic/test-jump-label-module-key.sh
new file mode 100755
index 0000000..7c3f82c
--- /dev/null
+++ b/tools/objtool/tests/generic/test-jump-label-module-key.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A static branch key owned by a module cannot be reached with a klp
+# relocation and must be rejected.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair jump_label.c -DMODNAME=3D'"klp_testmod"'
+
+has_input_section orig.o __jump_table ||
+	probe_skip "fixture produced no __jump_table on this arch"
+
+run_diff 255
+
+diff_log | grep -q 'unsupported static branch key klp_test_key' ||
+	fail "expected rejection, got: $(diff_log | tail -1)"
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "module-owned static branch key rejected"
