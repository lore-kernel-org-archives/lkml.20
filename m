Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227493;
	b=JYt1u+4wGpDTsrT/KZfrr2q9nelYpC6QfYbfzy73co097LurvEAcz37EUpY/gy2kiBhH
	 LND8A/OXeoZcfyT6LsVvvR0Ze4A0we1Xb89vdCcHkHseGd+riDLUjGgrWzGJFZfAKaBRH
	 fs+f9YGCbKKsKR+7SEfy0A88wGUnf4uAUdFmdTAiE5Q2GXrN3JqAOV+6KOWOn7gZ6NI1X
	 4p/E/ophy3HNVN+RZsxzt0k/atlulDe8BBLN4pWW+xWX71UeoSEwOs6iEbOLcxaZWdrjh
	 e5E+phXrGIcmwfx9zxGiMmN+WxFDJpvJUkTdXnl3Kp0JwgLFiKnxIv7G3TxkPz83k7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227493;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xC1UNh01BUJkZQ/SHQkA4jbwGBRyzgcuhgqWzPCeUL8=;
	b=X2oHmBoSyJaIl3n4is32cbl5F/O5fjSR1qtZRAtgFHXSo3aBrVlfhPloynR2xXIaXRvc
	 MQECZXsWBuNrLfj8K79xCspQuJWSLeGftYo+Pw13RP8nafTUC0aLReODlmBX4J38JpY9S
	 kH4FO1NVMkyrwhYMPViIOFECoBwr/E/M405uq8dfnV4i8q1bse/MRzgKU2qKqYsy12+Si
	 fernkhe5PhNzFZEenRDFbnBkh4uSjzx2H5BOHcBgwH/YJOXxyMvUR2ZB9A8DzCFsXeBha
	 9c3jyOJGDL8hzXm7C+OI2uX/VV5yTiY50pIvZOyvVTLnHdo1ROD/uc/ROAwRygAd+/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i6fE9y9B;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9fDcxtWA;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09C606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E09C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i6fE9y9B;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9fDcxtWA
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794227490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xC1UNh01BUJkZQ/SHQkA4jbwGBRyzgcuhgqWzPCeUL8=;
	b=i6fE9y9B2QH3upcN2C975B9iJ06Z+Nl+GgqC+M8vtJSvLiKDJAniXZSbkKNhgtXFgMR/nq
	9gtrk9uA1Id72uO2KQkdRhUdK7pT5ENj9+MUEIiBo6mUWfrak2OFtDJ+zF/buLOGQ0cxf5
	FGDYxyIozYvzUl1uGMihwXWxuut9jRxQ7Xw+z9K4U5vF+fKuSx8AYah6qkSOmEAP0i6rTt
	BWSwn4fGQu3FdJlpKhMLn9sHVMHX660CnJEkpCrllV7JNUyqDze6Cw/DciKHTCF4RkpObz
	RoMXtX6AxkOVEQFkGX0DMxcnzI7VDAAoznaSurwhDllnerJ0MsLmqGlHza4t6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794227490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xC1UNh01BUJkZQ/SHQkA4jbwGBRyzgcuhgqWzPCeUL8=;
	b=9fDcxtWAttQ2k/en9zv7IV7wnp7cdzgKgN3qVB6YKQ1qqOSDyGVF+hEbMBkVyskHt+K/sl
	qU8/YV+9OD0rA8Bg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Bradley Morgan <include@grrlz.net>,
	"Christian Brauner (Amutable)" <brauner@kernel.org>,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH printk 1/6] printk: Introduce and specify flush reasons
Date: Mon,  9 Nov 2026 13:37:18 +0106
Message-ID: <20261109123127.489676-2-john.ogness@linutronix.de>
In-Reply-To: <20261109123127.489676-1-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for per-console atomic flushing policies by introducing
enum pr_flush_reason to classify various reasons for performing a
printk backlog flush using printk_trigger_flush().

Propagate the reason down to __nbcon_atomic_flush_pending_con(),
where the actually atomic flushing is executed.

