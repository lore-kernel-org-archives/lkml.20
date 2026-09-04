Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9C3D8918
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508639; cv=none; b=YGPS6/dohasY0sbpmUh6p5XnGnvbN7BI8zOC5ZTtQxPlNowFabWYHvcGcgxxjCAzCB7EKufSEDd7hH/gADTDPYmLVC/YAxm4JO5JMJVbW7xoqhlOz/SwJEfDEqyUA0+M4/BTvIkGap9vpXy0MEvY+r/kOrlf0P65alyd3Z0xFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508639; c=relaxed/simple;
	bh=mofboeBHEKPxM47nwHB8XlxHXL2t2jru+ee6kaJSofs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgT3NTsN4e5qJM3bxG1zGKTPKxKtMcniTAQiVLogQ8dmXusfZBkNRIeZemIGfgOphyn6EWJxeQAaZxoHXmMPh7PV3oPMS9tfZS3tppgl62LLf2juLukxzksAXaGNnr/rRvULYnMJvwR9pI8brKnRwx864h1/PiIJr6If9mT7OfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=azMuYfCm; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="azMuYfCm"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mofboeBHEKPxM47nwHB8XlxHXL2t2jru+ee6kaJSofs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788508635; v=1; x=1789113435;
 b=azMuYfCmIULLzv9G3crHda2Jh/4mkznS49DmaAJi7BAQlu/5r2I1KiBGjVTBA8sTarQgea0r
 aH1T6VSQ2T7j7I875TR+ONbNF+gT3QJovV3KUA+EBIrKfw4WTrkwBTCCXEUivQIPdcUE1qH89Fw
 H8HcF8yTjK70wxuhpDAe5+FY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 85c4279ad02e47cd;
	Fri, 04 Sep 2026 07:57:14 +0000
X-Mizu-Trace-ID: 85c4279ad02e47cd
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 15:57:11 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Youngjun Park <youngjun.park@lge.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/16] mm, swap: require zswap for xswap devices
Message-ID: <app513BgZmP8vgGe@fedora>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <20260827094509.1016740-16-hebaoquan@kylinos.cn>
 <apkZNEe8/YAwygbA@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apkZNEe8/YAwygbA@yjaykim-PowerEdge-T330>

On 09/03/26 at 03:52pm, Youngjun Park wrote:
> On Thu, Aug 27, 2026 at 05:45:05PM +0800, Baoquan He wrote:
> > xswap has no backing storage: swapped-out pages live only in zswap.
> > Without zswap, swapout always bounces back, so the device would
> > consume swap entry space without ever freeing memory.  Refuse to
> > create a device when zswap is unavailable.
> > 
> > Runtime disabling of zswap after creation is safe: existing entries
> > stay loadable (zswap_load() gates on zswap_never_enabled(), not the
> > runtime zswap_enabled flag) and new swapouts merely bounce back to
> > memory without freeing it.
> 
> Hello Boaquan.
> 
> If xswap is used alongside another swap device, wouldn't runtime
> disabling of zswap cause a problem? 
> User assumes other remained swap device used right afte zswap disabled.
> 
> Once a device is allocated as xswap and zswap gets runtime disabled,
> xswap keeps receiving new swap entry allocations, and every swapout
> to it just bounces back without freeing memory . until xswap's
> entries are exhausted. Meanwhile the other swap device sits unused.
> 
> If my point is right...
> A few ways to handle this come to mind.
> 
> 1. Once xswap has started accepting writes, refuse to runtime disable zswap.
> 2. If zswap is runtime disabled, stop handing out new entries from
>    xswap (drop it from the available list, or gate on an XSWAP flag).
>    This would also need nr_swap_pages, the visible swap count to be
>    reduced accordingly, and unused cluster memory reclaimed.
>    behave as if xswap had been swapoff'd.
> 3. Support falling back to another swap device once zswap becomes
>    unavailable. 

Agreed. 2) sounds better. Thanks for the detailed analysis.
