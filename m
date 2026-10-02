Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C0FDF59
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929385; cv=none; b=b9jYJnnVHqBfrZMZomea6ryGZ69x4jdfRbIpHxJabGHbxA/hdVpIQe/zr+RoxgjeHKReaxkdeRwll7jrxis9yd5/+So5hxMoA8CL3xICZLhmAPHPaAgENMQ6Tlpdeg/dGUUMOsYnKHxxsNAuitepFvGIlE4ij/wTORI/Gor8njE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929385; c=relaxed/simple;
	bh=vAxEGC/EITxaLl0ZWZCqXvE1xxbxFpdYESai/tyurBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxnbfiFEa20bQFRbwC2rf+fqyVpw/a4quYTrq8leLbx26z2/bVzUSTaRRG1l3zv+eCYM3O089QptRwzgDlCJBi6agrML/GggjTwvYeM8VxZX8N/VIgT4auBGGv4cnqAevkxrScVi/UPJfJ/uC2G6e46g48ETWvy0q4nMS7a1qg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxfcHBD8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxfcHBD8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FB01F000FF;
	Fri,  2 Oct 2026 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790929384;
	bh=G/f9I4vHQK4JOyc+erbBtNclRJr/3Y4Kf9SezEHiCB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HxfcHBD8rebzYNDmEhi6ZjEMfdZKUzhjRiJMId5JdydfC1VdWyb8c08N9eWtBVQDD
	 s8ik9RohZH4US83JNfPsnlk8g//6XwGPAYSZSRPl31LER1mBTyZgYsOP6gsIdd0tXy
	 nLTKGK1iGyLORSlzVOr6U7eeUq2VLTOa7+2TjgOF/DFKV0/MMF8BaQfnkxf64MzxSm
	 QR1mL6j6ja0eAy9STNBKy+bhwdvUtLq18bDlZgnYUnd+JP+TZ/wmn++l1Th5RBZj67
	 PnQXRbUhDXumsopPyQKJ5tmPfpqn8AdmtKB63Z0Mg+0rwMxgYTXHPogcXNKqrZLXFl
	 B+elqnABketew==
Date: Fri, 2 Oct 2026 10:22:55 +0200
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
Message-ID: <ar9p39Y9SmlxvbA_@kernel.org>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929053231.66085-7-songmuchun@bytedance.com>
 <ar5xbQsUpSQZg0wO@kernel.org>
 <78D5D6AA-BE36-432C-B0F7-453F93DF18C0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78D5D6AA-BE36-432C-B0F7-453F93DF18C0@linux.dev>

On Fri, Oct 02, 2026 at 09:48:42AM +0800, Muchun Song wrote:
> 
> 
> > On Oct 1, 2026, at 22:42, Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > Hi Muchun,
> 
> Hi,
> 
> > 
> > On Tue, Sep 29, 2026 at 01:32:31PM +0800, Muchun Song wrote:
> >> For vmemmap-optimized sections, tail struct pages may be backed by
> >> shared vmemmap pages. Those shared pages must carry the same page zone
> >> ID as the struct pages initialized for the section.
> >> 
> >> Warn in __init_single_page() if the shared tail page has a different
> >> page_zone_id(), which would indicate inconsistent initialization.
> >> 
> >> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >> Acked-by: Qi Zheng <qi.zheng@linux.dev>
> >> ---
> >> v3:
> >> - Collect Acked-by from Qi Zheng
> >> 
> >> v2:
> >> - New patch.
> >> ---
> >> mm/mm_init.c | 3 +++
> >> 1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/mm/mm_init.c b/mm/mm_init.c
> >> index 1650d6bc1211..bd02e8d06965 100644
> >> --- a/mm/mm_init.c
> >> +++ b/mm/mm_init.c
> >> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page *page, unsigned long pfn,
> >> if (!is_highmem_idx(zone))
> >> 	set_page_address(page, __va(pfn << PAGE_SHIFT));
> >> #endif
> >> + 	VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)) &&
> >> + 			page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=
> >> + 			page_zone_id(page));
> > 
> > Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized a tad later
> > than page so it'll have stale data in the page->flags, won't it?
> 
> Lance is right. The shared tail struct pages are already initialized by
> vmemmap_shared_tail_page() during vmemmap population, so they're not stale.
> The head 64 struct pages are initialized later — right here, after vmemmap
> population.

Still it looks out of place here, can this check be done in sparse-vmemmap
somehow?
 
> Thanks,
> Muchun
> 
> > 
> >> }
> >> 
> >> #ifdef CONFIG_NUMA
> >> -- 
> >> 2.54.0
> >> 
> > 
> > -- 
> > Sincerely yours,
> > Mike.
> 
> 

-- 
Sincerely yours,
Mike.
