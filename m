Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181700;
	b=RT9qZdgQPI9o2Yk1izbky939fdRR+uvl2F265mzwrNOCbvtUn1la4ZQKpnHS2AGL0Fhq
	 4P7b6jKGkuDpS53rQc3Np9QMF9R4VHAzQBr+5VxfYMFLSH+t0oH45HUfDqfsn7lUFDOoF
	 4u7BqBkxO2oJ1rrzg5RskREL1xim5TOkOXcIoPJWEkiaa09R/+THlDJdhktcVYSRZQ5FI
	 Cjd8C6XWazLdZ4rUs6s67DKNVOkK6v4Bl88aUVdNKkztjrRW2gS7dCZzN+6EW4amYaHeP
	 pIKmexj8JfKEDIIz3oIzThORLzJ+8EKj4XrVm5erzWv8D88rQ5uTqJKAkaHi6+/MJOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181700;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wMYumVPwO1GzrnZKVGek6ltY8+NltcpGAKsTmvUOGK4=;
	b=ivbmXa9G9w3IzcTAGDElPlYpBq9Zz7vQxMeT8/8xN46MEQ63hB3XWLkm1F1FQfve1R8G
	 G2Vh43UhyEMrMw2BmwP8v5MwjPq/JIIuzqtir6QcZFaKvshOtp/7iwYwtTkrMc2DzTQc9
	 /bsPr2xj4FVlkJadTjsGw0MOHiz6VIzYDw3BjKqRJQ5epTyvYxGIjkWbULW6TekNmJdxF
	 ZizYiHxrc9hSeZQEmscfpiRXYoe6UftsXzgj53e3Y79+lu3T9Os6WFxgQXPPw7vALSU0g
	 Jfog39r4ysDzNpWcxLuLsO75Y+dCRzrmcKgAzkzVLwHMjeAB2l7ovd57C0vN96lGRiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZRIHYpmo;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P0dkeM5V;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02CF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02CF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZRIHYpmo;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=P0dkeM5V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793181698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMYumVPwO1GzrnZKVGek6ltY8+NltcpGAKsTmvUOGK4=;
	b=ZRIHYpmoe/VBzsG7HaXaudl/QxGSuDGDKb+5vORtKBgz/TloEfmT1KeXW82M68ttQYWI1k
	UADu4wp4diE+qBWobWQn08I3c+k6P3GkjE1x4afqDv5mm8mmkyRzLC61jT4kNCHis3z009
	bUc+MWNCrcTE7wUfT2ekbXpsoYiFxDo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-vEZz_Uy3MTyqpv5n6WPbFA-1; Wed, 28 Oct 2026 06:01:37 -0400
X-MC-Unique: vEZz_Uy3MTyqpv5n6WPbFA-1
X-Mimecast-MFC-AGG-ID: vEZz_Uy3MTyqpv5n6WPbFA_1793181696
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so12307775e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793181696; x=1793786496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMYumVPwO1GzrnZKVGek6ltY8+NltcpGAKsTmvUOGK4=;
        b=P0dkeM5VDdX30j9J1KUl5nXAjzLBbkMlWvU8idHRhU/OyhYEqbkrtY2FSMwYUC2VN9
         hhTG8l3PAniHF8Kx+qBQ1gmHj769n1k8RSjfHJn1v3z2GIsX/SrQxhPZsLlpXmbBmD1K
         9TcqV4Ko+H0tIF3Zj/W10LH4YtdhMV3wIMryJ+4njt5OOhrSFibes/e4RHFST3Jja9VT
         MCDt61m7o7JiHmzqVEOJUBJ/FpamrIoeesypQMERDjgq3stdyPFOt9DzjRUFu+xt1Wvh
         /+mWBV/PLHq2mmdXt8NiFw+6R3DnjwyZzuHqwvXpRma1iPqz2CTAmOxcVLE8q41SMRke
         eLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181696; x=1793786496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMYumVPwO1GzrnZKVGek6ltY8+NltcpGAKsTmvUOGK4=;
        b=hqEaYns5Ixjz7/9L2o8IKj1IZyvVI34WfDvOCjoznmMEKxTYTSBDUCFQSr7rfkTCOo
         o5v+Oe/DF5XiwF3Xluu6VD132YdBP2OnBVVtbtowF33rj/n08l7v1A65P8VkIIqr0phQ
         vA85sUnxE/Ugyr4UM7cz8yDMkic5yGuOLh5hlmRKFpZ8jK6PLiKjAnSUDE01DC+Jwar9
         8Bo7n/0OWlFwMOwtpN7m1F0S0iFltArFlbn6UFyqQxPpHe6nnxQgDLa1U3OcMKpHbvRk
         CPXkZtzlWKO7U0zjwxCN5CakpKF5UAMy/b+iy/Bs+WT1RJehvR2uiCDXIIJpoNwbKisT
         qpDg==
