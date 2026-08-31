Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BFE33B6F4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175979; cv=none; b=cRlh6AeX3sL+/yTZ9NMzFFaACW47pvgoMn+9MQYJU03ulyvZKJIKFdr7vZ1F7MtSSvRchqkJGyJRgjZ6hNNHAjyEwoYnwaVnYw1MIgkaxhPzds4bDU2mLiFFFIcf+ZL8/jvrKwrkwu9NrGkR1/NHfBswlpmgxT2gLhZ2RrSyzgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175979; c=relaxed/simple;
	bh=RmfdhCA6XX/SrmjcYo6qZYRP/SI63JXAUAhiqAV9oXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5FeSozNevAO5s6nsO3gimGGLE469Sw7CxO8g1y7aL+mMjAL0iTRVCayyGVPUabXA8oSS1y6RU6NNdPS/6e38Xccn/PU1flC7Krg12FFE+HHJhfEWB6kdslC99HwrBWbRWCrn7lrBEvoPwuoQ9A3Rt08M47wVgO6N6Iq6XIGUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZJyrgmM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZJyrgmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E191F000E9;
	Mon, 31 Aug 2026 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788175978;
	bh=WH9GLRjSzyUmXP73YbT8GymaYDLOXQlGnVZRz7SJVBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AZJyrgmM8QADM/tQ3djTAeARnE0tu71LsYAnpmqOKEj9/Wtt3nwHniVayVY8E0Toa
	 yOc5jOJtEmC3bTWpfpt3zQGdo1fQ9ZleHcWHBaMU8ssVlG+Ke0eEyvGXlXmRFCnQaj
	 24DWfOWiKUIVTcMRoDf8GLwWworUIMllAjQPrMak3Uhn+2l8psqWw7Z70Ac7fmF9Mj
	 s5xWmHPx0ttQkWplwpmg38jECJ3umgKKp4Q9iMYLezRSHDeetagS7TrEN9nDaw0PxY
	 MWZfkVXytlJKkgMMAQ1j+jROPE42uPqSohV8GVbsUZvr6h+q88wozzSnTj8/xy/yXH
	 LgAp5GZKJQY0w==
Date: Mon, 31 Aug 2026 14:32:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
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
Message-ID: <apVmYXlqsVr_p4Oc@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>

On Mon, Aug 31, 2026 at 12:13:08PM +0200, Eli Billauer wrote:
> On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> > fifo_init() allocates the buffers backing the software FIFO and
> > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > 
> > These buffers can be allocated with kmalloc() as there's nothing special
> > about them to go directly to the page allocator.
> 
> Except that they are a bit large.
> 
> fifo_init() may be requested to allocate up to 256 MB of buffer memory. This
> memory resource is split into an array of buffers (fifo->mem[i]), each 64
> kiB (or less, if there's trouble obtaining segments of this size).
> 
> Citing Documentation/core-api/memory-allocation.rst:
> 
> "The maximal size of a chunk that can be allocated with `kmalloc` is
> limited. The actual limit depends on the hardware and the kernel
> configuration, but it is a good practice to use `kmalloc` for objects
> smaller than page size."

For large sizes kmalloc falls back to page allocator anyway.

And the doc is out of date unfortunately.
 
> Regards,
>    Eli

-- 
Sincerely yours,
Mike.
