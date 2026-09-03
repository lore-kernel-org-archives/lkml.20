Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B46D32A3DA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404098; cv=none; b=gkoHlLeU1hufA1p7U9SsKOtCBxPNCjEHLer+qE43yHV68T5UmzdRsRGbMsumo7gYbWu8oeYNKS8zPqaKPSkYv0r7pgw5FYzN2lfx42uBdeMM592Ku6ckzCQxWCx6wvrxVDro97eWscm2AGkt+9e9fhqNiDTFX576WlSdCJBaDD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404098; c=relaxed/simple;
	bh=wriApaBhKFCj0oEJdSOQlPecvWdWyGMnQjtRKvxcrro=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mx8HL0LvZV8KqsQn+ahPzEq3Ucac7fSJcooWQgjvQMzT9Ccbfz1G3s6ayF5oBhJ3BMoW7R2C9Famo0Wovg6uRSuXG2gHBb7rGKFFFmj6ZabTm4IbC1+39SMxggsNjOVvVHorwd5iukBk/BHI/cxdi5WRB8B4GbBVPefBeM9SHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gBksxUIS; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gBksxUIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject:Content-Type:
	MIME-Version; bh=wriApaBhKFCj0oEJdSOQlPecvWdWyGMnQjtRKvxcrro=;
	b=gBksxUIS/v3uLJQGTgOSmKXtkM8WoOLxYpneio0cDd8792c7iYugCL9ZYAj2d9
	XnsQVKTfG/4qXlRIbAiEU019MR6usjk8mgiifPyfKDw3va7PHdMKu5z6F0d98/dZ
	3uRmfgClhmHGEM62LguRILocpvriilK+1YSTAYbdhzQEw=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnHxMp4ZhqWrlvOQ--.18078S2;
	Thu, 03 Sep 2026 10:53:30 +0800 (CST)
Date: Thu, 03 Sep 2026 10:53:29 +0800
Message-ID: <de3928e26072ba22a6f7d8d293a3bd43.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, jstultz@google.com,
 metin.kaya@arm.com, connoro@google.com, yu.c.chen@intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/cache: Use execution context for cache task tick
In-Reply-To: <c5a2d651a5d647fb29f13fe483301b3b6e292b4d.camel@linux.intel.com>
References: <20260902163336.1552840-1-sh_def@163.com>
 <20260902163336.1552840-2-sh_def@163.com>
 <c5a2d651a5d647fb29f13fe483301b3b6e292b4d.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:PSgvCgDnHxMp4ZhqWrlvOQ--.18078S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryrKF43Wr1ktr17CFWfXwb_yoW5JF18pr
	Z0gF17trn2vFy3tF17Z3srX34rJ393Aa4jgrs7GrWUuw15Wr409rW7ta4jgFy5Cr4Sya4x
	Zws09wnrWF4Uu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRijj9UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QpDomqY4SqyxwAA3O

On Wed, 2026-09-02 at 13:12 -0700, Tim Chen wrote:
> Thanks for raising this issue.
> I agree that the execution context should be handed to task_tick_cache().
>
> However, the donor may be a deadline or real time task, in which case
> task_tick_fair() is not invoked at all -- and we still need
> task_tick_cache(). Note that account_mm_sched() does run in that case,
> via update_curr_common() -> update_se(), so rq->curr's mm keeps being
> accounted while mm->sc_stat.epoch, which only task_tick_cache()
> advances, goes stale. After llc_epoch_affinity_timeout epochs
> account_mm_sched() then resets mm->sc_stat.cpu to -1 and we lose the
> preferred LLC.
>
> So maybe the check belongs one level up, in sched_tick().
> There we can test whether rq->curr -- the task actually running -- is a
> fair task, and call task_tick_cache() and task_tick_numa().
> That test is the same p->sched_class != &fair_sched_class one
> account_mm_sched() already does.
>
> sched_tick_remote() would then need the same two calls added.
> Without them, nohz_full CPUs would stop getting them at all.
>
> Tim

Thanks for the review. I agree with your analysis.

The v1 cache change only passed rq->curr to task_tick_cache() from
task_tick_fair(), which still misses the case where a fair execution task
runs on behalf of an RT or deadline donor. In that case task_tick_fair()
is not invoked, although update_curr_common() still accounts execution
runtime to rq->curr.

I have reworked the series to move task_tick_numa() and task_tick_cache()
out of task_tick_fair() and invoke them from sched_tick() when rq->curr
is a fair task. The corresponding calls are also added to
sched_tick_remote() so full-dynticks CPUs continue to receive both ticks.
The calls remain after the donor scheduling-class tick to preserve the
existing runtime-accounting order.

I tested this with a QEMU topology providing two LLCs. With an RT donor and a
fair mutex owner, the unmodified kernel did not execute the cache tick during
the proxy execution episode. With the change, task_tick_cache() was observed
with p == rq->curr while rq->donor was a different RT task. The proxy test
completed three episodes without warnings or errors.

The default build passed, as did builds with NUMA balancing and cache
scheduling disabled independently and together. I also built the affected
objects with CONFIG_NO_HZ_FULL=y.

I will send v2 with these changes.

Thanks,
Hui

