Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022091.outbound.protection.outlook.com [52.101.96.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023F23C368
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093734; cv=fail; b=brspwd2MQgxz+rkgJN0xIwT9f5Rxfpa5V6GOpX+h6Ck+5DHkT5H3o5p2t9HneNlGKXOlvMFS/CZXdelQRGXa+sNbnkWb5Q+pItXCHi6LR2/iSqkZFjr0evsFALCEVuiOfngd/34w69so2LcLB188O2ZC8lvzqWX+2hpouxQK+WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093734; c=relaxed/simple;
	bh=OyMNltLyfUvTgFphP0GBgLHf69+Z/2WB80vapS4fH0o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YfA1YyB9fHScHZi2fX4CRU4U3IGfXz7X4lZM1mA4tRkjc/csVun+ELMwA2Ow4SQLcFu4akF8yzllrdP5Giom8nr3pcKM4QVZ1pucI0ptISqLr14LE7hxhqsQZUVYkw4hZWX1htB1uOMXU1ibQUgMEeyfLBpf0fzvz0rfBtMbLsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRNFlYQghyShmKn/DkTV5e+k/hJHLV7bXHengNUAog8YU3aB1O0sQ/m0EDjfAIu4bSRb0j2IUpkOR0KgN0LkV2oCDn4+qvpxEb0cC2KnXO1tvmP4+2hvg+mrahyJqpzZyet7Mw+42HTCGe/lwXBznhqwNa6I0Z0rrv/tSpP+ZcFIK9tPoXZSO7If7342LwiXfnFUKTafhHCPFOlclX6fcFuqPxpMywddU5SBOqmzZBOQX9pe2u2BI86wLnCH+D5wTQwV4M95hzV0PF0dcJVSKn5NGOnSvqmTI00D2Mguq0uYK/fuwZJBQIjENokalsJfB4+vsZHkFuVKAa1HCQ9+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=7x/cfAaXxI6lKjaDXyjqU2jCZhFrnkVLkyy9g8GWW2E=;
 b=aTkDnZEEBK7M3D1go4KpC2pr70Cgt4A91YJu/X/JRSZhDPXzDjBNPO3aEmLeEWe9U0HbIZf369pLyKVbpuFJBeP+h9FZYWwGF5Lp0FVFUu+aMCSEt18micRUTk5a2M0O/xFpeYrhnqSxdaEy1aZWf7rk7owIp4djdeeljrvt6jXATi+CCUIGHUjcVd+yEDGqo06vNh79OLMLW+OXNssfpt+oq004Iwwi0TdpwHt35bo6jSB70ZnrM7s77GmsyOfT0sjJ9nTFo5al8dL+9IFnkxtd20HWqCxWc5jCdtUs+QruEvDB2uKQHVs/l/HK+53G7rhHF+P5VvUMVXwgOp37Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7456.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 02:28:48 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 02:28:48 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/debug, sys_info: Introduce SYS_INFO_CPU_RUNQUEUES
Date: Thu, 10 Sep 2026 22:28:44 -0400
Message-ID: <20260911022844.521413-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:408:e5::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 928f5f56-9647-4264-3140-08df0fac68e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EcJ6dqIgt3UovdsU1B8fGeUJbInYAKcwXsu9QfQGAR7KvTqydzBMeHPc80jSvBCvdyk2UJwObE6NI5CoC9h5BETW8T/a8zhFOvwmoQ1TpPEv8bhYvLQR2Hwzq7H5bvQ9xTTiRiSLamk7kCMsEYdO533NXEfhGRwwkh7As0nxSXLZzqge7BBbikBQX4pih89rUdEEuCoVd1Mv3JNZAg6ipoXnMWf1d6P0jYK5QM99lEhaFgMJeaHapITjezO/omXNC1qXtTiwfBYAOOdZiucDidd6jkupig2gMiT/zamCRScHQcT5rZQ0jWzWrBSOeyBr3VI+2vguU/NqIUP+eK98kz88JvJDRmhqj73LBr2eMVF0kHpQgfbK/PlD55l83SvPxf1Fm2tYLg9B2kKuuM05kQtL/KTYPCF6gdsCUpgWrqllEuCxvZgwhhUQgd96fhclap5M+GOXB0os850v+hhtWefFavZtLMM/LmTeMGO+PLlvQkE6Vc9fjVhSkd2Kl+WKHBtJJ1rDMxjkRp9AbLEZhkbQUR6Mgx/5hKaBOY+R0y/3YwaPGLOwwh+1ZgMQv8yquDKzebxAE+Lj925aCwm4J/sNyQc90A7OYDlewd2SUm20IbJq9OfHT6mJsQcnaht7mbHsrWIB6iLOJ9aHr5uTVpDXgna7et3dk7xFZxAnDSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xXsPoao/BiUIsgXCFi0GmxSojRPz+OQ64vraf2nYiNlK1/5h9WAIR8puMupc?=
 =?us-ascii?Q?X67uFf+Gi1oxfiWYfA/7GUJV5DTBBkPAT5btCn7Q28zNwNFIQpGdxAC7qxJM?=
 =?us-ascii?Q?hcdASA3oVW4QCAmtpzV6RoT9DcZ7NKjAyQul0ZC+pkWyuJjPSPOJMsAnDGAt?=
 =?us-ascii?Q?Bm3Irtu8FL63WwL5I3dp0hSuN8ixZyI76dw/mAIpAEmm72CLeDVXn4MQaQ8/?=
 =?us-ascii?Q?nlbMsT10epcDwkWmShNF9b0o4oow7PkEKcwY1Sxe6dwCthxEpNIZQ8TNiLoZ?=
 =?us-ascii?Q?Oyoipl6pFQj/FPZeqzmxHL07F6CZ6wn5SoZA1l5bgz582buqaa2ecb0ILayL?=
 =?us-ascii?Q?qappAf4ttzUPuNAANdwZyO+X5//Eh6GY9HRdMqNfX2oafK9N4cmKufQNEYZD?=
 =?us-ascii?Q?OIhyRMKD5KRaiScI5hsmmb9nJVhUPsRIQe1GAeTVMyZfh82qr+4mvCI+m3TD?=
 =?us-ascii?Q?bWZEfZlVOs+DG4X/Xz4ZBy1eESFdAsixzsss3Xn9UXyEULFjFRf2iaZ20s+s?=
 =?us-ascii?Q?kmoy+0ccZLdAA64B0fp5rcQ+IAqqyRgqxzDGFyyBQLd/NgyFbt740g8gIB1L?=
 =?us-ascii?Q?mrLEmeWmq8a4B62tyfUyfbuHjAYFjAtkvOBYOoQpzL59NP3hvRNxAaoV4OUW?=
 =?us-ascii?Q?8QxcRpENBb+2jT2/2kZ8M+OkrzPBZz7ru+lqmNb3SbLpgHLTxpoxU4fw8F0B?=
 =?us-ascii?Q?EbdoJZ6Zf5JocXJh0KbFnXClU5s9ZAVi+y0wAlMWAI3rHZ5/4hsRC4ubv/U8?=
 =?us-ascii?Q?IA+g385LLqnUEiJdVa+LjJIg2JInnCM+dnY0aPkh7MAeKPGwXznbtzPMyNiD?=
 =?us-ascii?Q?0l/oJFkGq6SvW+nSMc/OHV66EXxoww1Ghsmrf3ODqfXxjqynfSoRBbH0ddGY?=
 =?us-ascii?Q?QHNvrAxB8NfDwvxCEt3AUCxiiKUqhM2v9l8J8UKNfk16xuu0mAlyef0GnEOF?=
 =?us-ascii?Q?YgwIC+E6EvxJTMhNmV6rx8yV08NwM0UZ8uDypSTrD3GR/vfQdzb4zVNETd8o?=
 =?us-ascii?Q?7wVRsVX7D9/pcuGheB79eJVYMj70vo82eImifnE94WVr1q7LE4gDPmCx7fi7?=
 =?us-ascii?Q?iZ7r/KKtqcr4gbxc4T8OJFpzoAwX7n5oidK2SAyhodoKf86Q2+wMS9YhUtyG?=
 =?us-ascii?Q?QGosrCbJl1gqu/xuZkQAjB0LWB7likCO6ew4hAsngxFBieO6YoRtwoTXNRCw?=
 =?us-ascii?Q?WdaQ87P9AvbI4umt4R8rqXkyrANNrRUsMkPDm1M+KTSyp5Xzb/uEYQGw4T3d?=
 =?us-ascii?Q?uGc2ogwgqt7K/3C5Y/c+gHVzCXpTszFWV3G9QwM4qcce9cFFQiQCG/bVGDi1?=
 =?us-ascii?Q?1qlLNBsQ/kh3TWo0QyY2esv8R7dNtHaEofeMhZXGDe3QRa79Om273oXgGwn8?=
 =?us-ascii?Q?YE7va63HLq5V4D5W/JggN7yKOqd+97Kccl1aRZisnxfHbuxBgGPd4qeP1GeE?=
 =?us-ascii?Q?FaEJOG+GZVptFjXhm/u15glYPgmikVa7bTmHoeBF9hR1kIeWbppttXGxQ4Ng?=
 =?us-ascii?Q?SNW7K2eppYsCduxtJmJZGoY+1YB/lQ+BMXiYufgkXMBninYvIIH+yzYWmiKW?=
 =?us-ascii?Q?r7TAyh7rLg5ZLh5HUBXpM0gcjcpDJGBpCJI+ZR65D29EV82pDSHceS7KHxNZ?=
 =?us-ascii?Q?lGv0mNJ3XSfkey/stpHHgF9kXx3NGuzFXd7LsrHKTDB4vyVRKHOc/bWheqRy?=
 =?us-ascii?Q?kGS9DdWJHivdLu+lIbvlNc7VWyQM9l23M27xKPycw4wHCg3AicASXQIm7LPe?=
 =?us-ascii?Q?N6MKdKkuLg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928f5f56-9647-4264-3140-08df0fac68e0
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 02:28:48.1223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr7u+bQ1lFGz8CWO07cRwH/hj/+eFas611USGk8ZZaEJCWPnMm9QeK9hMJqPmwz3Sn4nffCtvE82tYtB3fChAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7456

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
      READ_ONCE() fallback, marking contended queues with
      " (contended)"

    - Wrap the per-CPU inspection in rcu_read_lock() to protect the
      sampled current task (comm and PID) against premature release
      during pr_info() across other callers

    - Omit cgroup group-path printing in print_rq() to avoid acquiring
      cgroup_mutex and traversing kernfs dentries

Suggested-by: Rishil Sandip Shah <rishil1999@outlook.com>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
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
index 72236db67983..d510a23b625d 100644
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
+			curr = rq->curr;
+			raw_spin_rq_unlock(rq);
+		} else {
+			nr_running = READ_ONCE(rq->nr_running);
+			nr_switches = READ_ONCE(rq->nr_switches);
+			curr = READ_ONCE(rq->curr);
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

