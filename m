Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE6F30CD95;
	Fri, 18 Sep 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726509; cv=none; b=kFGg/cQSVq7rOOngMGPH+j5pfvO5YNjfhFS1Urf2Fm9nHxwtaCFzfDjXQOOtMs/NXTG+ljtMHa8mgozecQ4Zp9TIiqrnC8bSsZqEfYUeShENxhLq0h06000riuT/sJdyiPq31v0tNhHRyflMFrgh484BaXqEebf1SGq+H/wyQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726509; c=relaxed/simple;
	bh=q2dQEs4EQA4Py4Mh7Afol/rlqQO91LqYrXhj5EyGG7I=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SHBCi7X4GJ3ItFuBoixxq55DKN7sDUKj/H2mBoNBriTzybjjq0M/pa9RRycdCPJac9mnFb/fjqSURavSWk9yhE8nBjEiSWsbOjQ9AuvhBf1oOqDLarQsZ1wyVYpcaxLw0RU7C9MZXj66uhtMEYkX9OsRUYxjprFQ27KXexYlqQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W23BJFxf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2CU2+qci; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W23BJFxf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2CU2+qci"
Date: Fri, 18 Sep 2026 10:15:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726503;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbaudGHcn8RhT049x+I+uVVZsao1TypFA2czd8BY65w=;
	b=W23BJFxfDush4gSoA5ANIbfwMoDZ0+4SmigHKHX0fxVSrqi3y5eCD8qkpU22Yf9kWQrndy
	YofDQZ+EfD9gMXOo6WM+F7ckTifI7wlFrGIWBnHJhSiW9vj7SBDGAQFDrmoLNzTS0E4uii
	BmhnUlgRLGzo3eOEZh7yrCUrMIV2/ez2tRAaLeUvb5gP02H96HnlHnaYnHdvA6emduHzzG
	uyAXXns3qxkyDpE9ug/BdpQoP0G8uYhqLCsHRJlq51WY0t6w9CkVofOwr60CTZX7FF6zdm
	4sYvBe5njTBdwa5fk0bHF7LHKGjKQmT9Oh1PjHRDb/Ltd0+jN2A6XHyZaN3g9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726503;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbaudGHcn8RhT049x+I+uVVZsao1TypFA2czd8BY65w=;
	b=2CU2+qci7IAbAO2kpLguHp5H5mL8sGl6/y/KM2Qcpz9CyV7KqLgbf5YLtWvLIoeLIEWZH5
	MOT8KKyXuOoKtPDA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for tracepoint and pr_debug
 static branch keys
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-50-song@kernel.org>
References: <20260916184351.2720310-50-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972650223.1720534.13203129316632525985.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     de215ff9b0a848541a496cfbbe102e68c894f66a
Gitweb:        https://git.kernel.org/tip/de215ff9b0a848541a496cfbbe102e68c89=
4f66a
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:42 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

objtool/klp: Add test for tracepoint and pr_debug static branch keys

A module-owned static branch key is normally fatal, because late module
patching lets the livepatch load before the module it depends on and
jump_label_add_module() then dereferences an unresolved entry.

Tracepoints and pr_debug() generate such keys everywhere, so refusing them
outright would make any function containing a trace_*() call or a
pr_debug() unpatchable.  klp diff drops the entry, warns, and carries on:
the patched code works with that one tracepoint or debug print permanently
off.

Both halves matter, and the test asserts both.  A build which fails is a
function nobody can patch; an entry left in place is the corruption the
rejection exists to prevent.

Give the fixture a KEY_NAME knob so the same static branch can be built
with either special name.  Verified by removing each exemption in turn --
the test fails for both.  That the entry is then dropped is asserted but
not isolated, and the test says so.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-50-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-jump-label-exempt-keys.sh | 51 +++++++-
 1 file changed, 51 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-jump-label-exempt-keys.sh

diff --git a/tools/objtool/tests/generic/test-jump-label-exempt-keys.sh b/too=
ls/objtool/tests/generic/test-jump-label-exempt-keys.sh
new file mode 100755
index 0000000..fa2f913
--- /dev/null
+++ b/tools/objtool/tests/generic/test-jump-label-exempt-keys.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Two kinds of module-owned static branch key are disabled with a warning
+# instead of rejected.
+#
+# A module-local key is normally fatal: late module patching lets the livepa=
tch
+# load before the module it depends on, so the unresolved __jump_table entry=
 is
+# dereferenced by jump_label_add_module().  test-jump-label-module-key covers
+# that rejection.
+#
+# Tracepoints and pr_debug() generate such keys everywhere, though, and
+# refusing them outright would make any function containing a trace_*() call=
 or
+# a pr_debug() unpatchable.  So klp diff drops the entry, says so, and carri=
es
+# on: the patched code keeps working with that one tracepoint or debug print
+# permanently off.
+#
+# Both halves matter.  A build that fails is a function nobody can patch; an
+# entry left in place is the memory corruption the rejection exists to preve=
nt.
+#
+# The two exemptions are isolated: remove either and this fails.  That the
+# entry is then dropped is asserted but not isolated -- making the caller ke=
ep
+# it anyway produces no output difference here, so that assertion stands as a
+# check on the behaviour rather than on the line which produces it.
+#
+# Covers the same ground as corpus/x86_64/static-call-module-tracepoint and
+# pr-debug-unsupported in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# check <key name> <expected warning>
+check()
+{
+	build_pair jump_label.c -DKEY_NAME=3D"$1" -DMODNAME=3D'"klp_testmod"'
+	require_input_section __jump_table
+
+	# Accepted, not rejected: this is the whole point.
+	run_diff
+	assert_diff_log "$2"
+
+	# And the entry is gone, not merely complained about.
+	assert_patched target
+	assert_no_section __jump_table
+}
+
+check __tracepoint_klp_test        'disabling unsupported tracepoint klp_tes=
t'
+check __UNIQUE_ID_ddebug_klp_test  'disabling unsupported pr_debug'
+
+pass "tracepoint and pr_debug keys disabled with a warning, not rejected"
