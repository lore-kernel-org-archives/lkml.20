Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32953359A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072395; cv=none; b=cR03SOuyUPBA9YXi0Cpj3I/cmORLK3rR+O1/5ZgGZVN/pPDImESWHnLDqhIGFXUQDKuHYzLGEPPFc7DnRn9qsS8/7+8UR5SC81cjycnLlcbP55371PDNnM0u5ghwfeEC9X/1fWGgmLSl+M+PjWI5Vq+jnNpTFh0JWwJNfUpret0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072395; c=relaxed/simple;
	bh=9ZIx6hCzaagwHIVNpanCCamcLeL0IjcXqNXCk5Dupfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfHJdZJHOXCleUFa0kLhur72a97tTgrPwifBxBnG+L2XlyhBbmy2utvsf7vcOf8pXaxIbgcgi6eIeN/2CEsO8Nw7Sxcdc0wKqijyB3KorSzKqU3T/k7HeJidSE6L9uG2TGV8f72a91gOjnZvu760eYcFswOc0bN2BIoc1znpKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X3i86bBM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X3i86bBM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=w/jFYS2Lavdop6AozOiikY5mafstNYtaNxOmlZYiKOg=; b=X3i86bBMDUnnuClu5rLSJT+U7Q
	ARDJM7IrQn8trF+ZlbhBq78IkAbwxmwh/Y6ykF1xLRDvIlx2NalirKuHFJFe+tu0BQk+8b3eS39w6
	Q7K3vHqFeko1C1ulwTNBaCrd3/+Qy3XPP3mazGse52jLXvZ/7Np30a1sbSGHhqvOIYZ0+M19qQYdv
	cAOI1lb9enz9C6w+sEzLMzRP0m8lgkRrbKtWJ50ZLM/AtSwaUfoaK8vnhXAJUqIG3mm/U4mvhUGTz
	cggBKHsypOC5pRUJ6+WdntBHx7ZT+syalPXjkVkbq35HkS25NTpDiVLg693IPa+chmAQ01IVL++Gx
	vJlF80Pw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xan-000000089vz-1slu;
	Tue, 22 Sep 2026 10:19:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3920A300708; Tue, 22 Sep 2026 12:13:04 +0200 (CEST)
Date: Tue, 22 Sep 2026 12:13:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, qyousef@layalina.io
Subject: Re: [PATCH 5/8] sched/eevdf: Reset lag when waking up on idle cpu
Message-ID: <20260922101304.GQ776954@noisy.programming.kicks-ass.net>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
 <20260921152238.3804392-6-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921152238.3804392-6-vincent.guittot@linaro.org>

On Mon, Sep 21, 2026 at 05:22:35PM +0200, Vincent Guittot wrote:
> When several tasks wake up simultaneously on an idle CPU, their final vlag
> will depend of the ordering as the first one will lose its lag but not
> the next ones.
> Reset the lag when the enqueue happens while no fair task has already been
> picked et set as the running task.
> 
> As a typical example:
> CPU0 is idle
> TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
> Depending which grab the lock 1st the behavior will be different:
> If TA is enqueued 1st, TB will be enqueued with a positive lag and will
> be picked 1st.
> But if TB is enqueued 1st, it will loose its positive vlag and both TA and
> TB will have 0 vlag when fair will pick a task.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/fair.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 4230954d10d0..739a3af60520 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -900,7 +900,7 @@ static __always_inline
>  void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  {
>  	s64 vlag = se->vlag;
> -	s64 delta_exec;
> +	struct rq *rq;
>  
>  	WARN_ON_ONCE(se->on_rq);
>  
> @@ -908,18 +908,25 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  	if (vlag <= 0)
>  		return;
>  
> -	if (flags & ENQUEUE_MIGRATED)
> -		return;
> +	rq = rq_of(cfs_rq);
>  
> -	/* Compute the sleep time */
> -	delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
> -	if (unlikely(delta_exec <= 0))
> -		return;
> +	if (rq->curr == rq->idle) {
> +		/* You can't claim any lag when waking on idle CPU */
> +		vlag = 0;

Right. As I mentioned during OSPM, one of the crazy ideas I had was to
do something like the below. All of the lag stuff only makes sense while
there is contention.

Now, I've not actually tried this -- and at the very least the migation
case is broken. But it should very much capture the rq->curr == rq->idle
case and then some.


diff --git a/include/linux/sched.h b/include/linux/sched.h
index dac15ec36d1e..70fe8fadafac 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -592,6 +592,7 @@ struct sched_entity {
 	u64				vruntime;
 	/* Approximated virtual lag: */
 	s64				vlag;
+	u32				vlag_seq;
 	/* 'Protected' deadline, to give out minimum quantums: */
 	u64				vprot;
 	u64				slice;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2ad46fb2eafe..3e3dde5f2117 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -898,6 +898,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
 			vlag = min(vlag, 0);
 	}
 	se->vlag = vlag;
+	se->vlag_seq = cfs_rq->idle_seq;
 
 	return avruntime - vlag != se->vruntime;
 }
@@ -6397,6 +6398,9 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 	if (flags & ENQUEUE_QUEUED)
 		nr_queued -= 1;
 
+	if (se->vlag_seq != cfs_rq->idle_seq)
+		se->vlag = 0;
+
 	/*
 	 * Due to how V is constructed as the weighted average of entities,
 	 * adding tasks with positive lag, or removing tasks with negative lag
@@ -8374,6 +8378,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 
 	dequeue_hierarchy(p, flags);
 
+	if (!cfs_rq->h_nr_queued)
+		cfs_rq->idle_seq++;
+
 	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
 		se->deadline -= se->vruntime;
 		se->rel_deadline = 1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8..0f0edb77e235 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -689,6 +689,7 @@ struct cfs_rq {
 	u64			sum_weight;
 	u64			zero_vruntime;
 	unsigned int		sum_shift;
+	u32			idle_seq;
 
 #ifdef CONFIG_SCHED_CORE
 	unsigned int		forceidle_seq;
