Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE5A486420
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057225; cv=none; b=HWHAEeXfm7HtnTcIbmw+PrA2aAtIFDENrF4Rglm+uogH51AqzhRc1Ak1cpEtqWButoLz58/t6qBkJ5B+rVBu9U9xFeGsd2stHn+7jaUQxAUqCqW8WSKYEo1YJfB+ccI0ooYCFM+FwNKmnzitNlWuL4r51dzFUSH/T48FaoUvWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057225; c=relaxed/simple;
	bh=FeKcYQSV4etwG9OQDmc8a0ITGQqZD7bRPaFKN6wEgJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1Dg1LFon9/5NWFBauAo0PpAYpsIjOIciPVrOpW9eDI18nwuuEfwxbzdImrN7XnzqzBGbyzQsngWyV900NL4otVpqTo8MEQJyweSKPCcJCpGodq8RKN1xNQE68V+7FpBAvgJxROO923KkNUckfdikekVxKcxuOSB8AUWeNLYz8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y1V8WnKI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y1V8WnKI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FLW0TC0HDOXwkcjCco/eu8rST/qLgRh8Wha95eod6CE=; b=Y1V8WnKII1F8vwN453wf+FGmU5
	BYW5TPG3iTRDBQeMQe6t9+dR/3I4Dmnhi5F0Txz97H+oM50S/+qLKtBmWDt5CP143eXFndECNo2qf
	PSmL39zjOwimqdm7uffjmTA4j/Xc8dnliLUsFxuSp/LJEkOFtO5GM0rsxck5R6IjG17Q/1e6mZH/g
	uwmKWDi/MCbqTfhSLakBIrjNaI4UOK0S7F2AYkAYHuy/ZtCtm/SfT5FP631HboXrxB28BJlne6kpC
	wYKABTZgIwtrLXuJtTf454/5usGO81dlyxmLptcmznjvPMk/dwFGmWhFgFIyNw+zymyzpDJFqKfY8
	RS+vafCw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHHwX-00000000Bjc-48x3;
	Thu, 15 Oct 2026 09:40:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D063302F8E; Thu, 15 Oct 2026 11:40:08 +0200 (CEST)
Date: Thu, 15 Oct 2026 11:40:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hui Su <sh_def@163.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Avoid overflow in place_entity()
Message-ID: <20261015094008.GW4120091@noisy.programming.kicks-ass.net>
References: <20260928124754.1692077-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928124754.1692077-1-sh_def@163.com>

On Mon, Sep 28, 2026 at 09:47:54PM +0900, Hui Su wrote:
> place_entity() inflates an entity's virtual lag with
> 
>     lag * (load + weight) / load
> 
> Commit 4823725d9d1d ("sched/fair: Increase weight bits for avg_vruntime")
> replaced the scaled-down weights used in this calculation with
> avg_vruntime_weight(), removing the arithmetic headroom provided by
> scale_load_down().
> 
> The multiplication can overflow s64 before the division even when the
> final quotient is representable. A task's hierarchical effective weight
> can be as small as 2 after avg_vruntime_weight() scaling under group
> scheduling, while entity_lag() bounds |vlag| by
> 
>     calc_delta_fair(cfs_rq_max_slice(cfs_rq) + TICK_NSEC, se)
> 
> For example, with HZ=1000, NICE_0_LOAD=1048576, and the minimum scaled
> hierarchical weight scale_load(2)=2048, this bound is 891289600. With 114
> maximum-weight entities, the runqueue load is 10361604096. The
> intermediate product is:
> 
>     891289600 * (10361604096 + 2)
>         = 9235189971864780800
>         > S64_MAX
> 
> The signed overflow corrupts the entity's placement.
> 
> Rewrite
> 
>     lag * (load + weight) / load
> 
> as
> 
>     lag + lag * weight / load
> 
> The two expressions are equivalent, but the latter avoids multiplying the
> virtual lag by the total runqueue weight. entity_lag() bounds vlag against
> the entity's effective weight, so the remaining lag * weight product stays
> bounded. rescale_entity() preserves this scale across h_load changes and
> already relies on the same product when rescaling vlag.
> 
> Keep the original zero-load warning semantics by multiplying lag by weight
> after replacing the divisor with one.
> 
> Fixes: 4823725d9d1d ("sched/fair: Increase weight bits for avg_vruntime")
> Signed-off-by: Hui Su <sh_def@163.com>
> ---

Indeed so; however I've rewritten things like below. Hope that works for
you.

---
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83a6a99..6ce7233cd339 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6266,12 +6266,20 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 		load = cfs_rq->sum_weight;
 		if (curr && curr->on_rq)
 			load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
-
-		weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);
-		lag *= load + weight;
 		if (WARN_ON_ONCE(!load))
 			load = 1;
-		lag = div64_long(lag, load);
+
+		weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);
+
+		/*
+		 * Rewrite, because the product (W + w_i)*vl'_i might
+		 * overflow s64:
+		 *
+		 *   vl_i = (W + w_i)*vl'_i / W
+		 *        = (W*vl'_i + w_i*vl'_i) / W
+		 *        = vl'_i + w_i*vl'_i/W
+		 */
+		lag += div64_long(lag * weight, load);
 
 		/*
 		 * A heavy entity (relative to the tree) will pull the
