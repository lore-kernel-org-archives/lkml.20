Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501034;
	b=KSRvl8WJlZUsS+kPsqQ9Z9LszV8DAqpE2PmVxOxb89wM6eO8dfDfgu5xZNGOaAm7R08m
	 pYPNlEzWotA9amNrstxSEEsGqE7DTcXIhN4dVtCFw1F7yMh19nQNhjspFFehc42FDcjnM
	 P9QAKuGPHsGI4Nsbyo0KIxqebKyTi8LkywKTLvbQ5Hv9EmCagVaDRZvPIm4iNp9IWvK4V
	 m/gttO7V90iFm1OYjVFAuV2ConWpHZYUaj3j0Vazva4hGQhomEsk7rLoyyvTsUZbcLsK3
	 LayFIUubHDwmux7Dw1szjoFgBHqUX0SCXdqZA9vogJzOqh4SZeKdTjYvGjg+HhXtGhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501034;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=cGW0mJ+2hdBYx/vizWxNIRtNfckJ7CCDo5BdwrUOL4c=;
	b=Z0ZwwJUpnY/wkOkzyVsur4CyKSWJ55bJRe9qLVhwl5niLGnPEsC7319aLHv5Fdm7wjv8
	 OPV4n043PQWRa9DrFXS+ZNvN77J4k3PeGTw1BJEgrk3mz9P5Kv7gsew/h7jsT82eFE5pe
	 EmBVZuJEOxNdRmxQopkNweVFr9UyXbQouWpzK5y41owJw6FWTwca9syvX2xXWU+DI9b26
	 6bZIZfXMRQyjvjLG8CZFTYTbOaa2D3ZRf7ZJUUyvxeTSdxiMh7R83fmKFu64oGixBUb/n
	 ily7qcQy2cCn2U7/K6Zv1DuRcseIBZVXwQp22f9Qf1xN6hemHDC3wkrTCWSjUYhHGmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P7AOOHSJ;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EABF606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EABF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P7AOOHSJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cGW0mJ+2hdBYx/vizWxNIRtNfckJ7CCDo5BdwrUOL4c=; b=P7AOOHSJBvLAqXjM4rspNSg0EJ
	OUo5Qic2asYWhp9EF0CrScVvesr8XZx6A34uWUDXnnYhH5UhdkRX3FuH54x8+CdWBxvpWY3fWHN3K
	pdDaJFDwle9RKRKZjRO5f02oND0zEsAr3/zCQYtlCTUzC0jqUcjTpCMrBJUPXDsgUw2TZHD6o5A31
	JbBmxOjlp+rtSbQW+AJSW3ueG8UIOxWs0ekNjxn29EnAqK7tsO1h26Zwos0w6R7G2MwvvU9NZR4fR
	cg8mzHd/90Crnvv0IfJyviXOkM6gxMWIb1xCVUtPlLIZVzezRh5BwVV3ZcrAU8PLGllhyL4SUt+jn
	/tQMLulA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ou-00000009it4-29Of;
	Tue, 20 Oct 2026 12:57:08 +0000
Date: Tue, 20 Oct 2026 08:57:05 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] maple_tree: fix maple_range_64 crashes in RCU mode
Message-ID: <e74x2yfkylwqwbom3hw5rnimrvn5yjq6byaq7d6wzaasku6qfm@rmijwa4jfzvi>
References: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-fix-maple-tree-range64-rcu-v3-0-ebe7fb278e20@cslab.ece.ntua.gr>

On 26/10/05 12:47PM, Dimitris Charisis wrote:
> The patch series fixes two RCU destroy path issues on maple_range_64
> nodes. Both arising from the fact that a maple_range_64 node repurposes
> the last slot to hold metadata when the node is not full. Patch 1
> addresses the issues, and patch 2 adds a test used to catch them.
> 
> Currently there is no in-tree user of maple_range_64 nodes in RCU mode.
> All in-tree users of MT_FLAGS_USE_RCU also set MT_FLAGS_ALLOC_RANGE
> which makes the internal nodes maple_arange_64.

