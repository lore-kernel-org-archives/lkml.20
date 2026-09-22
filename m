Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F538A715
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044077; cv=none; b=H0FxkxYm+uG4TIdKcxw65Vtxgjb8yzyPKUFZV/6D+It3YeucQljBJ8pp2V1nsUl3izJKS1c46qx+DX3o3PMuLVVAtDvs+LV03C1lQm5zJ6FTOcbnCN1zCgz2JCzRuc6ZwE8l2PGwMVmVQ9GrG6joYbQ/361d71Nvv+ADeSO3xkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044077; c=relaxed/simple;
	bh=WxuURWfyPfVrbwoJYzsme+dJrO0g2fOexfelnDzg3io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqQLkJgPsg2Pu9SK9AVqWUaOQqKb+fG731pQapkH0uCQj04Z+IKq3lkzpfot03qdI43UxeWCF2sk9JFix3uSvoJnRSQQeDK9gyZLI6p1YM5EB84eaJAjUWcTZTJsbqQoCvO6tJCq1Ocnc8Q1Jyof0Ta2Ag8yl7WHRFUibkje6pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=I6lHTrEY; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="I6lHTrEY"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so412727385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790044073; x=1790648873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjEABplA81VfGcXS6Z1Q3Y7Xt5Unb50ofxErtTl6HPY=;
        b=I6lHTrEYx3XIEou9LiLDPR92sFcFypxuNY4FR11g5RVmVFmEJXnA2bKGJ3S1IoKiR6
         rmOgW7sNNl4wqFHPc0yQDeKQtMF9U7+ywjV3lOzf7T1gpR4Y4laOsQ0egVCyGyXuLV1P
         LqQoGUW05qT6lN6UTmJKjG/T24ScCPmKBqunbRX4ZWESiyp0gUaZCBmxibLwdEFZbXvq
         8DlU3zinQ9xOlM012tgY9qR1n46KQ0bsGJGiRcI3YpAF6gQoSQgR8IMJnKcBWk+qLf7O
         HYxNr7MbyyPfHCjuvTZHA+ns8o/vjiMcb2e6ZSlRyP7BADorS/YI+lD5hQ/KuFpXUB+J
         5IeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044073; x=1790648873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjEABplA81VfGcXS6Z1Q3Y7Xt5Unb50ofxErtTl6HPY=;
        b=dJLIMyfc2ZBRsdKI8Cmc+oAgv67FDaFVBtXp6S5dhBAggcuaygI/erY4emZjzci1mF
         Vk98U0u9dOEKB9xrZzjDTc0CClDgECY+6wygwDAK74KpNXg9qxnnTkWqkNBH3JwbTOMx
         j4QFFnUXqpZK9Y8vP2rBNTK0hHrnYHuUI3k0iX344zKsGpc9B1YtynF+qH2oWg2KiQBi
         1Q6usXscmyxE8GPKowS5YQdbXqAChg/ykJMsZte82Ftc85eKSaLRioTbaGR9Brpv0dEn
         7X/du3F5XceSjkO5bg/o6Hs14OMQmMOhCneuVcM9y/CG/ZlNSCUO+BMwnl1O3k7jV5xx
         Ae0w==
X-Forwarded-Encrypted: i=1; AKwUvBxs9UwiyqeONRJ2q1ZEPZO5QLjTENWXElHYz0qAeSltk1kn7b08CHeOta7grBnyXHWbI7DHUJBvKG22ChY=@vger.kernel.org
X-Gm-Message-State: AFuF++nX8bpi6vEyj3J/m3macVJ2EmJU7Ixi7EugJJPt3eOactumy249
	VwlxTeQ0gQzCOvAse3mQCt31WJKWN1+gaJuJYW9MIGa6VFRAL4Mz96TKRD8muogv29I=
