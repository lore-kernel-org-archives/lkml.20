Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B51A3603D5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973122; cv=none; b=PQWf99k819vwXrySU52fhK45X56itufNdY63drhukBP1L2TH5dGmkQ0Nn2RRp4ndvd+ZoSRmajx2UsbhoNkHRJ7ftB5nsOydP2CqrqBbmB8z3AyFI+T3AYzZ3VJmpqb4hhcK+WvWkUfhhXt6myurGtsEmRTggFxfLMkCvHGNhxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973122; c=relaxed/simple;
	bh=+CtmSrDeMQxTmoIXkXwfUTofjVqxOZqb3/0Dtxr5+Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EU4UFhqAuEjyc1y7oQMqxH/501FwWrXxzdgDvgLRRFqPQTdHX2FGgDJLOcnkeDis3cK+YqVJ7SBI4eWj+xcS2htgv7HaEJOY3FJ21Luva27v/RqPcQyxUQBCixsqCrHvAX6vifMCvHqx6jJU74rm7Lpb9C3q4Mz7gZlUC+Hb/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=of7nP9wI; arc=none smtp.client-ip=95.215.58.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="of7nP9wI"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+CtmSrDeMQxTmoIXkXwfUTofjVqxOZqb3/0Dtxr5+Cs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789973117; v=1; x=1790577917;
 b=of7nP9wIXsY29KeWDKrOgQpoyRRFfGkX9gfzg/5iWJ0+DIqyKa27K3udP4QZsgxStvwMwUSb
 lMlElCJEXlq90fcwCnkLqCHiChq8dk4jOZ4dZ8AfQlrlHFyXSjA73gQqF1SbiSjVdTWOnpVoRTc
 vkYShenx7b84NkNUDBFJb1IU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8a4228e43e0fc90c;
	Mon, 21 Sep 2026 06:45:14 +0000
X-Mizu-Trace-ID: 8a4228e43e0fc90c
X-Migadu-Flow: FLOW_OUT
Date: Mon, 21 Sep 2026 14:45:09 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	baohua@kernel.org, youngjun.park@lge.com, hannes@cmpxchg.org,
	yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <arDSdRDF9CnHjkE0@fedora>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
 <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>

On 09/17/26 at 05:13pm, Nhat Pham wrote:
> On Wed, Sep 16, 2026 at 3:19 AM Baoquan He <hebaoquan@kylinos.cn> wrote:
> >
> > xswap is a swap device with no backing storage. Swapped-out pages live
> > in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,
> > and the area is grown and shrunk on demand as swap usage changes.
> >
> > The problem being solved is the static size of compressed swap. Both
> > zram and zswap need the size fixed in advance, and neither gives memory
> > back when the workload shrinks. The solution should be a device whose
> > size can scale up/down as per usage. xswap does that by mapping the
> > metadata lazily instead of reserving it for the whole range.
> >
> > Design
> > ------
> > - si->cluster_info[] stays a plain array. Access is still
> >   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no
> >   RCU discipline, no tear-down state machine, no NULL return.
> > - Only an initial chunk is mapped at creation. The rest of the address
> >   space is reserved, not allocated, so an idle device costs nothing.
> > - Growth is driven by allocation. When no free cluster is left and the
> >   address space has room, the next chunk is mapped and added to the free
> >   list. No userspace involvement.
> > - Shrink is driven by frees. The free tail is scanned, and whole chunks
> >   are unmapped once the mapped range is at most half in use and several
> >   chunks can go. One chunk is left mapped as slack, so the next
> >   allocation does not map it straight back. A ceiling lowered below the
> >   mapped range skips the half-in-use rule and is enforced at once.
> >
> > Size
> > ----
> > A device starts at 1xRAM, rounded down to the cluster. That costs
> > nothing, because the mapping is lazy. The underlying address space is
> > 2xRAM. An optional per-device cap,
> > /sys/kernel/mm/xswap/type<N>/limit, lets an admin lower the ceiling;
> > the excess is unmapped right away. Grow and shrink both work without
> > it. Creating a device requires zswap.
> >
> > Interface
> > ---------
> >   /sys/kernel/mm/xswap/create           write an optional priority
> >   /sys/kernel/mm/xswap/destroy          write a swap type
> >   /sys/kernel/mm/xswap/type<N>/limit    read/write, in pages
> > The device shows up in /proc/swaps as xswap<N>.
> >
> > Note
> > ----
> > Writeback, rmap lookup, etc. are consumers of this base. I have a
> > writeback prototype on top of this base and will post it as a reference.
> 
> Thanks for posting v3.
> 
> I spent a while building the other half of what I want out of this on
> top of your series, to see how much work is needed if we are to expand
> from xswap to cover the vswap use case.
> 
> It is actually way more work than I anticipated. And a lot of it is
> because of the way you indiscriminately apply the full swap device
> model to xswap, without careful consideration of actual use cases.

Don't worry, I have made a RFC to support xswap writeback, rmap, thp,
charging, etc. You can take it over and make it formal to post if you
decide to join to work together.

