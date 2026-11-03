Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706024;
	b=BUp7pWv62sOXZ9328UJLjLsnzcFyiZbwOZIkrBDABtYTRopQqpzAiJho+2gecPszpqcc
	 ELVlzd2LizSmHvQbeRu4ano7oq0Vra/Sdmmb3s524aXEs1gJeWqdm+32SejvhM/0MlVx0
	 9dtIZVujtizvGH6VvnqRHDrQGkHB5naq5kf3qqXzv4tKe3DOPnIk7T2f+bVdNUeuvkL17
	 TLljaunouHr2TbZHBtdsEmAlJg7gEIFpWzDILsu0XCRrmzB/43uyqGJ60d4wNaYTmN/dx
	 77PJ1HpoXGgY0WlFKyytejJvFcR5uGINTSBA5fzo95WWXTGK77eTdkFV+xQqZWJ07+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=utxuIcSFdiIIVfsjndjc/ld0Uu9VZGyZLJcerN1xmmI=;
	b=Ho35WJej3L11b2BLWf5A/8U2FD4M+3Pj5bOUsGCIojxD2Zt/Ek3ednwsgIFi2Fy/38K3
	 0YMKKn1Da6DgFtr1ey6u4iCY0q8GosI0ZUrtJxn8jNtAr/y6DXNfKcn7XUvBTfUHNgMKH
	 /5ZWLgV3Nulz0isNkhWZBZKKRATmWUjJgXfKWxLvKk/rBcM7EZ2pwBCuvKuEtNWQ+xH9g
	 5N6ytES7P5MdDutSkoZYucSyt1SNdvFLZpqMqhUQvTkOmdstTtP2MP2KKTLNOln7tzbUy
	 RBUFl+yBDN4wDotWkCRBScs1uC8Kgn/0N1rOdRdC1+u0w/c6lJ691eEzUyN8RUJLryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slToOVfu;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30566082BDC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30566082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slToOVfu
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so4261780f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706022; x=1794310822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utxuIcSFdiIIVfsjndjc/ld0Uu9VZGyZLJcerN1xmmI=;
        b=slToOVfu9AxLwUIK47MdPwcsIF6ozJhIssMgKxOBM1lyCOrnJILGKc9mrrxBS1FSRW
         T18gn6F0KKrnPfV7klfJjz8EN8hK1pujWhYYrA8HWkXSjFRVK6EHn6mAlaHD3+v2joe2
         nDric/+6hPAQI0A0cc/3eukWVo9OYRKPd3T8X4mtIXRKfVsz8kUe9yaC88HJO/0VcldE
         jBFqMGEgknAen3Q+juUST5eC/meWkYfh0x/cgc3W3N5aTYQ9GL9Pu+HR8PY5Ba52yfYL
         /iAbxfPegp6ijg1tZjJSN19bmCk/4B+1BIEjJIfr/XUOWuW8cQl2RcOS0KKqpl7/mOKW
         T1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706022; x=1794310822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utxuIcSFdiIIVfsjndjc/ld0Uu9VZGyZLJcerN1xmmI=;
        b=NC+/GWBw0YdUd1PLDYF0tYdG6TvexXmYA4OuilTGse/vZ5aDGDMV9lZ2/2k1cW800o
         wuh+7a1HLwaVVL6jQNPco9siZd3TjbKdSKNSxliSeQPdZKOwN+QTzfRKbvTT4J3NGCuK
         WlKxeyhGJ0gu7iSzgoJfEEXa1hzUA/j4KPs5IqURG8w7ty1xk1yuolKHRSlfOU0QpH05
         GCquhzODunh7sda67OEySS9kgzcuGJR2ypPt4YOUsPQHY8WISkNkQTs4EC7kMarghzu2
         Ef9oS9Yv9SL0dPHsCCnV9FcX7vXbTmAOmkti8Vjc3e2c7iZkNi1vfOW9b0TmIisvOfSN
         DTig==
X-Gm-Message-State: APuU4Z8/yh3ktaFpjAlayyeFU++UAP3TrxCRTuXa16KYfiuv8iAOcyZP
	mpCm6U6ofgLoAdrohEvr7S6rDkvhvDriIG20FqGN9YQ1nB1ygxDdkECq
