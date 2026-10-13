Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C23FC5B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884289; cv=none; b=JxPAzAeio32mfAQP89PHLYjWtYTjgNAuPCewYSnt7IHnHLZehGgIlS/xX2BJUooisKM29kwrwlBN/Nq+1gGFYftv6sZ9JU8Fm+Hpd0AD9/4V/5WlFy4EmCcMc/3S23VhZQw1pAv0lD9UJLm4AgJqd0ptLuwDEfuXzILgTk33Eco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884289; c=relaxed/simple;
	bh=8PSxlgB1MhX1jN/IO/b9YvOnW2qaH4L30mn3Qh5Ixk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jg8IRkI7HqLqbfkkcKwAIIXLcnPjqdf/3UnCS+9gRTWyMNuevQAkcNmeAQqO+JgCcrS+OxC6imA6NkYsDDhC5hZbP0ugdliBqo+5IB1NJLVhT0XgyxDtNSMZfyn20ruRUvMZ2E80Ml0L0bI0476lQZ7GH1vjNbEiXNFQa7QB94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=APD9cjJ8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="APD9cjJ8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so32878975e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884285; x=1792489085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTxQfKp3tqhTG4A8e3eA1UWYq0qoe3PSOMQA99g87ls=;
        b=APD9cjJ8IyWGJRb4VjyiLjZcEuT0O27WLgQnT/nIGrVSc8FuFp6Ndtjb5gtkbYc1OA
         s7ISXwHxUS1yQoSahG961TT4f5MRoxXh6q8+otBG5FhL/y6wWufifOkNYRrJKHPwq6SU
         RJ4HJvA+/2HKRbhMvTS0tjLUHgjEVTDJnXtAZoJUyE7Q3eFpA+18qtDgmpcvhkswJyPp
         DC8jfS0enDFj+/dkcgE07bQ0g71mgGhY/HfHzKhYPtVTvHrDjfFUopmRhSoHbVLjRNrf
         XzQtpz3DW0omdOQzl/DGAfQToT0Uk1AQnXTw0nnekLppfxTCYbWT4YWJhB95WIa48KR9
         fB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884285; x=1792489085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTxQfKp3tqhTG4A8e3eA1UWYq0qoe3PSOMQA99g87ls=;
        b=A292Xce8/8c1yrUKJWscOKcbc+PCQyVZDA/ov0iCRG/m7niWK6chXy3WutlxMfVNaU
         sIRWuwALiG6nyfXA0pPblaw2c0uuVgLaw48t+O35N3gXD6vC8SR7O1woomLYZeChkW9V
         oRoDwGD9YAOrtalft2ztJGuCpue/tFiamU2RTVyl1lQlZGu3vQFRM+XReyovB0oj4fuu
         0vYCXKYDbAPw5K+6iBr8AQR3Wt0F6fCGzvdWRGurKBAZU+KPyiGBLJUQGLZyh9OD4uh4
         ocR8SF//RoMy7ortI5ePyxWAavK77pFpY5QCxNFCdO7X4DbCzCCneI4bP0SUfk9gBU5+
         jwEA==
X-Forwarded-Encrypted: i=1; AKwUvBwyYL3yCYnzMPjDqTYjv+4KnvKhO+k25LuiQevtMg30AD11kkM2MK9/1EhXyPeFu0P+PTQsUc0wOgdkW7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWsfHZ6Z69XTCfSwm6rhjWsYj5/a0BSuEMqjA/kgTcAPYnLRTb
	UaNkGcUvvnXQ8dpyioasTr9+er6wwn04DAgIV91jospb8HvW5XyTDtmQGibJm+CK/A==
X-Gm-Gg: AYBFou0u0ziHib1GYOvHEQQYuU5ZsHGh1T0zqe2LR3/t88SEvn009pOU1vegZB86HmX
	rIaVxXgDq7vGz3s7mgvf/iwHr9UXQPbbhB0aBfQT76Cu5MdkGS2r1k45ZSareGvll8Ixi214Ulr
	maDhSLaKJ5oUxhUIwIBxfuuQW7P2Ln3z+HNAtDga/7pSbEijUABOtSc/lFTO+EmiAhzE/YZu7uA
	b59H6AzvG7C2qFn8lGNeKH4WC+tDl9jxb1cvMM+Rvi1MtislYajR2wWPBpCc6wZLJ6q54unIyt0
	xyB7mpucY7ny7SI8Hv6oHhmuW4RdoW/JwEtBb7u1kLcignYocCdMgZZRrbhZYESsCDQTzXZaLFh
	fH5OWB36AHFhfJvt4osfPj54fgCkMO9mKi/FmteP99juogq3SNBEo5qDTyoa0eHcQvB+cs08qr2
	U2rar9mUumi+VK+MwXqmpSYV5rs7/ZdIjMaJ/dy6zCqB3goEH28JKHFqHfmp1sVkReDYPF8JnMm
	z0Z+N+e5ycoy45Z9/3iwmJnI2jCl0pnDPqGsbkJZBM=
X-Received: by 2002:a05:600c:c049:b0:4a1:9a97:c88 with SMTP id 5b1f17b1804b1-4a19a971118mr97040485e9.5.1791884284684;
        Tue, 13 Oct 2026 02:38:04 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm4646155f8f.15.2026.10.13.02.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:38:04 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:37:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <as3798SFCfKFirag@google.com>
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aszdnInyJxLhSQRp@sumit-xelite>

