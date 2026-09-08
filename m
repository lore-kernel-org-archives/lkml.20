Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D8653445B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869531; cv=none; b=YWKKA/E7rZn8Tg23x+Oy+zN4d/0BaS01hZop2puCt9MxmAqcj9ccg/b8Gfq15m0m0nQOBE/dKdcWVEFszuWZoVb0C+EX8m90TudLt7q9kkHgn7NEZ3b4laGF3cq2bvthGyY7Xc5ucCsEm5yZR9/JueYlWYWQIzfuBuP4aoJ19dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869531; c=relaxed/simple;
	bh=7MZ34SuoOSFwcVQ8PPpWMhVFvn7nWkutCyX+CUXnOWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=daSMVEHQUH4RrhUNKb4Y1msPSHKqQ9ZwdX1BeqbDgRijBu0OGdQcxjsaJZVpfe6gc/lzIMmc9Fiu6PgZSQfo2wzrQJcOfDj7MgWZ7U7n2c/s7/tq5lRXwnVEXdxveoJciSUGprnOoXcmav2+ACWM7fSin2HWNBdpAMgt/sBlgGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gFLXCg+f; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gFLXCg+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Uv
	mH7c6M+7vOZfYCkR4Eyo9GPcvZrJqtGyUwn8Ub6HU=; b=gFLXCg+fXWQYNzbhyV
	ScPDfHLeai3ry8GgEYHIBhrp0RcAvI+8R4P2HTfhCFiBSayTeFru7gayXDgFXDtK
	102cf44rD8NgSS53wHWG6a5j6avyHAhXqs+BX1/LreBpyHK6CqL2VVUS8VHut7hm
	ldoTvJJB359tAr8ETprJFnewE=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3x7wt+59q+PGFBQ--.46038S2;
	Tue, 08 Sep 2026 20:10:22 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	tim.c.chen@linux.intel.com
Cc: mingo@redhat.com,
	kprateek.nayak@amd.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	connoro@google.com,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	arighi@nvidia.com
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Tue,  8 Sep 2026 21:10:21 +0900
Message-ID: <20260908121021.53837-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104407.GD687043@noisy.programming.kicks-ass.net>
References: <20260904085244.799276-1-sh_def@163.com> <20260904085244.799276-2-sh_def@163.com> <20260908083545.GM4121339@noisy.programming.kicks-ass.net> <a89a2aef-f374-4fd6-aafe-ca21d21c980d@intel.com> <20260908104407.GD687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3x7wt+59q+PGFBQ--.46038S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw17XF4ktF17uryxJr4fZrb_yoW8ur1Upr
	Z2qFykGryvvay5KF12y398Wa4rGwn3Cayjgr1xGr45uryrJr4FvrWUWF1j93W5A3ykAr1I
	vr48ZrZ7AF1kKw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uj0PhUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwg6M62qf+y4r6gAA3K

On Tue, Sep 08, 2026 at 12:44:07PM +0200, Peter Zijlstra wrote:
> I also wondered if we should have task_tick() do curr_class->task_tick()
> last, rather than first. But I couldn't immediately find a compelling
> argument either way around.
>
> Updated...
>
> @@ -910,6 +910,16 @@ static void __used hrtick_clear(struct rq *rq)
>  		hrtimer_cancel(&rq->hrtick_timer);
>  }
>
> +static inline void task_tick(struct rq *rq, int queued)
> +{
> +	const struct sched_class *curr_class = rq->curr->sched_class,
> +				*donor_class = rq->donor->sched_class;
> +
> +	curr_class->task_tick(rq, queued);
> +	if (sched_proxy_exec() && donor_class != curr_class)
> +		donor_class->task_tick(rq, queued);
> +}

The per-class split looks good to me. I noticed a couple of details while
going through the updated version.

First, I think there is a reason to call curr_class->task_tick() last.

For example, with an RT/DL donor and a FAIR execution context, the donor
class tick calls update_curr_*(), which goes through
update_curr_common()/update_se() and accounts the elapsed task runtime
to rq->curr->se.sum_exec_runtime. If the FAIR callback runs first,
task_tick_numa() observes sum_exec_runtime before the current tick's runtime
has been accounted.

Calling the donor class first preserves the accounting-before-consumer
ordering:

	donor_class->task_tick(rq, queued);
	if (sched_proxy_exec() && curr_class != donor_class)
		curr_class->task_tick(rq, queued);

This also matches the ordering in v3, where the donor tick ran before
sched_tick_exec_ctx().

Second, task_tick() is added after hrtick_clear(), which puts it inside
CONFIG_SCHED_HRTICK. Since sched_tick() calls task_tick() unconditionally,
CONFIG_SCHED_HRTICK=n would leave task_tick() undefined. The helper needs
to be outside the CONFIG_SCHED_HRTICK block.

With those changes, the split and the queued handling look good to me so far.
I'll test the cross-class and hrtick cases, rework the series accordingly,
and send a v4.

Thanks,
Hui

