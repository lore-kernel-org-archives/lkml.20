Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959439;
	b=XSGlrYbV0eOSZtsY0sBRTL9S2jIiX7x52Oi8L0MO3Z6b6SSOZ3hyiO2bgVMQgKYxqZpw
	 d+Nc0tXKt3fA/lmtg8FmMDRyo2QejmqSJ+cGw0bA/jIcuy6OSFT8BjveVQl+dDss/o+h4
	 LAMbmpYpVQCl3aILQ8Qd6RYpzdoWnYOjkhwkhSV5DJ15FYJ3sg2m2rWiSJovT8IYQOO1k
	 eyFTcaU6QpfZRll40CIoA8XUQGThsXYE7ZEDLooW86MdZmxAHtRjd8EdimcgEiZZsmLoR
	 h3TzRpsQ8/7gXOMTISlseLCVz+J3Q4977kfLVSDW7VyHRLGbr+zxbN3z26pZ9ivm4TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959439;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2WwIP00I0ep3a7+h9alcgxM6A9Wjyx5EO3o9ThVwY78=;
	b=lk2cRXkKaK2VzTiQtzDZUmasEg84dHGboKB1FGYUFNPrplcYmDY69tUkyAmgFK0XFe5y
	 7WfHZY8e4Pn8W4b412/hpC3Ahi0vTo1Vrzknjlka/qGNL/WdV8ec0q+jTOqwHR2lOxyFe
	 LwRoh+X+Gymug+KsScCFahV1mjczokBqgd3O8IqA+6RQQMkC6UAY//078HRP9Pm0/pi3/
	 Sz+SpKzpREMxRmHhdY5zStHaERgNJjlNqde5qX7M7gf6sRIwe5wOK/mkVQGCvFFGidGG4
	 AQBhy5Qy7UPwCzIHqSQ1I9W1Io9ZVxe8Jejxh3fSt+kipJUfueecAbsLuCz81NbPLrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHS8idUP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A085606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RHS8idUP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D91B1F0089F;
	Fri,  6 Nov 2026 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793959438;
	bh=2WwIP00I0ep3a7+h9alcgxM6A9Wjyx5EO3o9ThVwY78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RHS8idUPuNjiwLrSPx6qJkTxU4VjR3X0geEV3JLFiZ3pPrZONy6gpLchihT1ow2lf
	 9youGO6+xshkF5PhEJBhBLNb3jP4220cS4O+antl8tJ3d/fi6JGe7JsnMLYxweXD8C
	 H+JEIzJAZM7RPb0a/6qtROcrJhm7W+fa3jSXerGh2Rrdqvwkn+IUUC9W3Zuh1+LMCC
	 yg/vEw8rriz5nmtD3n/Hc3BCruCxQRCt8oNeHytEeT8qREQHSq1NfVevyn0lk4TPAj
	 5xiQ+35Iii01PIluBnylWzb4lhSwPhUfTEqgKPUsTkAe1BFbSDgnk5e5eHVmkXBmgi
	 j3p6XxEMKEXgw==
Date: Fri, 6 Nov 2026 10:03:52 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <au2lAPUNPlRtaeFY@gremlin>
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <551892bd-d7ca-4c79-9c7b-9d3d08c913e4@gmail.com>
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
In-Reply-To: <551892bd-d7ca-4c79-9c7b-9d3d08c913e4@gmail.com>

On Thu, Nov 05, 2026 at 10:53:13PM +0100, Jose A. Perez de Azpillaga wrote:
> On 11/5/26 9:57 PM, Lorenzo Stoakes (ARM) wrote:
> > khugepaged walks an mm's VMAs under the mmap read lock in
> > collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
> > them if encountered.
> >
> > It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
> > when these are encountered, however only checking this budget once an
> > eligible PMD-spanning VMA is encountered.
> >
> > It can therefore hold the mmap read lock for a long time if there are a
> > large number of ineligible VMAs present in an mm, over which time no mmap
> > write locks (and thus no VMA write locks) can be acquired.
> >
> > Address this by checking whether the mmap lock is contended after every
> > KHUGEPAGED_MAX_VMA_SCAN_BATCH VMAs walked, that is a quarter of the
> > pages_to_scan budget, and if so dropping and re-acquiring the mmap read
> > lock before resuming the walk from the per-mm cursor.
> >
> > As the walk is resumed from the cursor rather than the VMA that was current
> > when the lock was dropped, the cursor must never move backwards. A VMA
> > ending at the top of the address space causes ALIGN() to wrap the cursor to
> > zero, so treat such a VMA as the last in the mm rather than skipping past
> > it.
> >
> > This was tested locally with ~1M ineligible VMAs mapped ahead of a
> > collapsible region of memory, and resulted in a reduced mmap_lock hold time
> > of 170us down from 95ms.
> >
> > This was also observed to reduce mmap_lock stalls in concurrent threads of
> > a similar duration. Note that a reader re-acquiring the lock can currently
> > steal it from a writer that is queued but not yet running, so the full
> > benefit to writers depends on the separate rwsem change at [0].
> >
> > Local measurements indicated no change for ordinary use cases, so this is
> > all upside.
> >
> > This work came out of investigations into mmap stalls when getting latency
> > numbers for an unrelated patch series.
> >
> > [0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/khugepaged.c | 31 +++++++++++++++++++++++++++++--
> >  1 file changed, 29 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 216c4b8d28c4..eaa01dae5a03 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -66,6 +66,12 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
> >
> >  static struct kmem_cache *mm_slot_cache __ro_after_init;
> >
> > +/*
> > + * The number of VMAs to walk before checking for, and relieving, mmap lock
> > + * contention, as a function of the pages_to_scan budget.
> > + */
> > +#define KHUGEPAGED_MAX_VMA_SCAN_BATCH(pages_to_scan) ((pages_to_scan) / 4)
> > +
> >  /**
> >   * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
> >   * @slot: hash lookup from mm to mm_slot
> > @@ -2910,6 +2916,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
> >  	struct mm_struct *mm;
> >  	struct vm_area_struct *vma;
> >  	unsigned int progress_prev = cc->progress;
> > +	unsigned int nr_vmas_batch = 0;
> >
> >  	lockdep_assert_held(&khugepaged_mm_lock);
> >  	*result = SCAN_FAIL;
> > @@ -2942,15 +2949,35 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
> >  	for_each_vma(vmi, vma) {
> >  		unsigned long hstart, hend;
> >
> > +		/* Relieve mmap lock contention after walking a batch of VMAs. */
> > +		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH(progress_max)) {
> > +			nr_vmas_batch = 0;
> > +			if (mmap_lock_is_contended(mm)) {
> > +				mmap_read_unlock(mm);
> > +				cond_resched();
> > +				mmap_read_lock(mm);
> > +				vma_iter_set(&vmi, mm_slot->address);
> > +				continue;
> > +			}
> > +		}
> > +
>
> with pages_to_scan below 4 the batch is 0, so under constant contention
> we keep dropping the lock at the cursor and never scan anything, don't we?

This feels like repackaged AI review...

The mmap lock won't be eternally contended and if it is, with pages_to_scan
under 4, I think that's fine.

Alternatively could make that >= an == and the post-++ a pre-++ and the 0 will
never be hit in this case.

Or could have a minimum cap.

--
Cheers, Lorenzo
