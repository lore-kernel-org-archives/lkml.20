Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97638DC54
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521372; cv=none; b=W7QTitgfgVpSToBj/QpwUqB2ri+5nfXAOpknuSwkc48xg7Z0gEK+cf2ZCbg973Z3M121wepKuO4NzHBsF9E2iEOZGTT8w6FBbNPJK/JbOs5sJ4MgCb5838BzhhdGvqBlDx6WRyuTHh5/Y0MFfY/lHHsJt1aK6HZAg6c36UsdY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521372; c=relaxed/simple;
	bh=C2qDzL2be/fqtgkivnf7rNpx66Jv++v4p7NtqXWSyFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V68Z2wls41tyjVVLKuwbFY74SePekGO7AdSQC3pHCxPrrP/0kWFpU/lakjK5dW27Jk4PFfdcrZ0yYtqldjgPYA+PO00T0PnmuzR5iJI9KA9zrUIJqfm3M4J5zlink8J5PLeDmi+zR4A0IhSYTwUWAwIS4vPi9I2kfVaijNhhc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6UUP6TpG; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6UUP6TpG"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wj5xqr16b+MiF4gXbOwrdteITzUjU5K79Zm5S/GYYos=;
	b=6UUP6TpG0J+fyZ3faJJH2xKA7tmsEgCYAzlBcLo25E83gIbC0jyMxX8/rysB+6+2zm6RY9vuP
	I83KyOVhB+bjkh3+me+WYUltdWmprtK8nGUWVZNGU/Um6XJfOAVpIFEtkn1tvH3Psjx3mzOWlc5
	qlNaZjrzTFVw4F+aN2vZZZ8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hl0zf2CKvz1K9B2;
	Wed, 16 Sep 2026 09:05:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E326F4057A;
	Wed, 16 Sep 2026 09:16:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 09:16:00 +0800
Message-ID: <eaf9019f-ae88-4ede-9bcf-36e0b6e88155@huawei.com>
Date: Wed, 16 Sep 2026 09:15:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-4-will@kernel.org>
 <0fa7d64c-9ccb-4a25-b40a-6ffbf5e33406@huawei.com>
 <aqP6wy6BBZXI80vq@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP6wy6BBZXI80vq@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/11 20:57, Will Deacon 写道:
> On Fri, Sep 11, 2026 at 03:16:23PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/8 0:40, Will Deacon 写道:
>>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>>> index 97a9bfe4edad..d9fe204f02cb 100644
>>> --- a/kernel/cpu.c
>>> +++ b/kernel/cpu.c
>>> @@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
>>>  	(void)atomic_xchg(st, state);
>>>  }
>>>  
>>> -void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
>>> +void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
>>> +{
>>> +	if (old < SYNC_STATE_ALIVE)
>>> +		cpu_relax();
>>> +	else
>>> +		atomic_cond_read_relaxed(st, VAL != old);
>>> +}
>>
>> As sashiko pointed out, it seems that the else branch unreachable for
>> the call of cpuhp_wait_for_sync_state(cpu, SYNC_STATE_ALIVE,
>> SYNC_STATE_SHOULD_ONLINE), the old state can only be "SYNC_STATE_KICKED"
>> or "SYNC_STATE_SHOULD_DIE", which go the if branch.
> 
> Ah yes, it's a harmless leftover from my initial (failed) attempt to use
> cpuhp_wait_for_sync_state() in cpuhp_ap_sync_alive(). I can drop this
> part and reword the commit message.

Thanks, looking forward to your update — that will be nice.

> 
> Will

