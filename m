Received: from mail-wr2-f37.google.com (mail-wr2-f37.google.com [74.125.225.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BB47ACFD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198186; cv=none; b=J2t9zaxQFEDAa5WByXR5/KfLn4k0CE3p6CwfKIRiPO38Ozu7niwvm1rApuqUeWHnV0whDY5plvl46N8ADgKQwGPVnBGbwkJnYUwOASf4VWEoZEz1BmcO2YZiQQtwkiGZdhwX0Un0vWp+YQma4DLGU55qYdquaGgiP21d8sgwdq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198186; c=relaxed/simple;
	bh=XggvK/mbkYFgVJaPngBSf0EJ89oLS951tOm4dDdAJ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3KztFwHWYo3W54C1XD0NBmM7Fd9rrUAzKdjrZ3t+/4g0P7qBnWboqu2PSsFDyr+t9SJmRDwtxUudquuQklW9u1POvcCexgclfMvna0qxB0vi4BGCNCtrIaGwNbsD1rlKq4bxSiCQEvSPzxPtn/4DGhzIbVTLqI0GnH6DB1fWOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V07ai6EV; arc=none smtp.client-ip=74.125.225.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V07ai6EV"
Received: by mail-wr2-f37.google.com with SMTP id ffacd0b85a97d-4887840c529so530945f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198182; x=1791802982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wpVjroXVisHfj83brLQUbqEhnPiyl/yiKfc5znuepio=;
        b=V07ai6EV+5DickJ3HEAl+FsOxkKH0Jd8Ff8Ske9zs+EWzLZinUatnJ3QnDX5ldUlkH
         ZMb5t2yyGZuRH09l7knWwNpgfyJw1qZDutA0zupmnzlT+ny0fX98zK/Rq5SCMMYrEyZW
         SjJ5U11VDtYJq5JXF9s5mVdFWJMDYHsMElMnPOjgY8kVSJDNQO8Oxo8N1BYvQjNUgxoC
         aiorG2Ui08OyWRz8X1MjdO4xu+vVHH4EAJOwNs5cNZ8h7Ips5qH0FTYUHX3KhQ5wgn2x
         APQB4JiiOdjlHKxmRLzR96Q2wxo+hYOwglr+bPKPdrGvg0ZKY5RwVRpPeo+Pd7T7qgeb
         z2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198182; x=1791802982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpVjroXVisHfj83brLQUbqEhnPiyl/yiKfc5znuepio=;
        b=oi/zLs5tV5E5VEuBYO6IRjKrPFU3G1ezaI4fMai+b34QAEztU5Z4R2v280ITWrwepu
         T3vSKO7UL32yNSlb9toKFq8Nvd2tZkH0olZnOUGh37e/NJJbLyLwdHyw/eI0xLmL7ZTl
         KIxkkNiqSqC6zXSO8Xa4AH3Q7ZndGzFKnJkvuhROLNQgE9ouUCOfeSj/+GsdzuppyhPz
         t0MbQd7JHBZJTd8DBbs+cvsdZA6GTwuDRTpMysmFIa5ClK7jCQ198UyYvYDabG7QH5z4
         ldkP0ESILHpV8qR7LRJX8pLczsBsk3VsILvMsY71sYOIBAmPKXfqTJRuKbiObfSc8tyA
         5vYg==
X-Forwarded-Encrypted: i=1; AKwUvBxOtSokf7gdX0DPn14lexuGWn5rmdejLZiMnZ3I/DB+rbOwDrISrsjUD0RK7xVBJotGs9tD9E/uIo1DpXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrGb/57VyNa7jd9sCi31MjSIQ+/beT9ttVwabooyp1a5dLiktw
	3XMCKT0jnAosvqMgpsgM3zGgqeB6raDO89pJGQy5FtaUNkjFHcSznSfu/IaXNJR0rw==
X-Gm-Gg: AYBFou2DDvjhd/KjqmKf57m6wAXxt6v6iiPW+C7KP4bXycNYk7J24uACGQTdjQyeJlO
	RDoRnPfiCb8/lokPgzVEaCkfZT1R4O1JmXnRlJdxRB/RXQ9vl/SZI1oLeb1d9HEq+QXsH/r88zm
	ZVVVyVkctnK7P6gFvnelWjf6WCuWWHY3K+IsTqB1RuF5ybmlddQj8WLYU/MZnTBie1y6TIkPov2
	5Im3WxpfRgCSquRpXWxaiweDP3LD6SYrKX4vWFs/3iG4UMCqzvgl7VF4qRgkySX61uo97dEu+wJ
	vsbTDS1aNTyeIqMmseNULy7hxOewYsccLA26sjblLi3b7uD37dEy/gu4oCR14yT7gt/L44KCcqm
	KhX1Q7+qdHDl7c/Ebhr3ClNRsiIwgcEjK0Lpfht80s1iXKpvIaN4hxglSDqH6PvseGgOZ5HGh5N
	pXOyjT7MfrUdCb+cTB1oRWzPV1KiDqVETwEh5SmvjPGhS8Ap8Ht2EValWCEVOsp6YYUI9YHD17p
	F4qTb8+xdJiFM8jLqrv3Dfow44zedmMEqJ51B8GU90=
X-Received: by 2002:a05:6000:2906:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48b12733c50mr18086704f8f.10.1791198180653;
        Mon, 05 Oct 2026 04:03:00 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6227fa65sm2880630f8f.16.2026.10.05.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:02:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 12:02:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sumit.garg@kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <asOD31rTX6dNfD1o@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asOAYODGZa-7EIV1@google.com>

Sorry, not sure why Sumit's email was dropped...

On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
> On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > > Looks like you dropped me from your reply.
> > > 
> > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > > when he replied here:
> > > 
> > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > > 
> > > I can't figure out why that's happening :/
> > > I manually tried to fix the To: and Cc: lines in this message.
> > 
> > Thanks.
> > 
> > > 
> > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > > the linear map, which isn't generally possible unless you force pte-level
> > > > > mappings for everything, which is prohibitive for perf/power.
> > > > 
> > > > As per the cover letter it's about allocating pages that are not present
> > > > in the direct map. This essentially fits the protected DMABufs use-case
> > > > where we don't want any kernel mapping to exist at any time. Bufers
> > > > allocated from protected DMABufs are only meant to be accessed by the
> > > > TEE implementation or HW accelerators like in the secure media pipeline.
> > > 
> > > That sounds like it should probably build on top of this series, then.
> > 
> > The main problem I see with this series is it tries to move from the generic
> > CMA allocator to a reserved FF-A CMA pool which again comes from the
> > DT. We already support reserved pool allocations via "no-map" which are
> > discovered dynamically from OP-TEE.
> 
> I can't think of a way around a DT declaration. We need to know what region is
> PTE-level before the direct map is installed and of_reserved_mem is very handy
> for that purpose. And as this PTE-level mapping is costly we certainly only want
> to enable it for platforms that absolutely need it.
> 
> > 
> > If we can rather support a generic CMA like allocator for arm64 which
> > can support unmapped allocations then I am all for it. These platform
> > specific reserved pools isn't a scalable solution.
> 
> What do you mean by generic CMA allocator here? An extension to
> shared-dma-pool? Or having the CMA automatically doing the unmap/map on
> cma_alloc() cma_release()?
> 
> Right now I have created an API for the unmapping/remapping part. It adds a
> burden on the caller, but the alternative solution is introducing post-alloc
> pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
> the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
> 
> -- 
> Vincent
> 
> > 
> > > You could allocate the DMABufs from a CMA region that has no linear alias.
> > 
> > Allocation from generic CMA pool is already the case here:
> > 
> > tee_shm_alloc_dma_mem() ->
> >   dma_alloc_pages()
> > 
> > Do you mean it's just fine to unmap buffers allocated from generic CMA
> > region since it doesn't have any linear alias?
> > 
> > > 
> > > > > Vincent's series tackles that by using a pool so that only that part of
> > > > > memory requires the pte-level mappings in the linear map. That's the
> > > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > > of Brendan's approach (which doesn't work).
> > > > >
> > > > 
> > > > For protected DMABufs, we even don't require any pte-level mappings in
> > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > > for performance sensitive secure media pipeline use-cases. That's why if
> > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > > be the best fit for this use-case.
> > > 
> > > The point is that you will require pte-level mappings for the linear map
> > > if you want to unmap from it at runtime on arm64. If you don't, then you
> > > can end up needing to split a block mapping (e.g. pmd-level) when you
> > > decide to unmap only part of it and there isn't a safe way to do that on
> > > arm64 without transiently unmapping the entire block, which can lead to
> > > fatal translation faults during that window.
> > 
> > I agree with you here, what I am rather trying to find if on arm64 there
> > is any possibilty to have a generic allocator for unmapped pages. That's
> > the use-case here as well as what Brendan't patch-set was trying to address.
> > 
> > > 
> > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > > how Brendan is doing it for x86?
> > > 
> > > Because arm64 != x86? Presumably x86 doesn't have the strict
> > > break-before-make requirements we have on arm64.
> > > 
> > 
> > Sure, sounds like you are eluding to that the generic MM flag
> > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> > 
> > -Sumit

-- 
Vincent
