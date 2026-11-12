Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485226;
	b=VGXXjniEQCLiT3Qdg/jTAJFrEQYMtC6RyU3xLoTvzzi/k3nDVTkCCs578sd8UM8fBNCB
	 Ywm43XeRElYKiaGJpxFfu5B4Mk/plKW8zF82p8AT4saUUxuBelUlQcaEWWaTj/w4lHomF
	 yelcoPtDEPWP8x1LqldyHLubeaWv7TvpBs1an5nObdy7ub5fHJSSgpC9CPJh+HQVrMyDw
	 gOjluqgWZeumPk7mtD3+KfoUnpfiwP0fhfCAtHRUgqf620Ihjx5Vquz3Istyfthd30hvt
	 4PlN+I4eqRkRZpET/ZsgmRx7UB8IBmyXSjR6iLTGq7oBNzVKbN14WTyHe+Y5MNaUAmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485226;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i1WLpvyK/v+i/pOtJSHSm4Vqyb8jtIS3Jmom1fb7ALI=;
	b=pugFGKBY6ZauA3aEhsw5orziktryqQD3HEu0hhX2ikgWLT7UfIt9Bx7EiOkmnrH2VKiA
	 ojM4B810qTYNibFRnnyAheRFJI6XJH71Lzt4KZ6f8wU881/oDrvBv0ka/EbV0n1+OMZl0
	 ySkgpgh3GT4jMqe5E/qIGLDTffFTUfccIroqDeyWWU2BpXSXA6K2C6F103Jh6Yb15ajBw
	 up5/4V8VZaV0DUaYpFq8LUZQn7f6IvaVaCywcI3MU7AURPIi9PTUzdoIzNMMhj52oLBiO
	 sxNckl9vV1zg3XvAoQtH3CpPfOyiYmG+HUwlqoJWtcWLQIUPtYDdQjEPK9eyG8xKcbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rp3Jtoi1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D38606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D38606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rp3Jtoi1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 631E01477;
	Thu, 12 Nov 2026 04:07:01 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E7253F673;
	Thu, 12 Nov 2026 04:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794485224; bh=+Zq51Kz78ZcESlxGtDuYhCkAPFG6+77j8JOduwbmW/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rp3Jtoi17XVB3tTXx6sYL2M4C9CCBMwX9FQjfS9ahiI2R3Qr5oIEO6wGPdWCQPxMJ
	 GjIuydKL8TVA58sF8F1IqDSZkSWMXwLWoCaw5vNKeqGdWI+VxZILL0DP1xydY6Hhp+
	 pdLqQ2QGmTllL3nFiRBgelr+A6UWIWloG363MBhs=
Date: Thu, 12 Nov 2026 13:06:54 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
Message-ID: <avWr3hEq-XNHuLGs@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <1493f335-a808-471f-932a-393aaa390d25@arm.com>
 <avS3CJI82z3xDQQT@arm.com>
 <10a9170d-9ec7-46be-ad0f-d364c65563cd@arm.com>
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
In-Reply-To: <10a9170d-9ec7-46be-ad0f-d364c65563cd@arm.com>

On Thu, Nov 12, 2026 at 09:22:46AM +0000, Christian Loehle wrote:
> On 11/11/26 18:42, Beata Michalska wrote:
> > On Wed, Nov 11, 2026 at 02:08:11PM +0000, Christian Loehle wrote:
> >> On 11/11/26 12:39, Beata Michalska wrote:
> >>> With the FFH support for CPPC, the AMU feedback counters, core and const
> >>> counter, are being sampled to measure CPU performance. Checking for errata
> >>> (which can affect both counters) between the reads delays the second
> >>> sample and can skew the result.
> >>>
> >>> Take both samples in succession, then discard values from affected
> >>> counters. This narrows the sampling interval used for CPPC feedback.
> >>>
> >>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> >>> ---
> >>>  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
> >>>  1 file changed, 49 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> >>> index 66ac67bd025e..c968fa5b0c88 100644
> >>> --- a/arch/arm64/kernel/topology.c
> >>> +++ b/arch/arm64/kernel/topology.c
> >>> @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
> >>>  	CPC_FFH_CTR_CONST = 0x1,
> >>>  };
> >>>  
> >>> -static void cpu_read_corecnt(void *val)
> >>> +static inline void cpu_read_corecnt(void *val)
> >>>  {
> >>> -	/*
> >>> -	 * A value of 0 can be returned if the current CPU does not support AMUs
> >>> -	 * or if the counter is disabled for this CPU. A return value of 0 at
> >>> -	 * counter read is properly handled as an error case by the users of the
> >>> -	 * counter.
> >>> -	 */
> >>> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
> >>> -		0UL : read_corecnt();
> >>> +	*(u64 *)val = read_corecnt();
> >>>  }
> >>>  
> >>> -static void cpu_read_constcnt(void *val)
> >>> +static void cpu_try_read_corecnt(void *val)
> >>>  {
> >>> -	/*
> >>> -	 * Return 0 if the current CPU is affected by a HW erratum.
> >>> -	 * A value of 0 is also returned if the current CPU does not
> >>> -	 * support AMUs or if the counter is disabled. A return
> >>> -	 * value of 0 at counter read is properly handled as an error
> >>> -	 * case by the users of the counter.
> >>
> >> Since you're moving this comment around, AFAICT it's not actually true?
> >> cpu_has_amu_feat() is checked (which will return -EOPNOTSUPP) before
> >> landing here, right?
> >>
> > Not entirely, no.
> > `cpu_has_amu_feat()` verifies the support for AMUs, the extension itself
> > (ID_AA64PFR0_EL1). Workarounds are applied on top of it.
> 
> Right, I was only referring to:
> "A value of 0 is also returned if the current CPU does not support AMUs[...]"
Ahh, right, this needs to be fixed. Will send v2 with this comment updated.
Thanks.

---
BR
Beata
> 
> > [snip]
> 
