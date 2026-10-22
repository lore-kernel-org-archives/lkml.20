Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792645654;
	b=JbzNv0xUOusVUmZ4DzC62VGuXO+WRJLnIgz4olUf7/B8Xd4m+94CvwjmBVUbKXZBkngW
	 ffEufbDCnoQLg5mh6ZkqK6WYUv6Ql4fIDEy1wSvMh1A3C6xOy5TrjL9+0huJ4qNRLfvp1
	 30gYR+4i0XGzlbMR/JpKck/w3nDlK38E8yz3RW3M5lXQNU3vUaCve/g7IlM5AImMVXU5Z
	 bODIdPgJqfSeRTNKg4+6rFvLkF6DtQSQHUiGoPw/dKl9D82Gew/JntXfbUi2vT42JtjP/
	 yaS+zSf0Sw9PCgoxgeXAW121vlRr11iIY/Jc4ZZs88oLLNQ3Qi6aCUskuk96l+89M8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RVCEYCvcD/LI4F4phUaENR7v/vt6SGoYCV0hEXjw1+k=;
	b=H3bf9bhA4NbusBarhdj020cySl7qqLSTtkPxaVeO5p2PuQerrpaHhkBpHwF+tHNtX0su
	 cQYgdO92IdiThl7mmYEdPqYJNHc5q7z760GU6lrgMJB8B7B2DrCXV83bVV6h4UhJNhWxq
	 J19nKuUZGWk9PzYPkZY6XZp/8SWq+pLWe1T5IO7pooqE9dDyxni+Fe8/jt783Gff3Tmrl
	 gOs4OC/gWCTVcOkBMnjpXLHeqyRix3HoBz+cVFwV3Yq5ho8m22sNm4K0Y8cQrTxi4LGOi
	 IUPognEAPjBHoBYZ2EH+92eBSOxgRmzACb6NTLJBe/4gyBpR2SLrlYBIAvdfDhFkUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CjyDnivs;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DE7606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DE7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CjyDnivs
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d1da913so363300f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792645652; x=1793250452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVCEYCvcD/LI4F4phUaENR7v/vt6SGoYCV0hEXjw1+k=;
        b=CjyDnivsbUXekRe28bU+4kigayrmmS633jYNn++rBZWTeQESc565ClJCC4iJvWq79e
         V9mSo1t49B6Th5fUFTsyKkcpXisr6DiLqV8u/f6rBoTMQW61+3vg5D5Jk5yEcYquTo+n
         ieRdCQvgpRrBEUMy2po0iIOewAp7EQRZAdOPyVpgt34Y5ThNr5CsdeWxe5PEH3XGVIWY
         sHOvf/0l6BA0s+WEEPp3bq6fpT+vzueGYdkb5GAbbc4fkJ9qe1c4HJtwpB/YBnIErqgY
         Kos2xrJKu0ZH4ocrhxBaCmDAqx/314WFEXn74uTuJkdyInxLwpOXx4ky/GyNyEhgESx2
         N5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792645652; x=1793250452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVCEYCvcD/LI4F4phUaENR7v/vt6SGoYCV0hEXjw1+k=;
        b=RGQBrTPsrGSSSdP2oro8z1+2Ha5es5VWAsUrnkIBkcp6cowTJRWDOPxG/XSf17jjXU
         Mkx8h973vCKWghwSGERqaivAMxpm05BCbLtCPeQ1xEBjILIX6LnbUBa/R/1VmiIVfF1I
         70Wm4zcDXc4K9Fp571Su90QMfGBdxQomXPTqR8Dm11nV+5yStzWctWJXVP+YNK6AzvLA
         v0dQ8TNnogsYn92KSmiAKY21gTJMBAidyJLtazgYVgO8jSS/GHCuSHAR1hcQTkJeOKzm
         PRpsUwp3MI2mZkKiv8Y7APvs0Sz1J4VpfybPTnDWfo0cI5KthcvS7EdFu9j9qIEZPiHQ
         MNUQ==
X-Forwarded-Encrypted: i=1; AKwUvByNS1L/0tVyyNLwuMl9q0mF6xK+R81XNyjT3Pcpu79Ec5Er20mXuF/9/Awu/p5ENsuCM94nTlSxGdlxJjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw+Uuxr+KtSdSj7gNAVNCvENpzJaN92C0LenkQci4nHEiE4yKn
	WMBUrx4Cfbnw+Shdk+7JMwumE9nY6PPM4BMzm5+10cNwEUbkcoKqvWQ7
X-Gm-Gg: AYBFou2RTGsyIc6HBGsXwzFhcavdIvqXMhM/yvRIZ/syzAly6sfkwKj95a3sJbMNe/x
	MYUMaMbNJ9XAkLlQH55J5YYOYgEgjo67jNkv4E5ktDFze/zVoi1gHWsJOp2JPL73pfiWaKwdVOL
	ESqmyQtBOPyiTzvPN224a4z51ISnberQ7XUIj5yu6owU6AAGKbO1GclBygAQAnc7Blpp4IFlig/
	j62UOLmG9t1g4pRqd8J3l1s44Y5dgnsJyKwRgzL2tRR3+cLNUvHIhzt4n75Mmgose4pADQK4+Ub
	Vh1Fx2pK1pX/V4/pNvrPBclVL9Zc+lFBZ/iHW9wtngXGXSY9hGY/Ujezbz5/RiT+QAont3DobqY
	clEuzKbG+8CJ9icndvAD87ithnAr/upKtZVZp6wnpbgqvhKw0eNAbp6hPB7vNiqS3S8opecvNtR
	7FOMi7lp0j4TByS6OQpxhh57R5KuJQ5iH+47XPBA81p9YLqPs+eVOFBIdbE6SfUuQce6lRx9KOV
	e3ukWUibyMSEUnQM2Zfwv3k7z4KyADEXprrM1qhKBq2Yl1IHRWSSxIADSDhhOdcYhYfasFhV4Ns
	VRTn8f9+aCakua0eXNsce2WXEi7pvmTSKhOcif9B1JksuDLh5WJqZolN1woEtqT9hKfCYBCQKUo
	msV6vtsxQqjndo/gpbVI34NUWZRoI+gmecVrYcnN2SGMNi0NP+ntIhDeDAG8=
