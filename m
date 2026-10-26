Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044753;
	b=RekKIcfi88/lqvBanUT4PwK2YPJhYhsoWDQ+2sWkcW32HZ81onSSSfTFBH3L3Shily64
	 Xyno2qkLVjWmKKcNXk/xqWPkkAUM0Y03apbG0COjZTgJZw0DWoJxrqTU6pEl+oI4dbMyJ
	 iQa8GP9Cx7sXR9vRNW0QAkbqt5hb3Gb7GTGRLHj0yh85TdyRiXC5+paVAEwnTOgLPFdri
	 TlS6XEpQXXmOewvOmqnaaeTi12jqxpAPUU4p8ANdXJDxzwADac2VFgZO/dlBZY0ppA2yo
	 8tGnpjvUiVJAKRm2qSW+i2c5YOMFF9yKZ2wnl7k7NHyhp06njk03X0NOFGnaLTFnbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lLbnKUW/GeQkLlvBr/+Q0cVPJ1TM89o40XSOfz3I0dY=;
	b=B+/KlSFsLnsoHd6qbEr4rMyXEvV6FCWvoFCBN+KBvwztI+h5UIVL1B76c3YsZ0QJ3Y5T
	 ObzRpHgf8dsUNQZhoDNqNNW1nuyUJLzqJUUx6Abyq157fgkeI4QTAyDA6BY5epP5KnQEV
	 a7YWgU6MTi1SNn9y6l1PwdmUCrgK1kBQapvr2lpzjEMrNeiJ8yEik8FDhw0wiu6j+njqh
	 kZ+Zc0yOIxpILOOto/2ard4BNvWzE8taulKFc++PPZ86jLMkU8hIg3F/Y++lSlBkAqgNP
	 p+HHFA0J+7CdTBCVDHowiACrP7G+XYEgo5AP40iBK7yRnxKDaGBK2ceQ6Xx+HDguukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iMVjK8jI;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B15606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iMVjK8jI
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso1295705e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044751; x=1793649551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lLbnKUW/GeQkLlvBr/+Q0cVPJ1TM89o40XSOfz3I0dY=;
        b=iMVjK8jI9NiUQGQtTfa4Vfg4/ash5XAve1sTQieUOTtDEU+m4e9v2PUFN1I4GYb1Hn
         mGSAEcEKe2tpUdM9gTVSllAlqe9/4yJ9IzwvW9NncWlELT1XiaM1OGVmZLtFzq4vFKVJ
         a2dLVk/XtESR5Il1zSX7sEnwF2cz9uZLG/UFFKpU64l1PCKlgeRg3ABm9D+xNMuWBXZw
         G89pDAafqD6lkxneHPd79wVcAdGSZ+Zt2U6wYtrXl2LT2/MgWt+UNm+U9+BRZkk56BRr
         rXJrwH7N1W4lCeSVOyV4p25ge86GIZz09hDJs78jG2b2TfE6yXddyGDKM2SMrS1cQ1MR
         +wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044751; x=1793649551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLbnKUW/GeQkLlvBr/+Q0cVPJ1TM89o40XSOfz3I0dY=;
        b=IedNOaptkkGyQTOrpKYFHwubzsFJ2zJ697D9RGJanWSKlgVqPNSPF9VlF9A2VmCz1i
         rQkUoft0r/S4fOYXnNLcTpZjlyLTeOpd2iGypkiM+GptiIlnb+i7fOtME06BadRMgXAK
         1Px1BA6EijeG5VkRE26kre7cWP3/KaGvhi3tTyRmhCzJtwoEnWgpcEp5qy4hhh5rV2WB
         B90iOvkjPL6Wux2yLb11xmzzucekndM+3zv/51Sw1j+y6kAQE8msrxoWTqRi5lFB7NMj
         3O7s8XhSmZeChiMtoey10iD/Z/gld/y80E7ozI35YAFvENPNPnIBRgPcFc8clqnVKpA0
         qQvQ==
X-Gm-Message-State: AFq9FYLPWT/Wdo62uZQKq/s/1YiO70xDIi5/diwzRTZzyhS5Ym5CF2Fi
	A1OaDsTNpWlWCvHprKL1S43iIyMNb55YOhiFXihLAmAVgvBeng2r4kpY
