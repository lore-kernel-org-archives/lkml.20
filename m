Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C99B4E36C4;
	Fri, 18 Sep 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726540; cv=none; b=DinxnLNBYExR82KrGjr5co74+6Rn/24mrnvAtcXULp/DLCJwLqw5TvcOOAnrBEvw6XQX+9Zt36TboMLeYzBfnWeFsRB3exZ4LRPSSv7hbFYFZJSVHiaVSONhAgRtNLaBeYppqqhqiG4QdN/guE7/C5B+HoCtjtXC/tCsQfoKDs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726540; c=relaxed/simple;
	bh=LuMP2C6aAr8Ycx+SRyw4+Z7m/mnEBLhz4xCXy2Asv/I=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iyA9+aYC3yKU+WNxypwJECyipTWMSGmLbDTbnty7WzAOErp+EOTLfhHm8xycKptwViXwZMW+PokGpmiSTPNxXMC4I1lDjzR42muVor3Hx7+r3fg3oi7e30LI21I+Nx4DCam1oug/XnmV5Lct5DlcJxy+9/bmcbwUOTfbGv/dGEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=thR0otaW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VDC1BHCb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="thR0otaW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VDC1BHCb"
Date: Fri, 18 Sep 2026 10:15:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726533;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsDnpeR6wD4P3ZM98ZGjgjI5a0g2GNRJWGW1Fjs6NA0=;
	b=thR0otaWTYLiL1ewgd1RnBha/3JsODtLQjTK91ZeskveSS52ySb55gqLKG9h0g9/lMV/r9
	frVzSATBBKna5XZ58cnm4bw4cWAMOjdZyxWHJ3tH1enO951ti6YJu1W83Jtd+XzFFOOk2k
	2fi7+Hi92bzTlgryB3ce92L8lOctWkxJTbb1cIpiux6nBVwCFDR15h7VGO8LcYIcrSgjBp
	EYa/Grr8ONnOTd3Y/WmPt7ztGEa7VangFbBu8nVQl/CMiShgAbGlAGOhVw7I39kQQepXjR
	wGqdRB8ksjDoPUGK8/2mkHyFa/WrKvTp0jlMkiB5tixGbjj4+StEx4kgMQmGoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726533;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsDnpeR6wD4P3ZM98ZGjgjI5a0g2GNRJWGW1Fjs6NA0=;
	b=VDC1BHCb3c3dwuXSWoCjkuxTdzs8+iQSlrSGpdwh0Utr+0M5HbxRpZiLkRlmZhdZsF24Me
	WCQGamzgcvoLi5Bw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for
 EXPORT_SYMBOL_FOR_MODULES references
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-33-song@kernel.org>
References: <20260916184351.2720310-33-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972653183.1720534.16329567459008373247.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     2ba2608572ad03357b215665b8d3c9497e124b1d
Gitweb:        https://git.kernel.org/tip/2ba2608572ad03357b215665b8d3c9497e1=
24b1d
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:25 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:13:29 -07:00

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
Link: https://patch.msgid.link/20260916184351.2720310-33-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