X-Gm-Gg: AYBFou0my5Gb2PrRcxEaJi/XM2wPjd6bHDUp18xBMdv70U+Qeo7aiI1ZLfntB1tbVm1
	lxYExPsBaynX9CcsE0qjjPAOVNstFI6t3ArpC75ElMlr88qvH18KQDDGKEtBrdQuGLmpEkbDkZC
	a2ggdQkFXocAJL7OfU52ErVCUsCLm5MoI1pfzoecCDhC9nhwzheDtv3tNO2Qk9fdqZiv0eSt3GB
	M7xj9gPFLc4/zNrOsKXrPki+aDS0kZtBgTld3RUNLsgUbmyODA4oxTeP9O1c7PW9qSYtmT/HpW4
	6ECA516KQ9YwRRcPHgZcCt8NViZoTpMvUsD9qgXPsGG6oRiH3fPBDOgp7wbso0o2guaNJO/la8V
	fRXX8M19e4pq49iWXvQCOu2AxoDhqs2T1u6ZI+GWDUcxYr1rzS4Gm8dajt7Yt+MwD6wNCP3JrWW
	Gax/zIkn2TC7zcQ/dQhxVZkLId0Z3xRt2qsGmBKSe8pNOkm733goxf5/Wr6TEuFhI4R6pQ34Lr4
	UBjAkVPnVauAg0IkA68M+KwVlOOwIjDp1gbPWC+jaf0SSaglhIbtHg+DnDqM68gNo8AB7Z3GgcY
	AqU4DjWutwEQoUrcXhF/riI=
X-Received: by 2002:a5d:5c84:0:b0:48f:bcbf:26f2 with SMTP id ffacd0b85a97d-48fbcbf2becmr528573f8f.55.1793706022163;
        Tue, 03 Nov 2026 03:40:22 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm24248670f8f.57.2026.11.03.03.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:40:21 -0800 (PST)
Message-ID: <897b0ea8-d2f4-42e9-ad22-e331c5b085c7@gmail.com>
Date: Tue, 3 Nov 2026 12:40:20 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86: hugetlb: disable default CMA reservations on
 32-bit kernel
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, stable@vger.kernel.org, x86@kernel.org
References: <cover.1793692578.git.zhengqi.arch@bytedance.com>
 <61eee83da19a87337e68a7747fc0b89ee5d0393b.1793692578.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <61eee83da19a87337e68a7747fc0b89ee5d0393b.1793692578.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 9:01 AM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> A 32-bit x86 kernel can run on a 64-bit-capable CPU advertising GBPAGES.

weird. anyway, LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

> arch_hugetlb_cma_order() checks only this feature and returns a nonzero
> order, although gigantic HugeTLB support on x86 requires CONFIG_X86_64.
> Specifying hugetlb_cma= can therefore reserve a CMA area that cannot
> serve the intended gigantic HugeTLB allocations.
> 
> On non-PAE kernels, the folded PUD_SHIFT yields a 4 MiB order, which is
> equal to MAX_PAGE_ORDER. With CONFIG_DEBUG_VM enabled, this triggers the
> VM_WARN_ON(order <= MAX_PAGE_ORDER) check in hugetlb_cma_reserve(),
> warning that hugetlb_cma is attempting to reserve a non-gigantic order.
> 
> Require CONFIG_X86_64 as well as GBPAGES when selecting the default CMA
> order to avoid these ineffective reservations.
> 
> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
> Cc: stable@vger.kernel.org
> Cc: x86@kernel.org
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>  arch/x86/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
> index 3b26621c91286..70726a99ede7b 100644
> --- a/arch/x86/mm/hugetlbpage.c
> +++ b/arch/x86/mm/hugetlbpage.c
> @@ -45,7 +45,7 @@ arch_initcall(gigantic_pages_init);
>  
>  unsigned int __init arch_hugetlb_cma_order(void)
>  {
> -	if (boot_cpu_has(X86_FEATURE_GBPAGES))
> +	if (IS_ENABLED(CONFIG_X86_64) && boot_cpu_has(X86_FEATURE_GBPAGES))
>  		return PUD_SHIFT - PAGE_SHIFT;
>  
>  	return 0;


-- 
cheers,
jose a. p-a
