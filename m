Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A9E46AED3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542277; cv=none; b=HxkCJnGJn5yFfP/gmLZ/ZWu3iVHDX+u1CJmDleV2GjDtiyaVVkPJiVpPGvUQ6APci1LTzaDqemWoqii70PZraCJHtym6yihf4ugkSeWP2HCk+WD2cRL+MdEHf/9eD75/Nnql5oXtzclzeqvpAhUVS5IMsuIvA2j20V0eswY77rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542277; c=relaxed/simple;
	bh=P0YngHHkpFDgj6eBIszFEX3wwImCVB5t7vQvhGgdx5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0ontgu8+0obQ75TesnPsteu7xC5ORYqgldt0PRiQbhpNlrtRXBBopApLgl9B7pNdLcUPyXdMTL0r+SiZz2T+CS3A60iWfg9yZtPXuMwWjXGiv7QImO+uWhy4SjFSocVmBSxgRHVfSGH7/ZE/lroHTM048DotcHRqVKz5n5ckss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GLjhLkKX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GLjhLkKX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6137A1570;
	Fri,  9 Oct 2026 03:37:45 -0700 (PDT)
Received: from [10.0.152.148] (e121487-lin.cambridge.arm.com [10.0.152.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B9F73F66F;
	Fri,  9 Oct 2026 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791542268; bh=P0YngHHkpFDgj6eBIszFEX3wwImCVB5t7vQvhGgdx5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GLjhLkKXIELjuG7JmuuJLI97v3hzk5qGmYuRebJqkBCc6UKPs7S3kgVDZHvptf8o6
	 o7yVoaozrCuy5ffdQTnj2w5BoRh2+BgiTNC2vHaOWtGJnPh3mMR5tipZGTMu+kxjqd
	 wzGXL+5f1hwhkpuTSII5bHSnANQV0W9ooZapKI1U=
Message-ID: <c53b373b-9f70-42f0-affc-6978f0508b87@arm.com>
Date: Fri, 9 Oct 2026 11:37:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
To: Bradley Morgan <brads@mainlining.org>, catalin.marinas@arm.com,
 will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007185512.2.mte-tmp2@mainlining.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261007185512.2.mte-tmp2@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/7/26 18:45, Bradley Morgan wrote:
> mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
> used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
> commit 82868247897b ("arm64: kasan: mte: use a constant kernel
> GCR_EL1 value") swapped that for
> 
>     mov     \tmp, KERNEL_GCR_EL1
> 
> and tmp2 stayed in the declaration and in the one caller, which
> passes x23 for it.
> 
> Drop it, both places.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
> Resending, the first send's body got mangled.
> 
>  arch/arm64/kernel/entry.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index f63049ac32dc..c3106dee61e1 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -171,7 +171,7 @@ alternative_else_nop_endif
>  #endif
>  	.endm
>  
> -	.macro mte_set_kernel_gcr, tmp, tmp2
> +	.macro mte_set_kernel_gcr, tmp
>  #ifdef CONFIG_KASAN_HW_TAGS
>  alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
>  	b	1f
> @@ -258,7 +258,7 @@ alternative_else_nop_endif
>  
>  	apply_ssbd 1, x22, x23
>  
> -	mte_set_kernel_gcr x22, x23
> +	mte_set_kernel_gcr x22
>  
>  	/*
>  	 * Any non-self-synchronizing system register updates required for
> -- 2.53.0
> 

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
