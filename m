Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF86B4949FA;
	Mon, 21 Sep 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982910; cv=none; b=ddyCh5DxzgGwxPuUZ0x2/zUXhjvxP3GxDcwHKSZQdITrM69UP+uPMzKDSdU6QjzpbH4d3O2JbGubFJchSFdMWx1b0Tk3AfsYlSESCgaiJG0AMBrmqbW5D6LOR8y/677+uQkLR0FZb/oZqn6JXtNKgdNQIL1znu4kJ9JBQMzuNTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982910; c=relaxed/simple;
	bh=ubOqWL89Rqd6CZn82UDJg3UfIzpyRZq4FnrL4CwIpIo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jJ4oPDmaT4YK1fHTcMCTIP8CmBkpRRS6+d7VfOLkFEh10h1CPR0uFqtRl9IeeQ0/qaP1ju2h9PtFdvIjaKJELM9b4w+FaFvvHpuhx6bqhpOGkSHfbR5+jRZOrBg7NISg+ls5fmrfHB0NVJkTLpRVxz4TX5KdA1KiRhhwC6nZM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jlbxUVak; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zYNMehzp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jlbxUVak";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zYNMehzp"
Date: Mon, 21 Sep 2026 09:28:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982907;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Et4iSGWLARtLH+XE/FF5QpwODhCREINuz/xwYDQmU/0=;
	b=jlbxUVakIKeUBpbxCx/iONsEK7mG1xj51O5b7JKpZGm/r6w53bmOpi2sbJufvjNboHuavl
	f9RAFZu0A4kA4S0cdp28HoEgKaJtFSJR1Xp4jsvpzL9hUrrW6bRFXx6RwLudMFtFQxI3BS
	uAAb5LmA2ZUyrCYIpMK7XyCjVsfy6JiOedE2dA3jNRRV2bKXIb9HJx/3SxKVCNeBMO+aNc
	0qLXJhAyh48d6zfylaU3NJtqIJpuQCYyfTLZrH29WqIr2Ui5QUxBFZId4xFHNoMHaFhPCG
	Cl+8zksDwptv8XuSHOSsNW6HWRJcdxbI/SbH/oT4V2Roy8jMOjERmT5FohmBlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982907;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Et4iSGWLARtLH+XE/FF5QpwODhCREINuz/xwYDQmU/0=;
	b=zYNMehzpJoLKXVG7AhV0N67fB/70SHwRDhQ7ZWmU0WNCPfgRACabqco8CSK5POWqwlXJob
	tQVi4u7nKbwS4NAQ==
From: "tip-bot2 for Puranjay Mohan" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for jump table key relocations
Cc: Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-20-song@kernel.org>
References: <20260916184351.2720310-20-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998290577.2819794.15954081247203303370.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     729bf5310766614efed12b87e8b59a63d2657cb7
Gitweb:        https://git.kernel.org/tip/729bf5310766614efed12b87e8b59a63d26=
57cb7
Author:        Puranjay Mohan <puranjay@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:12 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:04:50 +02:00

objtool/klp: Add test for jump table key relocations

A cloned __jump_table entry must keep a relocation in its key slot.
objtool parses the table again after klp diff to convert the static
branch's scaffold instruction, and an empty slot leaves it unable to do so.
The scaffold then stays as emitted and the module trips BUG() in
__jump_label_patch() once the key's state differs from its compile-time
default.

Check both halves for a vmlinux-owned key: unexported gives a tombstone
plus a klp relocation, exported gives an ordinary relocation and no klp
machinery.

The fixture defines the key as an STT_OBJECT, which is what the kernel
emits. validate_special_section_klp_reloc() ignores anything else, so a
fixture using an undefined extern would skip the interesting paths.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Assisted-by: Claude:claude-opus-5
Link: https://patch.msgid.link/20260916184351.2720310-20-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/jump_label.c  | 76 +++++++++++++-
 tools/objtool/tests/generic/test-jump-label-key.sh | 44 ++++++++-
 2 files changed, 120 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/jump_label.c
 create mode 100755 tools/objtool/tests/generic/test-jump-label-key.sh

diff --git a/tools/objtool/tests/generic/fixtures/jump_label.c b/tools/objtoo=
l/tests/generic/fixtures/jump_label.c
new file mode 100644
index 0000000..ecd3c06
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/jump_label.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Static branch in a patched function.  The jump table entry is written out=
 by
