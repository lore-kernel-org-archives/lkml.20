Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9248653FD5C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968067; cv=none; b=htDEr8sQ3ZVbpNR5gAXtez6bIT2M/xmdwpQBIby0Q+oeyQ8mJreYwqZ2T+VR5nAu7Q+4v/b1QsRWRwmXdJkEzT3GRxiXa5RvpuB7LcyqIWs50IUmHeeWKSMssWLSrDc+9hthfFGcKQLmGNKUTub1WOiELvmPgUfwRrS8X9UjHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968067; c=relaxed/simple;
	bh=/yLx7p57n4VFTHD1ryU4Zy1CXN9XdFkPNnRBG/rlTk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekUV1wSOK8EfNL4gLTGigBgm7T6L1FkE2AwHhpxa9Utf0LjQB7yRRrG0zT+6njF+ZjMEaBWzVswiUPN6zxQEAyT5YWYCGHc1jclEyzlbusit787cnrekwyCAxyxjPA97r9BO/8ctIoyKznEbBdhAfoSs3cu5JRHbhc02rYSESYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpyBAmy9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpyBAmy9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9291F00A3A;
	Wed,  9 Sep 2026 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788968066;
	bh=/mqbOi63kUAsHZ0zibDAGgq9MP2n2OnK+z4SkjemtbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MpyBAmy9ewejgBOq+OB5P5O7yETpZk5Hf7Q+jwseySYEfIgEkCm2kLCZMQ/y6taiG
	 eYYFvYPBOQcrWusC2JU5EwpDLxm/PGg6gnMFb+DuOmWUqbr/PcCby8AOean7+QbjGD
	 o5Fr5RRyjgOzzznaIyHBoPrhZBxcJm4APuYa87s/U9Bs/t5H4PBtaC4xvLa1QB2zdL
	 0FfTdPtteaC1WKR2yXdMaQmKcuOtGcTHuoiVpM9CpBrI2hQk8fg8ovWxtiXOq8yawt
	 l75qnotc/R3J42VSMF1TGXFMAM6rjUYu8YaznJlNMRlCPHicVz86BGsNtRAXlTwmvb
	 GWyAtNcbsFWow==
Date: Wed, 9 Sep 2026 16:34:18 +0100
From: Will Deacon <will@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqF8euAA8wLmr4w1@willie-the-truck>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062649.469633-2-arighi@nvidia.com>

On Wed, Sep 09, 2026 at 08:26:08AM +0200, Andrea Righi wrote:
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f1..e5a7a4b2e3844 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -19,6 +19,8 @@
>  #include <linux/init.h>
>  #include <linux/percpu.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/sched/topology.h>
> +#include <linux/smp.h>
>  #include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
> @@ -44,6 +46,55 @@
>  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
>  static cpumask_var_t amu_fie_cpus;
>  
> +/*
> + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> + * two-thread active mode, with resources partitioned between the PEs.
> + *
> + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> + * mode. Firmware does not currently describe this preference, so detect
> + * Olympus by MIDR until a firmware interface is available.
> + */

Fix the firmware?

If we add this MIDR kludge, I guarantee that it will never be fixed.

Will
