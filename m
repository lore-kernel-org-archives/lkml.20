Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923133;
	b=0bkJtWyJjbPpPHhx2uceELlnjkDb5DvnS7S9NHneavMgRG2FHgu+QhpHRcv1p882vXky
	 XCRSqNKuvKHdJEM3NqVqQLUI7mzwAbX5+2VKgzf2EqMJr4q9efoIzMt0tFQgEbwScdTUz
	 iORm/MCZsGL+Opm77IyYICTR0sMisqWLbhJZAjj/MlHVFM64trFObdNl0DswQ4fk5DNBV
	 uprXhuYu59J6q6tYKBg7glfwXN0AmbaFkyx4loeEFBrbLxHvuDHM5Sn9iWTVxMr/q5atm
	 y1zY6SzqiH9M015hJCVgNaMIdPX6IBe5YqOoZzGME9FoujJ41bKeEff8ET9WkZ3fAeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923133;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9RxcEVLntdlNyWLzPXyKVC17NRSyE5s4TlFMufLDfE0=;
	b=kpYfbs+lhGKPzQWwIlyxEWrjlvyDBg+AGjXYXIXjAt2U/H/jNNhxTsbf6o5h/ZUKm9lM
	 3EAtz4d+sHCFw26qxQvaVnl0+sXSDKMGD4BFBKkos7pLPYK5+/XSxaeoPeSrZMTV6xgal
	 JflsItNf1doS3sXG/Ubfhy+Tl7I1j5auqION64k/B2ezvfiF3wg3UY8qQFudhG38s96l0
	 kjAClUwyZjyexZU6JPDFnm/2qn461CTtsyxazNn6fMbLNUbZz5nXWoHCvMYJpc31FotHs
	 efjqxjmleB2gkUse5uRnvRaUgKLENN6RBvStojmE4SRK82++Ny2P8GGQXimV0z9yFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUqpmg8t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29D606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUqpmg8t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0EF1F008BC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793923132;
	bh=9RxcEVLntdlNyWLzPXyKVC17NRSyE5s4TlFMufLDfE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZUqpmg8t9LbQT7HdUz5nRHob2gBTphGClUqS7uklQpMPXBAvr6tUJnXHDagXn+X++
	 sqV6d88O1P160SGW+GEq+Jd+ZgJZqAeI4C51Hc17dWUbz8uiDtalK5BiA1iszVz71x
	 qSRZUKoR00Ba1VZ/f03CahzTY/AnHaoPC9BaNsIHumxRIN3rtJuErI8y7JonWbvDyl
	 Fvb6jGa8cNG3Vl4ccJuC6ukRKZxjnCHb+HwgMjfBGZwtBw8jbecAcW5G9Dus0Rf93S
	 nT4nuthW5sdHUoXubgYnNoH9MUw4qo3f0jemeZWJhgcPm4Texl0YxzNd00OSo/YYr7
	 xL9tWOMZb7Tgg==
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac4855401so47888e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByvKp69CBv8YVjDeX5dLSL6ECD2RCLVAqtWkHN07JUR5m6/d/hnomVnZ7J9CnaP7xYjDgyZ90LZRWZ/ZiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g0vv25tVAEQt23/CIX830SvIA+eNDGVRRf8aRkFYmj2dJXW1h
	0qbAn53lLa/yAdwapj6UeBRRbKtdoDPSBMRq0TaIJjoCsmbG4tbFnO65CzT6rawptEvIh07f5sP
	RJHjoT2lkqjPAYJuL93ziFJ+jY7+iD/s=
X-Received: by 2002:a05:6102:3c91:b0:7cc:2cd0:e74f with SMTP id
 ada2fe7eead31-7d2a16661f2mr819233137.30.1793923131659; Thu, 05 Nov 2026
 15:58:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr> <20261023211629.16227-1-baohua@kernel.org>
 <CAEmasaVgBV+tYg7xDV96qBQ1oEVgUL3F_BnCLJW3LRjZ7ai+Yg@mail.gmail.com>
