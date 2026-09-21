Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429C546D2B5;
	Mon, 21 Sep 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981491; cv=none; b=ekfqZwkMY6hiD8Gh/aUsCTXl0ro5jpdWik/NCcUEv9gdSg3mRMAv9pRvGLaEmJqqFNJp7FmNKcMYMPQ9Qm2AbZu+ePvZdKXBdDAY8WNaojwzTau+GnOMeuV5lwgf4ComBoJYzq9rDOALAFUyniAk58CBIPB5dWxZekEWl1V4e3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981491; c=relaxed/simple;
	bh=8XfMkOskSZJ52LZ+fWsCnR6GpWD08w36joEyxV2mlIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eR5pD2u0FQCsipFFJpYacjvo3xKSQEUe3PFopJ48zZmTpqomeDSQT6mBXWwjtS7lZA7fJ40QIDLXBFl/J+1Jy9LxAQhoxu5EwTVn8hPtghDeBvlsGh9EfsCwT4EcbF6+mbTVMXC7dkjC204ieiXzCLTj3nFgdM6wDYhuOH9Kqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=t/8RLcX1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="t/8RLcX1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F14C51D13;
	Mon, 21 Sep 2026 02:04:44 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8826F3F86F;
	Mon, 21 Sep 2026 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981488; bh=8XfMkOskSZJ52LZ+fWsCnR6GpWD08w36joEyxV2mlIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t/8RLcX1Cyg7pKGg7/0DSnPFnDmu0we8JLdWSt+4WIVCIglvEF8hdf4Swz5EEVwzC
	 7UQf3srwRW5s5ZBr/m9Pf4qvjKgbyuDSn7B9E36qoDTPCIdHgPoR77gvrqo6xn7zvH
	 hUNBFqa9tgRX/ZAkJSBMsLxdVY3Z+JIHunUYrWak=
Message-ID: <75f23add-e27c-4749-8495-d29388b6ca56@arm.com>
Date: Mon, 21 Sep 2026 11:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Christian Loehle <christian.loehle@arm.com>,
 Srikar Dronamraju <srikar@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Lee Trager <ltrager@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917140707.3807229-1-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260917140707.3807229-1-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.26 16:05, Andrea Righi wrote:

[...]

> The first patch teaches the fair scheduler's idle-selection paths to honor
> SD_ASYM_PACKING at the shared-capacity SMT level. The scheduler first selects a
> candidate CPU and core according to its existing placement and capacity rules,
> then chooses the highest-priority available sibling within that core. This also
> completes the existing POWER7 SD_ASYM_PACKING behavior by applying its
> hardware-thread ordering during idle selection.
> 
> Olympus firmware does not currently provide an interface to describe the
> preferred SMT sibling. Adding such a firmware or ACPI interface will take time
> and will not help systems with existing firmware. At the same time, inferring
> this policy from MIDR would encode a platform-specific decision in the kernel
> and make it harder to replace with a proper firmware ABI.
> 
> The second patch therefore adds the sched_smt_asym_packing= boot option. Using
> sched_smt_asym_packing=on explicitly opts the SMT scheduling domain into
> SD_ASYM_PACKING without requiring architecture-specific detection. Priority
> remains defined by arch_asym_cpu_priority(). The weak default orders siblings by
> -cpu, consistently selecting the lowest-numbered available logical CPU.
> Architecture overrides remain authoritative, so siblings assigned equal
> priorities remain unordered. The default auto mode preserves
> architecture-provided topology policy, including the existing powerpc behavior,
> while off provides an explicit override to disable SMT asymmetric packing.
> 
> On Olympus, PE0 and PE1 have equal steady-state capacity; this preference does
> not identify a faster PE. The lower-numbered logical CPU is used only as a
> canonical choice when both siblings are available. Consistently selecting the
> same sibling avoids alternating the active PE across wakeups, lets the other
> sibling remain idle for longer, and allows more cores to remain in, or return
> to, full-resource single-thread mode.

So I think that Power7 and other SMT machines won't ever turn
'sched_smt_asym_packing' on then.
As we have seen in https://lore.kernel.org/r/aqSEB2N_NQbBVab6@gpd4 this
code will only benefit NVIDIAs Spatial SMT, i.e. dynamically
partitioning a physical core, rather than conventional SMT where two
threads opportunistically compete for most of the same machinery.

IIUC on Spatial SMT, placing the workload on PE0 is beneficial because
even if interrupts and other per-CPU housekeeping activities have to be
handled by PE0 next to the benchmark tasks, the main thing is that PE0
stays in full-resource single-thread mode (PE1 stays idle).
> 
> The v6 series was tested on a two-node Vera system using 88-thread
> single-precision GEMM workloads on the 88 physical cores of NUMA node 0, with
> sched_smt_asym_packing=on and the workloads allowed to choose either sibling of
> every core. Each result covers five runs.
> 
> Two BLAS implementations were tested: OpenBLAS, an open-source BLAS library that
> provides a publicly reproducible benchmark, and NVIDIA Performance Libraries
> (NVPL), NVIDIA's optimized BLAS implementation.
> 
> OpenBLAS was evaluated using benchmark/sgemm.goto with an M=N=K=16384
> single-precision GEMM. NVPL was evaluated using benchblas with the same matrix
> dimensions, non-transposed inputs, alpha=1 and beta=0. The numbers below are the
> mean and standard deviation from five runs.

So I assume that you have 88 consistently running benchmark threads and
in case your new code let them run more likely on PE0 instead PE1 you
see this throughput increase.

> OpenBLAS throughput increased from 7.11876 +/- 0.06734 TFLOP/s on the baseline
> kernel to 7.34669 +/- 0.01936 TFLOP/s with this series (+3.20%). NVPL throughput
> increased from 9.64742 +/- 0.17311 TFLOP/s to 10.29695 +/- 0.01786 TFLOP/s
> (+6.73%).

I assume further that NVPL has the same benchmark task model, maybe with
a couple of sleep/wakeups in between?

[...]
