Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF153845B0;
	Fri, 18 Sep 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726510; cv=none; b=XCymHkNtDvSimPv29M4ZiO1wOtacG81kbzPjgXP+1JaXvdfKcpo18SR57qMBdlIsPUXVR9Ueu4QDXnhe4I/WBC7uQodkpnY9Er9wjqwwnMxkikjpkxaB9fRby1ROM4ogfQ/H+p3pAUhjsDHieABoJmz3qMolUKjiTaoQ9ZMlVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726510; c=relaxed/simple;
	bh=ta/ZhgjsqqU42WI7G6EpT/+czo8S3ykGsBuH2qwHIGc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=aDYWenq778VuCZHMadHkLKueiySd4CtHG2qxlOmEit7WeFFJTjBngKVdLEYskeJqlh+blt66XebtkbVrjnCEp7rPO/u29wO+T4GAT55oqFhq/YAApX+a+wSfmM61ursVvwAzYxCh86INRxniDcTQmoZ6nAtRIJqYGmc3kQ5+mBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=As7jDfzt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SSZNIdtF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="As7jDfzt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SSZNIdtF"
Date: Fri, 18 Sep 2026 10:15:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726505;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4Jg8f769orjs+tvNylnfqmSgY2t5c+RS686/KHr9HA=;
	b=As7jDfztOYWngnyNmwo2F9Pcg2v/DlvkSjXtky+XQhSOxVH3miRLPhXv14rn6ArddCBPPx
	w1MfhjGrssLkmwsZ6h9K15a2ytyiMKdgDYTZ3/PGXsemuGsQShaOgi3Q4NCCYV0bvDjZYA
	Y7XhMxIbVgI+f0BM+2iEllf8mdSD4Uh/6pD0Ql8edzIsFihUaKeNFJKHAkzuneOzBCkqmw
	TAEMUf0ZU15SXtFIY33Ss04S/Byn3u1MVdk7GP9o3t4C4yLu2+eJFyhBIzdg1C1oP7qFCc
	Tk7gizxg4C7mZ3ycQ2wsWF6y7Q7tGn2sQgQHq5ymzTX/hCySKVLE3aU2EmSk4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726505;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4Jg8f769orjs+tvNylnfqmSgY2t5c+RS686/KHr9HA=;
	b=SSZNIdtF0V58LRtWBH7QjUtk8SG7gvYFIIE4dGIBEaC1NwtGdbRX1mAKixbKPc8jpRG7ao
	5ulL+lyxPqIQU/DQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for a static branch
 introduced by the patch
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-49-song@kernel.org>
References: <20260916184351.2720310-49-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972650372.1720534.15386651676899926105.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     548b6ec15cfcf190cf1231d20c2473f4f22a810c
Gitweb:        https://git.kernel.org/tip/548b6ec15cfcf190cf1231d20c2473f4f22=
a810c
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:41 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:46 -07:00

objtool/klp: Add test for a static branch introduced by the patch

Patching a function which already has a static branch and adding one to a
function which had none are different cases.  In the second the
__jump_table entry is itself new, so there is nothing in the original to
correlate it against: klp diff has to carry the entry into the patch from
scratch and reach the key the way it reaches any other vmlinux symbol.

Dropping it is silent.  The patched function keeps a static branch the
kernel never patches, so it takes the same arm forever whatever the key is
set to.

Give the fixture a NEW_KEY knob which puts the whole branch behind PATCHED,
and assert the premise -- that the original really has no __jump_table --
before asserting the result, since otherwise this is just a second copy of
test-jump-label-key.

Verified by making klp diff skip __jump_table when cloning special
sections: the test fails.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-49-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-jump-label-new-key.sh | 51 +++++++++-
 1 file changed, 51 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-jump-label-new-key.sh

diff --git a/tools/objtool/tests/generic/test-jump-label-new-key.sh b/tools/o=
bjtool/tests/generic/test-jump-label-new-key.sh
new file mode 100755
index 0000000..3bc6005
--- /dev/null
+++ b/tools/objtool/tests/generic/test-jump-label-new-key.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A patch may introduce a static branch where the original function had none.
+#
+# That is not the same case as patching a function which already has one.  T=
he
+# __jump_table entry is itself new, so there is no counterpart in the origin=
al
+# to correlate it against: klp diff has to carry the entry and the key into =
the
+# patch from scratch, and the key has to be reached the way any other refere=
nce
+# to a vmlinux symbol is.
+#
+# Get it wrong and the entry is dropped, leaving a static branch the kernel
+# never patches -- the code takes the wrong arm forever, silently.
+#
+# Where the key lives still decides whether that is allowed, exactly as it d=
oes
+# for a key the original already had: a module-owned one cannot be reached, =
so
+# introducing one has to stop the build rather than emit an entry nothing wi=
ll
+# resolve.
+#
+# Covers the same ground as corpus/x86_64/static-branch-vmlinux-new and
+# static-branch-module-new in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup klp_test_key
+build_pair jump_label.c -DNEW_KEY
+
+# The premise: the original really has no jump table, and the patched one do=
es.
+has_input_section orig.o __jump_table &&
+	fail "fixture put a __jump_table in the original; nothing new to add"
+has_input_section patched.o __jump_table ||
+	probe_skip "compiler produced no __jump_table on this arch"
+
+run_diff
+
+assert_patched target
+assert_section __jump_table
+assert_reloc_sym __jump_table target
+
+# The same new branch, with the key owned by a module.  Drop the vmlinux exp=
ort
+# first: while it is exported the key is reachable and being new changes
+# nothing, which is what the first version of this got wrong.
+export_syms
+rm -f "$workdir/out.o"
+build_pair jump_label.c -DNEW_KEY -DMODNAME=3D'"klp_testmod"'
+run_diff 255
+assert_diff_log 'unsupported static branch key klp_test_key'
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "static branch introduced by the patch carried in, or rejected for a mo=
dule key"
