Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021117.outbound.protection.outlook.com [52.101.95.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05E84BD35B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589766; cv=fail; b=SnV8JaktCnNiQXw7N4qenT2h0DPzqWkr21Qpc6ImMUSIeTjvggA7FceNzMTndKTV8LbsgJQfus/eg/JwwyANOKtAv3pJTPYb52SSv7QEd6zfvFljKdXRUD7RtcWo4JbRsxfqqaTrI7lai0I5mLOA+jxExRA7gw7thdVMztQk9h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589766; c=relaxed/simple;
	bh=D1LDnvzDZszifjrgYkh3iWUPr8EEwEgDxTKsRWCPptU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pvjSZ5lZejf/esgOU3Yi8WxfbU2u8uH0yiGDAWeIyrgDVi1zwGTU0X/GjApY9VEU1COymNd/khiPyZ4MVIuSt0q4RvmGpxDUZdDW6WCKc8pfz+mXOWtWiMcOrS+aAkYQPqP0n8Mi7UL0L4ttUCNL+sqfyDheiBR6nNHdqYNUg/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWe0A/zdzRJWG02aJaStXbck17PIWWsNBIIHmuS5vyv+OlpLxz2qWSLXvgrn+WCOL9I2WNdESjpQWbdpCWwKszNfMa1zTnD7CS8PWtBY1zxkbLmzC3H/vX48ODmHDMinlsuaEsJ9m5cPzARJTAXAFMnzhcMKol7i7CsZPHUaO5oVgTyj5sfSPSQQhfalZaTgvuRIBgMXKY28DNGav6roOCk21T8Kathb9Lj9QI6pqz/bk0q2tmPjpkpHas98dCjTrUwWIecFdthQ2z8r36OU/qtZj0Sp1VrBIpPjD9fPpaBNE8qXihA1Wd51+00j+/uFvnM9ODQzatqSmSurwm4tsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=rB1g2QQtwc495dIzRmJXAAaGqNIq31sA38kbPzadM4Q=;
 b=PhwUa6xd3TQEwyieMe+ItNsN99IrUfcC3TSgM2z1nREd0E8/l0whco1dG44BRccItrYblm2VL05INQtJXEYm4M7UPuRL7Qiw/4uIZJF9SjcK0yXTog6He4ilXfs+GJMkIadCzIvcvZFAR7BDK3Sfk5wKxh2BP8GibDXOAxU21yyAx47NnCTPS7OmSoVofnrFuIzGpHocuEZ8Fqt6WY+dCY6xCH/GTkhFjTOFoZz8Q1k2D+f1ool563e0NKRibz3NuZsTwzPsLMW9kqQkT/c/HcXshjzWgCNRMkRcLOMyUSoLeqKYLlUyGx2Y4In5SkhxTTdtz5m1FzF0lamw9Nof0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO2P123MB6080.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 20:15:51 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 20:15:51 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: akpm@linux-foundation.org,
	pmladek@suse.com
Cc: peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	neelx@suse.com,
	sean@ashe.io,
	rishil1999@outlook.com,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] panic, printk, sys_info: Introduce crash_kexec_in_memory_sys_info
