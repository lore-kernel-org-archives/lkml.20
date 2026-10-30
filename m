Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341838;
	b=NEt5h1rznkhq68NTdpxKDs/wb/fmgqg/rFVxDWSa3IBknGdD5mR1WOfWptsVkZL/srhJ
	 m7HuQrIFt0Jbv48N0MJSfKODp5ZphcVXS/De/E0E10Qev/4yg9GF+9dt/+HqdGDJH/gDj
	 1dBjBByQFZA98okflfETWCIlzvivnFRSQEseC5I7flylI37xIx8HPkRgSrlshLvJM56OG
	 xQouYoRIK4SValdM5EjO0Ada2TkFbese7EHFkOsNIMt9GToP1MTqHLqzX3UlwoxEbate6
	 YVGFNKZbefhhc95aujk9gX58eIzcgpMe2fTxhe/1yWQcUrW5DnPdzD6stTPjW+s1sGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341838;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jXsG3Bm3ThhpjhFlxafNV8M+YNu9Kp2OePgNmcC2wD4=;
	b=kNWzqDd47fRJdLPdocvtWQAUNlhKx/qX9i9Xqc+As70Ae1Q1UCADuTrJfZyPVB7U7USp
	 cT5UWuNXWc90p90MTCNC8PtTAgCZgYl5GnD6KUQlG9UHovIImtbvQThbrPxxgR5uT1YfG
	 hXXm1ViiCsZJv3r01v99xFN8de2OUusencWiQh3SaL/KiASDGm3EGuLeaOXtHoN/hfQiI
	 o9pWQN/ZDXZD1+8E0cNinhNDA5NWwxk7IbEsYCJdR8PgRJWgZxt2/RpkDN7ZeagFub8sd
	 d5s+7qYRfYXiN0JY+Fb9rkg4ETGLc7POo1/q9+CzcHfjg9b/9alFsOv4wDUX6J/PJjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SF2VKtXy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F820606A31A;
	Fri, 30 Oct 2026 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SF2VKtXy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930F41F000C1;
	Fri, 30 Oct 2026 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341837;
	bh=jXsG3Bm3ThhpjhFlxafNV8M+YNu9Kp2OePgNmcC2wD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SF2VKtXy3Tcav//c/ZbiM7OBFszrk22o0EfYrTQOXgc3yuzSEPUeMvqpEgyM+6kiu
	 vkWNPmsnBCiMVDKDhXLQ4FuFBe9DazZdJPo1ZnhamUejtRdhoakYpeqK6gGJp14Ge5
	 wGUPngb1zKG/kCp9c3MVxPX6skQwFQBNXioGeqguSTfF+7x7tPxJQxMog8AII+uOns
	 OCcOBwrD1lIPEshFbgi2zObUOUnZtQMauzHpKG5irl2bPydGurZFua+X5r5AfL0qJj
	 xqeYFe+rnEQYIKF73VtFQ4bIz+2hx5En9sRSkt5azOfeLobIDBjXGwc/LvUrsgY8sA
	 iIzvAH2F3T8tA==
Date: Fri, 30 Oct 2026 12:00:28 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Will Deacon <will@kernel.org>,
	brendan.jackman@linux.dev, catalin.marinas@arm.com, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <auQ5hCdPFz0BmvDG@sumit-xelite>
References: <arKW_91EeKA-w96m@willie-the-truck>
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auILvMVSXk9pZh6M@google.com>

