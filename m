Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058C8472068
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134848; cv=none; b=LoDNvhpuHOE3M2nEk3PwoMF2K0FY/QoOvoFSFNnYCpL0eNkgehQv6W/40Sx8F1+lqeBZjQzmjgzOZy9PufwtnUQ4XB8v5XcNSFxqCxyHEbmJWIjZHZctFviQ3oluFkaTxrhGpkojSzxqCGw0VFZvz9t+qoiXj8r5IpmgUrIyqxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134848; c=relaxed/simple;
	bh=3OKeaaD514gqO+vYcqjWElEK11cRF8goI5Ek45BuXtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NoeCraJWbF5QFV32DE+6pHG9XGXZHL4M1Y2CCTTlNuyikK0vRpH3ZrKbYau2VK2jxvfS7AlcaFigErKjhxMi+lQY1p66xe/b2Tk7W3z3XQ/7SncQKN/lBcaB5EGwC5oLOZHp/Q+5GrjDXEav00tf0R2YPihp810Ctfv52C9K3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pf2BunbC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pf2BunbC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B8C71655;
	Fri, 11 Sep 2026 06:54:01 -0700 (PDT)
Received: from [10.57.73.19] (unknown [10.57.73.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068AD3F8C6;
	Fri, 11 Sep 2026 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789134845; bh=3OKeaaD514gqO+vYcqjWElEK11cRF8goI5Ek45BuXtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pf2BunbC+DJjcH3fKxKeywiunyIxdQL8H/K8Sy/C7RcCv83gqiSpbSMGbYYPWTOl/
	 iMjatyHoj9uNvjvQzotVfaII6WFyUJaPZlItlDlYWyg97A4chXczVF28gLobaHzKED
	 8Z3lUmTopH2FSwS729+r0wg0fjw/ug5q8YM+q2Ws=
Message-ID: <66610fa3-982a-45f0-b39a-34f81598ad18@arm.com>
Date: Fri, 11 Sep 2026 15:53:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
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
References: <20260908082345.103087-1-arighi@nvidia.com>
 <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com> <aqEKCCSY6QetqOCB@gpd4>
 <aqFTbqOVW8ph3Bux@gpd4>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <aqFTbqOVW8ph3Bux@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.26 14:39, Andrea Righi wrote:
> Hello,
> 
> On Wed, Sep 09, 2026 at 09:26:09AM +0200, Andrea Righi wrote:
>> Hi Dietmar,
>>
>> On Wed, Sep 09, 2026 at 09:20:35AM +0200, Dietmar Eggemann wrote:
>>> On 08.09.26 10:23, Andrea Righi wrote:
>>>
>>> [...]
>>>
>>>> The series was tested on a two-node Vera system using an 88-thread
>>>> single-precision GEMM on the 88 physical cores of NUMA node 0.
>>>
>>> Can we use 'OpenBLAS benchmark/sgemm.goto' as an open alternative for
>>> your NVIDIA internal single-precision GEMM benchmark?
>>>
>>> IIUC, you used it for the 'Prefer fully idle cores for NOHZ balancing'
>>> work: https://lore.kernel.org/r/anIq6pU5KXTTFCDN@gpd4
>>>
>>> If yes, I assume you would run something like:
>>>
>>> export OMP_NUM_THREADS=88
>>> numactl -C XXX --membind=0 ./benchmark/sgemm.goto 16384 16384 16384
>>>
>>> Essentially you want to show that those 88 compute intensive tasks each
>>> runs on his own core alone and so you get a higher TFLOPS value.
>>>
>>> [...]
>>
>> Yes, sure! I'll re-run some tests with that and share the results in a bit.
>>
>> Thanks,
>> -Andrea
> 
> I repeated the tests using the latest patch series [1] both with OpenBLAS and
> NVPL (internal GEMM benchmark).
> 
> Kernels and test configuration
> ------------------------------
> 
> mainline: Linux 7.3.0-rc2
> smt-pe0-prio: Linux 7.3.0-rc2 + patch series [1] applied
> 
> Both tests used:
>  - 88 threads on NUMA node 0 (CPU list 0-87,176-263)
>  - performance governor with cppc_cpufreq
>  - same OpenBLAS binary and NVPL container image
>  - metrics over 5 repetitions
> 
> Results
> -------
> 
> Delta is (smt-pe0-prio / mainline - 1): higher is better.
> 
>  +---------------------+-------+---------------------+-----------------------+--------+
>  | Throughput          | Runs  | mainline TFLOP/s    | smt-pe0-prio TFLOP/s  | Delta  |
>  +---------------------+-------+---------------------+-----------------------+--------+
>  | OpenBLAS            | 5 / 5 | 7.11876 +/- 0.06734 |  7.34669 +/- 0.01936  | +3.20% |
>  | NVPL                | 5 / 5 | 9.64742 +/- 0.17311 | 10.29695 +/- 0.01786  | +6.73% |
>  +---------------------+-------+----------------------+----------------------+--------+
> 
> Hardware statistics
> -------------------
> 
> ST = single-thread mode
> SMT = two-thread mode
> 
> Delta is (smt-pe0-prio / mainline - 1): lower is better.

Thanks for the test results. Good to see that we have an openly
available benchmark for this.

> OpenBLAS:
>  +------------------------------+----------------------+----------------------+----------+
>  | PMU metric                   | mainline             | smt-pe0-prio         | Delta    |
>  +------------------------------+----------------------+----------------------+----------+
>  | ST-to-SMT completed/run      | 10145.6 +/- 1835.2   | 1981.6 +/- 94.3      |  -80.47% |
>  | SMT-to-ST completed/run      | 10342.6 +/- 1853.6   | 1946.2 +/- 93.1      |  -81.18% |
>  | ST-to-SMT transitions/s      |   845.5 +/- 152.9    |  176.9 +/- 3.4       |  -79.08% |
>  | SMT-to-ST transitions/s      |   861.9 +/- 154.5    |  173.7 +/- 1.5       |  -79.84% |
>  | ST-to-SMT latency cycles/run | 15.785M +/- 3.315M   |  2.477M +/- 0.090M   |  -84.30% |
>  | SMT-to-ST latency cycles/run |  9.545M +/- 1.762M   |  1.815M +/- 0.047M   |  -80.98% |
>  +------------------------------+----------------------+----------------------+----------+
> 
> NVPL:
>  +------------------------------+----------------------+----------------------+----------+
>  | PMU metric                   | mainline             | smt-pe0-prio         | Delta    |
>  +------------------------------+----------------------+----------------------+----------+
>  | ST-to-SMT completed/run      | 7771.0 +/- 1312.2    | 2162.6 +/- 137.8     |  -72.17% |
>  | SMT-to-ST completed/run      | 7759.8 +/- 1352.2    | 2135.2 +/- 108.0     |  -72.48% |
>  | SMT-to-ST aborted/run        |    0.6 +/- 0.5       |    0.2 +/- 0.4       |  -66.67% |
>  | ST-to-SMT transitions/s      |  777.1 +/- 131.2     |  251.5 +/- 4.8       |  -67.64% |
>  | SMT-to-ST transitions/s      |  776.0 +/- 135.2     |  248.5 +/- 5.8       |  -67.98% |
>  | ST-to-SMT latency cycles/run | 13.285M +/- 3.742M   |  2.971M +/- 0.296M   |  -77.64% |
>  | SMT-to-ST latency cycles/run |  8.528M +/- 2.223M   |  2.287M +/- 0.126M   |  -73.18% |
>  +------------------------------+----------------------+----------------------+----------+
> 
> Conclusion
> ----------
> 
> The patch leaves both workloads almost entirely in ST mode and substantially
> reduces ST/SMT mode-transition churn.
> 
> Relative to mainline, completed ST-to-SMT transitions fall by 80.5% for OpenBLAS
> and 72.2% for NVPL. This agrees with the throughput result: the scheduling
> preference avoids repeatedly switching the active PE identity and allows cores
> to remain in full-resource ST mode for longer intervals.
> 
> [1] https://lore.kernel.org/r/20260909062649.469633-1-arighi@nvidia.com
I was able to run 'BLAS SGEMM' on ThunderX2 (ARM64) (SMT-4) on
'tip/sched/core' (base) and v1 and v5 (w/ small changes to get it
running on THX2).

$ awk '/^cpu0[[:space:]]/{print
$1;show=1;next}/^cpu[0-9]+[[:space:]]/&&show{exit}show&&/^domain/{print
$1,$2,$3}' /proc/schedstat

cpu0
domain0 SMT
00000000,00000000,00000000,00000000,00000001,00000001,00000001,00000001
domain1 MC
00000000,00000000,00000000,00000000,ffffffff,ffffffff,ffffffff,ffffffff
domain2 NUMA
ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff

$ numactl -H
available: 2 nodes (0-1)
node 0 cpus: 0 ... 127
node 0 size: 64270 MB
node 0 free: 62366 MB
node 1 cpus: 128 ... 255
node 1 size: 128599 MB
node 1 free: 126960 MB
node distances:
node     0    1
   0:   10   20
   1:   20   10

---

export OMP_NUM_THREADS=32
export BM="./OpenBLAS/benchmark/sgemm.goto 16384 16384 16384"

(a) 8 cores/32 CPUs (hw threads)
    $ numactl -C 0-7,32-39,64-71,96-103 -m 0 $BM

(b) 16 cores/32 CPUs (hw threads)
    $ numactl -C 0-15,32-47 -m 0 $BM

(c) 32 cores/32 CPUs (hw threads):
    $ numactl -C 0-31 -m 0 $BM

(d) Entire NUMA node 0 (unconstrained)	<-- !!!
    $ numactl -C 0-127 -m 0 $BM

(e) 32 cores/32 CPUs (hw threads):
    $ numactl -C 31-63 -m 0 $BM

(f) 32 cores/32 CPUs (hw threads):
    $ numactl -C 64-95 -m 0 $BM

(g) 32 cores/32 CPUs (hw threads):
    $ numactl -C 96-127 -m 0 $BM

---

MFLOPS values:

       v5        v1        base

(a) 225349.00 227305.68 227246.94

(b) 376297.15 373908.56 380849.55

(c) 877144.86 867642.35 861639.57

(d) 868285.22 865953.05 861662.81	<-- !!!

(e) 868182.05

(f) 866835.49

(g) 867389.74

---

So it doesn't seem to change much (v5 vs. base (d)).

When I look into the trace file then I can see that I have 32 benchmark
tasks running for 10s constantly (no sleep/wakeup) so with 32 cores and
32 task, the SMT aware select_idle_sibling() (symmetric CPU capacity)
should already place 1 task per core and then the tasks run there for
10s w/o migration. So I can't see how you're improvement can happen
since the benchmark has tasks <= cores (32 in my case, 88 in yours)?
