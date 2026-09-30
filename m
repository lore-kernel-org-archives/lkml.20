Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E1C4DDB35
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774809; cv=none; b=ZcCPz61P4B4pBRaqcs7U3OOLqoNydiCBA9N0oEngm3fERrxdVKf7nybIsDVL5OqF6TavBSFEFLHXtRBXk2kivgUk9HbJZ7WbW58hM4wXxMqaWQumq0QxjjeaCb1Wa6NMpcIa7LaAxmrFG43RWvu3LjZDLQV7YpUhmXwKdE//A70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774809; c=relaxed/simple;
	bh=jOzgBdhPeTgAHBFmxVaUTVh0Pw8AwcpmkXk9Dlz9uj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6tNZ5HW4AC0ZKLy8+9SFJkxy4Z6a2Fdhdlu1Fy8UyssoFWnujNDiDfBV1QfrNV+EQ/pCOToBuSrlyR0ZP585qK2eBSS8GK9mmRcRS1KdQWHTBzhBd205cpkcRZUwZkrz49riwG8j7PJGXhupKHQuC0QiGXjfpYxW1/2dwSiis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rKYA4oXf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rKYA4oXf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C200497;
	Wed, 30 Sep 2026 06:26:41 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ED9F3F86F;
	Wed, 30 Sep 2026 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790774804; bh=jOzgBdhPeTgAHBFmxVaUTVh0Pw8AwcpmkXk9Dlz9uj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKYA4oXfJO30dauS8hXJ9DDA1+z4aIOlQDRCd3kgAG4tQBlFVhAYxaBLKERiRpiQ4
	 TZQ5jeL6b5XbVyEOYCjv8L2ZtVf4OpgUM870cfIFTB/ZGidMzRqU81l6OgHkIu2sRb
	 iKrytLZCLUSU6Bka+aM8+wdbs3mTa/V3N3li93sQ=
Date: Wed, 30 Sep 2026 18:56:41 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <mzmgyzxbha7fcrmbwscu5wbuge2iuhe76czp25guh3hg7cntkh@zrsuzosmzuiy>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>

On Wed, Sep 30, 2026 at 01:12:12PM +0100, Fuad Tabba wrote:
> On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> which are RES0 there. The macro only checks that PMUVer is at least
> PMUv3p9, and 0b1111 passes.

Just curious - has this caused any real world problem on IMP defined PMUs ?

> 
> Exclude 0b1111 before the compare, as __init_el2_debug does.
> 
> Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/el2_setup.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 87560d8b254e6..1da277baacf78 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -421,8 +421,9 @@
>  	mov	x2, xzr
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
> -	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> -	b.lt	.Lskip_pmuv3p9_\@
> +	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
> +	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
> +	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
>  
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
> 
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> -- 
> 2.39.5
> 
