Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408C3AEF2A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494677; cv=none; b=LxJ40ZHx1VaOTjY255HjBs5NxJ+Q2anp1UUaRlfDDVcPNvGnENPWpwo0pkDRK+OMKnYTHnMhM240EJmWMLIYgTbZPLiMLj/YxEjXRcsOFqYKpvmPJBAfy4FCoK6QeSu3ZMBIINsOQF3W0KswSaX/RoevlBeyexV/jk3UsKMH/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494677; c=relaxed/simple;
	bh=VULIc9UlyaENxxvkEsJ+JAk0cy4pBPurVzG7dF1Ogs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzJ8xDUFIiniua0nWNLZo3g4s+VBwVPD3DUUb4Cc5T1mO+iAd4JwiitA2Mi5PvaNSZ5bjQJCFn1bqpQTY7qj/9pEyeeDMJghphCMPWsLG8gJvSc8ysubbT43odODx1UX8/sTmBMQ9pMKpYC/VlVZiTAsk3QzFTMCSsyzqZOaImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gcjQ4blr; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gcjQ4blr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bl
	KlqI2aVIK1zn4IlrdzM4jo2VVOrbE0EpcP2SInkzQ=; b=gcjQ4blrhyt882j1NU
	oG28BhKrgsG+gAADR89G/Iz4dXuOwcCm5kb3l5GG7XRqeiulrnsIT9/2iFWN9uBa
	sdjajUU+AENaVfiG9n2rTHaXg+DV4UpM6rrjGUz11zh29HhhNSMYcZUv4U76qOza
	SehfBY20WgKNT6GDRkubyFnFU=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgA3jfMXQ5pqpY0wOg--.48129S2;
	Fri, 04 Sep 2026 12:03:36 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Hui Su <sh_def@163.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	John Stultz <jstultz@google.com>,
	Chen Yu <yu.c.chen@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] sched/cache: Drive cache task tick from execution context
Date: Fri,  4 Sep 2026 12:03:35 +0800
Message-ID: <20260904040335.286208-1-sh_def@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0051f02bd8d6f69fa7018b34386ccc22034dffde.camel@linux.intel.com>
References: <20260903041154.2479761-1-sh_def@163.com> <20260903041154.2479761-3-sh_def@163.com> <0051f02bd8d6f69fa7018b34386ccc22034dffde.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgA3jfMXQ5pqpY0wOg--.48129S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFykKr43ZFW5JFWfGrWfKrg_yoW8XrW8pF
	Z8KF47Ar4kKa4Svan7Awnav34fCF4fAa4Ygr1DWry5Cr9xG3W0gF1Ikw4Yyr4UCr1vvr9F
	yr4jg3ZrCFyjvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUx-BtUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwRgYd2qaQxhyTQAA3i

On Thu, Sep 3, 2026 at 10:23 AM, Tim Chen wrote:
> May be worth adding a comment here. Say you consolidate the
> exec context stuff to a new sched_tick_exec_ctx() helper.
> You can say something like the following here to help future
> reader of this code.
>
> +       /*
> +        * Note: misfit, overutilized and core scheduling state describe the
> +        * entity the load balancer would move, i.e. the scheduling context,
> +        * and therefore stay with @curr rather than with rq->curr. See
> +        * sched_tick_exec_ctx() for the execution context counterpart.
> +        */

> I think task_tick_core() needs to stay with the donor's context
> as it is the scheduling context.
>
> There is a separate issue lurking here, task_tick_core() measures
> consumed slice as se->sum_exec_runtime - se->prev_sum_exec_runtime.
> Under proxy the donor's sum_exec_runtime does not advance, so that
> delta stays near zero and the force-idle resched may never trigger.
> Passing rq->curr does not fix it either. This is somewhat orthogonal
> to the issue that the execution context series is trying to solve.
> It should be fixed separately.

Hi Tim,

Thanks. I'll consolidate the NUMA/cache execution-context handling into
a sched_tick_exec_ctx() helper and use it from both sched_tick() and
sched_tick_remote().

I'll also add a comment in task_tick_fair() explaining that misfit,
overutilized and core-scheduling state remain associated with the
scheduling context.

I'll fold these changes into v3.

Thanks,
Hui

