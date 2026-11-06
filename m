Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967174;
	b=UB7nchmitFzrbWOpZIPdv+KUSmScbCZwA2M7xCiQ/exMuBt/2nPW49zG/dehNudYQbvb
	 vlXWj4tTNn4exowTLs5/TLdMIj/F1RUtWf/zrHsZhtmr6gp43PrH6ba7uYDHfE+bnRIkE
	 KShUypra778aZIpBCLzXZAAdnajqmCARBWzC3pvzQhUWFB7kB6gWjiRBpg5CAcMQivIKN
	 ChhYyXxT7Nj+45xdm+sNJWcUSF483+KcppSk0iwuElSwYCD+FBsN3x2cIl9ujyf0iZMJg
	 lpn7gaNhTUAE/zz3so/k6xV6O3elsZqTX5r8sV8jzMVOLyHj2dB0o9GKk5O90tpiL3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967174;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Subject:Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pWe7Il7pn4UP9n/PBxezHmRFr5ZBNrEJVxKxZfPaX0A=;
	b=wDNXzKsAAd9wgsJV/xQaRoZRm4HUd5BBu+bJNP7Pbrrce4Yi+Fi8E99hepMZUt9b5D0N
	 1bQ0RCC+HXJ4U95hJSGXU0rIhqsTlNQTZFdwAMH9wVpC5gG80gKvn8P/ui+zdrOe1qbfV
	 wWEvk8q8lxfE0sJ4B+1D0IeyVirqy2DSkCM8EXO0d8ln3B/zkutQxFLLHKITT+g6RIwlU
	 Oc+0JcCQWNhUigbv7cMbKH6GGlOOemlOmyCqPfrM+uE4C+5/iU7Yfhldb+sZwNVIltibh
	 DsHVHb9X+TCCapVYvUegwt057CWlzYb4A6CiAFPe1meRk5h/t+MsHE4i3Q1vzN/iS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TbBX50vQ;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA7606D80F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FA7606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=TbBX50vQ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793967170; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=pWe7Il7pn4UP9n/PBxezHmRFr5ZBNrEJVxKxZfPaX0A=;
	b=TbBX50vQaPrPn0E55b5Y0QGAqtTRzECf8Zn15J1RFeCGe/0V+dxvkXNbYLTmYuTiUpcDWDMuniricJL4WoT83PwQeMASYcljrc7tyu/9Z0mX0EOm9N4iT+75umxBY97mXBdxa+LWJR213fO6Q9H7Fvnofogn5AyG0pKojplUyvM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XEBfLSc_1793967168;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XEBfLSc_1793967168 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 20:12:49 +0800
Date: Fri, 6 Nov 2026 20:12:47 +0800
From: Peng Wang <peng_wang@linux.alibaba.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: vincent.guittot@linaro.org, mingo@redhat.com, mgorman@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Fix the runtime check in preempt_sync()
Message-ID: <au3EP5eXs75wmBoZ@U-3K7XLPQ6-0046.local>
Reply-To: Peng Wang <peng_wang@linux.alibaba.com>
References: <20261106085001.36135-1-peng_wang@linux.alibaba.com>
 <20261106103140.GE1779021@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261106103140.GE1779021@noisy.programming.kicks-ass.net>

On Fri, Nov 06, 2026 at 11:31:40AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 06, 2026 at 04:50:00PM +0800, Peng Wang wrote:
> > With NEXT_BUDDY enabled, preempt_sync() only lets a WF_SYNC wakeup
> > force a reschedule once the current task has run long enough.  It
> > computes the runtime as rq_clock_task() - se->exec_start, but
> > wakeup_preempt_fair() has already called update_curr_fair() at that
> > point, which sets se->exec_start to rq_clock_task().  The result is
> > always 0.
> > 
> > Use sum_exec_runtime - prev_sum_exec_runtime instead, which is the time
> > the task has run since it was picked, and drop the now unused rq
> > argument.
> > 
> > Fixes: e837456fdca8 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
> > Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
> > ---
> >  kernel/sched/fair.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cfc9822..6164cb7 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -10090,8 +10090,8 @@ static inline bool set_short_buddy(struct cfs_rq *cfs_rq, struct sched_entity *p
> >   * multiple tasks must be woken up.
> >   */
> >  static inline enum preempt_wakeup_action
> > -preempt_sync(struct rq *rq, int wake_flags,
> > -	     struct sched_entity *pse, struct sched_entity *se)
> > +preempt_sync(int wake_flags, struct sched_entity *pse,
> > +	     struct sched_entity *se)
> >  {
> >  	u64 threshold, delta;
> >  
> > @@ -10102,7 +10102,7 @@ preempt_sync(struct rq *rq, int wake_flags,
> >  	WARN_ON_ONCE(!(wake_flags & WF_TTWU));
> >  
> >  	threshold = sysctl_sched_migration_cost;
> > -	delta = rq_clock_task(rq) - se->exec_start;
> > +	delta = se->sum_exec_runtime - se->prev_sum_exec_runtime;
> >  	if ((s64)delta < 0)
> >  		delta = 0;
> >  
> > @@ -10226,7 +10226,7 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
> >  		 * waker and less likely to be cache hot.
> >  		 */
> >  		if (wake_flags & WF_SYNC)
> > -			preempt_action = preempt_sync(rq, wake_flags, pse, se);
> > +			preempt_action = preempt_sync(wake_flags, pse, se);
> >  	}
> >  
> >  	switch (preempt_action) {
> 
> Well yes. Would you also happen to have some number on how this fix
> affects performance of WF_SYNC workloads?

> Well yes. Would you also happen to have some number on how this fix
> affects performance of WF_SYNC workloads?

Yes. I compared v7.4-rc1 with and without the fix on a bare-metal
4-socket Xeon Platinum 8369HB system. Both kernels had NEXT_BUDDY
and HRTICK enabled, with PREEMPT_FULL and HZ=1000.

The workloads were free to migrate across eight physical cores on one
NUMA node, with memory bound to that node. SMT remained enabled.

I used four boots in baseline/patched/baseline/patched order, with
three runs per workload per boot. The table shows the two boot medians
for each kernel; changes are calculated from their mean.

Hackbench exercises sync wakeups through pipe and UNIX-socket I/O.
Light used -g 1 -f 2 -l 1000000; heavy used -g 4 -f 20 -l 25000.

  hackbench, seconds          base            fixed          change
    -P pipe   light        1.244  1.250    1.252  1.225       -0.7%
    -P pipe   heavy        3.552  3.454    3.408  3.378       -3.1%
    -P socket light        1.411  1.435    1.340  1.355       -5.3%
    -P socket heavy        5.644  5.695    5.673  5.686       +0.2%
    -T pipe   light        1.346  1.332    1.333  1.299       -1.7%
    -T pipe   heavy        3.835  3.731    3.851  3.732       +0.2%
    -T socket light        1.406  1.419    1.480  1.386       +1.5%
    -T socket heavy        6.006  6.003    5.988  5.997       -0.2%

I also ran loopback TCP_RR with 1-byte requests and replies for
10 seconds per run. The eight-client rate is the sum of the
concurrent clients' rates.

  TCP_RR, trans/s             base            fixed          change
    1 client              87676  88581    88479  87534       -0.1%
    8 clients            812475 838587   815175 801202       -2.1%

Eight-client TCP_RR was 2.1% lower overall. The two successive A/B
comparisons were +0.33% and -4.46%, so the decrease was not consistent
across the two pairs.

Thanks,
Peng
