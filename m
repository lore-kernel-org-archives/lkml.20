Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04EE1FA272
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603687; cv=none; b=HTiy49xwftsQvG0t/jCWvu0DeGtJTL0hIIFqTi+dn0wqmHS/ab0Qankk9gvd2sSGBo3ciLlgH/zY4P0pijp6lr24gTODD+GQpx8UZCExxlH8UEyu8/9hzQXnJAfLw9yG4RLAvz0pkrqongLI9GOndQtraULG5RdNYITV3zrgvaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603687; c=relaxed/simple;
	bh=LjmfDRNBEjGYTsn0/17oKo0akdmCEoT31H9y+6WTRuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlQEG1vDvhNipgE2C2Wykd5/dHN67K0VTL9S6Jz2/1x55d+pum7wNI7e5iY/8KGVghCh70mRMDX2TyVloJ1OczCdndiiGsABpkDufBVWhxYrC8Soq6IUFqT3YUcXLWFptlbNMPS01oCE5+W2Tm7UV6DjvDFQXVbDm5/WmEkW1i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=GG3bOfhp; arc=none smtp.client-ip=202.108.3.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="GG3bOfhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789603683;
	bh=hKjnpvXTojaVU5YIzpdNIrqfBtMirn+eCnJFcui5yEg=;
	h=From:Subject:Date:Message-ID;
	b=GG3bOfhpJ5zcNk5BG0UqXSI5cYC8VM/yWrUt4KTZtx2TZBHTbMEvMvaYN1P/co4m3
	 Tw3WIIs/tSL3MLk0O1oFdY5UpIuMq3WCPeWvgm86jwwwUKIWzpWqQJZkTOgtwcemY2
	 BN3Vzpz1qI6fOMdnO28BAOgSP7npUB7TxadIQoe4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.31) with ESMTP
	id 6AAB2F5500000181; Thu, 17 Sep 2026 08:07:51 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8931646815926
X-SMAIL-UIID: 98200398C3E643C3AC30E941A3E8AE43-20260917-080751-1
From: Hillf Danton <hdanton@sina.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for vmap drain
Date: Thu, 17 Sep 2026 08:07:37 +0800
Message-ID: <20260917000738.115-1-hdanton@sina.com>
In-Reply-To: <aqq9FM3ti6NIHxQ0@milan>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Sep 2026 18:00:20 +0200 "Uladzislau Rezki (Sony)" wrote:
> On Wed, Sep 16, 2026 at 08:12:27AM +0800, Hillf Danton wrote:
> > On Mon, 14 Sep 2026 18:56:26 +0200 "Uladzislau Rezki (Sony)" wrote:
> > > This patch does not use queue_work_on() semantic thus i do not want to
> > > queue all helpers on current CPU. Instead scheduler does balancing and
> > > that is it.
> > > 
> > [Fair queue in the Eric Dumazet accent]
> > 
> > +static bool
> > +schedule_drain_vmap_work(struct workqueue_struct *wq,
> > +		struct work_struct *work)
> > +{
> > +	if (wq)
> > +		return queue_work(wq, work);
> > +
> > +	return false;
> > +}
> > +
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/workqueue.h#n697
> > 
> > static inline bool queue_work(struct workqueue_struct *wq,
> > 			      struct work_struct *work)
> > {
> > 	return queue_work_on(WORK_CPU_UNBOUND, wq, work);
> > }
> > 
> > queue_work_on
> >   __queue_work
> > 	if (req_cpu == WORK_CPU_UNBOUND) {
> > 		if (wq->flags & WQ_UNBOUND)
> > 			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
> > 		else
> > 			cpu = raw_smp_processor_id();
> > 	}
> > /*
> >  * When queueing an unbound work item to a wq, prefer local CPU if allowed
> >  * by wq_unbound_cpumask.  Otherwise, round robin among the allowed ones to
> >  * avoid perturbing sensitive tasks.
> >  */
> > static int wq_select_unbound_cpu(int cpu)
> > {
> >  	pr_warn_once("workqueue: round-robin CPU selection forced, expect performance impact\n");
> > }
> > 
> /**
>  * worker_attach_to_pool() - attach a worker to a pool
>  * @worker: worker to be attached
>  * @pool: the target pool
>  *
>  * Attach @worker to @pool.  Once attached, the %WORKER_UNBOUND flag and
>  * cpu-binding of @worker are kept coordinated with the pool across
>  * cpu-[un]hotplugs.
>  */
> static void worker_attach_to_pool(struct worker *worker,
> 				  struct worker_pool *pool)
> {
> 	mutex_lock(&wq_pool_attach_mutex);
> 
> 	/*
> 	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains stable
> 	 * across this function. See the comments above the flag definition for
> 	 * details. BH workers are, while per-CPU, always DISASSOCIATED.
> 	 */
> 	if (pool->flags & POOL_DISASSOCIATED) {
> 		worker->flags |= WORKER_UNBOUND;
> 	} else {
> 		WARN_ON_ONCE(pool->flags & POOL_BH);
> 		kthread_set_per_cpu(worker->task, pool->cpu);
> 	}
> ...
> }
> 
> A local CPU preference for WQ_UNBOUND is not the same as executing on
> the __bound__ per-CPU system kworker.
>
As Ulad, like Yu Zhao, is one of the couple black horses I saw in mm the
past a couple years, lad, I make the difference between BOUND and UNBOUND
workers as clear as it is.

Given numa node1 including cpu8-15 without cpu hotplug cared, a bound worker
for cpu9 can not migrate to any other cpu, while a unbound worker can run on
any cpu of node1, that is all.

Important UN/BOUND have nothing to do with eevdf (and balancing cpus) because
of different layers.

And at best I suspect what you missed is the difference between drain_vmap_work
and lru_add_drain_work, but I do not like the latter as it annoyed the RT/full
nohz apps more than thought [11].

static DECLARE_WORK(drain_vmap_work, drain_vmap_area_work);
static DEFINE_PER_CPU(struct work_struct, lru_add_drain_work);

[11] Subject: [PATCH v4 3/4] swap: apply new pw_queue_on() interface
https://lore.kernel.org/lkml/20260519012754.240804-4-leobras.c@gmail.com/
