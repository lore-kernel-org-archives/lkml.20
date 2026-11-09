Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266657;
	b=vYr+F3wWCiPBc64CN+dpWUYXA9kUQYoni76/nXvj5MR0A7wUAuSPCosrSSK1T/O/jTgd
	 0fW+OpWudg6O2qm6Ehv2OFTY5D0fx5m307yu7zZvgs1ZGwCZjLopUqt3EpE3/lV3l/fUh
	 fRVI5a06khNtzotd2J5yoEsoGGlkKs5QLqhENG3wS1oM59J/rn4o8TXKxx+PGLisGWXic
	 nep0HIKWxlTaqzc084C04CCuZrVJK1qWCutL6CsNZL0ttnM6NgmK9sJgHbUq+WFyG/YXZ
	 hHlyXvWeDT4j2YeDYOcVayqy9yotWpWKGry5vWRDu82Q/KMQFpFwAxFSDEnAn3uqR9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266657;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NYLTUEr3KcsmorvXUyUc9odvTYuXILr61fltDodOWZM=;
	b=aaTaOFCeWk4s8jFAsfeqZk7HhVOa6TOsP1RZHurzRWTciZgVJZ9lBdD5Sv2Bxzy517QR
	 77MNFGuVJ5QfliMwKRWjD+emky3VqPWQTCLKPd7tH1564T7UL6UvAXUmIohAQjLUpxCBy
	 lwe+8KTkEJijoh5CIMuo9Wtx2ZCQMTRha0axrKMU551TvxW4thsnGKPRYrIbsD1B+kOAV
	 14KmUuYSbz4CEIbvpAYY/umaLq+kvZFHdO5faHpHsoO6wTIylCNkYqcSRbyIZkD3i8wxS
	 aJ8/mryukrSaDgTNRCuUZ/3jx5AaIO+EQqDFoFPI6ABHSzWCY5i9uyNGVrByzbDywDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DPFSzklS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCFE606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DPFSzklS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6D51F0089F;
	Mon,  9 Nov 2026 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794266656;
	bh=NYLTUEr3KcsmorvXUyUc9odvTYuXILr61fltDodOWZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DPFSzklS2gUNO06UEJB85q5gP8Rup2PF/SVj8HYqythdmmE9zFLDQXZ6Vqk8Zafiz
	 tuA3iiOfNDjgI7Fot8g2bHPAQDtig+sBOy0bPw84iU53OwOmXSwWpm5+8CMOTvxEZD
	 Adu+++wwF/rAu0X54viIjAcfzWj/hpE4VnTYhFas=
Date: Mon, 9 Nov 2026 15:24:15 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexandre Ghiti <alexghiti@meta.com>
Cc: Kairui Song <ryncsn@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Barry
 Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes
 Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm, swap: only prefer nonfull clusters on
 synchronous devices
Message-Id: <20261109152415.f7bb160e4089a17f15c8f42c@linux-foundation.org>
In-Reply-To: <CAEmasaWMKsBSQ_LrewZc3f6a2u15WARAk25AKWjS4oFy8yciCA@mail.gmail.com>
References: <20261105155032.240457-1-alex@ghiti.fr>
	<20261105155032.240457-2-alex@ghiti.fr>
	<CAMgjq7DpCCiEK00Es7yU_i_wyf7NU4fFN7QFO_RptF9tGvPZWA@mail.gmail.com>
	<CAEmasaWMKsBSQ_LrewZc3f6a2u15WARAk25AKWjS4oFy8yciCA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 10:00:45 +0100 Alexandre Ghiti <alexghiti@meta.com> wrote:

> > The patch itself looks good to me.
> >
> > Acked-by: Kairui Song <kasong@tencent.com>
> 
> Thanks,

Thanks all.

Please avoid single-patch patch series?  Present them as a unified
singleton.

Here's what I ended up with.  Please check.


