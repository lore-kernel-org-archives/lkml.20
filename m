Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551932;
	b=SB5poRgImyIqs1IM9C63UjsxoyhOJxDSlRYjuOtSe/NCF8gCKYixqfk7701SGC+xjecW
	 Z/i6GbBE4qRa/sUlYI5XgRaAPMnYFAaYRvbpZBFJhZEsKcNRDsscABm4VTsT6Ix7SjjzH
	 s+RW4wGYjji5dvB4FjPw9C1VF5GX6XKnmRFrst0j+hcDS6Z9CrIyk2kj6t6OD74DJQTyZ
	 8ogoNDE52z/Cqbcy2DPtV04oCVAKbWS6S9Ejo+He2ylEQ1qJPIGq9ECdJLjnQKn4SrxD5
	 w7LdbhvO7HGGKW8EX/HUiNmtMoMePBxfNe21ytRVYqj67QHZ5dnNTKQOQLOkAvFRQaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551932;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IOpli/zwiHeET+6XH4pxKBuHV5LdRJeylp6mDdnz8r0=;
	b=u6g8j/7HNJPChfqdzBd2C8OaEcIfS+sC0Tz/fZL3Z1VebMT/WONL5POdJrW5yc97TXfw
	 o/DrK1XHkk1CISbQovrShkHiikTfdEfM85uhjUwIwWSTX2+X5bgI98Yo70mfv3vrOaBxL
	 P9m3q4Yiklfx8Th9yJWbgCZVFj8pPMimc6eXXC+bKePAjOmP1QVug+lKMOSupFMKpyaGw
	 DCokfW0mQdxMXx1em+iDg2JQxTZhph/jgzNtcZjbRfZd7c/5WM30rbPufJX66ifTPBX8S
	 R3n3rlVLORImNqzNackjboLqXB9b0FAo1fPQAkDZCktYWzFZ0+cH9b0/MC2bodC6zAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=IOULsNqo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D30606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=IOULsNqo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA31E1F000C4;
	Fri, 13 Nov 2026 06:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794551932;
	bh=IOpli/zwiHeET+6XH4pxKBuHV5LdRJeylp6mDdnz8r0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IOULsNqovaL4UJWj0vpuNawCSJT6AzwCMeQMg0Dbkh6QypN0MRs0Z3SBAjTtblofz
	 /LeaLEH7e9xmBb5zb1UkRLKxrQqATSmKvCVlgh4mSW1aAvxhioaS8mliywNU7qV/hM
	 ujERaDT35RQ9gn1e5jcVMb2voCR/RCs4Mw5YET9Y=
Date: Thu, 12 Nov 2026 22:38:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Frank van der Linden
 <fvdl@google.com>, Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Oscar Salvador <osalvador@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm/cma: simplify cma_declare_contiguous_multi()
Message-Id: <20261112223851.d441a97711d43f91a25ffa87@linux-foundation.org>
In-Reply-To: <20261112-cma-multi-v3-1-663407328e0a@kernel.org>
References: <20261112-cma-multi-v3-1-663407328e0a@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 10:16:57 +0200 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> When cma_declare_contiguous_multi() cannot allocate a CMA area as a
> single range, it falls back to collecting a list of up to CMA_MAX_RANGES
> largest free ranges above 4G, reserves them in memblock and adds them to
> cma->ranges.
> 
> The list and subsequently cma->ranges are supposed to be sorted in the
> order of base addresses of the "allocated" ranges.
> 
> This implementation has two bugs:
> 
> * The allocation may fail even when there is enough free memory because
>   list_insert_sorted() sorts the list in the wrong order.
> 
>   When the list is full, the largest range is evicted rather than the
>   smallest, the final list is not sorted by address, and the smallest
>   ranges are used first.
> 
> * the function may report success while it reserved less memory than
>   requested because sizesum accounts for ranges that were skipped.
> 
> And overall it is a lot of list management and open coded range
> selection for no real gain.
> 
> Replace the current code with a loop that finds the largest free range
> above 4G, reserves as much of it as needed and repeats until the entire
> area is reserved or CMA_MAX_RANGES ranges are used.
> 
> After successful alocation sort the cma->ranges by their base address.
> 
> The new code scans free memory once for every range rather than once
> for all ranges, so it is slightly slower, but it is way simpler and more
> robust.

Thanks.

>  mm/cma.c | 269 +++++++++++++++++++--------------------------------------------
>  1 file changed, 81 insertions(+), 188 deletions(-)

Win.


Ivy's 2-patch series
https://lore.kernel.org/cover.1792032699.git.skunkolee@gmail.com
carried cc:stable but "No kernel-level reproducer was produced and
nothing was tested beyond compiling; the examples in the commit
messages come from a userspace copy of the helper and the selection
loop, written from the source.".  And my LLM's web trawl couldn't find
reports of anyone hitting this.

So I'm thinking next-merge-window, no cc:stable.


