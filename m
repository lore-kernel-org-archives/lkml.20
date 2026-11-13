Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578963;
	b=z4E57HL2OX/D/vbE0WVYY9c06Cu43UuqQTYoHcT77JDY8XvRLIHI4gaHymvLgoSpRjJn
	 9Xrh9YjJvu63tta9DZf4m3iEcj++GfR8YqNb6blSAhIrVdgnCYdeoH94P+fJKLrCyd2s8
	 fpVj6RXWW/8Q31u84jIU2XrjX6w7BzETptQp/71r8vcrUk4zDL3D+zxj6cqd2VoJghf9y
	 +91ArmYhSjFTKaQOAksozbzhlWwx6y7dJ6eqR9Og/qJMXrS+HjZEcIypMIAJAi9XK3Q03
	 aCKu6zg17QZSQJbxOkMNGwbp9l2ZciTPvksJAg92tRq4xMpPkxqim0TdD8pKs9LnEhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=F5RaYaqTlEkq9wWix1JsfPr5fojmN++2yJa5YPxa4A8=;
	b=EPkxjSDb4QKRyn8OHPQn09toiRue26NQt0HjhYKoxuMI3r/MkcRlB6x4qN1OW2TtXkPV
	 3J2UfDMfiwB7zbNicMTGP69v/I6uRpGVBFb9nOGV6QleS4Z+gGoSi0sgljot4ZUFk8/Oa
	 BgLu0uwm18MV86BqZy2eIKCDrT7U7c5tDyZXDbdYPyzVNwVBfsYaRkv41pErl8Rlz5v6a
	 CBIVXWA1uj9qBC5X87o9XIWVxLVjivO0QLggApFkuC+8oMg//P/O4yriH7XIMqUjNG4DU
	 ITFTQg92gbdCgtFuKXC9o6nPfVhHvFBmPKrzgvL7EF3wpkPOslhex7HOhYiF2PEsVFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OqzYynOZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32792606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OqzYynOZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0611F000C4;
	Fri, 13 Nov 2026 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578962;
	bh=F5RaYaqTlEkq9wWix1JsfPr5fojmN++2yJa5YPxa4A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OqzYynOZXG2odj2F1DNoZv1gtpuyl6JnGus5F6/MZ5s5tBFfgZETBm+4pk7aElvqL
	 Dw1XXOtW45uMZHuk3Oey65/lhdIS03HohsIjNtyrII4Q5WNVJugP4YlCM7VvJsKwBU
	 DNnvgsXX3b3d27pD6tWEzzQf7PI8NItIm13gNtK6TgeQFePMVuvg3qLvvxFRisq/Wx
	 CMgH9oR3pfZamxCLJT9xVmUXnnas92V9pQBahfy7o1fDOFZFvHiJ5yO7EePDwZB1Kf
	 PAhxeHWJbAcrbcFfQMJhI5m1nZmxYrQndPqaveeLNY++Sz98nWlen6e9h689Vo8JSC
	 B2WbZGyb/C2Fg==
Date: Fri, 13 Nov 2026 14:09:18 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] mm/ksm: add initialization helpers for
 scan_get_next_rmap_item()
Message-ID: <avcZQNlZ7cisQAeG@gremlin>
References: <20261112125754.176930-1-xu.xin@linux.dev>
 <20261112125959.177881-1-xu.xin@linux.dev>
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
In-Reply-To: <20261112125959.177881-1-xu.xin@linux.dev>

On Thu, Nov 12, 2026 at 08:59:59PM +0800, Xu Xin (vivo) wrote:
> Extract the new scan cycle detection (including draining per-CPU LRU
> caches) and advancing the scan cursor to the first mm_slot into
> scan_begin_new_cycle() and scan_get_first_mm().
>
> This keeps the exact execution order intact while making
> scan_get_next_rmap_item() cleaner and easier to follow.
>
> No functional change intended.
>
> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>

