Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C351FF7C5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396279; cv=none; b=gz1bXI/v47hfKJaZ/yhyXt4bxJdtu/Pbu52bky/h7pqSYP66dZl7ZVdC+LXT+WAQWyIIH5kzoZGLaiTD2XXbk2RX97FoEwd2/6HbckUajTnd/w+d7pA0GYhwUCyNoHadVV+kW/yJ4jhPIuI84b5eJT1RTonBzZAcFF6QWdOx35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396279; c=relaxed/simple;
	bh=+q2nRmIMqouBhmKTnCyfcrc5UQsl75n0NRq5NUaBXHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4n+83M/kE/5vlEishaVhvFjHOX0TQe1dKO9YXsMdcADzLPrkcn91aDk5AlO2uM43COS0OzNg8xDLJWx7uVP9kKL/wfuHcv6uWnJCIT/pXHSgzRSuZeOSP8hf64PQY1UYuWqIKFQ2vLI57CEZqUNR8A18oUI8bP3u8W51Q1aQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hMwIqT5c; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hMwIqT5c"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0B9C740E02C2;
	Thu,  3 Sep 2026 00:44:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Puely6-fpXbP; Thu,  3 Sep 2026 00:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788396263; bh=BvTNIxSwVFWHoSIbkK2L5MbPA3hShxFmAoJ2zInYwzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMwIqT5cuCP+oIf0IV/d8+XbLuqd8m4CxFbeSw4zhKkPJbZwzCno9lPvRjQ/agCFY
	 00C8N5o1wE8iNgAmN9+BvSw7/2fXa2efew4Ip/pLc8dn7Z+Zgunu5DDI5id1J0mx76
	 CxQZ+y3G03k1qu8Wh6cRy2e6XYG9+jvpPP1h8OLZP5fBnL9AjZzEEiry0i/fbRjYYF
	 WLUhA9kBglpQDmiRXqdDEzR0kzx0mPO1Wd0u8KkiRSUm4KxkX5+ke9FY3py+zIXMMd
	 972zNMOVtg/V5s3sIE1DQuTIktQ/CS6fF3IHEdcIZr62PyQ2J+O+02PVyeTFfd0C9O
	 0rCJRi9Ossm5sGd8ebH7nehm+oPEVKGZIQghPNUgHetn6luROQgbYD8QRWF5E+a4Is
	 Y2SVcpFbIXXhXMk2n7Vp1AjeJ3pyKsz2KIldf5S7Z8+wDfX6nhP2EtWxoo5D5J078b
	 kE2aafWz/89j+rKuNyum36yY2gzI/2lbRE7o2l/u/cHWL6pN+twj47Kd2iOR76CkZL
	 9gS1WGZaEzV4z/c8oCh4Ppf92jKs3kQL9YGbFaNmAd5fy9LYnTzN30H5S3otCmFPLl
	 ieK+D3BJB9IUnwHWou9GmwUfdMZxs1Ae6SF3Flb0iXEysTfZl7uXLCgrSk5w8xD6yF
	 z7wIcsAHJJdb4P28kzIshRfk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0D61340E027F;
	Thu,  3 Sep 2026 00:44:18 +0000 (UTC)
Date: Wed, 2 Sep 2026 17:44:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v1 2/8] x86/sev: Add support for Alternate Injection
Message-ID: <20260903004415.GLapjC39_OQgXHhS79@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <64561ae475103cbe9743793fd54d083a039a36eb.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64561ae475103cbe9743793fd54d083a039a36eb.1787973545.git.huibo.wang@amd.com>

On Sat, Aug 29, 2026 at 03:39:40AM +0000, Melody Wang wrote:
> The Alternate Injection feature is a method to protect an AMD
> confidential computing guest from malicious injection attacks. It allows

" ... a SNP guest... " - simpler.

> the guest to control the interrupt injection.
> 
> When this feature is enabled, interrupts are injected with the help of
> an agent called a Secure VM Service Module (SVSM) which executes in the
> security realm of the guest and uses Restricted Injection as the sole
> method to receive interrupts from the hypervisor.
> 
> Add support for Alternate Injection enablement.

s/ enablement//

> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/Kconfig                   | 14 ++++++++++++++
>  arch/x86/boot/compressed/sev.c     |  2 +-
>  arch/x86/coco/core.c               |  3 +++
>  arch/x86/coco/sev/core.c           |  2 +-
>  arch/x86/include/asm/cpufeatures.h |  1 +
>  arch/x86/include/asm/msr-index.h   |  4 ++--
>  include/linux/cc_platform.h        |  8 ++++++++
>  7 files changed, 30 insertions(+), 4 deletions(-)

...

> diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
> index 989ca9f72ba3..aabda3ddc0e2 100644
> --- a/arch/x86/coco/core.c
> +++ b/arch/x86/coco/core.c
> @@ -107,6 +107,9 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
>  	case CC_ATTR_SNP_SECURE_AVIC:
>  		return sev_status & MSR_AMD64_SNP_SECURE_AVIC;
>  
> +	case CC_ATTR_SNP_ALTERNATE_INJECTION:
> +		return sev_status & MSR_AMD64_SNP_ALTERNATE_INJ;

Sashiko is complaining here:

| Does this attribute evaluate the host status or the guest status?
| 
| The implementation in amd_cc_platform_has() checks sev_status, which 
| represents the SEV capability of the executing guest. However, the doc comment
| for CC_ATTR_SNP_ALTERNATE_INJECTION below states it checks if "The host kernel
| is running with the necessary features". Could the documentation be updated to
| match the actual implementation?

Because of the comment over CC_ATTR_SNP_ALTERNATE_INJECTION talking about the
host running with the necessary features, blabla. Yeah, sev_status dumps guest
bits and the alternate injection bit is set in the VMSA by the SVSM and so
yeah, maybe we should tone down the "host" speech in the comment...

> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index cc292d7c6fd1..c54269366278 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -78,7 +78,7 @@ static const char * const sev_status_feat_names[] = {
>  	[MSR_AMD64_SNP_VTOM_BIT]		= "vTom",
>  	[MSR_AMD64_SNP_REFLECT_VC_BIT]		= "ReflectVC",
>  	[MSR_AMD64_SNP_RESTRICTED_INJ_BIT]	= "RI",
> -	[MSR_AMD64_SNP_ALT_INJ_BIT]		= "AI",
> +	[MSR_AMD64_SNP_ALTERNATE_INJ_BIT]	= "AI",
>  	[MSR_AMD64_SNP_DEBUG_SWAP_BIT]		= "DebugSwap",
>  	[MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT]	= "NoHostIBS",
>  	[MSR_AMD64_SNP_BTB_ISOLATION_BIT]	= "BTBIsol",
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index f70ee74b5f92..a53e40a3982c 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -466,6 +466,7 @@
>  #define X86_FEATURE_SNP_SECURE_TSC	(19*32+ 8) /* SEV-SNP Secure TSC */
>  #define X86_FEATURE_V_TSC_AUX		(19*32+ 9) /* Virtual TSC_AUX */
>  #define X86_FEATURE_SME_COHERENT	(19*32+10) /* hardware-enforced cache coherency */
> +#define X86_FEATURE_ALTERNATE_INJECTION	(19*32+13) /* SEV Alternate Injection */

Sashiko: Does this new feature addition need to be synchronized with the
kernel tools directory?

Answer: no. We sync those only when needed.

Also, make the comment /* SEV-SNP Alternate ... */

as it is a SNP feature.

>  #define X86_FEATURE_DEBUG_SWAP		(19*32+14) /* "debug_swap" SEV-ES full debug state swap support */
>  #define X86_FEATURE_RMPREAD		(19*32+21) /* RMPREAD instruction */
>  #define X86_FEATURE_SEGMENTED_RMP	(19*32+23) /* Segmented RMP support */
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index 3a8e51a0c9e8..473a3ba86a2d 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -721,8 +721,8 @@
>  #define MSR_AMD64_SNP_REFLECT_VC	BIT_ULL(MSR_AMD64_SNP_REFLECT_VC_BIT)
>  #define MSR_AMD64_SNP_RESTRICTED_INJ_BIT 5
>  #define MSR_AMD64_SNP_RESTRICTED_INJ	BIT_ULL(MSR_AMD64_SNP_RESTRICTED_INJ_BIT)
> -#define MSR_AMD64_SNP_ALT_INJ_BIT	6
> -#define MSR_AMD64_SNP_ALT_INJ		BIT_ULL(MSR_AMD64_SNP_ALT_INJ_BIT)
> +#define MSR_AMD64_SNP_ALTERNATE_INJ_BIT	6
> +#define MSR_AMD64_SNP_ALTERNATE_INJ	BIT_ULL(MSR_AMD64_SNP_ALTERNATE_INJ_BIT)
>  #define MSR_AMD64_SNP_DEBUG_SWAP_BIT	7
>  #define MSR_AMD64_SNP_DEBUG_SWAP	BIT_ULL(MSR_AMD64_SNP_DEBUG_SWAP_BIT)
>  #define MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT 8

Sashiko: Is it necessary to update tools/arch/x86/include/asm/msr-index.h with this
macro rename as well?

Yeah, we probably should for completeness' sake.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
