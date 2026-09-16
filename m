Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21654DE72A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592128; cv=none; b=BlSatk0kw70Zql6h4lFxHs0J0Hj8M8NpF0D8V3kXfnKZftnCRO7pEpLjVfUHlOKx7vv3LG78BliXFd2z7RoYv7YiV3o6FNJ2Z93NHRSuA38rdQEobkdXj5nQ6E5CcCT1a+Pemgn4cTvYgvwg4CP86tejaAL9uwjYfCn9TlolXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592128; c=relaxed/simple;
	bh=IifXA6z7Js+64kQ3m3IzaVse6YYK5UkKjX2pnMEP5vI=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=nPvEd0wZCl++i4l5lXlASsjQQB3mDZ7EcORPDI6ZVaf1RYl1dMkXBcS//wRBwIOsHNqceMdfon7DkrzPq2dKzRtVPbSo2Mw00I0r4ZQPEb1kkG83MlGr4/MYcn4KhpEWDk+rwNrM559TLawAvZHJPQvBMRrrEXS+2RcqSjZB1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gR6uKSYW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MIGmh2Zy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gR6uKSYW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MIGmh2Zy"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789591856; bh=0Kv+XmKNrNJzcrh3lAzQCOL
	ll4CFFgKuzVN1nZhYQpA=; b=gR6uKSYW9Ors5dd7/ZE8hIR4f/py2lA4PECiI1j4XxEqBl1G3w
	c4NumbvS6ub/4QNK6rpp+QwvzfRtKTQNXW5LkUuhzBWL/Ze4xsNye0ZXFMRncVv3LD49oQZyPnJ
	49/mw+EC7Hlfpzc2YefnOGD4iogYGp78UZOloTWQs3VvftPoL4kaZIJdAhaGFmp6TbDQ8KJn4qF
	Jjc8jkvcCuYu8yeYKq+x6fQ3qGYzJ+fC3aoELN37zExIu+fgEMp+C9QXapx/Hn5GtjmxVopNEgt
	NBXFuxiFc++vLVi04R1mBmllgmMdLIyFivHU7hJHPPldGIpOWoH/zORtWDE3XsWf76Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789591856; bh=0Kv+XmKNrNJzcrh3lAzQCOL
	ll4CFFgKuzVN1nZhYQpA=; b=MIGmh2Zy3ycPvMfINk/mi3pThG4GOqluJbXrFhsotXNh/gKhp2
	TX8Tr8xxRP+TS7XO3vyVZiDkjF8OHqRi+fAA==;
Date: Wed, 16 Sep 2026 21:50:57 +0100
From: Bradley Morgan <brads@mainlining.org>
To: atomlin@atomlin.com
CC: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, neelx@suse.com,
 peterz@infradead.org, pmladek@suse.com, rishil1999@outlook.com,
 rostedt@goodmis.org, sean@ashe.io, senozhatsky@chromium.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH=5D_panic=2C_printk=2C_sys=5Finfo=3A?=
 =?US-ASCII?Q?_Introduce_crash=5Fkexec=5Fin=5Fmemory=5Fsys=5Finfo?=
In-Reply-To: <20260916201546.661384-1-atomlin@atomlin.com>
Message-ID: <0142DD0C-92EE-4340-B1DE-2C77AF5848B2@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 16 September 2026 21:15:46 BST, Aaron Tomlin <atomlin@atomlin.com>
wrote:
>When investigating kernel panics, capturing post-mortem diagnostic
>telemetry (e.g. memory zone metrics, lock states, active timers, and
>blocked tasks) is vital for root-cause analysis.
>
>While crash_kexec_post_notifiers allows executing panic notifiers and
>sys_info() before jumping to the kdump kernel, it is frequently avoided
>in production environments due to the risk of watchdog timeouts induced
>by synchronous hardware console emission.
>
>To resolve this dilemma, introduce the crash_kexec_in_memory_sys_info
>boot parameter. When enabled, it captures diagnostic telemetry directly
>into the printk ring buffer entirely in RAM before jumping to
>__crash_kexec(), completing in milliseconds rather than tens of seconds.
>
>To make this safe, fast, and reliable without risking buffer overflow:
>    1.  Scoped console flush suppression
>
>        Provide printk_suppress_console_flush(bool) to clear the console
>        flush mask in printk_get_console_flush_type(). Messages written
>        via vprintk_store() remain in the printk ring buffer in memory
>        and avoid synchronous hardware console emission and waking
>        kthreads.
>
>     2. Scoped ring buffer tail freezing
>
>        Introduce printk_freeze_tail(bool) in printk_ringbuffer. When
>        active, desc_push_tail() and data_push_tail() refuse to advance
>        the tail. If diagnostic logging exhausts available ring buffer
>        headroom, new records are safely dropped, guaranteeing that the
>        initial panic Oops, faulting registers, and primary stack trace
>        are never overwritten.
>
>    3.  Execution sequence reordering
>
>        Reorder __sys_info() so compact, high-signal subsystems (e.g.
>        memory) are collected first, leaving high-volume dumps (all CPU
>        backtraces, full task lists, and ftrace) for last.
>
>    4.  Sensible defaults and fail-safe fallback
>
>        Default to SYS_INFO_IN_MEMORY_DEFAULT if panic_sys_info is not
>        explicitly configured. If __crash_kexec() returns or fails to
>        execute, tail freezing, and console flush suppression are
>        unmasked immediately so emergency output can flush to physical
>        consoles.
>

