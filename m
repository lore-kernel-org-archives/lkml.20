Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9199F4F4049
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664634; cv=none; b=cHuc/wcMdxC53hADHzAlut2x5Kr5e4TCR9TvlM0D3YnMeuVbr9CBqaQag4TOzw33w6k6bnX2RFGy5Dn/SC54disIqmmY//oOO3F/vi6NVa2WLKJfCwgwyK3ujkMLY+FIg+eI4S5lshTGoBeYFob1czSXLtB5wWOiKsVxfJQcxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664634; c=relaxed/simple;
	bh=k1b9tX5Jwv3uNgscKob4uuEdw0rOMuEmq7nFj3can/8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHVdHLa22ZaEiqcvVpMjt3LGwMMJTOVlBFNiixg4cgtexftYU5/Yp1AUvSkxeLjIpL6zjWlySYRwe8RwanmFxIIbObEcF2Td9ljt4LWB448FgQMj81AVWN+h8x8vr0VyaP4Z3et0L0DEPryid3FO9/nrubDGm9Jlpoo8lRS0vXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfVZUUiv; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfVZUUiv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so1521691a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664630; x=1790269430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fH5cw0fhsMPy1+1s3VO0uTAvQBMG9JXZ6ItIaasS8bk=;
        b=AfVZUUivLfJNHSbYiEpA4A/AZkkNYcqjsXOzVrNW4S7MbXRIzX5n05Z3WNW9x6E9Qx
         G6q/+udip5NqWtDRYBWuKhcW7Cf9rQ4NpOIuxBbEyhTyslD4NMF8BxtkaFkLLWw7T/oG
         EWC2W1nVxG9cgnaYYOJ0GaxUt7UA+oZqTv+p/cerz3lbPwkdHfNEiq2dLBz3+EWwnCFr
         DnpxCgfpgXP5q6oJAAomD2/ji0Knu5mRgoifiPWHLaCSfxHHr01AXV6Klr0WvJ+olxij
         SQUihU2dsNJxDWUgRiNXWlewMgIrYQkgq1S/G9+7SLFrtqmKFpIpev/KR5pEzqhxEmfK
         Zhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664630; x=1790269430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fH5cw0fhsMPy1+1s3VO0uTAvQBMG9JXZ6ItIaasS8bk=;
        b=U6NKi9z+iSJw06h+E20bDfN89P2C7kF9+6aXaZE2ZemnYmrzmUD4RUf2aiXBCPFmaE
         CtP8TObkCY4aWMWyeieYhPvyBWqO1PE29s+u8BE7iBnR7H1pK6HMiMbFZsSXJUIvMNqx
         e7AKlUTpR8JhTXquT1wHyGUJo0oaHVm44QNgRMEPLLKpu0MD9i+sPv2X/3nBdZkc5V+t
         xz+CMdwI25kUS510PgDngzp3ytctguwqpWzWVWBxuXrjW1T78af8EsbApDZL7eH5hMsS
         r/TQQetW/SmK+B28AQNQLul3PLMsjy8dT/+MfQ90rBIDlbRSk3GqjC3LMxcj+gW6UoQw
         0tBg==
X-Forwarded-Encrypted: i=1; AKwUvBym8ZzMV2VefMbRuOVSf14u0S1ZEjaEXaERTCWWmMSDJYdIpQlkK8nCW9lFzeE6OAeAaRqG821HwffBw7k=@vger.kernel.org
X-Gm-Message-State: AFuF++l52pKvwrzLrTLr+ljdfmqgpd5UPt0pQilOpIvG3ipi1YmkReoC
	13E2WoEZmR22ZQqTvvFfrh14HuSL07QEVXBYSDHkaNT7LnqefYcsdSjD
X-Gm-Gg: AYBFou11gcmiJu1wwUFGvHJjXOb4bzZqzWIVc2/eO07L1m61bEHjRwllTBIF+NZ7Y5n
	XXmDMaUC63BZiEVjIKm6KAJ/VWPckEnOHZvC8UAGE2zGHyG9xrLr3T/mw1Z2FTy/y4CcmPpBsrT
	i2e9cvvkwg7IojfPihS/IsppOKdhiMf7HlFBOy3Twi2xM1cFamv5aW6su8FYB4i3DZSwgfvQYBY
	3vviMJJiY5bejGhyGKJeQiEl71JCppT9FFcJVP1Z/CpfvmrFJtEkqK0QroYmac+AKgmLovAMEfN
	aano4TE0ty5AAPF5hSXKfeDJ8Ma7vlJPGH96y6LZSOqF6quo7UiM1/9xR7+rTV+S/9HXwJkfuGz
	SceWpew65ankCUqqtWAQCCChWmEDTC4LSqxFrdk6yKeiPFZA1HYGbnYmhVN9csiqAicP/B9sHVj
	WIB+TyDDmLaQQhusdaOLIJeT1NGRGixBwpnv0=
X-Received: by 2002:a05:6402:440b:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6aa22375faemr10992820a12.6.1789664630199;
        Thu, 17 Sep 2026 10:03:50 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d29a1bdsm4317739a12.26.2026.09.17.10.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:03:49 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 17 Sep 2026 19:03:47 +0200
To: Hillf Danton <hdanton@sina.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>, lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for
 vmap drain
