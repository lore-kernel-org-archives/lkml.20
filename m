Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203943B3F9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028152; cv=none; b=JJ2NvsPKCq3XU6yr7Rt77Tn/fPXrL67iQ/dzautQ+HR/W5jpkijU0haielvJdNwLDr9cthTk0t88DBKFOPZmQnnyp3R2rwAtJJnkIOjwpp++EXMM5I78IuqTzNQu7J+PY4OZo3kxlCBIxzq8AJoL6XHL6rxavhqQOo9aMouADzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028152; c=relaxed/simple;
	bh=NMJcZVUYBAIAJjUbFOtjhLKA0JZJQS/EwwJD+FlJj1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b84/7j7l0MK+9V0hBr+xuMpa9LaJyEuv0x8zJaYwcVSmXmc6uagjAKbRGqx3AlcJqrmNIe2Yx7SIbIoonsE4xPflGKGKR6gFPA6A+KiwP5oBjss3r1dYKrNJyc251lFTRm+MDS9QLgjEY2OnxZuCfaAQ/LCYF43e18LWE0uFrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WlqygN3o; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WlqygN3o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JqPbgfm2s+1OMKIjxGnNiaxLWwBSEVGST3nJQuEhokk=; b=WlqygN3ou0UYH3cRdGscLUsKsS
	gr8s5ZAdC+rfzeKwFKs5gdL/rb337jTxoTkZmFSZ6FJdG6j4VvEyae5lkYTKLvKrWjfXFgU3sGrkZ
	PDidZEr8hYwGcLWR1WW1+US+6BrIUTto8i1raDrkQhz/5BEOZfbsDKZ0tFml2n1HUAu8Bu9kqUVWO
	l28LPeDK5Qy2PufLVXlXnwrhlvACm4YCfBRUwGJeFxs2pkDKM1Y3urj7jMd7sxIdusRPdOI9hP46p
	GJiHJoOYkMc8SaoZI9YUa9Nac8565TLrY6YjUapSBwT1rFLtupPNBp9HVRLGfKEDHDSE5HhYLcHwy
	hu/vfxXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZwO-0000000EASD-0hao;
	Thu, 10 Sep 2026 08:15:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0308C3005AF; Thu, 10 Sep 2026 10:15:27 +0200 (CEST)
Date: Thu, 10 Sep 2026 10:15:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Hui Su <sh_def@163.com>, linux-kernel@vger.kernel.org, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	jstultz@google.com
Subject: Re: [PATCH] sched/core: Call wq_worker_tick() for the execution
 context
Message-ID: <20260910081526.GD4120091@noisy.programming.kicks-ass.net>
References: <20260902150208.1209922-2-sh_def@163.com>
 <aphpMkGmuOrUByf3@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphpMkGmuOrUByf3@slm.duckdns.org>

On Wed, Sep 02, 2026 at 08:21:38AM -1000, Tejun Heo wrote:
> On Wed, Sep 02, 2026 at 11:02:09PM +0800, Hui Su wrote:
> > wq_worker_tick() accounts CPU time and detects CPU-intensive work for
> > the kworker that is actually running. With proxy execution, rq->donor
> > is the scheduling context while rq->curr is the execution context.
> > 
> > Calling the hook with rq->donor can skip workqueue accounting when a
> > kworker is executing on behalf of a donor task. It can also account a
> > blocked kworker when the donor is a worker but rq->curr is the task
> > actually executing. The former can delay WORKER_CPU_INTENSIVE handling
> > and pool concurrency management, which can delay pending kernel work
> > and userspace operations depending on it.
> > 
> > Use rq->curr for the workqueue tick hook while retaining rq->donor for
> > scheduler accounting.
> > 
> > Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
> > Signed-off-by: Hui Su <sh_def@163.com>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> Peter, how do you want to route this patch? It can go through either sched
> or wq.

Sorry, seems this got lost in the email deluge :/ I can take it through
sched/urgent.
