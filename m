Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183791;
	b=JT26OxBKhDYA7RgPG8ZvDQWG4zylCQwBdKt5lf7CQCPSI/wv23qn/k6ACvCj01M9o4cM
	 KDtEDUpsb6PgBYVdGlt0QlaQdQYLsX3tf2IKKEeDaZqoxirpa2bOvU4y+TY4d9dUWMWYH
	 7m/SmNJMpRepphI+0URfgZ/ARtvtmWHGhWzgSr6BZO2w1ZLadSCK1tI3e3Ste7Z3Gj9S5
	 Y2Ns5VpMfpKz3dqMmIzlSNauDlovxWCR6umbH3GOaW5bzUHz209lUiVqyvgtlj4auwsV9
	 A7vWNMIsjbysiJOO57KDJnPJkkvqp5gk7tg7xwMFLXJJ1poeh4tqoxM6aBS3gYFa4XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183791;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hqfIbMaslfTCor3koCS6fx+i2YjaP1qGPCjSZegNUf4=;
	b=ga+DR4RzPriBbZvSb0YAM/09plBSk/zdpdyC39r/yrJpmnfXn0QWvT403k6e+cmfSdWM
	 fIFOI5WiWkhfl9MEue5j87FRjDQiGjHKYHiHqlAJ0MXIHUPCKbxHT07cpqRLRy5DQQAOG
	 mAYCOzmXW1W1WvKr+pY9N/ow43uZSZ9dGZLb/1wQOYUK2rw5pdW1sXATYCGW/pBR6qTky
	 ItvAQhby1C99y89Xp0qKJGJP9GsP7fIR703fTqzTMZnWy5JaubPMI22EIM17pGddGa86M
	 lNWuGm/EeqUrAk1c007GqHSA2bGG63Zxi+x1va1yQhICn9gQOYyEmkrPOkfPQHPsaaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cmTbcXAQ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mTiM0StS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cmTbcXAQ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=mTiM0StS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793183789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hqfIbMaslfTCor3koCS6fx+i2YjaP1qGPCjSZegNUf4=;
	b=cmTbcXAQ4oMsGr8C72tqPbEQcNUDZYjXqYUcZj44lfq/t/55FVF5zK8yIuGGzmB9HOv76h
	nq2wGxoMmtyoCbGoee3DA7MwLSJfxpqDXfewtkhCbXIPtPwfOBmZIMHc11lLA+DD3WWBBt
	QCOIJLMth8NroyIE8hwxVkU3euYMSBw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-_XqJCKKqN62PTxIq-xyD3Q-1; Wed, 28 Oct 2026 06:36:28 -0400
X-MC-Unique: _XqJCKKqN62PTxIq-xyD3Q-1
X-Mimecast-MFC-AGG-ID: _XqJCKKqN62PTxIq-xyD3Q_1793183787
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so7287735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793183787; x=1793788587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqfIbMaslfTCor3koCS6fx+i2YjaP1qGPCjSZegNUf4=;
        b=mTiM0StSbXHzjf7a1nV/eW3maV1d4ovb1SJxYuXMnR78v4BEoELm5jD8TrdTujpNAs
         2Jkn0HEDEcSfLagPqTQwYCdPzxobT9edLdpm9x7fN2jpC7z+FZaCbJlOJLts6TY+iw11
         VGtuGyExrJixbaQDsnTs3Xy5ZayA0ciHcISm+Xo4SAUo1tEPix8594a97nEbq/apxt7j
         9JghsxkvGa/udpNLLq15PKhOvTGkEh5N+chszdNJ5yAZ09q9mNTsW+2HxQk+by+ymPr7
         wVjLMqCKWbOPXRgj8JZLUjAQEnQcAE+bKEWtlh9aep1B3DBFaIS+8OCQIb9og7nfsASC
         D9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183787; x=1793788587;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqfIbMaslfTCor3koCS6fx+i2YjaP1qGPCjSZegNUf4=;
        b=JLZVNnrumnyw8NKL3ThyjaGm7W6sV3BbI5XBtoiP+UdKFxFaTMHo87XHX8IH9SHAJu
         FD+O/Fk/pN1c4n4PYxllcK+fgWnQSD0ucJe8DK57mFcWYAIMseCW6SKeBaPhZBawADmZ
         Z14WH5kNNOGfIShoGgkl4ZSZcbznd+Ku5YWPQ0qh0kUyaF3jCKJziqqQron2ygF9fTn9
         95UpzSLM+0z5DqUfx1w/f4edotM1dOly+9sYPE8lzofZhZK/Hxt3Mmg3S+ebjl52h3Ru
         tA5ZcpQ17Hbnfy9twOtxfiuoOx0om0svg7L0RCWhc9fjMOEHqc60wwMFjbmENqYGXN1l
         PDww==
X-Forwarded-Encrypted: i=1; AKwUvBzo3CsG+4+5JeWf7Mtgvgr3F/uwoLC56CTSR7B+z6AoPFxbWSt7JJ8+gmM7+9CQ0G9cfx9XsqRMhNl7K1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv5nQHRwNH29RisH0rNLqbEl0QKYiLFPcQoHaYfUuwz34Ud+1c
	nWf+Vc3WyyTnL6R1/Yauph+lkgLrEfDrJ6RxU9qIsqh0wfW+eaRkNooH4OVjaZ0WpDmcyuaFyGE
	jium5mlxXcB8sc27X67hNUp5T9EZoG20BbUc05beXSUwrrHeUWegUCFR2pdN/jAmGjQ==
