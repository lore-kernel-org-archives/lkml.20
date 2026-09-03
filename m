Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6E637267A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433210; cv=none; b=QdMPys4Iz4/43Qkmjy0e/7KptilPtu/KGUa39+Bs7nftJh47JFWmuAfFENhuDC5UT3h26uJdAOYLOLnnHc7BNOa/fX8dK9k4erDFw8k3PNT1ucUKYNsazCMGKAVLLwMX9ZBA+doDyqXwpNsmJPEdGeAJD3RkPSdvgduVO6Va82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433210; c=relaxed/simple;
	bh=l/WLiFAWZGavTCOOkKCUj7KqObYJmvameChFjiTD1Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImiM7lTi0/UHt80SXmCD16Crrnkj7Rm1HfvHhnCcV62C38rHevhVF5MT7Po8tx+580w+1gOyKozMwAOHeZE2gqxGYZND+3iCkMmVTJw2nRcrE/u4hSKpBC6NPagAExKD9aTo+yG91mRKSscVN9Qax/vG8k6TLVldyJIUOINaog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Pt6UJRbW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Pt6UJRbW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13F611596;
	Thu,  3 Sep 2026 04:00:04 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37EB83F673;
	Thu,  3 Sep 2026 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788433207; bh=l/WLiFAWZGavTCOOkKCUj7KqObYJmvameChFjiTD1Yw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pt6UJRbW6eyrmqq6KoqUnuw1zRAmNRf5RDLIQWQvl9LUSJ4SZxmf5cHJWIUaXPzOB
	 G6sWHKuAEo7iSNg4v1RWHFia1nDmCrn/12ZRhuzy2cyMflWa8/mhAUyyS5erPl+XKP
	 O8gOun+PhScYTZ2Mfq812xj+BTLWJxV0LawkjFlo=
Message-ID: <0d02e284-9a07-4f54-bf63-8edaa5e224e5@arm.com>
Date: Thu, 3 Sep 2026 12:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-3-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260831181800.1668646-3-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.08.26 20:10, Andrea Righi wrote:
> SD_ASYM_PACKING orders CPUs that share an SMT core, but idle CPU
> selection does not consult that order. A task can therefore wake on an
> arbitrary sibling and remain there until load balancing corrects the
> placement. On SMT implementations where changing the active sibling
> repartitions core resources, that initial choice can cause a large and
> persistent performance loss.

I assume this sentence refers to Olympus/Vera and Power7?

[...]

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf7..3c49aa63742cb 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8587,6 +8587,65 @@ static inline bool test_idle_cores(int cpu)
>  	return false;
>  }
>  
> +/*
> + * Return true when @cpu has a higher asymmetric-packing priority than @other in their SMT
> + * scheduling domain.
> + */
> +static bool sched_smt_asym_prefer(int cpu, int other)
> +{
> +	struct sched_domain *sd;
> +
> +	for_each_domain(cpu, sd) {
> +		/*
> +		 * Only honor priorities declared at shared-capacity SMT levels.
> +		 * SD_ASYM_PACKING at higher levels may describe core ordering.
> +		 */
> +		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> +			break;
> +
> +		if ((sd->flags & SD_ASYM_PACKING) && cpumask_test_cpu(other, sched_domain_span(sd)))

Looks like 'other' is always part of the mask?

> +			return sched_asym_prefer(cpu, other);
> +	}
> +
> +	return false;
> +}

SMT will always the lowest SD, so for_each_domain() is not necessary:

static bool sched_smt_asym_prefer(int cpu, int other)
{
        struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);

        if (sd && ((sd->flags & (SD_SHARE_CPUCAPACITY |
SD_ASYM_PACKING)) == (SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING)))
                return sched_asym_prefer(cpu, other);

        return false;
}

[...]

> @@ -8668,7 +8727,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
>  		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
>  			continue;
>  		if (choose_idle_cpu(cpu, p))
> -			return cpu;
> +			return select_idle_smt_priority(p, cpu);

This one is weird for SMT2. AFAICS, select_idle_smt() is called when
there are no idle cores. So if you find an idle CPU this is what you
will return anyway.

I guess your tests on Olympus/Vera do wakeups via select_idle_capacity()
so you haven't touched this one.

[...]