In-Reply-To: <CAEmasaVgBV+tYg7xDV96qBQ1oEVgUL3F_BnCLJW3LRjZ7ai+Yg@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 6 Nov 2026 07:58:40 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xBtKGqXFP4zvp+Qn+tb4X7aCvXn+wqDqot_cXR92DjhQ@mail.gmail.com>
X-Gm-Features: AclHuK94wL6URx0P-0wNVaWC8-E-wn_W5XHvI8H9jBiKlNUyiYq8M39JGoNSU9o
Message-ID: <CAGsJ_4xBtKGqXFP4zvp+Qn+tb4X7aCvXn+wqDqot_cXR92DjhQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alexghiti@meta.com>
Cc: alex@ghiti.fr, akpm@linux-foundation.org, baoquan.he@linux.dev, 
	chengming.zhou@linux.dev, chrisl@kernel.org, david@kernel.org, 
	hannes@cmpxchg.org, kasong@tencent.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@suse.com, nphamcs@gmail.com, rppt@kernel.org, ryncsn@gmail.com, 
	shikemeng@huaweicloud.com, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, yosry@kernel.org, youngjun.park@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:55=E2=80=AFPM Alexandre Ghiti <alexghiti@meta.com>=
 wrote:
>
> Hi Barry,
>
> I'm back from holidays, sorry for the late answer.
>
> On Fri, Oct 23, 2026 at 11:16=E2=80=AFPM Barry Song (Xiaomi) <baohua@kern=
el.org> wrote:
> >
> > >
> > On Wed, Oct 7, 2026 at 11:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr>=
 wrote:
> > >
> > > Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchron=
ous
> > > device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readah=
ead.
> > >
> > > zswap is the same kind of in-memory, synchronous backend as zram, not=
 a
> > > swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> > > swapin_readahead().
> > >
> > > Here are the results from bypassing readahead for zswap too: it was
> > > measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, sh=
rinker
> > > off, on Sapphire Rapids and 3 iterations.
> > >
> > >   768M memcg (sustained swap thrash):
> > >     metric                 mm-new    + bypass    delta
> > >     build time (s)          405.0       341.7    -15.6%
> > >     zswap-in (GB)            79.5        53.0     -33%
> > >     zswap-out (GB)          144.8       115.6     -20%
> > >     swap readahead (pages)  6.79M       0.45M     -93%
> > >     swap_ra hit (%)          72.1        89.9     +18pp
> > >
> > >   1G memcg (light pressure, build not memory-bound):
> > >     metric                 mm-new    + bypass    delta
> > >     build time (s)          177.7       176.0    ~same (no regression=
)
> > >     zswap-in (GB)            10.2         7.5     -26%
> > >     zswap-out (GB)           27.7        25.1      -9%
> > >     swap readahead (pages)  1.07M       0.08M     -93%
> > >     swap_ra hit (%)          68.6        87.2     +19pp
> > >
> > > Similar gains were observed on an AMD EPYC 7D13 host.
> > >
> > > The gain is from no longer prefetching pages that are pointless for a=
n
> > > in-memory backend: readahead inflates anon residency and thrashes the
> > > page cache (file pages get evicted and re-read), lengthens each fault=
 by
