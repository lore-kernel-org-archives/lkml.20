Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F1478E39
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197290; cv=none; b=gdQbhj7H8wBdR0njjsGP1qOrPgaDTSmf9zZOWeWUKeh+L4qTQn3YY4zVI5YgmAPm6M9gMUlMTc6LsXUFHoCfbWjLBwAIso9O7ffmgGY49wBA8VOS6OfflfqYvcVx1iSVjvOpFb/05UXpgaw6m/lhyveSWmU+sJA9bKrVZ5LGbrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197290; c=relaxed/simple;
	bh=ubSttLXNMaUwsbAPAyklYDd9f5MzlxSqVoEXakDEc5Q=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8AzDqNLJSTh4hY7enw9+yI1q0n41gbpxdFcjE9yWzNOUWxynpz2K2a+3NPDyW8ZdxQ9zgl9ET0XXigKnrJ7bu6iZsGcZbE99MYLJmsBKuf7/go0BsX360DQBefhOpG8UF311f6+DHRUwbsRmx1/OWetxhhwlNzlcYhTGN3jPKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJD1bgt2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJD1bgt2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d8239so13768735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791197287; x=1791802087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=;
        b=oJD1bgt217/c9vunsxHa4Jrx84L7wvb2tQyIM26bMn4UNv9AfMcs2DrKbuftWbK5vY
         EGPMyQrr8hZqNSLtFfr16Ck/+lvj5KIhBaDQ2XaW52goE+28yRvXDc9eXypd2+k5Tpgn
         IjeH/z/Mjg0ANQserfFCnk9Gn6HW4LYOLBh3lFITJFZHr6upD9Bfr3RhZmARp4XDdqbD
         mUlbqtpAkbu1zi+Aw9giymYk9SnItzD27mQr2w8t6rre7JUJL49KdGNQuoF8ocG92e8H
         jMas7ABmn/oUf8xQXmjG9xDbzSZwbSvvSowlV4oPlsN740q8SIo70NBTuTR02kMDU6ox
         iUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197287; x=1791802087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E0kZNEEosSgGH99aMOAH+blyCZGVgX/b9FbaeaxoPo=;
        b=WV7vOTMMYnWetjPgTY0Qm2eaR3T9pj8ghswRBXUepu6MTwLmh/ptY9J/dZec3hyilF
         KV7cn1XN/acZfsE8nUxe2ZFZKXACTeAmfDVVJCG4tDWI7dHci3mSWOQrhuyGDqu4lvfl
         ObGG3GGv/rkssvJbJIlf/QnOkO/CSfjwbKIlACVG+CjKeEw6By1TLGBj+YKg5iRSZ3KL
         XDSgvZZXoJ0DTYuq9893XHEE9x6xrMcatZtj8PfbiPLTkD1lWqdBLOculn0vDANZc8Lu
         qxbsY44cQrCSsG5y1un9NSNZk5Pdlx9KcF5G+o878lujxUtWuxBdUmcCpU6a+TtyArKa
         oYAg==
X-Forwarded-Encrypted: i=1; AKwUvByOYQllSTHkZeeXVxxDo5L2VJWemu6uvF2FxSxhBqFPdSSu5dCOVig76TWBi7Tpds2MewJygnWxtZVGNFo=@vger.kernel.org
X-Gm-Message-State: AFuF++lPt2Ez0CEKmJ3pzjHH+hgRQFCIburwWB0agn02yjV+b0ifttkq
	bqXfwkr6WTKorQA9VrAmNlmTZl4mwEC+32veEZ2CCMCedoxDpZt4vQ93okVcRIlgEQ==
X-Gm-Gg: AYBFou21CrVbzc2c+eqoDeJb68usTOP6xFFwq2z33/YO9j+SZzxpOW4VRUBAGO4umxc
	7D07p8/c3QrNIH8wxx8XLYwZnsFCCQ3m9IcwKYxgIQvY6GA86ezmLA1mBWBqxv91HcHy53MZRTi
	EkLmAyMCWo1+qo+nx8QxodboukSqUcrxrzcbELahU7Nw+97yCpIcT+f+KlZFf7NFYN7hP3Q9sZg
	J/QXSq5MwD4BGMZvza0Ic7iG2AQGPYXyXRHrYjQGuyVfyjKgzrX5G/3jEszdeGLQ2lSoP1FldeL
	ItHxE3LnUJEOGsH2tNJr4ekY74tPcAFUljlxFzBqFUSdE7256N/qtIdjdotgdtvmR0WrwP5ySjN
	E9SHiGevvH7zCbm4nLWEnYhxAAFVP96YLzSYylZyB4z6Pxou3kcJEnhI3lDc4QM3PwzYiO6efY6
	2BPom7ehQcKCr3fW4wFUjpXFxiHGUASS7GMyEEySpSJ2YtF0dMp5TR0TY3YioFOksT+drF1TPaK
	SZoGh+OxHL6h+3Rc6MV5jH7L9Dq/eNAv4qkHQe4m/8=
