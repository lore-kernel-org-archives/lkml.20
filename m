Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06ED46D577
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249565; cv=none; b=B4yXFLOMgMC8QLOC/5juZOEgE2RFjtLMw8kchmrHnbVwiQQHG2IzsIgpkKRc0az+v9MJcUcWuCmECoEPpe2KCu4YDxWg5WyCAihQmPGQujlYjILd96U2NJk3Jb4iGAm2+A7zzOEHJm5OcrMmedyf/+DQp+s1TiQ84ZYnSnnRUZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249565; c=relaxed/simple;
	bh=BTdVJrhRUfZ8q3sxvPuXbbscjsPWWOT49+QShfRdWv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEx7bqnvnr2PFWioXFDB4o1zkO2FHwr90LBPldjLjWLXyLj0KKnp8R76HOR8CTG7BqtvZZ3RtCpe1mtGuYWK2NKFwXq/MdWeGbWjxOQ2oKywlLJnA3jPN/5zt0DvImpxcy7m3U3AIPGv52RP5tRk/RuiWcMCaAxjKZf22ZdskEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7SEFFP8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7SEFFP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201A81F000E9;
	Tue,  1 Sep 2026 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249564;
	bh=iJv/WiakOodAqFIubQ5HTmHL0TDtf9MpNqrzEXUw2fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P7SEFFP8puwZXZp/YRq5bm12kLhga+lgh99B8rQeYLWPKvjGgDXAgg7amgbvop6gs
	 KnFbcm9PWiLs6fpRX3X9ZFziRD/tbsK3eH/C4U9q+apMvreDXnEx9yuMWrWXaAlfn9
	 RfE+EypR5zdZI4scQXJRBlRBhEahbdQVPKXgYGzRzl4sArWd1u++y7ARbEBAYmsoti
	 qa/YYnJeh63FtQSZKwP6986LY6PCjMAcEQlpM6IXvbI4ROaA1SfUtvjcxi9CnB5UZH
	 Nk9IDitG/j2LUr0suo0oUruy11Tq+byoKby/mpiq0sCo0dpWi4sYmz38BnnJLGVmE9
	 9mRRThkgaqcJA==
Date: Tue, 1 Sep 2026 10:59:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Eli Billauer <eli.billauer@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Brad Warrum <bwarrum@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <apaF1HUtJnstuUN4@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831123937.32255a49@pumpkin>

On Mon, Aug 31, 2026 at 12:39:37PM +0100, David Laight wrote:
> On Mon, 31 Aug 2026 12:13:08 +0200
> Eli Billauer <eli.billauer@gmail.com> wrote:
> 
> > On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> > > fifo_init() allocates the buffers backing the software FIFO and
> > > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > > 
> > > These buffers can be allocated with kmalloc() as there's nothing special
> > > about them to go directly to the page allocator.  
> > 
> > Except that they are a bit large.
> > 
> > fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
> > This memory resource is split into an array of buffers (fifo->mem[i]), 
> > each 64 kiB (or less, if there's trouble obtaining segments of this size).
>
> Would it really make sense to allocate the four buffers separately?
> And/or use vmalloc().

My understanding is that the buffers don't need to be physically
contiguous and vmalloc()ing the entire fifo->mem in one go should work.

Eli, what do you think?
 
> David

-- 
Sincerely yours,
Mike.
