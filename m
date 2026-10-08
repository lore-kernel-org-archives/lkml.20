Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDD13BE165
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447253; cv=none; b=KV9fKhmqU32BTrJSeuKXiQLarQRjtmSbKcscgVNXcgznCfXUz4xwmCWLwz/kQ4+XleAbndCZn1P0C7RhpKQDLKLBDoohXI7qqoXpuqqr0D00YhnyMog5kT23nlsmcz2+P1KI91T8lX5O2ocJkArpRU/l9iKPfTT+UEqwCA+B0q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447253; c=relaxed/simple;
	bh=rQbfgCalROVEXr6GY5OP04PSfype6VKKQEHCWTEBwzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YQnlq5TTQaZjJFolEdY6ydN4c2Fh0MjcHfR7O97mxdjO0bzPMu3VmhCjikHj1+W9Awm5M/+uf+OsSzpfBE5nFafJ5c6jE2Mu9hRybmooBbrfP/D8LCNoegbzRh3uzKve3nt2R2pWCF4zsipi9WAmFGozYvNJzyGHl/xjNmKlJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=h5MEJMC6; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="h5MEJMC6"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dSnC/p/+SqebYb5ikYjr8qnUSvI5a0Pua5cHHXDTyjM=;
	b=h5MEJMC62bNhgr2cdgxykONMPR87RFdA9d51LZY+eVjDarwlIXSkjLvHt1hTndjchLwZadqaQ
	qtFg91SNVPRoQSS+WkFLUR7QVS7/j/qiQdEZHnIM042b0XyWttL911syL3OPR1bxHIYG6Fh7Ilc
	2hY4ozAjd0sbHjZ6ZfNk9jA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j0jBX0ggHz1T4Lb;
	Thu,  8 Oct 2026 16:01:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D70AD40591;
	Thu,  8 Oct 2026 16:14:08 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 16:14:08 +0800
Message-ID: <382db58f-a145-4c8c-861a-24907d305a77@huawei.com>
Date: Thu, 8 Oct 2026 16:14:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: percpu: Annotate __kern_my_cpu_offset()
 as '__always_inline'
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-12-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-12-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:13, Will Deacon 写道:
> Allow the use of per-cpu variables from noinstr functions by marking
> __kern_my_cpu_offset() as '__always_inline'. This will later be relied
> upon to detect stack overflow of the overflow stack from noinstr C code.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/percpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 3dc7291b16e9..cb9ae8a1ae87 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -21,7 +21,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
>  	return read_sysreg(tpidr_el2);
>  }
>  
> -static inline unsigned long __kern_my_cpu_offset(void)
> +static __always_inline unsigned long __kern_my_cpu_offset(void)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  {
>  	unsigned long off;
>  

-- 
Best regards,
Jinjie

