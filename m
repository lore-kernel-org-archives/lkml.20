Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BF84756D3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018958; cv=none; b=u3BkPz3llpfJi2d1uwSq/Orc/IMe90furcscLvEyzCBe+t3L+cffUmwtaym4pvX2dWAs0AVMJLOFFKpiwZ7AnLzIegDNWQ7u/PA4FDjufmbwBa7fsJvOzChozSSU7BQTI2ZrDcea92wggMUzZGDjcxS2qxSChcHUTj4ncnk83g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018958; c=relaxed/simple;
	bh=8kbYCTiOht8YURF6bw64YoNIjxFOJTgiJvXG2CbwKEU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bO3IWThOtWL5BSFD0dSu8qq8yM7IHRlo5IiqkkJrFDcvDWUBaDGoGXaDmtZ29g3Mh1W1aNJl2P0TJD7kJaE865Av/x7jZ+FsPbX2vNuxXQuqLO5CxKIfRBFmTsU45D3eqlRnoYjPlBP9xH+66QjcukeBTS3Bpxe25+Rrm0J/S9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LnrpcqLe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LnrpcqLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056E61F000C4;
	Wed, 14 Oct 2026 23:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792018956;
	bh=VTYVPdLowER/NQgZmE9HNR8wYFSGQx166uFE24iaws0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LnrpcqLeaK0nM1SbvKYcBzXTJ+TDkRmuP6vCDXSWYXn//ALtRIgR3sE8MbveW3f4j
	 6Ah4qakD/AvwXZYVvE1fcVzU5UWkG078qXZG8c30VJpfMe/OC38Vq5uIvFhMbSRjDZ
	 ou7Bf0ZR+acfkST/qWTa27TOurrsOE5dNhmRwYq0=
Date: Wed, 14 Oct 2026 16:02:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, Chris Li
 <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path
 gave up on
Message-Id: <20261014160235.29a39f19ccd19aec47b63008@linux-foundation.org>
In-Reply-To: <20261014090821.227366-1-jiayuan.chen@linux.dev>
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 17:08:19 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:

> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> On our production hosts we saw swap cache only pages keep growing for days:
> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
> swap slots were held by folios that no process mapped any more, charged
> to cgroups whose workloads had long exited. The only way to get them
> back was swapoff, and with other services actively swapping on the
> same host that is not an option.
> 
> Such a slot has swap count 0 and an unmapped folio pinned in the swap
> cache, left there after a process exited or did MADV_DONTNEED. No page
> table holds its swap entry any more, so nothing comes back for the
> slot; LRU reclaim drops it eventually, and the allocator only reclaims
> such slots once swap is half full. The growth stopped exactly there:
> at 50% of the device, where vm_swap_full() becomes true.

That's a pretty nasty problem - thanks for working on it.

> Options considered:
> 
> 1. Fix it on the readahead side: after the read, check the swap count
>    and free the slot. Covers the lock, not writeback, and the
>    asynchronous read path unlocks in the bio completion where the slot
>    cannot be freed. Two places to patch, neither clean.
> 2. swapoff/swapon clears it, as does memory.reclaim on the right cgroup.
>    That is a workaround, not a fix.
> 3. Have the side that gives up come back later. This patch.
> 
> The zap runs under the PTL and the fault path takes the folio lock
> before the PTL, so waiting there is out; a worker has to do it. On a
> lost trylock or a writeback refusal under TTRS_UNMAPPED,
> __try_to_reclaim_swap() schedules si->sweep_work. The worker walks the
> in-use clusters and, for every slot with swap count 0 whose folio is
> unmapped, calls __try_to_reclaim_swap() with TTRS_WAIT, which takes the
> folio lock and waits for writeback instead of giving up.
> free_swap_cache() now calls __try_to_reclaim_swap() as well, so both
> paths give up, and wake the worker, in the same place.
> 
> For now the worker scans every in-use cluster of the device; marking
> the clusters that need it can reduce that later.

It's a substantial patch.  There's no quick-n-dirty fixup we can
prepare for backporting into older kernels?

>  include/linux/swap.h |   1 +
>  mm/swap.h            |   1 +
>  mm/swap_state.c      |   9 ++--
>  mm/swapfile.c        | 101 ++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 104 insertions(+), 8 deletions(-)

Sashiko had a few things to say:
	https://sashiko.dev/#/patchset/20261014090821.227366-1-jiayuan.chen@linux.dev
	

