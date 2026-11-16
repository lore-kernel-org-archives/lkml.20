Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838482;
	b=hxkHwQrbWYY2wIx5sGmTh5DYOlCqUIM8c00O3ZxFz4YGB0UxFS132Ic8AkkVvEzZtuc9
	 qIaaoQC3FlWzZ0kG0b03LDJVle438KsGanJc0P1mxXay74n4zNjjdrsgfgb37w1W/SdjJ
	 WOH46puRDCyqFqw6y8g0Mo6mkFaAntauBoOt6cn20xF9fo9Zv/Y2FUKFV8PgR3x4ug8vC
	 1urJSXn5pz3+ukpXvX/sCQbdtzFmGVLRK+QCIJ4gLE9ycKspB4dQzosex2mY2Y8bYKbnm
	 QXVuE7hzQ02As2B1HxKI4O+r7Ln3/DTCRW8QdxHYvDStxZDSJ7GANO6yUxkqnGoK9RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838482;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EZpAJBrxVDUG3AN5aD0Qg1NU1l6jqV0Ou7o1Iq7ljhc=;
	b=e7jKSMowbnlgJ9ilwLcQBOOUbHinsR3r744oYlhBZlKI8PXNX7BU2g7qjyU3cLiqAwQr
	 vgI9v+cxZFoSBBloZ3IXVn4Q66X3hWK9h/ZrToLeKtoapuMCnJpNwB+L6Y+2b9djwMOD6
	 H7N9tRDgKpkq6PQy+fQk0IOQQiH6HNnNUdKsgCGuhTJhEq57jiF/QYJ/DyXcCd6sbe2CC
	 VMlpvodbTRmFJZgbFkd85cbOYvUNsff0xpC2whpZoKIkfCmY8tKd7NHCDGIpe+DBQx5Fa
	 Ly3OlXbj/DbxjGRROrctSYPXEaqXlrq8EB2GgLKdl2j6spJzoQnMciYivCg9xmQ+1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Otsqep25;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Otsqep25
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21AA51F000C4;
	Mon, 16 Nov 2026 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838481;
	bh=EZpAJBrxVDUG3AN5aD0Qg1NU1l6jqV0Ou7o1Iq7ljhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Otsqep258j7a+fFg2THl4lNVNvtC6aDcWX37zWqfZJKN2mhSsfWGwIjoEC4R0bLEt
	 YXF0jBgnBZRxZmVRcMpFLUZfdHaTjOU3RmFZbKu/f4BLfXL7Wf01W3sRklRX6lOFcG
	 5RqCELFJ4Onj+ISZXwdDIJBu+WxZMxTT0729yjDYM2gFoSv2F6ogCPqiF26DVvJdpR
	 8JTvbNHGRouYDUQVCRD4n2bRpW/5wxnNhywny5ovmpMcf7pFCdhqRuV7fFKuzGmqNY
	 hYvbSAfakWXxDYIIXYEEzWH/Tx/iN+oiiqkJQSC8SyIIro6zHT1E7Wrc/TsroTtqNA
	 1JBgQW6wjc/CQ==
Date: Mon, 16 Nov 2026 14:14:37 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: chengming.zhou@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 2/2] mm/ksm: add initialization helpers for
 scan_get_next_rmap_item()
Message-ID: <avsOr-03NtFVG-6a@gremlin>
References: <20261116014434.310003-1-xu.xin@linux.dev>
 <20261116014655.310486-1-xu.xin@linux.dev>
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
In-Reply-To: <20261116014655.310486-1-xu.xin@linux.dev>

On Mon, Nov 16, 2026 at 09:46:55AM +0800, Xu Xin (vivo) wrote:
> Extract the new scan cycle check into scan_should_start_new_cycle()
> and add the helper scan_get_first_mm() that advances the scan
> cursor to the first mm_slot.
>
> This keeps the exact execution order intact while making
> scan_get_next_rmap_item() cleaner and easier to follow.
>
> No functional change intended.
>
> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>

Nits below but otherwise LGTM, with those addressed:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

> ---
> Changes in v3:
> - Initialize mm_slot = ksm_scan.mm_slot in the else branch when continuing
>   the current scan cycle, fixing an uninitialized variable warning/bug
>   (kernel test robot).
> - Drop Lorenzo's Reviewed-by tag due to the v2 bug fix.
>
> Changes in v2:
> - Rename scan_begin_new_cycle() to scan_should_start_new_cycle() and keep
>   it simple (David).
> - Keep lru_add_drain_all() in scan_get_next_rmap_item() (David).
> - Use scoped_guard(spinlock, &ksm_mmlist_lock) in scan_get_first_mm()
>   (Lorenzo).
>
>  mm/ksm.c | 47 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 13 deletions(-)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 8db6743ece6d..89a3da4a4874 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -2638,6 +2638,34 @@ static void ksm_reset_unstable_trees(void)
>  		root_unstable_tree[nid] = RB_ROOT;
>  }
>
> +static bool scan_should_start_new_cycle(void)
> +{
> +	/* Check if the cursor points to the head. */

Probably this comment is redundant, I think the code already makes this
clear.

> +	return ksm_scan.mm_slot == &ksm_mm_head;
> +}
> +
> +static struct ksm_mm_slot *scan_get_first_mm(void)
> +{
> +	struct ksm_mm_slot *mm_slot = &ksm_mm_head;
> +	struct mm_slot *slot;
> +
> +	scoped_guard(spinlock, &ksm_mmlist_lock) {
> +		slot = list_entry(mm_slot->slot.mm_node.next,
> +				  struct mm_slot, mm_node);
> +		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
> +		ksm_scan.mm_slot = mm_slot;
> +	}
> +
> +	/*
> +	 * Although we tested list_empty() above, a racing __ksm_exit

I think you need to update this comment to reflect the fact that you moved the
list_empty() check :)

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
> @@ -2650,8 +2678,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
>  	if (list_empty(&ksm_mm_head.slot.mm_node))
>  		return NULL;
>
> -	mm_slot = ksm_scan.mm_slot;
> -	if (mm_slot == &ksm_mm_head) {
> +	if (scan_should_start_new_cycle()) {
>  		advisor_start_scan();
>  		trace_ksm_start_scan(ksm_scan.seqnr, ksm_rmap_items);
>
> @@ -2670,21 +2697,15 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
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
>  		ksm_scan.rmap_list = &mm_slot->rmap_list;
> +	} else {
> +		/* Continue scanning the current mm. */
> +		mm_slot = ksm_scan.mm_slot;
>  	}
>
>  	slot = &mm_slot->slot;
> --
> 2.34.1
>

--
Cheers, Lorenzo
