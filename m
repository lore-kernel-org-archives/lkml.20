Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A63A961E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788499100; cv=none; b=VwPIAWeAkKYEAYW2uqnI+9LCfTF7E5lKx7+8QrkSwympyDv6KP08cRDXPd8+NBl0l0iOnHw+OSK3/4oGjdJN36QZSy3i+jgCY0O/UNCEyEAcYkmN5Bg2vcHoNt6Rr71cpUrFcNT14+AmEfjllaT5xmnupypEoKTrpEcOYyPa7l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788499100; c=relaxed/simple;
	bh=AK3OZxEFAjWqTQBP+sQIdEQjUkfLjJ/1F6XppVmDLqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djvdYwQlqlRtwsUhpA5Wgk57Lmw62pcsaPmoNFolvSw3FXgcNbSH1PrtNkqkd1i/LVOxfSQJ77+qnV2t5yk/lV3kf90fzwd2bZDT1pEtY/It0tAI1jJPOeY2AzgIXJyAVs8okk6WiS/UNezRd/xsTY4YwH5TJ+nO73EXG2eQn+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cdY8MhMh; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cdY8MhMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AK
	3OZxEFAjWqTQBP+sQIdEQjUkfLjJ/1F6XppVmDLqk=; b=cdY8MhMhCB8xh8gpAZ
	JhQIfi1XH/dqKgma9EUW82vrpPQITXREo0WHoMFjJsYdTD8SGRY6q5eodsfKaTvd
	f+OYvP+2qSVBytba3w/82PPeJC3WxQlbgPXXQHEeMzjdUatXdXPwu6pZpxavfhDc
	1MxZ/ySc16NsB7wY2lJebuwYI=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAH9olJVJpqU2A8Ag--.8446S2;
	Fri, 04 Sep 2026 13:16:58 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: Hui Su <sh_def@163.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	chen.yu@linux.dev
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution context
Date: Fri,  4 Sep 2026 13:16:57 +0800
Message-ID: <20260904051658.348156-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
References: <20260903041154.2479761-1-sh_def@163.com> <20260903041154.2479761-2-sh_def@163.com> <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com> <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAH9olJVJpqU2A8Ag--.8446S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1DAF4rKF13tFyrZFW5Wrg_yoW5Gr1Dpa
	y5KF12yrs7ta4SkrnrZFsFqw1fAayrtFy5Wrs8Gry8Cr98J3W0gr4xtF4YyFW5Crs2yF1I
	vr40yrn7G3WF93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUx-BtUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQtox2qaVEvmQQAA3t

On Thu, Sep 3, 2026 at 2:30 PM, Tim Chen wrote:
> On Thu, 2026-09-03 at 20:41 +0800, Chen, Yu C wrote:
> > Thanks for bringing this up. Previously Prateek has suggested to fix the
> > rq->donor issue [1] and unfortunately I missed the task_tick_cache() part.
> >
> > Regarding above line in the commit log, although I agree that
> > task_tick_numa() should be moved one level up, I did not quite get the
> > reason why sum_exec_runtime is mentioned here?
> > I guess what you mean is that, in task_tick_numa(), the
> > curr->se.sum_exec_runtime is used to check if there is a timeout to launch
> > the task_numa_work(), so curr->se.sum_exec_runtime has to be up-to-date.
> > With proxy execution, the se.sum_exec_runtime is only accumulated in
> > rq->curr rather than rq->donor, so passing a "paused"
> > rq->donor.sum_exec_runtime to task_tick_numa() is inaccurate?
>
> I think task_tick_core() needs to stay with the donor's context
> as it is the scheduling context.
>
> task_tick_core() is not about the execution context -- it decides
> whether the current scheduling context has used up enough of its slice
> to let a force-idled SMT sibling run. That slice belongs to the donor,
> so the donor is the right task to pass.
>
> There is a separate issue lurking here, task_tick_core() measures
> consumed slice as se->sum_exec_runtime - se->prev_sum_exec_runtime.
> Under proxy the donor's sum_exec_runtime does not advance, so that
> delta stays near zero and the force-idle resched may never trigger.
> Passing rq->curr does not fix it either. This is somewhat orthogonal
> to the issue that the execution context series is trying to solve.
> It should be fixed separately.
>
> I agree with you on this.

Hi Tim, Chenyu,

Thanks for the clarification.

The sum_exec_runtime paragraph was intended to point out that
task_tick_numa() uses execution runtime to drive NUMA scanning, but I
agree that this is too narrow. The more general reason is that
task_tick_numa() operates on execution-context state, including the task
and mm associated with the execution context. I'll reword the changelog
accordingly in v3.

For task_tick_core(), I agree that it should remain associated with the
donor, since the slice being evaluated belongs to the scheduling
context. The fact that the donor's sum_exec_runtime does not advance
under proxy execution is a separate issue, so I won't fold that into
this series.

I'll test the virtual-time prototype separately and follow up on that
issue independently if the approach holds up.

Thanks,
Hui

