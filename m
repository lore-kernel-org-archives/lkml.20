Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D9348F000;
	Mon, 21 Sep 2026 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982892; cv=none; b=QOzhtaYnYgbegbv+ihhKZSJRRa6nbp9RW5WbCVRFSj324w5+i0Q5m07IJs+5NRQ9kUivFTykNJtxL6JVY7mDBvRW6Q8B9S9zjzxq8gt4QiyWUSq3K9dkdlQMIunxGvB4vzHAdIybtTxIEb26YKRwFS2dYPdZt1JMMU8CBLwl3yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982892; c=relaxed/simple;
	bh=2o0SO54GXZ3pzs7GznbHPnlRF1FPtHB7gSbmxTZNA5Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=XZGdlHIqll3Wy/8bx4/k5p2JrX4rVc/wfp0dlhKbd/HHjNrNNA8QUJxTtCKFKnp/C7DrW1oV4PyDGW1iT/kuSq0CkNG7NcAia87Vv2vlFpM/yXvCtZuYkTDWjxLDnpOiV6EtJuid3IGqODNxl6OGrDzC0nV6DyAvR+ufsezf2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xF/7VgC/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dqy59yrW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xF/7VgC/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dqy59yrW"
Date: Mon, 21 Sep 2026 09:28:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982888;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUqFuYE//atPht8xQV0szXOTOk88PWEIYrsacjRfzEk=;
	b=xF/7VgC/BbhtAl9TNCTQOa0faJbZg+8BF77cA6faqcPBmI7OVmHKS9BvEeb1/+2hFHCBOH
	qUyQq/0CrnpagTIJQtsoP0MHkuu598kTJl4pLrCcevLPSn2lWlgNkYHB/33jDZs5mQeybM
	vzMy/aMagyIZpX8gSLp56lBkEHkFmvlbvfGuKIgx7zmJ3pJMQ9W2P+BslUvfedncay459R
	e/Fjd2SpHWxUlOtmlfSjWYyef0itKkEaSg45nGDSrHHDyJU9XiuHVGm3Ih8tbZ0BFU2yog
	1fhcIHimuOEd5Jk/NEArWwxZK26n+IaZC+uUmkkjMhr7up2jvrkU+yDY8o2phA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982888;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUqFuYE//atPht8xQV0szXOTOk88PWEIYrsacjRfzEk=;
	b=dqy59yrWgZRCHYIbWJwou1zU63AWGftiklrpKqLY+PZHP/YP1fOjBxO4L9CASLbpRqK8YQ
	oJsELdgfN0XeU/CA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for
 EXPORT_SYMBOL_FOR_MODULES references
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-33-song@kernel.org>
References: <20260916184351.2720310-33-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998288653.2819794.2749127499872098797.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     a87892ac05098d23e855e25c7afc128b1e9973fe
Gitweb:        https://git.kernel.org/tip/a87892ac05098d23e855e25c7afc128b1e9=
973fe
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:25 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for EXPORT_SYMBOL_FOR_MODULES references

A symbol exported with EXPORT_SYMBOL_FOR_MODULES() is reachable only by the
modules named in its namespace, and a livepatch module is never one of
them. So a reference to it cannot be an ordinary relocation resolved by the
module loader; it has to be a klp relocation applied at patch time.

Getting this wrong is silent.  The module links, loads, and reads the wrong
thing, or fails to load for a reason that does not name the cause.

This tests the behavior of commit 4cd3cfb8b54f ("objtool/klp: Fix
relocations for EXPORT_SYMBOL_FOR_MODULES() symbols").  Which object the
resulting relocation is filed under is a separate question, and one this
test cannot ask: the patched object here is vmlinux, so the vmlinux section
is the one produced either way.  That is covered by the module case, in
"objtool/klp: Add test for vmlinux relocs in a patched module".

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-33-song@kernel.org
---
 tools/objtool/tests/generic/test-export-symbol-for-modules.sh | 39 +++++++-
 1 file changed, 39 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-export-symbol-for-module=
s.sh

diff --git a/tools/objtool/tests/generic/test-export-symbol-for-modules.sh b/=
tools/objtool/tests/generic/test-export-symbol-for-modules.sh
new file mode 100755
index 0000000..7e7bdde
--- /dev/null
+++ b/tools/objtool/tests/generic/test-export-symbol-for-modules.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# EXPORT_SYMBOL_FOR_MODULES() puts a vmlinux symbol in a "module:<names>"
+# namespace, and the module loader grants access by matching the importing
+# module's name against that list.  A livepatch module is never on the list,=
 so
+# referencing such a symbol with a normal relocation fails modpost, and if t=
hat
+# is silenced, fails to load with "Unknown symbol".  It needs a klp relocati=
on,
+# the same as an unexported symbol.
+#
+# Ordinary namespaces are not affected: copy_import_ns() propagates the patc=
hed
+# object's import tags to the patch module, so a normal relocation works.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair cross_module.c
+
+sym=3Dother_mod_func
+
+# Plain vmlinux export: a normal relocation is what we want.
+export_syms "$sym"
+run_diff
+assert_no_klp_sym "$sym"
+
+# Ordinary namespace: still a normal relocation.
+export_syms
+add_exports_ns vmlinux MY_NS "$sym"
+run_diff
+assert_no_klp_sym "$sym"
+
+# module: namespace: has to become a klp relocation.
+export_syms
+add_exports_ns vmlinux module:kvm "$sym"
+run_diff
+assert_klp_sym "$sym" vmlinux
+assert_section __klp_relocs.vmlinux
+
+pass "EXPORT_SYMBOL_FOR_MODULES symbol referenced with a klp relocation"
