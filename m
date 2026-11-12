Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487581;
	b=OPzML4Rx4KwPj27iCHTmUN14IATIPq6wOjrmqTTl7/9ToVX5zNOSrG4GmvUv6eip85Kb
	 uiyfnvVrAAamszSTRypBkVWTAF3Rka45KKYBcFZtVzIL0g5M4pTgYttrdIgOPz3B+6cRk
	 u5joDOq8ETThV4mI4pDh8g07KaCK4Bves1jEkKJirhgDmVvkAzgcpMZpxICpQWWlhJYy7
	 gbRomismzY4HR+++geJOrGHZu5NnDWU9OrK23LIT+IfbQi7cPdOma0n9wY4sMPiudYxEV
	 FRS9fB7UicLS5DdQJoUqNWy+uJ7WDtH7p5ZHufxv9TVwCR3oSX7TxbFiXS90ilivLYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487581;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hxXXgy4vvztNsWxgrVWVT106VMuFzuGdKAfgqqkHoEo=;
	b=k2aLyS6nGKgP1jU9pGkubrQPdlWGSsr1Pojrk4NWfc43kl9Hxg60b8ckA2dqZEnawVVx
	 T/kWGW4mte9WFf0nr5v6nDIUgA5xks1K0pFaQUTJ1/2QAH590zo0aQo7UHquL1EAr9Hxs
	 /4Xu6a/oSC1lIIR4gxtOFQw9pY7cAz65+1A+kJHivHpHd0EJogyasCc3UjldzXfHRKjn1
	 +Vh60GkKb8JzBDNwe6Mk7NMVz2VAREFTZw/dqxmIwbcckNDULwMblegq0awNQu+X52GLe
	 j95xf4bvt9jJFr6byX8Qc62BrJjsivyPnNqeOHs3zJSpHt+qthEu+ewbbwfHYGTf0JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQ6nsbEd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mQ6nsbEd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E17C1F00A05;
	Thu, 12 Nov 2026 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487581;
	bh=hxXXgy4vvztNsWxgrVWVT106VMuFzuGdKAfgqqkHoEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mQ6nsbEdDOoy1mCgz0HIqHajCyA2XqM1MvabmASxbakBr3HWLPgMIOR+s1Pk9+Ps2
	 aQhCl4dsDDZj4qA/zk9v/HPLkfxF2FyjD+HgifKEwdDLjVtHdVBKz7Ct07E4qm+Tj8
	 4pcEeVEzpvmaQDxAdIIoNMkGVMRVf3O8dHIqSDKL/0IMf+In+iuTIjC2YeQZosp6fW
	 E7aWEnHsy1rsDsd1IOPzXLTKDaoXM+RdhnQZ4kUQ0pyluub4e6ugMchbRFCnYzrwCr
	 5zVkPgUJArMq6LFVzAPs48dU3A9eCzZPZZDCN2dtxDIX6HjMH8ukMzZMg7UL2/6RMd
	 NXJ325+s726cg==
Message-ID: <4411389c-2246-4af6-9b34-10d3f259aeb4@kernel.org>
Date: Thu, 12 Nov 2026 13:46:13 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] mm/huge_memory: find partially mapped shared
 folios with NO_PAGE_MAPCOUNT
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Rik van Riel <riel@surriel.com>, Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Joanne Koong <joannelkoong@gmail.com>
References: <20261111113535.330078-1-azpijr@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261111113535.330078-1-azpijr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 12:31, Jose A. Perez de Azpillaga wrote:
> With CONFIG_NO_PAGE_MAPCOUNT, an anon large folio mapped by several MMs
> isn't seen as partially mapped while its mapcount stays at or above the
> number of pages. If parent and child zap the same half of a THP after
> fork(), that half is mapped by nobody, the folio is never queued for
> deferred split, and the memory stays allocated until every mapper is
> gone.

If you follow the history on this, in e.g., some raised in my talk

https://share.daveh.de/s/bQsDpD7xigJ6wD8/download?path=&files=LSF_MM%2726_+Deferred_folio_splitting.pdf

There are a lot of questions around this.

In particular

(a) Is it really relevant in practice. The only way you can trigger this if a
folio becomes partially mapped *after* fork (by parent and child unmapping the
same pages), and the child stays alive. Once the child is gone, the folio is
only mapped by one process (e.g., child quit), the folio is properly detected as
partially mapped.

So you need a long-running parent+child, and have them both do questionable things.

(b) What is the overhead from having way too many folios in the deferred split list.

> 
> Patch 1 moves the split_underused_thp check out of
> deferred_split_folio(). Patch 2 queues such folios as candidates and has
> the shrinker walk the rmap to see which pages are still mapped.
> 
> 512 MB of THPs with the same half zapped by every mapper, memory freed
> by the shrinker:
> 
>                                 before    after
>   2M,  2 processes                0 MB   252 MB
>   2M,  3 processes                0 MB   237 MB
>   2M,  2 children + parent PMD    0 MB   244 MB
>   64K, 2 processes                0 MB   252 MB
>   64K, 3 processes                0 MB   252 MB
> 

Again, we can create nice scenarios that are likely not relevant in practice
(such as 512 MB THPs, lol), but so far I doubted that this is relevant in practice.

Do we have any evidence that real applications run into that and it's a problem
for them?

The memory is charged to these processes and swapout etc. would still work.

> With patch 2 the shrinker reads shrink_underused itself, so folios
> queued for the underused check aren't split anymore once it's turned
> off.
> 
> David suggested a check from the shrinker for the opposite case in [1],
> folios marked partially mapped by a PTE by PTE unmap. The walk in patch 2
> could clear the flag there too, this series doesn't do it.
> 
> Questions:
> 
> - Is an rmap walk from the shrinker fine for this? Every CoW of a page
>   in a shared PTE-mapped folio queues a candidate, and so does the last
>   PMD mapper when it splits its PMD.

You are asking the same question I asked in my LSF/MM session :)

I don't have a good answer to that, especially, once large folios (smaller than
most THPs) come into play. Like 64k folios on a 4k kernel.

> 
> - The walk needs one bit per page, which is too much for the stack with
>   64K pages, so I used a static bitmap under a mutex. That serializes
>   the walks of all nodes and memcgs, and the mutex is taken with the
>   folio locked. Where should the bitmap live?

Maybe one could track it a bit broader? "any page in this set of 16 pages is
present". Reclaiming a single 4k page from a 2M folios is barely worth it.

-- 
Cheers,

David