Date: Wed, 16 Sep 2026 16:15:46 -0400
Message-ID: <20260916201546.661384-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::17) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO2P123MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 393ea1f4-c135-4864-f297-08df142f4d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	7G5PYmkntRfOhIULQCRLlU1n2tYkijX5k1jRPoO8UgblWnnQNuJFZs/t6XkCx3wzUsah40ntGiK07X4qZpCRpbSgCtya0Ojc8Jao/3u2RvtHPUyFynfahFAWHqbEZ0M2ZnprwemxUrw1eSt+ccw/b667Vn5eI7MCWWpsrSA75qGl5UBU+w9dWhtX5+RNHfo7Ey0qB/Ljsi0U2vUuC2pYj4wmCDjfHi0ABOPIEJFeoobOz5CPk24K/zrl/ez54q3/6Qhi1htxn5gQJbSGLbiY7izGnr91hrwnDrKVySqqmwKIDtfuSEckX5w0ps9YOyPhfPtr7nY1vAgCiCmP0K6gs5/7vgqzJixOzkphf5FA1nl4q0rCzsnrJaTNik2S0ZsT+8oIo23gJW9rDc7ne3+O/W6DGltvSIz1phaMdm8nJq/lhTRHt4LEm9EoXkFjOuIEOVHhAjbe68FBVIrtO8xyp/hgsOHYQkKVcTmdDW3VzCVWs4pf1YZCo8BbMG7Ag31OpyVDbgKotxRZguBQ9f881UmsVTlcKUQGZqkFJ39DF/S5XAKMBe6clIIxEd35P11E69IKQsFZ47WugnNwpCMlE0ley2d52B8Z9cAkfzqvRxmsvFFhK94DdwEf/ieG3w7DStOknO9BWm7aIHzyZlia11JFYDweObtRQJJkxlQXbAI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MR2jajWpyddu+G7nUNgO9FW0xYNEmxj5RwGG4p+PD0hAT/QxuE+I4V4/2w52?=
 =?us-ascii?Q?7zF9D/MGQULvJ2da1OLPTgCafGf1HYdXztYYF+MGsxE7VPhuZy54//uKkFaN?=
 =?us-ascii?Q?C50sxb7HwR9uZzbxwoOt2g+yGx1i+Oj9BM9YN/gB4L/dwKYv/2mNguwC1+FY?=
 =?us-ascii?Q?bXxD2145rrAqPChfg9dikznMA7BIJNi7aBSzszly10J/rewGPm/jA5y8QNMC?=
 =?us-ascii?Q?pkdHDUtEoA54KgQ8l82nJTFeYksdune19VNhW+MtBnLxSjGHNCpnx9TBsj1B?=
 =?us-ascii?Q?0MjM73TGmzGOLYHqElMSLD1ZyKbPTKrvvWucUToektIcmOQv8mNTScSQEJSd?=
 =?us-ascii?Q?qeVTQWTdr/ZwQ8PIRplNCLMlBwDnEoHObAPIAxj3n3ZWbnMLIiz9l9VSAAhu?=
 =?us-ascii?Q?8/0N23Zt5GW9YdJB0fIjcOLcY18KqWPn8UZ+M+gRgIRrjZHfNeWNl+TJL/Gi?=
 =?us-ascii?Q?36wAnOAkzWyaInl9wYFdSC/B+P3EdgpETaljlHQi0OTA0ClLPk3OQ+ovFA5n?=
 =?us-ascii?Q?haiWSdoZriT88esIbiHEHufWfBEvIJuWaGBLdzjOFf+Mqo8NEXrY7kgaTXx8?=
 =?us-ascii?Q?6TeaBG1Rqa97AoWsjAR1VHOGoMSnJxtamOQMlAF/maZL+knxHSTD8ANAEHul?=
 =?us-ascii?Q?n57ZP90yp/9VRZ+4acl8sJtpDge09uojXSc4vahf79TauVqs3LLOIslztuJh?=
 =?us-ascii?Q?wJVaiioQxze0WWxIHFtEUI6xM6BYocKc1nA9yA+skUV37zKxwfjvP5tZXK8U?=
 =?us-ascii?Q?/nJ4ptBcWOC5CjQ9LrDrowhJbnQRCo/+ec0Fmj5yXZE0lubXEGhtCUm8NyY8?=
 =?us-ascii?Q?Ft1g4SUJ4R+aAWy6rzfsRBJr9XYiXJr8XZ4FocVt52XG4Iyqme9n7if/4PQC?=
 =?us-ascii?Q?s4krV+TXk9X0gnJtbxoRve66W1iEXFEomF8Tp9IfJNezt24KxdYBjKeCF5vN?=
 =?us-ascii?Q?5mIEQ9hEA7FF0+El9wGO/SsiizXMKEilh8s90aQZ4kj/GSjaeSvyA70r96ev?=
 =?us-ascii?Q?Mzh+5mxxrqPfCQhnP0mTe1K1ckFfS4AqhHzLjYd8gI5QMAzUjLhxJO2YXEXh?=
 =?us-ascii?Q?Az+JmSZ2W7I8h1COY7h2nfdY3g96t+EggHdUu1KuyiyEh/gUrxKOKPawwcq1?=
 =?us-ascii?Q?2TNh+4mNRSG/s3jY2lcLmCEBN31JRxWl4KEJPiTN+KOn45U7qMjLfNgPtYyd?=
 =?us-ascii?Q?ojfLGQ/H9XDM1GLdOfinVL76DaRoJvL8lwrDRHJGpltLw4OR5Hen5sJzbnyC?=
 =?us-ascii?Q?9w7zUdwQTlEztdRj+lbwinyLnpzfJk1J2IuvXynBpgBOFnm62tV++wpqBuFV?=
 =?us-ascii?Q?yQL9ekLm4CC81Ozy4MMQGl9/eh4x75cZU1Eb+x6JBvhw6Y9JVbSMWgZC1DYN?=
 =?us-ascii?Q?PKUXb1Vh+tt7c0lztbqeb4i6+cptKSYebUawPM/TJ6mVmaBBNbyxpc80HiSe?=
 =?us-ascii?Q?5K/p8NvDpReWSyo9Amjx8ZOEN+FzbflMP82S5pjF3KpQbMw8xRABTv9F9mWJ?=
 =?us-ascii?Q?DMOjmIabZOHzLK8JHOsXSD1I/JLvRhbU+d+fTfJUFOuo8V9FDYCN3IdhwXtI?=
 =?us-ascii?Q?sguZ33841HRJwMYzL2+Y4uIIyrONNL30eMuE1q1kaaK0W4cFtAgRqldQy/Oh?=
 =?us-ascii?Q?JcNKqG8D5DI9LkQ4HP0kkE/P6406trgb2Zi3FluhWr32EbuQ7swKtGRJaZwy?=
 =?us-ascii?Q?0ENHD+YSKO1y3pA7P0g1DJC3JGbYJE/lvySRX4LxzbKCNqwfTKSWTbdR7Vic?=
 =?us-ascii?Q?ITL0iP/ZOg=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393ea1f4-c135-4864-f297-08df142f4d89
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:15:51.0290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9evxBOfqOd8d0QTAButEludkyhPY5oUY+T87JfYhcdAzyxF4kgIJVF7IXuNzgjlFJktP/lZY4J6zgH5Fg7GCGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB6080

