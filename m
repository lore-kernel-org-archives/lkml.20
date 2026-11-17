Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877343;
	b=ILMHII1S37CJysaagSnwUAxPFBB2VL88g+gk4hvBkTjmux65Dtr9PtCBazA3Aj0zedWJ
	 oFw5lGfTkcn1opX5DslFeDr/VpLmaU9cUFl7dJ7ZmU5D/Px1rtR4E+BfexqwRu+OvaL81
	 pqWqDipAw4by7mv/ZdTdh3epu8OqLHwKwNx9bIkBugRQgSI/fygCiAuisAqGSR/2hjv2O
	 4Vr7Ztig5PcNyb6JF4mETgmrZZ5a6oNB0H3HNENJlfzmH5wkupPAEm+6vFCWF2wCBUj+W
	 XXkPAyFnGUN3U7vDYt1YRWcC18/u4DyTu/z8C2P3Lis0W24d5rRRKDaCQOr1zOou/1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877343;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8jUhG/+yD7ltzA1P4BeznW+FBUmK45hGHrDe9rOGBQI=;
	b=hJDMptZdB1dgatjhH3AYN9eDmkEZbo4k6LOgbc0KRsp/K2HVimH9+yu33hVMeawlw2Eq
	 Xd9F8jzhGMuiFFxucFZEj2O+UCmtGttt998dXiqbcjyIyOw4CaaIo+XUYX6WAsu89qrzH
	 qvfbk/E8EAMfpRdzP9jfaTv0dMJ9cy8cgKG25hRxW33gsH+JJBjJ8SFC/T6cG9rQcLHAd
	 vyn4mzP+Fhw2JGxs/tolz3L/LUiPCujTAYWwoFQIQniWNqyH/u53w4bOOnOKQqMua0p56
	 0bMOeOZ9jlUCAuMfc5z6+JA2+Fhi91eaeFFvXPrBd1PKYcadr20l/qKEtlQB2KpUIHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZmHB+25T;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76442606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76442606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZmHB+25T
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pr7ixXlMABVW+xJfmRHqZ/e1vIB1gUkwAZyRtlilqH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794877340; v=1; x=1795482140;
 b=ZmHB+25TBRRhBW31zFJrfdn6ttpzmoDErIxV6rTVUUofVjBweGbt/Jbrci/dqoB0v7KGlwu/
 Xt6nVTiE5yFq5Tnp92Uz9F855H3qbk0X2/lUoDzOgmTXjK2u93W4yoWnXWhLtrWy2rKY0z4KDhB
 rTA/nUhx0d6uoUe1MHBQXzUI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 8f80fbc7d52bf4f3;
	Tue, 17 Nov 2026 01:02:19 +0000
X-Mizu-Trace-ID: 8f80fbc7d52bf4f3
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 09:02:07 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: Nico Pache <nico.pache@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
Subject: Re: [PATCH v2 2/2] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
Message-ID: <avunj4dVyiLovWL0@dgvxl46587.localhost.localdomain>
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-2-8b61ad0491f1@linux.dev>
 <b4a82805-5b13-46d7-bdb6-0ad2eb70f148@kernel.org>
 <8375728d-c1e7-4033-8096-5d98d1bc36e9@linux.dev>
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
In-Reply-To: <8375728d-c1e7-4033-8096-5d98d1bc36e9@linux.dev>

