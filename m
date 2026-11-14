Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657591;
	b=TCk1X8mkTMkqpbzIO7ynS7dOuN/t+EB/GFUkTAAKzKknvZRrL8wAKBl+0DB8XI0FRwVn
	 EIicmutDpokkNNTNNgLj25lAmOXE9kigrV99dzt6pdUnsCpY4UBV8/7G1DCTcBM9lj7j/
	 UuT1iYLGhBX5F0MNCD5QTQHT0Y3x9QerIdPldz4FIHgj0tDRKtBo+rDgkGZ5ObHaVEhzp
	 g0MKVrJXvlQK6/Hh46RSkEbQbMHjS15CmIsLQCWjL+VQGufaJmck+SC1wbhkqzNTJmtUB
	 a3J/XGQA8nWq95xjhazRO/inCLVW+kB+EqqNrndkI10rL8UWLV6od86twscNSQyTb+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657591;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WjBt+k1eTnYb4RL8WNf5VCpaJgb1kYVPDMmWTkZ9rZw=;
	b=jw13MyYlRA3Fx+7DmciLW3os9UrjeV1OGd+LI+XEQtYaYzHm4eGDxUafQCKgSSoQAPCt
	 J6gum/spX72l9ZPn8B7zzMNNpLwt3TVuf3KCZWYhHdy3pWpHfOmm3Dspktqkp0qQkvx97
	 9xMi1PUvb8qUAz1nit6WTVKe6J0vtl1tSS0oc0GWdfIecgrQox6CbNVJLhaFdgrgk6oZX
	 He6/Qsl+GbnStgeLFYIUVV51DZKj+agrrIwNXf3HSIW+ukzy/yB5h/4WtXBzLr1cw4glg
	 h8+9m3174r0UZBbSBh0vNvv2siHYgae1IPi9i2D9C9OeQk9Mc1AjVPeHPP0lSID4wvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Uv59M1/o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365C606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uv59M1/o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BC91F000C4;
	Sat, 14 Nov 2026 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657591;
	bh=WjBt+k1eTnYb4RL8WNf5VCpaJgb1kYVPDMmWTkZ9rZw=;
	h=From:To:Cc:Subject:Date;
	b=Uv59M1/oRk8+uQ3VL6v9VY1MyRFiW7DcSus9TWzzxiKKOALvgIwPHOLm91OF8XNOd
	 bDBxRB48UxKy7LnlRONuJXdvqdX5bCJ723GJCmUHp/BYDl/5twOGeJBh1ZUwX+Nj72
	 tFBYC2F0+5E0aZAvq8SrgN9l1TKLlcs4JWLI7In5TiuakGfClSXFiEYtFunbfqMbhz
	 RE7hmzGGtI9zom5voK6Q8N6HXmQ2ZEI+XZPcHGorb7F7ckwvanlTgtDSm3Cqi3Trmf
	 kqoQ9XiFzgA8EBvQ0TdL2eBV+VwUwNd/mPK5RsSgoTmK4m/UwDz8xCHDxM+A4T5on7
	 02nxbNkj/EaVg==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Wenwen Fu <wenwfu@qti.qualcomm.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v7.4-rc3
Date: Sat, 14 Nov 2026 20:59:48 +0900
Message-ID: <undine-1794657588291434559-96c5b78098cb703a@undined.local>
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

Probes fixes for v7.4-rc3:

- kprobes: Fix ftrace ops switching and optprobe state transitions
  . Switch an armed ftrace-based kprobe from kprobe_ftrace_ops to
    kprobe_ipmodify_ops in register_aggr_kprobe() when adding a probe
    with a post_handler, so later disarming does not fail with -ENOENT
    and leave the probe armed.
  . Queue forcibly unoptimized probes onto the generation's cooling_list
    in force_unoptimize_kprobe() so unregister_kprobes() waits for Tasks
    RCU before freeing the optinsn slot, preventing a use-after-free.
  . Skip arch_arm_kprobe() in __arm_kprobe() when a probe is queued for
    unoptimization so the active relative jump instruction is not
    partially overwritten with a breakpoint before the optimizer runs.
  . Re-queue any jump-optimized sibling probe covering a disabled probe's
    address when that probe finishes cooling in
    optprobe_finalize_generation(), matching the freeing_list path.

- tracing/probes: Fix multiprobe lifecycle and boot kprobe setup
  . Return early in setup_boot_kprobe_events() when the kprobe_event=
    boot buffer is empty to avoid contending on event_mutex with
    asynchronous eval-map work during normal boot.
  . Verify that a multiprobe event is neither enabled nor busy before
    unlinking any sibling kprobe, fprobe, uprobe, or eprobe so active
    probes cannot be unlinked and freed via dynamic_events.
  . Register and enable a newly appended fprobe or uprobe immediately
    when the target multiprobe event is already enabled so the probe
    fires and disable or perf cleanup does not act on an unregistered
    probe.
  . Free the temporary event name string with __free(kfree) in
    __trace_uprobe_create() to prevent a memory leak if a subsequent
    allocation fails.

