Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1052759F;
	Tue, 22 Sep 2026 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066928; cv=none; b=Kb8IEgPYuTaxIDHpNfdqc2dbBLLcGj8rThpOQ7QsVuC7QZeR4BTnYTxRipBRYRurFtPtzhwclN6eCSI7Fav365K4aWOfdvmY42EyOCJFtSQOvTkDLk3tPwwuV2kcmc3tFls1m7cKAHlDZ9WqfBmr427Txz6tIu26Y8yGHBpitkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066928; c=relaxed/simple;
	bh=7IaLVwkL5m+kF/7fXmKprmbdAFcNvaLKfR0y+DUCgl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itagJkKxKQsvUQXivH7aAusMqyTOuiHE1cpzGb5Sr6mDmjHe7qxk81fisVUIfdjX5b71vAh+WOoj2qzD89ajc33JVCJ2xhUgqyJycKDuQmtdIMSmcD5axgRFBcn9hcgYeipD59tIR9VCuAZ3XQYqymHzdArUi8TTSrpUMZFxxsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP6cTy4A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP6cTy4A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEDF1F000FF;
	Tue, 22 Sep 2026 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066927;
	bh=mh0mGm1ld8tg6c7EhdkM1d4eVMd5E3LVT8DC3vIY5K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dP6cTy4A0UXusAiIQuf7XHNmCf0oksDZeYiXkIeS4XXg4xTKSCusJ+1EB8onw5qko
	 0SqSET7QFRY6zchqE3+lUMrykDB4zkFnSGVGn4rKXU4CoETSgIB9dWMp7VxXlihbOZ
	 nqGQimkWf8DFDOBYHw7uhOjD4sB/STapR4N+cRzTtoxkPfUPADU3jGqhwBdkSpxta8
	 SJ8bobM0qgqFd3Upoo9rp8QIn3hgrUxWrhrHHdhduBmJ7HytD0aTZujUSKTUogFBfY
	 xzeXlmNQMsTaHDfep4OGfN2vD4Hy00fVfzkuoYcKTVH3TY23ue7cLBnmlEIhWDywRy
	 boHs5zSa1dgBg==
Date: Tue, 22 Sep 2026 11:48:41 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: robh@kernel.org, saravanak@kernel.org, m.szyprowski@samsung.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved
 memory
Message-ID: <arJA6fOMetzoBhDH@kernel.org>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920092852.614973-1-chenwandun1@gmail.com>

On Sun, Sep 20, 2026 at 05:28:47PM +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> This series fixes several error-handling issues in the reserved-memory
> initialization paths.
> 
> The first two patches fix cleanup of no-map regions after driver
> initialization failure.
> 
> Static reserved-memory nodes are reserved during the early DT scan but
> initialized later. The third patch tags regions whose early reservation
> succeeded, so the late scan can skip the nodes whose early reservation
> failed.
> 
> The last two patches reject overlapping static regions. Without
> these checks, overlapping nodes can be initialized over the same
> physical memory, result in data corrupt.
> 
> Sashiko reported these issues in [1] [2] [3].
> 
> [1] https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org
> [2] https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org
> [3] https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org
> 
> v2 --> v3:
> 1. Rework the mechanism that checks in the late scan whether the early
>    reservation succeeded (patches 3-5, suggested by Marek, thanks).
> 
>    Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
>    the early reservation of a static region succeeds and checked in the
>    late scan.

Can we keep this local to of_reserved_mem please?
 
>    Patches 4 and 5 are reworked to reject regions that overlap or are
>    contained by an existing reservation. The code makes a little different
>    from what was acked in v2, so the Acked-by tags for these patches are not
>    carried over.
> 
> 2. Reorder the patches: the two cleanup fixes in v2 now come first.
>    In v3, the first patch now introduces the 'dynamic' distinction in
>    fdt_init_reserved_mem_node(), which the following patche 3 build on,
>    so the series reads more fluently.
> 
> v1 --> v2:
> 1. Rework failed-node tracking in patch 1: do not track zero-sized nodes,
>    and keep a reserved_mem slot when tracking overflows.
> 2. Reject static reserved regions overlapping existing no-map regions.
> 3. Keep MEMBLOCK_NOMAP flag for static no-map regions when init failure.
> 
> 
> Wandun Chen (5):
>   of: reserved_mem: release dynamically allocated no-map region on init
>     failure
>   of: reserved_mem: retain static no-map memory on init failure
>   of: reserved_mem: skip init for regions whose early reservation failed
>   of: reserved_mem: reject static regions overlapping no-map memory
>   of: reserved_mem: reject static mapped regions overlapping existing
>     reservations
> 
>  drivers/of/of_reserved_mem.c | 86 +++++++++++++++++++++++++-------
>  include/linux/memblock.h     |  7 +++
>  mm/memblock.c                | 95 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 170 insertions(+), 18 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