When investigating kernel panics, capturing post-mortem diagnostic
telemetry (e.g. memory zone metrics, lock states, active timers, and
blocked tasks) is vital for root-cause analysis.

While crash_kexec_post_notifiers allows executing panic notifiers and
sys_info() before jumping to the kdump kernel, it is frequently avoided
in production environments due to the risk of watchdog timeouts induced
by synchronous hardware console emission.

To resolve this dilemma, introduce the crash_kexec_in_memory_sys_info
boot parameter. When enabled, it captures diagnostic telemetry directly
into the printk ring buffer entirely in RAM before jumping to
__crash_kexec(), completing in milliseconds rather than tens of seconds.

To make this safe, fast, and reliable without risking buffer overflow:
    1.  Scoped console flush suppression

        Provide printk_suppress_console_flush(bool) to clear the console
        flush mask in printk_get_console_flush_type(). Messages written
        via vprintk_store() remain in the printk ring buffer in memory
        and avoid synchronous hardware console emission and waking
        kthreads.

     2. Scoped ring buffer tail freezing

        Introduce printk_freeze_tail(bool) in printk_ringbuffer. When
        active, desc_push_tail() and data_push_tail() refuse to advance
        the tail. If diagnostic logging exhausts available ring buffer
        headroom, new records are safely dropped, guaranteeing that the
        initial panic Oops, faulting registers, and primary stack trace
        are never overwritten.

    3.  Execution sequence reordering

        Reorder __sys_info() so compact, high-signal subsystems (e.g.
        memory) are collected first, leaving high-volume dumps (all CPU
        backtraces, full task lists, and ftrace) for last.

    4.  Sensible defaults and fail-safe fallback

        Default to SYS_INFO_IN_MEMORY_DEFAULT if panic_sys_info is not
        explicitly configured. If __crash_kexec() returns or fails to
        execute, tail freezing, and console flush suppression are
        unmasked immediately so emergency output can flush to physical
        consoles.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 .../admin-guide/kernel-parameters.txt         | 10 +++++++++
 include/linux/printk.h                        | 10 +++++++++
 include/linux/sys_info.h                      |  3 +++
 kernel/panic.c                                | 21 +++++++++++++++++--
 kernel/printk/internal.h                      |  4 ++++
 kernel/printk/printk.c                        |  9 ++++++++
 kernel/printk/printk_ringbuffer.c             | 18 ++++++++++++++++
 lib/sys_info.c                                | 20 +++++++++---------
 8 files changed, 83 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index eb608e5139a6..2b7ee0892151 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1037,6 +1037,16 @@ Kernel parameters
 			Default is enabled if CONFIG_HOTPLUG_PARALLEL=y. Otherwise
 			the parameter has no effect.
 
