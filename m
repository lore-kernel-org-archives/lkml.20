Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586932;
	b=fkbPy3xCtkfoAGH9LxP4hWZ4uDzugXFE9YZpmJHpfZU2znjWAiWlaDOUxA1vvnoW/Q6S
	 v1yk/vYOHJOIRYnZoM6JMA50NmU/pJLofR9b9K6Y/HFmzT86mtFKF0zGDngpfSzxlgBCz
	 mnQ2Q4CLiVaPXWywb10OX5C/0f2t2giGLCh/hJ58BHFx5pDaIsIpye4SeFhWF/rh4KxGr
	 x863shSNVbzwDL7rkMvDBOcYH/P8SNgkZaO9K0mLouHd73Eb8M2iKR48Ouq5nSf9in5hY
	 0SFtqgNkM2sX7gcP1xSI6Z4dWlwj5wCi6DAbOTTYSiGk/7+wwYwybYABr5OrA2aSzkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586932;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/xRhj/gyeHWvM7uP+DX2CEqlmuVU0a73t7C3sKCpydc=;
	b=PZYA4rC6JIqEOQRO1xkgq26V5WedSNq4TmPWDD8wXAqkiOKlfXQVOZsuh8FJwXw8CBBD
	 jp5g2wE6inVb8ZjkRzHDxTrOYnY/6240RXvt5K0Fmj0z6wWz2iaHosJLyrZxLdness3gY
	 /xZo2QiiWeGhT3bgZ3IcDe8pxnv/3KN68o1QP29SpF1bH/wJ6WhCqH2A0oCRx2vSysVQo
	 GiMmXpDqEi6UL1xmnX5Rs1KhgXSLrUOmpvhhqctCAZuHVYsX1IStqmKKGHYDCNRrnWDcu
	 0rzSgpGWUwV4hp3MEKlz3vnM15NPnzci/HHhQmUMNjS8JtRJdRl4N88F+3DsGrRdfUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhOiuVjo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39522606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhOiuVjo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02ED71F000C4;
	Fri, 13 Nov 2026 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794586931;
	bh=/xRhj/gyeHWvM7uP+DX2CEqlmuVU0a73t7C3sKCpydc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhOiuVjoFen0ouPOH42GO7BtOtPX2CYPVaHQAv929yshJqki53U8U0ZPai4Wt7Ssw
	 AAsdXJpS1uPUq6bkESvXH4k92/y/apApWNi3VPCYTPfkgSwZW2zNAsS6Otpen6Q8IH
	 coJ0jy3q/uArOBnKfZWn7IrNrFNdVGV69/ap6tLfGs9xqbTUuI4ymF+Olpf275r9J6
	 l6nUSQJ8q7Llht2/2OMP2LMuPDu4zuVDwBvRu6cQDQX3Ll9vkC3vv0y51MPlVMaGYZ
	 4c5/kdbFVNWcVGkXpJMmXpV7q8Mp7pZZGDABQQ+GYoLZ/39W9bcoVztQbeycYENrq/
	 tkt7PN4Edskeg==
Date: Fri, 13 Nov 2026 18:22:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Frank van der Linden <fvdl@google.com>,
	Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Oscar Salvador <osalvador@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/cma: simplify cma_declare_contiguous_multi()
Message-ID: <avc5LNF6rExATD3z@kernel.org>
References: <20261112-cma-multi-v3-1-663407328e0a@kernel.org>
 <20261112223851.d441a97711d43f91a25ffa87@linux-foundation.org>
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
In-Reply-To: <20261112223851.d441a97711d43f91a25ffa87@linux-foundation.org>

On Thu, Nov 12, 2026 at 10:38:51PM -0800, Andrew Morton wrote:
> On Thu, 12 Nov 2026 10:16:57 +0200 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> > When cma_declare_contiguous_multi() cannot allocate a CMA area as a
> > single range, it falls back to collecting a list of up to CMA_MAX_RANGES
> > largest free ranges above 4G, reserves them in memblock and adds them to
> > cma->ranges.
> > 
> > The list and subsequently cma->ranges are supposed to be sorted in the
> > order of base addresses of the "allocated" ranges.
> > 
> > This implementation has two bugs:
> > 
> > * The allocation may fail even when there is enough free memory because
> >   list_insert_sorted() sorts the list in the wrong order.
> > 
> >   When the list is full, the largest range is evicted rather than the
> >   smallest, the final list is not sorted by address, and the smallest
> >   ranges are used first.
> > 
> > * the function may report success while it reserved less memory than
> >   requested because sizesum accounts for ranges that were skipped.
> > 
> > And overall it is a lot of list management and open coded range
> > selection for no real gain.
> > 
> > Replace the current code with a loop that finds the largest free range
> > above 4G, reserves as much of it as needed and repeats until the entire
> > area is reserved or CMA_MAX_RANGES ranges are used.
> > 
> > After successful alocation sort the cma->ranges by their base address.
> > 
> > The new code scans free memory once for every range rather than once
> > for all ranges, so it is slightly slower, but it is way simpler and more
> > robust.
> 
> Thanks.
> 
> >  mm/cma.c | 269 +++++++++++++++++++--------------------------------------------
> >  1 file changed, 81 insertions(+), 188 deletions(-)
> 
> Win.
> 
> 
> Ivy's 2-patch series
> https://lore.kernel.org/cover.1792032699.git.skunkolee@gmail.com
> carried cc:stable but "No kernel-level reproducer was produced and
> nothing was tested beyond compiling; the examples in the commit
> messages come from a userspace copy of the helper and the selection
> loop, written from the source.".  And my LLM's web trawl couldn't find
> reports of anyone hitting this.
> 
> So I'm thinking next-merge-window, no cc:stable.

Yes, and there will be v4, sigh


-- 
Sincerely yours,
Mike.
