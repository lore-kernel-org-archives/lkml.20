Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E393CBE79
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442507; cv=none; b=GRm2GdI84r8sH7uMyG90V4lt/15gy8OwPe52BnGzJK5hlcyJAm/1ht8vniuDyXITLf5tZuvkLJuJt3BJgZyGPzeCH0gCf4qtFGgFTpqgCWRjMx3waL7Wu3c40XJ+nV+Y1d6EFNOjrowT335NhovFeeaJmwVJrzlgo9fWfmUMIg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442507; c=relaxed/simple;
	bh=jICRMY7vD8zo5aVmu92ZJQedWWvFzzWowT6JET4rvVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tKv8THIsPwUwZKtGxF7b6OUTWK28+5G8Avj66SswJMsguqrV5eu49CvoOnxt8/uovx3lunUfQSAEEn8UnH8x3nCQFf4Jqtsw4UQQ/Kf8EYQRjisQMNYh4D/2bjYaLs+B8WeosS6qYLE9YBKO5/O/5TxoXJ/8ANv1l/v1U+j0VxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ucUuazig; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ucUuazig"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3Ele1vlbSomyiSBoUzoimnTmuiwSnUrUWA5wS4kbapQ=;
	b=ucUuazigWRp1V1+LbQc2FgmgpLRTcMZsKgMnZIyYVef7EtpyHy9mG1fIIq0Y3wwm37+G21sd1
	YB8i3ZPAcew4vA46UAaRmTsToMkdy7JfL8MCWraTfBqyapF5mt4bv+0UTIfp1eJEtdHt7PBCAIi
	BdYBQCA5d+FaEJhpTSSH0iU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j0gRX1FtWz12LHn;
	Thu,  8 Oct 2026 14:43:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B372D40577;
	Thu,  8 Oct 2026 14:55:01 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 14:55:00 +0800
Message-ID: <476fe846-af4f-4cdd-b98b-86cc053b37c2@huawei.com>
Date: Thu, 8 Oct 2026 14:54:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/21] arm64: entry: Only check for stack overflow on
 exceptions from EL1
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-3-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-3-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> Checking for kernel stack overflow on entry from EL0 is largely
> pointless and gets in the way of using SPSel to switch to the overflow
> stack. If the kernel stack overflows on entry from userspace, that
> implies that it was unbalanced on the last exception return which means
> we can't sensibly reason about the state of the system given that we
> could've returned to an arbitrary virtual address in an arbitrary mode.
> 
> Remove the stack overflow check from the EL0 exception entry path.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 59f045e496ec..b5d8277f608a 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -54,6 +54,8 @@
>  	.endif
>  
>  	sub	sp, sp, #PT_REGS_SIZE
> +
> +	.if	\el == 1
>  	/*
>  	 * Test whether the SP has overflowed, without corrupting a GPR.
>  	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
> @@ -64,8 +66,11 @@
>  	tbnz	x0, #THREAD_SHIFT, 0f
>  	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
>  	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
> +	.endif
> +
>  	b	el\el\ht\()_\regsize\()_\label
>  
> +	.if	\el == 1
>  0:
>  	/*
>  	 * Either we've just detected an overflow, or we've taken an exception
> @@ -96,6 +101,7 @@
>  	sub	sp, sp, x0
>  	mrs	x0, tpidrro_el0
>  	b	el\el\ht\()_\regsize\()_\label
> +	.endif

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
>  	.endm
>  

-- 
Best regards,
Jinjie

