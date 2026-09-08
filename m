Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283F4C6F1C;
	Tue,  8 Sep 2026 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879289; cv=none; b=OXtBfam9aoKE89gT5397b854vfLp/qQkeY1CFVxyfM7SUrN/nE5xifjl/ylnuHCWYnWafZ07TyxXD/bJ4QCv5qDEEWqU1kVU355OHeOAqC4Z7anpcMZb6NxEhn9gcVm8VCnmPwsOumS3HojoyCQi+BJOzM9oRQ/oHXyP5PbTH0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879289; c=relaxed/simple;
	bh=eKmoDmU7cPcScd5qhHm2thxePMiTsl585hrIe67xz98=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=STHTgWTv+UOLODc4Y3z4AhYzZGj2Rd5Uo4Fu3ntRLBF3g7kNM13IN5Ydwlu3A/X1x8BjFsdHa9dimvy5VhzLCoa1UOv44FUNOy1fpBzG715FE9qZEi6cS1Aq0TSfp4bjrH4BVn0lbT/YPwKqKSiPQpIeBtS350gGqDX0iKqaVf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hfRmS1trYz5BNS0;
	Tue, 08 Sep 2026 22:54:32 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 688EsOMi026063;
	Tue, 8 Sep 2026 22:54:24 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 8 Sep 2026 22:54:27 +0800 (CST)
X-Zmail-TransId: 2afa6aa021a34db-6380b
X-Mailer: Zmail v1.0
Message-ID: <20260908225427898_yIq6mmNl7kW52TOZ-rei@zte.com.cn>
In-Reply-To: <20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn>
References: 20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn
Date: Tue, 8 Sep 2026 22:54:27 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDIvMyB2NF0gZGVsYXl0b3A6IGFkZCB0aW1lc3RhbXAgb2YgZGVsYXkgbWF4?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 688EsOMi026063
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 08 Sep 2026 22:54:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA021A8.000/4hfRmS1trYz5BNS0

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Record the wall-clock timestamp when each maximum delay occurred for
all delay types. The timestamp is displayed in the MAX_TIMESTAMP column
when using -t/--type option.

