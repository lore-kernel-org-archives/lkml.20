Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF6C146D5A;
	Sat, 29 Aug 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994897; cv=none; b=TrfKBF7FI0h8d/ATNb19qK9+ByCCrDq36XKxQIvKD/aD3ps3FBtHZwEBqViFymWhBijC/drTJ25X70/7DVyKBQsUTMA0xUSXMaN050rd4eab1h7TiIE47XuUnm4ebNRtLOt6JgkNGTWWebbmkOuJm0XQBeJYNHpWxAhDYw58nsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994897; c=relaxed/simple;
	bh=ReEtJGxPFeXEYeSO8D340lHqcv0lA5bC+/BrtUoPNEE=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=ePLGnSh3WhCwRsoGBYEjApo/uba6CaThEmN/Q8+/SzRJnGvR612Cj5ekkkOGR3P4GU35+0t6iMViiAtZsmElOKC/YZvmtcXKNzI07ZrnqfLJEVV0RzP1UZi9kzXKdy2alqcO9DWRTcmWjVuBLIkwhOP0sYugnvgvdgMtpkZolKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hX8jB2XcGz8XrrM;
	Sat, 29 Aug 2026 17:14:54 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 67T9En9x091313;
	Sat, 29 Aug 2026 17:14:49 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 29 Aug 2026 17:14:52 +0800 (CST)
X-Zmail-TransId: 2afb6a92a30ca47-a5ff6
X-Mailer: Zmail v1.0
Message-ID: <20260829171452167RNbirsudPmuItbeo-z9Wm@zte.com.cn>
In-Reply-To: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
References: 20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn
Date: Sat, 29 Aug 2026 17:14:52 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <thomas.weissschuh@linutronix.de>,
        <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHY1IDIvNF0gdG9vbHMvaW5jbHVkZS91YXBpOiBBZGQgX19rZXJuZWxfb2xkX3RpbWVfdCB0eXBlZGVmIHRvIHRvb2xzL2luY2x1ZGUvdWFwaS9saW51eC90aW1lX3R5cGVzLmg=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 67T9En9x091313
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 29 Aug 2026 17:14:54 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A92A30E.000/4hX8jB2XcGz8XrrM

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Add time_types.h to tools/include/uapi/ to enable y2038-safe time
structures in tools. Unlike the kernel's uapi version, we define
the required types directly instead of including
<asm-generic/posix_types.h>.

Rationale:
- asm-generic/posix_types.h is NOT architecture-independent
- Different architectures override types (e.g., x86_32 overrides
  __kernel_mode_t, __kernel_uid_t, __kernel_gid_t to unsigned short)
- int-ll64.h is special and cannot be used as a pattern here

Direct typedefs for the three types actually needed:
- __kernel_long_t: base type for time values
- __kernel_time64_t: 64-bit time for y2038-safe interfaces
- __kernel_old_time_t: legacy time type introduced in v5.5

This follows the reviewer's suggestion to add typedefs only where
needed, avoiding architecture-specific issues while maintaining
self-containment of tools/include/uapi/.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/include/uapi/linux/time_types.h | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 tools/include/uapi/linux/time_types.h

diff --git a/tools/include/uapi/linux/time_types.h b/tools/include/uapi/linux/time_types.h
new file mode 100644
index 000000000000..3aa25d824cac
--- /dev/null
+++ b/tools/include/uapi/linux/time_types.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Started by AICoder, pid:00350371 */
+#ifndef _UAPI_LINUX_TIME_TYPES_H
+#define _UAPI_LINUX_TIME_TYPES_H
+
+#include <linux/types.h>
+
+/*
+ * Define time-related types directly instead of including
+ * <asm-generic/posix_types.h>. The asm-generic header is not
+ * architecture-independent: different architectures override
+ * certain types (e.g., x86_32 overrides __kernel_mode_t, __kernel_uid_t,
+ * __kernel_gid_t to unsigned short).
+ *
+ * We only need a few specific types here, so define them directly
+ * to avoid architecture-specific issues while maintaining self-containment.
+ */
+
+#ifndef __kernel_long_t
+typedef long __kernel_long_t;
+#endif
+
+#ifndef __kernel_time64_t
+typedef long long __kernel_time64_t;
+#endif
+
+/*
+ * __kernel_old_time_t was introduced in v5.5 for y2038-safe migration.
+ * It is used by legacy time structures like __kernel_old_timespec.
+ * Defined here to avoid dependency on outdated system headers.
+ */
+#ifndef __kernel_old_time_t
+typedef __kernel_long_t __kernel_old_time_t;
+#endif
+/* Ended by AICoder, pid:00350371 */
+
+struct __kernel_timespec {
+	__kernel_time64_t	tv_sec;		/* seconds */
+	long long		tv_nsec;	/* nanoseconds */
+};
+
+struct __kernel_itimerspec {
+	struct __kernel_timespec it_interval;	/* timer period */
+	struct __kernel_timespec it_value;	/* timer expiration */
+};
+
+/*
+ * legacy timeval structure, only embedded in structures that
+ * traditionally used 'timeval' to pass time intervals (not absolute
+ * times). Do not add new users. If user space fails to compile
+ * here, this is probably because it is not y2038 safe and needs to
+ * be changed to use another interface.
+ */
+#ifndef __kernel_old_timeval
+struct __kernel_old_timeval {
+	__kernel_long_t	tv_sec;
+	__kernel_long_t	tv_usec;
+};
+#endif
+
+struct __kernel_old_timespec {
+	__kernel_old_time_t	tv_sec;		/* seconds */
+	__kernel_long_t		tv_nsec;	/* nanoseconds */
+};
+
+struct __kernel_old_itimerval {
+	struct __kernel_old_timeval it_interval;/* timer interval */
+	struct __kernel_old_timeval it_value;	/* current value */
+};
+
+struct __kernel_sock_timeval {
+	__s64 tv_sec;
+	__s64 tv_usec;
+};
+
+#endif /* _UAPI_LINUX_TIME_TYPES_H */
-- 
2.25.1
