Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97F25C818
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788837220; cv=none; b=V1AR3m97r2H5mVPNQ00V07qNBPHFMSqA8uhVkr4Nl+24PTtW8q/zExOOlxohvFJVq1dsKPG+f5IBOWmXve/wlpJFYYZCA6Gn4UYGx2yfkW306KI6LOqfq0QKjwxDUSb8ij9oL1NvdTxDVsMYuCvWWReY0raCCUyiCq+95TgHOsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788837220; c=relaxed/simple;
	bh=eCyDK//tOScbIsnP4N0FMf5toIysty6/7OV+Kes6V18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HNbMituoJsyFpfJXMJgStJPRnJ+BQO9yfW9ONWi/BuJU0veosNMIcfD+xYVAb0VZUoORKuoMMFQYo+Qa+JoYBZoAc4LrjJ/6hHWDCDhPLA731AqJpCBWj8tq4LZQFMZcNAV6nCgOpGDB0pSXYKH5X00MqycYjGGk7PPxFkFtkWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=uYb/sscd; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uYb/sscd"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kHN8oJW86GtmFTcDsS8HMkGJt8UaI0Cndto85RL0Sqg=;
	b=uYb/sscdXMfGCoywCu9WF61WqB68Hfi+PTJ7b3alKoqi1teqhvsbcgmZqmkvaYp9umCqs/XTn
	G/0inFxorrqNFkqqm6NjVhjb5AAfdptxLJupSYN3qFGgdafCVTOjXxcpO75zqmrdWghzxi7fvI6
	sLmDQGZS604jZrzZKykKDK4=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4hf7yr4JSTzLlX1;
	Tue,  8 Sep 2026 11:02:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 29AF14055B;
	Tue,  8 Sep 2026 11:13:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 11:13:21 +0800
Message-ID: <a3bb7095-6759-45b8-b3b8-49820d97b68c@huawei.com>
Date: Tue, 8 Sep 2026 11:13:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] cpu/hotplug: Avoid trying to bring up CPUs that are
 already online
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-3-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-3-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> There's little point trying to bring up a CPU that is already online.
> Although _cpu_up() handles this case by doing nothing (because the
> target state has already been reached), it's wasted effort when we can
> easily elide the call to cpu_up() in the first place.
> 
> Check that the target CPU isn't already online before invoking cpu_up()
> from cpuhp_bringup_mask().
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  kernel/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 198c929c452a..97a9bfe4edad 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1769,7 +1769,8 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
>  	for_each_cpu(cpu, mask) {
>  		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
>  
> -		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
> +		if (!cpu_online(cpu) && cpu_up(cpu, target) &&
> +		    can_rollback_cpu(st)) {

Make sense to me.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  			/*
>  			 * If this failed then cpu_up() might have only
>  			 * rolled back to CPUHP_BP_KICK_AP for the final

