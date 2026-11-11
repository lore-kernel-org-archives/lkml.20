Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422542;
	b=MkUNtyc5UBGYarJlUDN1JJ9LiqAhSOMzrIDrwYHYMEYTu/x9t2GEFO95Hkq+1+I+8kiy
	 OJ/Op5MFrn31bzwW7sL7PkAoFT7kVZUFxhQGdkf0jbhwv6PkzyeWyBRJUjQrFdlpZpTNM
	 C2/EZNuJqHCsnULbPV2Q9Z943YsRq47FK1lzIRw09tdmxgbPe6arYhpY4DpUsEo6BCVY2
	 N8UeDqXWbbTUrPMX5bhxHPlaooadORBPQjXYmA3XvIfUvsC/3rxd5KLMOGLsbFUGhvnqs
	 /UcHCpIUeXYN0Z7LbFyjEaijQn5XCY5kupmX7N05oq9dM6eURmWU6jNHFVZd2yErbjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422542;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mUIueBQWdG7pJzf/AIIsJaKYrYTOdf4kpQUNtr0Ctak=;
	b=KjUiItl58gsBzUayku9BrtYeYOE2rScXs3wT1d/rml6TaU/gZAfhV9+Fg+ooAvGBCyVm
	 djFaaaO4KeftBQBH0GoC5uOwaeYpTXZRjMO2DKJ7i5I50OvQGDjUO/xbSVFWYC0+e/RQU
	 ES4pF+FbqLMN+8uvNIvfssUMeiwz2kU7ZlVqxWZDVDVgzCzivFLS7e5qRZPs8zcq60ocZ
	 3ZAL2rARJVZTHHPBN+Dtw7ro/5CCxhKIBIyeCYRmrNBNIv6xZBmjF4ZmKuE9vhkNfzy3m
	 Hn8bOq9kSPqEv5FfN26WR5tyisl5g9OxWHNc+XOB/RczA75ZXis1+/qmH3I44FAsg/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aBlL16gt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2045A606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2045A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aBlL16gt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2E8153B;
	Wed, 11 Nov 2026 10:42:18 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C57E3F85F;
	Wed, 11 Nov 2026 10:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794422541; bh=+mXScRaTXiM2JFuJLfW5CL1mReoljQvn/EcyyVOmAYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBlL16gt5uh1o8l6C0BKBc71miXOSdAOR5araA6h//LNtXWaweZ9nb+yFW3Y/Znri
	 BKTLFvrYLWEfgvN9VoFEkPVRtzVRbEBPxAwyfG9rnKC9hVIXvecn4+U+8r8yeP/O9M
	 ouE1nJET/PIJtD/8LvxwlQzgH+gGUq1kZu72bwPI=
Date: Wed, 11 Nov 2026 19:42:16 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
Message-ID: <avS3CJI82z3xDQQT@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <1493f335-a808-471f-932a-393aaa390d25@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493f335-a808-471f-932a-393aaa390d25@arm.com>

