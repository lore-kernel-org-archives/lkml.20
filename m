Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021120.outbound.protection.outlook.com [52.101.95.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693044BEE3C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176770; cv=fail; b=QxqyfgaJMXZkGN1lYDnln6W2chmpA1S44ONdOodRyt15GAYvUgila1/rXAPjscn9yjCoFAJehGR8Z5rxVVeegtGAZ1f5K22zDsLCZawLSthk9RJ61Tvmh+yxIMGi2NeyuH6irnFq7PaGgDDy59cjnX9Roh9BFJQvpQyoQTGuoYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176770; c=relaxed/simple;
	bh=kSfenYpwScp9wWVwk1wwNrsrQHQ8RoiQ7oLrs8TYpow=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p4xdajwb8nMHZLbR5xtqUO15oJckVutjoSPYxAcgwovmRNe1FbgfitFnr7YW9mVpt13pLlcWpx/FUA6JdweYGWm+SC7H6BQd957xQ5+Q97ZAUGr0PTO56y2aaq0Adxm6cwd9j0vqxVF1tWshLrZrwQ+glAKDn9SuO8yW4xO72ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrL5Kflgl6Tbn9bm4Bpjfh8/oY2TkLiuUyhbNGp44yEUQqD+hPkWXuavGj33RrPNeFPz84VjlnPtZVmubfUUULk5lBY+NiXb4GdrM8d3guTxzir/tOMe9Xve8pOq7yhkRFQjf7z9vpSkJYQFlye2pBDU86FvBeHAdHCoFyLpYioHnVyOj/pn9lWjl7ORFXOnslZq0uF8BcoGV8zugIahZngG7ed2xMNA3mIX00HUX5A5nLoj+Isq2GCNUEQ5Rj9zt5926xSMEsDqJM/+PAaLG5jg+VDYw2WyftcogWAlYzwgAhM0YM1h0t9wtv1RyeZhddpn/O/7BFwrFmvV38LHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=wD7h8FyODczxk0/r+gJN3k6SGlHuh8io7TS+Jy59DhQ=;
 b=p9UPSXEOa1rcPHueAktM8c9QPAj0BP6JdzZDBui6mzAvPcrZ7Isdh/04el+qL8M2syoXyVBvMDYxSqxr25E3H1DrMin0eS9gY/QA/m0+97bZ2auRPNSHiVNR5VG/seYPBX+UXbQpH67Jx4sqZKkmKvdabhPd4yw6FnZOlpdjTRgGfMJ6nPFbGTE6sjq5mCrD0LNE5qJkDrz1m6BHvXglfv3is1GMfq+CI/RqhSsZxgjCr+1wBy8T2EElsMuMuK6gezjQ/Nh14Q2xiBBHCnIrLwclhzUSpIFoWdFpH1/wSNGO3VLIxO9Bm5lCQr6AXKb1fgUwjO9L6HSHSlwJqmMY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO3P123MB3513.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 01:32:43 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 01:32:43 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	feng.tang@linux.alibaba.com,
	pmladek@suse.com,
	kprateek.nayak@amd.com,
	atomlin@atomlin.com,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] sched/debug, sys_info: Introduce SYS_INFO_CPU_RUNQUEUES
