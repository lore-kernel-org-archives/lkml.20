Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71714E1C8F;
	Fri, 18 Sep 2026 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726543; cv=none; b=Vux09O0fWecoP96p3bAwPSS6KY4xyYHLtR2/RZBRrnbi4tic8uZTkXQKc2LrMktPtmsyaUt95xSqZcxVRTh1kWsLH9yoQwgZIEs/Xe+jIgIekRH5fNcDbePTczoI+0evkOW2D9Oth/ZXj3leR7RAGfG2IO4pZ/1V5WoWJ/VBj0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726543; c=relaxed/simple;
	bh=DpccgMAUePUf36p/+zcfAiU0SwYjxB6QyuCoqjyhmPo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BjSrKCv8arMLFumd+sjY4CX2MgwIqwuMo3fOdTOFZcqFGeMkbUanTZ8Nxfo/UhWUJvZ41rjmHmpAfxZ7HGmfCkTdKbB0J+rN5PWjl8RvCfbogyKBtESeS28YFdJLGtn20ZIgAvEttDKQh4hDB+0X5VFit+8yaKbg6gC4MzuLWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vHtUGyIm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9ocC/nA8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vHtUGyIm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9ocC/nA8"
Date: Fri, 18 Sep 2026 10:15:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726538;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWmJuCwhsWUc6SVzNugsORwvA2PuuBqgO2O+SxM1YoM=;
	b=vHtUGyIm63Sec+/ZLzmbELTFc2SnbKy3CQmz/j/nGXCBDm6Y+A0DHsH/C36HVBwESNBePr
	EGnPQU1E25xX+BLisPTWbCBp2osiHCU/n6t1mD+YfHHFt466jSoh/9aa2czLjm7prpx5M0
	7C+/unMvVquuFEDQvr1/WrOUwUqMQm9cdFvH2WYXkzxjPaVlD3181J2LzFmum8EFF+fC0S
	x3lqoteb5qlQziKExv27MO4Yz/R8aDU5FGYs0NUvrenqmSjbMvJb0h4Nx5uFbd+/4tRiao
	INZlW4b0/fY60iK7K0YW06w2i+SwtjT6KjXYvb/mZp4MmvfQFqvs+2FuAl3wVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726538;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zWmJuCwhsWUc6SVzNugsORwvA2PuuBqgO2O+SxM1YoM=;
	b=9ocC/nA85b0psPE0FlHVV5HKauvq6vx557KkuZFGtCoxC5sBIH5gTVMVi4O82FbsOArWvP
	9GqE1ywZ/PAxE+Dw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for vmlinux relocs in a
 patched module
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-30-song@kernel.org>
References: <20260916184351.2720310-30-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972653657.1720534.12405604294931249455.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     1c34bfb98f84554288ad4e0b82e127671edb85ef
Gitweb:        https://git.kernel.org/tip/1c34bfb98f84554288ad4e0b82e127671ed=
b85ef
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:22 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:28 -07:00

objtool/klp: Add test for vmlinux relocs in a patched module

The kernel refuses a module-targeted klp relocation which names a vmlinux
symbol.  An EXPORT_SYMBOL_FOR_MODULES() symbol needs a klp relocation, so
patching a module function that references one only loads if klp diff files
that relocation under vmlinux rather than under the patched module.

This fails at load, not at build: klp-build produces a module and static
checks of it find nothing wrong.  Hence the assertion on which object the
relocation is filed against.

Reported by Dylan Hatch, whose mod-ns-lp branch carries the kernel-side
half of this case.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-30-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/tests/generic/test-module-vmlinux-reloc.sh | 40 +++++++-
 1 file changed, 40 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-module-vmlinux-reloc.sh

diff --git a/tools/objtool/tests/generic/test-module-vmlinux-reloc.sh b/tools=
/objtool/tests/generic/test-module-vmlinux-reloc.sh
new file mode 100755
index 0000000..635a75f
--- /dev/null
+++ b/tools/objtool/tests/generic/test-module-vmlinux-reloc.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Patching a module, where the patched code references a vmlinux symbol which
+# needs a klp relocation.
+#
+# The kernel does not allow a module-targeted klp relocation to reference a
+# vmlinux symbol, and a symbol exported with EXPORT_SYMBOL_FOR_MODULES gets a
+# klp relocation.  Put together, filing that relocation under the patched
+# module produces a patch the kernel refuses to apply to its target.
+#
+# So it goes under vmlinux instead, and is applied when the patch module loa=
ds
+# rather than when the patched module does.  That is the opposite of the rule
+# for a reference to a module's symbol, which test-module-object covers; this
+# is the other branch of the same decision.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+# The object being patched is a module ...
+build_module_pair cross_module.c klp_testmod
+
+# ... and the symbol it references belongs to vmlinux, exported in a way that
+# still requires a klp relocation.
+export_syms
+add_exports_ns vmlinux module:kvm other_mod_func
+run_diff
+
+# Filed against vmlinux, applied when the patch loads.
+assert_section __klp_relocs.vmlinux
+assert_klp_sym other_mod_func vmlinux
+
+# Not against the patched module: that is the relocation the kernel rejects.
+assert_no_section __klp_relocs.klp_testmod
+
+run_post_link
+assert_klp_rela vmlinux .text.target
+assert_no_section ".klp.rela.klp_testmod..text.target"
+
+pass "klp relocation to a vmlinux symbol filed under vmlinux, not the patche=
d module"
