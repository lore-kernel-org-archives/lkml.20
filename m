Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FC48F823;
	Mon, 21 Sep 2026 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982895; cv=none; b=nRp+Tf/BRptDA2y3BsfawtJCII7u69t4goR96vzamMm60plth7qBGeUESjuGLRE2gZU9LrsGlC/WD8CH9uz9aZ04/xdYdb7eESYGQquU1BGk3gWhaPStn1tdb67QmM0h6FtD71+99iwTqWvjWzc2sUlZk9VpNBxjYt6g9wbAUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982895; c=relaxed/simple;
	bh=zErUc3ycfR5y5AiZ+RUYdeB9W7d8nXeC4UEgiMP9ang=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=SuttCd1dBuaxpOslDp2PnUHyVxnPp5FOAsVFHG36FAVLNHA+aIbthw/8F4kW782z58A5wyrS7ggeYEkKc3IIhInsbQfwyjgZ25rRuncSfy30lVJ4wBWATw50o/klz+8u/SbX+QBaCJ5nD0/G8/NhAfrFv/r4I8mJINArmS0aNak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dFUFGGr1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AhRdCNmT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dFUFGGr1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AhRdCNmT"
Date: Mon, 21 Sep 2026 09:28:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982890;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMUMfVqe6+dj9gQFMPcnBriYiSWeuszViW2soYkvhBs=;
	b=dFUFGGr1F74PI8OTRhu8zdTjXbog/wzarOfl4z/LJGjDrtMgZpn9c/dQZlSqEZMsSyBLiM
	j9UI5qFmst67LwaE+qIe3Uf0UeuAcKjoD7EtRvvXXAojZlwJmnVh8FsNb+aHebRnH+ct+0
	mAkqN5eVT38OtBDWxTNotrnuYFYFN9HWbJlf9oZXGKvddKk150QjJU/7r9ic/iKfCgFk/U
	qJ4OP2jsSdDIn9OD4bDuhFwObV2Hzk+f/1X1J7vQ3kSdRmW8cJtxTVuhasjiO3WaL4qh/I
	4ZKJ4hg4EyP/X2YSfSY5gysNM8glyqet5qWniAssFf3nDSi+Wn26tw5WTRe+LA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982890;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMUMfVqe6+dj9gQFMPcnBriYiSWeuszViW2soYkvhBs=;
	b=AhRdCNmTHYFoyMbup69x8vRLHQ+VT1qo78hnCZx1PD9OtmlI4KZ4Pa1V3HYIZCdkLEgunX
	k+OrVHDvOMDI3mAQ==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for Module.symvers path
 normalization
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-31-song@kernel.org>
References: <20260916184351.2720310-31-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998288939.2819794.12297739293208692858.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     90949e312de909e2f2a4f72ff3221f79e891d19f
Gitweb:        https://git.kernel.org/tip/90949e312de909e2f2a4f72ff3221f79e89=
1d19f
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:23 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for Module.symvers path normalization

Module.symvers names an export's owner by build path, and the kernel knows
modules by their runtime name.  Without normalizing one to the other, an
export owned by a module is not recognised as owned by anything, and a
reference that should become a klp relocation stays an ordinary one.

This tests the behavior of commit 8668bf91e050 ("objtool/klp: Normalize
Module.symvers paths to module names").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-31-song@kernel.org
---
 tools/objtool/tests/generic/test-modname-normalize.sh | 26 ++++++++++-
 1 file changed, 26 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-modname-normalize.sh

diff --git a/tools/objtool/tests/generic/test-modname-normalize.sh b/tools/ob=
jtool/tests/generic/test-modname-normalize.sh
new file mode 100755
index 0000000..a8059bd
--- /dev/null
+++ b/tools/objtool/tests/generic/test-modname-normalize.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Module.symvers records the build-tree path of the object that exports a
+# symbol, not the name the module has at runtime: "arch/x86/kvm/kvm-intel",
+# where the kernel knows the module as "kvm_intel".
+#
+# The klp symbol name embeds the owning object, and livepatch matches it
+# against loaded modules by name.  Left unnormalized it names a module that
+# does not exist, and the relocation is never resolved -- at load time, with=
 no
+# build-time complaint.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_module_pair cross_module.c klp_testmod
+
+# A path with directory components, a dash, and no extension.
+export_syms
+add_exports "arch/x86/kvm/kvm-intel" other_mod_func
+run_diff
+
+# Directories stripped, dash to underscore.
+assert_klp_sym other_mod_func kvm_intel
+
+pass "Module.symvers paths normalized to runtime module names"