- tracing/probes: Fix BTF parsing and string array fetch handling
  . Compute BTF bitfield byte and bit offsets consistently, select the
    smallest unsigned fetch type covering the bitfield, and size
    FETCH_OP_MOD_BF from that type to prevent an 8-byte out-of-bounds
    write on smaller ring buffer slots.
  . Validate BTF_KIND_PTR and non-NULL BTF_KIND_INT types in
    btf_type_is_char_ptr() and btf_type_is_char_array() before reading
    inner type metadata to avoid misinterpreting byte sizes as type IDs
    or reading out of bounds.
  . Check for FETCH_OP_UDEREF before advancing the fetch instruction slot
    in finalize_fetch_insn() so user-space dereference string arrays emit
    FETCH_OP_ST_USTRING instead of reading kernel memory.
  . Reject string array counts when the preceding fetch operation is not
    a memory dereference so non-dereference string sources ($comm,
    immediate strings, eprobe fields) do not emit invalid
    FETCH_OP_LP_ARRAY loops.

- tracing/eprobe: Fix signed 1-byte field fetch and fprobe target check
  . Use explicit fixed-width integer types (s8/u8, s16/u16, s32/u32) in
    get_event_field() so 1-byte signed event fields are sign-extended
    instead of zero-extended under -funsigned-char.
  . Exclude TRACE_EVENT_FL_FPROBE events in find_and_get_event() so
    eprobes cannot attach to fprobe or tprobe events.

- docs/kprobes: Fix typo in kprobes documentation
  . Remove a stray closing parenthesis in Documentation/trace/kprobes.rst.


Please pull the latest probes-fixes-v7.4-rc3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v7.4-rc3

Tag SHA1: 3364c6f7d9f053441dc1f4b9635bab35b0083872
Head SHA1: c15120853eebbda98f3fe1f1e59370439c6c4447


Manuel Ebner (1):
      docs, kprobes: Fix bracket

Masami Hiramatsu (Google) (13):
      kprobes: Switch ftrace ops when adding probe with post_handler
      kprobes: Fix UAF and queue cooling probes on forced unoptimization
      kprobes: Do not overwrite jump instruction when re-arming unoptimizing probe
      kprobes: Re-optimize blocked sibling probe when cooling finishes
      tracing/probes: Check enabled and busy state before unlinking sibling probes
      tracing/probes: Enable newly appended probe when target event is enabled
      tracing/probes: Fix BTF bitfield parsing and out-of-bounds buffer write
      tracing/probes: Fix missing BTF kind checks in char pointer/array helpers
      tracing/eprobe: Fix 1-byte signed field fetch in get_event_field()
      tracing/eprobe: Disallow attaching eprobes to fprobe events
      tracing/probes: Fix user-space dereference string array store type
      tracing/probes: Reject array count on non-dereference string sources
      tracing/uprobes: Fix memory leak of tail in __trace_uprobe_create()

Wenwen Fu (1):
      tracing: skip boot kprobe setup when no events were requested

----
 Documentation/trace/kprobes.rst |   2 +-
 kernel/kprobes.c                | 116 ++++++++++++++++++++++++++++------------
 kernel/trace/trace_eprobe.c     |  27 ++++++----
 kernel/trace/trace_fprobe.c     |  22 ++++----
 kernel/trace/trace_kprobe.c     |  11 ++--
 kernel/trace/trace_probe.c      |  81 ++++++++++++++++++++++------
 kernel/trace/trace_uprobe.c     |  67 +++++++++++++++--------
 7 files changed, 223 insertions(+), 103 deletions(-)
---------------------------
diff --git a/Documentation/trace/kprobes.rst b/Documentation/trace/kprobes.rst
index 19c04a91a664..91b76ed435b1 100644
--- a/Documentation/trace/kprobes.rst
+++ b/Documentation/trace/kprobes.rst
@@ -31,7 +31,7 @@ can trap at almost any kernel code address [1]_, specifying a handler
 routine to be invoked when the breakpoint is hit.
 
 .. [1] some parts of the kernel code can not be trapped, see
-       :ref:`kprobes_blacklist`)
+       :ref:`kprobes_blacklist`
 
 There are currently two types of probes: kprobes, and kretprobes
 (also called return probes).  A kprobe can be inserted on virtually
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index dddad1e01866..f14f7ff45961 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -552,17 +552,13 @@ static unsigned long optimizer_passes;
 
 #define OPTIMIZE_DELAY 5
 
