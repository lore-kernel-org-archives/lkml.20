Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182EF310652;
	Sat, 29 Aug 2026 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994840; cv=none; b=INyp6+plq7cObFBX5m0zjtzQ0CUUqaxIhlfdUQiUnnIoDCgxFaluUIDczQukVR5yKtZR6TPgOqkFucSjL9ZA+9HveZANt8drzPLWnozyz9kGNBF3NaGx991YtS0z2gFuuFSfFiaMBFylcFzrUTO/uoD1UXRvSYsvmaQyKWdqSYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994840; c=relaxed/simple;
	bh=f436x9nhVfSHLiS4RVVHJDkBekeTOzGkh4k0fAK5cRc=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=oWxrrDrCbUI5wE9atPorRJfKZDXIQbeavSuwEnzrIbTFX8qA/Zvqi9FWqsMz/W84NXwPoAoCqVqYf2Vm6Jh7muDeg8kkoWu527jvSaV+nLLNbogc7ZO1PgBNQEKU5PqI5qRKNF+AiJKT2SbtTaGH6QROrUkOW2aS6bNsoqUycLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hX8gy3dp3z8Xrr9;
	Sat, 29 Aug 2026 17:13:50 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 67T9DhZm046749;
	Sat, 29 Aug 2026 17:13:43 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 29 Aug 2026 17:13:46 +0800 (CST)
X-Zmail-TransId: 2afb6a92a2ca82f-a4ddf
X-Mailer: Zmail v1.0
Message-ID: <20260829171346085yBHabmdJX-G6Cs4yMSAZZ@zte.com.cn>
In-Reply-To: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
References: 20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn
Date: Sat, 29 Aug 2026 17:13:46 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHY1IDEvNF0gZGVsYXl0b3A6IHJlZmFjdG9yIHJlcGV0aXRpdmUgZGVsYXkgZmllbGRzIGludG8gYXJyYXkgd2l0aCBlbnVt?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 67T9DhZm046749
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 29 Aug 2026 17:13:50 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A92A2CE.000/4hX8gy3dp3z8Xrr9

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Replace the 9 groups of (count, delay_total, delay_max, delay_max_ts)
named fields in struct task_info with a struct delay_metrics array
indexed by enum delay_type. This eliminates all unsafe pointer
arithmetic via offsetof() from compare_tasks(),
field_delay_max_and_ts(), and get_field_delay_values().

The struct field_desc now stores an enum delay_type index instead of
four separate unsigned long offset values.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Acked-by: Xu Xin <xu.xin16@zte.com.cn>
---
 tools/accounting/delaytop.c | 220 +++++++++++++++---------------------
 1 file changed, 88 insertions(+), 132 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index af8a1e42a055..d59187f1b000 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -61,31 +61,51 @@
 #define MAX_MSG_SIZE	1024
 #define MAX_TASKS		1000
 #define MAX_BUF_LEN		256
