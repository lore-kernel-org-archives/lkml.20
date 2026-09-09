Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4C432ED40
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967156; cv=none; b=YeZcrdMwmI7X43AXuEVak0UJLptTVQzBMpJXTa/tS0DqEB1tvPskQRpvemRxVM4g+Y1akM2JW1Q8kUNsdOiHj/jbTT2ZR0gawyrBmu0BJ6H0F5PgMj/NfvP9FnhK7sG1eRukGxskIqB1OhwEsvVQn5kXqjcN0B12imUX/6gNhvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967156; c=relaxed/simple;
	bh=JVtbIx6b4JixBca9/3cW8IIAuyorQfe6n8JSHIidnqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9ak7+2fuu8eLk7Av54i1l+VbCWGXEGcpGf/tRDybmuSfLBqBjWomEzsP+cEwE/wxjAgdMtQvXaXwfqcdzGRbmvA0j1T4eJzBfcd6LbqapSTgm43xIPxfdJQQJ6fpwitJfgxL1xf/DofEwwuQMyi466UrTfSoxLCZfOAFolkXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=U0qm13YB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="U0qm13YB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1470C176B;
	Wed,  9 Sep 2026 08:19:10 -0700 (PDT)
Received: from [10.57.73.177] (unknown [10.57.73.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4CF63F528;
	Wed,  9 Sep 2026 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788967153; bh=JVtbIx6b4JixBca9/3cW8IIAuyorQfe6n8JSHIidnqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U0qm13YB5WYFYasx1y8R4omfspRoS9xTNbVV7scKvzqDLalmp23hpW0cqjNPeD/if
	 /8Mgp4YURpXg27zZxYOWsniPkPJvG2wbjnhSEK5fg+7DTQ5vy41ovyI1bye+haeR2a
	 gy6REZ6hA8vEbF5EifUahC/Y2F5j+vuXDAHXCmgo=
Message-ID: <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com>
Date: Wed, 9 Sep 2026 17:19:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
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
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260909062649.469633-2-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.26 08:26, Andrea Righi wrote:

[...]

> +void __init arm64_init_sched_topology(void)
> +{
> +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
> +		return;
> +
> +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
> +		return;
> +
> +	if (!topology_core_has_smt(smp_processor_id()))
> +		return;
> +
> +	set_sched_topology(arm64_asym_smt_topology);
> +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");

I'm not really a big fan of using this arm64 setup for NVIDIA Olympus
alone here.

> +}
> +
> +int arch_asym_cpu_priority(int cpu)
> +{
> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
> +}
> +

This is done since it will only be called for NVIDIA Olympus since it's
the only CPU model enabling this. I think it will work but it's still
ugly :-)

[...]

