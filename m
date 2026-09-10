Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387D449F134
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051226; cv=none; b=AoxbP9iiHIcKel/qsYlkoP4J12I0svTIsuxk8CfMxNYQNi9AkHgDWAVvEYR1VTbyn9TaK8Ilu1qjnlfaS7dFRLUyMxzWfywJAl7WoCrDA4ZQL3zCXdNE6BvZlL88iELjquOEwx6kLf/URYtUOyFO7sw/IHcF17UYf2+UFJs8VzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051226; c=relaxed/simple;
	bh=b0fIYocLTdAkVk5aZ6Jfvcp7UtkTFpz5PTRvZZl3pHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1tenr926Rw760y+GLPJnTlpEA5klZ1qkt2eqN5rst8RmvWgqBjvvcMqlajfivdtCAVWxvpG4tX9mlbBBXFreDoB8I9BXxN6gc7BtwBzUiwYFd2gKYFQHwpuvUL3R8b4a9VOkfez/ypP5t+XI+zYEPkELcmPz71DeJlpAFRIVB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MLl5f+s5; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MLl5f+s5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=NpvrxZn0vz4GD5h6JQ/sPNHPYWlRrYUiXgRHvbkFxeU=;
	b=MLl5f+s593JS7px8dPbscqtCE0RN6t0p7kbRJxzAOQWnEep47gQ3qOiyZpZtCP
	f9U8a2NSDcVNecKvfqHBVdWJGiH69pyVcRdWFaweoFD8SkduQkGLLJQEYjDkAEmF
	RKECkbqGRfZTrTo/EI+7WubReI+OoYK77gY1DVwlDtNXk=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXj5ILwaJqPm9EOg--.39779S2;
	Thu, 10 Sep 2026 22:39:08 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Thu, 10 Sep 2026 22:39:07 +0800
Message-Id: <20260910143907.1992715-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKfTPtAmB8pQms38CWoXPmG7bL64mY8L7Gyd=_LvNoM7wvEgdA@mail.gmail.com>
References: <CAKfTPtAmB8pQms38CWoXPmG7bL64mY8L7Gyd=_LvNoM7wvEgdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgAXj5ILwaJqPm9EOg--.39779S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy7Cr4UWw15WF1Dtr45trb_yoW8uw4xp3
	yFy3WIyrs7J3W8Kwn2yw48tr4UXw4rGayfKFn5GFyfAFZ8XF1v9Fn3KrsxZFyfWr1kZa4j
	qFWjgrsruayqv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRl4iUUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCvwy2wGqiwQz7QwAA34

On Thu, 10 Sep 2026 10:19:13 +0200 Vincent Guittot <vincent.guittot@linaro.org> wrote:

> > +/*
> > + * A streamlined version of select_task_rq_fair().
> > + * It runs faster than select_task_rq_fair, especially when there are not
> > + * many CPUs. It will prioritize selecting an idle CPU in the following order:
> > + * 1. prev_cpu
> > + * 2. recent_used_cpu
> > + * 3. cpu belongs to intersection of sd_llc and cpus_ptr
> > + * 4. cpu belongs to cpus_ptr but not belongs to sd_llc
> > + * If there is no idle CPU in cpus_ptr, it will select prev_cpu.
> > + */
> > +static int select_task_rq_fair_thin(struct task_struct *p, int prev_cpu, int wake_flags)
> 
> We don't want yet another select idle cpu function.
> The only reason select_idle_sibling() would not select an idle cpu in
> your llc is nr_idle_scan which will abort the loop before checking all
> CPUs. You should look at why nr_idle_scan doesn't keep all CPUs in
> your small size use cases

Adding such a function to the mainline code is indeed not a good idea. What I
actually want is to prioritize selecting idle CPUs within the LLC first, and
then select idle CPUs outside the LLC. However, once the fast path taken, if
I’m not mistaken, it only selects CPUs within the LLC, which is not very
friendly for machines on embedded platforms, as it becomes difficult to bind
tasks without crossing LLC boundaries when the number of CPUs is small.

I’m considering I can modify it as follows:
want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr) && !sched_feat(LB_PROMOTE);
to force the slow path for core selection whenLB_PROMOTE` is enabled.

BTW,
Regarding nr_idle_scan, I have derived some data and the analysis is as follows:

If nr_idle_scan is 2, then: y must be at least 512, tmp must be <=512, and tmp
must be <= 512 * 10000 * 1024. This leads to tmp <= sqrt(512 * 10000 * 1024 / 117 / 117),
which is the square of 382,999.488, resulting in approximately 618.8695 after
taking the square root.

Multiplying this by 4 gives us 2476, so if the estimated utilization of CFS
tasks exceeds 60.54%,nr_idle_scan` must be less than 3 and becomes 2, which
may result in missing idle CPUs within the LLC.


--
Xin Zhao

