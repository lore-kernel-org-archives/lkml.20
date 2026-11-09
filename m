Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219375;
	b=qvEEtbJAiuUggfn0BkbxLb7YaZhQVLATWbwasHmzQ9jf7PZpxbUP659E63YCG0CYvSz7
	 /TgMIcEytH/IqXztwqFmxtr5kMohdbwcCuS/YyIS3S4O5Sr1/CyO1w8VvAlUBgJw2zrwg
	 HJC7NpNVCfh++yxtUA5Scmicn3MLKOnwiMOeJ1H1WiD6MJmUwJ7/C1hR+k0F36W5dobUX
	 Q42dunOWvZogMTLYgQ4AZxnV/MrWXVNYS1y1hweU3Gs4RGRErjFjw8SjsGuCajoQh6dPA
	 U/ewxupDzwJHyxwY047f+FJDTw7sUZjyLW+8FfEtNOnEsfqjqiIGzwyRDQL50yartbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219375;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+giTbXT6EmvdQ1JP9cpKHXzUj0Dv1scyxYh0K4wA7Fk=;
	b=y22OR8cbzbLSC+q/Sxm4PIFnxzJVpMpu1eLtEs1x23UmIVbk4bstSh4MwWMQrvXDmXdZ
	 +hXTOERq7wDgJcscrE4m7J19rEvZrO+9XeK2RMbu6kMUJ8DlQWkNUyjJcC3PzK0F71DDt
	 XN8s7zp1lnwKlrR/Arj5t18EEWbji8mW+8dmFp84x7t+ds6F977jAQCHXyN0my2z+bK0B
	 UQqxUWbIv96gx7Z+MXWXMGomkk7iwSvDhxreUxr8k9wo+YzmpSZkw6rQ6lwTlOQ0k0C/H
	 4qBm1A5KVNqBi1w/ki+7OnD9EnH4ydNMqBSQ3SVJCfc3dZxU/ogJC0EjSQLyYh0Bw4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIF5rZNV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECA606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIF5rZNV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41D91F0089F;
	Mon,  9 Nov 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219374;
	bh=+giTbXT6EmvdQ1JP9cpKHXzUj0Dv1scyxYh0K4wA7Fk=;
	h=From:To:Cc:Subject:Date;
	b=VIF5rZNV2kZRPMtqTFmQVn2L8R8A/AX1ZQGwIBhB4j2U5klebrA5HW6IjRz1suW+Y
	 ynR+DpzCD6j4Vty+mRK6/R2bocoGa5iqUFkF87SOsibwMEbdUvCURn9UwwMDnQiEfa
	 t5M+rNANRXKa61+7Ko6tsU9V9ZEW7yXaJse1BO4JWNlW7cSy65TjNdYWVafkh6sDmm
	 MM2T/fINZHTZHh7pnOR7C09kuQq1UJXMy6gJRIO2O8jaKhxUdNJM9wKLkD17OiSiej
	 TI4hfRUbCfLf+dRFkJqibHZL7h2ZM0ocO5xtjN/xLTYtO9ZjymJorDNPCTeW8eu9i+
	 xQA2Tzm/jcpdA==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Carlier <devnexen@gmail.com>, Mani Tofigh <mt4022@columbia.edu>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Yifan Zhang <yfzhang23@stu.pku.edu.cn>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.4-rc2
Date: Mon, 09 Nov 2026 19:16:10 +0900
Message-ID: <undine-1794219370825486361-2e190190c67cc5a6@undined.local>
X-Mailer: UndineD 0.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Probe fixes for v7.4-rc2:

- kprobes: Fix registration and unregistration error handling
  . Release the instruction slot via arch_remove_kprobe() and propagate
    the error code when arm_kprobe() fails in __register_kprobe() instead
    of leaking the slot and returning 0.
  . Skip rethook_free() and kretprobe holder cleanup in
    unregister_kretprobes() when __unregister_kprobe_top() fails, and
    clear rp->rh after synchronize_rcu() to avoid double free and NULL
    pointer dereferences.
  . Resolve the target address up-front in register_kretprobe() and check
    for re-registration before allocating resources so symbol_name-based
    re-registration does not corrupt the active kretprobe on error.

