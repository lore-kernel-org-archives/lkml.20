Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384019;
	b=QWHRCDAzrLoK0fpkWN2JisqmPEnF106q6Y8u/3EBLsu+ydJE7YOipEhzrrlKNlsgX1T8
	 WzpKWKLSVCsehJPk6iyUxch9DE5817f5lYT0F8qB5G2auUV/eWVEPy0XNX0euMgtPWpL5
	 Gd1VPNNWFretWWi6l2oIqbVKhW8XYiqVKAYYIYTmGjFY9O/idk0OBE4/3KqUrnVfD0sHl
	 lYqd/aKEVsyEJ3V7I4Zk9J8Dz+7v+WNxkzVtJExx3ew4Y5K5e/Owf/cHhdRxhspVBY9Wn
	 OVwgXeBVTnoynjSU30Efpw7BeLLAREFveGRvhCCLvy8+Cev+V/LSCsZPBM1bmOK4EhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384019;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ymCWphKfzcDfO41n1HV0rigfpNtNxqnMt90FaYWdvh4=;
	b=lVE+fMGiSERHoU9ni+vEVjMwdT+3kpmQvPmWgXF/Ij3siR8xQmeJ64d7HbwUFmCf/xEI
	 CxaoTTj1p21THAzQ6JEXVCT9VM8iAhjGWUcKxEixsaXbs0okHkkWknpc2KIfInsidt4yJ
	 ralXpwGv9lFdormeRlMjTRFOmsdhQyPIBm+5ZKDaiYzkkGp/e0cNDVnaan1XvnIObkrLc
	 gd2VbGF+aEaUfmEV+1jXKZrnIa8tepbkAApJAYC97FSXaxsvtzeAj3jthNBOE1zfiHcUg
	 okiBB/qTDK6Mg0Mm6vTaqnNlg6lt76jL+HC07Trujyu33A826e14b+YlLWZvJFqipjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sn2dg4v4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C7460A2601
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sn2dg4v4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41D01F00A05;
	Wed, 11 Nov 2026 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794384019;
	bh=ymCWphKfzcDfO41n1HV0rigfpNtNxqnMt90FaYWdvh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sn2dg4v4Q0NRYHhHk+EwkVrva7WTpJ32iIZNPLtwX1VLgiGQBCCGLp0Zhu9zujEWE
	 O5c2LSjMzcr3UYvSWrmtB4Xl0D2lyGYnmaW6FSo1BqDProO/Btm+A+vd/BC+yB/5YI
	 9n2YNd6kDO4tw4z4Wka8ipOEHsO5eQ3nSlenDf2ahQYdSM+d1yfEoVaqSd7nwP5Y4/
	 MpLJkqgV1lL+ZCMYYBJCkDnpEVTqpTpH4EziTtVs2YSJ/4K8chde5xh862ZTfUJt6m
	 04y/ZZP1WO3VkuWy/+YJvWdmfVHJYPQR9jjbVk7NECFd9tmphdmGouCexMKKPWXnA2
	 gawIpNy0TiUqw==
Message-ID: <5f9c449e-43b3-4732-9c14-8199418cace0@kernel.org>
Date: Wed, 11 Nov 2026 09:00:10 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/migrate: improve mlock tracking for PTE-mapped
 large folios
To: Wandun Chen <chenwandun1@gmail.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Kiryl Shutsemau <kas@kernel.org>
References: <20261110123218.1579490-1-chenwandun1@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261110123218.1579490-1-chenwandun1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 13:32, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Commit ab521b4142aa ("mm/rmap: improve mlock tracking for large folios")
> mlocks a large folio when all its pages are added in one rmap operation.
> However, when a PTE-mapped large folio is migrated, remove_migration_pte()
> restores PTEs individually, passing nr_pages = 1 to the rmap helpers. As a
> result, PG_mlocked is not set on the destination folio.
> 
> Reclaim can restore mlock in try_to_unmap(), but Mlocked in /proc/meminfo
> remains undercounted until that scan occurs.
> 
> Restore mlock once the full mapping has been restored in a locked VMA
> under one page table lock, rather than waiting for try_to_unmap() to
> restore the mlock state.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> ---
>  mm/migrate.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 94033c222e04..140e291d4587 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
>  {
>  	struct rmap_walk_arg *rmap_walk_arg = arg;
>  	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
> +	unsigned long nr_ptes = 0;
>  
>  	while (page_vma_mapped_walk(&pvmw)) {
>  		rmap_t rmap_flags = RMAP_NONE;
> @@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
>  			else
>  				folio_add_file_rmap_pte(folio, new, vma);
>  			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
> +
> +			nr_ptes++;
>  		}
> -		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
> +		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
> +			if (folio_test_large(folio) &&
> +			    nr_ptes == folio_nr_pages(folio) &&
> +			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
> +				mlock_vma_folio(folio, vma);
>  			mlock_drain_local();
> +		}
>  
>  		trace_remove_migration_pte(pvmw.address, pte_val(pte),
>  					   compound_order(new));

I guess pte batching would be one way of handling it, but that requires more churn.

The spirit is similar as in try_to_unmap_one(), where we count the number of
ptes in one VMA. For consistency, I would call it "ptes".

@Kiryl, can you take a look?

BTW, why don't we care about that in try_to_migrate?

-- 
Cheers,

David
