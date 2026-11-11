Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389416;
	b=cTAgfzFXSRf8YnLenCaFFp8kOPTehyQw1K+bWVaa+PSmErCbkHdWV7gMJBiG/VBzxLMu
	 1MLOd/OpKkf4Df5o+Sks+5+BqCWsDXwEak9SLh3lHSrFnn0uWClCA+OA9+tr0SpmRZ0FE
	 8f7/2xI96VunKpkhs1Ah8Qkxjs+F8gjxxy0B7gVK/Q9RLfZ+NlMdIX/fsWtYw3yiFdE1q
	 VhBrpSv09uRgqfCok4ZDYRTpp2Ab+sLHGDptTqq6claWVuuqlZoIkZ6bCo+On9iA2JlCW
	 ca89Ky1aB6lO2AIuJtCrWoxXe+Xh/BjQmt4NkFIdCxVZibgC0acR+6DGTKm8DVTMoEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389416;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PUjiaW6Rhbau38Ly+jhTqaup61BIGoXxlnOZsbFZt+4=;
	b=YZ3RzWJnFUYsXAvECzS0P+FTaffBi5NK/91MSHDm5/Bbv35E1+Q04OFV3EirEgA82Zcd
	 u6LM0Q9Kq+lJ1AU1jHzXfS4jGV2tV47xL/qQqyZlH2+E4gF9yKs875fcoCg5LlrB6wPqL
	 Kte6i1lmLn3YRWqFBzKK1vwnZ3a3SSJRXyAh9BKg0Br0Rko4WWHNwqLPHYbyVcg8zZT3s
	 8sGC2UQ1RJbeVXhALc/cnAbRuG8d/ndbP7L0cfz7R4zkKp8lK6G8wfHXLCm2ejdKu1K0M
	 ZMCU64o/dFZ76gbg7TTFweZmyHqBMbusmZPI9CcWV9ZjVbKKeDvus6/lr4awACQJeVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVnQURsS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F4606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVnQURsS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2374F1F00A0A;
	Wed, 11 Nov 2026 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389416;
	bh=PUjiaW6Rhbau38Ly+jhTqaup61BIGoXxlnOZsbFZt+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JVnQURsSS5rX4Y373GS7m0C1CIvewDuTBUAwGFXCTvgFYRWph9BsqPxCT3kqXl/iw
	 NJ9AbbUEaw8eC7iAUKu4WilF+zfyYCJArhC0nRWHb39ci9xYDhWHVAvwMEPclQEP41
	 VS9NQKs/zG8oTo72teAXzkT5ATNVtoYwk6dGk7IDHuDVBFeIGib/pZHgZ8qHfctvYI
	 3Gc2mZyaGo+vz977EV/tzrAjHPs/TF/FyuiTIMS5bjyRGKYzzvN1c7OuwbfPWG5eSz
	 kUP+s9w1PFexXOa06viDKFV0JuI50tBayqJoG9JVDSmgGGvP3Vu/UVQpz/vL2HpZqv
	 uq9If5dt+6zkQ==
Date: Wed, 11 Nov 2026 09:30:12 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <avQ1W2J7lXraRsYs@lucifer>
References: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
 <20261110-khugepaged-latency-fix-v3-3-6eea743cf9a3@kernel.org>
 <1c57ff65-ac25-44d4-8416-c92623f65066@kernel.org>
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
In-Reply-To: <1c57ff65-ac25-44d4-8416-c92623f65066@kernel.org>

On Wed, Nov 11, 2026 at 10:27:50AM +0100, David Hildenbrand (Arm) wrote:
> On 11/10/26 18:19, Lorenzo Stoakes (ARM) wrote:
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
> > Address this by checking whether the mmap lock is contended after 1-10
> > ms (depending on CONFIG_HZ), i.e. the granularity of jiffies. This is a
> > long time for a lock to be held, so is a reasonable compromise for
> > determining when best to do this.
> >
> > Skipping an ineligible VMA costs ~100 ns on tested hardware (x86 server),
> > so a batch of 1024 bounds the lock hold to ~100 us without expensive
> > high-grained timer checks.
> >
> > This scales for large numbers of VMAs, and tests with ~1M ineligible VMAs
> > reduced the maximum mmap read lock hold time from ~93ms to ~110us.
> >
> > This was also observed to reduce mmap_lock stalls in concurrent threads of
> > a similar duration. Note that a reader re-acquiring the lock can currently
> > steal it from a writer that is queued but not yet running, so the full
> > benefit to writers depends on the linked rwsem change.
> >
> > Local measurements indicated no change for ordinary use cases, so this is
> > all upside.
> >
> > This work came out of investigations into mmap stalls when getting latency
> > numbers for an unrelated patch series.
> >
> > Link: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/khugepaged.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 7d1414a9b2a5..59bbef61f104 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -66,6 +66,13 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
> >
> >  static struct kmem_cache *mm_slot_cache __ro_after_init;
> >
> > +/*
> > + * The number of VMAs to walk before checking for, and relieving, mmap lock
> > + * contention. This bounds the maximum mmap read lock to an estimated ~100 -
> > + * 300us depending on hardware.
> > + */
> > +#define KHUGEPAGED_MAX_VMA_SCAN_BATCH 1024
> > +
> >  /**
> >   * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
> >   * @slot: hash lookup from mm to mm_slot
> > @@ -2910,6 +2917,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
> >  	struct mm_struct *mm;
> >  	struct vm_area_struct *vma;
> >  	unsigned int progress_prev = cc->progress;
> > +	unsigned int nr_vmas_batch = 0;
> >
> >  	lockdep_assert_held(&khugepaged_mm_lock);
> >  	*result = SCAN_FAIL;
> > @@ -2942,6 +2950,18 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
> >  	for_each_vma(vmi, vma) {
> >  		unsigned long hstart, hend;
> >
> > +		/* Relieve mmap lock contention after walking a batch of VMAs. */
> > +		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH) {
> > +			nr_vmas_batch = 0;
>
>
> We could simplify by just doing
>
> 	if (++nr_vmas_processed % KHUGEPAGED_MAX_VMA_SCAN_BATCH == 0)
>
> I guess. saves one LOC ;)

Could do, but I kinda like the 'keep it simple' approach often :P

>
> > +			if (mmap_lock_is_contended(mm)) {
> > +				mmap_read_unlock(mm);
> > +				cond_resched();
> > +				mmap_read_lock(mm);
> > +				vma_iter_set(&vmi, mm_slot->address);
> > +				continue;
> > +			}
> > +		}
> > +
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks! :)

--
Cheers, Lorenzo
