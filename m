Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422333;
	b=QpwwirI9NWw59yMVAVWRxBDlArlur9yOEdLLlsfWjQBGC23MUfnZfvQSy7VCOxyzGd0R
	 2KEEAAeNrRrB8Bo8KUZ/WTem/+Unmdj+ZISsYCRpqVJJx8mak/XWLypCR9+44FtMkP81d
	 d3FzrrdfHTZyaB9BAETRNbpVEbaGIS0DnxpLBjOiSXyXMLcdlsh0pDN1HhsGeZ7y/LhDH
	 2xI+k+86FpaL0E8l4gqte82yp9ag6yCVLTXTKUiAsPYfiiPTKmJRwHD368hAlitGOAMaB
	 +NvRmB/LPIJ2e8f1TqnBJZ4q/RagdevDuYuLpoLqFQQtjv3n3hmWkZRd2hUINzauV6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422333;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JzJkj9wk5hVZMLbPumFq67x0VNnc2cDGyQHbGbUc/Ig=;
	b=eegsBmfOpAomdkA0NY3xXGcpotJMPZG97B3DLcogzpbT/flRkPB+WzaVerpl8vYrH2wm
	 s8tk09wuqn3s1wNWrKJ8Ytmllou1+3b63kxHMBX+ZjcTcKYTmHqTrhb2X6Ui5jj2k8pUf
	 DV32w2N2K7gT1ZlPhwQPcrVOh5S+cMawRDV/Wi+Q7kqC4kTQ2GETfDKtN3AektdMoMD+K
	 bruBU1NqCYNBawTLxRj5KcKIegRyXECvOrgrtH9Hr7cbC+PnyPFZVAg4fXOt8FLPfZm1g
	 Cxiieh/boMUyvLXL0W7lJ56xB7wCQp4OkVm8hiaRUzGqLdUejb3APNHnSncRGEq5JRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HRI8N6aK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7DD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HRI8N6aK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5411576;
	Wed, 11 Nov 2026 10:38:48 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A09B93F85F;
	Wed, 11 Nov 2026 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794422331; bh=EtvO+7JBVelwwvKmyuQQ0VL1HGZ1zvVNE+scTBzF2L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRI8N6aKFh4+N5ZlvjgMY5u44/w7jY7OmjE0gN76Prv6nqzuExdlgiqhfk0UomWSm
	 cK2c2/M0OuMTykhw6x6G9nviDEn71NBxYcmps9z+D1u+ayNTlKymXS7lUHs5ca0PhL
	 YkfpRsalXmTdgBPDT21+BxGgZaUwGs+IlhduS/88=
Date: Wed, 11 Nov 2026 19:38:26 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
Message-ID: <avS2In7pb6A2XJaT@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com>
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
In-Reply-To: <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com>

Hi Christian,
On Wed, Nov 11, 2026 at 01:56:49PM +0000, Christian Loehle wrote:
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
> 
> Why do we read them first then on 
> ARM64_WORKAROUND_BROKEN_AMU_CORECNT or ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> respectively?
>
That's what this patch is all about - isn't it ?
It allows direct read of both counters (those being read first),
and only once that's done, it verifies whether the workaround should be applied
or not. For cores that do not have either it eliminates the check between
reading the counters.
Or you had smth else in mind I did not quite manage to grasp ?

---
BR
Beata
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
