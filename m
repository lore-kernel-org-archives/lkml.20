Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3E7377ED7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765532; cv=none; b=HFHzsEcdj0q0Dwr8Qdf4JpxYRD187du8KPH1iOlNktzZWSClJ1VVaB1qAF46xrMhTbUaXLziTJl5eRe6vl1nmes1V2GYUowqZBpSsf6QpPe6I1KWDfHeaWcQYcp+SRPmWLwnNtVo0A7+2Y4YR5njaca5jNL0HzaLNUthQGxEWTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765532; c=relaxed/simple;
	bh=NDrPe0JVA9e1duQJ5ZnCGaRKPu1NpH8Lx9yDqDO9kZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9tfErqqcM8GyUPnslcZTbruellnMJBzQHyQPc8CkwubeZ97nSuTb04fhUNH01gwUTbZjF6+1B9gUolr2HFjTWkWuRJ020WT9Mt4+ZydVYE9h1hjew0oTj3HBICDrA5Z3nIKcsUM8fw3o1uFILXvTd1JfPrnKiJZInexhYJYYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3pjvN67; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3pjvN67"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d942c7cc2fso25349925ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788765530; x=1789370330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9wnX7kbNfFv6WjYVBZaTARt9LTYfPVrd/RifhxC10JY=;
        b=T3pjvN67VliMFhvbggjnH1qciB2VydgqPRbcF0Xv1hBnKyAf2mkArYfEyEP9FT9O2W
         F0f22TKT77fezaFh3GPdsdLxOi28zGDSmwl7TvF17YJkGPjNokUvQ9KSG/36Fxkn2HNi
         +byhM1assXEga96IVVLgUkGCPnpxjYGf4w7JOD6CdcDbF2cvgTUkRFkMbTErsvE4dEO6
         1VVgVwM9C4BzbEysSvqA67bmsN/P0sjoRciFRrQ+j4oJz/gSCGqTNLAb6cQ59VuH/nJh
         IlIq3SjsFCfsKUFcioj2BKqchF8i10bc/FkoTqaOIMvHi8XTsibFi4vjb2rk5ZpfpGEi
         7bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765530; x=1789370330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wnX7kbNfFv6WjYVBZaTARt9LTYfPVrd/RifhxC10JY=;
        b=d7eIdrjjoYOtnShwDP2u9SRLcHZoobGVEY4vsYRZw9awtG53gxgPV1ql/Xus/EygUs
         7KCj/omgX9j2czk6xZoCABEnSkKGrOgZ21l+bhyLkqq34ErXygWc5JM9dDrbZvRl6khy
         ZTAyF6GbdtGB32UFkZWBew3uxIyYbe2uscep135yIzeaicwPGY7aKcmISHy/wR4YWVBy
         9qDQUl0j+XvoxIDvbkaKIqNzoyXCeTTYa2dW7Rmz/iF5UwlJ5vjYXxulybuukQpUx20/
         Ue+TzAFy7D2dpJWgRf0ddt4GhomWqjsm+xQ3YYLGtq4gL6+BJPBA02v7p5dFZDI0Jqb/
         Qrxw==
X-Forwarded-Encrypted: i=1; AKwUvBxmW0Qzy+6/ts5tFuJbESwSGjNYcLqWvJhF/KorkJiXKlJSnwDDW6l3Z7XQUc+lMcJUY/C2mMbT0OdZU50=@vger.kernel.org
X-Gm-Message-State: AFuF++njVhrnes0cAdYztay+Vn81yhn5qa9q4ETdofBvBZFbM4bX5zHu
	bfZcMOGsH4orRAYoaeoBApXHNikQbOjrZz1C6tFRduPngKbXPus4Z1n8