X-Forwarded-Encrypted: i=1; AKwUvBxVC4yyMu5nneJiViWvAkcI9sFk8vQmHT5xOZzmQKHA864PMA+ZRmDbWDw8Pv3lKYW5K8chTO+zNSPbLyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkn8u69fUTt32n+rOA4N3/03sosDg34H9h/mT4o2K7xQ3gwkkA
	8N3ejJBou4nVQ/FL7OHvEnLGixcw9CevlL9BF0HTqBbxt6xEVK5npx1/zD7VTOyR1uMVmv2V0Xh
	v3n3onwZMO7GGKbd13wnwLlI7bBiZPWVOxYClw24WawxC3N5sKg0P/8yghhqDRPbOxw==
X-Gm-Gg: AYBFou1cEhj2lVKmNuUoj93W2+SJbmS2wuS2FTKZIGajnp/ZHMYfpzxGiIqSdcSIN+A
	f/xNz0BDSOm31oM+75HtPR/MbykJReG7JU1EGbLNmjs81sdshsqSHxM/eDfM78TqKl8pe3Fye+n
	Cu8WUxwG+mWdg/BddOz4PW2pvIIEcUuTM71b7VfSEY0T+ebjKH0LgCkCjC4RfmpGxs8nTa7tzFK
	ierUDgLVG9rkZQWpE6256oQjM9y3xjVTink/N16XuK9ywsTN/v/pH7xE3K5yNptO6LbLNDB2pnu
	XnKkJZdWBVXtz7nIV254/jAw89D1b9qLKXJUvtStPfPXHoaoSDHGtHyiKKVNISEIcDw/Kqll127
	BdtBIHn74rXQB3pGJ4YVdRIA5Mm0kmlSlT2fb3cnwke4BmME3teRTofTn4o3cdrjZWT9QJWkBeO
	cOsiA=
X-Received: by 2002:a05:600c:3111:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4a995c2de0emr28934865e9.1.1793181694761;
        Wed, 28 Oct 2026 03:01:34 -0700 (PDT)
X-Received: by 2002:a05:600c:3111:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4a995c2de0emr28932645e9.1.1793181692714;
        Wed, 28 Oct 2026 03:01:32 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.0.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm20965865e9.2.2026.10.28.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:01:31 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:01:26 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Andrea Righi <arighi@nvidia.com>, John Stultz <jstultz@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Connor O'Brien <connoro@google.com>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	kernel-team@android.com
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
Message-ID: <auHH9ixQvWQ7RYA3@jlelli-thinkpadt14gen4.remote.csb>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com>
 <atx1U_0FC-fazkV7@gpd4>
 <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
 <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
 <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>

