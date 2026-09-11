Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347623D7FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136150; cv=none; b=ZL0exEdlO8KEghQTXHpQnwAahlefWHlv3zxhRd2YoPj2kUrQbFKH0j00RvoRzgOs3sE7kijCSypEuc8k3RxShRI0lzAO/Y2bAqIr8pfU3s5abPk9ZJ6v0TOurZSRDSvkdom2sOoIqfnQZgQiE3yDKxE72e5P52GQxDDhcd760Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136150; c=relaxed/simple;
	bh=d6mzXbmJYFm0GynqcHkfdRTupKXChsoklSxL3P+yA9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnlmVyhmPxVPji8lq3W1p7usQ2qDwCeBi/cjqwZDHmMnzSchwDVKeOtvD8PSKf10WQDEiSiO34nhi0hdMmm1j6tujvpxOjXYu/4krm8SIru+0cxfHl7kPXYW7GSZiFPDczWZA0ZJ1uBFnYENbv2gTbJHVItnihSBcK6CgEU12No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fmcup4RL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fmcup4RL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AD9C16F2;
	Fri, 11 Sep 2026 07:15:44 -0700 (PDT)
Received: from [10.57.73.19] (unknown [10.57.73.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6D193F7B4;
	Fri, 11 Sep 2026 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789136148; bh=d6mzXbmJYFm0GynqcHkfdRTupKXChsoklSxL3P+yA9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmcup4RLpkQPrB7uRbMMbrAv43xH71VYNGkTpY8+FbNIAeNMuNklcinPYlN6V44AQ
	 TaJ5cHe04TW8rkSnz3vYYQzfIi7N4Nf9ZWEZGjFMV1CKICVhPyJtkiHWnEAM55SduO
	 eWCfO0AJalfAUzdhKo1Wd+i+j4Qb0aUvdYUqHgNw=
Message-ID: <2646dfa6-3f0f-49d1-a7d8-4b93fbd1ec71@arm.com>
Date: Fri, 11 Sep 2026 16:15:42 +0200
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
 <1528999e-eb59-416f-b18f-2a7667e61a90@arm.com> <aqPFpUw9Y4Ui8ia-@gpd4>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <aqPFpUw9Y4Ui8ia-@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.26 11:11, Andrea Righi wrote:
> Hi Dietmar,
> 
> On Thu, Sep 10, 2026 at 12:11:06PM +0200, Dietmar Eggemann wrote:
>> On 09.09.26 18:17, Andrea Righi wrote:
>>> On Wed, Sep 09, 2026 at 05:19:08PM +0200, Dietmar Eggemann wrote:
>>>> On 09.09.26 08:26, Andrea Righi wrote:

[...]
> I think we can avoid an arm64 override entirely and rely on the default
> implementation:
> 
> int __weak arch_asym_cpu_priority(int cpu)
> {
> 	return -cpu;
> }
> 
> The boot option would only add SD_ASYM_PACKING to the SMT domain. A rough
> prototype could look like this in kernel/sched/topology.c:
> 
> static bool sched_smt_asym_packing __read_mostly;
> 
> static int __init setup_sched_smt_asym_packing(char *str)
> {
> 	sched_smt_asym_packing = true;
> 	return 1;
> }
> __setup("sched_smt_asym_packing", setup_sched_smt_asym_packing);
> 
> int cpu_smt_flags(void)
> {
> 	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
> 
> 	if (sched_smt_asym_packing)
> 		flags |= SD_ASYM_PACKING;
> 
> 	return flags;
> }
> 
> This would make the option generic rather than specific to arm64 or Olympus.
Ah, OK, no arm64 private 'struct sched_domain_topology_level
arm64_asym_smt_topology[]' anymore.

[...]
