Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462A65192;
	Tue,  8 Sep 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879364; cv=none; b=dLDYHlvi4dvG9zLJ9BYtEiPzoBzv93UZLjm11BMaNBXZqCH3z1UNWD06T0rLYhHj4+tTXfwBH1TV3Tty5Ucj04deGLYQVAgX5Sooe6+Arwb9Bw3JeUtO5EzdSxiXpqjGBLM2PAEFKddeTGa2yhX4RO9zxJpeWZpUvnUh5KMkaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879364; c=relaxed/simple;
	bh=Fcv+iyXUnXWuykGBo5+YD3Q51HV55hyKENwdr5078ps=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=pHJXxq8AZedHP4N62MmaeZOMoBzrJFnR3R1Z+tfuDzRsTqJlqnhaL+CMvWjdBDhs2DpN4ViNFJ6BvrQDPbId/A16sthzjxDtySqjiCINBTw0cJfKJQ7uLmnDzRsPFquWXMXxqOhlbzPsIIMUQMDHwXNi6dxrBIZPVt+6huvmoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hfRnw3dMgz8Xrrc;
	Tue, 08 Sep 2026 22:55:48 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 688EtdPp026410;
	Tue, 8 Sep 2026 22:55:39 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 8 Sep 2026 22:55:42 +0800 (CST)
X-Zmail-TransId: 2afb6aa021eec4c-54f8b
X-Mailer: Zmail v1.0
Message-ID: <202609082255427023Af08lQaz3vuCYwHhRVaq@zte.com.cn>
In-Reply-To: <20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn>
References: 20260908225056266qjyBORsOReFvHLEQ3NKtR@zte.com.cn
Date: Tue, 8 Sep 2026 22:55:42 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDMvMyB2NF0gZGVsYXl0b3A6IHNvcnQgYnkgbWF4IGRlbGF5IHRvIGhpZ2hsaWdodCB0b3AgbGF0ZW5jeSBwcm9jZXNzZXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 688EtdPp026410
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 08 Sep 2026 22:55:48 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA021F4.000/4hfRnw3dMgz8Xrrc

From: Wang Yaxin <wang.yaxin@zte.com.cn>

When using -t/--type option, sort tasks by the maximum delay value of
the selected type in descending order (largest delay first).

This enables quickly identifying the top N processes with the highest
delay spikes, which is essential for diagnosing latency problems by
pinpointing which processes contributed most to system delays.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
---
 Documentation/accounting/delay-accounting.rst | 87 ++++++++++++++-----
 Documentation/sphinx/maintainers_include.py   |  2 +-
 tools/accounting/delaytop.c                   | 71 ++++++++++++---
 tools/accounting/getdelays.c                  |  5 ++
 4 files changed, 131 insertions(+), 34 deletions(-)