X-Received: by 2002:a05:6000:1611:b0:48d:fce6:884e with SMTP id ffacd0b85a97d-48e2d110a50mr1772805f8f.12.1792645652196;
        Wed, 21 Oct 2026 22:07:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm9994979f8f.8.2026.10.21.22.07.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:07:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/9] tracing/sched: Add IRQ preemption lifecycle events
Date: Thu, 22 Oct 2026 07:07:05 +0200
Message-Id: <20261022050712.75035-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022050712.75035-1-kmehltretter@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
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

Tracepoints around __schedule() do not identify the boundaries of one
preempt_schedule_irq() invocation. The calling task may switch out and
resume on another CPU before the invocation returns.

Add events at entry to and return from preempt_schedule_irq(). Record the
calling task as the owner in both events so consumers can follow the
invocation across switches and migration. Sample the preempt count and
interrupt state before dispatching the callbacks.

The events bracket preempt_schedule_irq() only. They do not cover
architecture-specific interrupt-return work or establish that the helper
was reached from a physical interrupt.

Assisted-by: LLM
---
 include/trace/events/sched.h | 51 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          |  6 +++++
 2 files changed, 57 insertions(+)

diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
index 535860581f159..d0f510c35b02b 100644
--- a/include/trace/events/sched.h
+++ b/include/trace/events/sched.h
@@ -52,6 +52,57 @@ TRACE_EVENT(sched_kthread_stop_ret,
 	TP_printk("ret=%d", __entry->ret)
 );
 
+DECLARE_EVENT_CLASS(sched_irq_preempt,
+
+	TP_PROTO(struct task_struct *owner, unsigned long pc, bool irq_off),
+
+	TP_ARGS(owner, pc, irq_off),
+
+	TP_STRUCT__entry(
+		__array(char, owner_comm, TASK_COMM_LEN)
+		__field(pid_t, owner_pid)
+		__field(unsigned long, pc)
+		__field(bool, irq_off)
+	),
+
+	TP_fast_assign(
+		memcpy(__entry->owner_comm, owner->comm, TASK_COMM_LEN);
+		__entry->owner_pid = owner->pid;
+		__entry->pc = pc;
+		__entry->irq_off = irq_off;
+	),
+
+	TP_printk("owner=%s/%d pc=0x%lx irq_off=%d",
+		  __entry->owner_comm, __entry->owner_pid,
+		  __entry->pc, __entry->irq_off)
+);
+
+/**
+ * sched_irq_preempt_entry - begin preempt_schedule_irq() processing
+ * @owner: task whose interrupted execution will resume after scheduling
+ * @pc: preempt count sampled at the call site, before tracing bookkeeping
+ * @irq_off: interrupt state sampled at the same call site
+ *
+ * Emitted after entry assertions and context-tracking setup, with zero
+ * preempt count and local interrupts disabled. Exception-return paths can
+ * also use this scheduler entrypoint.
+ */
+DEFINE_EVENT(sched_irq_preempt, sched_irq_preempt_entry,
+	     TP_PROTO(struct task_struct *owner, unsigned long pc, bool irq_off),
+	     TP_ARGS(owner, pc, irq_off));
+
+/**
+ * sched_irq_preempt_exit - original preempt_schedule_irq() invocation resumes
+ * @owner: task saved by the matching entry, possibly on a different CPU
+ * @pc: preempt count sampled at the call site, before tracing bookkeeping
+ * @irq_off: interrupt state sampled at the same call site
+ *
+ * Emitted with local interrupts disabled before restoring context tracking.
+ */
+DEFINE_EVENT(sched_irq_preempt, sched_irq_preempt_exit,
+	     TP_PROTO(struct task_struct *owner, unsigned long pc, bool irq_off),
+	     TP_ARGS(owner, pc, irq_off));
+
 /**
  * sched_kthread_work_queue_work - called when a work gets queued
  * @worker:	pointer to the kthread_worker
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1754d9f95f2cf..b971a373ea3a1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7593,12 +7593,16 @@ EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
  */
 asmlinkage __visible void __sched preempt_schedule_irq(void)
 {
+	struct task_struct *owner = current;
 	enum ctx_state prev_state;
 
 	/* Catch callers which need to be fixed */
 	BUG_ON(preempt_count() || !irqs_disabled());
 
 	prev_state = exception_enter();
+	/* Sample before tracing bookkeeping can change the observed context. */
+	if (trace_sched_irq_preempt_entry_enabled())
+		trace_sched_irq_preempt_entry(owner, preempt_count(), irqs_disabled());
 
 	do {
 		preempt_disable();
@@ -7608,6 +7612,8 @@ asmlinkage __visible void __sched preempt_schedule_irq(void)
 		sched_preempt_enable_no_resched();
 	} while (need_resched());
 
+	if (trace_sched_irq_preempt_exit_enabled())
+		trace_sched_irq_preempt_exit(owner, preempt_count(), irqs_disabled());
 	exception_exit(prev_state);
 }
 
-- 
2.39.5 (Apple Git-154)