X-Gm-Gg: AYBFou3I+lPwnzo9q4v6rQaGFJCWx9sj8XZFTxfEz6MM46TZZyfTFcIYpqaFI2ny+DJ
	9wKb4bTOKbERndH2JTmAjG0zY4J4uLbMhsAOjog1w1DimLxTc0Z63abLzLU2gquq/j6ADBnMFDj
	HyUDneCUAjHwD1kUDUIgXVPwjTKfcdD+HRNS1/YEXKK2vKrkW81PPdvZNCLbGf1OmjQ/nhDnUbe
	9I/k6Oaa5Co+Mcy3Y2V/GMa8pOG99ItKgWNEghBCDTUbvzHQKCayoIRZVLXVTRQnZ2Mm5SYQd73
	AkKcceenrVHi+FyHw6TXYROmfg2UjCLQ9OngcHnMBi+D2hNMQvpXy00FOpVLhBJSj/tZs+69HCy
	ztfZbUxcJR3pdUBmPb1UXVarVVCbyzwgiczHMuDOADz61uoqODNw6i+lVcMwkE1X1Bp/iSvVQLF
	wwxPa3U20imn5D5wwpyKo2a6cGR2ViFTqVpEu6XP6ifndjNY3MN/YEIv+yg4vkq/aTF1wgtTs+2
	6pZuvQyioZv6XPuynVlPPbIzNyRbR/G0cK95tFsTMigq/U6ruog3unhJHyxY9oPqiIr/4K2EJa8
	ikN+w94=
X-Received: by 2002:a05:600c:a114:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a35aae5c22mr104372895e9.0.1793044750730;
        Mon, 26 Oct 2026 12:59:10 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f523c0sm107878685e9.0.2026.10.26.12.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:59:10 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:59:06 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Valentin Schneider <valentin.schneider@arm.com>, Connor O'Brien <connoro@google.com>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Valentin Schneider <vschneid@redhat.com>, Suleiman Souhlal <suleiman@google.com>, 
	Andrea Righi <arighi@nvidia.com>, Metin Kaya <Metin.Kaya@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, 
	Zhan Xusheng <zhanxusheng@xiaomi.com>, "zhidao su (Xiaomi)" <soolaugust@gmail.com>, 
	Hui Su <sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, 
	kernel-team@android.com
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
Message-ID: <at-e0pcGZraOSjYi@scheduler.schedules>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com>
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
Content-Disposition: inline
In-Reply-To: <20261023220431.1106611-8-jstultz@google.com>

On Fri, Oct 23, 2026 at 10:04:18PM +0000, John Stultz wrote:

While writing this review, I lost the review that I wrote 2 times
before sending it. And broken some of my keyboards keycaps.
Now it's broken out of 'control'.

But if you can see this, it means that I finally been able
to send it.