X-Gm-Gg: AYBFou3WFaVcwsGiTIfanFtZ0PuC2n4vtIzYc1JF5awOaRIEXZclwL57SksYWV8oLiD
	Tk/KKieWfm2hUOlxaA8MWefrhRw/HZ1V3ba57GlNv/8HZ/eeTToRh20vs7AKQumghKfa6d0uExX
	FKXHShYZOVUHK89V+lPQC3ZuRNeOkjSTYkyopN0zkWOF4avQHBm7P8sD7aRLu61w4Sl5ApcqROa
	vXCNMVUHM5HFOxXt8Uxbo+wOvbnTlJ0wqJcTMMFKpuDz15S56lu0Hgwtu4rf33mMhJ/7pbm6ibm
	yRCQ6B+xWv9CpoCRYvqMfqCLCB1Y1xXPf9HSIppKc36s9RyNNPbKJLoRxY0J6RVpijSYTl95p9a
	zdJ91v6nlqxiwCV5PXw9aH5wNoPtj+hdBEGI3c5/VxLuYYpUpa94qq5fOLjnSLONa0q4HxoidVc
	VzsubXA9jAQ7f7DnN19tGef6xK1fLYxXhVphJGLngxG21ouaTSfLgwmFPvkrR48olBLkdCASjpx
	WNJBUdlaSNlqL8=
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr151109685a.55.1790044073015;
        Mon, 21 Sep 2026 19:27:53 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d1e9c78sm21071585a.32.2026.09.21.19.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:27:52 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 22 Sep 2026 02:23:23 +0000
Subject: [PATCH v5 04/13] ftrace: Mark modules hosting direct-call
 trampolines for Tasks RCU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-rcu-tasks-preempt-qs-v5-4-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790043820; l=7065;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WxuURWfyPfVrbwoJYzsme+dJrO0g2fOexfelnDzg3io=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIG8cGFVLUxRckCJD2FMFcjxlH7HHUuPFKzc+YD5qvFJCI6wuoTYH6RLHGPqY8+XII71ZLcy6t+
 Vmn6AcyiciAU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

An out-of-line direct trampoline registered with register_ftrace_direct()
is kept alive only by Tasks RCU while a task executes it or is preempted
in something it called; ftrace_shutdown()'s synchronize_rcu_tasks() is
what stops rmmod freeing it under such a task.  Where Tasks RCU is built
on reader-marked trampolines, such a trampoline must be a Tasks Trace
reader across its call-out like the ftrace and BPF trampolines are, so
document that in register_ftrace_direct().

That still leaves the few instructions before the reader is entered and
after it is left.  For BPF images those are in dynamically allocated
text that rcu_tasks_trampoline_text() already treats as unmarked
trampoline text, but the in-tree samples (and any similar user) place
their trampolines in module .text.  Add a sticky
module::ftrace_direct_tramp flag (under CONFIG_TASKS_RCU_TRAMPOLINE_READERS,
its only consumer), set by every register/modify path when the direct
address is module text, and have rcu_tasks_trampoline_text() treat a task
interrupted anywhere in such a module as a potential holdout.  Other
modules' text is unaffected.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/module.h |  7 +++++++
 kernel/rcu/tasks.h     | 18 +++++++++++++++---
 kernel/trace/ftrace.c  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..82ca4f774725 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -521,6 +521,13 @@ struct module {
 	unsigned int num_ftrace_callsites;
 	unsigned long *ftrace_callsites;
 #endif
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	/*
+	 * An ftrace direct-call trampoline lives in this module's text; see
+	 * rcu_tasks_trampoline_text().  Sticky once set.
+	 */
+	bool ftrace_direct_tramp;
+#endif
 #ifdef CONFIG_KPROBES
 	void *kprobes_text_start;
 	unsigned int kprobes_text_size;
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index eb1388dd8a61..42ea6e0e61cb 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1006,6 +1006,8 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  *    deliberately does not ask is_ftrace_trampoline() and friends, since
  *    text being torn down may already be unregistered there);
  *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
+ *  - the text of a module that hosts an out-of-line ftrace direct-call
+ *    trampoline (see ftrace_direct_mark_module());
  *  - the bytes after a kprobe that a pending jump optimization is about to
  *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
  *
