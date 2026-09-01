Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7A547206A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253764; cv=none; b=X/KyqGdbgK+0scTBytS0x/yCQfLU00nu3NmagivkL4W5LmQQUjeKVOzVNDBBJ+REfK0zDvRW7WQ8iTM2I6oZdSW2ezs14mhdgvMNIuyHXAnPm4mxzWCB+nP2u3DeA9pj9jnisiv7N2kna2wCpCsl/6g10RsWUEVixSWO+veY5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253764; c=relaxed/simple;
	bh=No0g8sMpQ62w8gRG+EeMNJh/VNFdqhcrMjrIZCnCe2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjd5zE/ZJRx4/BJpfNiPnmx+OrhHrd5PK99lwWf4SS3Jk1cX0afjEQTyqb5r3SbN5dAsNmAtyvJyU0E61ikeBhfe2to3v8e8Wmt7yqnA4nbszuXmbf8QivDffP25h6/Hmb6WFZERco3uY+vwERd/kiX/L2By9SSWwgpByyLVBXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jK6t+CDm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jK6t+CDm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=czh3rQAWAmJyiyiLMm64PQaNiIh2S51TPnPG1qoRn4g=; b=jK6t+CDmAUicfWHGYjsrPPugUy
	KUPA77dVMrLsAO3sOkKQJwbHtYgr6z7oyU/oB61XjwBANQkSUyx/TnOhLRzlj0qn+99bsDFr0bP6n
	Pb2pWsK8uuwWawtqnl4nEmvZFn8pfjBihFHyUHKeheg0/Qxeyx3xFOv+sebDzTJ52b65rt6oMnfp3
	M51YHD8PabAHlIi8I9dEzf3ne6nArM9Jt/xsdmFryhAvVqRsnJ1NrMYQhGZNXITos8/2nFTuxpnzQ
	mTUH6RDHIGkoLBf2Tm4bJI3yOPBlRy0XJjFc8T8XlQ+I/10Lw9ojCFSz1roRQgBeZfEcrSCOt+O/v
	XSDcKkow==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KU1-00000004oNT-3yiM;
	Tue, 01 Sep 2026 09:08:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7EA6A30031E; Tue, 01 Sep 2026 11:08:43 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:08:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jianyong Wu <wujianyong@hygon.cn>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, jianyong.wu@outlook.com, zhongyuan@hygon.cn,
	huangsj@hygon.cn, wangfengyu@hygon.cn, yingzhiwei@hygon.cn,
	justin.he@arm.com
Subject: Re: [RFC PATCH v2 11/23] sched/cache: Introduce helpers for task
 migration decisions
Message-ID: <20260901090843.GQ4120091@noisy.programming.kicks-ass.net>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
 <20260827122816.756234-12-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827122816.756234-12-wujianyong@hygon.cn>

On Thu, Aug 27, 2026 at 08:28:04PM +0800, Jianyong Wu wrote:

