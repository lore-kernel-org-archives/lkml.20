Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F53DAADE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652463; cv=none; b=TNZ3n60GHE5EdLMXYDC58lSN1g5ooT5MWYLE2tS710SrZ4EI/Q9udYKFw4qDCDuBSUAKAnCQTXC5NuBK5A/s8r8457YnZ0Ih02nP0NnR1Od8De/lTRLyM0GVfYNgAI/eQBhbvy1QyDw0Lgqqy7HoXj42ZmEMAISUUepgsx5hvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652463; c=relaxed/simple;
	bh=WOGGLpXSCI90H+DnhSoqxVv8CAcr/BoRVaY19KPznzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkrD2m7XWtdATljjg1eso9O6QYUHadLt3hIDlJy8XqCBsOtvu5/fX8r0yTtzG7Yc7VC77SwztGCFJDbrlSRq2qSJY8uZJOBQoWPVNeiF7rw9p7m14MREXrAfkteD0fhBiP4jt4Zm4Nzt0dfBQnDMBHRUhHc/oojXxs2iHsNMbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QUWOZXeF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QUWOZXeF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C45ED40E015D;
	Tue, 29 Sep 2026 03:27:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bYOyyVNZL7w0; Tue, 29 Sep 2026 03:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790652448; bh=1dJIS7CpyO3dX9/V0UgZpHpRmGkmqqeOJJ4hhyIBwwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUWOZXeFGyfoaYA4K7muWI/h/KHe1/7yI4bkDb5xWaInEETYtRF3UxjMnt87gpfuT
	 62+rqfxW6BqUE0llJ5jNLOU8hg5YWNRZFtyuWTYHlJL5LD1ATnjK+EmBAYfZNm9eqZ
	 aO5yg+Fz2jeTUigc2JUiPZGst/RI0O8dTjZ/cSxQO3gDVfBcIsSsXQ/v1oVoCXR96T
	 BxOJdDwtq+dG8NJzg4ouLpwYD7USLp3k9UWSynHpif4Y3LiEMsiTWHzNASgR9hUQHr
	 3SxOgD3BgukmhGsWFzFaHjuaYhL58s0CCJgrLLLOoG6EhuCHd9mzQRzzObELpk2eoT
	 qY5kLaGVhd1HV6SEPtQcSV4r6TS83Ue7t6CgK4WcXfohbB293fWBlT6SK3SY7fCP5+
	 MwQC4qaY3itDfX14cX4+NTv8DxtghgbhYyW0W8rXM5KmWml91M4hStGSbPpgwo8Tc7
	 dwKvMvnv+G07Q8LjJTDQSfXR6j8v2MrkG/U688hkH56aBzhkKwzN2U2mZWSI3enaEC
	 bAmbJY1DAps9OZQMo1W0eVvjPlIdwSLZOvZQv5Ytd5L+owQExr8bVFihz6S8DGrEgn
	 VDpR17ia+X/e/KBcyzzpC9pc9TCXRN8rWH7NnETMmH5jZbDAOTRkmCBNAjEgq4HkUI
	 9chMNnMBnpSNiH06Dv6ZSqSs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8BCE940E00E8;
	Tue, 29 Sep 2026 03:27:15 +0000 (UTC)
Date: Mon, 28 Sep 2026 20:27:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Naveen N Rao <naveen@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Robert Richter <rrichter@amd.com>,
	Christian Ludloff <ludloff@gmail.com>
Subject: Re: [PATCH v5] x86/apic: Use EILVT register count from APIC_EFEAT
Message-ID: <20260929032711.GCarswDzl77hv5PaEX@fat_crate.local>
References: <20260925161706.1619042-1-naveen@kernel.org>
 <20260926003833.GCarcUCXmT6B5hfSBV@fat_crate.local>
 <aroJFq8GxwZNhqk8@blrnaveerao1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aroJFq8GxwZNhqk8@blrnaveerao1>

