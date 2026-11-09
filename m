Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222925;
	b=liGtdPpNi9D7O/bOvf/y55nxwjI6FOqdyXxbWoogLEh9fQ91mKv0Uz5MT7dX/PpJja+O
	 mOXUdVIHutGIUWMYtbGwldWn3NtSkpvO9ak7hYTLq7u7rQLp5/RR/0sieME9HO82Xd/j3
	 xR2R0sFmShoUVhQprIAHm0cG3jqvql+lsiIZNH5O28YmeP/O6CBftHRUxXY1eoLDFJwVU
	 V4qe2z33Rms50w14YZuR10iKgKAoAcVsF1EVakdYXwE1ysYOaBZNeAnYNA+6G3/HwtGlY
	 9uoFI0u914LTvaHJz2+3WWFubRZYk8VuxD3N2Q5Z5q2HAisXXvEIQmqL6GzfRIW7uUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222925;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=ktnpZpWgTujl3aniRldbFc8pr4GjGJhh3DfpOChyhFw=;
	b=4mvVqDbBrP8KdJ7TTsBr6glFiFUFaxYOrsITjTjzl387ppvc6VirngQVrGt1IxgnrExj
	 vGzRFxhLRJHFW1djG5emENN/+Ux8rE4McP90KxJQRlOoaQ7wxwgRcPHuM+vWq7d+0H1wc
	 UIP2PopoIve//mgPxkIkklf3+Lxm3EjLNZpeRAWKsL6s6AX/JIIhp85pwcwkXxnxK88VM
	 /YkO91tmvORwqinLXC8C0zTK8qlzPGzBKuUKiZf5Jrew2d974FathtvXt+RU1batImcKT
	 1m/3XBcJPM8BVvWoz8uTIxAvpm5W8jzMKYhrXFl8Ns1jz9SznQ0OHf2ihfeh1muAaTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HYROq1oY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZqrQO6Te;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBDD606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HYROq1oY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZqrQO6Te
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794222923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ktnpZpWgTujl3aniRldbFc8pr4GjGJhh3DfpOChyhFw=;
	b=HYROq1oYJflOUdksX1UB3x4WnSzpYvXCLc6xF/+XUjkYAxGCOdFC2h2CvnveTUcBUse4bw
	Wez+E5+ieANueMqwmKExNB4/v5SN3A/77i2rqNg2AR6zCqIYmMKnJTFjnuruh+qq1SJ/N+
	kMf/EmYkDBo0ZiAC+CyiBH6hnX8CaYM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-UQpP2_kjPTmSvgw1SzhjhA-1; Mon, 09 Nov 2026 06:15:22 -0500
X-MC-Unique: UQpP2_kjPTmSvgw1SzhjhA-1
X-Mimecast-MFC-AGG-ID: UQpP2_kjPTmSvgw1SzhjhA_1794222921
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a17741243eso4375455e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794222921; x=1794827721; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktnpZpWgTujl3aniRldbFc8pr4GjGJhh3DfpOChyhFw=;
        b=ZqrQO6Te1GUPxbjHPZLOzjnn4AP1oBvPGCvFlziiR8qaeI89X/xugyPSWmyjp6RQiX
         GZvBLGDUxmkRp3dSGV/jQG/7il3RF1AI44Isdetpz2NEH80jTdj92okMMZiwPkBTjN8p
         PlwcBO5yGx2gBcMgtriRDSRb6ZMwJ3s0LHVoio0Wf9IKhLZ4pip++sBvzYtPhBVOyhKP
         IZqh/1tr6OHsJVqpt+RqMJF46oV1lGUxFaOJgXWgoxhbOp4A1ImrPfmnEbTYJ1ymNkiY
         Cm0zmOBvP6uz0RbVBJoCc9d0kOcXxOiq5Bv0xzYY89GTOPwjH+nFfCN0tf5vquzcalnq
         F+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222921; x=1794827721;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ktnpZpWgTujl3aniRldbFc8pr4GjGJhh3DfpOChyhFw=;
        b=qcTh4vIMUPWKMLWzlIi0g9cmbPK4gK/cP8w8XQkU7NBKxa5kIKLG6NpSl7uY6DVzn4
         T1Oc4i2KF3BEWfsr7F3wjeTgYqT2BaV/LYj+lq1KMn7/Psrbbb/g2VU+sFWGDlHBK+wt
         gVapEiNq7ciFu+sQAqSQ/O0lftQGKkyczxBQ+uCHuVrin8QQQcdQewPTPmIIUX2+Pgpi
         fVCimKb/Li8dKJ/23tku88pi+pBuaeSHAkY0oGvd1qqc7EMwMOxqdfgUXqx8psYeSeLE
         W96UIhD7N7sYBEhZsU68Yel4CsaTht/whnwXp27XXBnTWvgwGNHu6O6sm241zrc2QtfI
         K9mw==
