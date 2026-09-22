Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F03909A5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055397; cv=none; b=D3dmtimp8aVZwozJpvKESfkK4d4jKPLJJ1r387Dmtb1o8AfYr+P1nsGDtWN+G8VfOnZxpCP0ZGqEymVX2vfG7E8+KdEgbZ60E08wLL5X5ik4CK1t2MTBvWj8n+6/hjHfPKXM1mCzWdUYBAWmlk+vDmiG6DvmyzatQ+Ua58WJAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055397; c=relaxed/simple;
	bh=TczEmZjajOJyQ2NqMs2FqAa/Gqe/6pakjRfWQB6a2L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hf2O+6oUIhPdDHU2TSmJSPqOvzlFznG4n3oEzFmNCkuJn+34ZrIbL/e1Wd4Oz1qP2dVIlaIBr6vuq68oUm7bkIwPgdM3c5OVO3QJsFZ8SqSjcBGI7i4n7LT1PfZxDj1VC6aSmQSOD086k97nDo2gYjNaDVbUTU/M4xe6mE1SbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hn+kKvfn; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hn+kKvfn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D49E740E01C9;
	Tue, 22 Sep 2026 05:36:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iwam1LHiYJhw; Tue, 22 Sep 2026 05:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790055384; bh=FNpfhwcR2g8Yo8DgV+PvvT1xtt+UxRw2R9l45BNfq8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hn+kKvfn5InV4hsWw7C/2H7uphIFagUcXtoZHOOXNRkUhkIHmkONvZPIKMG0WfV8F
	 JHEmMArayW1AUsi6fSnXRRyITkUQNWQ3wKYINTv22wrvtF0bIgnaWAKICTq5L+Wbv+
	 iYUCK4y3SLGq+QYn1ZeS2KIhnpWxei+XvDnc6C4xh1mP4A/Xnjk84rEFH231vavtBc
	 GJJThvZJVAbxlXDqmuT47Jc6r/UofychU6QyXtPKJ64tvaNJrh5bacNr5saOx4/KE3
	 W1XsCflRvozKSZJNN2W67Rkg7B+1jWtrJNotkqr2k6ym0Mpe3/KZQLJDViJ/cOZgeF
	 NPrOh7tT/slkf5uGxuN7fYoXPUExRtiGMEYrNuIg2tUN3dkP7XbNVJKBWDaGqRJ2Xl
	 PfddsAFcxxCu+WRfYj6tgA4isNS2gHZjkVadIxoi2XGA3rZQPGvPLedwQfctiPVhzu
	 /+k7AlmBELwH+TopgwxCZopj1RkaXampmXLv7WJVDptye6jIIZbxPcmuVTIUHl6SkY
	 iwfSHoIbYLLSX4yHA00zU38lc89NkQQszhP/zPou5CmfB5f3R9VPJgPWmeSdc1x12M
	 I7jV1cx0Keie7vWZPpNeHb3PtNV0disDGhCMH3dDTx9OLbNG58J/9WgV7fhWNDsnQn
	 cRMp3n1MnShi7nXt4CIb08Jw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 63DDE40E015D;
	Tue, 22 Sep 2026 05:36:13 +0000 (UTC)
Date: Mon, 21 Sep 2026 22:36:10 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 2/3] x86/apic: Introduce a variable to track
 the number of EILVT registers
Message-ID: <20260922053610.GBarITypxf7zPAB83g@fat_crate.local>
References: <cover.1788425679.git.naveen@kernel.org>
 <99275fc7531b5c8708e2be8459251c9169b0ce63.1788425679.git.naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99275fc7531b5c8708e2be8459251c9169b0ce63.1788425679.git.naveen@kernel.org>

On Thu, Sep 03, 2026 at 02:58:40PM +0530, Naveen N Rao (AMD) wrote:
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 90025451ace2..c990f403ec7f 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -410,6 +410,15 @@ int setup_APIC_eilvt(u8 offset, u8 vector, u8 msg_type, u8 mask)
>  }
>  EXPORT_SYMBOL_GPL(setup_APIC_eilvt);
>  
> +static __init void init_eilvt(void)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
> +		apic->eilvt_regs_count = APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
> +
> +	if (!apic->eilvt_regs_count && boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
> +		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;

Why not simply:

	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
		apic->eilvt_regs_count = APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
	else if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;

?


And now I see the big picture - you have a single logical patch - add
eilvt_regs_count - and the rest of the code is reorg and cleanup.

So why are there three patches?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