@@ -1014,12 +1016,22 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  */
 bool rcu_tasks_trampoline_text(unsigned long ip)
 {
+	bool ret = true;
+
 	if (core_kernel_text(ip))
 		return arch_rcu_tasks_trampoline_text(ip) ||
 		       kprobe_in_optimized_region(ip);
-	if (is_module_text_address(ip))
-		return kprobe_in_optimized_region(ip);
-	return true;
+
+#ifdef CONFIG_MODULES
+	scoped_guard(rcu) {
+		struct module *mod = __module_text_address(ip);
+
+		if (mod)
+			ret = READ_ONCE(mod->ftrace_direct_tramp) ||
+			      kprobe_in_optimized_region(ip);
+	}
+#endif
+	return ret;
 }
 NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..f69f71591358 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6076,6 +6076,29 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->trampoline = 0;
 }
 
+/*
+ * A direct trampoline may live in module text rather than in dynamically
+ * allocated text that rcu_tasks_trampoline_text() recognises on its own (see
+ * samples/ftrace/ftrace-direct*.c).  The trampoline itself must be a Tasks
+ * Trace reader across its call-out (see register_ftrace_direct()); marking the
+ * owning module here covers the instructions before it enters that reader and
+ * after it leaves it, where a task interrupted in the module's text must not be
+ * counted as Tasks-RCU quiescent, so that ftrace_shutdown()'s
+ * synchronize_rcu_tasks() still keeps the module text from being freed under
+ * it.
+ */
+static void ftrace_direct_mark_module(unsigned long addr)
+{
+#if defined(CONFIG_MODULES) && defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS)
+	struct module *mod;
+
+	guard(rcu)();
+	mod = __module_text_address(addr);
+	if (mod)
+		WRITE_ONCE(mod->ftrace_direct_tramp, true);
+#endif
+}
+
 /**
  * register_ftrace_direct - Call a custom trampoline directly
  * for multiple functions registered in @ops
@@ -6090,6 +6113,17 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
  * and save the parameters of the function being traced, and restore them
  * (or inject new ones if needed), before returning.
  *
+ * Nothing but Tasks RCU keeps the trampoline at @addr alive while a task is
+ * executing it or is preempted in something it called.  On architectures that
+ * select HAVE_RCU_TRAMPOLINE_READERS, Tasks RCU only waits for such a task if
+ * it is a Tasks Trace RCU reader, so the trampoline must enter one
+ * (rcu_read_lock_trace() or an assembly equivalent) before calling out and
+ * leave it before returning, just as that option requires of the in-kernel
+ * ftrace and BPF trampolines.  The few instructions before and after are
+ * covered by the irq-exit check: automatically for trampolines outside kernel
+ * and module text (e.g. BPF images), and via ftrace_direct_mark_module() for
+ * trampolines in module text.
+ *
  * Returns:
  *  0 on success
  *  -EINVAL  - The @ops object was already registered with this call or
@@ -6169,6 +6203,7 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->flags |= MULTI_FLAGS;
 	ops->trampoline = FTRACE_REGS_ADDR;
 	ops->direct_call = addr;
+	ftrace_direct_mark_module(addr);
 
 	err = register_ftrace_function_nolock(ops);
 	if (err)
@@ -6237,6 +6272,8 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	lockdep_assert_held_once(&direct_mutex);
 
+	ftrace_direct_mark_module(addr);
+
 	/* Enable the tmp_ops to have the same functions as the direct ops */
 	ftrace_ops_init(&tmp_ops);
 	tmp_ops.func_hash = ops->func_hash;
@@ -6419,6 +6456,7 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
 			if (__ftrace_lookup_ip(direct_functions, entry->ip))
 				goto out_unlock;
+			ftrace_direct_mark_module(entry->direct);
 		}
 	}
 
@@ -6702,6 +6740,7 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
 			tmp = __ftrace_lookup_ip(direct_hash, entry->ip);
 			if (!tmp)
 				continue;
+			ftrace_direct_mark_module(entry->direct);
 			tmp->direct = entry->direct;
 		}
 	}

-- 
2.55.0

