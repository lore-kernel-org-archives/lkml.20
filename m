Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E543793D2;
	Mon, 21 Sep 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982855; cv=none; b=lt5ROxzrrAEIykcByYYf1uQ47VDbbDv2h+l/Qf+Y6jzOimN3+wsGSDSE6tn3NHydeU5cu8xQW2mAAGg7Chu35FIZh4UdSzC7abMwikhuO4oWlU1YSU24s2NVZ8wrZBSJ1VDOYnOBgG6iGBfyz6yUYRtQgq6/t63PyCD5ct9GfQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982855; c=relaxed/simple;
	bh=xDt2Gb+PDc5bUcrxVtZ4RhaF/3Efo6EybZfQo+jOhyw=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tL+CHNkgYU6NFTHO4K5JGaxSbakABQUavoMtC98ZfpEFH+yd9nAKEb44rGnM2ym8ZQKPo6t7uFjcAb4QDe/caMz14GAQhOrvoaRFKUOp3yJ0qwyK7xLk8XM33tDwhxV3n3469Ta8sX8U2S6HIeIbNyHVyX3XhW6yumENqM/XZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tqCsOOdX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1LrxC3l6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tqCsOOdX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1LrxC3l6"
Date: Mon, 21 Sep 2026 09:27:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789982851;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8IAMK8Mo13MMpfWAm1+uNFkz1Cd31//nbQt1dEax4w=;
	b=tqCsOOdX4aJD+xxQtyohfox7VytIROR4t5HvzrKKWyRdS+qB+2ZLMNsJzKzCBPyrYDpqT2
	QThYSjt8KMGnk76RCWUFXar2ylATa6yW7+CqD8wStoJCQNmmiNYbPxWoiLrf3rf68h9gSb
	1ImY8X3mrFhdUO/vHTV0/Pq+ThCL+sKkpSdA4LOGitDDg4AIUPcftz0vZr9iH3NJIZm4B0
	XbUF605JsccDd9FEnSDLzM+D0fDvExP+6GYY88GCrrEqokjSZQUT/KaNhlT6ixHZGX8xn6
	6BD35z10RCbxkArmJsmiZ0HNGzboZ2mcOaKR4OZozzLh/Ciw7EzJN/Hu+03+6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789982851;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8IAMK8Mo13MMpfWAm1+uNFkz1Cd31//nbQt1dEax4w=;
	b=1LrxC3l6RC3JAZUQdcNkdV9CeQaFARGwy1NjgYEHX7zH4VAF32+0BsIDKE40JuUJ2fO9pS
	mATnjMvgAc7Az3Dw==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for UBSAN metadata in an
 unchanged function
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-57-song@kernel.org>
References: <20260916184351.2720310-57-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178998285008.2819794.13039186455582170932.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     41ca5150dd816f856c545775525013513e9a31fa
Gitweb:        https://git.kernel.org/tip/41ca5150dd816f856c545775525013513e9=
a31fa
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:49 -07:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 21 Sep 2026 11:12:08 +02:00

objtool/klp: Add test for UBSAN metadata in an unchanged function

Every instrumented operation gets a per-callsite metadata object in an
anonymous data section -- .data..Lubsan_data and .data..Lubsan_type from
GCC, .data..L__unnamed_ from Clang -- whose names are compiler-generated
and mean nothing across a rebuild.  is_uncorrelated_section() exists so klp
diff does not try to pair them up, and nothing tested it.

The failure it prevents is a false positive, which is the direction this
suite has least coverage of.  Metadata belonging to a function nobody
touched compares as different and drags that function into the patch.  That
is not a build failure: it is a larger livepatch than intended, pulling in
dependencies with it, and every extra function is one more that can fail to
correlate or to apply.

The fixture is built with -fsanitize=3Dshift, which both compilers
instrument; neither emits a bounds check for an index it can prove in
range.  One function changes, the other is byte-identical and carries
instrumentation of its own, and the test asserts the second is left alone.

Verified by removing each rule from is_uncorrelated_section() in turn,
which splits neatly by toolchain: dropping the .data..Lubsan rule fails the
test under gcc, dropping .data..L__unnamed_ fails it under clang.  One
test, two code paths, each checked by the compiler that reaches it.

Assisted-by: Claude:claude-opus-4
Based-on-test-by: Joe Lawrence <joe.lawrence@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260916184351.2720310-57-song@kernel.org
---
 tools/objtool/tests/generic/fixtures/ubsan_noise.c | 49 +++++++++++++-
 tools/objtool/tests/generic/test-ubsan-noise.sh    | 48 +++++++++++++-
 2 files changed, 97 insertions(+)
 create mode 100644 tools/objtool/tests/generic/fixtures/ubsan_noise.c
 create mode 100755 tools/objtool/tests/generic/test-ubsan-noise.sh