On Mon, Sep 28, 2026 at 12:20:04PM +0530, Naveen N Rao wrote:
> On Fri, Sep 25, 2026 at 05:38:33PM -0700, Borislav Petkov wrote:
> > On Fri, Sep 25, 2026 at 09:47:06PM +0530, Naveen N Rao (AMD) wrote:
> > > Future AMD processors will be increasing the number of EILVT registers.
> > > Rather than hardcoding the maximum EILVT register count and using that
> > > everywhere, introduce a variable in 'struct apic' to track the EILVT
> > > register count.
> > > 
> > > The number of EILVT registers is exposed through the extended APIC
> > > Feature Register (APIC_EFEAT) bits 23:16 on platforms that support the
> > > AMD Extended APIC Register space (X86_FEATURE_EXTAPIC).  Use this to
> > > initialize the count and fall back to the current default from AMD
> > > family 0x10 (APIC_EILVT_NR_AMD_10H, which is 4) otherwise. Since this
> > > value is no longer a compile-time constant, update eilvt_offsets to be
> > > dynamically allocated.
> > > 
> > > Drop the now-redundant APIC_EILVT_NR_MAX macro. Other than during EILVT
> > > register offset allocation (which now uses apic->eilvt_regs_count), that
> > > macro was being used in the IBS driver for determining the EILVT offset
> > > for AMD family 0x10 since the EILVT offsets were not assigned by the
> > > BIOS. Switch that to use APIC_EILVT_NR_AMD_10H, which reflects the
> > > correct EILVT register count for that family.
> > > 
> > > Note: because the EILVT register count is now derived from APIC_EFEAT,
> > > it is possible that the register count is less than 4 (1 or 0 even) on
> > > some AMD K8 parts (rather than the previous default of 4), which should
> > > more accurately reflect the correct EILVT register count on those parts.
> > 
> > Please, do not talk about *what* the patch is doing in the commit message
> > - that should be obvious from the diff itself. Rather, concentrate on the
> > *why* it needs to be done and why your patch exists.
> > 
> > It is perfectly fine to explain non-trivial aspects of the code the patch is
> > touching but do not regurgitate what it does.
> 
> I thought I have explained the why. What am I missing?
> 
> Perhaps you are saying paragraph 2 is not needed? Though I fail to see 
> how it can hurt (it does clarify why the fallback is the value that it 
> is).

I went and rewrote your commit message without the code explanations:

"Future AMD processors will increase the number of EILVT registers. Track the
EILVT register max count in a variable. Use the current default of 4 EILVT max
count from F10h times as the fallback.

Use the APIC_EILVT_NR_AMD_10H macro only in force_ibs_eilvt_setup() which is
F10 specific anyway."

That's it. Everything else can be read out from the patch itself and you don't
need to spell it again in the commit message.

> > Also, that second note about clamping it:
> > 
> > https://sashiko.dev/#/patchset/20260925161706.1619042-1-naveen%40kernel.org
> > 
> > does sound relevant.
> 
> I had addressed this in the cover note on the previous version and 
> didn't repeat it here:
> https://lore.kernel.org/all/cover.1788425679.git.naveen@kernel.org/
> 
>   3. Need to clamp the maximum EILVT register count to prevent incorrect 
>      MMIO accesses: this is not an issue since all offsets being 
>      programmed are appropriately clamped at the source.

"Table 16-2. APIC Registers

...

500-570h	Extended Interrupt [7:0] Local Vector Table Registers	00000000h"

I'm reading this as, EILVT max cannot be more than 8 regs. Right?

So doing a  if > 8 at read time would be a good sanity-check, no?

> Oh yeah, and no amount of me calling this out explicitly in the commit 
> log seemed to help. See patch 2 here, where I added that it is the 
> actual count:
> https://lore.kernel.org/all/39d39c3b91d174f4090fb954c6690edae9ed8295.1784619898.git.naveen@kernel.org/
> 
> Sashiko review of that:
> https://sashiko.dev/#/patchset/cover.1784619898.git.naveen@kernel.org

Recent experience tells me that I cannot trust AI one bit.
 
> No, and I never claimed they did. If anything, I have called this out 
> explicitly as part of the changelog:
>   - Pick up Bharata's Tested-by, and retain Manali's tag since the change
>     is minimal
> 
> Retaining their tags was a deliberate decision on my part knowing the 
> tests they are doing and that they would not be exercizing the fallback 
> path, which this version changes.
> 
> I'm absolutely ok to drop that, but no, I didn't claim they tested this 
> version.

Just drop the Tested-by tags. They haven't tested the patch and that's it.
It's not like you fixed comments or something else immaterial to code.
A Tested-by should mean what it says, not the person tested some old version
of the patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
