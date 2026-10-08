Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC836B043
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460082; cv=none; b=d6n/llzmB45QcptmTCyFXYmpeqA/Nn0/Ac54whdO4PCd5Y/+0WLD+xSsqFc9+UDWId7gd4+FidQuQEhKYIOd76fHjKX7QPVLXmaU1ky3UuvLcRDJrSTdpWFEnjDtYDtGQJCg3uGIj+QWwF+S9KzTNs+EY7TXsxrb8Vku/mYwSS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460082; c=relaxed/simple;
	bh=693n42q7gv16cgET7qpJBLB01poavgmfi3HejuBROcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n8+ICQxVGSz4CP6M/CoYO+WSsDrr3qWQtqix8t2zuGXdZ0ShsEKtLfRAnINaPSZwKE4gYqjxITX37hd6q47Ly05ZcaQUQgANIipSxG1p5wrK1eecJfV14634IYtWkrmqqWQZM+JFVgZMLCO3NAMF/e1fLMwWbzkp3y8eg4lVJAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=epsrYwIq; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="epsrYwIq"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0QYn9TXvnmJ4ZihqcEGo9v58p4Zetixq26bjUvNxJos=;
	b=epsrYwIqbsZtAf2q67DL1OD8YbBNT0T4RjAKv2Adjwz6rLW7tIc6PXsn99Q9IaW/8iu+v4U6D
	Ie69N6BsAU6M+/UJn/b6BPeDu5ErqLWKQgP39ZKB10lluoi0C4B5znT6oeNDDxvoyDcWVDniiYK
	ciSKLlVuTOR8n0x4EG5ILck=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j0nxZ074qzcb3w;
	Thu,  8 Oct 2026 19:36:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D0B0C4058C;
	Thu,  8 Oct 2026 19:47:53 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 19:47:52 +0800
Message-ID: <e0c85b38-7d5c-48e6-a7d2-9843ef08f53d@huawei.com>
Date: Thu, 8 Oct 2026 19:47:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] arm64: entry: Implement EL1t exception handlers
 for overflow stack
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-17-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-17-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:14, Will Deacon 写道:
> In preparation for using EL1t to handle exceptions taken whilst running
> on the overflow stack, implement some simple wrappers around the EL1h
> handlers which perform a best-effort stack overflow check before
> proceeding.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry-common.c | 43 +++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 72c03ccea59f..9738142780df 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -327,10 +327,45 @@ static void debug_exception_exit(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -UNHANDLED(el1t, 64, sync)
> -UNHANDLED(el1t, 64, irq)
> -UNHANDLED(el1t, 64, fiq)
> -UNHANDLED(el1t, 64, error)
> +static void noinstr el1t_64_check_overflow_stack(struct pt_regs *regs)
> +{
> +	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
> +	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
> +
> +	/*
> +	 * We're in big trouble if we've overflowed the overflow stack
> +	 * so perform a best-effort check before we proceed. If our SP
> +	 * is outside of the overflow stack for this CPU then presumably
> +	 * we're already corrupting memory, so park ourselves here in an
> +	 * attempt to contain the damage.
> +	 */
> +	if (sp < ovf_stack || sp > ovf_stack + OVERFLOW_STACK_SIZE)
> +		cpu_park_loop();

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +}
> +
> +asmlinkage void noinstr el1t_64_sync_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_sync_handler(regs);
> +}
> +
> +asmlinkage void noinstr el1t_64_irq_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_irq_handler(regs);
> +}
> +
> +asmlinkage void noinstr el1t_64_fiq_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_fiq_handler(regs);
> +}
> +
> +asmlinkage void noinstr el1t_64_error_handler(struct pt_regs *regs)
> +{
> +	el1t_64_check_overflow_stack(regs);
> +	el1h_64_error_handler(regs);
> +}
>  
>  static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>  {

-- 
Best regards,
Jinjie

