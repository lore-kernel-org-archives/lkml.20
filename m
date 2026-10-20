Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504491;
	b=OXUZUIlnsk0bDM6qX7uxi2B/qefOW6kc6+U68Ol2nE5LOn2A+h2wLPzbIgo8dHDjpr09
	 IJ38HF6k4cmaoLq6RkIbrHzq8Qpfb8tbKCq+QEg1WZ88W76VBfICc4i6aV/od4/yRSMo2
	 kkFwxNJ1Vs+DO0bV8c0sxN76q1ZiQQ67cA7tlrWi/8ssz60XwcqwvWejgnpStnxIaEKZ6
	 DU0kEgMCSV7ts0aZp5jAe6SN8QU2GD+O4ERjYhdgdWRWBj1bTsDpm3elYrP9ppuCyeG+/
	 Pe5u4NmGjoK59dF2CcarmvXBomggiSHeJdnkb29Z+JstYLRtYuqxyv6kQep9wdSZt6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504491;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=0T3CF+lNulPhOQdmQA356bFW0iY3IjfuUFpfux3LREY=;
	b=3Iy+hK7tz/uezK1i2TSL3ahiQkbiw7TmociconOvYHzJkjsabc6mWijunBqqrAKPhGiF
	 Jubrxmx/UHLRMdsWV151Q0Jt8gheAroX8JOZoTf8F6C59XPu2IOaVPED0LN0PJo24MfQC
	 HGPSjp77NqHUpdbiY4hKPYa/inv3UIxjn4G3iwEtmycIAfJb1H+sOTQw/1Em4qaKT2/Nu
	 /jdbjLvGbWWZ84CIPYoxsCavHuvrjrtJfUc4xTg3zqmzAJnARORBM6yKY+YTw/XFIoezU
	 PTz/oqiIMaMj/Nmmpg/+wcVSpkZHdxOyFBy9wbYQJ4iRNXV/QkEvkykicF3vp/m+NKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HpS+yzTC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="t/XQHvNd";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73620606AB0C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73620606AB0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HpS+yzTC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=t/XQHvNd
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792504488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0T3CF+lNulPhOQdmQA356bFW0iY3IjfuUFpfux3LREY=;
	b=HpS+yzTC0pvWL4slLEPOAZc5nEcSfJxiNoCeslJuhhdLD/YOzAOmjbqs9vLhDfmDRK9eVj
	l++7OFgdAMB9cSmlf6BjQ3U0oiDnN/YubKqcNRPX3pEGBxnX6QjuVNBWLekEOWC6C3pwnx
	4WHzqxFeWclR0sdyDDR8bQknzJJKyV/TlzFc2x5QfGqwef4N61/qU4H6WvV5rEjaDgC6xp
	TI0ZjPEytsYNHVijyreZVIADKF2J60RWZW8hzX9R7oomiJyqsmc9IM+TZGkzmG8IsslneK
	w2HQdXOUR18ssgeolfB5FifW1kgE9nHuj034lUcJjaMrRU9ibjGplPeV8y5J5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792504488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0T3CF+lNulPhOQdmQA356bFW0iY3IjfuUFpfux3LREY=;
	b=t/XQHvNdwrt5Km9Qjr6JMl+2YltoHG+bg3U3AHR+f1BWTYzHvMXa7rcRYHT5xv0Lh+DzPv
	UVHj48WHPrJcjyDw==
To: Peter Zijlstra <peterz@infradead.org>, Jiakai Xu
 <xujiakai24@mails.ucas.ac.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
In-Reply-To: <877bjiem45.ffs@fw13>
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
 <20260918104349.GL776954@noisy.programming.kicks-ass.net>
 <877bjiem45.ffs@fw13>
Date: Tue, 20 Oct 2026 15:54:47 +0200
Message-ID: <87mrs8bhp4.ffs@fw13>
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

On Thu, Oct 15 2026 at 22:37, Thomas Gleixner wrote:
> On Fri, Sep 18 2026 at 12:43, Peter Zijlstra wrote:
> The stall makes no sense because mm_get_cid() is invoked from:
>
>   10967                 /* First user ? */
>   10968                 if (!mm->mm_cid.users) {
>   10969                         sched_mm_cid_add_user(t, mm);
>   10970                         t->mm_cid.cid = mm_get_cid(mm);
>
> which means this is the first CID user on the MM. So how can the bitmap
> be exhausted?
>
> I have a suspicion but it does not add up (yet).
>
> This is a two CPU VM. Assume that the process which invokes execve() has
> more than two threads. That means the MMCID of the process is in per CPU
> mode. sched_mm_cid_exit() ignores a mode change when the last user goes
> away and with two CPUs the threshold to switch back is when the user
> count goes below _ONE_. So there is probably stale state there, but the
> last outgoing task should have reclaimed the per CPU CID and dropped it,
> but the other CPU still has it assigned to it. So that first allocation
> should succeed...
>
> I'll try to write a trivial test program tomorrow which creates enough
> threads and does an execve().

Hmm. There is stale state, but there is always _ONE_ CID available
because the last exiting thread drops the per CPU CID.

As the mode is TRANSIT the whole scenario resolves when the new exec
spawns threads or schedules around. That just works by chance, but I
couldn't find a way to exhaust the bitmap for the initial allocation.

So I really need to see the reproducer for this splat.

The patch below cleans up the stale data and fixes a consistency issue
vs. the allowed CPUs accounting.

Thanks,

        tglx
---
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10880,6 +10880,10 @@ static inline void mm_update_cpus_allowe
 	 */
 	mc = &mm->mm_cid;
 	guard(raw_spinlock)(&mc->lock);
+	/* Might have raced with exit() */
+	if (!mm->mm_cid.users)
+		return;
+
 	mm_allowed = mm_cpus_allowed(mm);
 	weight = cpumask_weighted_or(mm_allowed, mm_allowed, affmsk);
 	if (weight == mc->nr_cpus_allowed)
@@ -11019,6 +11023,33 @@ static bool sched_mm_cid_add_user(struct
 	return mm_update_max_cids(mm);
 }
 
+/*
+ * sched_mm_cid_exit() does not handle the mode switch for the last user
+ * because for normal exit() that's a pointless exercise. But if the
+ * process which issued execve() was multithreaded and the last exiting
+ * thread switched back from per CPU mode then this leaves stale state
+ * around. The indicator for that is mm_cid::mode having MM_CID_TRANSIT
+ * set.
+ */
+static void sched_mm_cid_cleanup_execve(struct task_struct *t, struct mm_struct *mm)
+{
+	if (likely(!mm->mm_cid.mode))
+		return;
+
+	WARN_ON_ONCE(mm->mm_cid.mode & MM_CID_ONCPU);
+	mm->mm_cid.mode = 0;
+
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(mm->mm_cid.pcpu->cid, cpu) = 0;
+
+	bitmap_zero(mm_cidmask(mm), num_possible_cpus());
+
+	mm->mm_cid.nr_cpus_allowed = t->nr_cpus_allowed;
+	cpumask_copy(mm_cpus_allowed(mm), &t->cpus_mask);
+}
+
 static void sched_mm_cid_fork(struct task_struct *t)
 {
 	struct mm_struct *mm = t->mm;
@@ -11035,6 +11066,7 @@ static void sched_mm_cid_fork(struct tas
 
 		/* First user ? */
 		if (!mm->mm_cid.users) {
+			sched_mm_cid_cleanup_execve(t, mm);
 			sched_mm_cid_add_user(t, mm);
 			t->mm_cid.cid = mm_get_cid(mm);
 			/* Required for execve() */



