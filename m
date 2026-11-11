Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406094;
	b=FlZLdlyg1cwYzPZhky7SzRXmYPqo5Ud4okOVr3qBVLB2A83kdOC2on+4B1YhFiPieEvZ
	 aPs9qr+jmV76OXfFxw9gNiTfx7aPaZw+VrR2uFTfhc4PGZn1dRaTf5GkNUqHgxVv21gLw
	 uHy5zuBsdpBdiL1/mHVgAZ+dq16s1RpYAo2WzujD8Q/zdWApBzn3d57ec10e5S2bsjUa/
	 5/X+6GBMZrTLUf92Dby8HsCwLhL0AiCMASpOecGyV95rUcljxlTUQmWVTCHttb815cItH
	 YvLGIpkadXiCZzjq7j0263oxtDKvoXmKEET3UBltP9qNIQIQyQqk0bqeybCqQuOD5ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406094;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+rsMwMVyOLGNo3mI0iUlcnObZ7s4LgOaX2JTHJr/1QA=;
	b=a2FsXpl7GRztfa4/ZDZ48Ir9Xt3rbBpf8D/2nlgix414+4z/WGrD8+G4VOyJo/ssZupE
	 b0XBehWF7+pImxKUfamRJlQikUNhl8X4fNUhsEGyrlX2ZJTBsxAoPyWU1yMIIlJiYxGoL
	 qAMnU9ECohCLIal8TM5ykqw8rWj0GL4FKq2QBBQK1DlFmXWRJLCaeoLfAOLFwyXPsG2hX
	 /KnF3feyRtgffVFIFS9ii0b1LLlQYtN/eHnuHQwv7HKTEWoQFB1Bj7vnWHsC8psBGoZoe
	 PrKr7oc3p+b4cz8CMcFqnj7kbQ6BJ4g9UfxyItOcJBm9x+a9GrUF4uRvC3LmNA+r30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GISsFkVV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2D5606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GISsFkVV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770891576;
	Wed, 11 Nov 2026 06:08:10 -0800 (PST)
Received: from [10.0.130.226] (e127648.arm.com [10.0.130.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F1EA3F632;
	Wed, 11 Nov 2026 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406093; bh=Zqu0jHu48SUjXqq0o2yDG9G1aHk1Ftd7CRiav7yRk/A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GISsFkVVYJh9GnhjSfKKWxlW19wBTFHlnQvyDQIcXhLEewv1f6A7s0aEiq0KwU2Au
	 TdnWYA9hzVa8B16VqqkCdrcnpommcz53nb1UsTnWfi7GZ46Ayk7hpaQJehtVnw+0bB
	 A9P3I9HyI9hPFoHJnYVBeqPAYCJUQ/RELn/qgxZE=
Message-ID: <1493f335-a808-471f-932a-393aaa390d25@arm.com>
Date: Wed, 11 Nov 2026 14:08:11 +0000
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

Since you're moving this comment around, AFAICT it's not actually true?
cpu_has_amu_feat() is checked (which will return -EOPNOTSUPP) before
landing here, right?


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

