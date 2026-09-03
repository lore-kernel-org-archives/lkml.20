Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7944B662
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434053; cv=none; b=q1qJa5du5JHz+6jPlt/oilWIAB6gaC72B4fHio5Mfywcm1mVttl9++e+yJFFMkiz9zNQZInoPyaessT2G2hrjx1Pd4opCd5UcVLhgdw+DsvgiRIZG320jYcLeHAXLPvdFWqQcjMhoHIN58MgSBoQbhxJQXZ4uYJA+5u4GJ/vfYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434053; c=relaxed/simple;
	bh=zYuMzv92FoU1OiGaK9rzR0UfK0Q0VQ3RiBM4FzAhyCY=;
	h=To:Content-Type:Subject:Date:Content-Disposition:Message-Id:
	 References:Cc:From:Mime-Version:In-Reply-To; b=UY/UZd9Ly9hrI9WFH/+dqVh1BROolNXgixSgFjxLq00zn+nLSq7cPUBIbS15Y3fezPjs7+nFGeLIu3Msw0qcKlFfFv33L1p9IYXI75XkeJI/thXwbORsK65mgUP9va7894lmx/mT2exaZ6zuXfH8WvkxhaFBnkNAhaLOwM8LONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=L7dbfm4+; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="L7dbfm4+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788434044; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=gBrOlFzYxGUBzWeuwK2gqXR8iDXV4YIeJP0g/F/U9U4=;
 b=L7dbfm4+ajPJjtLRgc6HvjIZiyYqNX4fIKPjF/DS/LgMLr+fw4Rw0DY5WCdhD6qC+NqvEj
 7hZUnxd4+ZPkx8stUuBZz+p3eyj8lKUfEjHfC4u0aAIDlOi3HQrkZy3IwmfFuNKhh/aH+D
 Z5A+jDSj7IM1UIYZoYebmDN+F6v0SYBqSqvyBVd+DCfstBMJ032mVZNhLc0JmkK+OANM8F
 lSPOzEcJ0bVPqcvC3meMiTPj80XSSK7G5Ng6Ibl+6C+eWS1m/gL9F94CB/68YSd1ipWjr7
 Pe26+73dqyQCVpS27BjT7ofbJLRwXc/gORXyy9zlFqwTTtxzjfJB5x2bLfT3JA==
To: "Peter Zijlstra" <peterz@infradead.org>
X-Original-From: Aaron Lu <ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/7] sched/core: Fix pick_next_task() self recursion
Date: Thu, 3 Sep 2026 19:13:35 +0800
Content-Disposition: inline
X-Lms-Return-Path: <lba+26a99567a+cebf83+vger.kernel.org+ziqianlu@bytedance.com>
Message-Id: <20260903111335.GA3594512@bytedance.com>
References: <20260828101659.812011872@infradead.org> <20260828104018.378378994@infradead.org>
Cc: <mingo@kernel.org>, <juri.lelli@redhat.com>, 
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>, 
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, 
	<linux-kernel@vger.kernel.org>, <tj@kernel.org>
From: "Aaron Lu" <ziqianlu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260828104018.378378994@infradead.org>

On Fri, Aug 28, 2026 at 12:17:00PM +0200, Peter Zijlstra wrote:
> It is possible for another sibling to end up in pick_next_task() when:
> 
>   pick_next_task()
>     pick_task()
>       sched_class::pick_task()
> 
> drops the core wide rq->lock. In this case they end up trampling the core wide
> task selection state, possibly leading to NULL derefs. Detect this case by
> keeping a local copy of core_task_seq, a value that is incremented on
> {en,de}queue and schedule.
> 
> Since RETRY_TASK is only possible when a higher priority task gets enqueued
> during the lock break, this must mean core_task_seq will also be incremented
> and is thus completely covered by the seq number mismatch.

For the uncookied no-sync fast path, we should check if core wide is
still uncookied after lock is re-acquired? Something like below, or we
can pick an uncookied task when sibling picked a cookied one:

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cd0149f5f6693..781f751acdb5b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6314,6 +6314,14 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 			goto restart;
 
 		if (!next->core_cookie) {
+			/*
+			 * pick_task() can drop the core rq lock through newidle balance.
+			 * If a sibling established a core-wide cookie while the lock was
+			 * dropped, the uncookied no-sync fast path is no longer valid.
+			 */
+			if (unlikely(rq->core->core_cookie))
+				goto restart;
+
 			rq->core_pick = NULL;
 			rq->core_dl_server = NULL;
 			/*

We can also do a core_task_seq check above but if sibling picked an
uncookied task, it's actually OK for this rq to go this fast path so I
chose to check rq->core->core_cookie here.