On Mon, Nov 16, 2026 at 04:58:55PM -0700, Nico Pache wrote:
> 
> 
> On 11/16/26 3:21 PM, David Hildenbrand (Arm) wrote:
> > On 10/25/26 18:39, Nico Pache (Red Hat) wrote:
> > > Since commit b1f202060afe ("mm: remap unused subpages to shared zeropage
> > > when splitting isolated thp"), splitting an anonymous THP remaps all
> > > zero-filled subpages to the shared zeropage via TTU_USE_SHARED_ZEROPAGE.
> > > This flag is set unconditionally for every anonymous folio split,
> > > including splits triggered by KSM.
> > > 
> > > When KSM is enabled with THP=always, this causes two regressions:
> > > 
> > > 1. use_zero_pages=1: KSM calls try_to_merge_one_page() which triggers
> > >     split_huge_page(). The split remaps all 512 zero-filled subpages to
> > >     the shared zeropage at once, freeing the entire 2MB THP when KSM only
> > >     intended to process a single 4KB page. This bypasses KSM's
> > >     pages_to_scan rate limiting, causing ~1GB to be freed almost
> > >     instantly.
> > > 
> > > 2. use_zero_pages=0: The same split side-effect occurs through the
> > >     stable/unstable tree merge paths. Each pages_to_scan iteration
> > >     triggers an expensive split_huge_page() that silently frees 2MB,
> > >     while the scanner wastes cycles on tree searches for zero-filled
> > >     pages that were already freed as a side-effect.
> > > 
> > > Introduce current_is_ksmd(), which uses kthread_func() to check whether
> > > the current task is the KSM scanning thread, and use it in
> > > try_to_map_unused_to_zeropage() to skip zero-page remapping when the
> > > split is triggered by ksmd.
> > > 
> > > Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> > > Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> > > ---
> > 
> > [...]
> > 
> > >   static bool __ksm_should_add_vma(const struct file *file, vma_flags_t vma_flags)
> > >   {
> > >   	if (vma_flags_test(&vma_flags, VMA_MERGEABLE_BIT))
> > > diff --git a/mm/migrate.c b/mm/migrate.c
> > > index 7bdcdb57652f..c33ae3fa1043 100644
> > > --- a/mm/migrate.c
> > > +++ b/mm/migrate.c
> > > @@ -305,6 +305,9 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
> > >   	if (PageCompound(page) || PageHWPoison(page))
> > >   		return false;
> > 
> > This really needs a comment like:
> > 
> > /*
> >   * When the split is triggered by KSM, let it take care of scanning-for and
> >   * de-duplicating the shared zeropage.
> >   */
> 
> Ack! ill wait a day or two before sending a fixup in case others review.
> > 
> > > +	if (current_is_ksmd())
> > > +		return false;
> > > +
> > >   	VM_BUG_ON_PAGE(!PageAnon(page), page);
> > >   	VM_BUG_ON_PAGE(!PageLocked(page), page);
> > >   	VM_BUG_ON_PAGE(pte_present(old_pte), page);
> > > 
> > 
> > I'm still a bit unclear of what happens when the split is triggered by something
> > else in the system just before we walk into this THP.
> > 
> > Like, imagine the deferred shrinker scans for 0-filled pages and splits under
> > memory pressure. Then KSM scans and essentially skips the (now-split) THP?
> 
> IIUC, we dont skip the (now-split) THP (ksm works by page, not folio), we
> would only skip over the parts that were remapped to the zeropage. and
> because the shrinker already split the folio, it wont end up even needing to
> split it.

Yes, that's right, KSM would skip zero page during scan_get_next_rmap_item, but still
scan non-zero parts.

> 
> Inversely, if ksm does run into a large folio, it splits it, but doesnt do
> the remapping. Which KSM will either eventually deduplicate itself (and in
> the case of use_zero_page=1, it will also do the zeropage remapping).
> 
> I asked our robot overlords if im missing anything and it did find this
> potential issue:
> 
> KSM could trigger alloc/reclaim that would then prevent the zero-page
> remapping for any reclaim done under the daemon.
> 
> It did suggest this fix `current_is_ksmd() && !current->reclaim_state`
> basically check if we are in reclaim and ksm. This would close the gap.
> 

Yeah, `current_is_ksmd() && !current->reclaim_state` would be more precise.

Generally, LGTM if you fix that.

> Or we could go back to adding a flag to split function (but i believe this
> is still somewhat cleaner and doesnt complicate the already messy split
> code).
> 
> Cheers,
> -- Nico
> 
> 
> 
> 
> 
> > 
> 
