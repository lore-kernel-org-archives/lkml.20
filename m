Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD0471CEE;
	Mon, 21 Sep 2026 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982886; cv=none; b=WUhoeh7tlgDabhUO6evN5xDaM4raL30Z+fGDX4cleykPp0PPaveakQkXW0oZH42MblcxfS8OZDRJVDFp/V3v+07Y976bs0N/Vr+/eULRSC+5xcZ0/3fkvr3+1B+PPB3OU0H07/UQ1e1sO3yke8FELnMEeS6HzNn/v7j0lGuxkK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982886; c=relaxed/simple;
	bh=O+V8k1u9rUEucxpamd+n1seaQ/48/Mv34Qw6auDrQ6g=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Zjd2G4BgSTW5r/sF/9BrVnHAs0Anll6Aw8zWBoyMdGnnMnbjVeu89DsyquegQT3E9H/Iqop8WChGnUJwR5/oJbCQRuZVOuQB5lZ2tc2HNqLpc/AuesQmQcQ/3Adu9W//Fp3AQVCdQBjOjy7+S1fYrmNPyfPZU3+xOZ8/2yGf4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kiHLxr8b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r3qp6XPl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kiHLxr8b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r3qp6XPl"
Date: Mon, 21 Sep 2026 09:28:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982882;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tExvIqanzfXyVPmuUVMvg1PyW2Xrxz5wSYM6nQ7MN+M=;
	b=kiHLxr8bnAOIqiBXTkTFdjG0sAy2seiFNrL7w2s/FImMzGBMJiTUPtXEgWYOFbbz+BNpjk
	zbSsIW9r+/0ekSt4BZV2L5opNVfp+hfQj3w2xkLWbx18ufZ+acZuvc7GCGixJlk0lQYXPs
	YyvlFcT1FNi+X7JVReQL40r/+ZEwGkgPluPqid0YiwnezZZ7kQIIZhXf++pPjTNWmKbTpt
	U7BUSscMRXqWcno6616a7EG16czQnbCdSD0YZ5RAeuWxRTanrSV+CL+F3xfkZISsJRikK0
	JavTLvfcC5nbP0h15D87KufHa6GoImEJtXFa26JKIkkJFiKr1rIgrgeWaLDaFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982882;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tExvIqanzfXyVPmuUVMvg1PyW2Xrxz5wSYM6nQ7MN+M=;
	b=r3qp6XPlKo/1+14UuTNzE1zhRYFnjio/UT4ZVPKm9P226ayAUzoTfd2/kPuzfSe7eNWmf7
	kqD4tz1RjEY5mkAw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: objtool/core] objtool/klp: Add test for position-independent checksums
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-37-song@kernel.org>
References: <20260916184351.2720310-37-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998288049.2819794.11060283714022505557.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     f55eae8f37ea5ff547a8ac4ddafcef21047d5874
Gitweb:        https://git.kernel.org/tip/f55eae8f37ea5ff547a8ac4ddafcef21047=
d5874
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:29 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:06 +02:00

objtool/klp: Add test for position-independent checksums

A function that only moves has not changed, and its checksum must not move
with it.  Otherwise every patch reports as changed everything that shifted
because something ahead of it grew.

The fixture is built with -fno-function-sections, overriding the harness
default: with per-function sections every function sits at offset 0 of its
own section and nothing ever moves, so the test would prove nothing.  It
also calls across to another function rather than looping within itself --
a loop branch keeps the same displacement wherever the function goes, so it
is not position-dependent to begin with.