This enables:
- Identifying the time when a process experienced an abnormal delay spike
- Correlating delay peaks across multiple processes at the same timestamp
- Cross-referencing with system logs, traces, or other metrics at that time
- Pinpointing the root cause of latency issues by finding concurrent events

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 tools/accounting/delaytop.c | 84 ++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 10 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 29b0fff1d4a0..7e80f3875a91 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -76,14 +76,16 @@
 	offsetof(struct task_info, name##_delay_total), \
 	offsetof(struct task_info, name##_count), \
 	offsetof(struct task_info, name##_delay_max), \
+	offsetof(struct task_info, name##_delay_max_ts), \
 	modes}
 #define SORT_FIELD_NO_MAX(name, cmd, modes) \
 	{#name, #cmd, \
 	offsetof(struct task_info, name##_delay_total), \
 	offsetof(struct task_info, name##_count), \
 	0, \
+	0, \
 	modes}
-#define END_FIELD {NULL, 0, 0, 0, 0, 0}
+#define END_FIELD {NULL, 0, 0, 0, 0, 0, 0}

 /* Display mode types */
 #define MODE_TYPE_ALL	(0xFFFFFFFF)
@@ -117,27 +119,35 @@ struct task_info {
 	unsigned long long cpu_count;
 	unsigned long long cpu_delay_total;
 	unsigned long long cpu_delay_max;
+	struct __kernel_timespec cpu_delay_max_ts;
 	unsigned long long blkio_count;
 	unsigned long long blkio_delay_total;
 	unsigned long long blkio_delay_max;
+	struct __kernel_timespec blkio_delay_max_ts;
 	unsigned long long swapin_count;
 	unsigned long long swapin_delay_total;
 	unsigned long long swapin_delay_max;
+	struct __kernel_timespec swapin_delay_max_ts;
 	unsigned long long freepages_count;
 	unsigned long long freepages_delay_total;
 	unsigned long long freepages_delay_max;
+	struct __kernel_timespec freepages_delay_max_ts;
 	unsigned long long thrashing_count;
 	unsigned long long thrashing_delay_total;
 	unsigned long long thrashing_delay_max;
+	struct __kernel_timespec thrashing_delay_max_ts;
 	unsigned long long compact_count;
 	unsigned long long compact_delay_total;
 	unsigned long long compact_delay_max;
+	struct __kernel_timespec compact_delay_max_ts;
 	unsigned long long wpcopy_count;
 	unsigned long long wpcopy_delay_total;
 	unsigned long long wpcopy_delay_max;
+	struct __kernel_timespec wpcopy_delay_max_ts;
 	unsigned long long irq_count;
 	unsigned long long irq_delay_total;
 	unsigned long long irq_delay_max;
+	struct __kernel_timespec irq_delay_max_ts;
 	unsigned long long mem_count;
 	unsigned long long mem_delay_total;
 };
@@ -158,6 +168,7 @@ struct field_desc {
 	unsigned long total_offset; /* Offset of total delay in task_info */
 	unsigned long count_offset; /* Offset of count in task_info */
 	unsigned long max_offset;  /* Offset of max delay in task_info */
+	unsigned long max_ts_offset; /* Offset of max delay timestamp in task_info */
 	size_t supported_modes; /* Supported display modes */
 };

@@ -283,7 +294,7 @@ static void usage(void)
 	"  -p, --pid=PID            Monitor only the specified PID\n"
 	"  -C, --container=PATH     Monitor the container at specified cgroup path\n"
 	"  -s, --sort=FIELD         Sort by delay field (default: cpu)\n"
-	"  -t, --type=FIELD         Display only specified delay type with avg/max\n"
+	"  -t, --type=FIELD         Display only specified delay type with avg/max/timestamp\n"
 	"  -M, --memverbose         Display memory detailed information\n");
 	exit(0);
 }
@@ -749,27 +760,35 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
 						SET_TASK_STAT(task_count, cpu_count);
 						SET_TASK_STAT(task_count, cpu_delay_total);
 						SET_TASK_STAT(task_count, cpu_delay_max);
+						SET_TASK_STAT(task_count, cpu_delay_max_ts);
 						SET_TASK_STAT(task_count, blkio_count);
 						SET_TASK_STAT(task_count, blkio_delay_total);
 						SET_TASK_STAT(task_count, blkio_delay_max);
+						SET_TASK_STAT(task_count, blkio_delay_max_ts);
 						SET_TASK_STAT(task_count, swapin_count);
 						SET_TASK_STAT(task_count, swapin_delay_total);
 						SET_TASK_STAT(task_count, swapin_delay_max);
+						SET_TASK_STAT(task_count, swapin_delay_max_ts);
 						SET_TASK_STAT(task_count, freepages_count);
 						SET_TASK_STAT(task_count, freepages_delay_total);
 						SET_TASK_STAT(task_count, freepages_delay_max);
+						SET_TASK_STAT(task_count, freepages_delay_max_ts);
 						SET_TASK_STAT(task_count, thrashing_count);
 						SET_TASK_STAT(task_count, thrashing_delay_total);
 						SET_TASK_STAT(task_count, thrashing_delay_max);
+						SET_TASK_STAT(task_count, thrashing_delay_max_ts);
 						SET_TASK_STAT(task_count, compact_count);
 						SET_TASK_STAT(task_count, compact_delay_total);
 						SET_TASK_STAT(task_count, compact_delay_max);
+						SET_TASK_STAT(task_count, compact_delay_max_ts);
 						SET_TASK_STAT(task_count, wpcopy_count);
 						SET_TASK_STAT(task_count, wpcopy_delay_total);
 						SET_TASK_STAT(task_count, wpcopy_delay_max);
+						SET_TASK_STAT(task_count, wpcopy_delay_max_ts);
 						SET_TASK_STAT(task_count, irq_count);
 						SET_TASK_STAT(task_count, irq_delay_total);
 						SET_TASK_STAT(task_count, irq_delay_max);
+						SET_TASK_STAT(task_count, irq_delay_max_ts);
 						set_mem_count(&tasks[task_count]);
 						set_mem_delay_total(&tasks[task_count]);
 						task_count++;
@@ -827,6 +846,41 @@ static double average_ms(unsigned long long total, unsigned long long count)
 	return (double)total / 1000000.0 / count;
 }

+/*
+ * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
+ * Returns formatted string or "N/A" if timestamp is zero
+ */
+static const char *format_timespec64(struct __kernel_timespec *ts)
+{
+	static char buffer[32];
+	time_t time_sec;
+	struct tm tm_info;
+
+	/* Check if timestamp is zero (not set) */
+	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
+		return "N/A";
+
+	/* Avoid Y2038 truncation: check if timestamp fits in time_t on 32-bit platforms */
+	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
+	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
+		return "N/A";
+
+	time_sec = (time_t)ts->tv_sec;
+
+	if (localtime_r(&time_sec, &tm_info) == NULL)
+		return "N/A";
+
+	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02dT%02d:%02d:%02d",
+		tm_info.tm_year + 1900,
+		tm_info.tm_mon + 1,
+		tm_info.tm_mday,
+		tm_info.tm_hour,
+		tm_info.tm_min,
+		tm_info.tm_sec);
+
+	return buffer;
+}
+
 /* Comparison function for sorting tasks */
 static int compare_tasks(const void *a, const void *b)
 {
@@ -853,13 +907,15 @@ static int compare_tasks(const void *a, const void *b)

 /* Get delay values for a specific field */
 static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
-				   double *avg_ms, double *max_ms)
+				   double *avg_ms, double *max_ms,
+				   struct __kernel_timespec *max_ts)
 {
 	unsigned long long total, count, max;

 	if (!field || !field->max_offset) {
 		*avg_ms = 0;
 		*max_ms = 0;
+		memset(max_ts, 0, sizeof(*max_ts));
 		return;
 	}

@@ -869,6 +925,11 @@ static void get_field_delay_values(const struct task_info *task, const struct fi

 	max = *(unsigned long long *)((char *)task + field->max_offset);
 	*max_ms = (double)max / 1000000.0;  /* Convert nanoseconds to milliseconds */
+
+	if (field->max_ts_offset)
+		*max_ts = *(struct __kernel_timespec *)((char *)task + field->max_ts_offset);
+	else
+		memset(max_ts, 0, sizeof(*max_ts));
 }

 /* Sort tasks by selected field */
@@ -1033,11 +1094,12 @@ static void display_results(int psi_ret)
 			cfg.max_processes, get_name_by_field(cfg.sort_field));

 	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
