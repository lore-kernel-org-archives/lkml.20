Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9125B331EAE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135905; cv=none; b=JUpj/GQjq2pc3v2M58Ryzt2m64UIr16fmCMvNKgmbCkbXCcupSKJUIu2kFlGaJXwY+twNsIR0s6PnrPaJaClLu6pGQnb1Xdx8DK0IsGhXjCZFH4BwSRGXUwkNlyK8pplVo+lgKa0cxGrVzp1z6Io+6E6dcae3Kt96493oKVL99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135905; c=relaxed/simple;
	bh=xWDRCpoj9WdBEt44L+2RNU/fKnJEuXhR5O1t04EL2RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSvsRSShABBvvGtCab3emtRcpr0I8Hervzck0K/QFrEL7EtMUysbMm+yFs+feOltFU5l8c3C+/64u0szypJkfd2NKSjge+ldAj+iOtq24qwb/TtUuUalUcLZMQ2h+E29ja9v1bdjIL/BujXr5YZE3pU3nCpM4rKC+Kpett5bLdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tohXVArB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tohXVArB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBD7F16A3;
	Fri, 11 Sep 2026 07:11:38 -0700 (PDT)
Received: from [10.57.73.19] (unknown [10.57.73.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE8CC3F7B4;
	Fri, 11 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789135902; bh=xWDRCpoj9WdBEt44L+2RNU/fKnJEuXhR5O1t04EL2RM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tohXVArBKXDI653lw5Y93+F9TsGTSnLtrf7pLj0Ohcyc9b8lGL7yh5428aPO4vB2B
	 wFYmgo+YfQpoXqkp92OBsMZviKrg6tzf/iISYqyiKLCC/AVkBQP+zb+Wy9chCKs0Vw
	 6q+wcSq6E6QIWi3Kb2ZDhCKF3uu+aOulSGpPvo3w=
Message-ID: <1529268b-8e10-4fef-be6e-60b6dd1e74a0@arm.com>
Date: Fri, 11 Sep 2026 16:11:38 +0200
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
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-3-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260909062649.469633-3-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.26 08:26, Andrea Righi wrote:

[...]

> +static bool has_asym_smt_domain(int cpu)
> +{
> +	struct sched_domain *sd;
> +
> +	for_each_domain(cpu, sd) {
> +		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> +			break;
> +
> +		if (sd->flags & SD_ASYM_PACKING)
> +			return true;
> +	}
> +
> +	return false;
> +}

Replace for_each_domain() w/ sd = rcu_dereference_all(cpu_rq(cpu)->sd)
here as well?

[...]