Date: Fri, 11 Sep 2026 21:32:40 -0400
Message-ID: <20260912013240.545742-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::31) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO3P123MB3513:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d6ca83-fcf8-4ce4-78a3-08df106dbdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	J406LGB09rump1yh85rL/qIdB5VQ5KE3A84U8S+Xo8IM4DXkmL+ftNCowZf8UmicQMH3lG5XKc58NHN/4JZrgsfuzojrsOekDeO8A37cXzMy4e7hnIfONo56mtjyaniqf5JOJPqZFwjnqlpPKfcMh5AH2jPLQjOmZFJWyTEZqir8FR8/iGL0V2eyAEyVm5BwsB5Z+VRzVB4tZFPaFELlW2mZhMu1HVida6PGJwJlvhrX/31dxXNcpPLo0ULuzHRxwzSjnELqsOfC4ebUwTY2RQIWaCAB+WcY8v7xvqvnHgoDIqoAu2ZXUrUQEbt135ouADUvtN1uDVUzs4Fofapiw5ezgl76zyzd0UFmshg4kbjbgpxkLean29XrzGdK39KcVg5Atz/BwhAZtfgL1coEJpLpz3TRYI47BWIjtd7rUWxSBw3328Jbp8+9gQkSkGZIk6Y/YEdtQZ9CeKXCLJ8kCwINW9qOAD/dUXC9cnVl2iYmQ2k+Q4cWnQO712n85b+kCvHzNl7CHDh9y5rPnyqLLUzv+tVjVXcIG8yh2svsfbfy8MIraqunv5iGGTItlPlbx+i978oRnvdei4MI0irmZaHN8y/N1M2LIOtG6Q3fGdVALpUDoSDcd/PZE2tTM2c6qffEgMhTZ/i0O8Q+JYUIy6GarZjJfMYwTTdtGAHTek8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TqNMg9UM8JjnPDIl7fv9vcEe1PjppviaycyLCibsnrEjWisUt9N+iwmdXsYz?=
 =?us-ascii?Q?gyu5Oih1IvjRMExRCokqba0A93t2gxVcpVNtNXYllkfotalVm83H/j7eh4sS?=
 =?us-ascii?Q?gMonH9MpXFkQxIHM0Lc6b0jRNusKZdDMA2XPoIFbG0Lke0kj0ZJZBQALxi2U?=
 =?us-ascii?Q?16kV+yYJDJ8uWSUwUCtMqScQKxHcJ3eIGjj4WZjV/2HB/+iU6kpGTMWjmNUV?=
 =?us-ascii?Q?ByyrUqXlCitxL5azGPg29RDKnhPzOu5ZVP+BMwvyO/yViaMjQizu/qR0tz2f?=
 =?us-ascii?Q?X9pOXSpdx6occP2wwdhDQiAkg6tjx7TSkLL39qR9OQgmNhhvlunIGWGIJXIu?=
 =?us-ascii?Q?onAomDNcrfgempwtAFVukUXEs9b7Tpc3qPu/l1c8uWrYvBD58UaoUCaOWj6N?=
 =?us-ascii?Q?y5y8rY0Xg+80T9TJxroid5nDAbcfgRqSAQlUCFDb8eheUultJS8gf7w+184Q?=
 =?us-ascii?Q?abo60580GkHlhZgLf1B4OK02khlCNW6lH8B9WEfUGTPNrh/hGeAqk+P2sB6j?=
 =?us-ascii?Q?boAPEIo2urnyK+MHC0kzzPy7nciIMfw6Tvq83Rmd+S4NAi+h4o7pRWysezyP?=
 =?us-ascii?Q?h15xRLSFhrDpk7+FwCi1PiLEOa4P6HxGZUDzmmbxTPEPat2YwdLCF/rDPFXI?=
 =?us-ascii?Q?7OJczmmwMUUrc4aXmEsnvNQIKNMqQx09+KOxOGPWuxbAA++R2/MJtKY0FE33?=
 =?us-ascii?Q?Q9UE/qoeVi8mq+Jghe+mL1h71KIRubxEzZrb29hZcZldlDP3O4+QkWXhWMth?=
 =?us-ascii?Q?LidihrubEYV81nrblVFdbao/ICBiHEBzY9CuYA/6O9KV2DBtt0bPKuSRutxx?=
 =?us-ascii?Q?23SlMuJyT0HCWx6WleAC72SPcmTrKrfd6Zxe76vj271qnRdsP7sxeiSY9zLh?=
 =?us-ascii?Q?OJWjiDs5HrJf0OH2aqQBQTF6r2OdD+x5cQjk3a8h3eN/BMjwqAKET/Yjeox1?=
 =?us-ascii?Q?VnvKeaKtzvuaLlfPm4aVplgHDxNyxMpEThwvAIC+EV2csCR0ORkesRxuTIDZ?=
 =?us-ascii?Q?h4QEpYVf9/nyYQtkSLKZMf362DQc/EczRrDSCUOdTbfaOTm1Q2ODAe6uknaa?=
 =?us-ascii?Q?dO+jw97Stfd6BF44jHvx4ZVdBvlTaRdLv5SLq0qV74qIs63Rgn4XKIpQz/DR?=
 =?us-ascii?Q?DxmvkK4D0fXRo9D1KSxTA2l8wPCiTo5SbcaAyHzABqUBKXy3ycY1cglws+Sm?=
 =?us-ascii?Q?ijD1GzbSIZXQw3nz/aqp5TPumKnHI6MvmV5Jw7lv8L3k+waZBFFOvmUBi1W7?=
 =?us-ascii?Q?V/uk83Nn+kci5XRLKkxE4a+m8/lw/t4Dn8qQbCK+X1U44b5Brj8LYfEtimU3?=
 =?us-ascii?Q?gREZMSZspbwqPWJaAKglu00CbHEBYnfmW+pmtNnZ8Ep++vAJHTv8xHqcZTLo?=
 =?us-ascii?Q?bJhHoskyGnw4gNfRBw3FK4V2gxOWStczhSFFuNNVJt1TGZa3Ca+Hz3oe3yFw?=
 =?us-ascii?Q?arslKw5tvjxXj6XPw4wKqg8VJvybLi5dLv/S5XrvjCfuj+PV4VicYyV6NsYp?=
 =?us-ascii?Q?O/PKpVwSuzZ+r6HtVePurWev1K2sfq/2JMoAXg+iVvvR+ATahTXrLcPfhw3q?=
 =?us-ascii?Q?C6dckLiwaGcDb5h7SJpMWqncqLGXd8X6sPs25PIUr7OB8W9Vw4w0VrBNFERV?=
 =?us-ascii?Q?vPDH0Lh2fdyuoNkoawR2QxveJk0m9KRNnmU0/OjzawR0CWzYAkyfEWsTKxQ6?=
 =?us-ascii?Q?anYqtkclfCq1xATpEVKQv19Nx7t3uW90IyJtJgI35qH2Z1MRspEwz4Q0RKY3?=
 =?us-ascii?Q?SDEO3p3PaQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d6ca83-fcf8-4ce4-78a3-08df106dbdec
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 01:32:43.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQ5WQmZhvMYTyDe33ssbKn/B1pPbPrzoalIgFHEVRIqE/QLxB83FBG+y2MYbhF0U5Kldd9n967vW7YaUl6oAKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3513

