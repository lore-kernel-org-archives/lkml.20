Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D5D3CF21D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035079; cv=none; b=FJhWpkq9VsV9qpYZMwidNEkvy8yO3h4a77B8lQqVhbzGVlc6eAdYkmZ0dww8I1CwSxpCoaeNADC4Mp1mR0BBUvFXr5eb87p6LpVwvHU3G4KMbMywaI2UUIUnq9Ep/HSYpH/8Pxfrte4OKCRSKJyG4pI8ztLkjv4hazK4rwMbugM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035079; c=relaxed/simple;
	bh=ze2X4Lma6eVK0EPslJ52ApNw2jBlVa9FG4aUhZ3Oysw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+A3qhx4+zW07b3IrmfmvFFNrMfJavqGPmrl94OXoHkag9U45hrYZE1/sPxtA1xfgZO5lk6gzffaiwUl8oacwh/uMgue+vZtdA0ZMjm3Fhx1COkrGni86ijEXupfEj+V8iHx0dAr0ImPmdJmMN87UtVnb8ECbphHj5+7wro84cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QffLbUZI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QffLbUZI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D345E143D;
	Thu, 10 Sep 2026 03:11:07 -0700 (PDT)
Received: from [10.57.72.177] (unknown [10.57.72.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B53B73F7B4;
	Thu, 10 Sep 2026 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789035071; bh=ze2X4Lma6eVK0EPslJ52ApNw2jBlVa9FG4aUhZ3Oysw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QffLbUZIi0x47zAKcQ/fhaBHbAZmRZ2td2tLzmYC9x864r7U8LFVP70Npo+9+3OQu
	 ieLkWcU0zlFJ4C9oHdGO1eB9Cm30gdZU+DW32guMGOTRWLJKtwI2KR2nrjZWv4QYCU
	 QCY02mM9LFsznD0dXYbs1pCHO3Lu2ZGkRrVWkR48=
Message-ID: <1528999e-eb59-416f-b18f-2a7667e61a90@arm.com>
Date: Thu, 10 Sep 2026 12:11:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com> <aqGGlNce4TRLS1cW@gpd4>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <aqGGlNce4TRLS1cW@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.26 18:17, Andrea Righi wrote:
> On Wed, Sep 09, 2026 at 05:19:08PM +0200, Dietmar Eggemann wrote:
>> On 09.09.26 08:26, Andrea Righi wrote:
>>
>> [...]
>>
>>> +void __init arm64_init_sched_topology(void)
>>> +{
>>> +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
>>> +		return;
>>> +
>>> +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
>>> +		return;
>>> +
>>> +	if (!topology_core_has_smt(smp_processor_id()))
>>> +		return;
>>> +
>>> +	set_sched_topology(arm64_asym_smt_topology);
>>> +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
>>
>> I'm not really a big fan of using this arm64 setup for NVIDIA Olympus
>> alone here.
>>
>>> +}
>>> +
>>> +int arch_asym_cpu_priority(int cpu)
>>> +{
>>> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
>>> +}
>>> +
>>
>> This is done since it will only be called for NVIDIA Olympus since it's
>> the only CPU model enabling this. I think it will work but it's still
>> ugly :-)
>>
>> [...]
>>
> 
> Agreed on both points. As mentioned in the other email, I'll coordinate with the
> firmware team on a proper ABI for describing the PE0 preference. For the systems
> with the current firmware, I don't have many ideas on how to enable this... a
> special scheduler facility enabled via kernel boot option? Other ideas?
With the explicit kernel boot time option discussed in the other thread,
how do you want to code arch_asym_cpu_priority()?

AFAIK, Arm architecture does not require the first/primary HW thread of
an SMT core to have MPIDR_EL1.Aff0 == 0.

The closest I came to you setup in Arm64 is a ThunderX2 SMT-4 machine on
which I can run 'OpenBLAS benchmark/sgemm.goto'. This machine has
symmetric CPU capacity though like Power7.
It has MPIDR_EL1.Aff0 == {0,1,2,3} for HW threads but '== 0' wouldn't
work here.

[...]
