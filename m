Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BAA3A875A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526458; cv=none; b=a1hp18uifDTwbTaREjZmnjZSGopW7m1oFQs0JsxSLtXe/4lyzRmmMkDC4eqBxnUdQtkc5R9ftvXVa0QPUBREsR5cMK6UWF9gdEbDl/WpJb9vw6WAqvOwstoS3iNiTqkoGd+NJJRhAj4HLh+JYAHnuUssGlnvmwCCgRQ5CGZlf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526458; c=relaxed/simple;
	bh=lR8+LHQ9mxcV1HVWv86R39nXKUiGS53kBau0NLUlA4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VgZtWyJXE2JIRnwDJ5tlZH1GfV6WW61bcnkrEClFDUNEwsAbh5bJWzJEySOeLaGdU79twvWZUIOWeB28w+r3v1YI9gvhOujU5z2OCRBcgRweQQCOK3RmqnuwiUwSzbIgM22lenElF0mtgGvshrshLr2OSvdSwp3uMx73uiuy5gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YzkwZQpG; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YzkwZQpG"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c+G1FOCWXLkN8j6Q3OlM8pkV0Orx9iwVxUAFrdbXSd0=;
	b=YzkwZQpG+WmuZg4XY5M+XCWgYMeFChbTmiZMkMJLHm7vRW4PV8dFYquLglRjfYk0I3YF0KOgB
	D/acBo32iRNFdQwtJNckBgXn8PeHbMXwdb8tJ0WvZd4Zdbgbe5NnlbjWKJDOFqYkjaHlzCOZGFt
	EcMsFjFb/e+lZy/hS9ENAa4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hl2rf6BrNz1T4LX;
	Wed, 16 Sep 2026 10:29:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E4DE440537;
	Wed, 16 Sep 2026 10:40:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 10:40:47 +0800
Message-ID: <8fffefd6-c109-49ad-8265-e3bd63b629ea@huawei.com>
Date: Wed, 16 Sep 2026 10:40:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during secondary
 CPU bringup
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
 <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
 <aqFS58mJ4GJNrbZ2@willie-the-truck>
 <19ba4bb9-e2c4-4956-bd8d-b8f50259a422@huawei.com>
 <aqP5ofIC8rkmtBtK@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP5ofIC8rkmtBtK@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/11 20:52, Will Deacon 写道:
> On Thu, Sep 10, 2026 at 10:47:58AM +0800, Jinjie Ruan wrote:
>> 在 2026/9/9 20:36, Will Deacon 写道:
>>> I was about to say "don't do this" but then I realised two things:
>>>
>>> 1. update_siblings_masks() can trigger lockdep splats outside of
>>>    pr_debug() if RCU isn't up and running, e.g.:
>>>
>>>     [    0.524042]  show_stack+0x18/0x24 (C)
>>>     [    0.524519]  __dump_stack+0x28/0x38
>>>     [    0.524546]  dump_stack_lvl+0x64/0x84
>>>     [    0.524562]  dump_stack+0x18/0x24
>>>     [    0.524576]  lockdep_rcu_suspicious+0x134/0x1cc
>>>     [    0.524591]  __lock_acquire+0xee8/0x2cb0
>>>     [    0.524606]  lock_acquire+0x11c/0x2fc
>>>     [    0.524621]  _raw_spin_lock_irqsave+0x64/0x84
>>>     [    0.524641]  of_find_property+0x2c/0x8c
>>>     [    0.524659]  detect_cache_attributes+0x1c0/0x6d0
>>>     [    0.524676]  update_siblings_masks+0x38/0x288
>>>     [    0.524692]  store_cpu_topology+0x4c/0x58
>>>     [    0.524706]  secondary_start_kernel+0xdc/0x1c8
>>>     [    0.524722]  __secondary_switched+0x120/0x124
>>>
>>> 2. This code is running _after_ cpuhp_ap_sync_alive().
>>>
>>> So for the next version, I'll reintroduce the call to
>>> rcutree_report_cpu_starting(), but move it immediately after the call to
>>> cpuhp_ap_sync_alive(). I think that will solve these issues, without
>>
>> pr_crit() and pr_warn() (such as vec_verify_vq_map()) in
>> check_local_cpu_capabilities() can also trigger lockdep splats as below.
>>
>> But I think this is not common on the failure path, so it seems to have
>> little impact..
> 
> I agree that we shouldn't bend the code out-of-shape to squash a debug
> warning on an error path (ideally, printk would handle this internally),
> especially as the original message does seem to get printed in the end.
> 
>> [    0.158619] smp: Bringing up secondary CPUs ...
>> [    0.173958] CPU1: missing HWCAP.
>> [    0.174071]
>> [    0.174088] =============================
>> [    0.174099] WARNING: suspicious RCU usage
>> [    0.174197] 7.3.0-rc2-00020-gef0bd63bdd97-dirty #504 Tainted: G        W
>> [    0.174217] -----------------------------
>> [    0.174226] kernel/locking/lockdep.c:3845 RCU-list traversed in
>> non-reader section!!
> 
> However, if this is caused by vec_verify_vq_map(), then how are you getting
> that to run on the early boot path? check_local_cpu_capabilities() only

Sorry, based on the fact that pr_crit() or pr_warn() is printed before
rcutree_report_cpu_starting() is called, I modified the code to add
print tests to simulate this situation.

> calls verify_local_cpu_capabilities() if system_capabilities_finalized().
> 
> Or is the backtrace for something else?
> 
> Will

