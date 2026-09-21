Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B28446D091;
	Mon, 21 Sep 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982896; cv=none; b=L+enXvssnGneuK5hI5Q3t2TWeHkJvaWSlLoByzxgBYcCLJcUzXjAE2YZEgWRbeBVaWl6u9vpK7X2gC0hN6WbvBxdLmxannNouOFVerpDduD/qTtQTa/q2Q4KFdhIGdXve8T8Dyi1v1kH/AFOQsQqjStE1GKDUuJ4zMNy45FNukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982896; c=relaxed/simple;
	bh=R2v7dfu2j0+BH4sUDFRpOTwt8pHnHahcqLDdXLNtPdU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=uXPp3jSeuh7G95NCIfL4JGjcxONQ10rDf9MNR4Mm0yXYHNly62r5y02feukP9iyAwFueaT16EfZvyLKvB5IW2oPn8HFN3bOtLx6ISntGRIPzGZerPZ624jXzZhK8a8kHCXicWHfkkwTS3n+ZZo1ejuovsxQhL3jxeze5rZuq9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xlf3r/lx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SbOtqaAR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xlf3r/lx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SbOtqaAR"
Date: Mon, 21 Sep 2026 09:28:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982892;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQrilU2B6lOS41uZFFNcDQx5Ay3lwoAOreqr1DiuMTw=;
	b=Xlf3r/lxQ0P5hpoGil8xEuHsDzsgE4uT5wWrlNyPgrgm9bdJgpmzhEoszhGfksSA6+GZ5T
	UOjMVDxZRUw2N76UKgg9lTW4sL9sTjArsd78QiGq7KKe6/hBCIca8y93ZumQtW+bWniNFC
	frDVVvit6kUgIMaKkv4SrauQGxJBZMc/FxEJ/1hIy2j2cDpbKXs3GnQTRIDk0oxnhzLFLF
	YpPNrATyGQ16FwrnwpEiKEaci0fmOoOPbb83e0uiuozJpLHINiWOV3fAvQtQk4sm8EIFtz
	pCPYunn49X48gAZHrHu0w2lGp31ojdoQS6TI2VOmXvfcIpv2U99sGNEeBylX5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982892;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQrilU2B6lOS41uZFFNcDQx5Ay3lwoAOreqr1DiuMTw=;
	b=SbOtqaARDMm5e5CAmJtV2HFA5XgH641656ruNyRJO5aRyKk4XkY7asPo7ueXEzFVxvFOCp
	5cKMOPQb5jfcMXDw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for vmlinux relocs in a
 patched module
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-30-song@kernel.org>
References: <20260916184351.2720310-30-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998289077.2819794.15064171930393824596.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     65b0aac4125c18280efbda38174ec14bcef887b2
Gitweb:        https://git.kernel.org/tip/65b0aac4125c18280efbda38174ec14bcef=
887b2
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:22 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:11:36 +02:00

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

Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-30-song@kernel.org
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