This looks fun, might review later.


>Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
>---
> .../admin-guide/kernel-parameters.txt         | 10 +++++++++
> include/linux/printk.h                        | 10 +++++++++
> include/linux/sys_info.h                      |  3 +++
> kernel/panic.c                                | 21 +++++++++++++++++--
> kernel/printk/internal.h                      |  4 ++++
> kernel/printk/printk.c                        |  9 ++++++++
> kernel/printk/printk_ringbuffer.c             | 18 ++++++++++++++++
> lib/sys_info.c                                | 20 +++++++++---------
> 8 files changed, 83 insertions(+), 12 deletions(-)
>
>diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>index eb608e5139a6..2b7ee0892151 100644
>--- a/Documentation/admin-guide/kernel-parameters.txt
>+++ b/Documentation/admin-guide/kernel-parameters.txt
>@@ -1037,6 +1037,16 @@ Kernel parameters
> 			Default is enabled if CONFIG_HOTPLUG_PARALLEL=y. Otherwise
> 			the parameter has no effect.
> 
>+	crash_kexec_in_memory_sys_info
>+			[KNL] Collect diagnostic system telemetry (memory,
>+			locks, timers, blocked tasks) into the
>+			printk ring buffer entirely in RAM before jumping to
>+			the kdump kernel. Unlike crash_kexec_post_notifiers,
>+			this option bypasses slow hardware console emission and
>+			avoids running external panic notifiers. The printk ring
>+			buffer tail is also frozen during collection to prevent
>+			telemetry output from overwriting the initial panic Oops.
>+
> 	crash_kexec_post_notifiers
> 			Only jump to kdump kernel after running the panic
> 			notifiers and dumping kmsg. This option increases
>diff --git a/include/linux/printk.h b/include/linux/printk.h
>index f594c1266bfd..b046e51803a7 100644
>--- a/include/linux/printk.h
>+++ b/include/linux/printk.h
>@@ -205,6 +205,8 @@ extern asmlinkage void dump_stack(void) __cold;
> void printk_trigger_flush(void);
> void console_try_replay_all(void);
> void printk_legacy_allow_panic_sync(void);
>+void printk_suppress_console_flush(bool suppress);
>+void printk_freeze_tail(bool freeze);
> extern bool nbcon_device_try_acquire(struct console *con);
> extern void nbcon_device_release(struct console *con);
> void nbcon_atomic_flush_unsafe(void);
>@@ -309,6 +311,14 @@ static inline void printk_legacy_allow_panic_sync(void)
> {
> }
> 
>+static inline void printk_suppress_console_flush(bool suppress)
>+{
>+}
>+
>+static inline void printk_freeze_tail(bool freeze)
>+{
>+}
>+
> static inline bool nbcon_device_try_acquire(struct console *con)
> {
> 	return false;
>diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
>index a5bc3ea3d44b..1f58bdaed945 100644
>--- a/include/linux/sys_info.h
>+++ b/include/linux/sys_info.h
>@@ -17,6 +17,9 @@
> #define SYS_INFO_ALL_BT			0x00000040
> #define SYS_INFO_BLOCKED_TASKS		0x00000080
> 
>+#define SYS_INFO_IN_MEMORY_DEFAULT	(SYS_INFO_MEM | SYS_INFO_LOCKS | \
>+					 SYS_INFO_TIMERS | SYS_INFO_BLOCKED_TASKS)
>+
> void sys_info(unsigned long si_mask);
> unsigned long sys_info_parse_param(char *str);
> 
>diff --git a/kernel/panic.c b/kernel/panic.c
>index 213725b612aa..a7e2101dd968 100644
>--- a/kernel/panic.c
>+++ b/kernel/panic.c
>@@ -62,6 +62,7 @@ static int pause_on_oops;
> static int pause_on_oops_flag;
> static DEFINE_SPINLOCK(pause_on_oops_lock);
> bool crash_kexec_post_notifiers;
>+static bool crash_kexec_in_memory_sys_info;
> int panic_on_warn __read_mostly;
> unsigned long panic_on_taint;
> bool panic_on_taint_nousertaint = false;
>@@ -580,6 +581,7 @@ void vpanic(const char *fmt, va_list args)
> 	long i, i_next = 0, len;
> 	int state = 0;
> 	bool _crash_kexec_post_notifiers = crash_kexec_post_notifiers;
>+	bool _crash_kexec_in_memory_sys_info = crash_kexec_in_memory_sys_info;
> 
> 	if (panic_on_warn) {
> 		/*
>@@ -667,8 +669,22 @@ void vpanic(const char *fmt, va_list args)
> 	 *
> 	 * Bypass the panic_cpu check and call __crash_kexec directly.
> 	 */
>-	if (!_crash_kexec_post_notifiers)
>-		__crash_kexec(NULL);
>+	if (!_crash_kexec_post_notifiers) {
>+		if (_crash_kexec_in_memory_sys_info) {
>+			unsigned long si_mask = panic_print ? : SYS_INFO_IN_MEMORY_DEFAULT;
>+
>+			/* Populate log_buf in RAM without stalling on slow UARTs */
>+			printk_suppress_console_flush(true);
>+			printk_freeze_tail(true);
>+			sys_info(si_mask);
>+			kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
>+			__crash_kexec(NULL);
>+			printk_freeze_tail(false);
>+			printk_suppress_console_flush(false);
>+		} else {
>+			__crash_kexec(NULL);
>+		}
>+	}
> 
> 	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
> 
>@@ -1217,6 +1233,7 @@ core_param(panic, panic_timeout, int, 0644);
> core_param(pause_on_oops, pause_on_oops, int, 0644);
> core_param(panic_on_warn, panic_on_warn, int, 0644);
> core_param(crash_kexec_post_notifiers, crash_kexec_post_notifiers, bool,
> 0644);
>+core_param(crash_kexec_in_memory_sys_info, crash_kexec_in_memory_sys_info, bool, 0644);
> core_param(panic_console_replay, panic_console_replay, bool, 0644);
> 
> static int panic_print_set(const char *val, const struct kernel_param
> *kp)
>diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
>index 85fbf1801cbe..72f0a5d154ec 100644
>--- a/kernel/printk/internal.h
>+++ b/kernel/printk/internal.h
>@@ -186,6 +186,7 @@ struct console_flush_type {
> };
> 
> extern bool console_irqwork_blocked;
>+extern bool console_flush_suppressed;
> 
> /*
>  * Identify which console flushing methods should be used in the context of
>@@ -195,6 +196,9 @@ static inline void printk_get_console_flush_type(struct console_flush_type *ft)
> {
> 	memset(ft, 0, sizeof(*ft));
> 
>+	if (unlikely(READ_ONCE(console_flush_suppressed)))
>+		return;
>+
> 	switch (nbcon_get_default_prio()) {
> 	case NBCON_PRIO_NORMAL:
> 		if (have_nbcon_console && !have_boot_console) {
>diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
>index 3fcdf4b4e2e5..716eb692c5fa 100644
>--- a/kernel/printk/printk.c
>+++ b/kernel/printk/printk.c
>@@ -467,6 +467,15 @@ bool legacy_allow_panic_sync;
> /* Avoid using irq_work when suspending. */
> bool console_irqwork_blocked;
> 
>+bool console_flush_suppressed;
>+EXPORT_SYMBOL_GPL(console_flush_suppressed);
>+
>+void printk_suppress_console_flush(bool suppress)
>+{
>+	WRITE_ONCE(console_flush_suppressed, suppress);
>+}
>+EXPORT_SYMBOL_GPL(printk_suppress_console_flush);
>+
> #ifdef CONFIG_PRINTK
> DECLARE_WAIT_QUEUE_HEAD(log_wait);
> static DECLARE_WAIT_QUEUE_HEAD(legacy_wait);
>diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
>index 85c0c854b3ce..f538c942a349 100644
>--- a/kernel/printk/printk_ringbuffer.c
>+++ b/kernel/printk/printk_ringbuffer.c
>@@ -377,6 +377,14 @@ static struct prb_data_block *to_block(struct prb_data_ring *data_ring,
> 	return (void *)&data_ring->data[DATA_INDEX(data_ring, begin_lpos)];
> }
> 
>+static bool printk_tail_frozen;
>+
>+void printk_freeze_tail(bool freeze)
>+{
>+	WRITE_ONCE(printk_tail_frozen, freeze);
>+}
>+EXPORT_SYMBOL_GPL(printk_freeze_tail);
>+
> /*
>  * Increase the data size to account for data block meta data plus any
>  * padding so that the adjacent data block is aligned on the ID size.
>@@ -678,6 +686,10 @@ static bool data_push_tail(struct printk_ringbuffer *rb, unsigned long lpos)
> 	 */
> 	tail_lpos = atomic_long_read(&data_ring->tail_lpos); /* LMM(data_push_tail:A) */
> 
>+	if (unlikely(READ_ONCE(printk_tail_frozen)) &&
>+	    need_more_space(data_ring, tail_lpos, lpos))
>+		return false;
>+
> 	/*
> 	 * Loop until the tail lpos is at or beyond @lpos. This condition
> 	 * may already be satisfied, resulting in no full memory barrier
>@@ -789,6 +801,9 @@ static bool desc_push_tail(struct printk_ringbuffer *rb,
> 	enum desc_state d_state;
> 	struct prb_desc desc;
> 
>+	if (unlikely(READ_ONCE(printk_tail_frozen)))
>+		return false;
>+
> 	d_state = desc_read(desc_ring, tail_id, &desc, NULL, NULL);
> 
> 	switch (d_state) {
>@@ -935,6 +950,9 @@ static bool desc_reserve(struct printk_ringbuffer *rb, unsigned long *id_out)
> 			 * Make space for the new descriptor by
> 			 * advancing the tail.
> 			 */
>+			if (unlikely(READ_ONCE(printk_tail_frozen)))
>+				return false;
>+
> 			if (!desc_push_tail(rb, id_prev_wrap))
> 				return false;
> 		}
>diff --git a/lib/sys_info.c b/lib/sys_info.c
>index f32a06ec9ed4..06a2e7b0c87b 100644
>--- a/lib/sys_info.c
>+++ b/lib/sys_info.c
>@@ -138,26 +138,26 @@ subsys_initcall(sys_info_sysctl_init);
> 
> static void __sys_info(unsigned long si_mask)
> {
>-	if (si_mask & SYS_INFO_TASKS)
>-		show_state();
>-
> 	if (si_mask & SYS_INFO_MEM)
> 		show_mem();
> 
>-	if (si_mask & SYS_INFO_TIMERS)
>-		sysrq_timer_list_show();
>-
> 	if (si_mask & SYS_INFO_LOCKS)
> 		debug_show_all_locks();
> 
>-	if (si_mask & SYS_INFO_FTRACE)
>-		ftrace_dump(DUMP_ALL);
>+	if (si_mask & SYS_INFO_TIMERS)
>+		sysrq_timer_list_show();
>+
>+	if (si_mask & SYS_INFO_BLOCKED_TASKS)
>+		show_state_filter(TASK_UNINTERRUPTIBLE);
> 
> 	if (si_mask & SYS_INFO_ALL_BT)
> 		trigger_all_cpu_backtrace();
> 
>-	if (si_mask & SYS_INFO_BLOCKED_TASKS)
>-		show_state_filter(TASK_UNINTERRUPTIBLE);
>+	if (si_mask & SYS_INFO_TASKS)
>+		show_state();
>+
>+	if (si_mask & SYS_INFO_FTRACE)
>+		ftrace_dump(DUMP_ALL);
> }
> 
> void sys_info(unsigned long si_mask)
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