This tests the behavior of commit cca84cb12908 ("objtool/klp: Fix
position-dependent checksums for non-relocated jumps/calls").

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-37-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/checksum_position.c | 42 ++++++-
 tools/objtool/tests/generic/test-checksum-position.sh    | 51 +++++++-
 2 files changed, 93 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/checksum_position.c
 create mode 100755 tools/objtool/tests/generic/test-checksum-position.sh

diff --git a/tools/objtool/tests/generic/fixtures/checksum_position.c b/tools=
/objtool/tests/generic/fixtures/checksum_position.c
new file mode 100644
index 0000000..4320bc2
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/checksum_position.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A function whose position in the section changes between the two builds,
+ * without the function itself changing.
+ *
+ * target() calls callee() twice, and a call within the same section needs no
+ * relocation: the displacement is in the instruction.  It is that displacem=
ent
+ * which moves, and hashing those bytes makes the checksum move with it.  Bo=
th
+ * must therefore share a section, which is why the test passes
+ * -fno-function-sections.
+ *
+ * What has to change is the distance between the two, and PATCHED changes it
+ * by aligning them rather than by inserting a function between them.  Where=
 a
+ * compiler puts an added function is its own business: gcc emits these in
+ * source order, so a function written between callee() and target() separat=
es
+ * them, but clang emits target() immediately before callee() whatever the
+ * source says, and an added function lands ahead of both.  That moves targe=
t()
+ * without moving it relative to callee(), the displacement comes out identi=
cal
+ * in both builds, and the test passes without having asked anything.
+ *
+ * Alignment moves the functions apart on both, and moves neither function's
+ * own instructions -- which is exactly the distinction under test.
+ */
+
+#ifdef PATCHED
+#define MOVED	__attribute__((aligned(64)))
+#else
+#define MOVED
+#endif
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+__attribute__((noinline)) MOVED static int callee(int x)
+{
+	return x * 5 + 1;
+}
+
+__attribute__((noinline)) MOVED int target(int x)
+{
+	return callee(x) + callee(x + 1);
+}
diff --git a/tools/objtool/tests/generic/test-checksum-position.sh b/tools/ob=
jtool/tests/generic/test-checksum-position.sh
new file mode 100755
index 0000000..5ae759e
--- /dev/null
+++ b/tools/objtool/tests/generic/test-checksum-position.sh
@@ -0,0 +1,51 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# A function's checksum must not depend on where the function sits.
+#
+# A jump or call without a relocation encodes its target as an offset from t=
he
+# instruction.  Hashing those bytes makes the checksum change whenever anyth=
ing
+# ahead of the function changes size -- so an unrelated edit elsewhere in the
+# file reports this function as changed too, and the patch grows to include =
it
+# and everything it references.  Nothing fails; the livepatch is just larger=
 and
+# riskier than the patch it came from.
+#
+# Here the "patch" moves target() away from callee() and changes nothing els=
e:
+# both are aligned to 64 in the patched build, which shifts them apart witho=
ut
+# touching a byte of either.  See the fixture for why it is done that way.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+
+# -fno-function-sections, or each function is at offset 0 of its own section
+# and target() never moves.
+build_pair checksum_position.c -fno-function-sections
+
+assert_input_symbol target
+
+# The fixture is only meaningful if the displacement target's calls encode
+# actually changed, and that is the distance to callee() -- not target's own
+# offset.  A compiler which shifted the two by the same amount would move
+# target and leave the distance alone, and then the bytes are identical and
+# the checksum matches for the uninteresting reason.  Ask about the distance.
+sym_off()   # $1 object, $2 symbol
+{
+	in_symbols "$1" | awk -v n=3D"$2" '$NF =3D=3D n { print $2; exit }'
+}
+
+orig_t=3D"$(sym_off orig.o target)";    orig_c=3D"$(sym_off orig.o callee)"
+new_t=3D"$(sym_off patched.o target)";  new_c=3D"$(sym_off patched.o callee)"
+
+[ -n "$orig_t" ] && [ -n "$orig_c" ] && [ -n "$new_t" ] && [ -n "$new_c" ] ||
+	fail "target or callee missing from one of the objects"
+
+orig_gap=3D$(( 16#$orig_t - 16#$orig_c ))
+new_gap=3D$((  16#$new_t  - 16#$new_c ))
+[ "$orig_gap" !=3D "$new_gap" ] ||
+	probe_skip "this compiler kept target() and callee() the same distance" \
+		   "apart; the call displacement did not change"
+
+assert_checksum_matches target
+
+pass "checksum unchanged when the function only moves"