When investigating kernel panics, inspectability of per-CPU runqueues
and runnable task states is valuable for diagnosing CPU starvation
priority inversion, etc.

While debugfs (/sys/kernel/debug/sched/debug) exposes runqueue metrics
to userspace, these details are not captured during an automated kernel
panic or crash dump. Capturing per-CPU runqueue state directly into
log_buf fills this diagnostic gap for post-mortem crash analysis.

Introduce SYS_INFO_CPU_RUNQUEUES and its corresponding string token
"cpu_runqueues" to panic_sys_info. Add sched_show_runqueues(), modelled
on print_rq(), to emit per-CPU scheduler diagnostics to the kernel log.

Unlike /sys/kernel/debug/sched/debug which dumps all threads assigned to
a CPU, sched_show_runqueues() only emits threads that are actively
running or queued on the runqueue (via task_on_rq_queued() and
task_current()). This keeps the panic log concise, reflects the true
runqueue depth, and prevents overflowing the printk ring buffer on
systems with high thread counts.

Additionally, to guarantee deadlock and memory safety in panic context:
    - Acquire the runqueue lock using raw_spin_rq_trylock() with
      READ_ONCE() and rcu_dereference() fallback, marking contended
      queues with " (contended)"

    - Wrap the per-CPU inspection in rcu_read_lock() to protect the
      sampled current task (comm and PID) against premature release
      during pr_info() across other callers

    - Omit cgroup group-path printing in print_rq() to avoid acquiring
      cgroup_mutex and traversing kernfs dentries

