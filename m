Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287913A6F00
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526067; cv=none; b=JYa+iPM0Gn0iyBDAQbDUsQnEbtgNWui5nLqFiXQ+M/LP9ZBBAHXEHYYRokTBGTH89p7t4Sd+Je7CYuf/MJvlrdoMaAQEXBSwhBMl7wo32RyVe4fjupalk63Bmu7V60eDOn9SI/XLUNcQOR7e4LQwh6fc5x8szOBrGqOrP3I/Z44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526067; c=relaxed/simple;
	bh=dUA0w6rkmUKXkHdTpzfeMbO+ukD6AeXMnzgs2ndi0nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gE8VgoLYmHmG8bwWFXa70fiyDMi1yP2v8jFWhjFS0SPAvQGQz4x65B2CMuEe+/DZQ/kBtJI3kK8LJeQwNnpL+nuL2C4poixfPrnJYSID8Dvn83/Az89T4STLfuz75nUqcP0Y3SpBE7etKV8/SjlbL5f2MWVkCWIsvqd+pP/1pQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=2feBQNUF; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="2feBQNUF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ib231hSrUutdnOZqRRhD3YN7lmhWNHZ9uGVCcHvxjVs=;
	b=2feBQNUF6Jmmklotoj5ljj3FQ8hmgKUrgH6edAQuUORuB5eObH51JGoPPcyqf3kgHADRVGpiA
	nZjsg5+EgfNyIAwopSdaxepaglv520WpCuWypTP0U9Omq6kEdd9AIRvJ6o6sWfryLvtNmGUwD3r
	zt7apRk7RC/8D+ezGjCniOU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hl2jn6pDhzKmTc;
	Wed, 16 Sep 2026 10:23:09 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D2EA4048B;
	Wed, 16 Sep 2026 10:34:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 10:34:11 +0800
Message-ID: <18e3c3d9-562d-42c6-80f6-7744adfad79d@huawei.com>
Date: Wed, 16 Sep 2026 10:34:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery
 for CPU onlining
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-19-will@kernel.org>
 <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
 <aqP6kv9ZfNRWmngj@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP6kv9ZfNRWmngj@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/11 20:56, Will Deacon 写道:
> On Tue, Sep 08, 2026 at 09:05:18PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/8 0:40, Will Deacon 写道:
>>> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>>> index 17868b497d7c..bec4bc1b12db 100644
>>> --- a/arch/arm64/kernel/head.S
>>> +++ b/arch/arm64/kernel/head.S
>>> @@ -393,7 +393,6 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>>>  	mov	x0, x20
>>>  	bl	finalise_el2
>>>  
>>> -	str_l	xzr, __early_cpu_boot_status, x3
>>>  	adr_l	x5, vectors
>>>  	msr	vbar_el1, x5
>>>  	isb
>>> @@ -439,15 +438,15 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
>>>   * with MMU turned off.
>>>   *
>>>   * update_early_cpu_boot_status tmp, status
>>> - *  - Corrupts tmp1, tmp2
>>> - *  - Writes 'status' to __early_cpu_boot_status and makes sure
>>> + *  - Corrupts tmp1
>>
>> Corrupts tmp1, tmp2 ?
> 
> Well spotted, thanks.
> 
>>> @@ -125,45 +135,42 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
>>>  
>>>  void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>>>  {
>>> -	long status;
>>> +	union secondary_status status;
>>>  
>>>  	if (is_alive)
>>>  		return;
>>>  
>>> -	secondary_data.task = NULL;
>>> -	status = READ_ONCE(secondary_data.status);
>>> -	if (status == CPU_MMU_OFF)
>>> -		status = READ_ONCE(__early_cpu_boot_status);
>>> -
>>>  	/* A CPU has failed to boot. Try to figure out what happened. */
>>> -	switch (status & CPU_BOOT_STATUS_MASK) {
>>> -	default:
>>> -		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
>>> -		       cpu, status);
>>> -		cpus_stuck_in_kernel++;
>>> -		break;
>>> -	case CPU_KILL_ME:
>>> -		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
>>> -			set_cpu_present(cpu, false);
>>> +	if (smp_parallel_bringup)
>>> +		pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
>>
>> For some production systems, restarting to reproduce the issue may be
>> troublesome.
> 
> These errors _really_ shouldn't happen with production systems. They are
> caused by critical, deterministic errors such as the secondary CPU not
> supporting the system page size. If you can't reboot in that situation,
> then you have no system!

That does seem to be the case — this kind of situation is usually more
common with firmware issues or during the testing phase before a chip is
commercially available, and these boot problems should already have been
resolved before production systems.

> 
> The parallel bringup code will detect the issue, it just won't be able
> to tell you which CPU caused which issue.

Indeed.

> 
>>> +	if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask)) {
>>> +		set_cpu_present(cpu, false);
>>>  		if (!op_cpu_kill(cpu)) {
>>>  			pr_crit("CPU%u: died during early boot\n", cpu);
>>> -			break;
>>> +			return;
>>>  		}
>>> -		pr_crit("CPU%u: may not have shut down cleanly\n", cpu);
>>> -		fallthrough;
>>> -	case CPU_STUCK_IN_KERNEL:
>>> -		pr_crit("CPU%u: is stuck in kernel\n", cpu);
>>> -		if (status & CPU_STUCK_REASON_52_BIT_VA)
>>> -			pr_crit("CPU%u: does not support 52-bit VAs\n", cpu);
>>> -		if (status & CPU_STUCK_REASON_NO_GRAN) {
>>> -			pr_crit("CPU%u: does not support %luK granule\n",
>>> -				cpu, PAGE_SIZE / SZ_1K);
>>> -		}
>>> -		cpus_stuck_in_kernel++;
>>> -		break;
>>> -	case CPU_PANIC_KERNEL:
>>> -		panic("CPU%u detected unsupported configuration\n", cpu);
>>>  	}
>>> +
>>> +	pr_crit_once("CPUs may be stuck in kernel\n");
>>
>> Need we print the "cpu"
> 
> You should already get something like:
> 
>   CPUn: will not boot

"will not boot" is only for "cpu_died_early_mask" case, I meant the
"unknown state" case in the original default branch of the switch.

> 
> so I don't think we need anything extra (as, as above, we don't know
> exactly which CPUs are stuck).
> 
>>>  static void init_gic_priority_masking(void)
>>> @@ -407,12 +414,8 @@ void __noreturn cpu_die_early(void)
>>>  
>>>  	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
>>
>> It seems unsafe for multiple secondary CPUs to update
>> cpu_died_early_mask concurrently.
> 
> Why? cpumask_set_cpu() is atomic and each CPU only sets their own bit.

Oh! Sorry, I misread it — the underlying implementation uses atomic LSE
or LDXR/STXR instructions.

> 
> Will