+	crash_kexec_in_memory_sys_info
+			[KNL] Collect diagnostic system telemetry (memory,
+			locks, timers, blocked tasks) into the
+			printk ring buffer entirely in RAM before jumping to
+			the kdump kernel. Unlike crash_kexec_post_notifiers,
+			this option bypasses slow hardware console emission and
+			avoids running external panic notifiers. The printk ring
+			buffer tail is also frozen during collection to prevent
+			telemetry output from overwriting the initial panic Oops.
+
 	crash_kexec_post_notifiers
 			Only jump to kdump kernel after running the panic
 			notifiers and dumping kmsg. This option increases
diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd..b046e51803a7 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -205,6 +205,8 @@ extern asmlinkage void dump_stack(void) __cold;
 void printk_trigger_flush(void);
 void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
+void printk_suppress_console_flush(bool suppress);
+void printk_freeze_tail(bool freeze);
 extern bool nbcon_device_try_acquire(struct console *con);
 extern void nbcon_device_release(struct console *con);
 void nbcon_atomic_flush_unsafe(void);
@@ -309,6 +311,14 @@ static inline void printk_legacy_allow_panic_sync(void)
 {
 }
 
+static inline void printk_suppress_console_flush(bool suppress)
+{
+}
+
+static inline void printk_freeze_tail(bool freeze)
+{
+}
+
 static inline bool nbcon_device_try_acquire(struct console *con)
 {
 	return false;
diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
index a5bc3ea3d44b..1f58bdaed945 100644
--- a/include/linux/sys_info.h
+++ b/include/linux/sys_info.h
@@ -17,6 +17,9 @@
 #define SYS_INFO_ALL_BT			0x00000040
 #define SYS_INFO_BLOCKED_TASKS		0x00000080
 
+#define SYS_INFO_IN_MEMORY_DEFAULT	(SYS_INFO_MEM | SYS_INFO_LOCKS | \
+					 SYS_INFO_TIMERS | SYS_INFO_BLOCKED_TASKS)
+
 void sys_info(unsigned long si_mask);
 unsigned long sys_info_parse_param(char *str);
 
diff --git a/kernel/panic.c b/kernel/panic.c
index 213725b612aa..a7e2101dd968 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -62,6 +62,7 @@ static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
+static bool crash_kexec_in_memory_sys_info;
 int panic_on_warn __read_mostly;
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
@@ -580,6 +581,7 @@ void vpanic(const char *fmt, va_list args)
 	long i, i_next = 0, len;
 	int state = 0;
 	bool _crash_kexec_post_notifiers = crash_kexec_post_notifiers;