diff --git a/Documentation/accounting/delay-accounting.rst b/Documentation/accounting/delay-accounting.rst
index e209c46241b0..d6cfe52f66f3 100644
--- a/Documentation/accounting/delay-accounting.rst
+++ b/Documentation/accounting/delay-accounting.rst
@@ -152,28 +152,28 @@ Basic usage with default settings (sorts by CPU delay, shows top 20 tasks, refre
 	IRQ full:       0.0%/   0.0%/   0.0%/       0(ms)
 	[o]sort [M]memverbose [q]quit
 	Top 20 processes (sorted by cpu delay):
-		PID      TGID  COMMAND           CPU(ms)   IO(ms)  IRQ(ms)  MEM(ms)
+	PID      TGID  COMMAND           CPU(ms)   IO(ms)  IRQ(ms)  MEM(ms)
 	------------------------------------------------------------------------
-		110       110  kworker/15:0H-s   27.91     0.00     0.00     0.00
-		57        57  cpuhp/7            3.18     0.00     0.00     0.00
-		99        99  cpuhp/14           2.97     0.00     0.00     0.00
-		51        51  cpuhp/6            0.90     0.00     0.00     0.00
-		44        44  kworker/4:0H-sy    0.80     0.00     0.00     0.00
-		60        60  ksoftirqd/7        0.74     0.00     0.00     0.00
-		76        76  idle_inject/10     0.31     0.00     0.00     0.00
-		100       100  idle_inject/14     0.30     0.00     0.00     0.00
-		1309      1309  systemsettings     0.29     0.00     0.00     0.00
-		45        45  cpuhp/5            0.22     0.00     0.00     0.00
-		63        63  cpuhp/8            0.20     0.00     0.00     0.00
-		87        87  cpuhp/12           0.18     0.00     0.00     0.00
-		93        93  cpuhp/13           0.17     0.00     0.00     0.00
-		1265      1265  acpid              0.17     0.00     0.00     0.00
-		1552      1552  sshd               0.17     0.00     0.00     0.00
-		2584      2584  sddm-helper        0.16     0.00     0.00     0.00
-		1284      1284  rtkit-daemon       0.15     0.00     0.00     0.00
-		1326      1326  nde-netfilter      0.14     0.00     0.00     0.00
-		27        27  cpuhp/2            0.13     0.00     0.00     0.00
-		631       631  kworker/11:2-rc    0.11     0.00     0.00     0.00
+	110       110  kworker/15:0H-s   27.91     0.00     0.00     0.00
+	57        57  cpuhp/7            3.18     0.00     0.00     0.00
+	99        99  cpuhp/14           2.97     0.00     0.00     0.00
+	51        51  cpuhp/6            0.90     0.00     0.00     0.00
+	44        44  kworker/4:0H-sy    0.80     0.00     0.00     0.00
+	60        60  ksoftirqd/7        0.74     0.00     0.00     0.00
+	76        76  idle_inject/10     0.31     0.00     0.00     0.00
+	100       100  idle_inject/14     0.30     0.00     0.00     0.00
+	1309      1309  systemsettings     0.29     0.00     0.00     0.00
+	45        45  cpuhp/5            0.22     0.00     0.00     0.00
+	63        63  cpuhp/8            0.20     0.00     0.00     0.00
+	87        87  cpuhp/12           0.18     0.00     0.00     0.00
+	93        93  cpuhp/13           0.17     0.00     0.00     0.00
+	1265      1265  acpid              0.17     0.00     0.00     0.00
+	1552      1552  sshd               0.17     0.00     0.00     0.00
+	2584      2584  sddm-helper        0.16     0.00     0.00     0.00
+	1284      1284  rtkit-daemon       0.15     0.00     0.00     0.00
+	1326      1326  nde-netfilter      0.14     0.00     0.00     0.00
+	27        27  cpuhp/2            0.13     0.00     0.00     0.00
+	631       631  kworker/11:2-rc    0.11     0.00     0.00     0.00

 Interactive keyboard controls during runtime::

@@ -181,7 +181,7 @@ Interactive keyboard controls during runtime::
 	M - Toggle display mode (Default/Memory Verbose)
 	q - Quit

-Available sort fields(use -s/--sort or interactive command)::
+Available sort fields (use -s/--sort or interactive command)::

 	cpu(c)       - CPU delay
 	blkio(i)     - I/O delay
@@ -212,3 +212,46 @@ Advanced usage examples::

 	# ./delaytop -d secs
 	Specify refresh interval as secs
+
+	# ./delaytop -t type
+	Display only specified delay type with avg/max/timestamp
+    (rows sorted by MAX for that type, largest first)
+
+
+
+delaytop add delay_max fields to track the maximum delay value for each delay
+type (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy) per task::
+
+	bash# ./delaytop -t cpu
+	System Pressure Information: (avg10/avg60/avg300/total)
+	CPU some:       0.4%/   0.2%/   0.1%/     220(ms)
+	CPU full:       0.0%/   0.0%/   0.0%/       0(ms)
+	Memory full:    0.0%/   0.0%/   0.0%/       0(ms)
+	Memory some:    0.0%/   0.0%/   0.0%/       0(ms)
+	IO full:        0.0%/   0.0%/   0.0%/      12(ms)
+	IO some:        0.0%/   0.0%/   0.0%/      13(ms)
+	IRQ full:       0.0%/   0.0%/   0.0%/       0(ms)
+	[q]quit
+	Top 20 processes (sorted by cpu MAX delay, largest first):
+	PID      TGID  COMMAND          AVG(ms)  MAX(ms)   MAX_TIMESTAMP
+	------------------------------------------------------------------------
+	9         9   kworker/0:0-eve    0.59   16.87  2026-05-27T13:32:39
+	30        30  kworker/2:0H-kb   2.87   11.36  2026-05-27T13:32:36
+	27        27  migration/2       1.05    9.51  2026-05-27T13:32:37
+	50        50  kworker/2:1-eve   0.50    9.13  2026-05-27T13:32:37
+	15        15  rcu_preempt       0.11    8.98  2026-05-27T13:32:37
+	1         1   init              0.17    7.12  2026-05-27T13:32:38
+	67        67  scsi_eh_0         1.20    4.23  2026-05-27T13:32:37
+	23        23  ksoftirqd/1       1.12    3.77  2026-05-27T13:32:36
+	3          3  pool_workqueue    0.72    3.55  2026-05-27T13:32:38
+	62        62  kworker/u20:2-a   0.49    3.03  2026-05-27T13:32:37
+	2          2  kthreadd          0.18    2.82  2026-05-27T13:32:37
+	11        11  kworker/0:1       1.42    2.76  2026-05-27T13:32:36
+	39        39  kworker/u20:0-a   0.10    2.71  2026-05-27T13:32:38
+	17        17  rcu_exp_gp_kthr   0.25    2.65  2026-05-27T13:32:36
+	66        66  kworker/u20:3-e   0.38    2.55  2026-05-27T13:32:37
+	20        20  cpuhp/0           0.53    2.51  2026-05-27T13:32:38
+	28        28  ksoftirqd/2       0.59    2.48  2026-05-27T13:32:36
+	55        55  kworker/u19:1     0.88    2.42  2026-05-27T13:32:36
+	13        13  kworker/R-mm_pe   1.18    2.35  2026-05-27T13:32:36
+	54        54  kworker/3:1-eve   0.14    2.20  2026-05-27T13:32:38
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 7ffe19b5ed58..420c1b1808e7 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -155,7 +155,7 @@ class MaintainersParser:
                 ename = m.group(2)

                 entry = os.path.relpath(self.base_dir + fname, self.app_dir)
-                entry = entry.removesuffix(".rst")
+                entry = entry[:-4] if entry.endswith(".rst") else entry

                 if entry.startswith("../"):
                     html = KERNELDOC_URL + ename + ".html"
diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 7e80f3875a91..af8a1e42a055 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -295,6 +295,7 @@ static void usage(void)
 	"  -C, --container=PATH     Monitor the container at specified cgroup path\n"
 	"  -s, --sort=FIELD         Sort by delay field (default: cpu)\n"
 	"  -t, --type=FIELD         Display only specified delay type with avg/max/timestamp\n"
+	"                           (rows sorted by MAX for that type, largest first)\n"
 	"  -M, --memverbose         Display memory detailed information\n");
 	exit(0);
 }