X-Forwarded-Encrypted: i=1; AL+hErFfkNTS2RVuHe8jiKHlZ9d7spcHoLANX8exl4fydMk0W7DrgHaUoXimYkaLNzMfAM4LGuHFJ6LtjabaUFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IAjjXbAXVtV+7rG0R7jLGjpnhRBEgi/TN1d0VyxSsaWzQA9B2
	dZMyksZQANmrs/sNMdDzjXPHhBjWRpGvqgGp56YAQzUuvYMhG4/sEn66kFvb9934ya1B97YtG6F
	g6n9/N6cbZBNV5DRlD8OzUri/p6gy9Oh4y8mlonyyx+Uy/OX9az0mjCB6/Ux50JL75L4l6cqUqA
	==
X-Gm-Gg: AYBFou1MuDtqyvTtKaBXH9r6A/efJk7U2PcWjfCkPJDpjCp9yJ6Sn4BFQ/F8+dmPdjY
	igZng8V1YNg2/zcxlyC+R4FMJthPA3ItwCrjr0eWjoI4gYT0SpKYpTdOa+zp5nvx5tJ95K6RH7v
	GzhfsF8NBxOZums7wtuIgiYeXb7pWbEzy/gIVDiyI4+QL/aiNF/lJFvuZ7GwV7609pTd7yP06Ny
	eoeR6Ask15GkpVg5DIzNXzUlnUGDh3S4fgNfZ3qFjrdgCC5pgYV5942/Kt4jW4SNZXDTEfQYx+U
	lR4KiLflMrC8sLI1U/pc/F0yrmcpDiblVUZOXIEAv1fMWgHzq44/1HHIkZELxw5E5VTWP0GlN2Z
	cpIkYxo5Y8WB+u1nAOCb4aaVkJGmlU4UEqtCtvGut9CtkngCbI7m0cPG4QYHqV827U2jTd5tmVM
	Hg2gtssMWQ0WkvM64QEeJ10zLDFpLf9dkTHQ==
X-Received: by 2002:a05:600c:608a:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4b960d9c577mr72760625e9.6.1794222921264;
        Mon, 09 Nov 2026 03:15:21 -0800 (PST)
X-Received: by 2002:a05:600c:608a:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4b960d9c577mr72760265e9.6.1794222920881;
        Mon, 09 Nov 2026 03:15:20 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm235792115e9.13.2026.11.09.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:15:19 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, Ruidong Tian
 <tianruidong@linux.alibaba.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
