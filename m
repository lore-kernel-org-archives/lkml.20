Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788383;
	b=pDmQ1TSQ6V8NEBrNqg+pJrTMxCrCyFQ2MMzX80GwhPUtslYDDiBooliOyTTRzL78ooxc
	 SK9hYEGMUcUPEGpJpXRibbvDLlNPiQ+KxOgGBRW6UQc1Gh7oyknruejFFUYAD+QUM5Ia9
	 ba5NBCOYCDJAytWI07Ms1xrCregOJ1ozBSUUH8swCrQomoWIUH2+3/N9NiKxvJWCWEB3Z
	 9DOl66XX3yudVRO6CnY+5CNRILokPqS2Axkk1ZCFkfMvysVfPPrJx0ig/lDQCcG/9w72h
	 jp7Cp8VXCh/3S6E7ffaLVU8kTBF3T3ce2rxnsggPzr+Y6bkNw/JnQnvX9Qd9ilY2tcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788383;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1Iv1WntciehPvxwu4Si0O6dND9HQk4iqVMScK44DvpY=;
	b=TvrT3c2ddzeLdHMWw1CLwrIIzKs2YdbF7UnJuTtPrGD3+wTCUOmZX65XAa2WBFL5mIij
	 4f88xZ373U/SXNUJqtq32TPLYFrpYHy3R1qNrHwi9Mc9n36wIoSm5sByamHor1Lt5ifrF
	 cAxLuxCTfXjgjrjluh2pMhKziP2Gt/EdnzveWCUwvXceAfr3wWVQk7ke8vr61U23/Avmn
	 bDPcp08NcMkvlOZt/nFUesuxPSKVuYtLfUA1+fhacZx5fvHUUM+oaMwUf/Kj4BfZm4uXX
	 PhmUeKWh2fH0QxAfTEhcSWhuqaYL6JuFYRyT+vMyGbjJS7oIkis8KRoQYMXsbngP7Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=huvCLGAS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BBA606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BBA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=huvCLGAS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 199121650;
	Wed,  4 Nov 2026 02:32:58 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20CC13F628;
	Wed,  4 Nov 2026 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793788381; bh=ae7gcM+IMAdW9ErHPxtXtAVPHeIA7G36McPY8luPyTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=huvCLGASz1/wFbLPEMvJ9QNdH71xRG33Lth5bIXHLQ1/R5Or00zHId/QeEsd+HAUD
	 I4L0EyPxdW9YApzR621up9xFUiQirHDjEfmbothS3Q0/nd/TD4esY8pL+0n4OnR0TY
	 UDijcjSDFMdxQTtzg+WQFMV9LMZOovbG3dgbAook=
Message-ID: <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com>
Date: Wed, 4 Nov 2026 10:32:58 +0000
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
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
To: Thorsten Blum <blum@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104083632.65715-2-blum@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261104083632.65715-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 04/11/2026 08:36, Thorsten Blum wrote:
> acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
> redundant check and the manual assignment.

This doesn't seem to be the case when CONFIG_ACPI_PPTT is not defined. Can the dummy implementation
in include/linux/cacheinfo.h be called from init_cache_level()? For the implementation in
drivers/acpi/pptt.c levels is documented as "Number of levels if success." and so would be good to
mention what happens in the error case if it needs to be relied on.

Thanks,

Ben

> 
> Use unsigned int for fw_level to match the expected type, and remove the
> now-unused local ret variable.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/cacheinfo.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> index 309942b06c5b..881131fb4934 100644
> --- a/arch/arm64/kernel/cacheinfo.c
> +++ b/arch/arm64/kernel/cacheinfo.c
> @@ -67,19 +67,15 @@ int early_cache_level(unsigned int cpu)
>  
>  int init_cache_level(unsigned int cpu)
>  {
> -	unsigned int level, leaves;
> -	int fw_level, ret;
> +	unsigned int level, leaves, fw_level;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  
>  	detect_cache_level(&level, &leaves);
>  
> -	if (acpi_disabled) {
> +	if (acpi_disabled)
>  		fw_level = of_find_last_cache_level(cpu);
> -	} else {
> -		ret = acpi_get_cache_info(cpu, &fw_level, NULL);
> -		if (ret < 0)
> -			fw_level = 0;
> -	}
> +	else
> +		acpi_get_cache_info(cpu, &fw_level, NULL);
>  
>  	if (level < fw_level) {
>  		/*
> 

