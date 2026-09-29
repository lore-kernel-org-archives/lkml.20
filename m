Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BEE511217;
	Tue, 29 Sep 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681596; cv=none; b=ZrufnW+y+MTpKFAGEi/RIvLW57aC2zp05xdhVLlKqMQaRVfIsps7Y9JkJ86Dh3609CweyVHuPzru71FtLiZply0JGQBtr30vGQo+r71zu2N4yZwng+3afBWrXYK3tjdmHbS9gxiuO7ltrFKY2ZiXaqKwJjnAY5VTKcYe9H/tGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681596; c=relaxed/simple;
	bh=o38NYq67pIHj95OIB/9M83EPfFgbWcUBjFoKcWAFszQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRKPESp38WtvAgZJe/L7AvBO3rekoY571100BZG89IFGNOkWkfQuUfWulutkRAig0LUdzreFFJYR3vx1OR5WIjcCceXlmIUjmd0Q5NtBJ8Pgv2qWW3vxQNZ1BkP0/e8ud3wzXlC9Mbd6DH9/vw7KbrLVlbicNxdVdUcOSzpPLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDfq3ESV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDfq3ESV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998C31F000FF;
	Tue, 29 Sep 2026 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790681595;
	bh=e+gknYVW9XCp81xeC0RXx9vcOUHAJigZEtqY/xe8b6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDfq3ESVa10xLkpSv+CeI5FF1JUQktUhny83NdvHPN+F/Gsl0SORQ8nYLanhlRObL
	 3rtdxQBVjPAYI6hiVUnHd2NqzqZjFK+DdiO30XeURd23enxO2BENrhbozvNTo5RMYo
	 MYRqeYSyedXYG4xB4W19ElcDnoU1dp5FvngYHL6+vLcL7hF3RwBnN7qcbNHBTDS8zJ
	 G4jFmbmUNbbCax96iFWSepuDD2HCv4SUjvmjwVLpy5ix5REIGjVm+psvkgOeJbOSOT
	 dtC2VTT9NqBZqFMgmDJbtzbdP8r2tD9CXrS2Vf0OI6pkF21ISs5ROETw/aW89lfLlc
	 xH4NbBNe8Tgjg==
Date: Tue, 29 Sep 2026 12:33:07 +0100
From: Will Deacon <will@kernel.org>
To: sumit.garg@kernel.org
Cc: brendan.jackman@linux.dev, Vincent Donnefort <vdonnefort@google.com>,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <aruh86rd5FMv2i9G@willie-the-truck>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <are21BjeS1O3RYE3@sumit-xelite>

On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> Looks like you dropped me from your reply.

Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
CC list to To: and drops you. I suspect the same thing happened to Thierry
when he replied here:

https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/

I can't figure out why that's happening :/
I manually tried to fix the To: and Cc: lines in this message.

> On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > for arm64 because it relies on being able to unmap arbitrary parts of
> > the linear map, which isn't generally possible unless you force pte-level
> > mappings for everything, which is prohibitive for perf/power.
> 
> As per the cover letter it's about allocating pages that are not present
> in the direct map. This essentially fits the protected DMABufs use-case
> where we don't want any kernel mapping to exist at any time. Bufers
> allocated from protected DMABufs are only meant to be accessed by the
> TEE implementation or HW accelerators like in the secure media pipeline.

That sounds like it should probably build on top of this series, then.
You could allocate the DMABufs from a CMA region that has no linear alias.

> > Vincent's series tackles that by using a pool so that only that part of
> > memory requires the pte-level mappings in the linear map. That's the
> > whole point of it, so I don't think it makes sense to drop it in favour
> > of Brendan's approach (which doesn't work).
> > 
> 
> For protected DMABufs, we even don't require any pte-level mappings in
> linear map. The whole idea of mapping and unmapping is just a bottleneck
> for performance sensitive secure media pipeline use-cases. That's why if
> we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> be the best fit for this use-case.

The point is that you will require pte-level mappings for the linear map
if you want to unmap from it at runtime on arm64. If you don't, then you
can end up needing to split a block mapping (e.g. pmd-level) when you
decide to unmap only part of it and there isn't a safe way to do that on
arm64 without transiently unmapping the entire block, which can lead to
fatal translation faults during that window.

> Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> how Brendan is doing it for x86?

Because arm64 != x86? Presumably x86 doesn't have the strict
break-before-make requirements we have on arm64.

Will