-		/* Display mode for -t option: show only specified type with avg/max */
-		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s %12s %12s\n",
+		/* Display mode for -t option: show only specified type with avg/max/timestamp */
+		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s %12s %12s %20s\n",
 			"PID", "TGID", "COMMAND",
-			"AVG(ms)", "MAX(ms)");
-		suc &= BOOL_FPRINT(out, "----------------------------------------------------\n");
+			"AVG(ms)", "MAX(ms)", "MAX_TIMESTAMP");
+		suc &= BOOL_FPRINT(out, "--------------------------------------------------------");
+		suc &= BOOL_FPRINT(out, "----------------------------------------\n");
 	} else {
 		suc &= BOOL_FPRINT(out, "%8s  %8s  %-17s", "PID", "TGID", "COMMAND");
 		if (cfg.display_mode == MODE_MEMVERBOSE) {
@@ -1064,11 +1126,13 @@ static void display_results(int psi_ret)
 			tasks[i].pid, tasks[i].tgid, tasks[i].command);
 		if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
 			double avg_ms, max_ms;
+			struct __kernel_timespec max_ts;

-			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms, &max_ms);
+			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms,
+					&max_ms, &max_ts);

-			suc &= BOOL_FPRINT(out, "%12.2f %12.2f\n",
-				avg_ms, max_ms);
+			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
+				avg_ms, max_ms, format_timespec64(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], mem),
-- 
2.47.1
