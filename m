Received: from mta1.migadu.com (out-129.mta1.migadu.com [95.215.58.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E403C3E1208
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985100; cv=none; b=YZCeoeHgAFia/ukDdeI5EdCi9yx7TUjtD4iZPsOas4ZxnpvGI9Z4Tc2RhYEW31MRoScOCQGMKc9h+HIhf1VvpYrwqXlDRizL9a5g+4YNVdf3doqO5PvPYKjc3eDGAJiK+ZCxz8fCaFfd1ALTTCb2gk0lUw/kQw110oEzTf9Yxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985100; c=relaxed/simple;
	bh=VwHox4/h5VjYSrL3ZI6LKmLCzWabEF1m5mv80BQeC1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQe3bxpSkrQh3cEdqMyGnFsX2HU7T+Gqdzsm5295QCojRJn9EssJ2jnJHrbFStLtYtbBr5Ihxm/zzAxHEe6Yz3ewkf64bY6gnK8srhZ4Re+SNMkcVm15cuRi3iT0hXCVZINRLBs+uOTqW8djim1tg4XvIoI0egYWZ9Mf67PtiSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tdgx5opT; arc=none smtp.client-ip=95.215.58.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tdgx5opT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VwHox4/h5VjYSrL3ZI6LKmLCzWabEF1m5mv80BQeC1g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789985094; v=1; x=1790589894;
 b=tdgx5opTIk7gq7FpKTpXUG3y5KiHUOd+TEIGeB+/eN8Yaai9xPAr9osmGQiG3UfhA31qcGbE
 N94+GBJfvu8s6UM3Op4vLclkF12HH75EfCOL6WBsxoaPPgE51yzTF7E/OwMrz2NoaL304jFlXom
 /BdI6Wb+1PBJ3wTk6lywkkgg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 133da64645af3d12;
	Mon, 21 Sep 2026 10:04:54 +0000
X-Mizu-Trace-ID: 133da64645af3d12
X-Migadu-Flow: FLOW_OUT
Date: Mon, 21 Sep 2026 18:04:46 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
	akpm@linux-foundation.org, kasong@tencent.com, nphamcs@gmail.com,
	baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org,
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev,
	david@kernel.org, linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <arEBPsFJvzhQZk9W@fedora>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
 <aqrHjfHwyEtRIr5S@cmpxchg.org>
 <aquWKJoP5JLP8Ci7@fedora>
 <20260917131712.GA1344@cmpxchg.org>
 <CACePvbXQRBnTAivJp7mh-y3PQjjUeO4KxzV8+nnhC5UzMomT0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbXQRBnTAivJp7mh-y3PQjjUeO4KxzV8+nnhC5UzMomT0w@mail.gmail.com>

On 09/20/26 at 11:52pm, Chris Li wrote:
> On Thu, Sep 17, 2026 at 3:17 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Thu, Sep 17, 2026 at 03:31:23PM +0800, Baoquan He wrote:
> > > On 09/16/26 at 12:45pm, Johannes Weiner wrote:
> > > > On Wed, Sep 16, 2026 at 06:19:07PM +0800, Baoquan He wrote:
> > > > > xswap is a swap device with no backing storage. Swapped-out pages live
> > > > > in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,
> > > > > and the area is grown and shrunk on demand as swap usage changes.
> > > > >
> > > > > The problem being solved is the static size of compressed swap. Both
> > > > > zram and zswap need the size fixed in advance, and neither gives memory
> > > > > back when the workload shrinks. The solution should be a device whose
> > > > > size can scale up/down as per usage. xswap does that by mapping the
> > > > > metadata lazily instead of reserving it for the whole range.
> > > > >
> > > > > Design
> > > > > ------
> > > > > - si->cluster_info[] stays a plain array. Access is still
> > > > >   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no
> > > > >   RCU discipline, no tear-down state machine, no NULL return.
> > > > > - Only an initial chunk is mapped at creation. The rest of the address
> > > > >   space is reserved, not allocated, so an idle device costs nothing.
> > > > > - Growth is driven by allocation. When no free cluster is left and the
> > > > >   address space has room, the next chunk is mapped and added to the free
> > > > >   list. No userspace involvement.
> > > > > - Shrink is driven by frees. The free tail is scanned, and whole chunks
> > > > >   are unmapped once the mapped range is at most half in use and several
> > > > >   chunks can go. One chunk is left mapped as slack, so the next
> > > > >   allocation does not map it straight back. A ceiling lowered below the
> > > > >   mapped range skips the half-in-use rule and is enforced at once.
> > > >
> > > > If the swap maintainers prefer the VM_SPARSE route, I'm happy to defer
> > > > to them on that.
> > > >
> > > > However, from the cgroup and zswap camp, two stipulations that I
> > > > reasoned out in the other thread[1]:
> > >
> > > >
> > > > 1. You must not charge compression space as swap space to the cgroup.
> > >
> 
> Sorry let me push back on that. That is already existing user-visible
> behavior. Changing that will break our deployment using zswap. I don't
> think we should change that.
> 
> See more in my reply in the other email thread.
> 
> https://lore.kernel.org/linux-mm/CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com/

Thank both for valuable input. I am thinking if we can add an counter
like memory.swap.disk.* or memory.swap.backing.*, then we won't break
the existing behaviour, and also cover the use case Johannes mentioned
where different cgroup have different swapout target setting on xswap.

> 
> > > Hmm, I don't have a stance on this. However, isn't this an issue
> > > zswap/zram have been doing? It feels like an independent issue which
> > > should be done separately?
> >
> > If you have 3 containers using compression space, and two of them have
> > writeback enabled to a shared swapfile, the memory.swap.* controls
> > need to work to manage fair access to that swapfile. They do not work
> > if compression space itself is conflated in.
> >
> > Right now zswap entries actually consume physical swapfile space, even
> > before writeback. Charging the space is correct. But the whole point
> > is to decouple compression space from physical swap space.
> >
> > This is not something that can be done later. It would be a dramatic
> > user-visible change to how the resource is categorized and managed.
> >
> > > > 2. You must make the compression space large enough to be outside the
> > > >    range where users can hit space limits before hitting memory limits.
> > >
> > > We may need a way to define 'large enough' at first.
> >
> > I've tried to lay this out in the other thread, and highlighted the
> > usability issues that result from hitting compression space limits
> > prematurely. It's kind of your call whether you want to seriously
> > engage with this or not.
> >
> > But ultimately it's your claim that a static size can be made to work,
> > so it's on you to make a convincing case.
> >
> > > >    That also means not allowing setups where this is possible.
> > >
> > > And the limit is only an optional knob. If the admin does not set it,
> > > the device grows to the full address space, so there is no space limit
> > > to hit at all. It already behaves the way you want by default. The knob
> > > is only for admins who want a ceiling, they can use it or not. I hope
> > > this would not be a problem for your use case.
> >
> > No, I've laid this out already as well.
> >
> > This isn't about "my" usecase. It's about designing a coherent
> > interface that works well with a large number of usecases, and other
> > pieces of kernel infrastructure commonly used in conjunction.
> >
> > The other proposal in the room needs no such interface. The burden of
> > proof for adding one is on you.
> >
> > > > [1] https://lore.kernel.org/linux-mm/aqLi6cIjD2wJwk0B@cmpxchg.org/