X-Gm-Gg: AYBFou0eqthRFCHLRGS94psUjbSNrPXDC6T+zDIgoYets4Lc2yYSXyKHoRg7NTlZbqf
	/sX95eMPHhGvezKJSkNwtlZLiKwHLF6LzARuQT4B+PNfMTuUHODu1jYKgGw4iLH9v72HIOBc/2R
	v/DcSsxRYWr/qsOxK5or+DKcHOaameRYvMnYjGWW8SUJJLcrPvbjO3pZNZ0McPRkNO73XVk3uY9
	94b3R9a+IUK8EZJhi2IhtrEhYKmOEcPS3hKsnMo6kCZVb+dENrXtqavGBpWNxhmQEj4z0KcWTn2
	1S+EbwFtLre36TF2ThyeLADzsRAm0yzOdQxrKuKwK+F/OEPdl4yH109+jY/J9kV/4/3xFlIXQ8y
	FkCx1b71QBwAYM1dXhjxg+4JkZ3SKJe6SXgJQz66yUMXu2KkHw9lxpwS2Yj+UcErST2KtgWxSZK
	zlVr4=
X-Received: by 2002:a05:600c:4e8c:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4a9647ab576mr36471575e9.3.1793183787250;
        Wed, 28 Oct 2026 03:36:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8c:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4a9647ab576mr36470935e9.3.1793183786797;
        Wed, 28 Oct 2026 03:36:26 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.0.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm27370730f8f.42.2026.10.28.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:36:26 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:36:23 +0100
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
Message-ID: <auHQJ8vq6VtL2Uf0@jlelli-thinkpadt14gen4.remote.csb>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com>
 <atx1U_0FC-fazkV7@gpd4>
 <267d3f71-7f60-48d2-b8dc-bf87f403b94f@amd.com>
 <auDPxCTyGbStTWJD@jlelli-thinkpadt14gen4.remote.csb>
 <a3bb6028-52f9-4545-a5f1-08f56fa6ac2a@amd.com>
 <auHH9ixQvWQ7RYA3@jlelli-thinkpadt14gen4.remote.csb>
 <1bfd6376-cc69-4c55-ac3b-6ea12b8c6c75@amd.com>
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
In-Reply-To: <1bfd6376-cc69-4c55-ac3b-6ea12b8c6c75@amd.com>

On 28/10/26 15:41, K Prateek Nayak wrote:
> 
> 
> On 10/28/2026 3:31 PM, Juri Lelli wrote:
> > On 28/10/26 09:06, K Prateek Nayak wrote:

...

> >> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> >> index c0ebdcde5fe5..6a081c2b7191 100644
> >> --- a/kernel/sched/deadline.c
> >> +++ b/kernel/sched/deadline.c
> >> @@ -2654,19 +2654,23 @@ select_task_rq_dl(struct task_struct *p, int cpu, int flags)
> >>  
> >>  static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused)
> >>  {
> >> -	struct rq_flags rf;
> >>  	struct rq *rq;
> >>  
> >> -	if (READ_ONCE(p->__state) != TASK_WAKING)
> >> +	/* Inactive timer is not armed. Nothing to migrate! */
> >> +	if (task_on_rq_migrating(p) || !p->dl.dl_non_contending)
> >>  		return;
> > 
> > But a task can be blocked/sleeping and non_contending if
> > task_non_contending() was called after 0-lag; in that case running_bw
> > was subtracted already (see zerolag_time < 0 -> dl_task case) but ..
> 
> I see what you mean and I didn't see that the sub_rq_bw() is outside
> the p->dl.dl_non_contending block but simply checking
> task_on_rq_migrating() for bail out should be enough to cover off
> !ENQUEUE_WAKEUP cases right?
> 
> > 
> >> -	rq = task_rq(p);
> >> +	/* Task must be fully blocked if we reach here. */
> >> +	WARN_ON_ONCE(!p->is_blocked);
> >> +
> >>  	/*
> >> -	 * Since p->state == TASK_WAKING, set_task_cpu() has been called
> >> -	 * from try_to_wake_up(). Hence, p->pi_lock is locked, but
> >> -	 * rq->lock is not... So, lock it
> >> +	 * set_task_cpu() has been called from try_to_wake_up().
> >> +	 * Hence, p->pi_lock is locked, but rq->lock is not...
> >> +	 * So, lock it
> >>  	 */
> >> -	rq_lock(rq, &rf);
> >> +	rq = task_rq(p);
> >> +	guard(rq_lock)(rq);
> >> +
> >>  	if (p->dl.dl_non_contending) {
> >>  		update_rq_clock(rq);
> >>  		sub_running_bw(&p->dl, &rq->dl);
> >> @@ -2681,7 +2685,6 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
> >>  		cancel_inactive_timer(&p->dl);
> >>  	}
> >>  	sub_rq_bw(&p->dl, &rq->dl);
> > 
> > .. we still need to sub_rq_bw for a migrated task, and I believe what
> > you are proposing would skip that?
> 
> Ack! But this is only needed for wakeup so just:
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index c0ebdcde5fe5..20c388b55c50 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -2657,7 +2657,7 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
>  	struct rq_flags rf;
>  	struct rq *rq;
>  
> -	if (READ_ONCE(p->__state) != TASK_WAKING)
> +	if (task_on_rq_migrating(rq))
>  		return;
>  
>  	rq = task_rq(p);
> ---
> 
> should be enough then?

It is enough, but I now fear too 'broad'? :)

Looks like dl_task_offline_migration() ends up here via set_task_cpu();
in that case the task was throttled and found the cpu was running on has
been hotplugged so it needs a new cpu at replenishment. All bandwidth
accouting is done by dl_task_offline_migration() itself, the task is not
WAKING so migrate_task_rq_dl() has nothing to do and bails early
correctly. If we use task_on_rq_migrating() it won't bail early anymore
and double subtracting? Adding !p->is_blocked seems to cover this case
as well?