X-Received: by 2002:a05:600c:a112:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a17690d93emr7713595e9.17.1791197286488;
        Mon, 05 Oct 2026 03:48:06 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm329471285e9.4.2026.10.05.03.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:48:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:48:00 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <asOAYODGZa-7EIV1@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5TPvANFUoosxGW@sumit-xelite>

On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > Looks like you dropped me from your reply.
> > 
> > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > when he replied here:
> > 
> > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > 
> > I can't figure out why that's happening :/
> > I manually tried to fix the To: and Cc: lines in this message.
> 
> Thanks.
> 
> > 
> > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > the linear map, which isn't generally possible unless you force pte-level
> > > > mappings for everything, which is prohibitive for perf/power.
> > > 
> > > As per the cover letter it's about allocating pages that are not present
> > > in the direct map. This essentially fits the protected DMABufs use-case
> > > where we don't want any kernel mapping to exist at any time. Bufers
> > > allocated from protected DMABufs are only meant to be accessed by the
> > > TEE implementation or HW accelerators like in the secure media pipeline.
> > 
> > That sounds like it should probably build on top of this series, then.
> 
> The main problem I see with this series is it tries to move from the generic
> CMA allocator to a reserved FF-A CMA pool which again comes from the
> DT. We already support reserved pool allocations via "no-map" which are
> discovered dynamically from OP-TEE.

I can't think of a way around a DT declaration. We need to know what region is
PTE-level before the direct map is installed and of_reserved_mem is very handy
for that purpose. And as this PTE-level mapping is costly we certainly only want
to enable it for platforms that absolutely need it.

> 
> If we can rather support a generic CMA like allocator for arm64 which
> can support unmapped allocations then I am all for it. These platform
> specific reserved pools isn't a scalable solution.

What do you mean by generic CMA allocator here? An extension to
shared-dma-pool? Or having the CMA automatically doing the unmap/map on
cma_alloc() cma_release()?

Right now I have created an API for the unmapping/remapping part. It adds a
burden on the caller, but the alternative solution is introducing post-alloc
pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.

-- 
Vincent

> 
> > You could allocate the DMABufs from a CMA region that has no linear alias.
> 
> Allocation from generic CMA pool is already the case here:
> 
> tee_shm_alloc_dma_mem() ->
>   dma_alloc_pages()
> 
> Do you mean it's just fine to unmap buffers allocated from generic CMA
> region since it doesn't have any linear alias?
> 
> > 
> > > > Vincent's series tackles that by using a pool so that only that part of
> > > > memory requires the pte-level mappings in the linear map. That's the
> > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > of Brendan's approach (which doesn't work).
> > > >
> > > 
> > > For protected DMABufs, we even don't require any pte-level mappings in
> > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > for performance sensitive secure media pipeline use-cases. That's why if
> > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > be the best fit for this use-case.
> > 
> > The point is that you will require pte-level mappings for the linear map
> > if you want to unmap from it at runtime on arm64. If you don't, then you
> > can end up needing to split a block mapping (e.g. pmd-level) when you
> > decide to unmap only part of it and there isn't a safe way to do that on
> > arm64 without transiently unmapping the entire block, which can lead to
> > fatal translation faults during that window.
> 
> I agree with you here, what I am rather trying to find if on arm64 there
> is any possibilty to have a generic allocator for unmapped pages. That's
> the use-case here as well as what Brendan't patch-set was trying to address.
> 
> > 
> > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > how Brendan is doing it for x86?
> > 
> > Because arm64 != x86? Presumably x86 doesn't have the strict
> > break-before-make requirements we have on arm64.
> > 
> 
> Sure, sounds like you are eluding to that the generic MM flag
> __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> 
> -Sumit