+	bool _crash_kexec_in_memory_sys_info = crash_kexec_in_memory_sys_info;
 
 	if (panic_on_warn) {
 		/*
@@ -667,8 +669,22 @@ void vpanic(const char *fmt, va_list args)
 	 *
 	 * Bypass the panic_cpu check and call __crash_kexec directly.
 	 */
-	if (!_crash_kexec_post_notifiers)
-		__crash_kexec(NULL);
+	if (!_crash_kexec_post_notifiers) {
+		if (_crash_kexec_in_memory_sys_info) {
+			unsigned long si_mask = panic_print ? : SYS_INFO_IN_MEMORY_DEFAULT;
+
+			/* Populate log_buf in RAM without stalling on slow UARTs */
+			printk_suppress_console_flush(true);
+			printk_freeze_tail(true);
+			sys_info(si_mask);
+			kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
+			__crash_kexec(NULL);
+			printk_freeze_tail(false);
+			printk_suppress_console_flush(false);
+		} else {
+			__crash_kexec(NULL);
+		}
+	}
 
 	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
 
@@ -1217,6 +1233,7 @@ core_param(panic, panic_timeout, int, 0644);
 core_param(pause_on_oops, pause_on_oops, int, 0644);
 core_param(panic_on_warn, panic_on_warn, int, 0644);
 core_param(crash_kexec_post_notifiers, crash_kexec_post_notifiers, bool, 0644);
+core_param(crash_kexec_in_memory_sys_info, crash_kexec_in_memory_sys_info, bool, 0644);
 core_param(panic_console_replay, panic_console_replay, bool, 0644);
 
 static int panic_print_set(const char *val, const struct kernel_param *kp)
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe..72f0a5d154ec 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -186,6 +186,7 @@ struct console_flush_type {
 };
 
 extern bool console_irqwork_blocked;
+extern bool console_flush_suppressed;
 
 /*
  * Identify which console flushing methods should be used in the context of
@@ -195,6 +196,9 @@ static inline void printk_get_console_flush_type(struct console_flush_type *ft)
 {
 	memset(ft, 0, sizeof(*ft));
 
+	if (unlikely(READ_ONCE(console_flush_suppressed)))
+		return;
+
 	switch (nbcon_get_default_prio()) {
 	case NBCON_PRIO_NORMAL:
 		if (have_nbcon_console && !have_boot_console) {
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 3fcdf4b4e2e5..716eb692c5fa 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -467,6 +467,15 @@ bool legacy_allow_panic_sync;
 /* Avoid using irq_work when suspending. */
 bool console_irqwork_blocked;
 
+bool console_flush_suppressed;
+EXPORT_SYMBOL_GPL(console_flush_suppressed);
+
+void printk_suppress_console_flush(bool suppress)
+{
+	WRITE_ONCE(console_flush_suppressed, suppress);
+}
+EXPORT_SYMBOL_GPL(printk_suppress_console_flush);
+
 #ifdef CONFIG_PRINTK
 DECLARE_WAIT_QUEUE_HEAD(log_wait);
 static DECLARE_WAIT_QUEUE_HEAD(legacy_wait);
diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 85c0c854b3ce..f538c942a349 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -377,6 +377,14 @@ static struct prb_data_block *to_block(struct prb_data_ring *data_ring,
 	return (void *)&data_ring->data[DATA_INDEX(data_ring, begin_lpos)];
 }
 
+static bool printk_tail_frozen;
+
+void printk_freeze_tail(bool freeze)
+{
+	WRITE_ONCE(printk_tail_frozen, freeze);
+}
+EXPORT_SYMBOL_GPL(printk_freeze_tail);
+
 /*
  * Increase the data size to account for data block meta data plus any
  * padding so that the adjacent data block is aligned on the ID size.
@@ -678,6 +686,10 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
 	 */
 	tail_lpos = atomic_long_read(&data_ring->tail_lpos); /* LMM(data_push_tail:A) */
 
+	if (unlikely(READ_ONCE(printk_tail_frozen)) &&
+	    need_more_space(data_ring, tail_lpos, lpos))
+		return false;
+
 	/*
 	 * Loop until the tail lpos is at or beyond @lpos. This condition
 	 * may already be satisfied, resulting in no full memory barrier
@@ -789,6 +801,9 @@ static bool desc_push_tail(struct printk_ringbuffer *rb,
 	enum desc_state d_state;
 	struct prb_desc desc;
 
+	if (unlikely(READ_ONCE(printk_tail_frozen)))
+		return false;
+
 	d_state = desc_read(desc_ring, tail_id, &desc, NULL, NULL);
 
 	switch (d_state) {
@@ -935,6 +950,9 @@ static bool desc_reserve(struct printk_ringbuffer *rb, unsigned long *id_out)
 			 * Make space for the new descriptor by
 			 * advancing the tail.
 			 */
+			if (unlikely(READ_ONCE(printk_tail_frozen)))
+				return false;
+
 			if (!desc_push_tail(rb, id_prev_wrap))
 				return false;
 		}
diff --git a/lib/sys_info.c b/lib/sys_info.c
index f32a06ec9ed4..06a2e7b0c87b 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -138,26 +138,26 @@ subsys_initcall(sys_info_sysctl_init);
 
 static void __sys_info(unsigned long si_mask)
 {
-	if (si_mask & SYS_INFO_TASKS)
-		show_state();
-
 	if (si_mask & SYS_INFO_MEM)
 		show_mem();
 
-	if (si_mask & SYS_INFO_TIMERS)
-		sysrq_timer_list_show();
-
 	if (si_mask & SYS_INFO_LOCKS)
 		debug_show_all_locks();
 
-	if (si_mask & SYS_INFO_FTRACE)
-		ftrace_dump(DUMP_ALL);
+	if (si_mask & SYS_INFO_TIMERS)
+		sysrq_timer_list_show();
+
+	if (si_mask & SYS_INFO_BLOCKED_TASKS)
+		show_state_filter(TASK_UNINTERRUPTIBLE);
 
 	if (si_mask & SYS_INFO_ALL_BT)
 		trigger_all_cpu_backtrace();
 
-	if (si_mask & SYS_INFO_BLOCKED_TASKS)
-		show_state_filter(TASK_UNINTERRUPTIBLE);
+	if (si_mask & SYS_INFO_TASKS)
+		show_state();
+
+	if (si_mask & SYS_INFO_FTRACE)
+		ftrace_dump(DUMP_ALL);
 }
 
 void sys_info(unsigned long si_mask)
-- 
2.55.0

