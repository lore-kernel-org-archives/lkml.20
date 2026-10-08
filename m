Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D23EC830
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447159; cv=none; b=aulChHVzp7RE5w2gXHUDk7CWw5Eqpw/2U9ypA983ZLHRJw3lUUFNKRWCdKzdt+8W0c0VxxaQZw0QTSmET4q9B0AIQyYOHTvW5X2QF38uW2iOulyR0cTbnSq9HxkOspTn8sDgY+4QgDNfiy+5zb4dsc6wLdwRh+Z44tkj7u8LioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447159; c=relaxed/simple;
	bh=niQ+/qy75dHnLZd2nYzhxgjuKUUIs7nhkwQtX9TGYBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K4kMNuaOyNtyVkJnYfeG9svDLQ2F6jiME4UJKgg+dg0QCIy2q/hlHHm8zJ1aMNiZZ4Zp6zpYEACxVPUr3of1XceLu2Sz2PzeK9sDUlzG/rmV6fQo8cnKuaPOT55OfTn1LXAzSHEneUkPmZCw7hbnSptghAvxOADEMXJIeQJjzOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xCpcy42S; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xCpcy42S"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=q86C4+wQJqBq95W/ZrCF57RUMIh12mIvymieYtRqSKQ=;
	b=xCpcy42SMFyqW7jHMGgAWk06lsLb/UlmWRgB+83TmvKYhzr4SdacsZzbKANEUKz0fzyvs5oio
	Xo3zYe3f7oHQ0q34P2OjFQ4JBdls2XsZdH6ScQgWrTVhoa/0rYbAOu5Nr9E2cHMgdsa19IB3lYh
	dqUDAB8djimDU0sjgT9Ejyw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4j0j8z0XDDznTbJ;
	Thu,  8 Oct 2026 16:00:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D3D3F40578;
	Thu,  8 Oct 2026 16:12:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 16:12:30 +0800
Message-ID: <aefc8c70-9423-446f-9e07-163c975cc00b@huawei.com>
Date: Thu, 8 Oct 2026 16:12:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm64: percpu: Specialise set_my_cpu_offset()
 for the primary CPU
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-11-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-11-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> set_my_cpu_offset() is only called from smp_prepare_boot_cpu() which
> runs once on the primary CPU and before alternatives have been applied.
> 
> Rework the function so that it operates only on the boot CPU offset,
> drop the unused alternative code sequence and internalise it into smp.c
> alongside its only caller.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/percpu.h | 8 --------
>  arch/arm64/kernel/smp.c         | 8 +++++++-
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index b57b2bb00967..3dc7291b16e9 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -12,14 +12,6 @@
>  #include <asm/stack_pointer.h>
>  #include <asm/sysreg.h>
>  
> -static inline void set_my_cpu_offset(unsigned long off)
> -{
> -	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
> -				 "msr tpidr_el2, %0",
> -				 ARM64_HAS_VIRT_HOST_EXTN)
> -			:: "r" (off) : "memory");
> -}
> -
>  static inline unsigned long __hyp_my_cpu_offset(void)
>  {
>  	/*
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a11..702dee8d0db5 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -446,6 +446,12 @@ void __init smp_cpus_done(unsigned int max_cpus)
>  	mark_linear_text_alias_ro();
>  }
>  
> +static void __init set_boot_cpu_offset(void)
> +{
> +	asm volatile("msr tpidr_el1, %0"
> +			:: "r" (per_cpu_offset(0)) : "memory");
> +}

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
>  void __init smp_prepare_boot_cpu(void)
>  {
>  	/*
> @@ -453,7 +459,7 @@ void __init smp_prepare_boot_cpu(void)
>  	 * setup_per_cpu_areas(), and CPU0's boot time per-cpu area will be
>  	 * freed shortly, so we must move over to the runtime per-cpu area.
>  	 */
> -	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
> +	set_boot_cpu_offset();
>  
>  	cpuinfo_store_boot_cpu();
>  	setup_boot_cpu_features();

-- 
Best regards,
Jinjie

