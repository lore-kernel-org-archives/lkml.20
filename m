Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57AA3C3F73;
	Thu,  8 Oct 2026 06:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441526; cv=none; b=gjwl6+G8F+BF22FP7mFnxWe1Ucn4n1v6OuJvtCUwPSK6wF8htvwsOz5hyFKYfTCJ4kG6+84lHCCYy5X6EO4BrVZMpAdVw/Lo3T4yUfLHXGdPN7ZfAGcgTZnbuSzZQ8YDzz7gCrP4Lo/xCYh1D2PMDR5ppLNlkT7XXO5bSORiiPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441526; c=relaxed/simple;
	bh=mrUnNoXDONCeClzizhA+PfBKBytz99Ww9uSa0wPOvGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2kDbXkaoXVF+AgKHKVyng0o09fCF7JrE/PopuWRBvNJQ34SYDORJk+3XvdFNmYJqUrrIxJWZxGw4SxvZglCx095zRwctMhcM4p6GizX+u19iRL146Py+H18VNL4FuO+gxRtQZE9wyv9kcqA3VZblVvNdXZLyvEN5/L8xhv09Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j38/YTG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j38/YTG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100691F000FF;
	Thu,  8 Oct 2026 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791441524;
	bh=/RsqwdaewrKioDzHveOJKZewBC7grld6bvE/46a8ao4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j38/YTG9lX9S2OLVXDrkb9B+8qcyyKaQeMspUhzgHXZ8OBa+qZnuSMP76709ZUhs+
	 a2No4Xym2pRTE25zOa0YSWg1zIR0kv5unhOKYSL/1ewwvfOgo4NJsFKdKsz8awTWX4
	 /6DtOBH0rcPuvqE9YaHNUMuGvM6gi5M72z4YFQzK+hsEcgkXstEWOdF23UpXTvDC1e
	 rcXu6NMXbPo8akDEKg13ENAmZ4oJ4LGXJ/exQ0zvvwBHued3rbZO1rBc8wWJ/EeQCD
	 ahpWpWePxF5W8jZpuc4bs15phLuYmjwyc3dTZ6oM5VUf+2nbrrXsgQSnnY9wHAOIMN
	 OuVHTEGQbZ1dQ==
Date: Thu, 8 Oct 2026 08:38:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Wandun <chenwandun1@gmail.com>, robh@kernel.org, saravanak@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved
 memory
Message-ID: <asc6brs_g0ky0wOM@kernel.org>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
 <arJA6fOMetzoBhDH@kernel.org>
 <060fb694-ba1d-40e7-8a18-f32d5a4039ab@gmail.com>
 <CGME20261003080438eucas1p2bdb68c248ecad088559285a4f736bfe5@eucas1p2.samsung.com>
 <asC3DBvtlcO5AVsz@kernel.org>
 <5dccea9b-a9e1-44f5-84d9-bc9efe04edee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dccea9b-a9e1-44f5-84d9-bc9efe04edee@samsung.com>

On Tue, Oct 06, 2026 at 03:26:21PM +0200, Marek Szyprowski wrote:
> On 03.10.2026 10:04, Mike Rapoport wrote:
> > On Tue, Sep 22, 2026 at 05:24:32PM +0800, Wandun wrote:
> >>>> From: Wandun Chen <chenwandun@lixiang.com>
> >>>>
> >>>> This series fixes several error-handling issues in the reserved-memory
> >>>> initialization paths.
> >>>>
> >>>> v2 --> v3:
> >>>> 1. Rework the mechanism that checks in the late scan whether the early
> >>>>    reservation succeeded (patches 3-5, suggested by Marek, thanks).
> >>>>
> >>>>    Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
> >>>>    the early reservation of a static region succeeds and checked in the
> >>>>    late scan.
> >>> Can we keep this local to of_reserved_mem please?
> >> Probably not. I do not see a way to keep this entirely local to
> >> of_reserved_mem while handling the issue robustly.
> >>
> >> I previously implemented an approach in of_reserved_mem that records
> >> static reserved-memory nodes whose early reservation failed in a local
> >> array [1]. However, the early scan runs before paging_init(), so the array
> >> cannot be dynamically expanded. If the number of failed nodes exceeds
> >> the array size, some failures cannot be recorded and the issue remains,
> >> and that is why Marek said "partial solution", although in practice
> >> having that many failed nodes is unlikely.
> > Even before paging_init() there is memblock_alloc().
> 
> One can call it, but such memory cannot be dereferenced/accessed for example
> on ARM64, because it is not yet mapped in the linear map.

Can't we use early_memremap() for it?

If there are many regions that need MEMBLOCK_RSRV_RMEM set, memblock will
need to allocate memory. If that memory is still not mapped we'll end up
with a crash in memblock.
 
> >> To handle this robustly, the late scan needs a way to determine whether
> >> the corresponding early reservation actually succeeded. Current approach
> >> uses memblock to retain that state.
> > I can't say I like the idea of keeping this state in memblock.
> > This add flags and code to memblock to deal with corner cases of bad
> > firmware that reports weird memory layouts, and once there is a flag in
> > the common infrastructure, people tend to abuse it.
> 
> So far I found no better place to store the information about successful
> region reservation.

We can have reserve_failed_nodes larger than MAX_RESERVED_REGIONS, it's
__initdata and anyway discarded after boot.

But even a DT with more than 64 bad regions seems broken enough to WARN()
and ignore remaining errors.

> Best regards
> -- 
> Marek Szyprowski, PhD

-- 
Sincerely yours,
Mike.