- kprobes: Fix optprobe state transitions during forced unoptimization
  . Disarm a disabled optprobe in unoptimize_kprobe() when forced
    unoptimization moves it directly to a cooling or freeing list, for
    preventing breakpoint callback of freed probes.
  . Skip disarming unhashed optprobes in the optimizer dispatch path so
    a newly registered probe at the same address does not get disarmed
    (or have freed module text written to).
  . Keep a reused cooling optprobe marked disabled in
    reuse_unused_kprobe() so register_aggr_kprobe() or enable_kprobe()
    properly arms it, and skip redundant force-unoptimization cleanup
    for already-unoptimized cooling probes.

- tracing/probes: Fix symstr buffer overflow and eprobe triggers
  . Format symstr symbols into a temporary buffer and copy only up to the
    reserved field length (updating __data_loc accordingly) to prevent
    overwriting the trace record if a probed pointer changes between
    sizing and storing passes.
  . Install and remove the eprobe event trigger for each trace instance
    file that enables the eprobe rather than only on first enable and
    last disable, so secondary instances record events and disabled
    triggers do not reference freed eprobes.

- samples, docs: Replace printk() with trace_printk() in probe handlers
  . Replace printk() and stack_trace_print() with trace_printk() and
    trace_dump_stack() in kprobe and fprobe sample modules, and depend on
    CONFIG_EVENT_TRACING.
  . Document in kprobes.rst and fprobe.rst that calling printk() directly
    from probe handlers can deadlock on console or scheduler locks and
    recommend trace_printk() instead.


Please pull the latest probes-fixes-v7.4-rc2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.4-rc2

Tag SHA1: a3e7f41511dda9015ed78c636694e25d724212b7
Head SHA1: 1ffd6efb1b58e596ed70f660182803264a4c84d9


David Carlier (1):
      tracing/eprobe: Install the trigger for every instance that enables the eprobe

Mani Tofigh (3):
      kprobes: Disarm disabled optprobe on forced unoptimization
      kprobes: Do not disarm unhashed optprobe on dispatch
      kprobes: Arm reused optprobe on cooling list

Masami Hiramatsu (Google) (6):
      kprobes: Fix error return and slot leak in __register_kprobe()
      kprobes: Fix double free and NULL deref in unregister_kretprobes()
      kprobes: Validate re-registration earlier in register_kretprobe()
      samples/kprobes: Use trace_printk() in probe handlers
      samples/fprobe: Use trace_printk() and trace_dump_stack()
      docs: trace: Warn against using printk() in probe handlers

Yifan Zhang (1):
      tracing/probes: bound symstr stores to reserved length

----
 Documentation/trace/fprobe.rst      |   5 ++
 Documentation/trace/kprobes.rst     |  11 +++-
 kernel/kprobes.c                    | 102 ++++++++++++++++++++++--------------
 kernel/trace/trace_eprobe.c         |  56 +++++++-------------
 kernel/trace/trace_probe_tmpl.h     |  14 ++++-
 samples/Kconfig                     |   4 +-
 samples/fprobe/fprobe_example.c     |  49 ++++-------------
 samples/kprobes/kprobe_example.c    |  69 ++++++++++++------------
 samples/kprobes/kretprobe_example.c |  10 ++--
 9 files changed, 160 insertions(+), 160 deletions(-)
---------------------------
diff --git a/Documentation/trace/fprobe.rst b/Documentation/trace/fprobe.rst
index 46dd46a97c1f..72e0fd9e1808 100644
--- a/Documentation/trace/fprobe.rst
+++ b/Documentation/trace/fprobe.rst
@@ -101,6 +101,11 @@ handler.
 If the entry callback function returns !0, the corresponding exit callback
 will be cancelled.
 
+Since the callbacks run with preemption disabled under ftrace recursion
+protection, calling printk() or pr_*() from these callbacks is not safe
+and can cause deadlocks on console driver or scheduler locks. Use
+trace_printk() instead to log debugging output.
+
 @fp
         This is the address of `fprobe` data structure related to this handler.
         You can embed the `fprobe` to your data structure and get it by
diff --git a/Documentation/trace/kprobes.rst b/Documentation/trace/kprobes.rst
index 5e606730cec6..19c04a91a664 100644
--- a/Documentation/trace/kprobes.rst
+++ b/Documentation/trace/kprobes.rst
@@ -563,8 +563,8 @@ course, has no way to distinguish the deliberately injected faults
 from the accidental ones.  Don't drink and probe.
 
 Kprobes makes no attempt to prevent probe handlers from stepping on