> +/*
> + * Decide if migration should happen on a specific node.
> + * The node here is an LLC or a NUMA.
> + */
> +static enum llc_mig __maybe_unused can_migrate_node(int src_cpu, int dst_cpu,
> +			struct task_struct *p, bool to_pref)
> +{
> +	const struct cpumask *span;
> +	struct mm_struct *mm;
> +	unsigned long dst_util, dst_cap, tsk_util = 0;
> +	unsigned long src_util = 0, src_cap = 0;
> +	unsigned long acc_util = 0, acc_cap = 0;
> +	int node, target_cpu = src_cpu;
> +	int get_src = 0;
> +
> +	if (!get_llc_stats(dst_cpu, &dst_util, &dst_cap))
> +		return mig_unrestricted;
> +
> +	if (!get_llc_stats(src_cpu, &src_util, &src_cap))
> +		src_cap = 0;

Comparing against can_migrate_llc(), that bails with mig_unrestricted
when !get_llc_stats(src_cpu).

> +
> +	if (p) {
> +		mm = p->mm;
> +		if (mm) {
> +			if (mm->sc_stat.cpu >= 0)
> +				target_cpu = mm->sc_stat.cpu;
> +		}
> +		tsk_util = task_util(p);
> +	}

It isn't clear when !p would be valid. migration is always about a task,
no?

> +
> +	dst_util = dst_util + tsk_util;

can_migrate_llc() also adjusts src_util by subtracting tsk_util (and
flooring at 0).

> +	if (to_pref) {
> +		unsigned long dst_pre = dst_util - tsk_util;
> +
> +		if (fits_llc_capacity(dst_util, dst_cap))
> +			return mig_llc;
> +
> +		/*
> +		 * The destination is over the margin. That is a reason to
> +		 * refuse a task while the margin can still be met, but not
> +		 * while every LLC of the node is over it: no placement
> +		 * satisfies the margin then, and refusing every migration
> +		 * leaves the imbalance in place.
> +		 *
> +		 * Let the task through when the move still lowers the peak,
> +		 * that is when the source is noticeably heavier than the
> +		 * destination and carries at least two more tasks worth of
> +		 * utilization. The second condition keeps the destination
> +		 * from becoming the heavier side, which would bounce the
> +		 * task straight back.
> +		 */
> +		if (src_cap && util_greater(src_util, dst_pre) &&
> +		    src_util >= dst_pre + 2 * tsk_util)
> +			return mig_llc;
> +
> +		return mig_forbid;
> +	}
> +
> +	for_each_sched_node(target_cpu, node) {

So this iterates the nodes in the order specific to the node that
contains target_cpu..

> +		unsigned long u = 0, c = 0, nu, nc;
> +
> +		/*
> +		 * The walk starts at the anchor, so the nodes it crosses before
> +		 * reaching the source say nothing about this migration: the task
> +		 * does not live there and is not going there. Judging them only
> +		 * lets an unrelated node with room refuse the move. Start at the
> +		 * node the task actually sits on.
> +		 */
> +		if (!get_src) {
> +			if (!cpumask_test_cpu(src_cpu, cpumask_of_node(node)))
> +				continue;
> +			else

Strictly speaking this else is superfluous.

> +				get_src = 1;
> +		}

And then you skip the nodes between target and src, which are the nodes
with best locality, confusing, but lets read on..

(sometimes target == src, and you thus don't skip anything, but other
times this is the preferred cpu)

> +		if (cpumask_test_cpu(dst_cpu, cpumask_of_node(node))) {

For the node that contains dst_cpu..

> +			nu = 0;
> +			nc = 0;
> +			for_each_llc_node_span(node, span) {

Iterate the LLCs in this node..

> +				get_span_stats(span, &u, &c);

Now I'm confused again, @span is the span of the llc, but
get_span_stats() is a wrapper around get_llc_stats(), and since span is
just a single llc, why use this rather than get_llc_stats() directly?

> +				nu += u;
> +				nc += c;
> +				if (cpumask_test_cpu(dst_cpu, span)) {

If llc includes dst_cpu

(indent is getting a little out of hand here)

> +					if (fits_llc_capacity(u + tsk_util, c))
> +						return mig_llc;
> +
> +					/*
> +					 * The destination is over the margin,
> +					 * but so may be the source. Refusing
> +					 * then leaves the peak where it is:
> +					 * a LLC at seven tasks stays at seven
> +					 * while a neighbour in the same node
> +					 * sits at four, because taking one
> +					 * more would put that neighbour over
> +					 * the margin as well.
> +					 *
> +					 * Let the task through when the move
> +					 * still lowers the peak, guarded the
> +					 * same way as the aggregation path:
> +					 * the source must be noticeably
> +					 * heavier and carry at least two more
> +					 * tasks worth of utilization, so the
> +					 * destination cannot end up the
> +					 * heavier side and bounce it back.
> +					 */
> +					if (src_cap &&
> +					    util_greater(src_util, u + tsk_util) &&
> +					    src_util >= u + 2 * tsk_util)
> +						return mig_llc;
> +
> +					return mig_forbid;

This is an unconditional return..

> +				/*
> +				 * A nearer LLC only justifies vetoing this
> +				 * migration if the task would actually fit

But you just skipped the nodes between target and src, those are nearer,
no?

> +				 * there, so account for its utilization the
> +				 * same way the destination branch above does.
> +				 * Without it a LLC already holding one task
> +				 * per core still reads as having room and
> +				 * vetoes every migration towards a farther,
> +				 * genuinely idle LLC.
> +				 */
> +				} else if (fits_llc_capacity(acc_util + nu + tsk_util,

.. which renders this else superfluous, but that won't help with the
indent because you still have the chained if :-(

> +						acc_cap + nc)
> +						&& fits_llc_capacity(u + tsk_util, c)
> +						&& !util_greater(u, dst_pre))

(logical operators go at the end of the previous line, your patch is
inconsistent on this point, since that is what you do elsewhere)

> +					return mig_forbid;
> +			}
> +		}
> +
> +		/* Don't migrate if this is a good place to live. */
> +		for_each_llc_node_span(node, span) {
> +			get_span_stats(span, &u, &c);

This is shared with the above loop, meaning you're now duplicating this
work in case you fell through.

> +			if (cpumask_test_cpu(src_cpu, span)) {
> +				if (fits_llc_capacity(u, c))
> +					return mig_forbid;
> +			} else {
> +				if (fits_llc_capacity(u + tsk_util, c))
> +					return mig_forbid;
> +			}
> +		}
> +	}
> +
> +	return mig_unrestricted;
> +}
> +
>  /*
>   * Check if task p can migrate from source LLC to
>   * destination LLC in terms of cache aware load balance.
> -- 
> 2.34.1
> 
> 
