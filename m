Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1834433BC5;
	Wed, 23 Sep 2026 05:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142757; cv=none; b=CN9t776qljr1h+l7RrxwUyZ4LMDA74PpEs8MRBwdkeu2isvof2CVv4qPoKvZwEK8GFX+2jBEeY7J1Cblombgowug/gPtKyqU0ymJR9D4SawMde8tqMqvhu3LpxLaEblsYB01OZ7EUT0Oue59FqZHoas3+yEkGFJkOr4+AzI5YnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142757; c=relaxed/simple;
	bh=mKPek02uc8E+v9IQ3BgfmvB5vYPf5C8XOxvUz257zAM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=KgrCa4IODeI377xysvXuNRgEWIfs86xzvc6RbviruoKWC2zDyFVOCZpX3TTucYNryXjQ45I5rTpnuc8RCsI3BItKq6fJ6owWMSQW+EQmwKUHYgxMJrRYgPa5++4db+xT333cS2ZLL/7ZVSJSQ63gmUg/6FKXGM0K5r72Odv4e+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=caYGzu/k; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xkf09FHh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="caYGzu/k";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xkf09FHh"
Date: Wed, 23 Sep 2026 05:52:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790142754;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aALVvuKMcokFFleCbvO/HaPXrRH+7ZAFphWG0YLdZLQ=;
	b=caYGzu/k7bGTgLCgl+dTxajhWm0lDx40hv0aqGqC4Ed9wCzpCWkZSc1ExP+UygbK82QeP5
	Dc2X/1HAix5f8BCguH7k4JLHVdh0eo6wqAZgM09kuw05GCUDpJsCnIVftS3Zr8XH2c+kp5
	Wm6lTepIuTY+BUBEaB/5nMXXjQEBaVrBycsQFgrl6LxQDPAkCQ3i10qw9Q3NIpUtXX5TuJ
	NISecwqM2XeYK0akpIcXFZTjJaW0hmLnUwSxc5UnuYkvK/wyYCMdLuicEsxBwBoGB1QKCW
	4s7uxvmwplph57w0FviraMdhQbeEjTzBzltQqzpS12AA+sZ5HXNhkbr63OXHZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790142754;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aALVvuKMcokFFleCbvO/HaPXrRH+7ZAFphWG0YLdZLQ=;
	b=Xkf09FHhMfh8vWp9X6uZjv3+ccaZKq4VxHfBD9Dle116I/T6AmXK8aQAJjpjdGjvr2Tbtb
	W6S0D2iVPrnHlkBw==
From: "tip-bot2 for Mauricio Faria de Oliveira" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/asm, x86/boot: Carve out inline memcmp() into a
 separate header
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-pvh-kasan-inline-v10-2-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-2-08da47943d8e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179014275254.2819794.15513525053279481234.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     5b6fe00406ce967c556d544a7fc80233341c67c8
Gitweb:        https://git.kernel.org/tip/5b6fe00406ce967c556d544a7fc80233341=
c67c8
Author:        Mauricio Faria de Oliveira <mfo@igalia.com>
AuthorDate:    Mon, 21 Sep 2026 22:36:33 -03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 22 Sep 2026 18:41:56 -07:00

x86/asm, x86/boot: Carve out inline memcmp() into a separate header

Move the inline memcmp() function currently only available in boot/string.c
into the shared string function header <asm/shared/string.h> to be reused.

This is not done through <asm/string.h> to avoid pulling unnecessary code
in boot/string.c that causes build errors in boot/compressed/string.c
and purgatory/purgatory.ro.

No functional changes.

  [ bp: Massage commit message. ]

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://patch.msgid.link/20260921-pvh-kasan-inline-v10-2-08da47943d8e@i=
galia.com
---
 arch/x86/boot/string.c               | 17 +--------------
 arch/x86/include/asm/shared/string.h | 31 +++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 15 deletions(-)
 create mode 100644 arch/x86/include/asm/shared/string.h

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index e10260e..be454a6 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/shared/string.h>
 #include "ctype.h"
 #include "string.h"
=20
@@ -31,21 +32,7 @@
=20
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-
-	/*
-	 * Make sure ZF is properly set in the len=3D=3D0 case because in it,
-	 * RCX=3D=3D0 and the REPE; CMPSB won't get executed.
-	 *
-	 * The "cc" clobber has no meaning anymore, just source compatibility.
-	 * On x86 the flag status bits are automatically added to the clobber
-	 * set when there are no =3D@ccXY constraints. Keep it as documentation.
-	 */
-	asm volatile("test %3, %3\n\t"
-		     "repe cmpsb"
-		     : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : /* "cc", */ "memory");
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
=20
 /*
diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shar=
ed/string.h
new file mode 100644
index 0000000..6291653
--- /dev/null
+++ b/arch/x86/include/asm/shared/string.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_SHARED_STRING_H
+#define _ASM_X86_SHARED_STRING_H
+
+/*
+ * Returns:	0 (equal)
+ * 		1 (not equal)
+ *
+ * In contrast, the regular memcmp() follows glibc return value semantics.
+ */
+static __always_inline int __inline_memcmp(const void *s1, const void *s2, s=
ize_t len)
+{
+	bool diff;
+
+	/*
+	 * Make sure ZF is properly set in the len=3D=3D0 case because in it,
+	 * RCX=3D=3D0 and the REPE; CMPSB won't get executed.
+	 *
+	 * The "cc" clobber has no meaning anymore, just source compatibility.
+	 * On x86 the flag status bits are automatically added to the clobber
+	 * set when there are no =3D@ccXY constraints. Keep it as documentation.
+	 */
+	asm volatile("test %3, %3\n\t"
+		     "repe cmpsb"
+		     : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
+		     : : /* "cc", */ "memory");
+
+	return diff;
+}
+
+#endif /* _ASM_X86_SHARED_STRING_H */
