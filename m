Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA2427FBE;
	Fri, 18 Sep 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726506; cv=none; b=thUjAVKd7YJY1Zu7xRCJJ/YggYouRXUqaN2srFHnCOern8XgjrDpa7xm8VnzOInr51uWA4p6rgKSpkySEA5/wb/lM52qTnXKCg5gsleRolw1HskMVmKpaB2U2q67AH6SSOx3T9t5eY27G5IDJGgw87cIt/2uJJY2iMOt36TNy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726506; c=relaxed/simple;
	bh=mJ6H/RBNnZ8TkUa+Q/KdllQtEeXJ4YwCYJ6xuI4KVh0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Rhd15rO0jWAf7r6yT0kyZZLt/QWTp23t6En3sVKUcJJ0Qy3R6I/gZVK8LGZFqiZALGUWUYkXWSXYaCOBhM/gp4rn3AMIuOUuDf3vwmqviO5JeqSAPUaAT1qx0+zDN8cQKjr+87t5m/18AdrKF/XuSvbkNP9Gblp1NOncnP449g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OueS699a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rzM8ZvrP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OueS699a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rzM8ZvrP"
Date: Fri, 18 Sep 2026 10:15:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726502;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01YY1/tsJELu96HDCUlPGNz7q6JLLu0Nk4zm0d3jyrA=;
	b=OueS699as1ZmF0Chw06FF4nK8OJi+7sCRqvZPCfv4DmgGVE2cr86zGmkgrSz1P2E9tmUyQ
	jtpMpNjLqN3SG+d911CRc6Fc/Z4BtK6gOmWUAP/rU+wajezkFT0nyiWNzZIP4PrS0ASUa5
	CJ4GFiMaSQIiZt8SyyKEkjwOqgMRR3CzGNy+idPhBmhQY6zSvQOuL2GnuhQQ09m/6LAixM
	hZ01hF76P3E8LiZEUUCKPXaKHrjwwY+BkT2k2o822qKDTcqIxJmjU+FLV2Abya07Dpq3Fx
	M52LXrgujAGp6A98cLOjzCkXcxKK8JjDxA45ypYc7CcaWw6aIkTQHNn9yu9KEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726502;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01YY1/tsJELu96HDCUlPGNz7q6JLLu0Nk4zm0d3jyrA=;
	b=rzM8ZvrPNSZ4swm2CgHpZduwe3GJgim8JKjQRi+KUMDSetj7Fh5mF2/SZ8Y4sFeM0NIjoO
	ZdAXVK4MTTOJ7VAA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for a static call
 introduced by the patch
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-51-song@kernel.org>
References: <20260916184351.2720310-51-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972650085.1720534.12167610720847714135.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     b2747b54e136f5c4d897a31f6d8aa8891ad30379
Gitweb:        https://git.kernel.org/tip/b2747b54e136f5c4d897a31f6d8aa8891ad=
30379
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:43 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

objtool/klp: Add test for a static call introduced by the patch

The counterpart to the static branch case: a patch may add a static call to
a function which had none, so the .static_call_sites entry is new and there
is nothing in the original to correlate it against.

Where the key lives still decides whether that is allowed.  A vmlinux key
is reachable; a module-owned one is not, for the same reason an existing
module key is not -- late module patching lets the livepatch load first and
the unresolved entry is dereferenced when the module arrives.  Both halves
are here because they fail in opposite directions: dropping the new entry
leaves a static call the kernel never patches, and accepting a new
module-owned one is the corruption the check exists to prevent.

Both halves are one test over one fixture: built with -DNEW_CALL the key is
vmlinux's and the new entry has to be carried in; built with -DMODNAME as
well the key belongs to a module, klp diff has to reject it, and no output
object may be left behind.  The premise is asserted first -- the original
must have no .static_call_sites at all -- since otherwise this is a second
copy of test-static-call-module-key.

Covers the same ground as corpus/x86_64/static-call-vmlinux-new and
corpus/x86_64/static-call-module-new in Joe Lawrence's klp-build unit test
corpus.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-51-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-static-call-new.sh | 45 ++++++++++++-
 1 file changed, 45 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-static-call-new.sh

diff --git a/tools/objtool/tests/generic/test-static-call-new.sh b/tools/objt=
ool/tests/generic/test-static-call-new.sh
new file mode 100755
index 0000000..f7d2b39
--- /dev/null
+++ b/tools/objtool/tests/generic/test-static-call-new.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A patch may introduce a static call where the original function had none.
+#
+# The .static_call_sites entry is then new, with nothing in the original to
+# correlate it against, so klp diff has to carry it into the patch from
+# scratch.  Where the key lives still decides whether that is allowed: a
+# vmlinux key is reachable, and a module-owned one is not, for the same reas=
on
+# an existing module key is not -- late module patching lets the livepatch l=
oad
+# first, and the unresolved entry is dereferenced when the module arrives.
+#
+# Both halves are here because they fail in opposite directions.  Dropping t=
he
+# new entry leaves a static call the kernel never patches; accepting a new
+# module-owned one is the corruption the check exists to prevent.
+#
+# Covers the same ground as corpus/x86_64/static-call-vmlinux-new and
+# static-call-module-new in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair static_call.c -DNEW_CALL
+
+# The premise: the original really has no static call, the patched one does.
+has_input_section orig.o .static_call_sites &&
+	fail "fixture put a .static_call_sites in the original; nothing new to add"
+has_input_section patched.o .static_call_sites ||
+	probe_skip "compiler produced no .static_call_sites on this arch"
+
+run_diff
+assert_patched target
+assert_section .static_call_sites
+assert_reloc_sym .static_call_sites target
+
+# The same new call, with the key owned by a module: not reachable, so the
+# build has to stop rather than emit a relocation nothing will resolve.
+rm -f "$workdir/out.o"
+build_pair static_call.c -DNEW_CALL -DMODNAME=3D'"klp_testmod"'
+run_diff 255
+assert_diff_log 'unsupported static call key __SCK__klp_test_call'
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "static call introduced by the patch carried in, or rejected for a modu=
le key"