-/*
- * Note: gen->cooling_list is not checked here because it is strictly
- * an in-flight holding list for dispatched generations, so it is always
- * empty in optprobe_cur_gen.
- */
 static bool optprobe_has_queued_probes(void)
 {
 	struct optprobe_generation *gen = &optprobe_gens[optprobe_cur_gen];
 
 	return !list_empty(&gen->optimizing_list) ||
 	       !list_empty(&gen->unoptimizing_list) ||
+	       !list_empty(&gen->cooling_list) ||
 	       !list_empty(&gen->freeing_list);
 }
 
@@ -612,6 +608,7 @@ static void do_unoptimize_kprobes(struct list_head *unopt_list,
 				  struct list_head *cooling_list)
 {
 	struct optimized_kprobe *op, *tmp;
+	LIST_HEAD(unoptimized);
 
 	lockdep_assert_held(&text_mutex);
 	/*
@@ -626,11 +623,13 @@ static void do_unoptimize_kprobes(struct list_head *unopt_list,
 	 */
 	lockdep_assert_cpus_held();
 
-	if (!list_empty(unopt_list))
-		arch_unoptimize_kprobes(unopt_list, free_list);
+	if (list_empty(unopt_list))
+		return;
 
-	/* Loop on 'free_list' for disarming and removing from kprobe hash list */
-	list_for_each_entry_safe(op, tmp, free_list, list) {
+	arch_unoptimize_kprobes(unopt_list, &unoptimized);
+
+	/* Loop on newly unoptimized probes for disarming and hash list removal */
+	list_for_each_entry_safe(op, tmp, &unoptimized, list) {
 		/* Switching from detour code to origin */
 		op->kp.flags &= ~KPROBE_FLAG_OPTIMIZED;
 		/*
@@ -647,6 +646,7 @@ static void do_unoptimize_kprobes(struct list_head *unopt_list,
 			 * (reclaiming is done by do_free_cleaned_kprobes().)
 			 */
 			hlist_del_init_rcu(&op->kp.hlist);
+			list_move(&op->list, free_list);
 		} else {
 			/*
 			 * Keep on cooling_list until the quiescence period
@@ -729,10 +729,17 @@ static void optprobe_finalize_generation(struct optprobe_generation *gen)
 			list_move(&op->list, &optprobe_gens[optprobe_cur_gen].freeing_list);
 			kick_kprobe_optimizer();
 		} else {
+			struct kprobe *_p;
+
 			/* Still in use; now safely disarmed */
 			list_del_init(&op->list);
-			if (!kprobe_disabled(&op->kp))
+			if (!kprobe_disabled(&op->kp)) {
 				optimize_kprobe(&op->kp);
+			} else {
+				_p = get_optimized_kprobe(op->kp.addr);
+				if (unlikely(_p))
+					optimize_kprobe(_p);
+			}
 		}
 	}
 
@@ -1044,10 +1051,11 @@ static void unoptimize_kprobe(struct kprobe *p, bool force)
 	if (force) {
 		/* Forcibly update the code: this is a special case */
 		force_unoptimize_kprobe(op);
+		list_add(&op->list, &cur->cooling_list);
 	} else {
 		list_add(&op->list, &cur->unoptimizing_list);
-		kick_kprobe_optimizer();
 	}
+	kick_kprobe_optimizer();
 }
 
 /* Cancel unoptimizing for reusing */
@@ -1262,6 +1270,19 @@ static void __init kprobe_sysctls_init(void)
 }
 #endif /* CONFIG_SYSCTL */
 
+/* Return true if the probe is queued on unoptimizing lists */
+static bool kprobe_queued_unopt(struct kprobe *p)
+{
+	struct optimized_kprobe *op;
+
+	if (kprobe_aggrprobe(p)) {
+		op = container_of(p, struct optimized_kprobe, kp);
+		if (optprobe_queued_unopt(op))
+			return true;
+	}
+	return false;
+}
+
 /* Put a breakpoint for a probe. */
 static void __arm_kprobe(struct kprobe *p)
 {
@@ -1275,21 +1296,11 @@ static void __arm_kprobe(struct kprobe *p)
 		/* Fallback to unoptimized kprobe */
 		unoptimize_kprobe(_p, true);
 
-	arch_arm_kprobe(p);
+	if (!kprobe_queued_unopt(p))
+		arch_arm_kprobe(p);
 	optimize_kprobe(p);	/* Try to optimize (add kprobe to a list) */
-}
-
-/* Return true if the probe is queued on unoptimizing lists */
-static bool kprobe_queued_unopt(struct kprobe *p)
-{
-	struct optimized_kprobe *op;
-
-	if (kprobe_aggrprobe(p)) {
-		op = container_of(p, struct optimized_kprobe, kp);
-		if (optprobe_queued_unopt(op))
-			return true;
-	}
-	return false;
+	if (unlikely(kprobe_queued_unopt(p)))
+		unoptimize_kprobe(p, true);
 }
 
 /* Remove the breakpoint of a probe. */