@@ -838,6 +839,15 @@ static void get_task_delays(void)
 	closedir(dir);
 }

+static void field_delay_max_and_ts(const struct task_info *task,
+				     const struct field_desc *field,
+				     unsigned long long *max_ns,
+				     struct __kernel_timespec *max_ts);
+static void get_field_delay_values(const struct task_info *task,
+				   const struct field_desc *field,
+				   double *avg_ms, double *max_ms,
+				   struct __kernel_timespec *max_ts);
+
 /* Calculate average delay in milliseconds */
 static double average_ms(unsigned long long total, unsigned long long count)
 {
@@ -850,7 +860,7 @@ static double average_ms(unsigned long long total, unsigned long long count)
  * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
  * Returns formatted string or "N/A" if timestamp is zero
  */
-static const char *format_timespec64(struct __kernel_timespec *ts)
+static const char *format_kernel_timespec(struct __kernel_timespec *ts)
 {
 	static char buffer[32];
 	time_t time_sec;
@@ -891,6 +901,16 @@ static int compare_tasks(const void *a, const void *b)
 	unsigned long long count1;
 	unsigned long long count2;
 	double avg1, avg2;
+	unsigned long long max1, max2;
+
+	/* -t/--type: default sort by MAX column for the selected type (descending) */
+	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
+		field_delay_max_and_ts(t1, cfg.type_field, &max1, NULL);
+		field_delay_max_and_ts(t2, cfg.type_field, &max2, NULL);
+		if (max1 != max2)
+			return max2 > max1 ? 1 : -1;
+		return 0;
+	}

 	total1 = *(unsigned long long *)((char *)t1 + cfg.sort_field->total_offset);
 	total2 = *(unsigned long long *)((char *)t2 + cfg.sort_field->total_offset);
@@ -905,6 +925,28 @@ static int compare_tasks(const void *a, const void *b)
 	return 0;
 }

