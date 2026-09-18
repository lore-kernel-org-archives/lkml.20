Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF9A382F1F;
	Fri, 18 Sep 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726499; cv=none; b=unzt11G/4EeZbg5e981XanSR5ZfisZwWAI6TPK1cybH7IbqBb9UcOrVIiFJ8OBqwTrBhOoznd3mlrDpHVGdwp72UoUtb9WWLQtBtycn/W4X5XdRq4GbTez3lzZvKIX90X7Z7s6EBz4xXEc1Mg+WuVpsxmMwhM3xwNEuPz/9xfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726499; c=relaxed/simple;
	bh=LId6u/F/PUqTMc35M7moZQbKP/J6zvIMG1vD2TkA02Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rooCm8RLouyPR5mH46uwIacTjuPox100helx1iP062SLPRHayEk63XgCv6+7c4LwyrHvwsaoud5Gg5ePakZeURGDiEmpVANRRap4AMSQGA/37HuDydZbpKso2G+bIDWBYt4AeEir2S84Rj9FezlwZntXZXHjtIxM9pQlsIJ2Yl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aPxrgfwA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kb1IZhos; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aPxrgfwA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kb1IZhos"
Date: Fri, 18 Sep 2026 10:14:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789726494;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jhfe4XjFETZvJovCd94AA4v/uEElLKQQ61HRNA+TCQ=;
	b=aPxrgfwA+dCN+//YBJ9S2CMbNyx/y6FyeSwcI48ItURQ6w8KrfBtWsHLJd4YeGSol2hhM8
	Xx86JulOAEQv3UuBxq39Xxl+ANCwpCf+Snqk4WXOYvDcOD+nmMR77bsZ/2wSYWCNL+2Qur
	SgD7OejN8bK+Q4YcdyfxTlMJAN9nDoNnHVpT4cpje+H0YuiB6bN7q966uICUYB9e4vCrwl
	mJeNQgKd2s/R0+KRttV9WJGG9rtZFMrOLvLzec3hEoJX5+n9dn7zAiEfWHu1Cjrurvxjwb
	xLleKALUJVvuN4phsnItxhc+Y70y8deL1xRs8ANhy3CxGNPSZBUaC67ASY9qJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789726494;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jhfe4XjFETZvJovCd94AA4v/uEElLKQQ61HRNA+TCQ=;
	b=kb1IZhosEgJFEHzO5lNw2zduy8Qgu0HuGdkYVeopL0hBj0Fo2253HBZ+f7DVa6Tk5L4eDC
	bAb1Bi9ISNVMpLCA==
From: "tip-bot2 for Song Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool/klp: Add test for UBSAN metadata in an
 unchanged function
Cc: Song Liu <song@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916184351.2720310-57-song@kernel.org>
References: <20260916184351.2720310-57-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972649252.1720534.12858000319581110169.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     3577ff3e09b738c9f92620b3254e859182794643
Gitweb:        https://git.kernel.org/tip/3577ff3e09b738c9f92620b3254e8591827=
94643
Author:        Song Liu <song@kernel.org>
AuthorDate:    Wed, 16 Sep 2026 11:43:49 -07:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Wed, 16 Sep 2026 17:21:47 -07:00

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
Link: https://patch.msgid.link/20260916184351.2720310-57-song@kernel.org
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
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