diff --git a/tools/objtool/tests/generic/fixtures/ubsan_noise.c b/tools/objto=
ol/tests/generic/fixtures/ubsan_noise.c
new file mode 100644
index 0000000..bf59992
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/ubsan_noise.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A translation unit built with UBSAN, where only one of two functions is
+ * patched.
+ *
+ * Every instrumented operation gets a per-callsite metadata object in an
+ * anonymous data section -- .data..Lubsan_data and .data..Lubsan_type from
+ * GCC, .data..L__unnamed_ from Clang -- and a call to a __ubsan_handle_*
+ * routine.  The names are compiler-generated and carry no meaning across a
+ * rebuild, so klp diff has to treat those sections as uncorrelated rather t=
han
+ * pairing them up by name.
+ *
+ * untouched() is byte-identical in both builds and exists to catch the false
+ * positive: if the metadata were correlated by name, its shifts would look
+ * changed and it would be dragged into the patch.
+ *
+ * The shifts are what draw the instrumentation.  A bounds check would do as
+ * well but neither compiler emits one for an index it can prove in range.
+ */
+
+static const char __modinfo[]
+	__attribute__((section(".modinfo"), used, aligned(1))) =3D "\0name=3Dvmlinu=
x";
+
+int shift_by(int v, int n);
+
+int untouched(int v, int n)
+{
+	int s =3D 0;
+
+	s +=3D v << (n & 31);
+	s +=3D v << ((n + 1) & 31);
+	s +=3D shift_by(v, n);
+
+	return s;
+}
+
+int touched(int v, int n)
+{
+	int s =3D 0;
+
+	s +=3D v << (n & 31);
+#ifdef PATCHED
+	s +=3D v << ((n + 3) & 31);
+#else
+	s +=3D v << ((n + 2) & 31);
+#endif
+
+	return s;
+}
diff --git a/tools/objtool/tests/generic/test-ubsan-noise.sh b/tools/objtool/=
tests/generic/test-ubsan-noise.sh
new file mode 100755
index 0000000..b415eb1
--- /dev/null
+++ b/tools/objtool/tests/generic/test-ubsan-noise.sh
@@ -0,0 +1,48 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# UBSAN instrumentation in an unchanged function must not make it look chang=
ed.
+#
+# Every instrumented operation gets a per-callsite metadata object in an
+# anonymous data section -- .data..Lubsan_data and .data..Lubsan_type from G=
CC,
+# .data..L__unnamed_ from Clang -- whose names are compiler-generated and me=
an
+# nothing across a rebuild.  is_uncorrelated_section() exists so klp diff do=
es
+# not try to pair them up.
+#
+# Without that, the metadata belonging to a function nobody touched compares=
 as
+# different and drags the function into the patch.  A livepatch which replac=
es
+# functions the patch never changed is not a build failure: it is a larger
+# patch than intended, taking its dependencies with it, and every extra
+# function is one more that can fail to correlate or to apply.
+#
+# Covers the same ground as corpus/x86_64-ubsan/{ubsan-shift-noise,
+# ubsan-metadata-data-section,gcc-ubsan-anonymous-data,ubsan-handler-cloning}
+# and corpus/x86_64-llvm-ubsan/{clang-ubsan-bounds-noise,
+# clang-ubsan-handler-cloning} in Joe Lawrence's klp-build unit test corpus.
+
+. "$(dirname "$0")/../lib.sh"
+
+setup
+build_pair ubsan_noise.c -fsanitize=3Dshift
+
+# The premise: this compiler really did instrument, and left its metadata in=
 an
+# anonymous section.  Without that the test is just test-basic again.
+ubsan_sec=3D"$(in_sections orig.o |
+	grep -oE '\.data\.\.L(ubsan_data|__unnamed_)[A-Za-z0-9_.]*' | head -1)"
+[ -n "$ubsan_sec" ] ||
+	probe_skip "compiler emitted no anonymous UBSAN data section"
+assert_input_symbol untouched
+
+run_diff
+
+# The changed function is patched, and the untouched one is left alone despi=
te
+# carrying instrumentation of its own.
+assert_patched touched
+assert_not_patched untouched
+
+# The handler the patched code calls has to come with it, or the clone calls
+# nothing when its check fires.
+out_symbols | grep -q '__ubsan_handle_' ||
+	fail "no __ubsan_handle_* reference in the patched output"
+
+pass "UBSAN metadata in an unchanged function does not drag it into the patc=
h"
