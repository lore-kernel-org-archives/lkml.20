Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982914734CD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251585; cv=none; b=Ham3J81jBCHFRZeUFEcSY9i9xm57JHJ3LYJXbfdGlso6pVq+BJKrSv5Ug/qLP8PLtu7JLivJyRmLPrZTRQhiLuCtuwpbli8Kz4slt04Qp4QVEUpzrytaq/MYyaIcvFMcafLs/7ZuZnMd16hlTXDXxa8sdu68BjU9V70AHP2N3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251585; c=relaxed/simple;
	bh=dD3o5E2tk/NgDTsDnmNRW71cVi00yPTIGhnsNk2NjVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSB0ccIP4J7hlYa6BeqRkuqYQXNGOwjNaswlQhP1R+ln2HJN716ZttykDzQIdA0R923aojL5BmeDPri5Gyt6MNNTTOHJonteAsbRIBfPQeNPukvr3AQR+dAoqpSPbXfnH7xXLNgRaH9VeN6/LoXoH33Ak0/jlGrVBBPfiLUlWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EM3V81gN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EM3V81gN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF481756;
	Tue,  1 Sep 2026 01:32:59 -0700 (PDT)
Received: from [10.1.39.91] (e127648.arm.com [10.1.39.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 934233F882;
	Tue,  1 Sep 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788251582; bh=dD3o5E2tk/NgDTsDnmNRW71cVi00yPTIGhnsNk2NjVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EM3V81gNXEwJV4m+GEknzrIFofbKGEiF1Rua0D1glODM2E/slzbHQ3tQgdec1+VPL
	 JVlnzuuoJylPMnQzuelKW2xyccd49xozCO1oBnhV1zUK74vzcUqcQMzQlhKadMXtWB
	 ZR+SdyAgRb7tk/Su59jFsSsoqXR6GoZVi1WdTOCk=
Message-ID: <25dbcc86-bfb2-4018-b388-7d8d1693203b@arm.com>
Date: Tue, 1 Sep 2026 09:32:56 +0100
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
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-2-arighi@nvidia.com>
 <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com> <apX1j6srdTcFLZOd@gpd4>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <apX1j6srdTcFLZOd@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 22:43, Andrea Righi wrote:
> Hi Christian,
> 
> On Mon, Aug 31, 2026 at 10:13:42PM +0100, Christian Loehle wrote:
>> On 8/31/26 19:10, Andrea Righi wrote:
>>> NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
>>> capacity but two different resource modes. One-Thread Active mode gives
>>> one PE the full core, while waking the other PE restores Two-Thread
>>> Active mode and partitions decode, issue, cache, TLB, and vector
>>> resources. Returning to full-resource mode requires the sibling to
>>> remain in WFI for 10 Ki cycles.
>>>
>>> Measurements show that pinned workloads perform equally on either PE,
>>> but freely migratable workloads lose substantial throughput when they
>>> alternate between PE identities. Consistently selecting PE0 keeps PE1
>>> idle, avoids repeated SMT repartitioning, and restores one-thread-per-core
>>> performance.
>>>
>>> Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
>>> identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This is
>>> independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal capacity,
>>> while physical cores with different maximum frequencies are handled by
>>> a higher scheduling domain.
>>
>> But why? This asympacking + CAS interaction is a bit hard to comprehend IMV.
> 
> The two mehcanisms describe different preferences at different scheduling domain
> levels: SD_ASYM_CPUCAPACITY selects among physical cores with different max
> capacities, SD_ASYM_PACKING is set only on the SMT domain and selects the
> canonical PE within the core chose by the existing placement and capacity logic.
> 
>> Why can't we encode both preferences in the asym-packing priority, e.g.
>>
>> priority(cpu) = is_primary(cpu) ? 2 * highest_perf(cpu)
>>                                 : highest_perf(cpu)
>>
>> so that all primary PEs are preferred over all sibling PEs, while still
>> preserving the highest_perf ordering within each group, and do away with
>> SD_ASYM_CPUCAPACITY on Vera altogether?
> 
> I can experiment with this combined priority, but I think removing
> SD_ASYM_CPUCAPACITY is a separate policy change rather than an alternative
> implementation of this fix.

Cool thanks, and sorry for curveballing the approach like this, I wish I had
the platform to test these ideas myself :/ 

> 
> A static asym-packing priority does not preserve the capacity-aware semantics
> used for task fitting, uclamp, misfit handling and migration. The current
> approach keeps those semantics when selecting a physical core, then applies the
> PE preference only within that core.

Right, but arguably most of these semantics become questionable as soon as the
core enters two-thread mode, since the capacity available to each PE then
depends on the state of its sibling.

Task fitting:
We consider two tasks with util=400 to fit on two capacity=1000 PEs, even
though once both PEs are active neither may have anything close to capacity
1000 available. In other words, the capacity used for fitting doesn't account
for the capacity "stolen" by activating the sibling.

Uclamp:
Isn't uclamp, and particularly its bucket implementation, fundamentally a poor
fit for these platforms in the first place? Even if we tried to represent these
small capacity differences through uclamp, we'd need something like
UCLAMP_BUCKETS_COUNT=512 or 1024 to get useful resolution. We currently limit
it to 20, and for good reason: the overhead.

Misfit handling:
This seems problematic for essentially the same reason as task fitting. A task
can be classified as fitting while the core is in one-thread mode, then lose a
substantial fraction of its effective CPU capacity when the sibling becomes
active, without the static CPU capacity reflecting that change. Conversely,
migrating it to an otherwise equivalent core and allowing that core to return
to one-thread mode changes the effective capacity (and therefore utilization)
again.

I'm assuming the CPU_CYCLES counter advancement isn't affected by the
one-thread/two-thread mode transition?

> 
> Also, encoding the combined priority alone would not fix the problem addressed
> by patch 2: the idle-selection paths currently do not consult asymmetric SMT
> priority. They can still return an arbitrary idle sibling regardless of how
> arch_asym_cpu_priority() is defined. Patch 2 adds that missing behavior and
> scopes it to the shared-capacity SMT domain.

Sure, patch 2 is a different story altogether.

> 
>> I had suggested this a while ago, did you have a stab at that by any chance,
>> too?
> 
> I tested your CPPC-based asym-packing series, but not this particular
> combined-priority variant. IIUC the earlier proposal was replacing
> capacity-aware scheduling for minor physical-core capacity differences, SMT
> sibling ordering looks like an orthogonal problem.
> 
> And at the time, the combined SMT-aware SD_ASYM_CPUCAPACITY approach also gave
> the best Vera results of the alternatives I tested, which is another reason I
> kept physical-core capacity selection separate here.
> 
>> Am I missing something altogether?
> 
> Combining the priorities is a valid experiment, but I'm not sure if it
> completely solves the problem by itself, I'll give it a try and share the
> results.

Thanks again, i'll have a look and give it some more thoughts myself.

> 
> Thanks,
> -Andrea
