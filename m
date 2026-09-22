Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00002351C0C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040985; cv=none; b=EoD6dQ7BQ3/ItAzFgz4EGt104vBOcAHZgD2ZkCfeX5S+/sYhx8JlHUPR9UeSBY3/BjGFOFtW+lbQmszQ8uke/4mBUPfSuQxFVg8qnBKoOHPllF/idN9Zd2CZ1pA5KhjQH/PYvtLFioLmqOGjQUKalqoQL5Cx8agcUP9N7GgdhFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040985; c=relaxed/simple;
	bh=bpVV9EyXMnXQEOrtLax36wV7I4hg1uKDJ0us/L5qzIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkiBpCOOWdJSP30FIYTqfR877nV3u6LkASAfAI34buGhWZnKO+nmZWCdPbM8RA5dACnWoAxn4Dmie5VHT7roFUNvTf+YLNlo2U0W8sVxKw50pHIyaY3J+sBbBsbrRwbpxhpBfSJloYLfKrfKEIRUEF9Y0825cSozvP7rztjiebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=L0/vA5Ck; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="L0/vA5Ck"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=j9CxFCWuPrvGlLqznnNoJgjx2OHznuUku/3wRXkyArk=; b=L0/vA5CkOQE34d8kurstyXKXMd
	lHLDh/ey5KyOtpiMjY+BGOESVYS31Wt/ziwV+XCmlCgmrWP3DVjLKHR1/SjTBaerDhXthhtLYKjPp
	ccpPKU0bquKjhsW3FRuX414I6hM/xsBkgIMXTVwOHUWgYOF6oyHfPn2jV6glcREYLCz/C4AyurK+y
	GFlgIqH89YGxE77Su4xXzx27M5P7IxSe44MF7I6vXW2Mkm6OAIlO4uHwbybv8ZD2lOpHFoPs17HIH
	hQg1Pd3WXC5MklfBe6qmbxxYLfqLNw+MfB+aYCHNYFCb1L94385Gg0neNNicnYmQlk5Q8lwBjUodw
	yEheJjVg==;
Received: from 186-249-150-130.shared.desktop.com.br ([186.249.150.130] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8pQc-005NkF-0M; Tue, 22 Sep 2026 03:36:14 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 21 Sep 2026 22:36:33 -0300
Subject: [PATCH v10 2/4] x86/asm, x86/boot: expose inline memcmp()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-pvh-kasan-inline-v10-2-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
In-Reply-To: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

Move the inline memcmp function currently only available in boot/string.c
into the shared string function header <asm/shared/string.h> to be reused.

This is not done through <asm/string.h> to avoid pulling unnecessary code
in boot/string.c that causes build errors in boot/compressed/string.c
and purgatory/purgatory.ro.

No functional changes.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>

---

Thanks to David Laight for noticing the return value difference between
inline and regular memcmp().
---
 arch/x86/boot/string.c               | 17 ++---------------
 arch/x86/include/asm/shared/string.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
index e10260ed58b69fc734a4e63f15785a643f414441..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
--- a/arch/x86/boot/string.c
+++ b/arch/x86/boot/string.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <asm/asm.h>
+#include <asm/shared/string.h>
 #include "ctype.h"
 #include "string.h"
 
@@ -31,21 +32,7 @@
 
 int memcmp(const void *s1, const void *s2, size_t len)
 {
-	bool diff;
-
-	/*
-	 * Make sure ZF is properly set in the len==0 case because in it,
-	 * RCX==0 and the REPE; CMPSB won't get executed.
-	 *
-	 * The "cc" clobber has no meaning anymore, just source compatibility.
-	 * On x86 the flag status bits are automatically added to the clobber
-	 * set when there are no =@ccXY constraints. Keep it as documentation.
-	 */
-	asm volatile("test %3, %3\n\t"
-		     "repe cmpsb"
-		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
-		     : : /* "cc", */ "memory");
-	return diff;
+	return __inline_memcmp(s1, s2, len);
 }
 
 /*
diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
new file mode 100644
index 0000000000000000000000000000000000000000..6291653fe629babf15e29060b013d357d8eacf4c
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
+static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
+{
+	bool diff;
+
+	/*
+	 * Make sure ZF is properly set in the len==0 case because in it,
+	 * RCX==0 and the REPE; CMPSB won't get executed.
+	 *
+	 * The "cc" clobber has no meaning anymore, just source compatibility.
+	 * On x86 the flag status bits are automatically added to the clobber
+	 * set when there are no =@ccXY constraints. Keep it as documentation.
+	 */
+	asm volatile("test %3, %3\n\t"
+		     "repe cmpsb"
+		     : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
+		     : : /* "cc", */ "memory");
+
+	return diff;
+}
+
+#endif /* _ASM_X86_SHARED_STRING_H */

-- 
2.47.3

