Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405414;
	b=JAmLn9/oQgonCzgkoqar8xFyzq40h6j0rvjZ4CAXosrP7GH/yqJlleDW8tipJdJi4MjY
	 WBTy8uZHN7RF/QbU9Z94lOlsJWbEJi25k9iKpmt4W39iX7EMj0dK9yk7T9HIIZq5IRqF3
	 rQ+i4V+5TgDzjv7+V2+ayglcynIra+Rp3Twmyc5q2yn+m9yZmitgT1VNeR40nsvoWeoAI
	 GFhp/GhE++xO1k3B6p33vTEbHHWdkiuOu64ZInjobx4TA4OtdnpbO74U8ygpaz+BU4Eva
	 1ffh/Pfuqppu9P/XyL8ANp2I5mrMzUHlNnNK9X1kD9QpdNE4e8Y3KaRiXYPdVzQqKFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405414;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r6pLTgFd8oItjnu3lynKGJejvkGial6lZLOh86HxVAQ=;
	b=KZ0t520PtiUVAol2stmd0jc7BWCTujOaf5q3EMaShfmeOGpi6UUY4e+jUFJVPZrUh1al
	 IRMkAi3itSF1OBIUZrx7ww5lKTry1/33haW1ZzVhywl8t8K1+3YiCrV/QfG76Fy0ubpfa
	 F+EGzm2hnnF5Jbonni0HpOyAeDXIytgMOd8LIe35e4hoCASjIQ6zAJU2veUiAcUeLWBrS
	 B01MgPpwdParGPxf80oLealSXzMlcVQioG9eN1hps6p2h+18AxgBowqTgIPX8FceZZCzm
	 RIbbUoachnFKjyFtYywC9gZKOP8AK91M90ZSOCSGxgnfMh7cuRCwSldSEoDLr8oPFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vkD8spSm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CA7606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CA7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vkD8spSm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F90D2F;
	Wed, 11 Nov 2026 05:56:50 -0800 (PST)
Received: from [10.0.130.226] (e127648.arm.com [10.0.130.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 509613F673;
	Wed, 11 Nov 2026 05:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794405413; bh=u/LGPrv/k6PTGiWhdZQ+jym/BFJyfT3LpJBoDuv93Ng=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vkD8spSmFx39shOqIqqJAejbtjz9KaoNs3/Wn/eGTlw5XGP5Hs96Up8gMK/KtGO7E
	 90kN1DLrFfBeTq5Auxs1k9d87C+kQTElRIT9e6pQiMn2eAEYOfgM60lQFCfGB2hlH8
	 skd/1uMMdD8m1GOwwdTnThcSWHOfoPLEhnTPL0LE=
Message-ID: <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com>
Date: Wed, 11 Nov 2026 13:56:49 +0000
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
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com, catalin.marinas@arm.com, will@kernel.org,
 suzuki.poulose@arm.com, xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261111124005.2688820-4-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 12:39, Beata Michalska wrote:
> With the FFH support for CPPC, the AMU feedback counters, core and const
> counter, are being sampled to measure CPU performance. Checking for errata
> (which can affect both counters) between the reads delays the second
> sample and can skew the result.
> 
> Take both samples in succession, then discard values from affected
> counters. This narrows the sampling interval used for CPPC feedback.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 66ac67bd025e..c968fa5b0c88 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
>  	CPC_FFH_CTR_CONST = 0x1,
>  };
>  
> -static void cpu_read_corecnt(void *val)
> +static inline void cpu_read_corecnt(void *val)
>  {
> -	/*
> -	 * A value of 0 can be returned if the current CPU does not support AMUs
> -	 * or if the counter is disabled for this CPU. A return value of 0 at
> -	 * counter read is properly handled as an error case by the users of the
> -	 * counter.
> -	 */
> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
> -		0UL : read_corecnt();
> +	*(u64 *)val = read_corecnt();
>  }
>  
> -static void cpu_read_constcnt(void *val)
> +static void cpu_try_read_corecnt(void *val)
>  {
> -	/*
> -	 * Return 0 if the current CPU is affected by a HW erratum.
> -	 * A value of 0 is also returned if the current CPU does not
> -	 * support AMUs or if the counter is disabled. A return
> -	 * value of 0 at counter read is properly handled as an error
> -	 * case by the users of the counter.
> -	 */
> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
> -		      0UL : read_constcnt();
> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
> +		cpu_read_corecnt(val);
> +	} else {
> +		/*
> +		 * A value of 0 can be returned if the current CPU does not support AMUs
> +		 * or if the counter is disabled for this CPU. A return value of 0 at
> +		 * counter read is properly handled as an error case by the users of the
> +		 * counter.
> +		 */
> +		*(u64 *)val = 0UL;
> +	}
> +}
> +
> +static inline void cpu_read_constcnt(void *val)
> +{
> +	*(u64 *)val = read_constcnt();
> +}
> +
> +static void cpu_try_read_constcnt(void *val)
> +{
> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
> +		cpu_read_constcnt(val);
> +	} else {
> +		/*
> +		 * Return 0 if the current CPU is affected by a HW erratum.
> +		 * A value of 0 is also returned if the current CPU does not
> +		 * support AMUs or if the counter is disabled. A return
> +		 * value of 0 at counter read is properly handled as an error
> +		 * case by the users of the counter.
> +		 */
> +		*(u64 *)val = 0UL;
> +	}
>  }
>  
>  static inline
> @@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
>  {
>  	struct amu_ffh_ctrs *ctrs = val;
>  
> +	cpu_read_corecnt(&ctrs->corecnt);
> +	cpu_read_constcnt(&ctrs->constcnt);
> +
>  	/*
> -	 * cpu_read_constcnt() incurs slight latency due to the
> -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> -	 * Read it first to minimize the sampling skew between the const
> -	 * and core counters.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * A value of 0 is also returned if the current CPU does not
> +	 * support AMUs or if the counter is disabled. A return
> +	 * value of 0 at counter read is properly handled as an error
> +	 * case by the users of the counter.

Why do we read them first then on 
ARM64_WORKAROUND_BROKEN_AMU_CORECNT or ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
respectively?

>  	 */
> -	cpu_read_constcnt(&ctrs->constcnt);
> -	cpu_read_corecnt(&ctrs->corecnt);
> +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
> +		ctrs->corecnt = 0UL;
> +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
> +		ctrs->constcnt = 0UL;
>  }
>  
>  static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
> @@ -543,10 +565,10 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
>  
>  	switch ((u64)reg->address) {
>  	case CPC_FFH_CTR_CORE:
> -		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
> +		ret = counters_read_on_cpu(cpu, cpu_try_read_corecnt, val);
>  		break;
>  	case CPC_FFH_CTR_CONST:
> -		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
> +		ret = counters_read_on_cpu(cpu, cpu_try_read_constcnt, val);
>  		break;
>  	}
>  

