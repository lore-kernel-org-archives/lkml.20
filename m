Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD893BFE4C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492865; cv=none; b=QPM4p7ObtKgnCBUY+Bj0Yeo+MHRhej19kfy8D47QvdN1qAapI/ydrWF0zTrS8q8gbTxkFhTGAz5uKd1LJCz6idm5GI6q/bVnGC2kdhemo5gR37b+muxqtdDsjGBMXjKS6faTj0WZUj1Nf1nFFt71ecdLW2V6fYTP74dtADQjsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492865; c=relaxed/simple;
	bh=DzX2NTbsze0dSJnwYdpWB3c79mh2V1AmJ6cw5XBcxo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LouoxbUH8bl7MawozhoUTNfQRGjpdQD17xkbbiT0WXPgGSFymLmEgK3SV20LscvQuO4NELivjXW489MUPRiNk9Zy2M7vncRCi5LGxjkkWxCQQuQ5+S/4pyaEYDHiqjUsjEQxjNrz3Sd1LOmeXdokOjNxUr/2Z7Q4L9nbW1EydeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SvgTWmyw; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SvgTWmyw"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DzX2NTbsze0dSJnwYdpWB3c79mh2V1AmJ6cw5XBcxo4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788492861; v=1; x=1789097661;
 b=SvgTWmywf+U96HXGJDJ3SvcHNJr+nHqbZ2dxnXG9n/HJEjO5rIwLLaqifmDbTOIBiI3EaT6s
 xUybHAUNYf4qs+sfRKiK+azrT6t2XWdGufeC7DpaePbVTt/nJ/k02ek1XNHpNCaQXKHMfHNVFml
 uCsPYrt/AsXHaqAKpB+DaCu8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f11963f51e07d4f7;
	Fri, 04 Sep 2026 03:34:11 +0000
X-Mizu-Trace-ID: f11963f51e07d4f7
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 11:33:59 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Youngjun Park <youngjun.park@lge.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] xswap: extendable swap device backed by zswap
Message-ID: <apo8J72dWW0CoS82@fedora>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
 <apkjJo+g6ewvLy5+@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apkjJo+g6ewvLy5+@yjaykim-PowerEdge-T330>

On 09/03/26 at 04:35pm, Youngjun Park wrote:
> On Thu, Aug 27, 2026 at 05:44:50PM +0800, Baoquan He wrote:
> > xswap is an extendable swap device with no backing storage. Swapped-out
> > pages live only in zswap, so the device wastes no disk space and its
> > size is independent of any physical device.
> > 
> > xswap decouples PTE swap entries from physical backing storage. The
> > cluster_info array is backed by a sparse vmalloc (VM_SPARSE) area that is
> > grown and shrunk on demand:
> > 
> > - Grow: when cluster allocation runs out of free clusters and the device
> >   is below its ceiling, more physical pages are mapped into the VM_SPARSE
> >   area and their clusters are added to the free list.
> > 
> > - Shrink: when contiguous free clusters accumulate at the tail of the
> >   mapped range (tracked in O(1) via nr_free_tail), they are unmapped and
> >   the backing pages freed.  Shrink is deferred to a workqueue to avoid
> >   lock recursion.
> > 
> > A per-device ceiling (nr_clusters) bounds growth and is adjustable at
> > runtime via debugfs.
> > 
> > Interface:
> > 
> >   /sys/kernel/mm/xswap/create           write "<percent> [<prio>]" to
> >                                         create a device; percent is a
> >                                         percent of RAM (0 for the default),
> >                                         prio is an optional swap priority
> >                                         (default DEF_SWAP_PRIO)
> 
> As discussed before, until there's a per-memcg tier concept, is there
> a meaningful use case for having more than one xswap device? Would it
> make sense to limit it to a single device for now, and add support
> for multiple devices later once that structure exists?

Hi Youngjun,

Thanks for careful checking and your question.

Here, I am also confused why both you and Nhat oppose per-device xswap.
Actually, supporting per-device xswap was part of Chris's original plan
and was designed for the swap tier. From my perspective, it's also a
very natural thing because the current swap code natively supports
per-device, and swap tier needs to use it anyway, so I don't bother
to add code to restrict it to single device. More importantly, for
per-device xswap, you can use one if you want, or multiple if you want
too, it won't prevent anyone from using a single xswap instance.

> 
> Also, if xswap accepts an explicit prio, xswap devices would need to
> stay grouped within the same tier. But a slow tier with a different
> priority range could end up sandwiched in between, or an xswap device
> could fall outside the priority range needed to belong to the same
> tier.
> 
> Could prio just be fixed instead? Is there a reason it needs to be
> assignable per device?

A good question. I haven't thought of a good way for xswap prio. Fixed
prio, or a high prio region for xswap? Zram is ram swap device too, it
shares the same prio setting semantics as a normal one. Can we keep it
as is, to leave it to xswap user?

Thanks
Baoquan