:-(.


> From: Peter Zijlstra <peterz@infradead.org>

> ---
>  include/linux/sched.h      |   7 +
>  include/linux/sched/task.h |   1 +
>  init/init_task.c           |   6 +
>  kernel/fork.c              |   6 +
>  kernel/sched/core.c        | 333 ++++++++++++++++++++++++++++++++++---
>  5 files changed, 332 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 12a7e094a3e6b..3fae2f1438583 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1266,6 +1266,13 @@ struct task_struct {
>  
>  	struct mutex			*blocked_on;	/* lock we're blocked on */
>  	raw_spinlock_t			blocked_lock;
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	struct list_head		blocked_head;  /* tasks blocked on this task */
> +	struct list_head		blocked_node;  /* our entry on someone elses blocked_head */
> +	/* Node for list of tasks to process blocked_head list for blocked entitiy activations */
> +	struct list_head		blocked_activation_node;
> +	struct task_struct		*sleeping_owner; /* task our blocked_node is enqueued on */
> +#endif
>  
>  	/*
>  	 * The task that is boosting this task; a back link for the current
> diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
> index 90ed5bc3c7afe..26c19ee980456 100644
> --- a/include/linux/sched/task.h
> +++ b/include/linux/sched/task.h
> @@ -160,6 +160,7 @@ static inline void put_task_struct(struct task_struct *t)
>  }
>  
>  DEFINE_FREE(put_task, struct task_struct *, if (_T) put_task_struct(_T))
> +DEFINE_GUARD(get_task, struct task_struct *, get_task_struct(_T), put_task_struct(_T))
>  
>  static inline void put_task_struct_many(struct task_struct *t, int nr)
>  {
> diff --git a/init/init_task.c b/init/init_task.c
> index ce7c2b07d855d..aed3f7d8a5cc3 100644
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -213,6 +213,12 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
>  						 &init_task.alloc_lock),
>  #endif
>  	.blocked_donor = NULL,
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	.blocked_head = LIST_HEAD_INIT(init_task.blocked_head),
> +	.blocked_node = LIST_HEAD_INIT(init_task.blocked_node),
> +	.blocked_activation_node = LIST_HEAD_INIT(init_task.blocked_activation_node),
> +	.sleeping_owner = NULL,
> +#endif
>  #ifdef CONFIG_RT_MUTEXES
>  	.pi_waiters	= RB_ROOT_CACHED,
>  	.pi_top_task	= NULL,
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 394906afafd30..f87f806c2958b 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2277,6 +2277,12 @@ __latent_entropy struct task_struct *copy_process(
>  
>  	p->blocked_on = NULL; /* not blocked yet */
>  	p->blocked_donor = NULL; /* nobody is boosting p yet */
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	INIT_LIST_HEAD(&p->blocked_head);
> +	INIT_LIST_HEAD(&p->blocked_node);
> +	INIT_LIST_HEAD(&p->blocked_activation_node);
> +	p->sleeping_owner = NULL;
> +#endif
>  
>  #ifdef CONFIG_BCACHE
>  	p->sequential_io	= 0;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0cb41a884ea70..be3ce8b554fed 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2229,7 +2229,7 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  	return p->sched_class->dequeue_task(rq, p, flags);
>  }
>  
> -void activate_task(struct rq *rq, struct task_struct *p, int flags)
> +static inline void __activate_task(struct rq *rq, struct task_struct *p, int flags)
>  {
>  	if (task_on_rq_migrating(p))
>  		flags |= ENQUEUE_MIGRATED;
> @@ -2240,6 +2240,76 @@ void activate_task(struct rq *rq, struct task_struct *p, int flags)
>  	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
>  }
>  
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +static inline
> +void __proxy_remove_from_sleeping_owner(struct task_struct *owner, struct task_struct *p)
> +{
> +	lockdep_assert_held(&owner->blocked_lock);
> +
> +	BUG_ON(p->sleeping_owner != owner);
> +
> +	list_del_init(&p->blocked_node);
> +	WRITE_ONCE(p->sleeping_owner, NULL);
> +	put_task_struct(owner); // matches get in proxy_enqueue_on_owner
> +}
> +
> +static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
> +{
> +	struct task_struct *owner;
> +
> +retry:
> +	owner = data_race(READ_ONCE(p->sleeping_owner));
> +	if (!owner)
> +		return;
> +
> +	/*
> +	 * __proxy_remove_from_sleeping_owner() does a
> +	 * put on owner to match the get done in
> +	 * proxy_enqueue_on_owner(). If that put is the
> +	 * last one and it frees owner, we'd be freeing
> +	 * a lock we held. So get/put owner around its
> +	 * usage her to ensure that doesn't happen.

nit. 'her'

> +	 */
> +	scoped_guard(get_task, owner) {
> +		guard(raw_spinlock)(&owner->blocked_lock);
> +
> +		if (owner != READ_ONCE(p->sleeping_owner))
> +			goto retry;
> +		__proxy_remove_from_sleeping_owner(owner, p);
> +	}
> +}
> +
> +void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
> +{
> +	lockdep_assert_rq_held(rq);
> +
> +	if (!sched_proxy_exec()) {
> +		__activate_task(rq, p, en_flags);
> +		return;
> +	}
> +
> +	proxy_remove_from_sleeping_owner(p);
> +	/*
> +	 * By calling __activate_task() with blocked_lock held, we
> +	 * order against the find_proxy_task() blocked_task case
> +	 * such that no more blocked tasks will be enqueued on p
> +	 * once we release p->blocked_lock.
> +	 */
> +	guard(raw_spinlock)(&p->blocked_lock);
> +	WARN_ON(task_cpu(p) != cpu_of(rq));
> +	__activate_task(rq, p, en_flags);
> +}
> +#else
> +static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
> +{
> +}
> +
> +void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
> +{
> +	__activate_task(rq, p, en_flags);
> +}
> +#endif
> +
>  void deactivate_task(struct rq *rq, struct task_struct *p, int flags)
>  {
>  	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> @@ -3815,6 +3885,184 @@ static inline void proxy_reset_donor(struct rq *rq)
>  	resched_curr(rq);
>  }
>  
> +static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
> +{
> +	unsigned int wake_cpu;
> +
> +	/*
> +	 * Since we are enqueuing a blocked task on a cpu it may
> +	 * not be able to run on, preserve wake_cpu when we
> +	 * __set_task_cpu so we can return the task to where it
> +	 * was previously runnable.
> +	 */
> +	wake_cpu = p->wake_cpu;
> +	__set_task_cpu(p, cpu);
> +	p->wake_cpu = wake_cpu;
> +}
> +
> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
> +{
> +	struct rq_flags rf;
> +	int target_cpu = cpu_of(target_rq);
> +
> +	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
> +		/* If task is no longer blocked, don't activate */
> +		if (!p->is_blocked)
> +			return;
> +
> +		/* Avoid racing with ttwu */
> +		if (READ_ONCE(p->__state) == TASK_WAKING)
> +			return;
> +
> +		if (READ_ONCE(p->on_rq)) {
> +			/*
> +			 * We raced with a non mutex handoff activation of p.
> +			 * That activation will also take care of activating
> +			 * all of the tasks after p in the blocked_head list,
> +			 * so we're done here.
> +			 */
> +			return;

I think we can come here with delayed tasks too. No?

Like this: proxy_enqueue_on_owner() adds the task to
owner's list, then calls block_task(), block_task() calls
dequeue_block_task() and that calls dequeue_task_fair() (In fair case)
and dequeue_task_fair() calls __dequeue_task()
And then we set sched_delayed to 1 if the task is not eligible.
And then returns false. Because it returns false this whole 
chain returns false. And __block_task() is not called. So the 
task is on_rq and the owner list.

When owner wakes up, try_to_wake_up() calls activate_blocked_waiters()
and do_activate_blocked_waiter() just skips the delayed task as above.

Or am I missing something?

> +		}
> +		if (task_on_cpu(task_rq(p), p)) {
> +			/*
> +			 * Its possible this activation is very late, and
> +			 * we already were woken up and are running on a
> +			 * different cpu. If that task blocked, it could be
> +			 * dequeued (so on_rq == 0), but still on_cpu.
> +			 * Bail in this case, as we definitely don't want to
> +			 * activate a task when its on_cpu elsewhere.
> +			 */
> +			return;
> +		}
> +
> +		scoped_guard (raw_spinlock, &p->blocked_lock) {
> +			/*
> +			 * Again, if activation is delayed, it's possible the
> +			 * task has been woken and is no longer blocked_on,
> +			 * but went back to sleep, so double check blocked_on
> +			 * before activating onto the owner's rq
> +			 */
> +			if (!task_is_blocked(p))
> +				return;
> +		}
> +
> +		/*
> +		 * Have to make sure we handle nr_iowait adjustment before
> +		 * we call proxy_set_task_cpu() to ensure we are adjusting
> +		 * the same runqueue we left (where block_task()
> +		 * incremented nr_iowait).
> +		 */
> +		if (p->in_iowait) {
> +			delayacct_blkio_end(p);
> +			atomic_dec(&task_rq(p)->nr_iowait);
> +		}
> +
> +		if (task_cpu(p) != target_cpu) {
> +			en_flags |= ENQUEUE_MIGRATED;
> +			psi_ttwu_dequeue(p);
> +			proxy_set_task_cpu(p, target_cpu);
> +		}
> +		rq_lock_irqsave(target_rq, &rf);
> +		/*
> +		 * proxy_enqueue_on_owner() called block_task() which
> +		 * increments nr_uninterruptible, so we need to reverse
> +		 * that when we activate the blocked waiter
> +		 */
> +		if (p->sched_contributes_to_load)
> +			target_rq->nr_uninterruptible--;
> +		update_rq_clock(target_rq);
> +		activate_task(target_rq, p, en_flags);
> +		resched_curr(target_rq);
> +		rq_unlock_irqrestore(target_rq, &rf);
> +	}
> +}
> +
> +static void activate_blocked_waiters(struct rq *target_rq,
> +				     struct task_struct *owner,
> +				     int wake_flags)
> +{
> +	struct list_head bal_head;
> +	unsigned long flags;
> +	int en_flags = ENQUEUE_WAKEUP | ENQUEUE_NOCLOCK;
> +
> +	if (!sched_proxy_exec())
> +		return;
> +
> +	/*
> +	 * A whole bunch of waiting donor tasks back this blocked
> +	 * lock owner task, wake them all up to give this task its
> +	 * 'fair' share.
> +	 *
> +	 * This is a little unique here and the locking is messy.
> +	 * At this point we only hold the blocked_lock, so the
> +	 * owner task may be able to run and do all sorts of
> +	 * things while we are processing the blocked_head list,
> +	 * including going back to sleep, which can cause tasks
> +	 * to be added to the owners->blocked_head while we are
> +	 * processing it!
> +	 * Thus, we pull the entire list off the owner->blocked_head
> +	 * here so that we will only process a finite amount of
> +	 * tasks. Tasks added after this will be processed by the
> +	 * future wake events.
> +	 * Even though we have pulled the list off the blocked_head
> +	 * the removed list is *still* "owned" and serialized by
> +	 * the owner->blocked_lock! As we have to serialize against
> +	 * mid-chain wakeups, who may try to remove themselves from
> +	 * the list.
> +	 */
> +	raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +	if (!list_empty(&owner->blocked_activation_node)) {
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		return;
> +	}
> +
> +	if (list_empty(&owner->blocked_head)) {
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		return;
> +	}
> +
> +	get_task_struct(owner);
> +	INIT_LIST_HEAD(&bal_head);
> +	list_add_tail(&owner->blocked_activation_node, &bal_head);
> +	raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +
> +	while (!list_empty(&bal_head)) {
> +		struct list_head tmp_head;
> +
> +		INIT_LIST_HEAD(&tmp_head);
> +		owner = list_first_entry(&bal_head, struct task_struct, blocked_activation_node);
> +
> +		raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +		list_replace_init(&owner->blocked_head, &tmp_head);
> +		list_del_init(&owner->blocked_activation_node);
> +		while (!list_empty(&tmp_head)) {
> +			struct task_struct *p;
> +
> +			p = list_first_entry(&tmp_head,
> +					     struct task_struct,
> +					     blocked_node);
> +			WARN_ON(p == owner);
> +			__proxy_remove_from_sleeping_owner(owner, p);
> +			raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +
> +			do_activate_blocked_waiter(target_rq, p, en_flags);
> +
> +			raw_spin_lock_irqsave(&p->blocked_lock, flags);
> +			if (list_empty(&p->blocked_activation_node)) {
> +				get_task_struct(p);
> +				list_add_tail(&p->blocked_activation_node, &bal_head);
> +			}
> +			raw_spin_unlock_irqrestore(&p->blocked_lock, flags);
> +
> +			raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +		}
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		put_task_struct(owner); // put matches get prior to adding to local bal_head
> +	}
> +}
> +
> +static inline struct task_struct *proxy_resched_idle(struct rq *rq);
> +
>  /*
>   * Checks to see if task p has been proxy-migrated to another rq
>   * and needs to be returned. If so, we deactivate the task here
> @@ -3872,6 +4120,10 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
>  {
>  	return false;
>  }
> +
> +static inline void activate_blocked_waiters(struct rq *target_rq,
> +					    struct task_struct *owner,
> +					    int wake_flags) {}
>  #endif /* CONFIG_SCHED_PROXY_EXEC */
>  
>  static void
> @@ -3945,8 +4197,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  
>  	update_rq_clock(rq);
>  	if (p->is_blocked) {
> -		if (p->se.sched_delayed)
> +		if (p->se.sched_delayed) {
> +			proxy_remove_from_sleeping_owner(p);
>  			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
> +		}
>  		if (proxy_needs_return(rq, p))
>  			return 0;
>  	}
> @@ -3975,13 +4229,15 @@ void sched_ttwu_pending(void *arg)
>  	update_rq_clock(rq);
>  
>  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> +		int wake_flags;
>  		if (WARN_ON_ONCE(p->on_cpu))
>  			smp_cond_load_acquire(&p->on_cpu, !VAL);
>  
>  		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
>  			set_task_cpu(p, cpu_of(rq));
>  
> -		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
> +		wake_flags = p->sched_remote_wakeup ? WF_MIGRATED : 0;
> +		ttwu_do_activate(rq, p, wake_flags, &rf);
>  	}
>  
>  	/*
> @@ -4488,6 +4744,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		ttwu_queue(p, cpu, wake_flags);
>  	}
>  out:
> +	activate_blocked_waiters(cpu_rq(task_cpu(p)), p, wake_flags);
>  	if (success)
>  		ttwu_stat(p, task_cpu(p), wake_flags);

Wouldn't this be unnecessary in some cases? Like:

TA sends a signal to its owner with TASK_INTERRUPTIBLE,
while it's owner has  TASK_UNINTERRUPTIBLE.

	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
		smp_mb__after_spinlock();

		if (!ttwu_state_match(p, state, &success))
			break;

In this case, ttwu_state_match() returns false. So we break. And even if
we didn't waked up we get all of our tasks to our rq.

Wouldn't it would be better to only call this when we only
wake up? Or am I missing something?



Thanks,

Kayra
