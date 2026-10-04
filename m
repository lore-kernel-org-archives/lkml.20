Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA92F0661
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791103196; cv=none; b=CDttB6Jw2dmL6bqiBx6cGPYoePGYp/5A+aAmrPbsoRonM2rSlzzjlZdQVyC/sm+XcMYbkhv+/oOfpy/maFbwoenppbbhH9UEUPtIb8NdfmVphfgrg/rVtOrY1lBXXPvCaZTL4XEk7cEXNedVQLG6ALJ3QIPXTpOAUZT3OQzaAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791103196; c=relaxed/simple;
	bh=kCfUMFjyszMsMvqCb1urqEXaDE/NE4H7gMvkkO+N9LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spNyKM7VAANXhjVtbr5xi7OYxuI+zc5UYihSDVOuRXmpSy3E2WerbonRK3EasVDoV7qC9xcWvbBb6nSpAe6WXduHrLFhNrYPfucNT4vk/opf1PLjD0m3qiAACMjxE7g85lL6WkXV+LPRN1GrasK65sI64FIe8bVpY7MiVfemIKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFNi2Cqt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFNi2Cqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4021F000FF;
	Sun,  4 Oct 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791103195;
	bh=ysCMt+UvNQ2q2GhknBwwA0WGWvISGRLv9Pa410wYVKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GFNi2Cqtkhy/RaU9rmxwM7iBW6xCm/wn7jq7nL2pckn4VRSfyIn14WyJpeZd2Mzn0
	 TCJ1w0NekhZRt31aGzOpaFAmXkgMQZ41bYRmI54G1NDjwWuW2l+1byLkKjmQ31tm76
	 yCbJIM4s7kMOyo/g6eg3DS+SJBTs81RZ/NmrIoFEmHn+xgt0XtprMt7CGWuA4VLXYw
	 L5jJqIZFqWN/9HUIfOi/AbuxzPQGmAwOQebUeQsC+uJQa18ublxFRHtEyT6s4+VghR
	 BMRgiqWzV8wRf8eBa/58taSjwFOn/e1Feg8MzYutW90JB9jwiAd1k1QEcM/1g/Y5Of
	 2rWTh9G625YMA==
Date: Sun, 4 Oct 2026 09:39:49 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <asIQ1ZwUjkmNJbRP@willie-the-truck>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck>
 <ar_E5HUSTxMSRZhL@arm.com>
 <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
 <ar_QOXqCYTGargBe@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar_QOXqCYTGargBe@arm.com>

On Fri, Oct 02, 2026 at 04:39:37PM +0100, Catalin Marinas wrote:
> On Fri, Oct 02, 2026 at 04:24:06PM +0100, Fuad Tabba wrote:
> > On Fri, Oct 02, 2026 at 03:51:16PM +0100, Catalin Marinas wrote:
> > > I couldn't figure out the #8 either. I wonder whether it's more readable
> > > as (untested):
> > >
> > >     sub    x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> > >     cmp    x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
> > >     b.hs    .Lskip_pmuv3p9_\@    // Skip unless V3P9 <= PMUVer < IMP_DEF
> > 
> > This looks correct to me.
> > 
> > That said, if readability is the goal, I think the plainest is two
> > compares and two branches. It's one more instruction, but this runs
> > once at boot:
> > 
> >       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
> >       b.eq    .Lskip_pmuv3p9_\@
> >       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> >       b.lt    .Lskip_pmuv3p9_\@
> > 
> > I used ccmp to match __init_el2_debug in the same file, which does the
> > same NI/IMP_DEF check with a raw #4, as does reset_pmuserenr_el0 in
> > assembler.h (and hyp-entry.S uses the same pattern for HVC64/HVC32).
> 
> I'll leave it to Will. My preference is whatever is more readable, no
> need to optimise another cycle or two here.

Now that Fuad's put me right and given that we already use ccmp in
__init_el2_debug, I think consistency is probably the winner so I'll queue
this as-is.

I wonder if it would be worth having some #defines for some of the common
conditions, so we could avoid having the bare immediates each time in
future? (obviously, that would be a separate cleanup rather than part of
this fix).

Will
