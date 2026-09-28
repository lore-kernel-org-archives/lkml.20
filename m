Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6323909AE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578343; cv=none; b=dH3lMdwEVsn9YkIgW2SSa6ZI0tVnjt+Cr4akgMbTc+W2Bj5iYYGgGb7imSoeP9CZyYTAnWAoH2XYZapcJDIJ/7Feh2KYdCqXL424oTrHCgC5WZzLIFnAxeZrhKR97Cw4AHrytiYiFfCvn1gP3xtS/7ab4361abVOgWyLJhFXuJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578343; c=relaxed/simple;
	bh=+qFFDBKT9icpOA509PxeK49mkOaj8au1jPX2+vSCPHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR+tGyHyHD7yZwOrstoQ/z1gt23Sswvq7c5NYbxJsKT4Z3/OBHtwvWTpoiPCTjPKBoGz6Sx2Z5KANSG441J+CN19550YuyUdxxZXYvvrWkiuxXaaV10uC8mG+mpBlIMeX8dmIg6mgDa4fZKkrfSCn3YFd32b4EqJ99QZmILUGvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHgWkaQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHgWkaQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538711F000FF;
	Mon, 28 Sep 2026 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578342;
	bh=SLXV/Cg00f6WCYQp25Dw7LaF99vpemY8DU7m4VnwaGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jHgWkaQta7QyqouZdTn+ObiRaW41vPBjM+OQ/K17MKZfiafOZ9YU3EyNdsQhw1IbG
	 j7IFiyCxZiMg4HL4rXUcxVivOh0qC6BKLKgLFGtT9cT5wJOEOdntoaZ9hXDnik2dc2
	 O13sUr7tg9oPldbfZl92hEfnLYIcVfY/JJtUhnoVIzQr1AlDFvPF/s/3sZCVYpqQeJ
	 a6Oft4IaQh345KESFmv9tsvYv+T0YhcItc9mb1dN+yYOA/c9IRzvrZtaTEb27a8pPe
	 QRBVelVtataaFIVMNB8HHZ04hZYhLtU7ZysS1mdwCHA/HRDS3Bo8ei5o/FhTusz0Wj
	 hGIZFpgV8n9rw==
Date: Mon, 28 Sep 2026 12:20:04 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Robert Richter <rrichter@amd.com>, 
	Christian Ludloff <ludloff@gmail.com>
Subject: Re: [PATCH v5] x86/apic: Use EILVT register count from APIC_EFEAT
Message-ID: <aroJFq8GxwZNhqk8@blrnaveerao1>
References: <20260925161706.1619042-1-naveen@kernel.org>
 <20260926003833.GCarcUCXmT6B5hfSBV@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926003833.GCarcUCXmT6B5hfSBV@fat_crate.local>

On Fri, Sep 25, 2026 at 05:38:33PM -0700, Borislav Petkov wrote:
> On Fri, Sep 25, 2026 at 09:47:06PM +0530, Naveen N Rao (AMD) wrote:
> > Future AMD processors will be increasing the number of EILVT registers.
> > Rather than hardcoding the maximum EILVT register count and using that
> > everywhere, introduce a variable in 'struct apic' to track the EILVT
> > register count.
> > 
> > The number of EILVT registers is exposed through the extended APIC
> > Feature Register (APIC_EFEAT) bits 23:16 on platforms that support the
> > AMD Extended APIC Register space (X86_FEATURE_EXTAPIC).  Use this to
> > initialize the count and fall back to the current default from AMD
> > family 0x10 (APIC_EILVT_NR_AMD_10H, which is 4) otherwise. Since this
> > value is no longer a compile-time constant, update eilvt_offsets to be
> > dynamically allocated.
> > 
> > Drop the now-redundant APIC_EILVT_NR_MAX macro. Other than during EILVT
> > register offset allocation (which now uses apic->eilvt_regs_count), that
> > macro was being used in the IBS driver for determining the EILVT offset
> > for AMD family 0x10 since the EILVT offsets were not assigned by the
> > BIOS. Switch that to use APIC_EILVT_NR_AMD_10H, which reflects the
> > correct EILVT register count for that family.
> > 
> > Note: because the EILVT register count is now derived from APIC_EFEAT,
> > it is possible that the register count is less than 4 (1 or 0 even) on
> > some AMD K8 parts (rather than the previous default of 4), which should
> > more accurately reflect the correct EILVT register count on those parts.
> 
> Please, do not talk about *what* the patch is doing in the commit message
> - that should be obvious from the diff itself. Rather, concentrate on the
> *why* it needs to be done and why your patch exists.
> 
> It is perfectly fine to explain non-trivial aspects of the code the patch is
> touching but do not regurgitate what it does.

I thought I have explained the why. What am I missing?

Perhaps you are saying paragraph 2 is not needed? Though I fail to see 
how it can hurt (it does clarify why the fallback is the value that it 
is).

> 
> Also, that second note about clamping it:
> 
> https://sashiko.dev/#/patchset/20260925161706.1619042-1-naveen%40kernel.org
> 
> does sound relevant.

I had addressed this in the cover note on the previous version and 
didn't repeat it here:
https://lore.kernel.org/all/cover.1788425679.git.naveen@kernel.org/

  3. Need to clamp the maximum EILVT register count to prevent incorrect 
     MMIO accesses: this is not an issue since all offsets being 
     programmed are appropriately clamped at the source.

> 
> The first one, OTOH, is a very good example of a confused LLM:
> 
> "The APIC ExtLvtCnt (XLC) field represents the maximum EILVT index..."
> 
> Apparently, it couldn't download the APM.
> 
> :-P

Oh yeah, and no amount of me calling this out explicitly in the commit 
log seemed to help. See patch 2 here, where I added that it is the 
actual count:
https://lore.kernel.org/all/39d39c3b91d174f4090fb954c6690edae9ed8295.1784619898.git.naveen@kernel.org/

Sashiko review of that:
https://sashiko.dev/#/patchset/cover.1784619898.git.naveen@kernel.org

> 
> 
> > Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> > Tested-by: Manali Shukla <manali.shukla@amd.com>
> > Tested-by: Bharata B Rao <bharata@amd.com>
> 
> Are you sure they tested your new version so quickly?

No, and I never claimed they did. If anything, I have called this out 
explicitly as part of the changelog:
  - Pick up Bharata's Tested-by, and retain Manali's tag since the change
    is minimal

Retaining their tags was a deliberate decision on my part knowing the 
tests they are doing and that they would not be exercizing the fallback 
path, which this version changes.

I'm absolutely ok to drop that, but no, I didn't claim they tested this 
version.


- Naveen

