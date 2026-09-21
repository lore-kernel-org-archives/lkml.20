Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8685747F2C4;
	Mon, 21 Sep 2026 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982875; cv=none; b=f7kfk//iT+wrVrSHuQ7a3nicSJv/RQX2oO228njSBg4wbeNFv+wFtneQWzeVS+oJTfqfQ6yBW92ktvY5nXEye/mupeHtw00Hc5MdalrPy5xrvpi3SvY+aZQzeiS6wcKAGb3nMXOK+DJOALUcgJ5lN0KIgDp9fqR5AwUoVL/DB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982875; c=relaxed/simple;
	bh=+z9zbBmlpOjcKM9E4Opw1P8itUvO819d8hovKzu7ynA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=e4YErtXsrL20U8er1dKhyIUZeOLIuZGGi7j1/o2ueTnQypW1M7km9H20d2oj+oOWnRZtHJJQnxDActK89Ilyy1aKNkdUouxdA8yC1AfVugt+DSMojKDpN8iXsM0qUqqCi79Bea8nQTwBrCjqlMAXtbo4zjEs73oF0AQcr0pXiWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4VKwTquU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BOzqbihe; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4VKwTquU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BOzqbihe"
Date: Mon, 21 Sep 2026 09:27:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982872;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADm3qjewnbmb85krNSNtsOQyTMpYOrvpPdeHEV8PlVg=;
	b=4VKwTquUXGSIEcdxSiM3gbQBevrSVANjJ1+XpvRu/qfqZK8EEGcqwTumhI1CkFe5xCJQDU
	KpYXr9hSXzzG6yc7AaPWiGKOHRTF+m2RLejhTK88BGvcT6NJ3FfZ/qlo/hIvPyUmVwfISp
	zXmeljxckToPofYK1QUPLCAaC1xIapdyMHBWRS8SBrZXOYfQpd5h6+sy3TGjgHthunZUBw
	eTxxLqFoGaUJ2yCfqHmpZ7sUmTyPXpVYys0FOlztv7Z2JKjGOTmvejlXZ609isugbZ7vAL
	nTR4kQouHwloB6AqaUloT/GkbMtwm+Wm4dZR/WHKiHaQl0j79ONnBkn8wyNQTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982872;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADm3qjewnbmb85krNSNtsOQyTMpYOrvpPdeHEV8PlVg=;
	b=BOzqbihe1bD7SbrRxW/YiXukq5fhC0dMLiwzE8X5iNLm2tllzjecRganSAevb10alXD9d1
	3+e16C8h3B2uoGCw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Test rejection of a file-local
 static branch key
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-44-song@kernel.org>
References: <20260916184351.2720310-44-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998287034.2819794.3829559349885990493.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     58b0d66387b36fbf3df9e554ff4968f4df65ccbb
Gitweb:        https://git.kernel.org/tip/58b0d66387b36fbf3df9e554ff4968f4df6=
5ccbb
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:36 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:07 +02:00

objtool/klp: Test rejection of a file-local static branch key

A static branch key owned by a module cannot be reached with a klp reloc:
late module patching allows the livepatch module to load first, leaving the
__jump_table entry unresolved for jump_label_add_module() to dereference.
validate_special_section_klp_reloc() rejects it at build time.

test-jump-label-module-key covers that for a global key.  A file-local one
takes a different route to the same check: the compiler references a static
through its section symbol plus an addend, so the key has to be resolved
from the section before it can be recognised as STT_OBJECT at all.  Until
commit f9fb44b0ecef ("objtool/klp: Fix detection of corrupt static
branch/call entries") it was not, and the reference was silently emitted.

Give the fixture a STATIC_KEY knob and cover it.  The test checks that the
input really does reference the key through its section, since without that
it is only a second copy of the existing test.

Verified by reverting commit f9fb44b0ecef ("objtool/klp: Fix detection of
corrupt static branch/call entries"): klp diff accepts the input and the
test fails, under both gcc and clang.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-44-song@kernel.org
---
 tools/objtool/tests/generic/test-jump-label-module-static-key.sh | 45 ++++++=
+++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100755 tools/objtool/tests/generic/test-jump-label-module-static=
-key.sh

diff --git a/tools/objtool/tests/generic/test-jump-label-module-static-key.sh=
 b/tools/objtool/tests/generic/test-jump-label-module-static-key.sh
new file mode 100755
index 0000000..7bdcbaf
--- /dev/null
+++ b/tools/objtool/tests/generic/test-jump-label-module-static-key.sh
@@ -0,0 +1,45 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A static branch key owned by a module is rejected whether the key is global
+# or file-local.
+#
+# The rejection matters because late module patching allows the livepatch
+# module to load before the module it depends on: the __jump_table klp reloc=
 is
+# then unresolved, and jump_label_add_module() dereferences an uninitialized
+# pointer.  Catching it at build time is the only defence.
+#
+# test-jump-label-module-key covers the global key.  A file-local one reaches
+# the same check by a different route: the compiler emits the reference agai=
nst
+# the section symbol plus an addend, so validate_special_section_klp_reloc()
+# has to resolve it to the underlying object before it can see a key at all.
+# Until it did, a static key was passed over as "not STT_OBJECT" and the
+# unsupported reference was emitted with nothing said.
+#
+# Fixed by f9fb44b0ecef ("objtool/klp: Fix detection of corrupt static
+# branch/call entries").
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair jump_label.c -DSTATIC_KEY -DMODNAME=3D'"klp_testmod"'
+
+require_input_section __jump_table
+
+# The premise: the key is reached through its section symbol, not by name.
+# Without that this is just a second copy of test-jump-label-module-key.
+input_jump_relocs=3D"$(in_relocs orig.o | awk '/rela__jump_table/,/^$/')"
+
+echo "$input_jump_relocs" | grep -q klp_test_key ||
+	fail "fixture produced no __jump_table reference to the key"
+echo "$input_jump_relocs" | grep -qE '\.(bss|data)\.klp_test_key' ||
+	probe_skip "compiler referenced the static key by name, not through its sec=
tion"
+
+run_diff 255
+
+diff_log | grep -q 'unsupported static branch key klp_test_key' ||
+	fail "expected rejection, got: $(diff_log | tail -1)"
+[ -e "$workdir/out.o" ] &&
+	fail "output object produced for a rejected input"
+
+pass "module-owned file-local static branch key rejected"