Suggested-by: Rishil Sandip Shah <rishil1999@outlook.com>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
Changes since v1:

 - Resolved Sparse __rcu address space warnings by accessing rq->curr
   via rcu_dereference() in sched_show_runqueues()

 - Link to v1: https://lore.kernel.org/lkml/20260911022844.521413-1-atomlin@atomlin.com/
---
 Documentation/admin-guide/sysctl/kernel.rst |  1 +
 include/linux/sched/debug.h                 |  1 +
 include/linux/sys_info.h                    |  1 +
 kernel/sched/debug.c                        | 76 +++++++++++++++++----
 lib/sys_info.c                              |  4 ++
 5 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e..0962b031e035 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -939,6 +939,7 @@ locks           print locks info if CONFIG_LOCKDEP is on
 ftrace          print ftrace buffer
 all_bt          print all CPUs backtrace (if available in the arch)
 blocked_tasks   print only tasks in uninterruptible (blocked) state
+cpu_runqueues   print per-CPU runqueue depth and runnable tasks
 =============   ===================================================
 
 
diff --git a/include/linux/sched/debug.h b/include/linux/sched/debug.h
index 35ed4577a6cc..d4276d8ead29 100644
--- a/include/linux/sched/debug.h
+++ b/include/linux/sched/debug.h
@@ -39,6 +39,7 @@ struct seq_file;
 extern void proc_sched_show_task(struct task_struct *p,
 				 struct pid_namespace *ns, struct seq_file *m);
 extern void proc_sched_set_task(struct task_struct *p);
+extern void sched_show_runqueues(void);
 
 /* Attach to any functions which should be ignored in wchan output. */
 #define __sched		__section(".sched.text")
diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
index a5bc3ea3d44b..c571aad1e178 100644
--- a/include/linux/sys_info.h
+++ b/include/linux/sys_info.h
@@ -16,6 +16,7 @@
 #define SYS_INFO_PANIC_CONSOLE_REPLAY	0x00000020
 #define SYS_INFO_ALL_BT			0x00000040
 #define SYS_INFO_BLOCKED_TASKS		0x00000080
+#define SYS_INFO_CPU_RUNQUEUES		0x00000100
 
 void sys_info(unsigned long si_mask);
 unsigned long sys_info_parse_param(char *str);
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..79f6b00974bb 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -968,7 +968,8 @@ static void task_group_path(struct task_group *tg, char *path, int plen)
 #endif
 
 static void
-print_task(struct seq_file *m, struct rq *rq, struct task_struct *p)
+print_task(struct seq_file *m, struct rq *rq, struct task_struct *p,
+	   bool show_cgroup_path)
 {
 	if (task_current(rq, p))
 		SEQ_printf(m, ">R");
@@ -996,13 +997,15 @@ print_task(struct seq_file *m, struct rq *rq, struct task_struct *p)
 	SEQ_printf(m, "   %d      %d", task_node(p), task_numa_group_id(p));
 #endif
 #ifdef CONFIG_CGROUP_SCHED
-	SEQ_printf_task_group_path(m, task_group(p), "        %s")
+	if (show_cgroup_path)
+		SEQ_printf_task_group_path(m, task_group(p), "        %s")
 #endif
 
 	SEQ_printf(m, "\n");
 }
 
-static void print_rq(struct seq_file *m, struct rq *rq, int rq_cpu)
+static void print_rq(struct seq_file *m, struct rq *rq, int rq_cpu,
+		     bool show_cgroup_path, bool queued_only)
 {
 	struct task_struct *g, *p;
 
@@ -1010,31 +1013,36 @@ static void print_rq(struct seq_file *m, struct rq *rq, int rq_cpu)
 	SEQ_printf(m, "runnable tasks:\n");
 	SEQ_printf(m, " S            task   PID     weight       vruntime   eligible    "
 		   "deadline             slice          sum-exec      switches  "
-		   "prio         wait-time        sum-sleep       sum-block"
+		   "prio         wait-time        sum-sleep       sum-block");
 #ifdef CONFIG_NUMA_BALANCING
-		   "  node   group-id"
+	SEQ_printf(m, "  node   group-id");
 #endif
 #ifdef CONFIG_CGROUP_SCHED
-		   "  group-path"
+	if (show_cgroup_path)
+		SEQ_printf(m, "  group-path");
 #endif
-		   "\n");
+	SEQ_printf(m, "\n");
 	SEQ_printf(m, "-------------------------------------------------------"
 		   "------------------------------------------------------"
-		   "------------------------------------------------------"
+		   "------------------------------------------------------");
 #ifdef CONFIG_NUMA_BALANCING
