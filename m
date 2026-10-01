Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315D93DA7C4;
	Thu,  1 Oct 2026 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858057; cv=none; b=XNq6vzEPvYx6VU6Ci+iHMrxyFRvDAdS07O64qOJ588lNiI2WFxlxwg/v8Gbx0LHsCn+apqyjzxbEzjt4QeyLqesOdtZHohN/wjihjEJdbqQp20i92ksuvbgnsVxpX2fmEFta+5H+Dks3kln/3MbshC7P36nIYi1t+pHZ/f3zHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858057; c=relaxed/simple;
	bh=QVF2nURRP7xz9O0Kq+Vq/PtyCz1+E71O3hLTPrAnM60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL25YSOu6ka2aZgbOvQFtnD0l9/Kj5eKgNouBC6VJMheaImyjwr79M1o14WdNLGca1PQSWWpE6F/RkYBESxGVURe045rEoKsbU7ftB8Rc4DJqTE9KwQkygaQJ5ClpUT2++WWnb2zIiuT50YhhEA3dGshG+7l4h5SYtw3u4j+V+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=if4SvAJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="if4SvAJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FD81F00898;
	Thu,  1 Oct 2026 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858055;
	bh=PzSvFLGXXhDhvscc/9MFlHIrUkWd1NO5NFV4BtnVy4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=if4SvAJ18eHheJNDIHcxsy7TV/obUhX+e28ofec1ugv6Qzf1xWPauEKNX2d5q4tTp
	 lqIuMR+qdhIvYgLNPo+Xu71RRG2jvwkgCBw9d0spl9LBDZYsQtwcfML4ZVgiSM96eu
	 NziDpTlnYQuD6PZdYxCPJL8kHi9knoo5gRcjO9s2i9wA9xfxVdbp6Yvnr/0AAd0qde
	 D8UclBqsHY5y39KB5plqsT63o4jWH8xj6VEW4Hu89PvcGeID+lsA7y6rvKVYZ9Xbb6
	 3yejC5BjkVY3QrY5fE+q8ahCPjh/bI+RcEG2FarJLbEFB9YnZ35RB5mMH9dP/3yAwJ
	 NiIHnfgpTOdfw==
Date: Thu, 1 Oct 2026 18:04:06 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: brendan.jackman@linux.dev, Vincent Donnefort <vdonnefort@google.com>,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <ar5TPvANFUoosxGW@sumit-xelite>
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
 <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aruh86rd5FMv2i9G@willie-the-truck>

On Tue, 29 Sep 2026 at 12:33:07 +0100, Will Deacon wrote:
>On Sat, Sep 26, 2026 at 05:43:08PM +0530, Sumit Garg wrote:
>> Looks like you dropped me from your reply.
>
>Huh, that's weird. If I hit reply-all ('g') in mutt, it moves the entire
>CC list to To: and drops you. I suspect the same thing happened to Thierry
>when he replied here:
>
>https://lore.kernel.org/all/arJcN60nagFKXj2Q@orome/
>
>I can't figure out why that's happening :/
>I manually tried to fix the To: and Cc: lines in this message.

Thanks.

>
>> On Tue, 22 Sep 2026 at 15:55:59 +0100, Will Deacon wrote:
>> > I spoke to Brendan at LPC (?) last year but this doesn't really work
>> > for arm64 because it relies on being able to unmap arbitrary parts of
>> > the linear map, which isn't generally possible unless you force pte-level
>> > mappings for everything, which is prohibitive for perf/power.
>>
>> As per the cover letter it's about allocating pages that are not present
>> in the direct map. This essentially fits the protected DMABufs use-case
>> where we don't want any kernel mapping to exist at any time. Bufers
>> allocated from protected DMABufs are only meant to be accessed by the
>> TEE implementation or HW accelerators like in the secure media pipeline.
>
>That sounds like it should probably build on top of this series, then.

The main problem I see with this series is it tries to move from the generic
CMA allocator to a reserved FF-A CMA pool which again comes from the
DT. We already support reserved pool allocations via "no-map" which are
discovered dynamically from OP-TEE.

If we can rather support a generic CMA like allocator for arm64 which
can support unmapped allocations then I am all for it. These platform
specific reserved pools isn't a scalable solution.

>You could allocate the DMABufs from a CMA region that has no linear alias.

Allocation from generic CMA pool is already the case here:

tee_shm_alloc_dma_mem() ->
   dma_alloc_pages()

Do you mean it's just fine to unmap buffers allocated from generic CMA
region since it doesn't have any linear alias?

>
>> > Vincent's series tackles that by using a pool so that only that part of
>> > memory requires the pte-level mappings in the linear map. That's the
>> > whole point of it, so I don't think it makes sense to drop it in favour
>> > of Brendan's approach (which doesn't work).
>> >
>>
>> For protected DMABufs, we even don't require any pte-level mappings in
>> linear map. The whole idea of mapping and unmapping is just a bottleneck
>> for performance sensitive secure media pipeline use-cases. That's why if
>> we can support __GFP_UNMAPPED with the memory allocator on arm64 would
>> be the best fit for this use-case.
>
>The point is that you will require pte-level mappings for the linear map
>if you want to unmap from it at runtime on arm64. If you don't, then you
>can end up needing to split a block mapping (e.g. pmd-level) when you
>decide to unmap only part of it and there isn't a safe way to do that on
>arm64 without transiently unmapping the entire block, which can lead to
>fatal translation faults during that window.

I agree with you here, what I am rather trying to find if on arm64 there
is any possibilty to have a generic allocator for unmapped pages. That's
the use-case here as well as what Brendan't patch-set was trying to address.

>
>> Now the question is why arm64 can't support __GFP_UNMAPPED similar to
>> how Brendan is doing it for x86?
>
>Because arm64 != x86? Presumably x86 doesn't have the strict
>break-before-make requirements we have on arm64.
>

Sure, sounds like you are eluding to that the generic MM flag
__GFP_UNMAPPED being proposed can't be supported on arm64, right?

-Sumit
