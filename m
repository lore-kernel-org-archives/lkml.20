Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359390;
	b=zorVae6TZszzT54kNBlDpQBquIRegbkTqegq177a+2qjzMFwlB27+Q8FLNAa5cHuKKSJ
	 z+Te4gM4m4m+LrJHrrCVr5luVJhDH8FSgfSosYqBoqtI8P41/f42kvvOiOVaqmzUEa2cf
	 wGNSvbTXhKU71NzyjrTfAIoETxyAWv+bV7HYng6U87XdWE2jj5ysqBAP7YCZpgwWPHnD9
	 8KW65sbA7VO13K6i93wdc4DdX/2aV1QWO7qpOjnJ4bOfY1bWE6vYlplPLR3R/0uFHr4aV
	 EnhxkJO35ZtujBxtwiqJmzhO0OBUm4lTACiZUSNq4VTiuWlwYafkTbiAQfqzzW/ja5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359390;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=FIA9nXl5MDGFx7HCmxaQOKJbU8t3S2XBCcL09Ok7ifY=;
	b=VZmkVb1nHJqX+GMvxOYbEF9iXuTuxQynpW2RBneLLe42f76j2buhgH6sKeMnX09QmdY1
	 tsSrbS6CCOZRTUWDSQxhByWT7FfiOvR6adRr9gnLb3xh8pdAQHAA6Zaztad6H2HBdjXkT
	 NrpZmvTnqKSVwu70mesV2lSIRm403C5EVqqQhJHaNuWVtIM2euGzttjUaH6PVA1mKfk33
	 mxHyEv0lrlskgEYAHaco/w1GYZWjBIPMnj3NXH1aTc3rdy9I5xaguPq/2S7RhTUuLZUKo
	 i3w+yXHIHQCO57XrGfkx9UBUVWBTcki933sxYXpJCetvK/R0hbfDZJU5YDG55wm5x/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uR+T25uH;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95763606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95763606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uR+T25uH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FIA9nXl5MDGFx7HCmxaQOKJbU8t3S2XBCcL09Ok7ifY=; b=uR+T25uHbz01nyBGay5Gh1MBgZ
	/NPRZJAfigCeg+6QKsOKXI17e/9ODt5JsEwMnMPAThYeOtYqhOzey0yCWvVvqA65grMx1oJvMIlPU
	hiyej0FSXvZgic4InSM3u2IIa1dPjG7tQEslpgs7bt5R98UTeoCVKo5UZzUZuDyTkY6vEnNVXidAd
	EEVUU0otdIOlIc4sAO1F2/xphx/gJ6a4og4UeVM2k/ZgJdX04kMdJ/PP2HJXzUHndZ5SLRVpx4ODf
	yJcqTZVELoRVYMY7DhFazyKNsZBcd0i84m7++VskFr9d8CRHXKUD/EiM9K8S/ZN262fcFr+m+9ZqS
	WoZPChmg==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwqR-00000005Lwb-2Ptf;
	Wed, 11 Nov 2026 01:09:47 +0000
Date: Tue, 10 Nov 2026 20:09:39 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Frank van der Linden <fvdl@google.com>, 
	Ivy Lopez <skunkolee@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/cma: simplify cma_declare_contiguous_multi()
Message-ID: <2h5vqasbyjxmdpzvtnsih2nhrjxmblpv46zl4phbn4huqadn3u@w4fcjow2wcvu>
References: <20261111-cma-multi-v2-1-4e2dddb2a2d8@kernel.org>
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
In-Reply-To: <20261111-cma-multi-v2-1-4e2dddb2a2d8@kernel.org>

On 26/11/11 12:14AM, Mike Rapoport (Microsoft) wrote:
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
> 
> Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
> Reported-by: Ivy Lopez <skunkolee@gmail.com>
> Closes: https://lore.kernel.org/all/cover.1792032699.git.skunkolee@gmail.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>