On Wed, 28 Oct 2026 at 14:50:36 +0000, Vincent Donnefort wrote:
>On Tue, Oct 13, 2026 at 03:26:30PM +0530, Sumit Garg wrote:
>> On Tue, 13 Oct 2026 at 10:37:59 +0100, Vincent Donnefort wrote:
>> > On Mon, Oct 12, 2026 at 06:46:12PM +0530, Sumit Garg wrote:
>> > > On Mon, 05 Oct 2026 at 12:02:55 +0100, Vincent Donnefort wrote:
>> > > > Sorry, not sure why Sumit's email was dropped...
>> > >
>> > > The problem was with my mutt config, it should be fixed now.
>> > >
>> > > >
>> > > > On Mon, Oct 05, 2026 at 11:48:00AM +0100, Vincent Donnefort wrote:
>> > > > > On Thu, Oct 01, 2026 at 06:04:06PM +0530, Sumit Garg wrote:
>> > > > > > On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
>> > > > > > > On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
>> > > > > > > > Looks like you dropped me from your reply.
>> > > > > > >
>> > > > > > > Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
>> > > > > > > CC list to To: and drops you. I suspect the same thing happened to Thierry
>> > > > > > > when he replied here:
>> > > > > > >
>> > > > > > > https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
>> > > > > > >
>> > > > > > > I can't figure out why that's happening :/
>> > > > > > > I manually tried to fix the To: and Cc: lines in this message.
>> > > > > >
>> > > > > > Thanks.
>> > > > > >
>> > > > > > >
>> > > > > > > > On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
>> > > > > > > > > I spoke to Brendan at LPC (?) last year but this doesn't really work
>> > > > > > > > > for arm64 because it relies on being able to unmap arbitrary parts of
>> > > > > > > > > the linear map, which isn't generally possible unless you force pte-level
>> > > > > > > > > mappings for everything, which is prohibitive for perf/power.
>> > > > > > > >
>> > > > > > > > As per the cover letter it's about allocating pages that are not present
>> > > > > > > > in the direct map. This essentially fits the protected DMABufs use-case
>> > > > > > > > where we don't want any kernel mapping to exist at any time. Bufers
>> > > > > > > > allocated from protected DMABufs are only meant to be accessed by the
>> > > > > > > > TEE implementation or HW accelerators like in the secure media pipeline.
>> > > > > > >
>> > > > > > > That sounds like it should probably build on top of this series, then.
>> > > > > >
>> > > > > > The main problem I see with this series is it tries to move from the generic
>> > > > > > CMA allocator to a reserved FF-A CMA pool which again comes from the
>> > > > > > DT. We already support reserved pool allocations via "no-map" which are
>> > > > > > discovered dynamically from OP-TEE.
>> > > > >
>> > > > > I can't think of a way around a DT declaration. We need to know what region is
>> > > > > PTE-level before the direct map is installed and of_reserved_mem is very handy
>> > > > > for that purpose. And as this PTE-level mapping is costly we certainly only want
>> > > > > to enable it for platforms that absolutely need it.
>> > > > >
>> > >
>> > > I am rather thinking of a way to turn the default CMA allocator to be
>> > > PTE-level mapped. Since the overall idea for this dynamic protected
>> > > buffers was to reuse memory efficiently, otherwise the reserved buffer
>> > > approach is already there to use as "no-map" via DT.
>> >
>> > When the default CMA allocator is setup, it is already too late
>> > (dma_contiguous_reserve() is called after map_mem()). I am not sure this can be
>> > reordered easily due to the dependency on dma_limits_init().
>>
>> Yeah I saw that constraint too, let's leave it for future extension
>> then although having this reordering dependency fixed will be ideal.
>>
>> >
>> > So the only case it would work would be when a reserved memory has set
>> > "linux,cma-default".
>> >
>>
>> Let's rather just turn DT based default CMA pool to support PTE-level
>> mapping and keep it configurable via Kconfig or cmdline or DT.
>
>If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
>necessary.

Agree, it rather makes sense for DT independent generic CMA pool.

