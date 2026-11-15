Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769137;
	b=N+tASM2L5Lim4tTNPgMmCHDJQ2yew5zJBkH2zaZXICnpDoaFIAzxHa/EyEvIGWhizqOy
	 DTaIe35+R5ulM9jK1FnZxu7rhEfPuw3APFJMSOarXXPPRN5qh7Xg1c+4FjmG9AcOzyi8l
	 ARkLLJWnmESV/pHnshdTrU+/kq3QYLGH3X7kapXHizeELiPCJ0WLdX4i88vjPyWE5D6XF
	 1MSoiRjv764PQb/92ZzjeJP/JociDB0MdGULMvcsxkZSTOL8J2QWb8U34Tbb3Kt0LQGm0
	 N9XsDvox7efzc4w6+NOdl+mGts6M3bFIZVEQv9ca19z0kiFwTLpqK5MoN1aqUbV9KIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769137;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wUK9ySDibXwePzBB19zRNnvpbyBOvugzqKcXHyk3Hmo=;
	b=yLdvlBiizbLneZbTeVEsWlRc2ct1Vm5+K+m3YMSKXgEVrOwk1dUqlB3vDYjXu/dxZoAz
	 gXQEKy1bnbOLbIQInJnrfNsyP8NZMofWkE4CfsATKsFhSlcNF2JPcdvhTrYDAQcGFxMHN
	 pRmXgaYG3qOc6F7EWUAGx5SeTBZ/ttrykRe02hUQ+9rGIBv+cPbWCKXI01haarrBnxXdY
	 xQKvO2mJSoijatcQnQvabuvsmClGSm4SHK8V3r95nWcHKCWUpMzT+w4DqflyeLRZQcfuC
	 GMt4WBnq1nyql6iXOa+/RM7lom4o/37mw3FBi9kbBKrrtFXjAxN2UJU2EAOZtZQXupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gq6koHUB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF460A2600
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gq6koHUB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFF71F000C5;
	Sun, 15 Nov 2026 18:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794769136;
	bh=wUK9ySDibXwePzBB19zRNnvpbyBOvugzqKcXHyk3Hmo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gq6koHUB3IjLxGRlZBiG/fn6vGTyAfGjFy8aawtV89CsSJr8XYsAigtbd8yNxIVhS
	 nk60mmIbdkSQGeqmhNAUM2ZzphtZX7spfvPQxZsnWW/YpSnV68Hxl+ZuV23+IKnDcF
	 d+oTZTkTbb9K4bHq6Bj1TrXN9Pjv9+NJwXpxovq8=
Date: Sun, 15 Nov 2026 10:58:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Frank van der Linden
 <fvdl@google.com>, Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Oscar Salvador <osalvador@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm/cma: simplify cma_declare_contiguous_multi()
Message-Id: <20261115105855.551620784977f951f37e729f@linux-foundation.org>
In-Reply-To: <20261115-cma-multi-v4-1-d159631171d5@kernel.org>
References: <20261115-cma-multi-v4-1-d159631171d5@kernel.org>
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

On Sun, 15 Nov 2026 08:27:03 +0200 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

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

Updated, thanks.

> - silence smatch warning about SZ_4G on 32 bits
> - fix a type in a comment

delta:

--- a/mm/cma.c~mm-cma-simplify-cma_declare_contiguous_multi-v4
+++ a/mm/cma.c
@@ -485,12 +485,12 @@ static phys_addr_t __init cma_find_free_
 	phys_addr_t max = 0;
 	u64 i;
 
-	/* no point searching if the system can't addres above 4G */
+	/* no point searching if the system can't address above 4G */
 	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
 		return 0;
 
 	for_each_free_mem_range(i, nid, MEMBLOCK_NONE, &start, &end, NULL) {
-		if (start < SZ_4G)
+		if (!upper_32_bits(start))
 			continue;
 
 		start = ALIGN(start, align);
_