Message-ID: <aqwdc7Oh24b_bxOQ@milan>
References: <aqq9FM3ti6NIHxQ0@milan>
 <20260917000738.115-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917000738.115-1-hdanton@sina.com>

On Thu, Sep 17, 2026 at 08:07:37AM +0800, Hillf Danton wrote:
> On Wed, 16 Sep 2026 18:00:20 +0200 "Uladzislau Rezki (Sony)" wrote:
> > On Wed, Sep 16, 2026 at 08:12:27AM +0800, Hillf Danton wrote:
> > > On Mon, 14 Sep 2026 18:56:26 +0200 "Uladzislau Rezki (Sony)" wrote:
> > > > This patch does not use queue_work_on() semantic thus i do not want to
> > > > queue all helpers on current CPU. Instead scheduler does balancing and
> > > > that is it.
> > > > 
> > > [Fair queue in the Eric Dumazet accent]
> > > 
> > > +static bool
> > > +schedule_drain_vmap_work(struct workqueue_struct *wq,
> > > +		struct work_struct *work)
> > > +{
> > > +	if (wq)
> > > +		return queue_work(wq, work);
> > > +
> > > +	return false;
> > > +}
> > > +
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/workqueue.h#n697
> > > 
> > > static inline bool queue_work(struct workqueue_struct *wq,
> > > 			      struct work_struct *work)
> > > {
> > > 	return queue_work_on(WORK_CPU_UNBOUND, wq, work);
> > > }
> > > 
> > > queue_work_on
> > >   __queue_work
> > > 	if (req_cpu == WORK_CPU_UNBOUND) {
> > > 		if (wq->flags & WQ_UNBOUND)
> > > 			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
> > > 		else
> > > 			cpu = raw_smp_processor_id();
> > > 	}
> > > /*
> > >  * When queueing an unbound work item to a wq, prefer local CPU if allowed
> > >  * by wq_unbound_cpumask.  Otherwise, round robin among the allowed ones to
> > >  * avoid perturbing sensitive tasks.
> > >  */
> > > static int wq_select_unbound_cpu(int cpu)
> > > {
> > >  	pr_warn_once("workqueue: round-robin CPU selection forced, expect performance impact\n");
> > > }
> > > 
> > /**
> >  * worker_attach_to_pool() - attach a worker to a pool
> >  * @worker: worker to be attached
> >  * @pool: the target pool
> >  *
> >  * Attach @worker to @pool.  Once attached, the %WORKER_UNBOUND flag and
> >  * cpu-binding of @worker are kept coordinated with the pool across
> >  * cpu-[un]hotplugs.
> >  */
> > static void worker_attach_to_pool(struct worker *worker,
> > 				  struct worker_pool *pool)
> > {
> > 	mutex_lock(&wq_pool_attach_mutex);
> > 
> > 	/*
> > 	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains stable
> > 	 * across this function. See the comments above the flag definition for
> > 	 * details. BH workers are, while per-CPU, always DISASSOCIATED.
> > 	 */
> > 	if (pool->flags & POOL_DISASSOCIATED) {
> > 		worker->flags |= WORKER_UNBOUND;
> > 	} else {
> > 		WARN_ON_ONCE(pool->flags & POOL_BH);
> > 		kthread_set_per_cpu(worker->task, pool->cpu);
> > 	}
> > ...
> > }
> > 
> > A local CPU preference for WQ_UNBOUND is not the same as executing on
> > the __bound__ per-CPU system kworker.
> >
> As Ulad, like Yu Zhao, is one of the couple black horses I saw in mm the
> past a couple years, lad, I make the difference between BOUND and UNBOUND
> workers as clear as it is.
>
This is very good :)

> 
> Given numa node1 including cpu8-15 without cpu hotplug cared, a bound worker
> for cpu9 can not migrate to any other cpu, while a unbound worker can run on
> any cpu of node1, that is all.
> 
Right. 

<snip>
	if (list_empty(&pwq->inactive_works) && pwq_tryinc_nr_active(pwq, false)) {
		if (list_empty(&pool->worklist))
			pool->last_progress_ts = jiffies;

		trace_workqueue_activate_work(work);
		insert_work(pwq, work, &pool->worklist, work_flags);
		kick_pool_pick(pool, &wake_task);
	} else {
		work_flags |= WORK_STRUCT_INACTIVE;
		insert_work(pwq, work, &pwq->inactive_works, work_flags);
	}

out:
	raw_spin_unlock(&pool->lock);
	if (wake_task)
		wake_up_process(wake_task);
<snip>

wake_up_process(wake_task) - this guy takes care about task placement.
For us it is TASK_FAIR thus select_task_rq_fair() decides the fate of
unbound kworker.

> Important UN/BOUND have nothing to do with eevdf (and balancing cpus) because
> of different layers.
> 
> And at best I suspect what you missed is the difference between drain_vmap_work
> and lru_add_drain_work, but I do not like the latter as it annoyed the RT/full
> nohz apps more than thought [11].
> 
> static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
> static DEFINE_PER_CPU(struct work_struct, lru_add_drain_work);
> 
> [11] Subject: [PATCH v4 3/4] swap: apply new pw_queue_on() interface
> https://lore.kernel.org/lkml/20260519012754.240804-4-leobras.c@gmail.com/
>
I am not sure a drain_vmap_work should be per-cpu, IMO.

Thanks!

--
Uladzislau Rezki
