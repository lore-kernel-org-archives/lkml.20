Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEBC4756DC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130590; cv=none; b=NgP9t1IUi7/lD4K2IzpHesRp4hPK6OPgpGUGe7NY6jXs8bJNUdal0DzlnMDySZGTKNnzc0gtrS3AgFDmsc0zJgCAHNwPwXZhvGK5svrvR2dBrEg5yEd7l+BjA66jRYolBIy+dbOJ8xsrPnF++YCVYHqaKB1sirEROIcOiYmKL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130590; c=relaxed/simple;
	bh=ebAe3ux+nXkFU36JpXCidSEohjFgV+g7OCijejnEImY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEwQiXsZ9fpLSCMtIEKOhOJVnJLXEliqRAZ4TOessGWctOcGTgyW4OiX+7Xue67wSUG5r6jGizw1yjGzIDSJuijwZ6/e73QeghRVEk0xovAWImeKKunP7nqMW4ABuHBdXNdvUCnr+nqmNnQU72DM+WaWcFjD8VukjNf5P5Oi4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VjpfHyB8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VjpfHyB8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yt0OxDM/R7ro5uDEIQ77T0OYppN2cNBnSY/lxruK0ts=; b=VjpfHyB8c0Ci4fZphwjKQj4iPm
	h7SClWz5+2QsAyFDW9y4aEd99YFmKkg4q0KVgl1JjG/76XcUPCjz6usmiJC/AyhJLmuVpVkm/49aN
	Gk/5Y7GchgsA6kLOBmQZIpuuhooLJOHZwEZUwXsBpjFrIMw1cdaQmqtAZhXCA4RoZuFUw2jW3z3wt
	xN66ipki72qCc+tYolg4HQKvLwrQSUcu3PTxk5SyWp+wWIVQOr7/PsnpVMceJ/+YUvxqEwomw+90R
	MsFs6bmGARdYdgIZAE/8JrRz0klFG/ivcsIlansaQL0URv5FJ8cGWy3aOhJwklJE0isGmZikrzOdJ
	nlvN6UDg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50an-0000000BvoO-3LjW;
	Fri, 11 Sep 2026 12:42:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ACAB430056B; Fri, 11 Sep 2026 14:42:56 +0200 (CEST)
Date: Fri, 11 Sep 2026 14:42:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] sched/fair: avoid recalculating curr status in
 place_entity() and requeue_delayed_entity()
Message-ID: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
References: <20260824125223.508178-1-kayracizmeci@gmail.com>
 <cover.1787737648.git.kayracizmeci@gmail.com>
 <60fd4fc5d17b706766a428b63760d1f69e6d11bb.1787737648.git.kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60fd4fc5d17b706766a428b63760d1f69e6d11bb.1787737648.git.kayracizmeci@gmail.com>

On Wed, Aug 26, 2026 at 01:15:42PM +0300, Kayra Cizmeci wrote:
> In enqueue_task_fair() a bool is calculated by cfs_rq->curr == se.
> But this information gets recalculated on requeue_delayed_entity() and
> requeue_delayed_entity() only gets called in enqueue_task_fair().
> And on place_entity() if se == curr we call the avg_vruntime_weight()
> twice with the same input. place_entity() only gets called in
> enqueue_task_fair() and requeue_delayed_entity().

I found it very hard to follow your Changelog. Could be my Friday brain.
Sorry if I misunderstood.

> @@ -8000,9 +8007,10 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  		util_est_enqueue(cfs_rq, p);
>  
>  	update_curr_eevdf(cfs_rq);
> +	curr = (cfs_rq->curr == se);
>  
>  	if (delayed) {
> -		requeue_delayed_entity(cfs_rq, se);
> +		requeue_delayed_entity(cfs_rq, se, curr);
>  		return;
>  	}
>  
> @@ -8017,18 +8025,18 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	/*
>  	 * XXX comment on the curr thing
>  	 */
> -	curr = (cfs_rq->curr == se);
> +
>  	if (curr)
> -		place_entity(cfs_rq, se, flags);
> +		place_entity(cfs_rq, se, flags, curr);

As I argued here:
  
  https://patch.msgid.link/20260813103155.GC1246887%40noisy.programming.kicks-ass.net

I suspect that case is impossible. Which AFAICT renders your whole patch
one big no-op, no?

That is, I think we want to do the below.

---
 kernel/sched/fair.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4d0b94465d19..3c7fb0684a76 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7996,7 +7996,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	unsigned long weight;
-	bool curr;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8025,23 +8024,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (p->in_iowait)
 		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
 
-	/*
-	 * XXX comment on the curr thing
-	 */
-	curr = (cfs_rq->curr == se);
-	if (curr)
-		place_entity(cfs_rq, se, flags);
 
 	if (se->on_rq && se->sched_delayed)
 		requeue_delayed_entity(cfs_rq, se);
 
 	weight = enqueue_hierarchy(p, flags);
-
-	if (!curr) {
-		reweight_eevdf(cfs_rq, se, weight, false);
-		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
-		__enqueue_entity(cfs_rq, se);
-	}
+	reweight_eevdf(cfs_rq, se, weight, false);
+	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+	__enqueue_entity(cfs_rq, se);
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
