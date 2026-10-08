Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4D3DD532
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446290; cv=none; b=qPlfSzVscyBm8FJWa8XyW2VjpdIB1rK4PdqyJJ53eRq2Qx240yfghunIcpVSdlrH8ZRx6n+sDXS4XcZQBxmcxgNFVeX1F9rnet45rbk9Dk5slvmhJ18+FH5dSEm+PbCIQXJ4Kk/Aha/QLk+OQLkLAHH5gCWfFwcsg0B5kSW9jaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446290; c=relaxed/simple;
	bh=DM5sfE57k+oBbpxjf4rcXl0KuiRMMelT5rNy3JAZ9Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DKzZr1ONYqCup1d6h+5MRHVBweE7XxqZVhnHZgpn/lp3q5FGQ2HVJf8Q3fdRan7FNBYehc/0zuLDgmDq4kB1JeX5oLs7RfB/c4a8NEIf32CX1nL55xkLPleBjClJ1zfteJAt1r3enY0XumPTA1qC8vNZd+B+q2W5CMho/7tpR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JJ9PrRuN; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="JJ9PrRuN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VV97U+fI+2BU63oSyzjtBz89NKgr2GCnmm8FLfD0RyY=;
	b=JJ9PrRuNTyQACbAsJpgBXsMOj+ibz4H/Bw2cZG2xFX16XmzWjQxGuGI1RhEnJlSSSUlnKLxQg
	VkMRieu4gxl0qYqDMLs0PVbXOHBpIEYS+fr3Jh+nuzm+/yjQsnhmJ77BbGRAF5YtGtnrG+e4t7e
	VJh27x1ulFNNLg1rg3cnDwY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j0hr02Rrcz1T4MQ;
	Thu,  8 Oct 2026 15:45:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C3DE203C1;
	Thu,  8 Oct 2026 15:58:05 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:58:04 +0800
Message-ID: <37913984-3cf0-4bfb-8adf-f87ec65c8b75@huawei.com>
Date: Thu, 8 Oct 2026 15:58:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] arm64: stackprotector: Re-enable per-task
 stackprotector
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-10-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-10-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> Now that 'current' resides in TPIDRRO_EL0, update the per-task
> stackprotector compiler invocation to use the new register.
> 
> Note that this requires a very recent build of clang [1], as (unlike
> GCC), it historically rejected all registers other than SP_EL0.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Link: https://github.com/llvm/llvm-project/pull/188054 [1]
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/Kconfig  | 3 +--
>  arch/arm64/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b8270b301809..020fcaf36b1b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2450,12 +2450,11 @@ config RANDOMIZE_MODULE_REGION_FULL
>  	  exhaustion, modules might be able to fall back to a larger 2GB area.
>  
>  config CC_HAVE_STACKPROTECTOR_SYSREG
> -	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=sp_el0 -mstack-protector-guard-offset=0)
> +	def_bool $(cc-option,-mstack-protector-guard=sysreg -mstack-protector-guard-reg=tpidrro_el0 -mstack-protector-guard-offset=0)
>  
>  config STACKPROTECTOR_PER_TASK
>  	def_bool y
>  	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
> -	depends on BROKEN
>  
>  config UNWIND_PATCH_PAC_INTO_SCS
>  	bool "Enable shadow call stack dynamically using code patching"
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 6b005c8fef70..a293ab67818f 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -72,7 +72,7 @@ ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
>  prepare: stack_protector_prepare
>  stack_protector_prepare: prepare0
>  	$(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg		  \
> -				-mstack-protector-guard-reg=sp_el0	  \
> +				-mstack-protector-guard-reg=tpidrro_el0	  \

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  				-mstack-protector-guard-offset=$(shell	  \
>  			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
>  				$(objtree)/include/generated/asm-offsets.h))

-- 
Best regards,
Jinjie