@@ -1444,9 +1455,14 @@ static int __disarm_kprobe_ftrace(struct kprobe *p, struct ftrace_ops *ops,
 	(*cnt)--;
 
 	ret = ftrace_set_filter_ip(ops, (unsigned long)p->addr, 1, 0);
-	WARN_ONCE(ret < 0, "Failed to disarm kprobe-ftrace at %pS (error %d)\n",
-		  p->addr, ret);
-	return ret;
+	if (WARN_ONCE(ret < 0, "Failed to disarm kprobe-ftrace at %pS (error %d)\n",
+		      p->addr, ret)) {
+		if (*cnt == 0)
+			register_ftrace_function(ops);
+		(*cnt)++;
+		return ret;
+	}
+	return 0;
 }
 
 static int disarm_kprobe_ftrace(struct kprobe *p)
@@ -1575,17 +1591,13 @@ void kprobe_busy_end(void)
 }
 
 /* Add the new probe to 'ap->list'. */
-static int add_new_kprobe(struct kprobe *ap, struct kprobe *p)
+static void add_new_kprobe(struct kprobe *ap, struct kprobe *p)
 {
 	/* A reused cooling probe is already unoptimized */
 	if (p->post_handler && !kprobe_unused(ap))
 		unoptimize_kprobe(ap, true);	/* Fall back to normal kprobe */
 
 	list_add_rcu(&p->list, &ap->list);
-	if (p->post_handler && !ap->post_handler)
-		ap->post_handler = aggr_post_handler;
-
-	return 0;
 }
 
 /*
@@ -1618,6 +1630,8 @@ static int register_aggr_kprobe(struct kprobe *orig_p, struct kprobe *p)
 {
 	int ret = 0;
 	struct kprobe *ap = orig_p;
+	bool reset_post_handler = false;
+	bool ftrace_switch_ops = false;
 
 	scoped_guard(cpus_read_lock) {
 		/* For preparing optimization, jump_label_text_reserved() is called */
@@ -1664,18 +1678,50 @@ static int register_aggr_kprobe(struct kprobe *orig_p, struct kprobe *p)
 					| KPROBE_FLAG_DISABLED;
 		}
 
+		if (p->post_handler && !ap->post_handler) {
+			reset_post_handler = true;
+			if (kprobe_ftrace(ap) && !kprobes_all_disarmed &&
+			    !kprobe_disabled(ap))
+				ftrace_switch_ops = true;
+			else
+				ap->post_handler = aggr_post_handler;
+		}
+
 		/* Copy the insn slot of 'p' to 'ap'. */
 		copy_kprobe(ap, p);
-		ret = add_new_kprobe(ap, p);
+		if (!ftrace_switch_ops)
+			add_new_kprobe(ap, p);
+	}
+
+	if (ftrace_switch_ops) {
+		/*
+		 * Must switch ftrace ops outside of text_mutex and cpus_read_lock
+		 * to prevent deadlocks when ftrace code modification acquires text_mutex.
+		 */
+		ret = disarm_kprobe_ftrace(ap);
+		if (ret)
+			return ret;
+
+		ap->post_handler = aggr_post_handler;
+		ret = arm_kprobe_ftrace(ap);
+		if (ret) {
+			ap->post_handler = NULL;
+			if (arm_kprobe_ftrace(ap))
+				ap->flags |= KPROBE_FLAG_DISABLED;
+			return ret;
+		}
+		add_new_kprobe(ap, p);
 	}
 