On Wed, Nov 11, 2026 at 02:08:11PM +0000, Christian Loehle wrote:
> On 11/11/26 12:39, Beata Michalska wrote:
> > With the FFH support for CPPC, the AMU feedback counters, core and const
> > counter, are being sampled to measure CPU performance. Checking for errata
> > (which can affect both counters) between the reads delays the second
> > sample and can skew the result.
> > 
> > Take both samples in succession, then discard values from affected
> > counters. This narrows the sampling interval used for CPPC feedback.
> > 
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
> >  1 file changed, 49 insertions(+), 27 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index 66ac67bd025e..c968fa5b0c88 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
> >  	CPC_FFH_CTR_CONST = 0x1,
> >  };
> >  
> > -static void cpu_read_corecnt(void *val)
> > +static inline void cpu_read_corecnt(void *val)
> >  {
> > -	/*
> > -	 * A value of 0 can be returned if the current CPU does not support AMUs
> > -	 * or if the counter is disabled for this CPU. A return value of 0 at
> > -	 * counter read is properly handled as an error case by the users of the
> > -	 * counter.
> > -	 */
> > -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
> > -		0UL : read_corecnt();
> > +	*(u64 *)val = read_corecnt();
> >  }
> >  
> > -static void cpu_read_constcnt(void *val)
> > +static void cpu_try_read_corecnt(void *val)
> >  {
> > -	/*
> > -	 * Return 0 if the current CPU is affected by a HW erratum.
> > -	 * A value of 0 is also returned if the current CPU does not
> > -	 * support AMUs or if the counter is disabled. A return
> > -	 * value of 0 at counter read is properly handled as an error
> > -	 * case by the users of the counter.
> 
> Since you're moving this comment around, AFAICT it's not actually true?
> cpu_has_amu_feat() is checked (which will return -EOPNOTSUPP) before
> landing here, right?
>
Not entirely, no.
`cpu_has_amu_feat()` verifies the support for AMUs, the extension itself
(ID_AA64PFR0_EL1). Workarounds are applied on top of it.

---
BR
Beata
> 
> > -	 */
> > -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
> > -		      0UL : read_constcnt();
> > +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
> > +		cpu_read_corecnt(val);
> > +	} else {
> > +		/*
> > +		 * A value of 0 can be returned if the current CPU does not support AMUs
> > +		 * or if the counter is disabled for this CPU. A return value of 0 at
> > +		 * counter read is properly handled as an error case by the users of the
> > +		 * counter.
> > +		 */
> > +		*(u64 *)val = 0UL;
> > +	}
> > +}
> > +
> > +static inline void cpu_read_constcnt(void *val)
> > +{
> > +	*(u64 *)val = read_constcnt();
> > +}
> > +
> > +static void cpu_try_read_constcnt(void *val)
> > +{
> > +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
> > +		cpu_read_constcnt(val);
> > +	} else {
> > +		/*
> > +		 * Return 0 if the current CPU is affected by a HW erratum.
> > +		 * A value of 0 is also returned if the current CPU does not
> > +		 * support AMUs or if the counter is disabled. A return
> > +		 * value of 0 at counter read is properly handled as an error
> > +		 * case by the users of the counter.
> > +		 */
> > +		*(u64 *)val = 0UL;
> > +	}
> >  }
> >  
> >  static inline
> > @@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
> >  {
> >  	struct amu_ffh_ctrs *ctrs = val;
> >  
> > +	cpu_read_corecnt(&ctrs->corecnt);
> > +	cpu_read_constcnt(&ctrs->constcnt);
> > +
> >  	/*
> > -	 * cpu_read_constcnt() incurs slight latency due to the
> > -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> > -	 * Read it first to minimize the sampling skew between the const
> > -	 * and core counters.
> > +	 * Return 0 if the current CPU is affected by a HW erratum.
> > +	 * A value of 0 is also returned if the current CPU does not
> > +	 * support AMUs or if the counter is disabled. A return
> > +	 * value of 0 at counter read is properly handled as an error
> > +	 * case by the users of the counter.
> >  	 */
> > -	cpu_read_constcnt(&ctrs->constcnt);
> > -	cpu_read_corecnt(&ctrs->corecnt);
> > +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
> > +		ctrs->corecnt = 0UL;
> > +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
> > +		ctrs->constcnt = 0UL;
> >  }
> >  
> >  static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
> > @@ -543,10 +565,10 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> >  
> >  	switch ((u64)reg->address) {
> >  	case CPC_FFH_CTR_CORE:
> > -		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
> > +		ret = counters_read_on_cpu(cpu, cpu_try_read_corecnt, val);
> >  		break;
> >  	case CPC_FFH_CTR_CONST:
> > -		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
> > +		ret = counters_read_on_cpu(cpu, cpu_try_read_constcnt, val);
> >  		break;
> >  	}
> >  
> 
