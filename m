Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B342E44CACA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251158; cv=none; b=L0rmIryroGREXit5uo52mCb7vOKRkMf8ZzRn45YoivdEu+wSt4RDEiZ+A5/n4PMLWlchkg67Mo0q8RGT4yvv7C9EdRWz7sbJSTAJ76RNMJCLj3RAJWOl2qi+5jAg8giDkuFjhsQacYWdB8ARp5CwJsSp6lGvEO5x/h4Xy6hzGrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251158; c=relaxed/simple;
	bh=BfvuYwJisdL/+vp9nxm8DdiNdUg3WDdDwC6sdbbSx2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPUn3ad4lW9Ee+upYUFmUNMz+SW6iokG5KYAZHVojzFqgof+rddZn4ehHIRf1I0dZ7GqQM9hPiTFrQLV/AkUDXBNN4BufEoHWZpajoM+RuI3G4wt9nOYRAM1gprk5viUJwebWcQvxKnx38ou2QBTk1IvlkWlRWK3yqxy5ulnyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzP+LRFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzP+LRFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871B21F000FF;
	Thu, 24 Sep 2026 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251157;
	bh=/iMzx0ra6XjxKB83P3JLyN/uam31zIhfCPXQzS8z3X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzP+LRFf1A/gGTwHiMd/8TFwtl4lR3cgEKdUo3MfQOcghTkjfM/FZjSONVJQeRw40
	 DIeh4CIs1XBSnUJBbBSH2K66zHm0uH6Af5voA0BMXnqiTlw4mkQlY2pxqrN3GfPerl
	 mIAs4ke7b1O2M5E2oHU5+SBTRvlyfizRg4M4NiCeHWgZ07QX6Ta/XrgUfIyn8ReQto
	 tJU6B7TlnS1sJNLne4VBlJ0BNkuBoKFysrQIILRBjhyUV1mtk0lz8UEvYO2UmblYgP
	 oz2fUgjdNY2PAcJHuAOIjcylHpmh/wGZ/ypLmlWSQ8qxL5eBNMN7h9sLj83UvVAyLM
	 balpjZ3BeeMxA==
Date: Thu, 24 Sep 2026 17:28:48 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 2/3] x86/apic: Introduce a variable to track
 the number of EILVT registers
Message-ID: <arUKzQZx77r49plq@blrnaveerao1>
References: <cover.1788425679.git.naveen@kernel.org>
 <99275fc7531b5c8708e2be8459251c9169b0ce63.1788425679.git.naveen@kernel.org>
 <20260922053610.GBarITypxf7zPAB83g@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922053610.GBarITypxf7zPAB83g@fat_crate.local>

On Mon, Sep 21, 2026 at 10:36:10PM -0700, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 02:58:40PM +0530, Naveen N Rao (AMD) wrote:
> > diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> > index 90025451ace2..c990f403ec7f 100644
> > --- a/arch/x86/kernel/apic/apic.c
> > +++ b/arch/x86/kernel/apic/apic.c
> > @@ -410,6 +410,15 @@ int setup_APIC_eilvt(u8 offset, u8 vector, u8 msg_type, u8 mask)
> >  }
> >  EXPORT_SYMBOL_GPL(setup_APIC_eilvt);
> >  
> > +static __init void init_eilvt(void)
> > +{
> > +	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
> > +		apic->eilvt_regs_count = APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
> > +
> > +	if (!apic->eilvt_regs_count && boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
> > +		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;
> 
> Why not simply:
> 
> 	if (cpu_feature_enabled(X86_FEATURE_EXTAPIC))
> 		apic->eilvt_regs_count = APIC_EFEAT_XLC(apic_read(APIC_EFEAT));
> 	else if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
> 		apic->eilvt_regs_count = APIC_EILVT_NR_AMD_10H;

Cause I didn't want to risk changing the current default EILVT register 
count for some ~2 decade old processor that may be advertising 
X86_FEATURE_EXTAPIC but encoding a count of zero in APIC_EFEAT.

I did look up BKDGs for some of the older processors, but couldn't work 
out if this ever was a problem. This was discussed here:
https://lore.kernel.org/all/agckJQQuLsARA4ul@blrnaveerao1/

> And now I see the big picture - you have a single logical patch - add
> eilvt_regs_count - and the rest of the code is reorg and cleanup.

Isn't that the case for most patch series? ;)

> 
> So why are there three patches?

Right, the split reflects how I viewed the changes, and to hopefully 
simplify the review. Looks like I got the split wrong as it looks to 
have been counter-productive here.


Thanks,
- Naveen

