Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314917;
	b=O1H5/zOV/5SOQJYdd3MhTWdUhR1W9N97jZUm6xTcx4aVTl1GAFZh7YZ3Qhcs+imMwYpr
	 zlmeXg6sYfArys8ZZD2Vl3oDGOZmqcRgfuSXHaiuyZGGtYG3TYr5zSrpPcaZ2K9j10W2m
	 6y931bq3bE+b2P4d2TqZrCoOW9DxMxjFFpah2Jkhoi4JjDokyTD/i3qLpLDMlLiZS+j5I
	 0Nf10gNtLnGejYXkVocwkgb8XHuQzvhFunmhkQy9++MwxcVQbklBghX4lWtHF1FKY4vaN
	 nVg4l8Q0mjpGnKkoj5GXh7pX0PVPUTc00mc3RChEApP4saOH8nVAATgnJrZ4l2nD6bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314917;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UT6I9hqZhU12+F1jokRg3E4wTJM57aYHZingagyig8Q=;
	b=LINjV7fl/o+ZlOrYuStBrOa394zXh2TFt+oIawjj0dU2Mfyamp24wpYc7NUndzQxCsgH
	 NO723Hshq6+Z1y5KxU9CUIyW98sjhrSsfcja+TD5rJnJ7TCe8/HA5WMpeiOcfBfpdSO80
	 NueditjaUmupDUU3EyRvRAHnzX/yU01+b/TdXts4m5ABsPW38Njpm0HPSb85cSXSbRWU5
	 m1+KBLR4trgp2l2O5boedSdW7fBSNoF0xliocyYU1wYnfw1WiKlB/7ubJHu1mNrXLrq+h
	 l2fZo6QnszHtMYoUFSc7c4Oo/9OrPcW2NZJcwvVVuhCMIJkUmNtd3KGtQhrdN6pbRew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AAx1o/KF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15428606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAx1o/KF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB9B1F0089F;
	Tue, 10 Nov 2026 12:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314916;
	bh=UT6I9hqZhU12+F1jokRg3E4wTJM57aYHZingagyig8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AAx1o/KFG7JNNHGjjXHOpcfX2vMXAWZuDpuK0GZFrj70Oj/t2Uxmoe9rPJCBfYHXV
	 WNsvgrAbH/i6qdGNKGKqqQexkRAsxolMBA/yV9/FUIcwBjJmoAGqFyKZDH9m62qKNK
	 O6lG1z/4+UbshgPZJ7t69ACJHYtk3lo5j2xxQ2+ek8+wDQHQLhacBBZu22+xpo35fI
	 r5XCp81wfJQiE/fAeu7IGffZTpwdy4dOKIh3Cd2C/U91SiloRQ5FEsbjdqQxbN5TQj
	 A8XAeIHK8mVoDRewuJXe18vW+JzWS7aLCgv2xzAOdmg81aKTyRbVV1ZTrGO2Ia4o6J
	 EEN2Gctu5fdQA==
Date: Tue, 10 Nov 2026 12:48:30 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Shivank Garg <shivankg@amd.com>
Cc: David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove unused clear_flush_young_ptes_notify()
Message-ID: <avMSmWU4JYReUAB9@gremlin>
References: <20261109-clear-flush-young-notify-v1-1-b37fbafa2686@amd.com>
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
In-Reply-To: <20261109-clear-flush-young-notify-v1-1-b37fbafa2686@amd.com>

On Mon, Nov 09, 2026 at 06:41:55PM +0000, Shivank Garg wrote:
> clear_flush_young_ptes_notify()'s last user was removed in
> commit f3c493d2f42b ("mm/rmap: handle device-exclusive entries in
> folio_referenced_one()"), which open-codes clear_flush_young_ptes()
> and mmu_notifier_clear_flush_young() in folio_referenced_one().
>
> Remove both the CONFIG_MMU_NOTIFIER definition and the
> !CONFIG_MMU_NOTIFIER alias.
>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

LGTM

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> Applies cleanly on mm/core.git/for-next.
> ---
>  mm/internal.h | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index b129510b92e2..b1f3a1a59bc0 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1598,17 +1598,6 @@ static inline void maybe_rmap_unlock_action(struct vm_area_struct *vma,
>  }
>
>  #ifdef CONFIG_MMU_NOTIFIER
> -static inline bool clear_flush_young_ptes_notify(struct vm_area_struct *vma,
> -		unsigned long addr, pte_t *ptep, unsigned int nr)
> -{
> -	bool young;
> -
> -	young = clear_flush_young_ptes(vma, addr, ptep, nr);
> -	young |= mmu_notifier_clear_flush_young(vma->vm_mm, addr,
> -						addr + nr * PAGE_SIZE);
> -	return young;
> -}
> -
>  static inline bool pmdp_clear_flush_young_notify(struct vm_area_struct *vma,
>  		unsigned long addr, pmd_t *pmdp)
>  {
> @@ -1641,7 +1630,6 @@ static inline bool pmdp_test_and_clear_young_notify(struct vm_area_struct *vma,
>
>  #else /* CONFIG_MMU_NOTIFIER */
>
> -#define clear_flush_young_ptes_notify	clear_flush_young_ptes
>  #define pmdp_clear_flush_young_notify	pmdp_clear_flush_young
>  #define test_and_clear_young_ptes_notify	test_and_clear_young_ptes
>  #define pmdp_test_and_clear_young_notify	pmdp_test_and_clear_young
>
> ---
> base-commit: 2683df3b7eac1d91380194955ad0c9751454610c
> change-id: 20261109-clear-flush-young-notify-dac8b5496ec4
>
> Best regards,
> --
> Shivank Garg <shivankg@amd.com>
>

--
Cheers, Lorenzo