-each other -- e.g., probing printk() and then calling printk() from a
-probe handler.  If a probe handler hits a probe, that second probe's
+each other -- e.g., probing trace_printk() and then calling trace_printk()
+from a probe handler.  If a probe handler hits a probe, that second probe's
 handlers won't be run in that instance, and the kprobe.nmissed member
 of the second probe will be incremented.
 
@@ -579,6 +579,13 @@ which depends on the architecture and optimization state.  (e.g.,
 kretprobe handlers and optimized kprobe handlers run without interrupt
 disabled on x86/x86-64).  In any case, your handler should not yield
 the CPU (e.g., by attempting to acquire a semaphore, or waiting I/O).
+Furthermore, probe handlers should avoid calling printk() or pr_*().
+Because probe handlers execute in atomic/non-preemptible contexts without
+being in NMI context (especially when jump-optimized or ftrace-based),
+calling printk() may attempt to synchronously acquire console driver locks
+or scheduler locks via console_unlock(), risking a deadlock if the probed
+or interrupted context already holds those locks. Use trace_printk()
+instead to safely output messages to the trace buffer.
 
 Since a return probe is implemented by replacing the return
 address with the trampoline's address, stack backtraces and calls
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 2441b9e39343..dddad1e01866 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -633,8 +633,12 @@ static void do_unoptimize_kprobes(struct list_head *unopt_list,
 	list_for_each_entry_safe(op, tmp, free_list, list) {
 		/* Switching from detour code to origin */
 		op->kp.flags &= ~KPROBE_FLAG_OPTIMIZED;
-		/* Disarm probes if marked disabled and not gone */
-		if (kprobe_disabled(&op->kp) && !kprobe_gone(&op->kp))
+		/*
+		 * Disarm probes if marked disabled and not gone. Unhashed probes
+		 * were disarmed before they were unhashed.
+		 */
+		if (kprobe_disabled(&op->kp) && !kprobe_gone(&op->kp) &&
+		    !hlist_unhashed(&op->kp.hlist))
 			arch_disarm_kprobe(&op->kp);
 		if (kprobe_unused(&op->kp)) {
 			/*
@@ -1002,9 +1006,10 @@ static void unoptimize_kprobe(struct kprobe *p, bool force)
 				 * for cooling down (or freeing if unused).
 				 */
 				force_unoptimize_kprobe(op);
+				/* Disarm probes if marked disabled and not gone */
+				if (kprobe_disabled(&op->kp) && !kprobe_gone(&op->kp))
+					arch_disarm_kprobe(&op->kp);
 				if (kprobe_unused(&op->kp)) {
-					if (!kprobe_gone(&op->kp))
-						arch_disarm_kprobe(&op->kp);
 					hlist_del_init_rcu(&op->kp.hlist);
 					list_move(&op->list, &cur->freeing_list);
 				} else {
@@ -1056,6 +1061,10 @@ static int reuse_unused_kprobe(struct kprobe *ap)
 	 */
 	op = container_of(ap, struct optimized_kprobe, kp);
 	WARN_ON_ONCE(list_empty(&op->list));
+	/* Already disarmed, the caller arms it only for an enabled probe */
+	if (optprobe_queued_cooling(op))
+		return 0;
+
 	/* Enable the probe again */
 	ap->flags &= ~KPROBE_FLAG_DISABLED;
 	/* Optimize it again. (remove from 'op->list') */
@@ -1568,7 +1577,8 @@ void kprobe_busy_end(void)
 /* Add the new probe to 'ap->list'. */
 static int add_new_kprobe(struct kprobe *ap, struct kprobe *p)
 {
-	if (p->post_handler)
+	/* A reused cooling probe is already unoptimized */
+	if (p->post_handler && !kprobe_unused(ap))
 		unoptimize_kprobe(ap, true);	/* Fall back to normal kprobe */
 
 	list_add_rcu(&p->list, &ap->list);
@@ -1793,52 +1803,61 @@ _kprobe_addr(kprobe_opcode_t *addr, const char *symbol_name,
 	return addr;
 }
 
-static kprobe_opcode_t *kprobe_addr(struct kprobe *p)
-{
-	bool on_func_entry;
-
-	return _kprobe_addr(p->addr, p->symbol_name, p->offset, &on_func_entry);
-}
-
 /*
  * Check the 'p' is valid and return the aggregator kprobe
  * at the same address.
  */
-static struct kprobe *__get_valid_kprobe(struct kprobe *p)
+static struct kprobe *__get_valid_kprobe_at(struct kprobe *p, kprobe_opcode_t *addr)
 {
+	struct hlist_head *head;
 	struct kprobe *ap, *list_p;
 
 	lockdep_assert_held(&kprobe_mutex);
 
-	ap = get_kprobe(p->addr);
-	if (unlikely(!ap))
+	if (unlikely(!addr))
 		return NULL;
 
-	if (p == ap)
-		return ap;
-
-	list_for_each_entry(list_p, &ap->list, list)
-		if (list_p == p)
-		/* kprobe p is a valid probe */
+	head = &kprobe_table[hash_ptr(addr, KPROBE_HASH_BITS)];
+	hlist_for_each_entry_rcu(ap, head, hlist,
+				 lockdep_is_held(&kprobe_mutex)) {
+		if (ap == p) {
+			p->addr = addr;
 			return ap;
+		}
+		if (ap->addr == addr && kprobe_aggrprobe(ap)) {
+			list_for_each_entry(list_p, &ap->list, list) {
+				if (list_p == p) {
+					p->addr = addr;
+					return ap;
+				}
+			}
+		}
+	}
 
 	return NULL;
 }
 
-/*
- * Warn and return error if the kprobe is being re-registered since
- * there must be a software bug.
- */
-static inline int warn_kprobe_rereg(struct kprobe *p)
+static inline struct kprobe *__get_valid_kprobe(struct kprobe *p)
+{
+	return __get_valid_kprobe_at(p, p->addr);
+}
+
+/* Return error if the kprobe is being re-registered */
+static inline int check_kprobe_rereg_at(struct kprobe *p, kprobe_opcode_t *addr)
 {
 	guard(mutex)(&kprobe_mutex);
 
-	if (WARN_ON_ONCE(__get_valid_kprobe(p)))
+	if (__get_valid_kprobe_at(p, addr))
 		return -EINVAL;
 
 	return 0;
 }
 
+static inline int check_kprobe_rereg(struct kprobe *p)
+{
+	return check_kprobe_rereg_at(p, p->addr);
+}
+
 static int check_ftrace_location(struct kprobe *p)
 {
 	unsigned long addr = (unsigned long)p->addr;
@@ -1946,6 +1965,8 @@ static int __register_kprobe(struct kprobe *p)
 		if (ret) {
 			hlist_del_rcu(&p->hlist);
 			synchronize_rcu();
+			arch_remove_kprobe(p);
+			return ret;
 		}
 	}
 
@@ -1967,7 +1988,7 @@ int register_kprobe(struct kprobe *p)
 		return PTR_ERR(addr);
 	p->addr = addr;
 
-	ret = warn_kprobe_rereg(p);
+	ret = check_kprobe_rereg(p);
 	if (ret)
 		return ret;
 
@@ -2503,20 +2524,19 @@ int register_kretprobe(struct kretprobe *rp)
 	int ret;
 	int i;
 	void *addr;
+	bool on_func_entry;
 
-	ret = kprobe_on_func_entry(rp->kp.addr, rp->kp.symbol_name, rp->kp.offset);
-	if (ret)
-		return ret;
+	addr = _kprobe_addr(rp->kp.addr, rp->kp.symbol_name, rp->kp.offset, &on_func_entry);
+	if (IS_ERR(addr))
+		return PTR_ERR(addr);
 
-	/* If only 'rp->kp.addr' is specified, check reregistering kprobes */
-	if (rp->kp.addr && warn_kprobe_rereg(&rp->kp))
+	if (!on_func_entry)
 		return -EINVAL;
 
-	if (kretprobe_blacklist_size) {
-		addr = kprobe_addr(&rp->kp);
-		if (IS_ERR(addr))
-			return PTR_ERR(addr);
+	if (check_kprobe_rereg_at(&rp->kp, addr))
+		return -EINVAL;
 
+	if (kretprobe_blacklist_size) {
 		for (i = 0; kretprobe_blacklist[i].name != NULL; i++) {
 			if (kretprobe_blacklist[i].addr == addr)
 				return -EINVAL;
@@ -2603,8 +2623,10 @@ void unregister_kretprobes(struct kretprobe **rps, int num)
 	for (i = 0; i < num; i++) {
 		guard(mutex)(&kprobe_mutex);
 
-		if (__unregister_kprobe_top(&rps[i]->kp) < 0)
+		if (__unregister_kprobe_top(&rps[i]->kp) < 0) {
 			rps[i]->kp.addr = NULL;
+			continue;
+		}
 #ifdef CONFIG_KRETPROBE_ON_RETHOOK
 		rethook_free(rps[i]->rh);
 #else
@@ -2616,7 +2638,9 @@ void unregister_kretprobes(struct kretprobe **rps, int num)
 	for (i = 0; i < num; i++) {
 		if (rps[i]->kp.addr) {
 			__unregister_kprobe_bottom(&rps[i]->kp);
-#ifndef CONFIG_KRETPROBE_ON_RETHOOK
+#ifdef CONFIG_KRETPROBE_ON_RETHOOK
+			rps[i]->rh = NULL;
+#else
 			free_rp_inst(rps[i]);
 #endif
 		}
diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
index 998e6390937a..474be2f5ccd9 100644
--- a/kernel/trace/trace_eprobe.c
+++ b/kernel/trace/trace_eprobe.c
@@ -644,37 +644,32 @@ static int enable_trace_eprobe(struct trace_event_call *call,
 {
 	struct trace_probe *tp;
 	struct trace_eprobe *ep;
-	bool enabled;
 	int ret = 0;
 	int cnt = 0;
 
+	if (WARN_ON_ONCE(!file))
+		return -EINVAL;
+
 	tp = trace_probe_primary_from_call(call);
 	if (WARN_ON_ONCE(!tp))
 		return -ENODEV;
-	enabled = trace_probe_is_enabled(tp);
 
 	/* This also changes "enabled" state */
-	if (file) {
-		ret = trace_probe_add_file(tp, file);
-		if (ret)
-			return ret;
-	} else
-		trace_probe_set_flag(tp, TP_FLAG_PROFILE);
-
-	if (enabled)
-		return 0;
+	ret = trace_probe_add_file(tp, file);
+	if (ret)
+		return ret;
 
+	/* The trigger lives in the instance of the file, add it for each file */
 	for_each_trace_eprobe_tp(ep, tp) {
 		ret = enable_eprobe(ep, file);
 		if (ret)
 			break;
-		enabled = true;
 		cnt++;
 	}
 
 	if (ret) {
 		/* Failed to enable one of them. Roll back all */
-		if (enabled) {
+		if (cnt) {
 			/*
 			 * It's a bug if one failed for something other than memory
 			 * not being available but another eprobe succeeded.
@@ -687,10 +682,7 @@ static int enable_trace_eprobe(struct trace_event_call *call,
 					break;
 			}
 		}
-		if (file)
-			trace_probe_remove_file(tp, file);
-		else
-			trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
+		trace_probe_remove_file(tp, file);
 	}
 
 	return ret;
@@ -702,33 +694,21 @@ static int disable_trace_eprobe(struct trace_event_call *call,
 	struct trace_probe *tp;
 	struct trace_eprobe *ep;
 
+	if (WARN_ON_ONCE(!file))
+		return -EINVAL;
+
 	tp = trace_probe_primary_from_call(call);
 	if (WARN_ON_ONCE(!tp))
 		return -ENODEV;
 
-	if (file) {
-		if (!trace_probe_get_file_link(tp, file))
-			return -ENOENT;
-		if (!trace_probe_has_single_file(tp))
-			goto out;
-		trace_probe_clear_flag(tp, TP_FLAG_TRACE);
-	} else
-		trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
+	if (!trace_probe_get_file_link(tp, file))
+		return -ENOENT;
 
-	if (!trace_probe_is_enabled(tp)) {
-		for_each_trace_eprobe_tp(ep, tp)
-			disable_eprobe(ep, file->tr);
-	}
+	for_each_trace_eprobe_tp(ep, tp)
+		disable_eprobe(ep, file->tr);
 
- out:
-	if (file)
-		/*
-		 * Synchronization is done in below function. For perf event,
-		 * file == NULL and perf_trace_event_unreg() calls
-		 * tracepoint_synchronize_unregister() to ensure synchronize
-		 * event. We don't need to care about it.
-		 */
-		trace_probe_remove_file(tp, file);
+	/* Synchronization is done in below function. */
+	trace_probe_remove_file(tp, file);
 
 	return 0;
 }
diff --git a/kernel/trace/trace_probe_tmpl.h b/kernel/trace/trace_probe_tmpl.h
index 8db12f758fda..8acc0f0ebd7a 100644
--- a/kernel/trace/trace_probe_tmpl.h
+++ b/kernel/trace/trace_probe_tmpl.h
@@ -87,15 +87,27 @@ fetch_store_symstrlen(unsigned long addr)
 static nokprobe_inline int
 fetch_store_symstring(unsigned long addr, void *dest, void *base)
 {
+	char namebuf[KSYM_SYMBOL_LEN];
 	int maxlen = get_loc_len(*(u32 *)dest);
 	void *__dest;
+	int len;
 
 	if (unlikely(!maxlen))
 		return -ENOMEM;
 
 	__dest = get_loc_data(dest, base);
+	len = sprint_symbol(namebuf, addr);
+	if (len < 0) {
+		*(u32 *)dest = make_data_loc(0, __dest - base);
+		return 0;
+	}
+
+	len = min(len, maxlen - 1);
+	memcpy(__dest, namebuf, len);
+	((char *)__dest)[len] = '\0';
+	*(u32 *)dest = make_data_loc(len + 1, __dest - base);
 
-	return sprint_symbol(__dest, addr);
+	return len + 1;
 }
 
 /* common part of process_fetch_insn*/
diff --git a/samples/Kconfig b/samples/Kconfig
index 00eed83c07df..744d991ea620 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -71,7 +71,7 @@ config SAMPLE_KOBJECT
 
 config SAMPLE_KPROBES
 	tristate "Build kprobes examples -- loadable modules only"
-	depends on KPROBES && m
+	depends on KPROBES && EVENT_TRACING && m
 	help
 	  This build several kprobes example modules.
 
@@ -88,7 +88,7 @@ config SAMPLE_HW_BREAKPOINT
 
 config SAMPLE_FPROBE
 	tristate "Build fprobe examples -- loadable modules only"
-	depends on FPROBE && m
+	depends on FPROBE && EVENT_TRACING && m
 	help
 	  This builds a fprobe example module. This module has an option 'symbol'.
 	  You can specify a probed symbol or symbols separated with ','.
diff --git a/samples/fprobe/fprobe_example.c b/samples/fprobe/fprobe_example.c
index bfe98ce826f3..3b94839b3199 100644
--- a/samples/fprobe/fprobe_example.c
+++ b/samples/fprobe/fprobe_example.c
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Here's a sample kernel module showing the use of fprobe to dump a
- * stack trace and selected registers when kernel_clone() is called.
+ * stack trace and function entry/exit when kernel_clone() is called.
  *
- * For more information on theory of operation of kprobes, see
- * Documentation/trace/kprobes.rst
+ * For more information on theory of operation of fprobe, see
+ * Documentation/trace/fprobe.rst
  *
- * You will see the trace data in /var/log/messages and on the console
+ * You will see the trace data in /sys/kernel/tracing/trace
  * whenever kernel_clone() is invoked to create a new process.
  */
 
@@ -15,10 +15,9 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/fprobe.h>
-#include <linux/sched/debug.h>
 #include <linux/slab.h>
+#include <linux/trace_printk.h>
 
-#define BACKTRACE_DEPTH 16
 #define MAX_SYMBOL_LEN 4096
 static struct fprobe sample_probe;
 static unsigned long nhit;
@@ -35,34 +34,14 @@ static bool stackdump = true;
 module_param(stackdump, bool, 0644);
 MODULE_PARM_DESC(stackdump, "Enable stackdump.");
 
-static bool use_trace = false;
-module_param(use_trace, bool, 0644);
-MODULE_PARM_DESC(use_trace, "Use trace_printk instead of printk. This is only for debugging.");
-
-static void show_backtrace(void)
-{
-	unsigned long stacks[BACKTRACE_DEPTH];
-	unsigned int len;
-
-	len = stack_trace_save(stacks, BACKTRACE_DEPTH, 2);
-	stack_trace_print(stacks, len, 24);
-}
-
 static int sample_entry_handler(struct fprobe *fp, unsigned long ip,
 				unsigned long ret_ip,
 				struct ftrace_regs *fregs, void *data)
 {
-	if (use_trace)
-		/*
-		 * This is just an example, no kernel code should call
-		 * trace_printk() except when actively debugging.
-		 */
-		trace_printk("Enter <%pS> ip = 0x%p\n", (void *)ip, (void *)ip);
-	else
-		pr_info("Enter <%pS> ip = 0x%p\n", (void *)ip, (void *)ip);
+	trace_printk("Enter <%pS> ip = 0x%p\n", (void *)ip, (void *)ip);
 	nhit++;
 	if (stackdump)
-		show_backtrace();
+		trace_dump_stack(0);
 	return 0;
 }
 
@@ -72,19 +51,11 @@ static void sample_exit_handler(struct fprobe *fp, unsigned long ip,
 {
 	unsigned long rip = ret_ip;
 
-	if (use_trace)
-		/*
-		 * This is just an example, no kernel code should call
-		 * trace_printk() except when actively debugging.
-		 */
-		trace_printk("Return from <%pS> ip = 0x%p to rip = 0x%p (%pS)\n",
-			(void *)ip, (void *)ip, (void *)rip, (void *)rip);
-	else
-		pr_info("Return from <%pS> ip = 0x%p to rip = 0x%p (%pS)\n",
-			(void *)ip, (void *)ip, (void *)rip, (void *)rip);
+	trace_printk("Return from <%pS> ip = 0x%p to rip = 0x%p (%pS)\n",
+		     (void *)ip, (void *)ip, (void *)rip, (void *)rip);
 	nhit++;
 	if (stackdump)
-		show_backtrace();
+		trace_dump_stack(0);
 }
 
 static int __init fprobe_init(void)
diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
index 53ec6c8b8c40..0f516a2b04be 100644
--- a/samples/kprobes/kprobe_example.c
+++ b/samples/kprobes/kprobe_example.c
@@ -6,7 +6,7 @@
  * For more information on theory of operation of kprobes, see
  * Documentation/trace/kprobes.rst
  *
- * You will see the trace data in /var/log/messages and on the console
+ * You will see the trace data in /sys/kernel/tracing/trace
  * whenever kernel_clone() is invoked to create a new process.
  */
 
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/kprobes.h>
+#include <linux/trace_printk.h>
 
 static char symbol[KSYM_NAME_LEN] = "kernel_clone";
 module_param_string(symbol, symbol, KSYM_NAME_LEN, 0644);
@@ -28,39 +29,39 @@ static struct kprobe kp = {
 static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
 {
 #ifdef CONFIG_X86
-	pr_info("<%s> p->addr = 0x%p, ip = %lx, flags = 0x%lx\n",
-		p->symbol_name, p->addr, regs->ip, regs->flags);
+	trace_printk("<%s> p->addr = 0x%p, ip = %lx, flags = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->ip, regs->flags);
 #endif
 #ifdef CONFIG_PPC
-	pr_info("<%s> p->addr = 0x%p, nip = 0x%lx, msr = 0x%lx\n",
-		p->symbol_name, p->addr, regs->nip, regs->msr);
+	trace_printk("<%s> p->addr = 0x%p, nip = 0x%lx, msr = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->nip, regs->msr);
 #endif
 #ifdef CONFIG_MIPS
-	pr_info("<%s> p->addr = 0x%p, epc = 0x%lx, status = 0x%lx\n",
-		p->symbol_name, p->addr, regs->cp0_epc, regs->cp0_status);
+	trace_printk("<%s> p->addr = 0x%p, epc = 0x%lx, status = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->cp0_epc, regs->cp0_status);
 #endif
 #ifdef CONFIG_ARM64
-	pr_info("<%s> p->addr = 0x%p, pc = 0x%lx, pstate = 0x%lx\n",
-		p->symbol_name, p->addr, (long)regs->pc, (long)regs->pstate);
+	trace_printk("<%s> p->addr = 0x%p, pc = 0x%lx, pstate = 0x%lx\n",
+		     p->symbol_name, p->addr, (long)regs->pc, (long)regs->pstate);
 #endif
 #ifdef CONFIG_ARM
-	pr_info("<%s> p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
-		p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
+	trace_printk("<%s> p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
+		     p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
 #endif
 #ifdef CONFIG_RISCV
-	pr_info("<%s> p->addr = 0x%p, pc = 0x%lx, status = 0x%lx\n",
-		p->symbol_name, p->addr, regs->epc, regs->status);
+	trace_printk("<%s> p->addr = 0x%p, pc = 0x%lx, status = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->epc, regs->status);
 #endif
 #ifdef CONFIG_S390
-	pr_info("<%s> p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
-		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
+	trace_printk("<%s> p->addr = 0x%p, ip = 0x%lx, flags = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->psw.addr, regs->flags);
 #endif
 #ifdef CONFIG_LOONGARCH
-	pr_info("<%s> p->addr = 0x%p, era = 0x%lx, estat = 0x%lx\n",
-		p->symbol_name, p->addr, regs->csr_era, regs->csr_estat);
+	trace_printk("<%s> p->addr = 0x%p, era = 0x%lx, estat = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->csr_era, regs->csr_estat);
 #endif
 
-	/* A dump_stack() here will give a stack backtrace */
+	/* A trace_dump_stack(0) here will give a stack backtrace */
 	return 0;
 }
 
@@ -69,36 +70,36 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
 				unsigned long flags)
 {
 #ifdef CONFIG_X86
-	pr_info("<%s> p->addr = 0x%p, flags = 0x%lx\n",
-		p->symbol_name, p->addr, regs->flags);
+	trace_printk("<%s> p->addr = 0x%p, flags = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->flags);
 #endif
 #ifdef CONFIG_PPC
-	pr_info("<%s> p->addr = 0x%p, msr = 0x%lx\n",
-		p->symbol_name, p->addr, regs->msr);
+	trace_printk("<%s> p->addr = 0x%p, msr = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->msr);
 #endif
 #ifdef CONFIG_MIPS
-	pr_info("<%s> p->addr = 0x%p, status = 0x%lx\n",
-		p->symbol_name, p->addr, regs->cp0_status);
+	trace_printk("<%s> p->addr = 0x%p, status = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->cp0_status);
 #endif
 #ifdef CONFIG_ARM64
-	pr_info("<%s> p->addr = 0x%p, pstate = 0x%lx\n",
-		p->symbol_name, p->addr, (long)regs->pstate);
+	trace_printk("<%s> p->addr = 0x%p, pstate = 0x%lx\n",
+		     p->symbol_name, p->addr, (long)regs->pstate);
 #endif
 #ifdef CONFIG_ARM
-	pr_info("<%s> p->addr = 0x%p, cpsr = 0x%lx\n",
-		p->symbol_name, p->addr, (long)regs->ARM_cpsr);
+	trace_printk("<%s> p->addr = 0x%p, cpsr = 0x%lx\n",
+		     p->symbol_name, p->addr, (long)regs->ARM_cpsr);
 #endif
 #ifdef CONFIG_RISCV
-	pr_info("<%s> p->addr = 0x%p, status = 0x%lx\n",
-		p->symbol_name, p->addr, regs->epc, regs->status);
+	trace_printk("<%s> p->addr = 0x%p, status = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->epc, regs->status);
 #endif
 #ifdef CONFIG_S390
-	pr_info("<%s> p->addr, 0x%p, flags = 0x%lx\n",
-		p->symbol_name, p->addr, regs->flags);
+	trace_printk("<%s> p->addr = 0x%p, flags = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->flags);
 #endif
 #ifdef CONFIG_LOONGARCH
-	pr_info("<%s> p->addr = 0x%p, estat = 0x%lx\n",
-		p->symbol_name, p->addr, regs->csr_estat);
+	trace_printk("<%s> p->addr = 0x%p, estat = 0x%lx\n",
+		     p->symbol_name, p->addr, regs->csr_estat);
 #endif
 }
 
diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
index 65d6dcafd742..9dd5cf9a7432 100644
--- a/samples/kprobes/kretprobe_example.c
+++ b/samples/kprobes/kretprobe_example.c
@@ -14,9 +14,8 @@
  * Documentation/trace/kprobes.rst
  *
  * Build and insert the kernel module as done in the kprobe example.
- * You will see the trace data in /var/log/messages and on the console
- * whenever the probed function returns. (Some messages may be suppressed
- * if syslogd is configured to eliminate duplicate messages.)
+ * You will see the trace data in /sys/kernel/tracing/trace
+ * whenever the probed function returns.
  */
 
 #include <linux/kernel.h>
@@ -24,6 +23,7 @@
 #include <linux/kprobes.h>
 #include <linux/ktime.h>
 #include <linux/sched.h>
+#include <linux/trace_printk.h>
 
 static char func_name[KSYM_NAME_LEN] = "kernel_clone";
 module_param_string(func, func_name, KSYM_NAME_LEN, 0644);
@@ -63,8 +63,8 @@ static int ret_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
 
 	now = ktime_get();
 	delta = ktime_to_ns(ktime_sub(now, data->entry_stamp));
-	pr_info("%s returned %lu and took %lld ns to execute\n",
-			func_name, retval, (long long)delta);
+	trace_printk("%s returned %lu and took %lld ns to execute\n",
+		     func_name, retval, (long long)delta);
 	return 0;
 }
 NOKPROBE_SYMBOL(ret_handler);
-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


