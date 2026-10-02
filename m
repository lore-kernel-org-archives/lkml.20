Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2FE3D810F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964770; cv=none; b=BciYTgA1rB6TfnkD0SyQCYpVj4Fp02jUFiTZvJzImBVGZVOv3MnB3djCoOYc8ef8O1Hy+vmPXsxsKuw2MZkjv1LnHd9Ne4vJ2UpPCe1JY2zgvYt+Zgt/HtDvbKaSUBtWuQ7EFzphIi/jCgwv84nm1kBIpvJs8UjgzjcpgJTr6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964770; c=relaxed/simple;
	bh=k3+m/tfgIoEhYfQ9b1znZ7J4AsQ71/eGy/gtuGn78/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QObiGb+gMAz5PJz0LVlazwXmNxjDxS6Rx6r8E5dLzFcZlyOjV9DwizgnPbDema6g8xJQY6mla0zw/y7DGWxecrdOS/uJMaiwldVld4sUpZq08I1nN97dVxKtghOPZ5qj7G5DnBRwclyQyFVX/Q7C9eB9RYJM1jalBW/eCw9n76g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0REfLB+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0REfLB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C070F1F000FF;
	Fri,  2 Oct 2026 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790964768;
	bh=g8XGruUG1q9NlQK3HfsezWI4sNwg1U3GmGD0QRbensM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V0REfLB+j9fthMzAGcutHRNmRjr4fXKGl1aG9r8XK0w+Vy31R2L9pIYOOWtSZBw3U
	 7qyfwbDD83FmvTuz/gfIb24vWYjIoi/zze2L5JgCYcUWmqce1xusyI7j5+nqBM+MjO
	 27DBo08CWDgdEvumIyd2DotOo5ve2+0IFdtN0jqI5CGjcyLBNLz/3AZRwe7WVDsF2+
	 OldX0GA0jKKM+8yhQ8cXETn3mQMG47JK/JjJ2Y+VWgt70E9FZp7zqmkM8202/EeQot
	 H5P/0nnTUDfDsBZfsNIws2Csfz0zHJOh9GPJm2AmOCw1tlEl4vfgYkJLZPYoZl6IZE
	 j20D1JesWAFYQ==
Date: Fri, 2 Oct 2026 20:12:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page
 init
Message-ID: <ar_0GLYM6KsIH6tQ@kernel.org>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929053231.66085-7-songmuchun@bytedance.com>
 <ar5xbQsUpSQZg0wO@kernel.org>
 <78D5D6AA-BE36-432C-B0F7-453F93DF18C0@linux.dev>
 <ar9p39Y9SmlxvbA_@kernel.org>
 <85941AA4-7E50-4AAE-BC05-0F443B21BE8B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85941AA4-7E50-4AAE-BC05-0F443B21BE8B@linux.dev>

On Fri, Oct 02, 2026 at 05:56:40PM +0800, Muchun Song wrote:
> > On Oct 2, 2026, at 16:22, Mike Rapoport <rppt@kernel.org> wrote:
>
> >>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
> >>>> index 1650d6bc1211..bd02e8d06965 100644
> >>>> --- a/mm/mm_init.c
> >>>> +++ b/mm/mm_init.c
> >>>> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
> >>>> if (!is_highmem_idx(zone))
> >>>> set_page_address(page, __va(pfn << PAGE_SHIFT));
> >>>> #endif
> >>>> + VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
> >>>> + page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
> >>>> + page_zone_id(page));
> >>> 
> >>> Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized a tad later
> >>> than page so it'll have stale data in the page->flags, won't it?
> >> 
> >> Lance is right. The shared tail struct pages are already initialized by
> >> vmemmap_shared_tail_page() during vmemmap population, so they're not stale.
> >> The head 64 struct pages are initialized later — right here, after vmemmap
> >> population.
> > 
> > Still it looks out of place here, can this check be done in sparse-vmemmap
> > somehow?
> 
> The struct page entries of a vmemmap-optimizable compound page
> are currently initialized in two stages. During vmemmap
> population, the shared tail entries are initialized first. The
> retained head area—normally 64—is initialized later through
> __init_single_page().
> 
> This warning connects the two stages: while initializing the
> retained entries in the second stage, it verifies that their zone
> information is consistent with the shared entries initialized in
> the first stage. Therefore, the same check cannot be performed
> during vmemmap population.
> 
> I am planning to first unify the HugeTLB and Device DAX
> compound-page initialization through a common helper [1]. Once that
> work is complete, maybe it will be easy to move the initialization
> of the retained head area into vmemmap population. With both the
> retained and shared entries initialized in the same stage, there
> will be no cross-stage inconsistency to check, and this warning
> can be removed.
> 
> Would keeping the check here for now and removing it as part of
> that follow-up sound reasonable to you?

While it feels really out of place in __init_single_page(), but having it
memmap_init_range() close to the if that skips shared tail pages makes
sense.

What do you say?
 
> [1] https://lore.kernel.org/20260513132044.41690-18-songmuchun@bytedance.com/
> 
> Thanks,
> Muchun

-- 
Sincerely yours,
Mike.
