Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6192047208E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449997; cv=none; b=rJprQvCXPP6QjxTB4311LCbiLSZ7h2aqgU+x9HwNKDv/Q00QVfD3v31L+57LtZ1Xg6Q5kUelHG45q1/NQY2ffLAgcDpVl9bTYulr8FBDTzCHLZBH382QhWPucepSQZpPASEL9GeUGasW9U0/Cn3xd3Ps5BfDjnxv5mFHE9BaoFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449997; c=relaxed/simple;
	bh=KhMPs7f7d+j3Ay877SdLwcsnuP41W22qzcIlYegjYf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=i+GK6vphaj/ip7FWMVvN1nOZ8iPsEYBcsUINdb+0BCBnnN0A06es7WupUcH7a8UTzKFyn6lqMlTZxJIsFbFpEh3PgqEWNWCb6V3t/d90tkcRduPlSP5hCyQbH8dqr0Btq+YmV60zk/1Vd+X4KF1X1xFnV95AbZdb7R/9Cal1pNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb/79Go0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb/79Go0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068C81F000FF;
	Thu,  8 Oct 2026 08:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791449996;
	bh=CaiT5kTv33SsnOYI3EUyPCMcp1BQM2VQN+csQ4ReYmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=kb/79Go0ddgZOzUUJPnKbSVbs0G0WceQ8Y+2DKl1ul0Opp0YtxUVhcPbynk0s5/kP
	 NfFXFBzZDxXhe36nklFpoMJU4Ft/phsgkf0lSXMUw+Pbyiazk5iDkaRga7ml71v/Vl
	 1l3ixisknyXCkdAb07pym/LGH/t8PMkIE9bK2Sa2y4nFr14pyrXn1la0h9Cwg5liIF
	 u/RkqaVre6RzradCfzw0Rx7SjkmYUFfnuo3z0z06iZULEuVGNUBGf2AJkU3DRFft8+
	 zCuKWEk95uBxmY/F4UtXlX5uJva1jGadoT8kibF91sJNXmGkoNwVKKmNo9dV9ZtFMD
	 fD1tJBUlWAkAQ==
Date: Thu, 8 Oct 2026 14:25:35 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>, 
	Manali Shukla <manali.shukla@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Robert Richter <rrichter@amd.com>, 
	Christian Ludloff <ludloff@gmail.com>
Subject: Re: [PATCH v5] x86/apic: Use EILVT register count from APIC_EFEAT
Message-ID: <asdZHtWamB6VewVB@blrnaveerao1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930031309.GEarx-RcbEf8tHWUmg@fat_crate.local>

[Restore CC list]

I messed up and dropped the Cc list in my reply to Boris, who noticed 
and promptly pointed it out. Restoring the CC list so that the below 
discussion is public.

On Tue, Sep 29, 2026 at 08:13:09PM -0700, Borislav Petkov wrote:
> On Tue, Sep 29, 2026 at 09:49:56PM +0530, Naveen N Rao wrote:
> > No, I think that defeats the purpose of this patch. Part of the 
> > motivation for this patch is that we don't have to care if the EILVT 
> > register count changes again.
> 
> If you really think that for a new CPU, you won't have to touch the kernel,
> then you need to wake up and smell the coffee...
> 
> :-)

One can hope ;)

> 
> > Note that the issue Sashiko is referring to requires three things:
> > - that HW advertise an inflated EILVT Register count in APIC_EFEAT,
> > - that some other _new_ HW unit also advertises an offset > 175 for use 
> >   (the two existing units: IBS and MCE, use a 4-bit field to encode the 
> >   EILVT register number, so those can't trip this)
> > - and, that Linux stay in the old xAPIC mode (rather than x2APIC).
> > 
> > If the first two are true, then that is hardware broken beyond help and 
> > it is hard to imagine Linux additionally being used in xAPIC mode.
> > 
> > This is certainly easier to trigger with virtualization, but there are 
> > far worse ways for the hypervisor to mess with the guest.
> > 
> > So, I don't think this alone is reason enough to clamp the value.
> 
> ... but ok, you feel way stronger about this than me actually cares so sure,
> let's not do anything here. And yes, I kinda agree with some of your points
> too.


Thanks,
Naveen