Update all printk_trigger_flush() call sites as well as an
explicit lower-level atomic flush calls to specify the reason.

Note that PR_FLUSH_RUNTIME is used for cases where the reason for
the flush is not clearly defined.

No functional change.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 arch/powerpc/kernel/watchdog.c |  2 +-
 include/linux/printk.h         | 22 ++++++++++++++++++++--
 kernel/printk/internal.h       |  4 ++--
 kernel/printk/nbcon.c          | 28 ++++++++++++++++++----------
 kernel/printk/printk.c         | 16 ++++++++--------
 kernel/reboot.c                |  2 +-
 lib/nmi_backtrace.c            |  2 +-
 7 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 582ee3fd71c1b..3d4f9dcb82866 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -365,7 +365,7 @@ static void watchdog_timer_interrupt(int cpu)
 		 *
 		 * See wd_lockup_ipi.
 		 */
-		printk_trigger_flush();
+		printk_trigger_flush(PR_FLUSH_RUNTIME);
 	}
 }
 
diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd4..c669497bd3378 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -145,6 +145,24 @@ void early_printk(const char *s, ...) { }
 
 struct dev_printk_info;
 
+/**
+ * enum pr_flush_reason - Reason for a flush
+ * @PR_FLUSH_RUNTIME:	A flush while the kernel is running
+ * @PR_FLUSH_RESTART:	The kernel is ending, but another instance should
+ *			follow (reboot, kexec)
+ * @PR_FLUSH_HANG:	The kernel is ending and will enter an infinite loop
+ * @PR_FLUSH_KDB:	Printing while KDB is active
+ *
+ * Flush reasons are used to determine if unsafe atomic flushing should be
+ * performed, based on individual console policies.
+ */
+enum pr_flush_reason {
+	PR_FLUSH_RUNTIME,
+	PR_FLUSH_RESTART,
+	PR_FLUSH_HANG,
+	PR_FLUSH_KDB,
+};
+
 #ifdef CONFIG_PRINTK
 asmlinkage __printf(4, 0)
 int vprintk_emit(int facility, int level,
@@ -202,7 +220,7 @@ void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
 extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
 extern asmlinkage void dump_stack(void) __cold;
-void printk_trigger_flush(void);
+void printk_trigger_flush(enum pr_flush_reason reason);
 void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
 extern bool nbcon_device_try_acquire(struct console *con);
@@ -298,7 +316,7 @@ static inline void dump_stack_lvl(const char *log_lvl)
 static inline void dump_stack(void)
 {
 }
-static inline void printk_trigger_flush(void)
+static inline void printk_trigger_flush(enum pr_flush_reason reason)
 {
 }
 static inline void console_try_replay_all(void)
diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 85fbf1801cbe0..7f1f4677609da 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -104,7 +104,7 @@ void nbcon_seq_force(struct console *con, u64 seq);
 bool nbcon_alloc(struct console *con);
 void nbcon_free(struct console *con);
 enum nbcon_prio nbcon_get_default_prio(void);
-void nbcon_atomic_flush_pending(void);
+void nbcon_atomic_flush_pending(enum pr_flush_reason reason);
 bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 				   int cookie, bool use_atomic);
 bool nbcon_kthread_create(struct console *con);
@@ -156,7 +156,7 @@ static inline void nbcon_seq_force(struct console *con, u64 seq) { }
 static inline bool nbcon_alloc(struct console *con) { return false; }
 static inline void nbcon_free(struct console *con) { }
 static inline enum nbcon_prio nbcon_get_default_prio(void) { return NBCON_PRIO_NONE; }
-static inline void nbcon_atomic_flush_pending(void) { }
+static inline void nbcon_atomic_flush_pending(enum pr_flush_reason reason) { }
 static inline bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 						 int cookie, bool use_atomic) { return false; }
 static inline void nbcon_kthread_wake(struct console *con) { }
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 5f8afaca88665..935fd6b86bac7 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1542,6 +1542,7 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
  * __nbcon_atomic_flush_pending_con - Flush specified nbcon console using its
  *					write_atomic() callback
  * @con:			The nbcon console to flush
