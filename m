Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F3128033B;
	Sat, 26 Sep 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790424799; cv=none; b=e6DiDdX7azltfNfehGWEkz3Ha/h70jEFYW5y2KA1bZuh3XOo2rKoArnqH5JnSyFBEMFGtT3t7/yBa/7e1UQbmmg67fdSIQgDBshQ+/TxOd/39lJTkmhungLmNKyTeKaKUL+UTJSDVsZgYewIZINEYTMx489NuSLjkySbJtw9TuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790424799; c=relaxed/simple;
	bh=BtVpA5GOENXZnZsxuXwBncCs3ISWn7QkCnNFP438S44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaiAODWZwKQK+nHOxZw7FWTLOrQvURzzvHkUgMH9tA/ojezfBwgG0MtOvF9n5Z4PC0lv75E6IxjAteKMUkOoJNh+sz7aotXDnnKRFkcSQwTBka4ILGGaBm2PGmfbDyPVJ2RLUw9lfdEcgOH+5/5RiiEW7L1EuA3AoNsvpSJiphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqVt/WH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqVt/WH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308001F000FF;
	Sat, 26 Sep 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790424797;
	bh=1iBLZkIxA8ap1qqaUdvl37Rh8tiElL4QP7IPYChkI5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqVt/WH/30yxap89q3hdsyv/l61o3KLu/CiWmh2GBWsGOMCAyDd4oeItuV0KhN+p0
	 8X1zpWVayYa47zet2Ur/sfY1kFJQbab8BoOoxfXHV/YQI1RJpJcGzgkU0qRjc535uU
	 dggfLeW1RAGQ6iAvuoLIhb9T4V0FhhXIBy9i/I8pCdGeLVYzIySIXLMOZwMi3YRe/f
	 zKl3WL7aj0w8pTnJ2Nyfs5DX0DqPx3wVLkn3TmGkc+E39Db2pmRZ/OB9D3wxZRvvWf
	 SDM2RCWwifBB//vbUuDdgvoBbZaeCV/2vJDbDTyZiZ4mMxvo0MoVSBtV+WGkAlY0zm
	 09Lh/Q+rpzwkA==
Date: Sat, 26 Sep 2026 17:43:08 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <are21BjeS1O3RYE3@sumit-xelite>
Mail-Followup-To: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	rppt@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921110050.3977591-1-vdonnefort@google.com>
 <arIYtjmSKCs14SqO@sumit-xelite>
 <arKW_91EeKA-w96m@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <arKW_91EeKA-w96m@willie-the-truck>

Adding Brendan to this thread.

Will,

Looks like you dropped me from your reply.

On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
>On Tue, Sep 22, 2026 at 11:27:10AM +0530, Sumit Garg wrote:
>> On Mon, 21 Sep 2026 at 12:00:42 +0100, Vincent Donnefort wrote:
>> > This series is a follow-up to the discussion that has started here [1].
>> >
>> > When memory is lent to the Secure world via FF-A, CPU speculative
>> > accesses from NS to the lent pages can still occur as long as it retains
>> > a cacheable mapping to it.
>> >
>> > Ideally, lent memory would be "no-map" but that would mean giving up
>> > MiBs of useful memory, so let's try to do better with the help of a CMA
>> > pool.
>> >
>> > On arm64, modifying the direct map at runtime is generally restricted
>> > because the linear map defaults to block mapping and splitting blocks at
>> > runtime may trigger fatal page fault, unless the CPU implements BBML3
>> > or the entire direct map was mapped at page granularity from boot.
>> > Forcing last-level mappings system-wide incurs a severe penalty we want
>> > to avoid. Instead, this series introduces targeted last-level mappings
>> > for designated memory regions, along with the "arm,ffa-lend-pool" CMA
>> > driver to manage unmapping and remapping on lend/reclaim transitions:
>> >
>> > 1. memblock:
>> >   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.
>> >
>> > 2. set_memory infrastructure:
>> >   - Introduce can_set_direct_map_range() to check if a specific address
>> >     range is mapped with last-level entries and can be modified safely.
>> >   - Introduce __set_direct_map_*() variants that bypass redundant checks
>> >     when the caller has already validated the range.
>> >
>> > 3. "arm,ffa-lend-pool" driver
>> >   - Introduce the "arm,ffa-lend-pool" CMA reserved-memory driver, which
>> >     unmaps pages prior to lending (ffa_prepare_lend()) and restores them
>> >     when reclaimed (ffa_lend_reclaimed()).
>> >
>> > 4. Optee support
>> >   - Hook OP-TEE dynamic protected memory pools to "arm,ffa-lend-pool" for
>> >     both SMC (via DT memory-region phandle) and FF-A (via
>> >     ffa_lend_pool_attach()) transports.
>>
>>
>> Thanks for your proposal in trying to solve this hard problem of
>> unmapping pages from kernel linear map. I remember discussing this
>> problem last year at LPC too.
>>
>> Have you had a chance to look at a more generic MM proposal around this
>> issue here [1]?
>>
>> One of the major concern for me with your proposal is tying the
>> protected memory allocation to fixed sized platform specific pool size
>> based on DT. Then the cost of granular mappings/unmapping if the
>> platforms choose to enlarge these pools.
>>
>> As you maybe aware one of the major use-cases here for protected DMAbufs
>> is the secure media pipeline use-case which is memory intensive
>> workload. IMO, the solution proposed at [1] seems to address it although
>> people have flagged rough edges there but should be addressable.
>>
>> Can you try a port of [1] for arm64 since the author did all the work
>> with x86 as reference?
>>
>> [1] https://lore.kernel.org/all/20260726-page_alloc-unmapped-v3-0-6f5729aa9832@google.com/
>
>I spoke to Brendan at LPC (?) last year but this doesn't really work
>for arm64 because it relies on being able to unmap arbitrary parts of
>the linear map, which isn't generally possible unless you force pte-level
>mappings for everything, which is prohibitive for perf/power.

As per the cover letter it's about allocating pages that are not present
in the direct map. This essentially fits the protected DMABufs use-case
where we don't want any kernel mapping to exist at any time. Bufers
allocated from protected DMABufs are only meant to be accessed by the
TEE implementation or HW accelerators like in the secure media pipeline.

>
>Vincent's series tackles that by using a pool so that only that part of
>memory requires the pte-level mappings in the linear map. That's the
>whole point of it, so I don't think it makes sense to drop it in favour
>of Brendan's approach (which doesn't work).
>

For protected DMABufs, we even don't require any pte-level mappings in
linear map. The whole idea of mapping and unmapping is just a bottleneck
for performance sensitive secure media pipeline use-cases. That's why if
we can support __GFP_UNMAPPED with the memory allocator on arm64 would
be the best fit for this use-case.

Now the question is why arm64 can't support __GFP_UNMAPPED similar to
how Brendan is doing it for x86?

-Sumit
