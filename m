Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B0C246774
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399044; cv=none; b=RJ/ZzGAejH26N9TCUnsTfdOefoTyu9hEuexaD15fpsdcHovC3+QJY/GQF+w9BujUmT1OpDhQf9UhMuh75fpJyAfacG8fW1EdppBhVGG1zA9Z57N6/UJ4OqGHXSfXpOyM8aZzqbIb5PHmoRoAIHOJZSDYKCPhda/IO0VV2h8YSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399044; c=relaxed/simple;
	bh=aDALWrTBvsy4keS/oqKR9knS4cIztrtG9j+0EXeQLE8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=pS4MFM0pNbZrFB1qUX3mYisBMgvsOdnFM3R7Je8uyYtDZHwGzn0X6qLghKdc/EuG1ZZN1rB+EKaARijVdCK+8SJI3t+xW9R2FNmWVn+haKStQJ78DpnnS7lVqliRQTyI/kJrrh54b3cjaYsdmw5wezot3HeujPpT4lupkavFK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RdKu/HG3; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RdKu/HG3"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+ENUVdu9evfizldLInCcVDVO9/Of0750cZbX4S7Tuug=;
	b=RdKu/HG3L9rawEYtYRkoGKyqOCgk/5NB05U4TgtQuaVcjnLqYDLIS46wNp93iwbv/9EsdbnNR
	mHaVJR/p1U2aF3lA3JOjr6XR+vGXOITWLsKFSBJEsiHyLjbie95yumvWMs8PQM9gvOg5pYRAy9y
	30KpoZszP15eX6aN5XlY2fg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hb1w241wqz1T4JN;
	Thu,  3 Sep 2026 09:19:14 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1140340561;
	Thu,  3 Sep 2026 09:30:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 3 Sep 2026 09:30:36 +0800
Message-ID: <6f4a009f-4261-4cce-88b6-1dec5ecc3a53@huawei.com>
Date: Thu, 3 Sep 2026 09:30:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] sched: dynamic: Simplify PREEMPT_DYNAMIC
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>
CC: <frederic@kernel.org>, <jstultz@google.com>, <juri.lelli@redhat.com>,
	<meted@linux.ibm.com>, <mingo@redhat.com>, <peterz@infradead.org>,
	<sshegde@linux.ibm.com>, <tglx@linutronix.de>, <vincent.guittot@linaro.org>,
	<vschneid@redhat.com>
References: <20260803191731.3244294-1-mark.rutland@arm.com>
 <c1b65ff3-4982-49f9-9d4a-c05ed9d903b1@huawei.com>
In-Reply-To: <c1b65ff3-4982-49f9-9d4a-c05ed9d903b1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/8/7 11:11, Jinjie Ruan 写道:
> 
> 
> 在 2026/8/4 3:17, Mark Rutland 写道:
>> All architectures which currently suppoort PREEMPT_DYNAMIC select
>> ARCH_HAS_PREEMPT_LAZY.  On architectures which select
>> ARCH_HAS_PREEMPT_LAZY, it has not been possible to select the NONE and
>> VOLUNTARY preemption models since v7.0 due to commit:
>>
>>   7dadeaa6e851 ("sched: Further restrict the preemption modes")
>>
>> Hence in practice PREEMPT_DYNAMIC no longer supports the NONE or
>> VOLUNTARY preemption models.
>>
>> This series makes the de-facto situation official by making
>> PREEMPT_DYNAMIC depend on ARCH_HAS_PREEMPT_LAZY, and removing redundant
>> code.
>>
>> Since v1, I've had to rebase atop v7.2-rc4 to avoid a conflict with
>> commit:
>>
>>   a2c02aa0c6ca ("powerpc: Remove dead non-preemption code")
>>
>> Given this is now late in the cycle, and given the tip:sched/core branch
>> is based on v7.2-rc1, I suspect tip folk might not want to queue this
>> now. Please let me know what you'd prefer; I'm happy to rebase and
>> resend after v7.3-rc1.
>>
>> Since v1:
>> * Rebase to v7.2-rc4
>> * Apply Revied-by tags.
>> * Fix typos in commit messages.
>> * Add patch to cleanup accessors (per Shrikanth's comment)
>>
>> Mark.
>>
>> Mark Rutland (6):
>>   sched: dynamic: Make PREEMPT_DYNAMIC depend on ARCH_HAS_PREEMPT_LAZY
>>   sched: dynamic: Simplify {cond,might}_resched()
> 
> 
> Hi Mark,
> 
> We also need to update the Doc.
> 
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5410,8 +5410,6 @@ Kernel parameters
> 
>         preempt=        [KNL]
>                         Select preemption mode if you have
> CONFIG_PREEMPT_DYNAMIC
> -                       none - Limited to cond_resched() calls
> -                       voluntary - Limited to cond_resched() and
> might_sleep() calls
>                         full - Any section that isn't explicitly preempt
> disabled
>                                can be preempted anytime.  Tasks will
> also yield
>                                contended spinlocks (if the critical

Hi Mark,

What do you think?


> section isn't
> 
> Best regards,
> Jinjie
> 
>>   sched: dynamic: Simplify preempt_schedule{,_notrace}()
>>   sched: dynamic: Simplify irqentry_exit_cond_resched()
>>   sched: dynamic: Remove HAVE_PREEMPT_DYNAMIC_{CALL,KEY}
>>   sched: dynamic: Simplify preempt model accessors
>>
>>  arch/Kconfig                     |  38 -------
>>  arch/arm64/Kconfig               |   1 -
>>  arch/arm64/include/asm/preempt.h |  10 --
>>  arch/loongarch/Kconfig           |   1 -
>>  arch/powerpc/Kconfig             |   1 -
>>  arch/riscv/Kconfig               |   1 -
>>  arch/s390/Kconfig                |   1 -
>>  arch/s390/include/asm/preempt.h  |  11 --
>>  arch/x86/Kconfig                 |   1 -
>>  arch/x86/include/asm/preempt.h   |  28 -----
>>  include/asm-generic/preempt.h    |  10 --
>>  include/linux/irq-entry-common.h |  17 +--
>>  include/linux/kernel.h           |  20 ----
>>  include/linux/preempt.h          |  20 ++--
>>  include/linux/sched.h            |  31 +-----
>>  kernel/Kconfig.preempt           |   9 +-
>>  kernel/entry/common.c            |  17 +--
>>  kernel/sched/core.c              | 180 +------------------------------
>>  18 files changed, 23 insertions(+), 374 deletions(-)
>>
> 

