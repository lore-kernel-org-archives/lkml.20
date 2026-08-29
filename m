Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5A299929;
	Sat, 29 Aug 2026 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994954; cv=none; b=VJvluRPGRDa9deSa4nEU7ETGfiRlFarZiYwVcBWVL93Ch+jaes46rmtqUB9esQV9O7ozsM2gjgl+qizVh/DzZzaIiW6v7XD0fIiDi6ZuWw3/y+uehoLtXdGKpUH5yl5e9Xjv/6adqV4k3CNtIZpOOGJNI5xSUAxM3+MFvBjvKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994954; c=relaxed/simple;
	bh=h0aS4OGpCcBh+QsT3CvP9Ec7Q2SxnaYh5Paqx5ANqGE=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=nu9Bk4q2z/tLNK1RDq+iDnpMa7/Ij3XsXU3Z7Nsd5IC0dmB6sbpFdDVFl2uzzC6s7dkVQeinQaRO0j26DDfEkoKN7e5uj23NlacZKqG+reJoJrXbgmx9kkX4Vz0vZKeHYXht3JhiAorpTAaC1oM2KVu4+NVqxEDY3Lh9rHcJHDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hX8kG2jHBz5B100;
	Sat, 29 Aug 2026 17:15:50 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 67T9FkSm092335;
	Sat, 29 Aug 2026 17:15:46 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 29 Aug 2026 17:15:47 +0800 (CST)
X-Zmail-TransId: 2afb6a92a343929-a6ed7
X-Mailer: Zmail v1.0
Message-ID: <202608291715470989DNlxxTfjHp3w6Ppf0Swx@zte.com.cn>
In-Reply-To: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
References: 20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn
Date: Sat, 29 Aug 2026 17:15:47 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHY1IDMvNF0gdG9vbHMvYWNjb3VudGluZzogZmFjdG9yIG91dCBzaGFyZWQgZm9ybWF0X3RpbWVzcGVjKCkgaW1wbGVtZW50YXRpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 67T9FkSm092335
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 29 Aug 2026 17:15:50 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A92A346.000/4hX8kG2jHBz5B100

From: Wang Yaxin <wang.yaxin@zte.com.cn>

The same __kernel_timespec formatting logic existed independently in
both getdelays.c and delaytop.c with minor differences (strftime vs
snprintf, __kernel_time64_t vs time_t).

Create a shared format_timespec.c/h with a canonical implementation
(strftime + time_t), remove the static copies from both files, and
link both programs against the common object.

Also simplify the Makefile with a pattern rule for %.o and a static
pattern rule for the two programs that need format_timespec.o.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/accounting/Makefile          | 12 ++++++++-
 tools/accounting/delaytop.c        | 39 +++---------------------------
 tools/accounting/format_timespec.c | 39 ++++++++++++++++++++++++++++++
 tools/accounting/format_timespec.h |  9 +++++++
 tools/accounting/getdelays.c       | 32 ++----------------------
 5 files changed, 64 insertions(+), 67 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h

diff --git a/tools/accounting/Makefile b/tools/accounting/Makefile
index 007c0bb8cbbb..5224e03f5e94 100644
--- a/tools/accounting/Makefile
+++ b/tools/accounting/Makefile
@@ -3,8 +3,18 @@ CC := $(CROSS_COMPILE)gcc
 CFLAGS := -I../include/uapi/

 PROGS := getdelays procacct delaytop
+OBJS := format_timespec.o

 all: $(PROGS)

+getdelays delaytop: %: %.o $(OBJS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+
+procacct: procacct.o
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+
+%.o: %.c
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
+
 clean:
-	rm -fr $(PROGS)
+	rm -fr $(PROGS) *.o
diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index d59187f1b000..527266d28d9a 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -44,6 +44,8 @@
 #include <linux/cgroupstats.h>
 #include <stddef.h>

+#include "format_timespec.h"
+
 #define PSI_PATH	"/proc/pressure"
 #define PSI_CPU_PATH	"/proc/pressure/cpu"
 #define PSI_MEMORY_PATH	"/proc/pressure/memory"
@@ -817,41 +819,6 @@ static double average_ms(unsigned long long total, unsigned long long count)
 	return (double)total / 1000000.0 / count;
 }

