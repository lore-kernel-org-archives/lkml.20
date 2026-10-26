Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023894;
	b=jerSA+nyGqy5zKx7MeDQxxNuJV1xVM6Z4IXtWpGJ7qbkUXO7h9eDtVfSefaXaA3kFIE9
	 CkV8CftrQKiRzm8ivlFNnr78bHE5UoB14KFKa8yWZ7jVQw5ph0PgUbGGx5/xsZn+0FIQa
	 Ik157XDOyqxdUAiuEPn95josbtr5DOj48JetpV5pBE4X3Qv7NwSRP0rmSKG5lMFhD2RBr
	 74uComVMzIK/F56ESB85+MBOtmz/uTUUothurDipYG69PMKU8ChAwvyUD1CUtyGFIXXhV
	 gPqre3LRCUwSI9V84z8K/MyXbS++iGmRaJQTEbEfmfT+FX3JrVoBlGYEcaNTH1+dWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023894;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PI5wqDBiF7nsEyHQZBLxNg0fp4e9DP4HSl3Kk4QhBZk=;
	b=OCRbdQBaxojldvovZUQ9m48wdwdWUaCmyYCeP7WLlp/4DaaEDXLWlqEGl64+YrsY4/+V
	 IsIoHE7Qc1oMBuT9+Sr9Z1mSxaXnqH6pbwOAfQp8gnOEACV7xKY5/AiOzfgqU2VzuVny6
	 DPped4swEWh0isQXgGmLP+uwA1Ls5U9xoImXe5q5RZ8J4m9eBSVNW48DapvITyVBy6asb
	 iKev9NaOzjIXRe10UzcBOuZy388SsqFro9+gdU3VoF1QsyVw0C5cdWjSRCqkOFq0SYGgJ
	 KpaRRjbHNB+RZjfN692Xj+o8R37r0BE9g3Y5od7Ae1MAVdow7cB3P1T83djcof+njAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RgsXc4rs;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0813606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0813606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RgsXc4rs
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8AE72F;
	Mon, 26 Oct 2026 07:11:29 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969EA3F7B4;
	Mon, 26 Oct 2026 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793023892; bh=SblbLAB5FWMJmeQB6R0Jiu4dJxZ35gpsAzWLBpsnbf4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=RgsXc4rsWMsvJ6UpKw7jVZ1pv/tV3OKPOD2sgbcFGSUHNzkDXymkhXDD4smDmm4SM
	 1+HoFKJYuun9AZecsEzKg0AzjJ4kHJlcCx8c5YZi+li4s/rctE9WZ21lZKtEbxpne/
	 95CHzdDRXEHASLAUPd5F9xXZJYGEWJRxVlr/eKII=
Message-ID: <a27fb58a-563b-4c40-8be2-cc9d05f24279@arm.com>
Date: Mon, 26 Oct 2026 14:11:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 RESEND 02/15] fs/resctrl: Skip monitor context
 allocation when force-freeing RMIDs
From: Ben Horgan <ben.horgan@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-3-ruanjinjie@huawei.com>
 <069b920d-b1f9-4074-aee0-1607860dac21@arm.com>
Content-Language: en-US
In-Reply-To: <069b920d-b1f9-4074-aee0-1607860dac21@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 26/10/2026 14:08, Ben Horgan wrote:
> Hi Jinjie,
> 
> On 20/10/2026 14:42, Jinjie Ruan wrote:
>> __check_limbo() allocates the architecture monitor context before the
>> scan loop, even when force_free is set. The force-free path never reads
>> occupancy and never uses the context.
>>
>> If the allocation fails, the function returns early and leaves the limbo
>> list unflushed. Callers such as the unmount path then silently fail to
>> return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
>> are re-interpreted with the CDP state of the next mount.
> 
> Is this a theoretical fix or is there some way that resctrl_arch_mon_ctx_alloc() can fail in practice?

This does seem a good change to me and we do have to consider that the memory alocation might fail.

Thanks,

Ben

> 
> Thanks,
> 
> Ben
> 
>>
>> Only allocate and free the monitor context when occupancy will be read.
>>
>> Fixes: fa7d949337cc ("x86/resctrl: Rename and move rdt files to a separate directory")
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  fs/resctrl/monitor.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index da883adc3adc..ffa9c67c9f00 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -142,11 +142,13 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>>  	u64 val = 0;
>>  
>>  	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
>> -	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
>> -	if (IS_ERR(arch_mon_ctx)) {
>> -		pr_warn_ratelimited("Failed to allocate monitor context: %pe",
>> -				    arch_mon_ctx);
>> -		return;
>> +	if (!force_free) {
>> +		arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
>> +		if (IS_ERR(arch_mon_ctx)) {
>> +			pr_warn_ratelimited("Failed to allocate monitor context: %pe",
>> +					    arch_mon_ctx);
>> +			return;
>> +		}
>>  	}
>>  
>>  	/*
>> @@ -192,7 +194,8 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>>  		cur_idx = idx + 1;
>>  	}
>>  
>> -	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
>> +	if (!force_free)
>> +		resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
>>  }
>>  
>>  bool has_busy_rmid(struct rdt_l3_mon_domain *d)
> 

