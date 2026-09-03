Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40A21A8F7B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420164; cv=none; b=T27uVemq6k2b1w44xYU1UPh9HgLsT0HneXM8ViDInQkHs0l0+/PBpPfXAaGGEt6NxuwwMqgtyU3KtHLUBUYG2tflotQ1hzDXcei8D0HC+A+Bc3qmfkRqix1BcrviR18T8r4myXQl8xGzpeOobofBsvzPHwKUIeZioA5xNBwxisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420164; c=relaxed/simple;
	bh=DCeACBZz1ManHprzZ0Nniagokn7hcU17OS2UajpLDoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaDjsTI5CquCLsJ9MeI8fkV+rhUkLMmLnWx7DS9ARCP2f3vdppD8gDdPr8Lcoga5t75vhC4nZ5WFbMFDGS3ljkReYVdEFX87dqL16TXhNxWbFKKcDMIgvQRVyyCIogbFz9xl83JA3KPzCw84UmArojRshp4YDuqgc/FojokhScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 3 Sep 2026 15:52:37 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: youngjun.park@lge.com
Received: from unknown (HELO yjaykim-PowerEdge-T330) (10.177.112.156)
	by 156.147.1.121 with ESMTP; 3 Sep 2026 15:52:37 +0900
X-Original-SENDERIP: 10.177.112.156
X-Original-MAILFROM: youngjun.park@lge.com
Date: Thu, 3 Sep 2026 15:52:36 +0900
From: Youngjun Park <youngjun.park@lge.com>
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org,
	kasong@tencent.com, nphamcs@gmail.com, baohua@kernel.org,
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/16] mm, swap: require zswap for xswap devices
Message-ID: <apkZNEe8/YAwygbA@yjaykim-PowerEdge-T330>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-16-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827094509.1016740-16-hebaoquan@kylinos.cn>

On Thu, Aug 27, 2026 at 05:45:05PM +0800, Baoquan He wrote:
> xswap has no backing storage: swapped-out pages live only in zswap.
> Without zswap, swapout always bounces back, so the device would
> consume swap entry space without ever freeing memory.  Refuse to
> create a device when zswap is unavailable.
> 
> Runtime disabling of zswap after creation is safe: existing entries
> stay loadable (zswap_load() gates on zswap_never_enabled(), not the
> runtime zswap_enabled flag) and new swapouts merely bounce back to
> memory without freeing it.

Hello Boaquan.

If xswap is used alongside another swap device, wouldn't runtime
disabling of zswap cause a problem? 
User assumes other remained swap device used right afte zswap disabled.

Once a device is allocated as xswap and zswap gets runtime disabled,
xswap keeps receiving new swap entry allocations, and every swapout
to it just bounces back without freeing memory . until xswap's
entries are exhausted. Meanwhile the other swap device sits unused.

If my point is right...
A few ways to handle this come to mind.

1. Once xswap has started accepting writes, refuse to runtime disable zswap.
2. If zswap is runtime disabled, stop handing out new entries from
   xswap (drop it from the available list, or gate on an XSWAP flag).
   This would also need nr_swap_pages, the visible swap count to be
   reduced accordingly, and unused cluster memory reclaimed.
   behave as if xswap had been swapoff'd.
3. Support falling back to another swap device once zswap becomes
   unavailable. 

Thanks!
Youngjun