In-Reply-To: <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
Date: Mon, 09 Nov 2026 12:15:18 +0100
Message-ID: <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 06/11/26 17:07, Peter Zijlstra wrote:
> On Sat, May 09, 2026 at 11:50:14AM +0800, Ruidong Tian wrote:
>> @@ -848,9 +848,15 @@ struct task_struct {
>>  
>>  	int				on_cpu;
>>  	struct __call_single_node	wake_entry;
>> -	unsigned int			wakee_flips;
>> +
>> +#ifdef CONFIG_STACKPROTECTOR
>> +	/* Canary value for the -fstack-protector GCC feature: */
>> +	unsigned long			stack_canary;
>> +#endif
>> +
>>  	unsigned long			wakee_flip_decay_ts;
>>  	struct task_struct		*last_wakee;
>> +	unsigned int			wakee_flips;
>>  
>>  	/*
>>  	 * recent_used_cpu is initially set as the last CPU used by a task
>> @@ -1060,10 +1066,6 @@ struct task_struct {
>>  	pid_t				pid;
>>  	pid_t				tgid;
>>  
>> -#ifdef CONFIG_STACKPROTECTOR
>> -	/* Canary value for the -fstack-protector GCC feature: */
>> -	unsigned long			stack_canary;
>> -#endif
>>  	/*
>>  	 * Pointers to the (original) parent process, youngest child, younger sibling,
>>  	 * older sibling, respectively.  (p->father can be replaced with
>
> This seems exceedingly random; and very prone to also randomly breaking
> as task_struct is further modified.
>
> Why not do something a little more structured; like so?

> until someone smarter can come with a risc-v specific improvement

See :-)

How's this? I fluffed the changelog and added a comment to that
stack_canary helper

---
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri, 6 Nov 2026 17:07:30 +0100
Subject: [PATCH] riscv, sched: move stack_canary to thread_info

task_struct keeps growing over time. On architectures that compute the
per-task stack canary offset from asm-offsets.h and pass it to the
compiler via -mstack-protector-guard-offset=, this growth eventually
pushes stack_canary beyond what the target ISA can encode.

On RISC-V, canary loads are emitted as

    ld	t0, TSK_STACK_CANARY(tp)

where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
[-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
the build fails with

    cc1: error: '<N>' is not a valid offset in
	'-mstack-protector-guard-offset='

On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
stack_canary does not benefit from being in the task_struct randomized
region.

Move the RISC-V stack_canary to thread_info, and introduce an access macro
to point to the right stack_canary location. Other archs are unaffected.

Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
Not-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/riscv/include/asm/stackprotector.h |  4 ++--
 arch/riscv/include/asm/thread_info.h    | 16 ++++++++++++++++
 arch/riscv/kernel/asm-offsets.c         |  7 +++----
 drivers/misc/lkdtm/bugs.c               |  4 ++--
 include/linux/sched.h                   |  6 +++++-
 kernel/fork.c                           |  2 +-
 6 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
index 43895b90fe3f6..b56e49ce0580e 100644
--- a/arch/riscv/include/asm/stackprotector.h
+++ b/arch/riscv/include/asm/stackprotector.h
@@ -15,8 +15,8 @@ static __always_inline void boot_init_stack_canary(void)
 {
 	unsigned long canary = get_random_canary();
 
-	current->stack_canary = canary;
+	tsk_stack_canary(current) = canary;
 	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
-		__stack_chk_guard = current->stack_canary;
+		__stack_chk_guard = tsk_stack_canary(current);
 }
 #endif /* _ASM_RISCV_STACKPROTECTOR_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9eca..b3a1e1ddbfb0e 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -73,6 +73,9 @@ struct thread_info {
 	 */
 	unsigned long		a0, a1, a2;
 #endif
+#ifdef CONFIG_STACKPROTECTOR
+	unsigned long		stack_canary;
+#endif
 #ifdef CONFIG_RISCV_USER_CFI
 	struct cfi_state	user_cfi_state;
 #endif
@@ -86,6 +89,19 @@ struct thread_info {
 #define INIT_SCS
 #endif
 
+#ifdef CONFIG_STACKPROTECTOR
+/*
+ * The canary is loaded via
+ *
+ *   ld	t0, TSK_STACK_CANARY(tp)
+ *
+ * This imposes a 2047 byte (12-bit signed immediate) limit for the stack_canary
+ * offset, which is a RISC-V specific limit. Because of that, we keep the
+ * stack_canary high up in task_struct, in thread_info itself.
+ */
+#define tsk_stack_canary(p) ((p)->thread_info.stack_canary)
+#endif
+
 /*
  * macros/functions for gaining access to the thread information structure
  *
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a75f0cfea1e9f..eb694e1215bbb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -49,7 +49,9 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
 	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 #endif
-
+#ifdef CONFIG_STACKPROTECTOR
+	OFFSET(TSK_STACK_CANARY, task_struct, thread_info.stack_canary);
+#endif
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 #ifdef CONFIG_RISCV_USER_CFI
 	OFFSET(TASK_TI_CFI_STATE, task_struct, thread_info.user_cfi_state);
@@ -88,9 +90,6 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
 	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
 	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
-#ifdef CONFIG_STACKPROTECTOR
-	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
-#endif
 
 	DEFINE(PT_SIZE, sizeof(struct pt_regs));
 	OFFSET(PT_EPC, pt_regs, epc);
diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 2761685cf4f87..977ee75842490 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -247,9 +247,9 @@ static noinline void __lkdtm_REPORT_STACK_CANARY(void *stack)
 	for (i = 1; i < 16; i++) {
 		canary = (unsigned long *)stack + i;
 #ifdef CONFIG_STACKPROTECTOR
-		if (*canary == current->stack_canary)
+		if (*canary == tsk_stack_canary(current))
 			current_offset = i;
-		if (*canary == init_task.stack_canary)
+		if (*canary == tsk_stack_canary(&init_task))
 			init_offset = i;
 #endif
 	}
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d78555..b7702fefed635 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1083,7 +1083,7 @@ struct task_struct {
 	pid_t				pid;
 	pid_t				tgid;
 
-#ifdef CONFIG_STACKPROTECTOR
+#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
 	/* Canary value for the -fstack-protector GCC feature: */
 	unsigned long			stack_canary;
 #endif
@@ -1697,6 +1697,10 @@ struct task_struct {
 	randomized_struct_fields_end
 } __attribute__ ((aligned (64)));
 
+#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
+#define tsk_stack_canary(p) ((p)->stack_canary)
+#endif
+
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DECLARE_STATIC_KEY_TRUE(__sched_proxy_exec);
 static inline bool sched_proxy_exec(void)
diff --git a/kernel/fork.c b/kernel/fork.c
index 5efceb8d58a78..878d586bda256 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -964,7 +964,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 	clear_syscall_work_syscall_user_dispatch(tsk);
 
 #ifdef CONFIG_STACKPROTECTOR
-	tsk->stack_canary = get_random_canary();
+	tsk_stack_canary(tsk) = get_random_canary();
 #endif
 	if (orig->cpus_ptr == &orig->cpus_mask)
 		tsk->cpus_ptr = &tsk->cpus_mask;
-- 
2.55.0

