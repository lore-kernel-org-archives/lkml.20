Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C85392C46
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458540; cv=none; b=crUlbXVpkiplZdLNCniqSL7DFuEOgYLva9sd5pXQynIwKo8nCFe4HGfHix1NqLyrD5C3JvAu0uJKl+h7/8cS1cqjEPb03jDTPOZttVTtzOAAuGzN+xQr5MmNhoY/sTpi/vi5vjIBE4R5agm0m1kW9q8Ldtm8rPM7ROU2YuwQzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458540; c=relaxed/simple;
	bh=WifiYhHcJ6wvgv8665hCmdjmnp9JcYua8eZj2Dhj6a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TNorWlC198JQ8ZUC8cW+Aquaq2hsWGTK28PKpvR3EpRkzDUvXisAoOr3iSeUB3xpBydWQ124OkOV97KmrM6ZhfXO5QsJIT0xil31YaQQrtQ8O9wC6qbRoPajziO2SyyKqAmrnFrgLJRXV642FEz5eTIYJxvGfzzC+IDKzPI1fZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1guiT3+s; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1guiT3+s"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JWzImz3cqI9tgDnTW/KJeshwK980DTvrUuQf1fLz0B8=;
	b=1guiT3+soDEy4fmsY9M99q//qZRaIRuHJyzq5fEef8Qj3/w3AObA6dzEdSHb1IH0K3gEyW1ki
	7b/18QDVL2913rqtbHY4tnf+G7FmqnLzt7s+l+k+TFkEb8TkP51OSDKncSIwZJlIVdomWQbEy95
	k3S0KHgMiyPny9mFdpg/qmo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4j0nMq2f15z12LHj;
	Thu,  8 Oct 2026 19:10:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CA15340561;
	Thu,  8 Oct 2026 19:22:12 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 19:22:11 +0800
Message-ID: <169e4e90-2802-4034-a45a-dc7fcc6cdea7@huawei.com>
Date: Thu, 8 Oct 2026 19:22:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] arm64: entry: Point SP_EL0 at the overflow stack
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-16-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-16-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> With SP_EL0 now available for use in the kernel, point it at the
> overflow stack so that exception entry from EL1h will later be able to
> switch to the overflow stack by writing to SPSel.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S |  2 ++
>  arch/arm64/kernel/head.S  |  3 +++
>  arch/arm64/kernel/smp.c   | 12 ++++++++++--
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index a45be0a837c8..6958ee238649 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -227,6 +227,8 @@ alternative_cb_end
>  	mrs	x21, sp_el0
>  	ldr_this_cpu	tsk, __entry_task, x20
>  	msr	tpidrro_el0, tsk
> +	adr_this_cpu	x19, overflow_stack + OVERFLOW_STACK_SIZE, x20
> +	msr	sp_el0, x19
>  
>  	/*
>  	 * Ensure MDSCR_EL1.SS is clear, since we can unmask debug exceptions
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index c33551ee6572..27a19e1a0ee6 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -210,6 +210,9 @@ SYM_CODE_END(preserve_boot_args)
>  	ldr	w\tmp2, [\tsk, #TSK_TI_CPU]
>  	ldr	\tmp1, [\tmp1, \tmp2, lsl #3]
>  	set_this_cpu_offset \tmp1
> +
> +	adr_this_cpu	\tmp1, overflow_stack + OVERFLOW_STACK_SIZE, \tmp2
> +	msr	sp_el0, \tmp1
>  	.endm
>  
>  /*
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 702dee8d0db5..4c122d6598de 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -51,6 +51,7 @@
>  #include <asm/processor.h>
>  #include <asm/smp_plat.h>
>  #include <asm/sections.h>
> +#include <asm/stacktrace.h>
>  #include <asm/tlbflush.h>
>  #include <asm/ptrace.h>
>  #include <asm/virt.h>
> @@ -448,8 +449,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  
>  static void __init set_boot_cpu_offset(void)
>  {
> -	asm volatile("msr tpidr_el1, %0"
> -			:: "r" (per_cpu_offset(0)) : "memory");
> +	u64 ovf_sp = (u64)raw_cpu_ptr(overflow_stack) + OVERFLOW_STACK_SIZE;
> +
> +	asm volatile(
> +	"	msr	tpidr_el1, %1\n"
> +	"	add	%0, %0, %1\n"
> +	"	msr	sp_el0, %0" /* Update the overflow stack pointer */
> +	: "+r" (ovf_sp)
> +	: "r" (per_cpu_offset(0))
> +	: "memory");

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  void __init smp_prepare_boot_cpu(void)

-- 
Best regards,
Jinjie