+/* Max delay (ns) and timestamp for field (shared by display and sort) */
+static void field_delay_max_and_ts(const struct task_info *task, const struct field_desc *field,
+				     unsigned long long *max_ns, struct __kernel_timespec *max_ts)
+{
+	if (!field || !field->max_offset) {
+		*max_ns = 0;
+		if (max_ts)
+			memset(max_ts, 0, sizeof(*max_ts));
+		return;
+	}
+
+	*max_ns = *(unsigned long long *)((char *)task + field->max_offset);
+
+	if (max_ts) {
+		if (field->max_ts_offset)
+			*max_ts = *(struct __kernel_timespec *)((char *)task +
+							       field->max_ts_offset);
+		else
+			memset(max_ts, 0, sizeof(*max_ts));
+	}
+}
+
 /* Get delay values for a specific field */
 static void get_field_delay_values(const struct task_info *task, const struct field_desc *field,
 				   double *avg_ms, double *max_ms,
@@ -923,13 +965,8 @@ static void get_field_delay_values(const struct task_info *task, const struct fi
 	count = *(unsigned long long *)((char *)task + field->count_offset);
 	*avg_ms = average_ms(total, count);

-	max = *(unsigned long long *)((char *)task + field->max_offset);
+	field_delay_max_and_ts(task, field, &max, max_ts);
 	*max_ms = (double)max / 1000000.0;  /* Convert nanoseconds to milliseconds */
-
-	if (field->max_ts_offset)
-		*max_ts = *(struct __kernel_timespec *)((char *)task + field->max_ts_offset);
-	else
-		memset(max_ts, 0, sizeof(*max_ts));
 }

 /* Sort tasks by selected field */
@@ -1079,7 +1116,10 @@ static void display_results(int psi_ret)
 	}

 	/* Interacive command */
-	suc &= BOOL_FPRINT(out, "[o]sort [M]memverbose [q]quit\n");
+	if (cfg.display_mode == MODE_TYPE && cfg.type_field)
+		suc &= BOOL_FPRINT(out, "[q]quit\n");
+	else
+		suc &= BOOL_FPRINT(out, "[o]sort [M]memverbose [q]quit\n");
 	if (sort_selected) {
 		if (cfg.display_mode == MODE_MEMVERBOSE)
 			suc &= BOOL_FPRINT(out,
@@ -1090,8 +1130,13 @@ static void display_results(int psi_ret)
 	}

 	/* Task delay output */
-	suc &= BOOL_FPRINT(out, "Top %d processes (sorted by %s delay):\n",
-			cfg.max_processes, get_name_by_field(cfg.sort_field));
+	if (cfg.display_mode == MODE_TYPE && cfg.type_field)
+		suc &= BOOL_FPRINT(out,
+			"Top %d processes (sorted by %s MAX delay, largest first):\n",
+			cfg.max_processes, get_name_by_field(cfg.type_field));
+	else
+		suc &= BOOL_FPRINT(out, "Top %d processes (sorted by %s delay):\n",
+				cfg.max_processes, get_name_by_field(cfg.sort_field));

 	if (cfg.display_mode == MODE_TYPE && cfg.type_field) {
 		/* Display mode for -t option: show only specified type with avg/max/timestamp */
@@ -1132,7 +1177,7 @@ static void display_results(int psi_ret)
 					&max_ms, &max_ts);

 			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
-				avg_ms, max_ms, format_timespec64(&max_ts));
+				avg_ms, max_ms, format_kernel_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
 				TASK_AVG(tasks[i], mem),
@@ -1201,9 +1246,13 @@ static void handle_keypress(char ch, int *running)
 	} else {
 		switch (ch) {
 		case 'o':
+			if (cfg.display_mode == MODE_TYPE)
+				break;
 			sort_selected = 1;
 			break;
 		case 'M':
+			if (cfg.display_mode == MODE_TYPE)
+				break;
 			toggle_display_mode();
 			for (field = sort_fields; field->name != NULL; field++) {
 				if (field->supported_modes & cfg.display_mode) {
diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index 52930629ec3f..263ded4567fd 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -235,6 +235,11 @@ static const char *format_timespec(struct __kernel_timespec *ts)
 	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
 		return "N/A";

+	/* Avoid Y2038 truncation on 32-bit platforms */
+	if (sizeof(time_sec) < sizeof(ts->tv_sec) &&
+	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_sec) * 8 - 1)) - 1))
+		return "N/A";
+
 	time_sec = ts->tv_sec;

 	/* Use thread-safe localtime_r */
-- 
2.47.1