+ * @reason:			The reason for the flush
  * @stop_seq:			Flush up until this record
  *
  * Return:	0 if @con was flushed up to @stop_seq Otherwise, error code on
@@ -1561,7 +1562,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
  * returned, it cannot be expected that the unfinalized record will become
  * available.
  */
-static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
+static int __nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_reason reason,
+					    u64 stop_seq)
 {
 	struct nbcon_write_context wctxt = { };
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
@@ -1610,6 +1612,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  * nbcon_atomic_flush_pending_con - Flush specified nbcon console using its
  *					write_atomic() callback
  * @con:			The nbcon console to flush
+ * @reason:			The reason for the flush
  * @stop_seq:			Flush up until this record
  *
  * This will stop flushing before @stop_seq if another context has ownership.
@@ -1617,13 +1620,14 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  * are added while this context was flushing and there is no other context
  * to handle the printing, this context must also flush those records.
  */
-static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
+static void nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_reason reason,
+					   u64 stop_seq)
 {
 	struct console_flush_type ft;
 	int err;
 
 again:
-	err = __nbcon_atomic_flush_pending_con(con, stop_seq);
+	err = __nbcon_atomic_flush_pending_con(con, reason, stop_seq);
 
 	/*
 	 * If there was a new owner (-EPERM, -EAGAIN), that context is
@@ -1652,9 +1656,10 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
 /**
  * __nbcon_atomic_flush_pending - Flush all nbcon consoles using their
  *					write_atomic() callback
+ * @reason:			The reason for the flush
  * @stop_seq:			Flush up until this record
  */
-static void __nbcon_atomic_flush_pending(u64 stop_seq)
+static void __nbcon_atomic_flush_pending(enum pr_flush_reason reason, u64 stop_seq)
 {
 	struct console *con;
 	int cookie;
@@ -1672,7 +1677,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (nbcon_seq_read(con) >= stop_seq)
 			continue;
 
-		nbcon_atomic_flush_pending_con(con, stop_seq);
+		nbcon_atomic_flush_pending_con(con, reason, stop_seq);
 	}
 	console_srcu_read_unlock(cookie);
 }
@@ -1681,14 +1686,16 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
  * nbcon_atomic_flush_pending - Flush all nbcon consoles using their
  *				write_atomic() callback
  *
+ * @reason:	The reason for the flush
+ *
  * Flush the backlog up through the currently newest record. Any new
  * records added while flushing will not be flushed if there is another
  * context available to handle the flushing. This is to avoid one CPU
  * printing unbounded because other CPUs continue to add records.
  */
-void nbcon_atomic_flush_pending(void)
+void nbcon_atomic_flush_pending(enum pr_flush_reason reason)
 {
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(reason, prb_next_reserve_seq(prb));
 }
 
 /**
@@ -1701,7 +1708,7 @@ void nbcon_atomic_flush_pending(void)
 void nbcon_atomic_flush_unsafe(void)
 {
 	panic_nbcon_allow_unsafe_takeover = true;
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(PR_FLUSH_HANG, prb_next_reserve_seq(prb));
 	panic_nbcon_allow_unsafe_takeover = false;
 }
 
@@ -1931,7 +1938,8 @@ void nbcon_device_release(struct console *con)
 		 * using the legacy loop.
 		 */
 		if (ft.nbcon_atomic) {
-			__nbcon_atomic_flush_pending_con(con, prb_next_reserve_seq(prb));
+			__nbcon_atomic_flush_pending_con(con, PR_FLUSH_RUNTIME,
+							 prb_next_reserve_seq(prb));
 		} else if (ft.legacy_direct) {
 			if (console_trylock())
 				console_unlock();
@@ -2001,7 +2009,7 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
 	 * The console was locked only when the write_atomic() callback
 	 * was usable.
 	 */
-	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending_con(ctxt->console, PR_FLUSH_KDB, prb_next_reserve_seq(prb));
 }
 
 /**
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 5dbcf8a9909bb..ab9f2d6a6526a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2455,7 +2455,7 @@ asmlinkage int vprintk_emit(int facility, int level,
 	printed_len = vprintk_store(facility, level, dev_info, fmt, args);
 
 	if (ft.nbcon_atomic)
-		nbcon_atomic_flush_pending();
+		nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 
 	if (ft.nbcon_offload)
 		nbcon_kthreads_wake();
@@ -2870,7 +2870,7 @@ static int console_cpu_notify(unsigned int cpu)
 	if (!cpuhp_tasks_frozen) {
 		printk_get_console_flush_type(&ft);
 		if (ft.nbcon_atomic)
-			nbcon_atomic_flush_pending();
+			nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 		if (ft.legacy_direct) {
 			if (console_trylock())
 				console_unlock();
@@ -3561,7 +3561,7 @@ void console_flush_on_panic(enum con_flush_mode mode)
 
 	printk_get_console_flush_type(&ft);
 	if (ft.nbcon_atomic)
-		nbcon_atomic_flush_pending();
+		nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 
 	/* Flush legacy consoles once allowed, even when dangerous. */
 	if (legacy_allow_panic_sync)