-	if (ret == 0 && kprobe_disabled(ap) && !kprobe_disabled(p)) {
+	if (kprobe_disabled(ap) && !kprobe_disabled(p)) {
 		ap->flags &= ~KPROBE_FLAG_DISABLED;
 		if (!kprobes_all_disarmed) {
 			/* Arm the breakpoint again. */
 			ret = arm_kprobe(ap);
 			if (ret) {
 				ap->flags |= KPROBE_FLAG_DISABLED;
+				if (reset_post_handler)
+					ap->post_handler = NULL;
 				list_del_rcu(&p->list);
 				synchronize_rcu();
 			}
diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
index 474be2f5ccd9..f65393fb1c10 100644
--- a/kernel/trace/trace_eprobe.c
+++ b/kernel/trace/trace_eprobe.c
@@ -94,14 +94,18 @@ static int eprobe_dyn_event_show(struct seq_file *m, struct dyn_event *ev)
 
 static int unregister_trace_eprobe(struct trace_eprobe *ep)
 {
-	/* If other probes are on the event, just unregister eprobe */
-	if (trace_probe_has_sibling(&ep->tp))
-		goto unreg;
-
 	/* Enabled event can not be unregistered */
 	if (trace_probe_is_enabled(&ep->tp))
 		return -EBUSY;
 
+	/* If there's a reference to the dynamic event */
+	if (trace_event_dyn_busy(trace_probe_event_call(&ep->tp)))
+		return -EBUSY;
+
+	/* If other probes are on the event, just unregister eprobe */
+	if (trace_probe_has_sibling(&ep->tp))
+		goto unreg;
+
 	/* Will fail if probe is being used by ftrace or perf */
 	if (trace_probe_unregister_event_call(&ep->tp))
 		return -EBUSY;
@@ -330,21 +334,21 @@ get_event_field(struct fetch_insn *code, void *rec)
 	switch (field->size) {
 	case 1:
 		if (field->is_signed)
-			val = *(char *)addr;
+			val = *(s8 *)addr;
 		else
-			val = *(unsigned char *)addr;
+			val = *(u8 *)addr;
 		break;
 	case 2:
 		if (field->is_signed)
-			val = *(short *)addr;
+			val = *(s16 *)addr;
 		else
-			val = *(unsigned short *)addr;
+			val = *(u16 *)addr;
 		break;
 	case 4:
 		if (field->is_signed)
-			val = *(int *)addr;
+			val = *(s32 *)addr;
 		else
-			val = *(unsigned int *)addr;
+			val = *(u32 *)addr;
 		break;
 	default:
 		if (field->size == sizeof(long)) {
@@ -758,7 +762,8 @@ find_and_get_event(const char *system, const char *event_name)
 		    (TRACE_EVENT_FL_IGNORE_ENABLE |
 		     TRACE_EVENT_FL_KPROBE |
 		     TRACE_EVENT_FL_UPROBE |
-		     TRACE_EVENT_FL_EPROBE))
+		     TRACE_EVENT_FL_EPROBE |
+		     TRACE_EVENT_FL_FPROBE))
 			continue;
 		if (!tp_event->class->system ||
 		    strcmp(system, tp_event->class->system))
diff --git a/kernel/trace/trace_fprobe.c b/kernel/trace/trace_fprobe.c
index 4e9034ebc3fb..9ab0871a6461 100644
--- a/kernel/trace/trace_fprobe.c
+++ b/kernel/trace/trace_fprobe.c
@@ -853,10 +853,6 @@ static void __unregister_trace_fprobe(struct trace_fprobe *tf)
 /* Unregister a trace_probe and probe_event */
 static int unregister_trace_fprobe(struct trace_fprobe *tf)
 {
-	/* If other probes are on the event, just unregister fprobe */
-	if (trace_probe_has_sibling(&tf->tp))
-		goto unreg;
-
 	/* Enabled event can not be unregistered */
 	if (trace_probe_is_enabled(&tf->tp))
 		return -EBUSY;
@@ -865,6 +861,10 @@ static int unregister_trace_fprobe(struct trace_fprobe *tf)
 	if (trace_event_dyn_busy(trace_probe_event_call(&tf->tp)))
 		return -EBUSY;
 
+	/* If other probes are on the event, just unregister fprobe */
+	if (trace_probe_has_sibling(&tf->tp))
+		goto unreg;
+
 	/* Will fail if probe is being used by ftrace or perf */
 	if (unregister_fprobe_event(tf))
 		return -EBUSY;
@@ -933,7 +933,10 @@ static int append_trace_fprobe_event(struct trace_fprobe *tf, struct trace_fprob
 	if (ret)
 		return ret;
 
-	ret = trace_fprobe_verify_target(tf);
+	if (trace_probe_is_enabled(&tf->tp))
+		ret = __register_trace_fprobe(tf);
+	else
+		ret = trace_fprobe_verify_target(tf);
 	if (ret)
 		trace_probe_unlink(&tf->tp);
 	else
@@ -1520,13 +1523,8 @@ static int disable_trace_fprobe(struct trace_event_call *call,
 		trace_probe_clear_flag(tp, TP_FLAG_PROFILE);
 
 	if (!trace_probe_is_enabled(tp)) {
-		list_for_each_entry(tf, trace_probe_probe_list(tp), tp.list) {
-			unregister_fprobe(&tf->fp);
-			if (tf->tuser) {
-				tracepoint_user_put(tf->tuser);
-				tf->tuser = NULL;
-			}
-		}
+		list_for_each_entry(tf, trace_probe_probe_list(tp), tp.list)
+			__unregister_trace_fprobe(tf);
 	}
 
  out:
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index e41a7c113646..1dd6a6942eb7 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -548,10 +548,6 @@ static void __unregister_trace_kprobe(struct trace_kprobe *tk)
 /* Unregister a trace_probe and probe_event */
 static int unregister_trace_kprobe(struct trace_kprobe *tk)
 {
-	/* If other probes are on the event, just unregister kprobe */
-	if (trace_probe_has_sibling(&tk->tp))
-		goto unreg;
-
 	/* Enabled event can not be unregistered */
 	if (trace_probe_is_enabled(&tk->tp))
 		return -EBUSY;
@@ -560,6 +556,10 @@ static int unregister_trace_kprobe(struct trace_kprobe *tk)
 	if (trace_event_dyn_busy(trace_probe_event_call(&tk->tp)))
 		return -EBUSY;
 
+	/* If other probes are on the event, just unregister kprobe */
+	if (trace_probe_has_sibling(&tk->tp))
+		goto unreg;
+
 	/* Will fail if probe is being used by ftrace or perf */
 	if (unregister_kprobe_event(tk))
 		return -EBUSY;
@@ -2017,6 +2017,9 @@ static __init void setup_boot_kprobe_events(void)
 	char *p, *cmd = kprobe_boot_events_buf;
 	int ret;
 
+	if (!kprobe_boot_events_buf[0])
+		return;
+
 	strreplace(kprobe_boot_events_buf, ',', ' ');
 
 	while (cmd && *cmd != '\0') {
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index ba580d0d0f6a..cff55dcae36f 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -411,6 +411,9 @@ static bool btf_type_is_char_ptr(struct btf *btf, const struct btf_type *type)
 	const struct btf_type *real_type;
 	u32 intdata;
 
+	if (BTF_INFO_KIND(type->info) != BTF_KIND_PTR)
+		return false;
+
 	real_type = btf_type_skip_modifiers(btf, type->type, NULL);
 	if (!real_type)
 		return false;
@@ -435,6 +438,11 @@ static bool btf_type_is_char_array(struct btf *btf, const struct btf_type *type)
 	array = (const struct btf_array *)(type + 1);
 
 	real_type = btf_type_skip_modifiers(btf, array->type, NULL);
+	if (!real_type)
+		return false;
+
+	if (BTF_INFO_KIND(real_type->info) != BTF_KIND_INT)
+		return false;
 
 	intdata = btf_type_int(real_type);
 	return !(BTF_INT_ENCODING(intdata) & BTF_INT_SIGNED)
@@ -486,6 +494,18 @@ static const char *fetch_type_from_btf_type(struct btf *btf,
 {
 	u32 intdata;
 
+	if (ctx->last_bitsize) {
+		u32 bits = ctx->last_bitsize + ctx->last_bitoffs;
+
+		if (bits <= 8)
+			return "u8";
+		if (bits <= 16)
+			return "u16";
+		if (bits <= 32)
+			return "u32";
+		return "u64";
+	}
+
 	/* TODO: const char * could be converted as a string */
 	switch (BTF_INFO_KIND(type->info)) {
 	case BTF_KIND_ENUM:
@@ -520,10 +540,6 @@ static const char *fetch_type_from_btf_type(struct btf *btf,
 			case 64:
 				return "u64";
 			}
-			/* bitfield, size is encoded in the type */
-			ctx->last_bitsize = BTF_INT_BITS(intdata);
-			ctx->last_bitoffs += BTF_INT_OFFSET(intdata);
-			return "u64";
 		}
 	}
 	/* TODO: support other types */
@@ -653,6 +669,12 @@ static int get_bitoffset_of_field(char **pfieldname, const struct btf_type **pty
 		/* Add anonymous structure/union offset */
 		bitoffs += anon_offs;
 
+		type = btf_type_skip_modifiers(btf, field->type, NULL);
+		if (!type) {
+			trace_probe_log_err(ctx->offset, BAD_BTF_TID);
+			return -EINVAL;
+		}
+
 		/* Accumulate the bit-offsets of the dot-connected fields */
 		if (btf_type_kflag(container_type)) {
 			bitoffs += BTF_MEMBER_BIT_OFFSET(field->offset);
@@ -660,12 +682,15 @@ static int get_bitoffset_of_field(char **pfieldname, const struct btf_type **pty
 		} else {
 			bitoffs += field->offset;
 			ctx->last_bitsize = 0;
-		}
-
-		type = btf_type_skip_modifiers(btf, field->type, NULL);
-		if (!type) {
-			trace_probe_log_err(ctx->offset, BAD_BTF_TID);
-			return -EINVAL;
+			if (BTF_INFO_KIND(type->info) == BTF_KIND_INT) {
+				u32 intdata = btf_type_int(type);
+
+				bitoffs += BTF_INT_OFFSET(intdata);
+				if ((bitoffs % 8) ||
+				    BTF_INT_BITS(intdata) != BYTES_TO_BITS(type->size) ||
+				    !is_power_of_2(type->size))
+					ctx->last_bitsize = BTF_INT_BITS(intdata);
+			}
 		}
 
 		if (next)
@@ -858,13 +883,22 @@ static const struct fetch_type *find_fetch_type_from_btf_type(
 }
 
 static int parse_btf_bitfield(struct fetch_insn **pcode,
+			      const struct fetch_type *t,
 			      struct traceprobe_parse_context *ctx)
 {
 	struct fetch_insn *code = *pcode;
 
-	if ((ctx->last_bitsize % 8 == 0) && ctx->last_bitoffs == 0)
+	if ((ctx->last_bitsize == 0 ||
+	     ctx->last_bitsize == BYTES_TO_BITS(t->size)) &&
+	    ctx->last_bitoffs == 0)
 		return 0;
 
+	if (ctx->last_bitsize == 0 ||
+	    BYTES_TO_BITS(t->size) < (ctx->last_bitsize + ctx->last_bitoffs)) {
+		trace_probe_log_err(ctx->offset, BAD_BITFIELD);
+		return -EINVAL;
+	}
+
 	code++;
 	if (code->op != FETCH_OP_NOP) {
 		trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
@@ -873,9 +907,13 @@ static int parse_btf_bitfield(struct fetch_insn **pcode,
 	*pcode = code;
 
 	code->op = FETCH_OP_MOD_BF;
-	code->lshift = 64 - (ctx->last_bitsize + ctx->last_bitoffs);
-	code->rshift = 64 - ctx->last_bitsize;
-	code->basesize = 64 / 8;
+#ifdef __BIG_ENDIAN_BITFIELD
+	code->lshift = ctx->last_bitoffs;
+#else
+	code->lshift = BYTES_TO_BITS(t->size) - (ctx->last_bitsize + ctx->last_bitoffs);
+#endif
+	code->rshift = BYTES_TO_BITS(t->size) - ctx->last_bitsize;
+	code->basesize = t->size;
 	return 0;
 }
 
@@ -1085,6 +1123,7 @@ static int parse_btf_arg(char *varname,
 }
 
 static int parse_btf_bitfield(struct fetch_insn **pcode,
+			      const struct fetch_type *t,
 			      struct traceprobe_parse_context *ctx)
 {
 	trace_probe_log_err(ctx->offset, NOSUP_BTFARG);
@@ -1917,6 +1956,8 @@ static int finalize_fetch_insn(struct fetch_insn *code,
 
 	/* Store operation */
 	if (parg->type->is_string) {
+		bool is_uderef;
+
 		/* Check bad combination of the type and the last fetch_insn. */
 		if (!strcmp(parg->type->name, "symstr")) {
 			if (code->op != FETCH_OP_REG && code->op != FETCH_OP_STACK &&
@@ -1936,6 +1977,7 @@ static int finalize_fetch_insn(struct fetch_insn *code,
 			}
 		}
 
+		is_uderef = (code->op == FETCH_OP_UDEREF);
 		if (!strcmp(parg->type->name, "symstr") ||
 		    (code->op == FETCH_OP_IMM || code->op == FETCH_OP_COMM ||
 		     code->op == FETCH_OP_IMMSTR) || code->op == FETCH_OP_TP_ARG ||
@@ -1948,6 +1990,12 @@ static int finalize_fetch_insn(struct fetch_insn *code,
 			 * For the symstr, it doesn't need to dereference, thus
 			 * it just get the value.
 			 */
+			if (parg->count && (code->op != FETCH_OP_DEREF &&
+					    code->op != FETCH_OP_UDEREF)) {
+				trace_probe_log_err(ctx->offset + type_offset,
+						    BAD_STRING);
+				return -EINVAL;
+			}
 			code++;
 			if (code->op != FETCH_OP_NOP) {
 				trace_probe_log_err(ctx->offset, TOO_MANY_OPS);
@@ -1956,8 +2004,7 @@ static int finalize_fetch_insn(struct fetch_insn *code,
 		}
 
 		/* If op == DEREF, replace it with STRING */
-		if (!strcmp(parg->type->name, "ustring") ||
-		    code->op == FETCH_OP_UDEREF)
+		if (!strcmp(parg->type->name, "ustring") || is_uderef)
 			code->op = FETCH_OP_ST_USTRING;
 		else if (!strcmp(parg->type->name, "symstr"))
 			code->op = FETCH_OP_ST_SYMSTR;
@@ -1995,7 +2042,7 @@ static int finalize_fetch_insn(struct fetch_insn *code,
 	} else if (IS_ENABLED(CONFIG_PROBE_EVENTS_BTF_ARGS) &&
 		   ctx->last_type) {
 		/* If user not specified the type, try parsing BTF bitfield. */
-		ret = parse_btf_bitfield(&code, ctx);
+		ret = parse_btf_bitfield(&code, parg->type, ctx);
 		if (ret)
 			return ret;
 	}
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 22cc3c8181b8..fb7991543db7 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -396,13 +396,17 @@ static int unregister_trace_uprobe(struct trace_uprobe *tu)
 {
 	int ret;
 
-	if (trace_probe_has_sibling(&tu->tp))
-		goto unreg;
+	/* Enabled event can not be unregistered */
+	if (trace_probe_is_enabled(&tu->tp))
+		return -EBUSY;
 
 	/* If there's a reference to the dynamic event */
 	if (trace_event_dyn_busy(trace_probe_event_call(&tu->tp)))
 		return -EBUSY;
 
+	if (trace_probe_has_sibling(&tu->tp))
+		goto unreg;
+
 	ret = unregister_uprobe_event(tu);
 	if (ret)
 		return ret;
@@ -443,6 +447,28 @@ static bool trace_uprobe_has_same_uprobe(struct trace_uprobe *orig,
 	return false;
 }
 
+typedef bool (*filter_func_t)(struct uprobe_consumer *self, struct mm_struct *mm);
+
+#ifdef CONFIG_PERF_EVENTS
+static bool uprobe_perf_filter(struct uprobe_consumer *uc, struct mm_struct *mm);
+#else
+#define uprobe_perf_filter NULL
+#endif
+
+static int trace_uprobe_enable(struct trace_uprobe *tu, filter_func_t filter)
+{
+	struct inode *inode = d_real_inode(tu->path.dentry);
+	struct uprobe *uprobe;
+
+	tu->consumer.filter = filter;
+	uprobe = uprobe_register(inode, tu->offset, tu->ref_ctr_offset, &tu->consumer);
+	if (IS_ERR(uprobe))
+		return PTR_ERR(uprobe);
+
+	tu->uprobe = uprobe;
+	return 0;
+}
+
 static int append_trace_uprobe(struct trace_uprobe *tu, struct trace_uprobe *to)
 {
 	int ret;
@@ -462,10 +488,22 @@ static int append_trace_uprobe(struct trace_uprobe *tu, struct trace_uprobe *to)
 
 	/* Append to existing event */
 	ret = trace_probe_append(&tu->tp, &to->tp);
-	if (!ret)
-		dyn_event_add(&tu->devent, trace_probe_event_call(&tu->tp));
+	if (ret)
+		return ret;
 
-	return ret;
+	if (trace_probe_is_enabled(&tu->tp)) {
+		ret = trace_uprobe_enable(tu,
+			trace_probe_test_flag(&tu->tp, TP_FLAG_PROFILE) ?
+			uprobe_perf_filter : NULL);
+		if (ret) {
+			trace_probe_unlink(&tu->tp);
+			return ret;
+		}
+	}
+
+	dyn_event_add(&tu->devent, trace_probe_event_call(&tu->tp));
+
+	return 0;
 }
 
 /*
@@ -663,7 +701,7 @@ static int __trace_uprobe_create(int argc, const char **argv)
 	}
 
 	if (!event) {
-		char *tail;
+		char *tail __free(kfree) = NULL;
 		char *ptr;
 
 		tail = kstrdup(kbasename(filename), GFP_KERNEL);
@@ -679,7 +717,6 @@ static int __trace_uprobe_create(int argc, const char **argv)
 			return -ENOMEM;
 		snprintf(buf, MAX_EVENT_NAME_LEN, "%c_%s_0x%lx", 'p', tail, offset);
 		event = buf;
-		kfree(tail);
 	}
 
 	argc -= 2;
@@ -1101,22 +1138,6 @@ print_uprobe_event(struct trace_iterator *iter, int flags, struct trace_event *e
 	return trace_handle_return(s);
 }
 
-typedef bool (*filter_func_t)(struct uprobe_consumer *self, struct mm_struct *mm);
-
-static int trace_uprobe_enable(struct trace_uprobe *tu, filter_func_t filter)
-{
-	struct inode *inode = d_real_inode(tu->path.dentry);
-	struct uprobe *uprobe;
-
-	tu->consumer.filter = filter;
-	uprobe = uprobe_register(inode, tu->offset, tu->ref_ctr_offset, &tu->consumer);
-	if (IS_ERR(uprobe))
-		return PTR_ERR(uprobe);
-
-	tu->uprobe = uprobe;
-	return 0;
-}
-
 static void __probe_event_disable(struct trace_probe *tp)
 {
 	struct trace_uprobe *tu;

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

