Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015817B50F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789867514; cv=none; b=axkjhCP0d+b+VXSWn81x4ErLwqmJRAOwvLXnGkAmHVL5szgAsbIQXLEz9s+vajmgH21Gd4m+Is6aEs7XP9MfXv4MBRHfltQQ0QJDhJOR18orktvzoy3waKEDwHtEHGrzNJ1M6WgcPshgdCzLU0D9hL7S6S/r0aoi+KhO0hzlfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789867514; c=relaxed/simple;
	bh=H62OPbhrKpBolMTM+xpneIDfmWVVP2nHRsDIfyOKfwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LzYj/SSqVHfLmWspqVfDpRn84zspUl3Z/qVCUfcK3P2ad3ojWFZdIlzwI6R7ZPpXRXxlPLtOeY/p47JFLovKpffgrysLNjvEPooQMtTzT+kjw/JR9GoY6BJgrl0YFsJgYg9NtQjcGKilG41p9aZcGD36QaVXdTInHfaqclS1M+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=tnkdoXA4; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="tnkdoXA4"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=njMEOsUoFJohAu6zIFYCgKOv4TMKh676Gz+T7444Mp4=;
	b=tnkdoXA4VWP7+jjWoGdnYPnT2L7i3VvJ1QUoVtlBOAbEtq7h/+oeGKrha/fAtKg98TTLOAI81
	LA8IIImUBK2gz5LLbi2phQ9oGckWPkTf68ivWlgEEIitAsbUxyXmlVs2v/j8byqIqvGU5XUpWi+
	e1tUGUyF6L78HplugkIb8C4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hnT055drlznTZf;
	Sun, 20 Sep 2026 09:13:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BEC59402AB;
	Sun, 20 Sep 2026 09:25:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 20 Sep 2026 09:25:00 +0800
Message-ID: <dacc53d7-cb2c-4861-8813-8aff63e955bb@huawei.com>
Date: Sun, 20 Sep 2026 09:24:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 02/14] arm64: ptrace: Rework audit_syscall_entry()
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260902095537.602517-1-ruanjinjie@huawei.com>
 <20260902095537.602517-3-ruanjinjie@huawei.com>
 <20260919164319.90193-1-kmehltretter@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260919164319.90193-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/20 0:43, Karl Mehltretter 写道:
>> +	if (unlikely(audit_context()))
>> +		syscall_enter_audit(regs);
> 
> With arm64 defconfig and CONFIG_AUDIT=n on v7.3-rc1, building
> arch/arm64/kernel/ptrace.o after this patch fails with GCC 15.2.0:
> 
> arch/arm64/kernel/ptrace.c: In function ‘syscall_trace_enter’:
> arch/arm64/kernel/ptrace.c:2491:17: error: implicit declaration of function ‘syscall_enter_audit’ [-Wimplicit-function-declaration]
>  2491 |                 syscall_enter_audit(regs);
>       |                 ^~~~~~~~~~~~~~~~~~~
> 
> The helper is defined only under CONFIG_AUDITSYSCALL, but this call
> remains when auditing is disabled. The audit_context() check does not
> avoid the missing declaration.
> 
> Could the helper get an audit-disabled stub, or could this call be
> guarded as well?

Hi Karl,

Thank you for pointing out this issue.

We discussed a similar problem with generic entry in the link below.
Thomas believed it appears to be a compiler problem, and we originally
planned to fix it using __always_inline. I will fix it following the
same approach used for generic entry.

https://lore.kernel.org/all/87tso45bqq.ffs@fw13/

Link:
https://lore.kernel.org/all/20260720094921.537716-1-ruanjinjie@huawei.com/
Link:
https://lore.kernel.org/all/20260721040118.1000554-1-ruanjinjie@huawei.com/

> 
> The same object builds after patches 1 and 13. Patch 12 still fails
> with the missing declaration. Patch 13 removes the affected code, but
> the intermediate commits should remain buildable.
> 
> Thanks,
> Karl

-- 
Best regards,
Jinjie

