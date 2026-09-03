Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95418397933
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422708; cv=none; b=Oq3Az2kLX+CYGU6PJI4NjkDxxL/YEGDQs9x/UhRnZ2vfvBHj1hLrV1WaJ7I2yIE5j5eyWQ/zoNgB5K+WSgSbIXGclJtIpLfAUo+i9zixDADROCjD+9q2/ZCOKV3X/khsiVmST5uupU5hLGiINobxP/JJyzvqjjKse2WCMQpU5/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422708; c=relaxed/simple;
	bh=//TrVVCpW+l5EzjCy/dZonpcq5BBDAkQVq4JR1kr5EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cj90s8rV98mbYomP+mlc3YVAdXs8UrZ731c4/TUPxv+KHSWGMXHPHLvXd7NPABFKiMjZ0nfsIqDHE2b/pk6FFzTQCASl6fLRRovfBQ2r8M4tPOmPiAM3ImSqYOVvvXrtR4UUcHfcJ0+xwj8b3eLZ0d/AE+s3HQYsyaWA/el8PTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 3 Sep 2026 16:35:02 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.1.126 with ESMTP; 3 Sep 2026 16:35:02 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Thu, 3 Sep 2026 16:35:02 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org,
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org,
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] xswap: extendable swap device backed by zswap
Message-ID: <apkjJo+g6ewvLy5+@yjaykim-PowerEdge-T330>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>

On Thu, Aug 27, 2026 at 05:44:50PM +0800, Baoquan He wrote:
> xswap is an extendable swap device with no backing storage. Swapped-out
> pages live only in zswap, so the device wastes no disk space and its
> size is independent of any physical device.
> 
> xswap decouples PTE swap entries from physical backing storage. The
> cluster_info array is backed by a sparse vmalloc (VM_SPARSE) area that is
> grown and shrunk on demand:
> 
> - Grow: when cluster allocation runs out of free clusters and the device
>   is below its ceiling, more physical pages are mapped into the VM_SPARSE
>   area and their clusters are added to the free list.
> 
> - Shrink: when contiguous free clusters accumulate at the tail of the
>   mapped range (tracked in O(1) via nr_free_tail), they are unmapped and
>   the backing pages freed.  Shrink is deferred to a workqueue to avoid
>   lock recursion.
> 
> A per-device ceiling (nr_clusters) bounds growth and is adjustable at
> runtime via debugfs.
> 
> Interface:
> 
>   /sys/kernel/mm/xswap/create           write "<percent> [<prio>]" to
>                                         create a device; percent is a
>                                         percent of RAM (0 for the default),
>                                         prio is an optional swap priority
>                                         (default DEF_SWAP_PRIO)

As discussed before, until there's a per-memcg tier concept, is there
a meaningful use case for having more than one xswap device? Would it
make sense to limit it to a single device for now, and add support
for multiple devices later once that structure exists?

Also, if xswap accepts an explicit prio, xswap devices would need to
stay grouped within the same tier. But a slow tier with a different
priority range could end up sandwiched in between, or an xswap device
could fall outside the priority range needed to belong to the same
tier.

Could prio just be fixed instead? Is there a reason it needs to be
assignable per device?

Thanks!
Youngjun
