Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199854;
	b=I/fSmUg71jZFUDaDjyE8UZqZ4fH3S6zsUwl3/BH1eywWvmuVocj6pn5xpEheQu7dJ6pu
	 rVcH4N9THqPt3qRlAOXRMs2uhzMDM3XGrfSmG1B5HDF37Bhz5HgZJl1/gyvlq6ryUqy0I
	 8PojRdtI1kTYPrJQhyVZR8GK16AXmHwIDfq9sqhFtfhikwd/tBNDFxVwxwsPDKxjCgq6P
	 FAwRHnBGNoBpaSOkM4jUuxb245P6yRfmzXW8kC53jqVToh/bo2rZSY7nDBsMATpp11zr0
	 uM32MQClPo5BkkQB/MQf+SNWQ2CnQJ7eSszmEgpcR6T//mzHWoXOD0jm2qVjCtWKrow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199854;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RTJQq7oa2v1xKFQCN16xq62LsnI/dsCpyqBRJDWbjP8=;
	b=Np+ebu8tCKXKP1s3KXKybNsZ8ikD8WuGEnUfq9BUDZ4HiKcFIMsxXhAbwAo1Z7Cz6RXN
	 CY0qSaq78hb3pPcPbhjzU3h0oritEFoesbdJCYDYHReAHC/eIzwDBKi83ci6yJCvNi6Ek
	 Y3KnJZRMQaoEvfRO8JpA3ZQmy4arEUJgSLkrhln4NCkWAg2S3AoCCS88qe+nt0/j/V1dR
	 /sBzWd59bnuAJGqikwJaLJKIrVOh1V64dyGBsEWKJRvb2Pn0fYNCyI6Z0PZYej2dEJtFo
	 vJH5WbixESd3maZr/t6Is/oqfB46q6TIjQW0HwXSTxRDvLPe+VOqMoSwkpExLMJag7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNbe3+OK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655D606A322;
	Wed, 28 Oct 2026 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNbe3+OK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050E51F031E4;
	Wed, 28 Oct 2026 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199854;
	bh=RTJQq7oa2v1xKFQCN16xq62LsnI/dsCpyqBRJDWbjP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iNbe3+OKl9aWdEyvuidT6IAvgrw0IGCiAktVRNlleig20UDtv2JjexS1/AEaEBEyQ
	 lclo7aHZbevKOmI1Nlnss5FdHeEYZ0OSbQD4649rd8dzntfPO7Z4SpnFmRgXJM5kpI
	 honXw6BgUOAFypippELMlxN5q0H/LLbMn5USre0PBq2ckbuIeyf7lMf5d8xi+qqS5L
	 W1lKIPsi1jsYi58SWK+TnUjslc8mW6bVMWm9eCHDqHmVeco3Ay1dzbIzul42dvhGZx
	 PZ0hprxU0zPS9KQ6o3kjLsOI603Qj8vC4vfRjb6xaZlNALEkSrH2TZDMifT41Y8Dgn
	 ABcRkjm6+a8Kg==
Date: Wed, 28 Oct 2026 15:04:07 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <auIIxSorX0bhZNZc@gremlin>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
 <atYJA7nIu_RwpoCC@gremlin>
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
In-Reply-To: <atYJA7nIu_RwpoCC@gremlin>

On Mon, Oct 19, 2026 at 01:19:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> > On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> > I'm concerned by the possible latency when doing this to many VMAs. Do you
> > have any numbers?
>
> No, somebody schloppened a patch for a real issue and I haven't the time to do
> even the things I need to do let alone 'here's a new task' stuff :)
>
> However, this is a simple write to every VMA, done at the point the mmap write
> lock is held with all VMA write locks dropped.
>
> It was implemented such that:
>
> * No VMA write lock is taken on the VMAs.
> * VMA read locks can proceed.
>
> I.e. it amounts to a loop over VMAs and a write to a field.
>
> I don't think you could possibly do more to reduce latency here, and you
> absolutely have to update this field across the board.
>
> Under any realistic workloads this will occur at worst ~days intervals, often
> far longer, and likely you will see quite some gaps between separate processes
> experiencing it.
>
> There's also an upper bound of vm.max_map_count per-process, so it can't explode
> into something truly insane.
>
> Most processes don't have that many VMAs, other than certain steam games :) so
> it's hard to imagine there really would be that much latency here.
>
> And the latency is occurring on one thread, which is performing an mmap unlock,
> so nobody sane will put that on a hot path.

Sorry, I forgot about this and didn't get numbers to back this.

I had an LLM go get numbers on this, all in ms on my threadripper (but numbers
should scale similarly) with fork() + munmap() all VMAs for comparison:

(all ms)

      VMAs      reset    reset     fork()     munmap()
                (warm)   (cold)    (cold)     all VMAs
  --------    -------  -------    -------    ---------
     1,000      0.006    0.041       0.33         0.43
    10,000      0.072    0.36        2.1          4.2
    65,500      0.61     2.4        14.1         33.5	(default)
   262,144      5.3      9.6        60          168
 1,048,000     34.7     39.2       237          691
 4,194,304    162      163         954         2810

It happens on a random VMA write lock release, so there could be tail
latency, but it'd be tail latency on the scale of ~weeks for normal
workloads, and (assuming max map count reached at default limit) a ~2ms
latency for an operation such as mprotect(), madvise(), mmap() or munmap()
which shouldn't be placed in any situation where the latency of that call
matters.

One call in 2^31 is the
99.99999995th percentile, far beyond any latency target anyone measures.

The amortised time per write-lock cycle is ~18 picoseconds (0.018 ns).

Interestingly, the runner observed khugepaged-induced mmap lock stalls of
~100ms, far far more regularly, which seriously exceeds any of these
numbers, about which I assume we haven't had too much complaint.

Overall the numbers back my thoughts on this being a non-issue. Obviously
if people report issues in the wild we can revisit.

Hopefully that addresses your concerns.

--
Cheers, Lorenzo
