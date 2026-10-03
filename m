Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E231E824;
	Sat,  3 Oct 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014674; cv=none; b=rVI5u7pDwYuaeEDfBaXy0O3k6N6GI2juI1zk94ePvkoIKvRYdMK+FhEBUTZSb/TZWMehd30uemXLuwv8gjNA9La6rltpcRkM52DgQBDa3kssresJGpuCk9hDoDHZz6jhs5NGhWbY2kRTXzYaPAWbNE38xfwxqHpkg6yO4z9kxYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014674; c=relaxed/simple;
	bh=yV/52dZBB0VP8mn25o4WNyT0wMzlQHS2a4xwydHAxI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOgQt/fBDaAbG5tcpOC1a1ZCoceIZge2jZQK5rB1de8ZAi/ujYX8oT3yXoUgxlj2clc4JMyGchtUPh2cEhD4fxOL8Lcr/3fPSf+E2ridknYiY7piuPvWECJsiFPJicWRYU176lDHSW5siuwBce8dyE+26Sb+eopFmsn1f9xSXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGioztog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGioztog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415811F0089B;
	Sat,  3 Oct 2026 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791014673;
	bh=XZ1ACE1iiEOWgp7+NtU6aPFkdBsKv+iKHALcIjSYOOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGioztogeXvRuQANr3O6EblEFmnhMq/cfk4R+zBZ7mmMqJ6WjV1S4LSyRx8zonfuM
	 SX5NOZeWDwA4ynSw9lYh8DzyDSjzPZQpXKMIc3SRtAdLKbJWtbDAewwCJ1BwzGSAt5
	 k/wbSzi3cQuIf9ofHrBzAkLoScfp1WAdQE1bsEMnaed/4uPubDR6QrgYqJ5PnW+7SF
	 RprAMopotlmIiH8/INHpzGgZsgseVHmlKBoJ17PUHqPrmN9dw2yYu6fnElZJm3drDT
	 YpPk794DCCKAs0T9wXridN3r72p/L93oso82oTxJpleKZbCwTZC0llZK3aS4y0Xy+S
	 8eLwU5at7RJXw==
Date: Sat, 3 Oct 2026 10:04:28 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Wandun <chenwandun1@gmail.com>
Cc: robh@kernel.org, saravanak@kernel.org, m.szyprowski@samsung.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved
 memory
Message-ID: <asC3DBvtlcO5AVsz@kernel.org>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
 <arJA6fOMetzoBhDH@kernel.org>
 <060fb694-ba1d-40e7-8a18-f32d5a4039ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <060fb694-ba1d-40e7-8a18-f32d5a4039ab@gmail.com>

On Tue, Sep 22, 2026 at 05:24:32PM +0800, Wandun wrote:
> 
> 
> On 9/22/26 16:48, Mike Rapoport wrote:
> > On Sun, Sep 20, 2026 at 05:28:47PM +0800, Wandun Chen wrote:
> >> From: Wandun Chen <chenwandun@lixiang.com>
> >>
> >> This series fixes several error-handling issues in the reserved-memory
> >> initialization paths.
> >>
> >> The first two patches fix cleanup of no-map regions after driver
> >> initialization failure.
> >>
> >> Static reserved-memory nodes are reserved during the early DT scan but
> >> initialized later. The third patch tags regions whose early reservation
> >> succeeded, so the late scan can skip the nodes whose early reservation
> >> failed.
> >>
> >> The last two patches reject overlapping static regions. Without
> >> these checks, overlapping nodes can be initialized over the same
> >> physical memory, result in data corrupt.
> >>
> >> Sashiko reported these issues in [1] [2] [3].
> >>
> >> [1] https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org
> >> [2] https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org
> >> [3] https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org
> >>
> >> v2 --> v3:
> >> 1. Rework the mechanism that checks in the late scan whether the early
> >>    reservation succeeded (patches 3-5, suggested by Marek, thanks).
> >>
> >>    Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
> >>    the early reservation of a static region succeeds and checked in the
> >>    late scan.
> > 
> > Can we keep this local to of_reserved_mem please?
> 
> Probably not. I do not see a way to keep this entirely local to
> of_reserved_mem while handling the issue robustly.
> 
> I previously implemented an approach in of_reserved_mem that records
> static reserved-memory nodes whose early reservation failed in a local
> array [1]. However, the early scan runs before paging_init(), so the array
> cannot be dynamically expanded. If the number of failed nodes exceeds
> the array size, some failures cannot be recorded and the issue remains,
> and that is why Marek said "partial solution", although in practice
> having that many failed nodes is unlikely.

Even before paging_init() there is memblock_alloc().

> To handle this robustly, the late scan needs a way to determine whether
> the corresponding early reservation actually succeeded. Current approach
> uses memblock to retain that state.

I can't say I like the idea of keeping this state in memblock.
This add flags and code to memblock to deal with corner cases of bad
firmware that reports weird memory layouts, and once there is a flag in
the common infrastructure, people tend to abuse it.
 
> 
> [1] https://lore.kernel.org/lkml/20260818092420.2859026-1-chenwandun1@gmail.com/
> 
> 
> Best regards,
> Wandun
> 
> >  
> >>    Patches 4 and 5 are reworked to reject regions that overlap or are
> >>    contained by an existing reservation. The code makes a little different
> >>    from what was acked in v2, so the Acked-by tags for these patches are not
> >>    carried over.
> >>
> >> 2. Reorder the patches: the two cleanup fixes in v2 now come first.
> >>    In v3, the first patch now introduces the 'dynamic' distinction in
> >>    fdt_init_reserved_mem_node(), which the following patche 3 build on,
> >>    so the series reads more fluently.
> >>
> >> v1 --> v2:
> >> 1. Rework failed-node tracking in patch 1: do not track zero-sized nodes,
> >>    and keep a reserved_mem slot when tracking overflows.
> >> 2. Reject static reserved regions overlapping existing no-map regions.
> >> 3. Keep MEMBLOCK_NOMAP flag for static no-map regions when init failure.
> >>
> >>
> >> Wandun Chen (5):
> >>   of: reserved_mem: release dynamically allocated no-map region on init
> >>     failure
> >>   of: reserved_mem: retain static no-map memory on init failure
> >>   of: reserved_mem: skip init for regions whose early reservation failed
> >>   of: reserved_mem: reject static regions overlapping no-map memory
> >>   of: reserved_mem: reject static mapped regions overlapping existing
> >>     reservations
> >>
> >>  drivers/of/of_reserved_mem.c | 86 +++++++++++++++++++++++++-------
> >>  include/linux/memblock.h     |  7 +++
> >>  mm/memblock.c                | 95 ++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 170 insertions(+), 18 deletions(-)
> >>
> >> -- 
> >> 2.43.0
> >>
> > 
> 

-- 
Sincerely yours,
Mike.