X-Gm-Gg: AYBFou2AetuHHsjD8S4LOt6ZO+S0Jr95sdRnd45BFTAFR1qK0dg1247rJ+kx8QJqgPp
	nLYD6u6NTIMqCvJaGHFWUEszhfumH7GAGEpg647Bomq6Qb9dmE9xKQfFEFpxrWZm5sgv0E8q46c
	vPpI+4bVUoOrEq3oVicfZ23blFmWQm9imi8mEzp28Iag5H8qhjkplX0rcAtkT747IeEiwE/+pW5
	yDAiIy19UQfyJ91vCrS96xcojQy96r6Q2eqOq+l25fEHL30p9TNPfefYb6PIJydEf2xbhVpVV8U
	eazC/VD4VnRYc+MmlOpeDa026nzV15pOCKwQYqeT1vKaYiHUmMOKLg5Ai0F3zAnqEZfgUAKVOw3
	106eAPgunL+VKhhxtBv930QiiqtczdoYfSyIT3m8W9H7YzTQPMzBafY0wStCfnnqJV0le53VvJo
	DO72+a6QX/FXhWiTpW0J6AgwDqqFKf7V9KeEyi8PzETrpz1MTZAGPTjCUQRSvNJXB2cpi++ky44
	rX083sV9uBTPL2bsHyTXjQvPWjD9LnLSUYu
X-Received: by 2002:a17:902:e804:b0:2d6:ff5f:eeda with SMTP id d9443c01a7336-2db1256cfa1mr302484215ad.6.1788765530410;
        Mon, 07 Sep 2026 00:18:50 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.49.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm39192535ad.82.2026.09.07.00.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:18:49 -0700 (PDT)
Date: Mon, 7 Sep 2026 12:48:43 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, mkchauras@linux.ibm.com, 
	sshegde@linux.ibm.com, ruanjinjie@huawei.com, ritesh.list@gmail.com, 
	riteshh@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/interrupt: Use early_radix_enabled() in NMI
 real-mode guard
Message-ID: <ap5kv_92TzM-tcBp@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260907070058.26338-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907070058.26338-1-venkat88@linux.ibm.com>

On Mon, Sep 07, 2026 at 12:30:58PM +0530, Venkat Rao Bagalkote wrote:
> radix_enabled() uses a jump label which is only valid after
> mmu_feature_keys_init() is called. Before that point, on a pSeries
> hash guest, early_check_vec5() clears MMU_FTR_TYPE_RADIX in
> cur_cpu_spec->mmu_features but the jump label has not yet been patched,
> so radix_enabled() incorrectly returns true.
> 
> Replace radix_enabled() with early_radix_enabled() which does a plain
> bitmask check against cur_cpu_spec->mmu_features and is correct at all
> times, including before jump label initialization.
> 
> Add the missing #include <asm/mmu.h> since early_radix_enabled() is
> declared there.
> 
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/interrupt.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 1b45a49e9bed..36a654e780f7 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -71,6 +71,7 @@
>  
>  #include <asm/kprobes.h>
>  #include <asm/runlatch.h>
> +#include <asm/mmu.h>
I would prefer this to be in alphabetical order.
>  
>  #ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
>  /*
> @@ -290,7 +291,7 @@ interrupt_handler long func(struct pt_regs *regs)			\
>  		state = irqentry_nmi_enter(regs);			\
>  	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&			\
>  		   firmware_has_feature(FW_FEATURE_LPAR) &&		\
> -		   !radix_enabled()) {					\
> +		   !early_radix_enabled()) {				\
>  		/* no nmi_entry for a pseries hash guest		\
>  		 * taking a real mode exception */			\
>  	} else if (IS_ENABLED(CONFIG_KASAN)) {				\
> @@ -307,7 +308,7 @@ interrupt_handler long func(struct pt_regs *regs)			\
>  		irqentry_nmi_exit(regs, state);				\
>  	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&			\
>  		   firmware_has_feature(FW_FEATURE_LPAR) &&		\
> -		   !radix_enabled()) {					\
> +		   !early_radix_enabled()) {				\
>  		/* no nmi_exit for a pseries hash guest			\
>  		 * taking a real mode exception */			\
>  	} else if (IS_ENABLED(CONFIG_KASAN)) {				\
> -- 
> 2.45.2
> 

Rest all looks good.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Regards,
Mukesh
