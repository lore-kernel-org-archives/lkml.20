Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922264;
	b=qx3fvVBwLFLR61EbXsc+cB5qyTkrHJ9TO2b3PSnkJ62rfzMxMX7q6McV9I10mrT7mf7A
	 W38gNNSMb8N45RTSRpRnQeXBPnl8U60vqFQgmzmVIMtnZm412JdbY05XRcbmBNlQFw0FE
	 1VbLfusqYkfXTrnwUMUXI1TQRyRgLmJHIav+hjXW7RHUQjzFz5zSQL9DOxekPiu55JjJd
	 5okWaJRdeQi5+TNc68AVQh7vzm3mXN3XwtwbC5E4UlJK77MI6sFnqGwkjgK2Oa3T8AdNk
	 UY5mFxb/c4ePXaAi/3DgbdHqHS+TWAA2/xoCf0Oxlp+iyo6tPo3KKPZ/NsmcpoNCgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922264;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LbIEKVK3wtMckNJgD329X9n3dQQ2GgjJnxeeqAkeQkE=;
	b=LEZp7UvBgLI5uAwSSSkLdNE7ZTW9MpSV5uNcy5vl0MGSPcDY+KLk/5jCXofOBiOzGzO9
	 h4FyvNVYBERvsM61nTS8XwE64ZdobZZirIrrShJVHYrjd+aKcYoDAxmO8ljL9CnE6cm0Y
	 qKkSYWXNwZy7gAHqHDj6wXpakesv0U9N57YEGoNCqGr+V4tbsz9Atw8xkvuMSZqbuNCEJ
	 TzL7iXz4OwH9SfEnEkw/2G75bz7LTpV+fe6v9EgliwSB8Krw3+K6z6igzq0luSXPasrhI
	 xzKcdMRUflBJILn/mbVXch7VaJfoiXlYkS1H1aJAKga2hGJ8kyD/jpjYBPGJtRGDtgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8U7GqET;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232C606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8U7GqET
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FED21F000C4;
	Tue, 17 Nov 2026 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922263;
	bh=LbIEKVK3wtMckNJgD329X9n3dQQ2GgjJnxeeqAkeQkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8U7GqETRL3AIroPoYVEwG1Zqs2ydfYeVWZ0AHd/YTG9+hmsOL6kg+s4y8FVsG9VA
	 0j0vYOygo3p8xkye+gtyOuHycs2BTfqUWA6hbuskk3EADC9KLuLlqUH0oZSx9WIDt5
	 XALPoHwqcZ8Vgb15Q7OA4WmxhfuhMHPxZYPDn6ec8tqOqS6zK7YwKoeyau24M9GhoA
	 yVP/kdoruOfJ2gjktLSzzSIY+FugzYKiOjN2tOTIUVp9TEueBKZld+wC5QwbRUSkA9
	 oBtr/kvXMUMTrksntIW+V5vGdDfeFhWcChrxuK3Y0+41x4xQ5WPWHDKpA2yyf3IUbq
	 0jhhza+q1EIHQ==
Date: Tue, 17 Nov 2026 13:30:56 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Christoph Hellwig <hch@infradead.org>, 
	Yuan-Hao Hsu <aa9736195201@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 0/8] mm/gup: walk and batch whole PTE tables in slow
 GUP
Message-ID: <avxWSJNLL6znDOEg@gremlin>
References: <20261116210127.3837898-1-riel@surriel.com>
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
In-Reply-To: <20261116210127.3837898-1-riel@surriel.com>

On Mon, Nov 16, 2026 at 04:01:19PM -0500, Rik van Riel wrote:
> mm/gup.c only: 347 insertions, 226 deletions.

I'm glad you describe it here, but could we please just have a normal diffstat
like every other series? I feel like I've asked you this before :)

I really hate a missing diffstat in the _usual_ form because it makes it hard to
glance at it and know what's touched (and pretty much 100% of the time it turns
out the diffstat is v. large when this happens...)

Here it is for this one:

 mm/gup.c | 573 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------------------------------------------------------
 1 file changed, 347 insertions(+), 226 deletions(-)

--
Cheers, Lorenzo
