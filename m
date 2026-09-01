Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168533C10AA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228702; cv=none; b=u++MMTrEOxY2of4YWdjFUqDulZY/SwDPcU2SYN+bZIT3QG5AoPMsoq+7KsoIv+wPo3y34oY2e0KAxiuudyTBkulJGd0ruPAF39mDb9g1UNG7z8rLUM/0z2wCtGJzWEQemtOsfche1z5w4AMmAWYUFAeKPK6SM79BfdVzQrau6L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228702; c=relaxed/simple;
	bh=+nbxlEbPTLQBW5HnLSFX3GqLP/pNEQdthPI+OCv57hE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FwioEq383uANwWk1vu238JGLQL0iC1TRrGVH9hO6xN1Qj7nVqYFp5L5AJ2QR5DweZFUbE4Kx31ZIC7Czo897jCT5q3e/0MrxkEgGKa8ssdzdEqlTXerrBCS00dMpa1KbputMame1rRVzdGKkvJ9Wd1D2f//R4sqSnn0hsDimFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Xitnv9nV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xitnv9nV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3325D1F000E9;
	Tue,  1 Sep 2026 02:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788228687;
	bh=/NslkO98xS3KFNCbusFgiupbdzSsexpBcgAmyvPBir4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xitnv9nVAb7cLa7yB+vxqTcyFGeNeXm1J0wHfMigyUjeDeuyfGOCBxDFDrHJJ2w8M
	 7k0BZr05c2knXOqnJGm+gmlOwQJjUYn0GeCgmBQAIOrJNryGED9BM8XWpCuFFnuQ+d
	 jn4koTWL3ngHERQ/9HCVohH1479IZwj38dMo4veM=
Date: Mon, 31 Aug 2026 19:11:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: bingfangguo@tencent.com
Cc: Bingfang Guo via B4 Relay <devnull+bingfangguo.tencent.com@kernel.org>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park
 <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Johannes
 Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal
 Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Bingfang Guo
 <bfguo@icloud.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memcg: clear folio memcg after changing per memcg
 stats
Message-Id: <20260831191126.6ced4642c6cc92ca96cf0803@linux-foundation.org>
In-Reply-To: <20260831-memcg-swapcache-stats-fix-v1-1-1c0819ebdb86@tencent.com>
References: <20260831-memcg-swapcache-stats-fix-v1-1-1c0819ebdb86@tencent.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 11:32:43 +0800 Bingfang Guo via B4 Relay <devnull+bingfangguo.tencent.com@kernel.org> wrote:

> From: Bingfang Guo <bingfangguo@tencent.com>
> 
> __memcg1_swapout() transfers the memsw charge of a folio to its swap
> entry and clears folio->memcg_data as part of that.  In the vmscan
> swapout path it runs before __swap_cache_del_folio(), which then
> decrements the swapcache stats through lruvec_stat_mod_folio().  Since
> folio->memcg_data has already been cleared, folio_memcg() returns NULL
> and the NR_SWAPCACHE decrement only updates the node-level counter
> instead of the memcg's lruvec, leaking the per-memcg swapcache count.
> 
> Move the __memcg1_swapout() call into __swap_cache_del_folio(), after
> the NR_FILE_PAGES and NR_SWAPCACHE updates but before
> __swap_cache_do_del_folio() removes the folio from the swap cache.  This
> keeps the stats attributed to the folio's memcg while still recording
> the swap cgroup with a valid folio->swap.  Add a swapout parameter so
> the plain swap_cache_del_folio() path is left unchanged.

As always, the most important thing to tell us when fixing a bug is
"what are the userspace-visible runtime effects of this bug".  Please
update your prompts to always tell us this, in the first paragraph.

Clearly the immediate effect is messed up is messed up stats
(memory.stat?).  But what are the subsequent runtime effects of this?

> Fixes: b197d41462c20 ("mm/memcg, swap: store cgroup id in cluster table directly")

Quite recent.

> The problem is reproducible using the following script and program:

OK, thanks.  I agree with putting this info below the "---".  It's
probably too detailed for the changelog - curious people can find it by
following the Link:

Anyway.  Sashiko points out that a CONFIG_SWAP=n stub wasn't updated
(this happens often):

	https://sashiko.dev/#/patchset/20260831-memcg-swapcache-stats-fix-v1-1-1c0819ebdb86@tencent.com

so I'll take no action at this time.  Please do update the changelog to
include the runtime impact and I'd like reviewers to suggest whether we
should backport.