On 28/10/26 09:06, K Prateek Nayak wrote:
> Hello Juri,
> 
> On 10/27/2026 9:52 PM, Juri Lelli wrote:
> > Hello!
> > 
> > On 26/10/26 09:56, K Prateek Nayak wrote:
> >> On 10/24/2026 2:37 PM, Andrea Righi wrote:
> >>>> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
> >>>> +{
> > 
> > ...
> > 
> >>>> +		if (task_cpu(p) != target_cpu) {
> >>>> +			en_flags |= ENQUEUE_MIGRATED;
> >>>> +			psi_ttwu_dequeue(p);
> >>>> +			proxy_set_task_cpu(p, target_cpu);
> >>>> +		}
> >>>
> >>> Can this break SCHED_DEADLINE bw accounting?
> >>>
> >>> p is sleeping here (not TASK_WAKING, not TASK_ON_RQ_MIGRATING), so
> >>> __set_task_cpu() skips migrate_task_rq_dl(): the old rq never does
> >>> sub_rq_bw(), while ENQUEUE_MIGRATED makes the new rq do add_rq_bw(), so
> >>> this_bw is leaked on the old rq. And if p is still dl_non_contending,
> >>> task_contending() on the new rq just cancels the inactive timer, leaving
> >>> running_bw on the old rq forever and making it underflow on the new rq
> >>> the next time p blocks.
> >>>
> >>> set_task_cpu() doesn't help, because migrate_task_rq_dl() bails out
> >>> unless TASK_WAKING, so I'm not sure how to fix this case...
> >>
> >> I wonder why "p->dl.dl_non_contending" is not sufficient to know if
> >> there exists residual bandwidth on prev CPU. Seems to have been like
> >> that since commit 209a0cbda7a0 ("sched/deadline: Improve the tracking
> >> of active utilization").
> >>
> >> Only time task is non-contending is if it goes away with DEQUEUE_SLEEP
> >> or switched_from_dl() with dl_runtime.
> >>
> >> The latter doesn't need migrating the timer as the timer will either
> >> be cancelled if the task switches back to deadline, or will expire
> >> where it was queued - set_task_cpu() has no effect in this case.
> >>
> >> Only other case that marks "dl_non_contending" is sleep + wakeup and
> >> for that "p->dl.non_contending" should be sufficient. I don't think
> >> we ever do a set_task_cpu() for a blocked task other than wakeup do
> >> we?
> >>
> >> Juri, Peter, are we missing something subtle here?
> > 
> > I think Andrea's concern is valid, but I'm not sure I follow what you
> > propose Prateek (apologies!) or are you saying you don't see an issue
> > here?
> 
> Sorry for the confusion! I do see the problem and my question was why
> can't the bailout in migrate_task_rq_dl() be something like:
> 
>   (Lightly tested)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index c0ebdcde5fe5..6a081c2b7191 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2654,19 +2654,23 @@ select_task_rq_dl(struct task_struct *p, int cpu, int flags)
>  
>  static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused)
>  {
> -	struct rq_flags rf;
>  	struct rq *rq;
>  
> -	if (READ_ONCE(p->__state) != TASK_WAKING)
> +	/* Inactive timer is not armed. Nothing to migrate! */
> +	if (task_on_rq_migrating(p) || !p->dl.dl_non_contending)
>  		return;

But a task can be blocked/sleeping and non_contending if
task_non_contending() was called after 0-lag; in that case running_bw
was subtracted already (see zerolag_time < 0 -> dl_task case) but ..

> -	rq = task_rq(p);
> +	/* Task must be fully blocked if we reach here. */
> +	WARN_ON_ONCE(!p->is_blocked);
> +
>  	/*
> -	 * Since p->state == TASK_WAKING, set_task_cpu() has been called
> -	 * from try_to_wake_up(). Hence, p->pi_lock is locked, but
> -	 * rq->lock is not... So, lock it
> +	 * set_task_cpu() has been called from try_to_wake_up().
> +	 * Hence, p->pi_lock is locked, but rq->lock is not...
> +	 * So, lock it
>  	 */
> -	rq_lock(rq, &rf);
> +	rq = task_rq(p);
> +	guard(rq_lock)(rq);
> +
>  	if (p->dl.dl_non_contending) {
>  		update_rq_clock(rq);
>  		sub_running_bw(&p->dl, &rq->dl);
> @@ -2681,7 +2685,6 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
>  		cancel_inactive_timer(&p->dl);
>  	}
>  	sub_rq_bw(&p->dl, &rq->dl);

.. we still need to sub_rq_bw for a migrated task, and I believe what
you are proposing would skip that?