-#define SET_TASK_STAT(task_count, field) tasks[task_count].field = stats.field
 #define BOOL_FPRINT(stream, fmt, ...) \
 ({ \
 	int ret = fprintf(stream, fmt, ##__VA_ARGS__); \
 	ret >= 0; \
 })
-#define TASK_AVG(task, field) average_ms((task).field##_delay_total, (task).field##_count)
+#define TASK_AVG(task, type) \
+	average_ms((task).delays[DELAY_##type].delay_total, \
+		   (task).delays[DELAY_##type].count)
 #define PSI_LINE_FORMAT "%-12s %6.1f%%/%6.1f%%/%6.1f%%/%8llu(ms)\n"
 #define DELAY_FMT_DEFAULT "%8.2f %8.2f %8.2f %8.2f\n"
 #define DELAY_FMT_MEMVERBOSE "%8.2f %8.2f %8.2f %8.2f %8.2f %8.2f\n"
-#define SORT_FIELD(name, cmd, modes) \
-	{#name, #cmd, \
-	offsetof(struct task_info, name##_delay_total), \
-	offsetof(struct task_info, name##_count), \
-	offsetof(struct task_info, name##_delay_max), \
-	offsetof(struct task_info, name##_delay_max_ts), \
-	modes}
-#define SORT_FIELD_NO_MAX(name, cmd, modes) \
-	{#name, #cmd, \
-	offsetof(struct task_info, name##_delay_total), \
-	offsetof(struct task_info, name##_count), \
-	0, \
-	0, \
-	modes}
-#define END_FIELD {NULL, 0, 0, 0, 0, 0, 0}
+#define COPY_DELAY(task_idx, type, stats_prefix) \
+	do { \
+		tasks[task_idx].delays[DELAY_##type].count = \
+			stats.stats_prefix##_count; \
+		tasks[task_idx].delays[DELAY_##type].delay_total = \
+			stats.stats_prefix##_delay_total; \
+		tasks[task_idx].delays[DELAY_##type].delay_max = \
+			stats.stats_prefix##_delay_max; \
+		tasks[task_idx].delays[DELAY_##type].delay_max_ts = \
+			stats.stats_prefix##_delay_max_ts; \
+	} while (0)
+#define SORT_FIELD(name, cmd, type, modes, has_max) \
+	{#name, #cmd, type, modes, has_max}
+#define END_FIELD {NULL, 0, 0, 0, false}
+
+enum delay_type {
+	DELAY_CPU,
+	DELAY_BLKIO,
+	DELAY_SWAPIN,
+	DELAY_FREEPAGES,
+	DELAY_THRASHING,
+	DELAY_COMPACT,
+	DELAY_WPCOPY,
+	DELAY_IRQ,
+	DELAY_MEM,
+	NUM_DELAY_TYPES
+};
+
+struct delay_metrics {
+	unsigned long long count;
+	unsigned long long delay_total;
+	unsigned long long delay_max;
+	struct __kernel_timespec delay_max_ts;
+};

 /* Display mode types */
 #define MODE_TYPE_ALL	(0xFFFFFFFF)
@@ -116,40 +136,7 @@ struct task_info {
 	int pid;
 	int tgid;
 	char command[TASK_COMM_LEN];
-	unsigned long long cpu_count;
-	unsigned long long cpu_delay_total;
-	unsigned long long cpu_delay_max;
-	struct __kernel_timespec cpu_delay_max_ts;
-	unsigned long long blkio_count;
-	unsigned long long blkio_delay_total;
-	unsigned long long blkio_delay_max;
-	struct __kernel_timespec blkio_delay_max_ts;
-	unsigned long long swapin_count;
-	unsigned long long swapin_delay_total;
-	unsigned long long swapin_delay_max;
-	struct __kernel_timespec swapin_delay_max_ts;
-	unsigned long long freepages_count;
-	unsigned long long freepages_delay_total;
-	unsigned long long freepages_delay_max;
-	struct __kernel_timespec freepages_delay_max_ts;
-	unsigned long long thrashing_count;
-	unsigned long long thrashing_delay_total;
-	unsigned long long thrashing_delay_max;
-	struct __kernel_timespec thrashing_delay_max_ts;
-	unsigned long long compact_count;
-	unsigned long long compact_delay_total;
-	unsigned long long compact_delay_max;
-	struct __kernel_timespec compact_delay_max_ts;
-	unsigned long long wpcopy_count;
-	unsigned long long wpcopy_delay_total;
-	unsigned long long wpcopy_delay_max;
-	struct __kernel_timespec wpcopy_delay_max_ts;
-	unsigned long long irq_count;
-	unsigned long long irq_delay_total;
-	unsigned long long irq_delay_max;
-	struct __kernel_timespec irq_delay_max_ts;
-	unsigned long long mem_count;
-	unsigned long long mem_delay_total;
+	struct delay_metrics delays[NUM_DELAY_TYPES];
 };

 /* Container statistics structure */
@@ -165,11 +152,9 @@ struct container_stats {
 struct field_desc {
 	const char *name;	/* Field name for cmdline argument */
 	const char *cmd_char;	/* Interactive command */
-	unsigned long total_offset; /* Offset of total delay in task_info */
-	unsigned long count_offset; /* Offset of count in task_info */
-	unsigned long max_offset;  /* Offset of max delay in task_info */
-	unsigned long max_ts_offset; /* Offset of max delay timestamp in task_info */
+	enum delay_type type;	/* Index into task_info.delays[] */
 	size_t supported_modes; /* Supported display modes */
+	bool has_max;		/* Whether this field has max/ts */
 };

 /* Program settings structure */
@@ -193,15 +178,15 @@ static int task_count;
 static int running = 1;
 static struct container_stats container_stats;
 static const struct field_desc sort_fields[] = {
-	SORT_FIELD(cpu,		c,	MODE_DEFAULT | MODE_TYPE),
-	SORT_FIELD(blkio,	i,	MODE_DEFAULT | MODE_TYPE),
-	SORT_FIELD(irq,		q,	MODE_DEFAULT | MODE_TYPE),
-	SORT_FIELD_NO_MAX(mem,	m,	MODE_DEFAULT | MODE_MEMVERBOSE),
-	SORT_FIELD(swapin,	s,	MODE_MEMVERBOSE | MODE_TYPE),
-	SORT_FIELD(freepages,	r,	MODE_MEMVERBOSE | MODE_TYPE),
-	SORT_FIELD(thrashing,	t,	MODE_MEMVERBOSE | MODE_TYPE),
-	SORT_FIELD(compact,	p,	MODE_MEMVERBOSE | MODE_TYPE),
-	SORT_FIELD(wpcopy,	w,	MODE_MEMVERBOSE | MODE_TYPE),
+	SORT_FIELD(cpu, c, DELAY_CPU, MODE_DEFAULT | MODE_TYPE, true),
+	SORT_FIELD(blkio, i, DELAY_BLKIO, MODE_DEFAULT | MODE_TYPE, true),
+	SORT_FIELD(irq, q, DELAY_IRQ, MODE_DEFAULT | MODE_TYPE, true),
+	SORT_FIELD(mem, m, DELAY_MEM, MODE_DEFAULT | MODE_MEMVERBOSE, false),
+	SORT_FIELD(swapin, s, DELAY_SWAPIN, MODE_MEMVERBOSE | MODE_TYPE, true),
+	SORT_FIELD(freepages, r, DELAY_FREEPAGES, MODE_MEMVERBOSE | MODE_TYPE, true),
+	SORT_FIELD(thrashing, t, DELAY_THRASHING, MODE_MEMVERBOSE | MODE_TYPE, true),
+	SORT_FIELD(compact, p, DELAY_COMPACT, MODE_MEMVERBOSE | MODE_TYPE, true),
+	SORT_FIELD(wpcopy, w, DELAY_WPCOPY, MODE_MEMVERBOSE | MODE_TYPE, true),
 	END_FIELD
 };
 static int sort_selected;
@@ -433,20 +418,20 @@ static void parse_args(int argc, char **argv)
 /* Calculate average delay in milliseconds for overall memory */
 static void set_mem_delay_total(struct task_info *t)
 {
-	t->mem_delay_total = t->swapin_delay_total +
-		t->freepages_delay_total +
-		t->thrashing_delay_total +
-		t->compact_delay_total +
-		t->wpcopy_delay_total;
+	t->delays[DELAY_MEM].delay_total = t->delays[DELAY_SWAPIN].delay_total +
+		t->delays[DELAY_FREEPAGES].delay_total +
+		t->delays[DELAY_THRASHING].delay_total +
+		t->delays[DELAY_COMPACT].delay_total +
+		t->delays[DELAY_WPCOPY].delay_total;
 }

 static void set_mem_count(struct task_info *t)
 {
-	t->mem_count = t->swapin_count +
-		t->freepages_count +
-		t->thrashing_count +
-		t->compact_count +
-		t->wpcopy_count;
+	t->delays[DELAY_MEM].count = t->delays[DELAY_SWAPIN].count +
+		t->delays[DELAY_FREEPAGES].count +
+		t->delays[DELAY_THRASHING].count +
+		t->delays[DELAY_COMPACT].count +
+		t->delays[DELAY_WPCOPY].count;
 }

 /* Create a raw netlink socket and bind */
@@ -758,38 +743,14 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
 						strncpy(tasks[task_count].command, comm,
 							TASK_COMM_LEN - 1);
 						tasks[task_count].command[TASK_COMM_LEN - 1] = '\0';
-						SET_TASK_STAT(task_count, cpu_count);
-						SET_TASK_STAT(task_count, cpu_delay_total);
-						SET_TASK_STAT(task_count, cpu_delay_max);
-						SET_TASK_STAT(task_count, cpu_delay_max_ts);
-						SET_TASK_STAT(task_count, blkio_count);
-						SET_TASK_STAT(task_count, blkio_delay_total);
-						SET_TASK_STAT(task_count, blkio_delay_max);
-						SET_TASK_STAT(task_count, blkio_delay_max_ts);
-						SET_TASK_STAT(task_count, swapin_count);
-						SET_TASK_STAT(task_count, swapin_delay_total);
-						SET_TASK_STAT(task_count, swapin_delay_max);
-						SET_TASK_STAT(task_count, swapin_delay_max_ts);
-						SET_TASK_STAT(task_count, freepages_count);
-						SET_TASK_STAT(task_count, freepages_delay_total);
-						SET_TASK_STAT(task_count, freepages_delay_max);
-						SET_TASK_STAT(task_count, freepages_delay_max_ts);
-						SET_TASK_STAT(task_count, thrashing_count);
-						SET_TASK_STAT(task_count, thrashing_delay_total);
-						SET_TASK_STAT(task_count, thrashing_delay_max);
-						SET_TASK_STAT(task_count, thrashing_delay_max_ts);
-						SET_TASK_STAT(task_count, compact_count);
-						SET_TASK_STAT(task_count, compact_delay_total);
-						SET_TASK_STAT(task_count, compact_delay_max);
-						SET_TASK_STAT(task_count, compact_delay_max_ts);
-						SET_TASK_STAT(task_count, wpcopy_count);
-						SET_TASK_STAT(task_count, wpcopy_delay_total);
-						SET_TASK_STAT(task_count, wpcopy_delay_max);
-						SET_TASK_STAT(task_count, wpcopy_delay_max_ts);
-						SET_TASK_STAT(task_count, irq_count);
-						SET_TASK_STAT(task_count, irq_delay_total);
-						SET_TASK_STAT(task_count, irq_delay_max);
-						SET_TASK_STAT(task_count, irq_delay_max_ts);
+						COPY_DELAY(task_count, CPU, cpu);
+						COPY_DELAY(task_count, BLKIO, blkio);
+						COPY_DELAY(task_count, SWAPIN, swapin);
+						COPY_DELAY(task_count, FREEPAGES, freepages);
+						COPY_DELAY(task_count, THRASHING, thrashing);
+						COPY_DELAY(task_count, COMPACT, compact);
+						COPY_DELAY(task_count, WPCOPY, wpcopy);
+						COPY_DELAY(task_count, IRQ, irq);
 						set_mem_count(&tasks[task_count]);
 						set_mem_delay_total(&tasks[task_count]);
 						task_count++;
@@ -912,10 +873,10 @@ static int compare_tasks(const void *a, const void *b)
 		return 0;
 	}

-	total1 = *(unsigned long long *)((char *)t1 + cfg.sort_field->total_offset);
-	total2 = *(unsigned long long *)((char *)t2 + cfg.sort_field->total_offset);
-	count1 = *(unsigned long long *)((char *)t1 + cfg.sort_field->count_offset);
-	count2 = *(unsigned long long *)((char *)t2 + cfg.sort_field->count_offset);
+	total1 = t1->delays[cfg.sort_field->type].delay_total;
+	total2 = t2->delays[cfg.sort_field->type].delay_total;
+	count1 = t1->delays[cfg.sort_field->type].count;
+	count2 = t2->delays[cfg.sort_field->type].count;

 	avg1 = average_ms(total1, count1);
 	avg2 = average_ms(total2, count2);
@@ -929,22 +890,17 @@ static int compare_tasks(const void *a, const void *b)
 static void field_delay_max_and_ts(const struct task_info *task, const struct field_desc *field,
 				     unsigned long long *max_ns, struct __kernel_timespec *max_ts)
 {
-	if (!field || !field->max_offset) {
+	if (!field || !field->has_max) {
 		*max_ns = 0;
 		if (max_ts)
 			memset(max_ts, 0, sizeof(*max_ts));
 		return;
 	}

-	*max_ns = *(unsigned long long *)((char *)task + field->max_offset);
+	*max_ns = task->delays[field->type].delay_max;

-	if (max_ts) {
-		if (field->max_ts_offset)
-			*max_ts = *(struct __kernel_timespec *)((char *)task +
-							       field->max_ts_offset);
-		else
-			memset(max_ts, 0, sizeof(*max_ts));
-	}
+	if (max_ts)
+		*max_ts = task->delays[field->type].delay_max_ts;
 }

 /* Get delay values for a specific field */
@@ -954,15 +910,15 @@ static void get_field_delay_values(const struct task_info *task, const struct fi
 {
 	unsigned long long total, count, max;

-	if (!field || !field->max_offset) {
+	if (!field) {
 		*avg_ms = 0;
 		*max_ms = 0;
 		memset(max_ts, 0, sizeof(*max_ts));
 		return;
 	}

-	total = *(unsigned long long *)((char *)task + field->total_offset);
-	count = *(unsigned long long *)((char *)task + field->count_offset);
+	total = task->delays[field->type].delay_total;
+	count = task->delays[field->type].count;
 	*avg_ms = average_ms(total, count);

 	field_delay_max_and_ts(task, field, &max, max_ts);
@@ -1180,18 +1136,18 @@ static void display_results(int psi_ret)
 				avg_ms, max_ms, format_kernel_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
-				TASK_AVG(tasks[i], mem),
-				TASK_AVG(tasks[i], swapin),
-				TASK_AVG(tasks[i], freepages),
-				TASK_AVG(tasks[i], thrashing),
-				TASK_AVG(tasks[i], compact),
-				TASK_AVG(tasks[i], wpcopy));
+				TASK_AVG(tasks[i], MEM),
+				TASK_AVG(tasks[i], SWAPIN),
+				TASK_AVG(tasks[i], FREEPAGES),
+				TASK_AVG(tasks[i], THRASHING),
+				TASK_AVG(tasks[i], COMPACT),
+				TASK_AVG(tasks[i], WPCOPY));
 		} else {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_DEFAULT,
-				TASK_AVG(tasks[i], cpu),
-				TASK_AVG(tasks[i], blkio),
-				TASK_AVG(tasks[i], irq),
-				TASK_AVG(tasks[i], mem));
+				TASK_AVG(tasks[i], CPU),
+				TASK_AVG(tasks[i], BLKIO),
+				TASK_AVG(tasks[i], IRQ),
+				TASK_AVG(tasks[i], MEM));
 		}
 	}

-- 
2.25.1