On Mon, Oct 12, 2026 at 06:46:12PM +0530, Sumit Garg wrote:
> On Mon, 05 Oct 2026 at 12:02:55 +0100, Vincent Donnefort wrote:
> > Sorry, not sure why Sumit's email was dropped...
> 
> The problem was with my mutt config, it should be fixed now.
> 
> > 
> > On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
> > > On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
> > > > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
> > > > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
> > > > > > Looks like you dropped me from your reply.
> > > > >
> > > > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
> > > > > CC list to To: and drops you. I suspect the same thing happened to Thierry
> > > > > when he replied here:
> > > > >
> > > > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
> > > > >
> > > > > I can't figure out why that's happening :/
> > > > > I manually tried to fix the To: and Cc: lines in this message.
> > > >
> > > > Thanks.
> > > >
> > > > >
> > > > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
> > > > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
> > > > > > > for arm64 because it relies on being able to unmap arbitrary parts of
> > > > > > > the linear map, which isn't generally possible unless you force pte-level
> > > > > > > mappings for everything, which is prohibitive for perf/power.
> > > > > >
> > > > > > As per the cover letter it's about allocating pages that are not present
> > > > > > in the direct map. This essentially fits the protected DMABufs use-case
> > > > > > where we don't want any kernel mapping to exist at any time. Bufers
> > > > > > allocated from protected DMABufs are only meant to be accessed by the
> > > > > > TEE implementation or HW accelerators like in the secure media pipeline.
> > > > >
> > > > > That sounds like it should probably build on top of this series, then.
> > > >
> > > > The main problem I see with this series is it tries to move from the generic
> > > > CMA allocator to a reserved FF-A CMA pool which again comes from the
> > > > DT. We already support reserved pool allocations via "no-map" which are
> > > > discovered dynamically from OP-TEE.
> > > 
> > > I can't think of a way around a DT declaration. We need to know what region is
> > > PTE-level before the direct map is installed and of_reserved_mem is very handy
> > > for that purpose. And as this PTE-level mapping is costly we certainly only want
> > > to enable it for platforms that absolutely need it.
> > > 
> 
> I am rather thinking of a way to turn the default CMA allocator to be
> PTE-level mapped. Since the overall idea for this dynamic protected
> buffers was to reuse memory efficiently, otherwise the reserved buffer
> approach is already there to use as "no-map" via DT.

When the default CMA allocator is setup, it is already too late
(dma_contiguous_reserve() is called after map_mem()). I am not sure this can be
reordered easily due to the dependency on dma_limits_init().

So the only case it would work would be when a reserved memory has set
"linux,cma-default". 

-- 
Vincent

> 
> If we can have "cma_unmap" cmdline option alongside "cma" then it can
> turn the existing default CMA allocator to support unmapping buffers.
> Not requiring a DT change at all, although we can have the DT property
> for the default pool too if platforms want to opt for.
> 
> > > >
> > > > If we can rather support a generic CMA like allocator for arm64 which
> > > > can support unmapped allocations then I am all for it. These platform
> > > > specific reserved pools isn't a scalable solution.
> > > 
> > > What do you mean by generic CMA allocator here? An extension to
> > > shared-dma-pool? Or having the CMA automatically doing the unmap/map on
> > > cma_alloc() cma_release()?
> > > 
> > > Right now I have created an API for the unmapping/remapping part. It adds a
> > > burden on the caller, but the alternative solution is introducing post-alloc
> > > pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
> > > the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
> > > 
> 
> I am not too worried about where the actual implementation lives but
> looks like CMA driver to be the better place. I think use-cases like
> guest_memfd proposed as a user for __GFP_UNMAPPED on arm64 will also be
> looking for this feature.
> 
> -Sumit
> 
> > > 
> > > >
> > > > > You could allocate the DMABufs from a CMA region that has no linear alias.
> > > >
> > > > Allocation from generic CMA pool is already the case here:
> > > >
> > > > tee_shm_alloc_dma_mem() ->
> > > >   dma_alloc_pages()
> > > >
> > > > Do you mean it's just fine to unmap buffers allocated from generic CMA
> > > > region since it doesn't have any linear alias?
> > > >
> > > > >
> > > > > > > Vincent's series tackles that by using a pool so that only that part of
> > > > > > > memory requires the pte-level mappings in the linear map. That's the
> > > > > > > whole point of it, so I don't think it makes sense to drop it in favour
> > > > > > > of Brendan's approach (which doesn't work).
> > > > > > >
> > > > > >
> > > > > > For protected DMABufs, we even don't require any pte-level mappings in
> > > > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
> > > > > > for performance sensitive secure media pipeline use-cases. That's why if
> > > > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
> > > > > > be the best fit for this use-case.
> > > > >
> > > > > The point is that you will require pte-level mappings for the linear map
> > > > > if you want to unmap from it at runtime on arm64. If you don't, then you
> > > > > can end up needing to split a block mapping (e.g. pmd-level) when you
> > > > > decide to unmap only part of it and there isn't a safe way to do that on
> > > > > arm64 without transiently unmapping the entire block, which can lead to
> > > > > fatal translation faults during that window.
> > > >
> > > > I agree with you here, what I am rather trying to find if on arm64 there
> > > > is any possibilty to have a generic allocator for unmapped pages. That's
> > > > the use-case here as well as what Brendan't patch-set was trying to address.
> > > >
> > > > >
> > > > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
> > > > > > how Brendan is doing it for x86?
> > > > >
> > > > > Because arm64 != x86? Presumably x86 doesn't have the strict
> > > > > break-before-make requirements we have on arm64.
> > > > >
> > > >
> > > > Sure, sounds like you are eluding to that the generic MM flag
> > > > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
> > > >
> > > > -Sumit
> > 
> > -- 
> > Vincent