-/*
- * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
- * Returns formatted string or "N/A" if timestamp is zero
- */
-static const char *format_kernel_timespec(struct __kernel_timespec *ts)
-{
-	static char buffer[32];
-	time_t time_sec;
-	struct tm tm_info;
-
-	/* Check if timestamp is zero (not set) */
-	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
-		return "N/A";
-
-	/* Avoid Y2038 truncation: check if timestamp fits in time_t on 32-bit platforms */
-	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
-	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
-		return "N/A";
-
-	time_sec = (time_t)ts->tv_sec;
-
-	if (localtime_r(&time_sec, &tm_info) == NULL)
-		return "N/A";
-
-	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02dT%02d:%02d:%02d",
-		tm_info.tm_year + 1900,
-		tm_info.tm_mon + 1,
-		tm_info.tm_mday,
-		tm_info.tm_hour,
-		tm_info.tm_min,
-		tm_info.tm_sec);
-
-	return buffer;
-}
-
 /* Comparison function for sorting tasks */
 static int compare_tasks(const void *a, const void *b)
 {
@@ -1133,7 +1100,7 @@ static void display_results(int psi_ret)
 					&max_ms, &max_ts);

 			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
-				avg_ms, max_ms, format_kernel_timespec(&max_ts));
+				avg_ms, max_ms, format_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], MEM),
diff --git a/tools/accounting/format_timespec.c b/tools/accounting/format_timespec.c
new file mode 100644
index 000000000000..1dba50cac895
--- /dev/null
+++ b/tools/accounting/format_timespec.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared __kernel_timespec formatting for tools/accounting/
+ *
+ * Formats a __kernel_timespec to an ISO 8601 timestamp string
+ * (YYYY-MM-DDTHH:MM:SS). Returns "N/A" if the timestamp is zero
+ * or does not fit in time_t.
+ */
+#include <time.h>
+#include <linux/time_types.h>
+#include "format_timespec.h"
+
+const char *format_timespec(const struct __kernel_timespec *ts)
+{
+	static char buffer[32];
+	struct tm tm_info;
+	time_t time_sec;
+
+	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
+		return "N/A";
+
+	/*
+	 * On 32-bit platforms time_t is 32-bit and cannot represent
+	 * dates beyond Y2038.  The kernel timestamp is always 64-bit,
+	 * so reject values that would overflow.
+	 */
+	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
+	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
+		return "N/A";
+
+	time_sec = ts->tv_sec;
+
+	if (!localtime_r(&time_sec, &tm_info))
+		return "N/A";
+
+	strftime(buffer, sizeof(buffer), "%Y-%m-%dT%H:%M:%S", &tm_info);
+
+	return buffer;
+}
diff --git a/tools/accounting/format_timespec.h b/tools/accounting/format_timespec.h
new file mode 100644
index 000000000000..960496ebf5c2
--- /dev/null
+++ b/tools/accounting/format_timespec.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef FORMAT_TIMESPEC_H
+#define FORMAT_TIMESPEC_H
+
+#include <linux/time_types.h>
+
+const char *format_timespec(const struct __kernel_timespec *ts);
+
+#endif
diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index 263ded4567fd..7b1ae4492a77 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -30,6 +30,8 @@
 #include <linux/taskstats.h>
 #include <linux/cgroupstats.h>

+#include "format_timespec.h"
+
 /*
  * Generic macros for dealing with netlink sockets. Might be duplicated
  * elsewhere. It is recommended that commercial grade applications use
@@ -221,36 +223,6 @@ static int get_family_id(int sd)
 #define average_ms(t, c) (t / 1000000ULL / (c ? c : 1))
 #define delay_ms(t) (t / 1000000ULL)

-/*
- * Format __kernel_timespec to human readable string (YYYY-MM-DD HH:MM:SS)
- * Returns formatted string or "N/A" if timestamp is zero
- */
-static const char *format_timespec(struct __kernel_timespec *ts)
-{
-	static char buffer[32];
-	struct tm tm_info;
-	__kernel_time_t time_sec;
-
-	/* Check if timestamp is zero (not set) */
-	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
-		return "N/A";
-
-	/* Avoid Y2038 truncation on 32-bit platforms */
-	if (sizeof(time_sec) < sizeof(ts->tv_sec) &&
-	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_sec) * 8 - 1)) - 1))
-		return "N/A";
-
-	time_sec = ts->tv_sec;
-
-	/* Use thread-safe localtime_r */
-	if (localtime_r(&time_sec, &tm_info) == NULL)
-		return "N/A";
-
-	strftime(buffer, sizeof(buffer), "%Y-%m-%dT%H:%M:%S", &tm_info);
-
-	return buffer;
-}
-
 /*
  * Version compatibility note:
  * Field availability depends on taskstats version (t->version),
-- 
2.25.1