>
>Also, Rob wasn't very keen on having a DT option for the reserved memory and
>suggested to have a compatible string instead [1]. So perhaps we could have a
>a separate driver that handles the unmapping.
>
>	linux,cma {
>		compatible = "shared-dma-pool", "unmap-on-alloc";
>		reusable;
>		linux,cma-default;
>		...
> 	}
>
>That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
>(to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
>map.
>
>The nice property is optee won't need to be modified anymore. The downside is
>the entire pool is now mapped at PTE-level.

Sounds reasonable to me. If folks are really worried about performance
with generic CMA PTE-level map then OP-TEE already supports no-map based
reserved carveouts for protected DMABufs too.

-Sumit

>
>[1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
>
>-- 
>Vincent
>
>>
>> -Sumit
>>
>> > >
>> > > If we can have "cma_unmap" cmdline option alongside "cma" then it can
>> > > turn the existing default CMA allocator to support unmapping buffers.
>> > > Not requiring a DT change at all, although we can have the DT property
>> > > for the default pool too if platforms want to opt for.
>> > >
>> > > > > >
>> > > > > > If we can rather support a generic CMA like allocator for arm64 which
>> > > > > > can support unmapped allocations then I am all for it. These platform
>> > > > > > specific reserved pools isn't a scalable solution.
>> > > > >
>> > > > > What do you mean by generic CMA allocator here? An extension to
>> > > > > shared-dma-pool? Or having the CMA automatically doing the unmap/map on
>> > > > > cma_alloc() cma_release()?
>> > > > >
>> > > > > Right now I have created an API for the unmapping/remapping part. It adds a
>> > > > > burden on the caller, but the alternative solution is introducing post-alloc
>> > > > > pre-dealloc callbacks in the CMA, which looked a bit overkilled to me when
>> > > > > the users of that "ffa-pool" are only optee and the nvidia video dma-buf heap.
>> > > > >
>> > >
>> > > I am not too worried about where the actual implementation lives but
>> > > looks like CMA driver to be the better place. I think use-cases like
>> > > guest_memfd proposed as a user for __GFP_UNMAPPED on arm64 will also be
>> > > looking for this feature.
>> > >
>> > > -Sumit
>> > >
>> > > > >
>> > > > > >
>> > > > > > > You could allocate the DMABufs from a CMA region that has no linear alias.
>> > > > > >
>> > > > > > Allocation from generic CMA pool is already the case here:
>> > > > > >
>> > > > > > tee_shm_alloc_dma_mem() ->
>> > > > > >   dma_alloc_pages()
>> > > > > >
>> > > > > > Do you mean it's just fine to unmap buffers allocated from generic CMA
>> > > > > > region since it doesn't have any linear alias?
>> > > > > >
>> > > > > > >
>> > > > > > > > > Vincent's series tackles that by using a pool so that only that part of
>> > > > > > > > > memory requires the pte-level mappings in the linear map. That's the
>> > > > > > > > > whole point of it, so I don't think it makes sense to drop it in favour
>> > > > > > > > > of Brendan's approach (which doesn't work).
>> > > > > > > > >
>> > > > > > > >
>> > > > > > > > For protected DMABufs, we even don't require any pte-level mappings in
>> > > > > > > > linear map. The whole idea of mapping and unmapping is just a bottleneck
>> > > > > > > > for performance sensitive secure media pipeline use-cases. That's why if
>> > > > > > > > we can support __GFP_UNMAPPED with the memory allocator on arm64 would
>> > > > > > > > be the best fit for this use-case.
>> > > > > > >
>> > > > > > > The point is that you will require pte-level mappings for the linear map
>> > > > > > > if you want to unmap from it at runtime on arm64. If you don't, then you
>> > > > > > > can end up needing to split a block mapping (e.g. pmd-level) when you
>> > > > > > > decide to unmap only part of it and there isn't a safe way to do that on
>> > > > > > > arm64 without transiently unmapping the entire block, which can lead to
>> > > > > > > fatal translation faults during that window.
>> > > > > >
>> > > > > > I agree with you here, what I am rather trying to find if on arm64 there
>> > > > > > is any possibilty to have a generic allocator for unmapped pages. That's
>> > > > > > the use-case here as well as what Brendan't patch-set was trying to address.
>> > > > > >
>> > > > > > >
>> > > > > > > > Now the question is why arm64 can't support __GFP_UNMAPPED similar to
>> > > > > > > > how Brendan is doing it for x86?
>> > > > > > >
>> > > > > > > Because arm64 != x86? Presumably x86 doesn't have the strict
>> > > > > > > break-before-make requirements we have on arm64.
>> > > > > > >
>> > > > > >
>> > > > > > Sure, sounds like you are eluding to that the generic MM flag
>> > > > > > __GFP_UNMAPPED being proposed can't be supported on arm64, right?
>> > > > > >
>> > > > > > -Sumit
>> > > >
>> > > > --
>> > > > Vincent
>> >
>
