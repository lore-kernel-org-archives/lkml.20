Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0996D58E2CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066264; cv=none; b=U3Hr1i1x7o7U4gPZ7tlMO6DVVFHXe/JXyWZDc96efU8Yuv9OcnvrUJV52Iug/EVqx6LskP49jtvJV354t4Fj0x7v7w4VZtn/Qliu3EbBUrGiFL9MRY6l2sub5CQgV+LBG6MN8v5HmZ4LyOShQWypCtu86HdwGM5o7ZMN/ptl96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066264; c=relaxed/simple;
	bh=lYdFz9QIpBbv18s7vNFL415owdJ/HvkbTUnKX5a6LVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSJ97CqKlBmDyYJ5InXIZeh2SXft5ibbbZ5CNobQNJO+I0RkG8QQfbNU5iIC3MNDNTzu6ovekQONJlXb4EW+hXxNTeRj3sWCCxODHua+Vo08GVBenOUdLiTrrsjbt7Z9fS6pekP3a4Uf8joHF6zwD1vVLm8E1iExY4iV/1Q15tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=ZTFsEcMs; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="ZTFsEcMs"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9399798cdd2so391093485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066255; x=1789671055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=ZTFsEcMsBBq2ulmPb/BCrMfdkASo0w8240Jh0XomclfIovxMdLGkkwRDpL2Xi9sRBM
         yks9hjEOCb8ZaeXAZPTi/g5x5RHucCIvIWWKpRuByBFJ503E9Ufb9Z8ugl/d9o5EhJD4
         RItdJ0JzZcRrZI+uP+nv9HZBuaU7We4jWpLZGLvMoUhmnCrreCmQbTZWoEc73GIom8v0
         t/jN7fuXqCsvCmztVVHSd8hnOqHzRC37fw33186SJVTM4YVUZI7c1FqS0UXlXfm6OSgo
         PHrd4W/6LRiMVK6CcbC1MX0TO7isQnFcm2FQZxZTDWA71Gq3yURC+BldsyFKyg2eU6vZ
         8G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066255; x=1789671055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=SHRBjog+vF10QAoH5rGimX1yXyxKLZ1bCtF5yM6Em6aXUjdYKNnPqvmHP7QX+w1xBr
         APIeezrzoIpS9FmlIRuAs6uL4jpJ0iwDY+9vLOZ2jGpaLfK2622Ou1Hlqo7FFzd18x2I
         2tRhVDp2yprAoPeJA4mpdPAh0VkfZ+0B/D7og49f+b2dqWptDIxLWOQUCPUamAkC7rhV
         2dzntEsa23D4GMuZFiqCVrJI91NRAVU8WTFzyEimIIdW30Pf1YkX4oRjRL91UJTFYo/U
         PW9TNzPov67CRu5CNcAbRyvFR835JQibq2gU9UX+LIaYIxolSpzvh2KsD6+8/YUrXzPk
         jsmw==
X-Forwarded-Encrypted: i=1; AKwUvBxMWckB0iv53jSotcOrt7mt5oYKL/AjxNbBEtN0J5pcAA9kdxeLYt3gGMTPCxyVdNYb+tkqD4xNuNQIQQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kNr73Li/wh+edb7DD6RSBuVzX2GsLZzSQOm+5tNcKUNYIT1N+4
	dgwShQR2u/Jb/vMt/mMNa0NdYeomrCIlHWrvipkmn+vCu1KwN5p2Ky7GcIKVr5ImyxY=
X-Gm-Gg: AYBFou21hZnwvadtj70rBqatuX5Q3jNv3RFhldsd4laLdTOv1vLPi4rbWzG3pPFTS+3
	9HIVSXL184/vUPbRSxAkeiJW4R6vOpDN2D0U0ZC8MM59IofcC/nj++ZvVaz1oFZp7GxPXQM5cUN
	TbVjST0TF2gEAdW6q6HCCwgNemZ0jXKLhyvWY0uzxaNO5qjlntBjRM+b00qYz4xjo7QY21kfkfm
	7sUsTYlklqmMWALmT89NzojHokcEAzQCVU0J08WmQnP+DdSfquzGyBy8mUFBYsKkO1+wMEQkge9
	II8ZU7KJlx2/v0GZpRUVGlLouL3qUfYYPMgd9CWf8RpM9faM+d30Cflkx2R8I3WX7BPcuVMfPtX
	xqcKu9G5NI1PNKIUK590HTyHvqs8S1hT3rKMSw5tz6w8l4MBaXoOV/zohh6GSLYm4g+d4mpf3/g
	vzGKF2FaY3XZQIcdN96KfYFfpA6R997Rf9UusvnWQKRVQ/wLrnSzECGyQw0cLFC637Tad5RXXEr
	v0Rd4rB0LpqxMZLpwAAunNxA0DLyuVff2OPCpkigEW3d1zLdpngc5ba
X-Received: by 2002:a05:620a:280d:b0:939:78ab:3c5f with SMTP id af79cd13be357-939ea0137a8mr26249085a.9.1789066254480;
        Thu, 10 Sep 2026 11:50:54 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e8bf9d51sm34965885a.14.2026.09.10.11.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:53 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:25 +0000
Subject: [PATCH RFC 02/13] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-2-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2

The irq-exit preemption path is about to need the interrupted context's
registers to decide whether the preemption may be reported to Tasks RCU
as a quiescent state.  irqentry_exit_to_kernel_mode_preempt() already
has them; hand them down through irqentry_exit_cond_resched(), its
PREEMPT_DYNAMIC static-call and static-key variants, and
raw_irqentry_exit_cond_resched().  The only caller outside the generic
entry code is Xen PV's upcall handler, which has regs as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/xen/enlighten_pv.c      |  2 +-
 include/linux/irq-entry-common.h | 12 ++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..3d85035f5624 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -739,7 +739,7 @@ __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
 
 	inhcall = get_and_clear_inhcall();
 	if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 		instrumentation_end();
 		restore_inhcall(inhcall);
 	} else {
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 8da571622000..fc04725ae46b 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -348,21 +348,21 @@ typedef struct irqentry_state {
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 #define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
 #define irqentry_exit_cond_resched_dynamic_disabled	NULL
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#define irqentry_exit_cond_resched(regs)	static_call(irqentry_exit_cond_resched)(regs)
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs);
+#define irqentry_exit_cond_resched(regs)	dynamic_irqentry_exit_cond_resched(regs)
 #endif
 #else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#define irqentry_exit_cond_resched(regs)	raw_irqentry_exit_cond_resched(regs)
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
@@ -467,7 +467,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		return;
 
 	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 }
 
 /**
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..e4acd50bd81a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
-void raw_irqentry_exit_cond_resched(void)
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -150,11 +150,11 @@ void raw_irqentry_exit_cond_resched(void)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
 		return;
-	raw_irqentry_exit_cond_resched();
+	raw_irqentry_exit_cond_resched(regs);
 }
 #endif
 #endif

-- 
2.55.0