Again, thanks for doing this! LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/ksm.c | 70 +++++++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 46 insertions(+), 24 deletions(-)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 49977bcf04f7..e79e64372e49 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -2640,6 +2640,49 @@ static void ksm_reset_unstable_trees(void)
>  		root_unstable_tree[nid] = RB_ROOT;
>  }
>
> +static bool scan_begin_new_cycle(void)
> +{
> +	/* Check if the cursor points to the head. */
> +	if (ksm_scan.mm_slot != &ksm_mm_head)
> +		return false;
> +
> +	/*
> +	 * A number of pages can hang around indefinitely in per-cpu
> +	 * LRU cache, raised page count preventing write_protect_page
> +	 * from merging them.  Though it doesn't really matter much,
> +	 * it is puzzling to see some stuck in pages_volatile until
> +	 * other activity jostles them out, and they also prevented
> +	 * LTP's KSM test from succeeding deterministically; so drain
> +	 * them here (here rather than on entry to ksm_do_scan(),
> +	 * so we don't IPI too often when pages_to_scan is set low).
> +	 */
> +	lru_add_drain_all();

The sashiko finding is silly, this reorders it after advisor_start_scan() which
calls... ktime_get(), yeah it's zero delta :)

> +	return true;
> +}
> +
> +static struct ksm_mm_slot *scan_get_first_mm(void)
> +{
> +	struct ksm_mm_slot *mm_slot = ksm_scan.mm_slot;
> +	struct mm_slot *slot;
> +
> +	spin_lock(&ksm_mmlist_lock);
> +
> +	slot = list_entry(mm_slot->slot.mm_node.next, struct mm_slot, mm_node);
> +	mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
> +	ksm_scan.mm_slot = mm_slot;
> +
> +	spin_unlock(&ksm_mmlist_lock);

NIT: optional, but this could be:

	scoped_guard(mutex, &ksm_mmlist_lock) {
		slot = list_entry(mm_slot->slot.mm_node.next, struct mm_slot, mm_node);
		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
		ksm_scan.mm_slot = mm_slot;
	}

> +
> +	/*
> +	 * Although we tested list_empty() above, a racing __ksm_exit
> +	 * of the last mm on the list may have removed it since then.
> +	 */
> +	if (mm_slot == &ksm_mm_head)
> +		return NULL;
> +
> +	return mm_slot;
> +}
> +
>  static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  {
>  	struct mm_struct *mm;
> @@ -2653,36 +2696,15 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  		return NULL;
>
>  	mm_slot = ksm_scan.mm_slot;
> -	if (mm_slot == &ksm_mm_head) {
> +	if (scan_begin_new_cycle()) {
>  		advisor_start_scan();
>  		trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
>
> -		/*
> -		 * A number of pages can hang around indefinitely in per-cpu
> -		 * LRU cache, raised page count preventing write_protect_page
> -		 * from merging them.  Though it doesn't really matter much,
> -		 * it is puzzling to see some stuck in pages_volatile until
> -		 * other activity jostles them out, and they also prevented
> -		 * LTP's KSM test from succeeding deterministically; so drain
> -		 * them here (here rather than on entry to ksm_do_scan(),
> -		 * so we don't IPI too often when pages_to_scan is set low).
> -		 */
> -		lru_add_drain_all();
> -
>  		ksm_prune_migrate_nodes();
>  		ksm_reset_unstable_trees();
>
> -		spin_lock(&ksm_mmlist_lock);
> -		slot = list_entry(mm_slot->slot.mm_node.next,
> -				  struct mm_slot, mm_node);
> -		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
> -		ksm_scan.mm_slot = mm_slot;
> -		spin_unlock(&ksm_mmlist_lock);
> -		/*
> -		 * Although we tested list_empty() above, a racing __ksm_exit
> -		 * of the last mm on the list may have removed it since then.
> -		 */
> -		if (mm_slot == &ksm_mm_head)
> +		mm_slot = scan_get_first_mm();
> +		if (!mm_slot)
>  			return NULL;
>  next_mm:
>  		ksm_scan.address = 0;
> --
> 2.34.1
>

--
Cheers, Lorenzo
