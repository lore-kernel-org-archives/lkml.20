Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE4481647
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791791; cv=none; b=oKMUxfNVvvctBgGNzHfrePSJm0pq++yyyiWwLjGW66tX20NXo6jvq38XhJXUjEgK510GjH8UzjJB7FVZ9w/KRZGmAB+lsWLxPqP665KJxBNqgTafNCL6uPvMXqcmshrg+V4OnWRW4Z/rbemadEeYlo2LqfMKX4EdinDIl8UeNAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791791; c=relaxed/simple;
	bh=J0n6FNetT0debjqacgno3iFuQ8IxVHZb8XLMsQnDoeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok+RE7JkfpX0wvG7v3Rk09xw3JdI8yqi44Bm1pL2e6tsrHDtcY81rSZ0vd1F32amc0WKiwq9sQuQfjFgsgEVq+Ja76fQUqmQj2lQ6Bqs6T++yelcvHyQtfNt3hLKQkxEUCRx+NvB6cMTyBfQVJof12EPb6lA7keLxOErwe8ec4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwZ4Y3EA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwZ4Y3EA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0641F00A3D;
	Mon,  7 Sep 2026 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788791781;
	bh=P3Kg5n837DJ3J6t9BGAhbWn48bBIjiawWgKaQGRPoBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kwZ4Y3EAFDceBci5/+JDost4FCO6v6ExEQloPZiqRWJa6DrOpq59BDlANcRZ5W9Da
	 0YkGiIrhMIM0Y4oA3bJVAPkVAkMh2ZDVas7JYI4vB/gxTsPFEuUMoap5+zn8l201ss
	 vIrebluu5TiTYiThICUXUVwuBhTr2+8j6uG17pIcaC1Lj4tVaIfDE0cv0ER0HX98uz
	 BePxSlC+haHMQiO2On7vvkPHUFeyRxeSZw75yBTaFsekJcP5eIqD1cV86KrTa3gu2b
	 J4NCub9aTVDwfl0AlDdoa8TdACemyKWz1brmqYF2P1K9hN4ToS6wnUkW4CYRGUNcuN
	 N3/1cVUgAH0IQ==
Date: Mon, 7 Sep 2026 17:36:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
	ljs@kernel.org, usama.arif@linux.dev, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, liam@infradead.org,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <ap7L2UEriz6DJfif@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
 <ap05ue1pq3TgHOS6@kernel.org>
 <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
 <ap5Tqu5yswJrj5UM@kernel.org>
 <69db9546-d14d-4107-96b7-30963292c2bd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69db9546-d14d-4107-96b7-30963292c2bd@kernel.org>

On Mon, Sep 07, 2026 at 01:18:42PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 08:03, Mike Rapoport wrote:
> > Hi Xueyuan,
> > 
> > On Mon, Sep 07, 2026 at 09:11:14AM +0800, Xueyuan Chen wrote:
> >> On Sun, Sep 6, 2026 at 6:00 PM Mike Rapoport <rppt@kernel.org> wrote:
> >>>
> >>>
> >>> I believe this is an historical artifact. change_memory_common() already
> >>> updates the linear map when a vmalloc mapping switches to RO and the system
> >>> supports it.
> >>
> >> On x86, set_memory_ro() does work on direct-map addresses.
> >>
> >>>
> >>> I believe arm64::set_memory_ro() can change the linear map in the general
> >>> case as well as long as can_set_direct_map() is true.
> >>>
> >>
> >> On arm64, I'm reading arch/arm64/mm/pageattr.c, and the linear-map
> >> update in change_memory_common() is only reachable for vmalloc
> >> addresses:
> >>
> >>   set_memory_ro
> >>     change_memory_common
> >>        area = find_vm_area((void *)addr);
> >>        if (!area || ...)
> >>           return -EINVAL;
> >>
> >> So set_memory_ro() on a linear-map address returns -EINVAL on arm64.
> > 
> > And I believe this is an historical artifact rather than necessity. For
> > configurations that allow set_direct_map on arm64, change_memory_common can
> > update direct map too, it just need to be implemented there.
> > 
> 
> Are we sure the other architectures do what we want in their set_memory_ro?

It's a zoo right now :(
Although most of them do.

But we need to sort it out anyway because of increasingly growing demand
for modifications of the kernel page tables.

I started something here:
https://lore.kernel.org/linux-mm/20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org/

Now that x86 CPA is nearly fixed, I can look into the next iteration.

> Having a dedicated set_direct_map_ro() with clear (documented ;)) semantics does
> not sound too crazy to me.

It's not too crazy, no.

Still making arm64 more aligned with x86 and other arches that update the
direct/linear map in the set_memory_ro() seem a good thing on it's own.
 
> -- 
> Cheers,
> 
> David

-- 
Sincerely yours,
Mike.