+ * hand, mirroring JUMP_TABLE_ENTRY(), so the fixture builds without kernel
+ * headers.  The key is an STT_OBJECT; anything else is ignored by
+ * validate_special_section_klp_reloc().
+ *
+ * MODNAME selects whether the key is taken to belong to vmlinux or a module.
+ *
+ * NEW_KEY puts the whole static branch behind PATCHED, so the patch introdu=
ces
+ * one where the original had none -- a different question from patching code
+ * that already has a key, because the __jump_table entry itself is new.
+ *
+ * KEY_NAME renames the key.  Two names are special to
+ * validate_special_section_klp_reloc(): a __tracepoint_* key and the
+ * __UNIQUE_ID_ddebug_* one pr_debug() generates are both unsupported in a
+ * module, but are disabled with a warning rather than rejected, because the
+ * kernel is full of them and refusing outright would make ordinary functions
+ * unpatchable.
+ *
+ * STATIC_KEY makes the key file-local.  That changes the shape of the
+ * relocation rather than the meaning of the code: a reference to a static l=
ands
+ * on the section symbol plus an addend, so the key has to be resolved from =
the
+ * section before it can be recognised as a key at all.
+ */
+
+#ifndef MODNAME
+#define MODNAME "vmlinux"
+#endif
+
+#ifndef KEY_NAME
+#define KEY_NAME klp_test_key
+#endif
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3D" MODN=
AME;
+
+#ifdef STATIC_KEY
+static long KEY_NAME;
+#else
+long KEY_NAME;
+#endif
+
+int target(int x)
+{
+	int r =3D x;
+
+#if defined(NEW_KEY) && !defined(PATCHED)
+	/* The original has no static branch at all. */
+	return r + 1;
+#else
+	asm goto(
+		"1:	nop\n\t"
+		".pushsection	__jump_table, \"aw\"\n\t"
+		".balign	8\n\t"
+		"912:\n\t"
+		".pushsection	.discard.annotate_data, \"M\", @progbits, 8\n\t"
+		".long		912b - ., 1\n\t"
+		".popsection\n\t"
+		".long		1b - ., %l[l_yes] - .\n\t"
+		".quad		%c0 - .\n\t"
+		".popsection\n\t"
+		: : "i" (&KEY_NAME) : : l_yes);
+
+	r +=3D 1;
+	goto out;
+l_yes:
+	r +=3D 2;
+out:
+#endif
+#ifdef PATCHED
+	return r + 100;
+#else
+	return r;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-jump-label-key.sh b/tools/objto=
ol/tests/generic/test-jump-label-key.sh
new file mode 100755
index 0000000..142f94b
--- /dev/null
+++ b/tools/objtool/tests/generic/test-jump-label-key.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A cloned __jump_table entry must keep a relocation in its key slot, whether
+# the key needs a klp relocation or not.
+
+. "$(dirname "$0")/../lib.sh"
+
+key=3Dklp_test_key
+
+setup
+build_pair jump_label.c
+
+has_input_section orig.o __jump_table ||
+	probe_skip "fixture produced no __jump_table on this arch"
+
+key_slot_relocs()
+{
+	out_relocs | awk '/rela__jump_table/,/^$/' | grep -c "^0*8[[:space:]]"
+}
+
+# Unexported: klp relocation, key slot holds a tombstone.
+export_syms
+run_diff
+
+[ "$(key_slot_relocs)" =3D 1 ] ||
+	fail "unexported key: key slot has no relocation"
+out_relocs | awk '/rela__jump_table/,/^$/' | grep -q "\.klp\.tombstone\.$key=
" ||
+	fail "unexported key: expected a .klp.tombstone.$key relocation"
+out_symbols | grep -q "\.klp\.sym\..*\.$key," ||
+	fail "unexported key: no .klp.sym reference for the real relocation"
+
+# Exported: ordinary relocation, no klp machinery.
+export_syms "$key"
+run_diff
+
+[ "$(key_slot_relocs)" =3D 1 ] ||
+	fail "exported key: key slot has no relocation"
+out_relocs | awk '/rela__jump_table/,/^$/' | grep -q "[[:space:]]$key[[:spac=
e:]]*+" ||
+	fail "exported key: expected a direct relocation to $key"
+out_symbols | grep -q '\.klp\.tombstone\.' &&
+	fail "exported key: tombstone emitted for an exported symbol"
+
+pass "key slot populated for exported and unexported vmlinux keys"
