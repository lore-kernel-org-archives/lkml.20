Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933274;
	b=j0HptvTPcNvRqen7p0yATImaV/ahmwdj35vwz82IAQBXq8a1umc+YKpkfufAgeS0NxRr
	 WA+exWinrHwiItkiMTn2Rwp9ZqFCelPXh2f+tyEIqYeWGmcjGB4gNL/pi+5saS08NSTVq
	 lrSR8zPENCvj8uUDhVg4zgwXdYQOnCN+fJmoi9R3nYVNdgsQzkIpV1Fm8bx9Cr7voWdPs
	 zD8wdXmAHS7iq1VobwoNV56PPUvnlA384y7KpdutEsXDP+NGyD8HHk/L/GxuwBKIRDjgp
	 suRJy6SZ/qVJfSYk0IcPXZoXtGXNR9HClIYiulO+U6V347LkVBDqY5LB7I31AWc1DGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933274;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JEEmq1dY81wdbCeTX7SttAeKu8NSqyPmmLobfOaFWuo=;
	b=kveL9AobFN2AqOeZZhx8KtjtSphctlDymT2vgcpVvHVui6gi8iAlyPhceDVhM1EkLzn4
	 zIMybDgts1AfU1vl5umrSrtykc4IU3w8AqzQpg/Prdy01NzvEVFDzBxDaBb4nQEQ9BnOZ
	 GxFnHctsUtHY6lzU9HOgiWf736OrgGOdqxGoC4I9Ww2lEDtiUKcTrhq8jczzy5d1fQ4tF
	 cqhTbKSP9UwovLg+fuGoWHdEre0Nhg6FTwQ8o52ysevhQ0ysdiT1fzMFrgcgTmR0JLkkA
	 Id2UWFqwraO9Pm6TW5XshFNBMxp9nFmQWYCJck2W2MkjEY3nsGLuGEBIhCJFb5a7jfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IfpL3SzR;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5857F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IfpL3SzR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RJgmEkz4jSKky+L1Q1MlhqmjHI4xCv6x+BFHapl0q5g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933271; v=1; x=1795538071;
 b=IfpL3SzR7Nvihq9US39Oqm3zkEnRicLRID6CM6pD9965dMcj8R+v8Pg6U6oppvPgNyt/bCoO
 4ao82qHM39cCYvBWukc+QdjG4GgGFyXkLMMzDeysMwKkJyNztktyJfXVGjV+hiqRWDIN/3rlE59
 dUdRes882EQpHe6tLSNPhUH0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 60d8652a3546647f;
	Tue, 17 Nov 2026 16:34:31 +0000
X-Mizu-Trace-ID: 60d8652a3546647f
X-Migadu-Flow: FLOW_OUT
Message-ID: <a852dce9-4ece-4508-8e07-89768cf6713e@linux.dev>
Date: Tue, 17 Nov 2026 09:34:23 -0700
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
Subject: Re: [PATCH] mm/khugepaged: mark ptes dirty and soft-dirty on mTHP
 collapse
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lance Yang <lance.yang@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Chris Mason <mason@kernel.org>, Daniel Wade <danjwade95@gmail.com>
References: <20261117-khugepaged_mthp_dirty-v1-1-024e4a12c2fa@kernel.org>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <20261117-khugepaged_mthp_dirty-v1-1-024e4a12c2fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/26 2:28 AM, David Hildenbrand (Arm) wrote:
> An mTHP collapse can lose soft-dirty PTE bits if pages were written and
> the VMA was then made read-only, and not setting the PTE dirty in
> VMAs without VM_WRITE can interact with a later MADV_FREE on a COW-shared
> page such that all processes lose the data even though a single process
> MADV_FREE'ed it.
> 
> Collapse does not preserve the soft-dirty bits of the old PTEs, so the
> new entries must be marked soft-dirty. map_anon_folio_pte_nopf() relies
> on pte_mkdirty() to do that, but only calls it if the VMA has VM_WRITE.
> 
> Further, after CoW-sharing such collapsed folios later, all PTEs will be
> clean and the folios will be clean. One process doing a MADV_FREE can mark
> the folios as lazyfree and result in all processes sharing it losing the
> data once memory reclaim zaps it.
> 
> In map_anon_folio_pte_nopf(), call pte_mkdirty() unconditionally, just
> like map_anon_folio_pmd_nopf() already does with pmd_mkdirty().
> 
> Consequently, we always mark these PTEs dirty (including soft-dirty) but
> only set them writable if the VMA has VM_WRITE.
> 
> This essentially reverts Hugh's commit 1ac0cb5d0e22 ("mm: fix anonymous
> dirtying") that back then touched do_anonymous_page() to avoid forcing
> clean anonymous pages through swap instead of discarding them. This no
> longer applies as shrink_folio_list() allocates swap for ordinary
> anonymous folios and unconditionally marks them dirty before unmapping,
> regardless of PTE dirty state. Keeping their PTEs clean does not make
> them discardable.
> 
> This now also marks fresh anonymous PTEs dirty and soft-dirty in read-only
> VMAs when page faults allocate real pages.
> 
> This has low urgency.
> 
> Fixes: e22f2fe72c74 ("mm/khugepaged: generalize collapse_huge_page for mTHP collapse")

I was just thinking yesterday: "Im happy the mTHP collapse stuff 
survived this AI wave". I guess I spoke a day too soon ;P

LGTM!

Reviewed-by: Nico Pache <nico.pache@linux.dev>

> Cc: stable@vger.kernel.org
> Reported-by: Chris Mason <mason@kernel.org>
> Reported-by: Daniel Wade <danjwade95@gmail.com>
> Closes: https://lore.kernel.org/all/20261117075246.61336-1-danjwade95@gmail.com/
> Reviewed-by: Daniel Wade <danjwade95@gmail.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>   mm/memory.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index d2f48d78b0d7b..45875d1d3b3df 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5522,8 +5522,7 @@ void map_anon_folio_pte_nopf(struct folio *folio, pte_t *pte,
>   
>   	entry = pte_sw_mkyoung(entry);
>   
> -	if (vma->vm_flags & VM_WRITE)
> -		entry = pte_mkwrite(pte_mkdirty(entry), vma);
> +	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
>   	if (uffd_wp)
>   		entry = pte_mkuffd(entry);
>   
> 
> ---
> 
> base-commit: 1c2962a57377c9878cbefb747488324d4e678982
> 
> change-id: 20261117-khugepaged_mthp_dirty-067f734d38aa
> 
> --
> 
> Cheers,
> 
> David