@@ -3775,7 +3775,7 @@ static void printk_kthreads_shutdown(void *data)
 		 * The threads may have been stopped while printing a
 		 * backlog. Flush any records left over.
 		 */
-		nbcon_atomic_flush_pending();
+		nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 	}
 	console_list_unlock();
 }
@@ -4537,7 +4537,7 @@ static bool __pr_flush(struct console *con, int timeout_ms, bool reset_on_progre
 	/* Flush the consoles so that records up to @seq are printed. */
 	printk_get_console_flush_type(&ft);
 	if (ft.nbcon_atomic)
-		nbcon_atomic_flush_pending();
+		nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 	if (ft.legacy_direct) {
 		console_lock();
 		console_unlock();
@@ -4732,13 +4732,13 @@ void defer_console_output(void)
  * This is best effort. Depending on the system state, console states,
  * and caller context, no actual flushing may result from this call.
  */
-void printk_trigger_flush(void)
+void printk_trigger_flush(enum pr_flush_reason reason)
 {
 	struct console_flush_type ft;
 
 	printk_get_console_flush_type(&ft);
 	if (ft.nbcon_atomic)
-		nbcon_atomic_flush_pending();
+		nbcon_atomic_flush_pending(reason);
 	if (ft.nbcon_offload)
 		nbcon_kthreads_wake();
 	if (ft.legacy_direct) {
@@ -5090,7 +5090,7 @@ void console_try_replay_all(void)
 	if (console_trylock()) {
 		__console_rewind_all();
 		if (ft.nbcon_atomic)
-			nbcon_atomic_flush_pending();
+			nbcon_atomic_flush_pending(PR_FLUSH_RUNTIME);
 		if (ft.nbcon_offload)
 			nbcon_kthreads_wake();
 		if (ft.legacy_offload)
diff --git a/kernel/reboot.c b/kernel/reboot.c
index a93c23b9e1948..f2f5dfa8e33ce 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -101,7 +101,7 @@ void emergency_restart(void)
 	 * the emergency restart. Move them to the atomic mode.
 	 */
 	nbcon_cpu_emergency_enter();
-	printk_trigger_flush();
+	printk_trigger_flush(PR_FLUSH_RESTART);
 
 	machine_emergency_restart();
 }
diff --git a/lib/nmi_backtrace.c b/lib/nmi_backtrace.c
index f39c9eca88885..925276113d3a0 100644
--- a/lib/nmi_backtrace.c
+++ b/lib/nmi_backtrace.c
@@ -91,7 +91,7 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
 	 * Force flush any remote buffers that might be stuck in IRQ context
 	 * and therefore could not run their irq_work.
 	 */
-	printk_trigger_flush();
+	printk_trigger_flush(PR_FLUSH_RUNTIME);
 
 	clear_bit_unlock(0, &backtrace_flag);
 	put_cpu();
-- 
2.47.3