-		   "--------------"
+	SEQ_printf(m, "--------------");
 #endif
 #ifdef CONFIG_CGROUP_SCHED
-		   "--------------"
+	if (show_cgroup_path)
+		SEQ_printf(m, "--------------");
 #endif
-		   "\n");
+	SEQ_printf(m, "\n");
 
 	rcu_read_lock();
 	for_each_process_thread(g, p) {
 		if (task_cpu(p) != rq_cpu)
 			continue;
 
-		print_task(m, rq, p);
+		if (queued_only && !task_current(rq, p) && !task_on_rq_queued(p))
+			continue;
+
+		print_task(m, rq, p, show_cgroup_path);
 	}
 	rcu_read_unlock();
 }
@@ -1234,7 +1242,7 @@ do {									\
 	print_rt_stats(m, cpu);
 	print_dl_stats(m, cpu);
 
-	print_rq(m, rq, cpu);
+	print_rq(m, rq, cpu, true, false);
 	SEQ_printf(m, "\n");
 }
 
@@ -1322,6 +1330,48 @@ void sysrq_sched_debug_show(void)
 	}
 }
 
+void sched_show_runqueues(void)
+{
+	int cpu;
+
+	pr_info("CPU Runqueues:\n");
+	for_each_online_cpu(cpu) {
+		struct rq *rq = cpu_rq(cpu);
+		struct task_struct *curr;
+		unsigned int nr_running;
+		u64 nr_switches;
+		unsigned long flags;
+		bool locked;
+
+		touch_nmi_watchdog();
+		touch_all_softlockup_watchdogs();
+
+		rcu_read_lock();
+		local_irq_save(flags);
+		locked = raw_spin_rq_trylock(rq);
+		if (locked) {
+			nr_running = rq->nr_running;
+			nr_switches = rq->nr_switches;
+			curr = rcu_dereference(rq->curr);
+			raw_spin_rq_unlock(rq);
+		} else {
+			nr_running = READ_ONCE(rq->nr_running);
+			nr_switches = READ_ONCE(rq->nr_switches);
+			curr = rcu_dereference(rq->curr);
+		}
+		local_irq_restore(flags);
+
+		pr_info("cpu#%d: nr_running:%u switches:%llu curr:%s[%d]%s\n",
+			cpu, nr_running, nr_switches,
+			curr ? curr->comm : "<none>",
+			curr ? task_pid_nr(curr) : -1,
+			locked ? "" : " (contended)");
+
+		print_rq(NULL, rq, cpu, false, true);
+		rcu_read_unlock();
+	}
+}
+
 /*
  * This iterator needs some explanation.
  * It returns 1 for the header position.
diff --git a/lib/sys_info.c b/lib/sys_info.c
index f32a06ec9ed4..fc5bfcc121de 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -22,6 +22,7 @@ static const char * const si_names[] = {
 	[ilog2(SYS_INFO_PANIC_CONSOLE_REPLAY)]	= "",
 	[ilog2(SYS_INFO_ALL_BT)]		= "all_bt",
 	[ilog2(SYS_INFO_BLOCKED_TASKS)]		= "blocked_tasks",
+	[ilog2(SYS_INFO_CPU_RUNQUEUES)]		= "cpu_runqueues",
 };
 
 /*
@@ -158,6 +159,9 @@ static void __sys_info(unsigned long si_mask)
 
 	if (si_mask & SYS_INFO_BLOCKED_TASKS)
 		show_state_filter(TASK_UNINTERRUPTIBLE);
+
+	if (si_mask & SYS_INFO_CPU_RUNQUEUES)
+		sched_show_runqueues();
 }
 
 void sys_info(unsigned long si_mask)
-- 
2.55.0