From: Alexandre Ghiti <alex@ghiti.fr>
Subject: mm, swap: only prefer nonfull clusters on synchronous devices
Date: Mon, 09 Nov 2026 15:18:32 -0800

Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters") made
the allocator fill nonfull clusters before taking free ones on swap
devices without discard.  Commit 3cedb745d354 ("mm: clarify the
folio_free_swap() for do_swap_page()") frees the swap slot on an exclusive
write fault.  Such faults now leave holes in formerly full clusters,
putting those clusters back on the nonfull list.  Reclaim allocates slots
one folio at a time, scattering a batch across the holes instead of
producing mergeable writes.  Later swapin can also require more read
requests.

On a mysql/sysbench workload in a 256 MiB memcg swapping to an NVMe
partition, 7.3 compared with the previous version produced 59% more device
read requests and 27% more write requests per transaction.  Throughput was
unchanged without iocost and fell 19% with iocost.

Prefer free clusters first on nonsynchronous devices, preserving
contiguous swap slots for merging I/O.  Keep nonfull-first on synchronous
devices such as zram: they do not merge I/O, and filling holes saves free
clusters for large folios.  Keep free-cluster preference on discard
devices to spread writes.

In the same workload, v2 reduced read requests per transaction by 14% and
write requests by 48% against its base kernel.  Throughput was unchanged
without iocost and improved 33% with iocost.  The RFC's batch-aware
allocator also improved this workload, but this policy needs no batch
information from reclaim.  Reverting the slot-freeing change would keep
swap space pinned under dirty pages; a proposed 50% swap-usage cutoff for
free-cluster preference was arbitrary and would stop helping as swap
filled.

The 7.0 to 7.2 kernels retained the swap slot after a write fault as a
side effect of 4b34f1d82c65 ("mm, swap: free the swap cache after folio is
mapped").  The observed regression requires both 9a42aed48421 and
3cedb745d354; stable backports should target trees containing both.

Link: https://lore.kernel.org/r/20261105155032.240457-1-alex@ghiti.fr
Link: https://lore.kernel.org/r/20261105155032.240457-2-alex@ghiti.fr
Link: https://lore.kernel.org/r/20261022145615.2184343-1-alex@ghiti.fr
Link: https://lore.kernel.org/r/CAMgjq7BFbXEKEt9faj_rg5AStfLkpJ0j57EQOOJ+L3-w2xRvtg@mail.gmail.com
Fixes: 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kairui Song <kasong@tencent.com>
Acked-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Nhat Pham <nphamcs@gmail.com>
Cc: <stable@vger.kernel.org>
---

 mm/swapfile.c |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

--- a/mm/swapfile.c~mm-swap-only-prefer-nonfull-clusters-on-synchronous-devices
+++ a/mm/swapfile.c
@@ -973,6 +973,17 @@ static bool __swap_cluster_alloc_entries
 	return true;
 }
 
+/*
+ * Prefer a new cluster over a nonfull one if the device needs discard, to
+ * spread out the writes, or if it is not synchronous, to keep the slots
+ * of a swapout batch contiguous so that its writes can be merged.
+ */
+static bool swap_prefer_free_cluster(struct swap_info_struct *si)
+{
+	return (si->flags & SWP_PAGE_DISCARD) ||
+	       !(si->flags & SWP_SYNCHRONOUS_IO);
+}
+
 /* Try use a new cluster for current CPU and allocate from it. */
 static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 					    struct swap_cluster_info *ci,
@@ -1143,11 +1154,7 @@ static unsigned long cluster_alloc_swap_
 	}
 
 new_cluster:
-	/*
-	 * If the device need discard, prefer new cluster over nonfull
-	 * to spread out the writes.
-	 */
-	if (si->flags & SWP_PAGE_DISCARD) {
+	if (swap_prefer_free_cluster(si)) {
 		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
 		if (found)
 			goto done;
@@ -1159,7 +1166,7 @@ new_cluster:
 			goto done;
 	}
 
-	if (!(si->flags & SWP_PAGE_DISCARD)) {
+	if (!swap_prefer_free_cluster(si)) {
 		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
 		if (found)
 			goto done;
_