> > > synchronously (de)compressing a cluster of neighbours, and adds
> > > compression traffic when those extra pages are reclaimed.
> > >
> > > Bypassing swap readahead for zswap therefore makes sense.
> > >
> > > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > > ---
> >
> > Hi Alexandre,
> >
> > One thing on my mind is that for synchronous devices, we always free
> > the swapcache during swap-in, thus releasing the compressed copy and
> > metadata as well. We could do something similar when a zswap entry
> > is found.
> >
> > I wonder if we should do that as well. I don't have time to
> > investigate this further myself, but I wonder if you'd be interested
> > in looking into it.
> >
> >     mm: free swapcache on zswap hits in do_swap_page()
> >
> >     We already do this for zram and other synchronous devices. The same
> >     should apply to zswap hits. Freeing the swapcache will allow the
> >     compressed copy and metadata to be released earlier.
> >
> >     Suggested-by: Barry Song (Xiaomi) <baohua@kernel.org>
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 55b5a84d1016..d22c779fda93 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4711,17 +4711,18 @@ static inline bool should_try_to_free_swap(stru=
ct swap_info_struct *si,
> >                                            struct folio *folio,
> >                                            struct vm_area_struct *vma,
> >                                            bool exclusive,
> > -                                          unsigned int fault_flags)
> > +                                          unsigned int fault_flags,
> > +                                          bool sync_swap)
> >  {
> >         if (!folio_test_swapcache(folio))
> >                 return false;
> >         /*
> > -        * Always try to free swap cache for SWP_SYNCHRONOUS_IO devices=
. Swap
> > +        * Always try to free swap cache for synchronize swap entries. =
Swap
> >          * cache can help save some IO or memory overhead, but these de=
vices
> >          * are fast, and meanwhile, swap cache pinning the slot deferri=
ng the
> >          * release of metadata or fragmentation is a more critical issu=
e.
> >          */
> > -       if (data_race(si->flags & SWP_SYNCHRONOUS_IO))
> > +       if (sync_swap)
> >                 return true;
> >         if (mem_cgroup_swap_full(folio) || (vma->vm_flags & VM_LOCKED) =
||
> >             folio_test_mlocked(folio))
> > @@ -4977,6 +4978,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >         rmap_t rmap_flags =3D RMAP_NONE;
> >         bool exclusive =3D false;
> >         bool rwp_restore =3D false;
> > +       bool sync_swap =3D false;
> >         softleaf_t entry;
> >         pte_t pte;
> >         vm_fault_t ret =3D 0;
> > @@ -5059,7 +5061,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >                 swap_update_readahead(folio, vma, vmf->address);
> >         if (!folio) {
> >                 /* Swapin bypasses readahead for SWP_SYNCHRONOUS_IO dev=
ices and zswap */
> > -               if (swap_entry_synchronous(si, entry))
> > +               sync_swap =3D swap_entry_synchronous(si, entry);
> > +               if (sync_swap)
> >                         folio =3D swapin_sync(entry, GFP_HIGHUSER_MOVAB=
LE,
> >                                             thp_swapin_suitable_orders(=
vmf) | BIT(0),
> >                                             vmf, NULL, 0);
> > @@ -5325,7 +5328,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >          * Do it after mapping, so raced page faults will likely see th=
e folio
> >          * in swap cache and wait on the folio lock.
> >          */
> > -       if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->fla=
gs))
> > +       if (should_try_to_free_swap(si, folio, vma, exclusive, vmf->fla=
gs, sync_swap))
> >                 folio_free_swap(folio);
> >
> >         folio_unlock(folio);
> >
>
> zswap already gets rid of the compressed data but indeed keeps the
> metadata on swapin, we discussed that with Nhat 2 weeks ago :)

Oh, yes, I missed this.
        /*
         * We are reading into the swapcache, invalidate zswap entry.
         * The swapcache is the authoritative owner of the page and
         * its mappings, and the pressure that results from having two
         * in-memory copies outweighs any benefits of caching the
         * compression work.
         */
        folio_mark_dirty(folio);
        xa_erase(tree, offset);
        zswap_entry_free(entry);

For zram, it's a different story. It depends on
the final swapcache release and
swap_slot_free_notify().

I suspect we could also do this by freeing the compressed
copy immediately while the zram read is in progress. However,
since zram is a block device and can also be accessed
directly through its block device node, this might somehow
break the expected semantics, although it could benefit
performance.

>
> I have a different patch for that: zswap marks a swapped-in entry as
> dirty (so it gets swapped-out again) so I was thinking we could use
> this property to free swapcache metadata in that case. I'm pasting the
> diff here so you can tell me what you think. Anyway, to answer your
> question, yes I'm taking this over but before I send that upstream, I
> need to test/benchmark this approach. It relates to
> https://lore.kernel.org/linux-mm/20261022145615.2184343-1-alex@ghiti.fr/
> where poking holes in the swap table currently results in inefficient
> IO grouping.

I'm not quite sure we want to free the swapcache metadata, as
it could also be useful, for example, by avoiding the cost
of allocating a swap slot and adding the folio to the
swapcache when it is swapped out again.

So I am really not sure if it is correct though.

>
> diff --git a/mm/internal.h b/mm/internal.h
> index 2112576a70a2..0c4598326d2f 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -626,10 +626,13 @@ static inline bool
> should_try_to_free_swap(struct swap_info_struct *si,
>                 return true;
>
>         /*
> -        * Free the swapcache only if we are the exclusive user and
> -        * this is a write fault.
> +        * Free the swapcache only if we are the exclusive user and this =
is a
> +        * write fault, or the folio is dirty: its copy in the swap slot =
is
> +        * stale then (zswap loads are exclusive and dirty the folio), so=
 the
> +        * slot only holds swap space.
>          */
> -       return (fault_flags & FAULT_FLAG_WRITE) && exclusive;
> +       return exclusive && ((fault_flags & FAULT_FLAG_WRITE) ||
> +                            folio_test_dirty(folio));
>  }
>
>  void folio_rotate_reclaimable(struct folio *folio);

Best,
Barry