Thanks.  This looks good despite the massive change log.

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> 
> Below is the minimal reproducer used during debugging:
> 
> static DEFINE_MTREE(tree);
> static int __init maple_fix_init(void)
> {
>         unsigned long i, j;
> 
>         for (i = 10; i < 4000; i++) {
>                 mt_init_flags(&tree, MT_FLAGS_USE_RCU);
> 
>                 for (j = 0; j < i; j++) {
>                         mtree_insert_range(&tree, j * 10, j * 10 + 9,
>                                         xa_mk_value(j), GFP_KERNEL);
>                 }
> 
>                 mtree_destroy(&tree);
>                 rcu_barrier();
>         }
>         return 0;
> }
> 
> The splat for the first issue addressed by the first patch is shown
> below. mt_clear_meta() runs after the slots have been rewritten with raw
> pointers by mte_dead_leaves(), so it cannot recognize a valid last
> pointer because the type information is stripped. On my 64-bit LE
> machine, it clears bytes 248 and 249 of the maple_range_64 which are the
> two least significant bytes of the last pointer. The lowest byte is
> already zero, since nodes are 256-byte aligned, but zeroing byte 249
> corrupts the pointer.
> 
> KASAN catches it as a double-free, because that corrupted pointer
> happens to land on a node that was freed previously. The splat appears
> at 226 insertions in the reproducer. This is when the tree has a full
> root node on a 64-bit build.
> 
>   ==================================================================
>   BUG: KASAN: double-free in mt_free_walk+0x138/0x3a0
>   Free of addr ffff0000f3d40000 by task swapper/2/0
>   [...]
>   Call trace:
>    [...]
>    kmem_cache_free_bulk+0x5b8/0xc18
>    mt_free_walk+0x138/0x3a0
>    rcu_core+0x5d0/0x1638
>    rcu_core_si+0x18/0x30
>    [...]
> 
>   Allocated by task 1218:
>    [...]
>    kmem_cache_alloc_from_sheaf_noprof+0xa8/0x2f0
>    dst_setup+0x210/0x630
>    mas_wr_split+0x568/0x26e0
>    mas_wr_store_entry+0x98c/0x1de0
>    mas_insert.isra.0+0x3d0/0x5d8
>    mtree_insert_range+0xec/0x1c8
>    maple_fix_init+0x94/0xff8 [maple_fix_obj]
>    [...]
> 
>   Freed by task 0:
>    [...]
>    __kasan_slab_free+0x88/0xb8
>    __rcu_free_sheaf_prepare+0x94/0x360
>    rcu_free_sheaf+0x30/0x138
>    rcu_core+0x5d0/0x1638
>    rcu_core_si+0x18/0x30
>    [...]
> 
>   The buggy address belongs to the object at ffff0000f3d40000
>    which belongs to the cache maple_node of size 256
>   The buggy address is located 0 bytes inside of
>    256-byte region [ffff0000f3d40000, ffff0000f3d40100)
> 
>   [...]
>   Memory state around the buggy address:
>    ffff0000f3d3ff00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>    ffff0000f3d3ff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   >ffff0000f3d40000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                      ^
>    ffff0000f3d40080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>    ffff0000f3d40100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ==================================================================
> 
> The second issue fixed in the first patch is in the mt_free_walk().
> mt_free_walk() descends by checking if the corresponding slot[offset]
> entry is non-zero. In a maple_range_64 node that has
> MAPLE_RANGE64_SLOTS-1 valid pointers to child nodes, all slots will be
> non-zero, since the last slot holds the metadata. Thus, mte_dead_walk()
> dereferences the metadata as if it were a node and hits the
> null-ptr-deref as shown in the splat below.
> 
> After fixing the first issue, the reproducer reaches this case at 3166
> insertions. The affected node is the root on a tree with height 3 and it
> has 15 valid child nodes on a 64-bit machine. The first fix does not
> introduce this bug, but it exposes it for the root node because it no
> longer clears the root metadata. On an unmodified kernel, the same bug
> exists and is reachable when such a maple_range_64 node appears below
> the root, where mt_clear_meta() is not called.
> 
> Second KASAN splat:
> 
>   Unable to handle kernel paging request at virtual address dfff800000000006
>   KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
>   [...]
>   Call trace:
>    mte_dead_walk+0x78/0x140 (P)
>    mt_free_walk+0x1f8/0x3a0
>    rcu_core+0x5d0/0x1638
>    rcu_core_si+0x18/0x30
>    [..]
> 
> Both splats are from an arm64 QEMU guest. The test_maple_tree and the
> userspace suite pass after each patch in the series.
> 
> ---
> Note for reviewers:
> 
> * Before commit 790e1fa86b34 ("maple_tree: add RCU lock checking to rcu
>   callback functions") mas_clear_meta() was called while descending the
>   tree, so metadata was cleared on every node. That commit removed the
>   call from the descend path leaving only the final call for the root
>   node, and renamed it to mt_clear_meta().
> 
>   An alternative fix would be to restore metadata clearing for every
>   node and fix mt_clear_meta() for full maple_range_64 nodes. I
>   preferred removing the clearing and use slot_len to identify the valid
>   slots directly.
> 
> Signed-off-by: Dimitris Charisis <dchar@cslab.ece.ntua.gr>
> 
> ---
> Changes in v3:
> - Combine both fixes into one patch, as suggested by Liam, to avoid
>   leaving an intermediate commit where removing mt_clear_meta() exposes
>   the second bug at the root node.
> - Combine both regression tests into the next patch.
> - Link to v2: https://lore.kernel.org/r/20260916-fix-maple-tree-range64-rcu-v2-0-0b09de37eb69@cslab.ece.ntua.gr
> 
> Changes in v2:
> - Add one test after each fix.
> - Reword the cover letter.
> - Link to v1: https://lore.kernel.org/r/20260913-fix-maple-tree-range64-rcu-v1-0-31a130bb8cbf@cslab.ece.ntua.gr
> 
> ---
> Dimitris Charisis (2):
>       maple_tree: fix maple_range_64 crashes in RCU mode
>       test_maple_tree: test maple_range_64 node in RCU mode
> 
>  lib/maple_tree.c      | 43 +------------------------------------------
>  lib/test_maple_tree.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 42 deletions(-)
> ---
> base-commit: e2e54005e20fb42d4a5e140d70a65be4a2363045
> change-id: 20260912-fix-maple-tree-range64-rcu-02fa3d2e59a7
> 
> Best regards,
> -- 
> Dimitris Charisis <dchar@cslab.ece.ntua.gr>
> 
