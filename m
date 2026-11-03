Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730295;
	b=dq+dZfvWhzb/5dESbLRiCB3r3Dn04ETRKZlonBCjhWAl4D/n/XvU5cBtyKxhPTaAEjW/
	 oi3eieZJJPDgyO4Omm0B5NTy7abKCNLrK3aOhEWUYOVPhoEJCewjmm34AM848l/75pZSK
	 +sC6NCTt9pa+x4UKapmGDya+Di8wXCe7xkhiTIhKC7FhR48cDS60j1VE0fdoow0SAbe9l
	 DXbptcNHM++g20sr4bNP45cZjL6ElGq03Cel40kbLmIZ2Zy51eYPND2vONNjxcjVJofdC
	 tWnYY3ZH0fSWhuiKa0e5teeBkKZ5BaMB77luCw2cyjx1D8FQyJPAfVg6Ot/vRL5iQOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730295;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h/bTOMABqpVamX0NVx1RRz5vWrrSfjlCdmnKrtlIDAM=;
	b=rOlDcjdY/zl97tk7w/OcoEUgKxd3oaEKrAFDVR+uhQlbolQHIVuijmNVcOTndj5165H8
	 R7VawgV+eWl5NtWDlTVueOMZ8CyDSfxt7x02kcnoALFUEeAKgqahoLFvRIw6ECj82Eg4E
	 iTNx4fS1M/pdeUgaJdEldp8BWZRhON2NRWezcAzPuacEektoP6Koc0BEK80PJ2IAt1HEp
	 08vodC4TWUQIGG/lHfavzL1BLbS99mQifo+0DmCLIjFdO0SdaS7VxpE0ekt6I6Qpj7qUl
	 FiPcK9uF3HKCn736HBeAIqRIPuqk7WP6jurVyv9bQMID4PgRSgLBHCRZt8Nijzq3obg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqwlOeXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE9606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqwlOeXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEF11F000C1;
	Tue,  3 Nov 2026 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730294;
	bh=h/bTOMABqpVamX0NVx1RRz5vWrrSfjlCdmnKrtlIDAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mqwlOeXOwK3RUJrektBfmfynzktGQFdocRd4YrTEiXZefQ9Tp0omcmn52+c7sOj3U
	 /mKCP5nctLK7qlqw/D0/1TcqjhPK7/rqo9KVc3yNnK8CbUkSllsERCgwQ831+IMSpt
	 LaIBfdIJm1RhtXSEnptNpMihW/5hBEd31q9g5JguNI2UMeO0hF3hohHjYXTKKc6Iz3
	 IizGMDt9DOdWSX6etKHgP7WE5qNnvJkwNCdEo+Gl7rHW9SMoodtT4aWVcvYBnbGpEU
	 GgTD9ugSVmyYaZtXxSU+jSdvZkU1SaJae4gekbdZLIJd/uIuls78nFCAKoEPToO/aZ
	 1GJ/sqt3fp++g==
Date: Tue, 3 Nov 2026 18:24:48 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v3] mm/memory: use pmdp_get_lockless() for the pmd read
 in do_fault_around()
Message-ID: <auoXIdTpLO60mkEw@gremlin>
References: <20261103014749.96764-1-hui.zhu@linux.dev>
 <aumfvNWiemmuyooP@gremlin>
 <61f8a583-5ea5-4fcc-bf30-ea9cafe94d65@kernel.org>
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
In-Reply-To: <61f8a583-5ea5-4fcc-bf30-ea9cafe94d65@kernel.org>

On Tue, Nov 03, 2026 at 05:15:27PM +0100, David Hildenbrand (Arm) wrote:
>
> >> +++ b/mm/memory.c
> >> @@ -6017,7 +6017,8 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
> >>  	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
> >>  		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
> >>
> >> -	if (pmd_none(*vmf->pmd)) {
> >
> > This pattern is definitely bad I think, we have it in many other places so
> > should probably convert those to pmdp_get() at least?
>
> Usama is working on this as part of separating HW and SW PMDs (he only sent out
> the PTE part so far).
>
> >
> >> +	/* pmd_install() rechecks pmd_none() under the pmd lock. */
> >> +	if (pmd_none(pmdp_get_lockless(vmf->pmd))) {
> >
> > It definitely seems right to use at least pmdp_get() here, but I wonder
> > about the need for pmdp_get_lockless() here.
>
> Whenever we're not holding the page table lock we should be using
> pmdp_get_lockless().
>
> Even if they are semantically equivalent for most cases, it serves as a good
> reminder that there are no guarantees.
>
> And that you have to look again under PT lock.
>
> >
> > pmd_none() only checks the lower word, so a torn 64-bit word on 32-bit
> > (i.e. the PAE style cases we are worried about) makes no difference:
> >
> > From x86 pmd_none():
> >
> > 	/* Only check low word on 32-bit platforms, since it might be
> > 	   out of sync with upper half. */
> >
> > And anyway I guess there is no valid PMD in such systems that would have
> > the lower word cleared and upper word not cleared.
> >
>
> I don't understand the discussion really.
>
> No PT lock -> use the lockless variant.
>
> Until we can remove the lockless variant.
>
> Are we consistent with that? Likely not.
>
> But that's all independent of this patch here.

It turns out all of this is a complicated mess, I think I've nerd-sniped myself
into sending a series at some point about this...

It turns out we're as wildly inconsistent on pmdp_get_lockless() as we are on
pmdp_get(), so TL;DR my main concern is moot so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

But for the non-TL;DR... (optional reading, will probably send something):

* Agreed that the semantics matter - and the 'use pXXp_get_lockless() if no
  locks, otherwise pXXp_get()' is preferable.

* But it turns out it's all a giant mess (of course)... for
  CONFIG_GUP_GET_PXX_LOW_HIGH arches you really actually need to also do:

pmdp_get_lockless_start();
pmd = pmdp_get_lockless(...);
pmdp_get_lockless_end();

And that's because, as Hugh points out in commit 146b42e07494 ("mm/pgtable: add
PAE safety to __pte_offset_map()")), you need IRQs disabled for these arches for
it to be safe.

The explanation is quite good:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=146b42e07494e45f7c7bcf2cbf7afd1424afd78e

And then of course there's also pmdp_get_lockless_sync() used by THP collapse
which is some kind of 'true' lockless usage that needs to synchronise with TLB
invalidation against GUP-fast and ugh.

* So I think what matters is whether you actually NEED the value un-torn or
  whether it's an optimistic check that you can live with (rechecked under lock
  as needed).

* So I wonder if we shouldn't just have e.g. pmdp_get_lockless_optimistic() or
  something like that which is just a pmdp_get() in all cases with correct kdoc
  description etc.

* Then we can convert ALL lockless users to using a lockless form without having
  to do the IRQ stuff. Including a ton of the existing lockless users.

* I am not sure why I did this in bullets. :)

--
Cheers, Lorenzo
