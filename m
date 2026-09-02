Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA847DD7A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350999; cv=none; b=N+/6S0wnPzQ4CV13K1lQtj6gbCXbtAHkLDtStdv9Lcwmy3B4E5f65pMvX1014Tinih+Iy2xEsdu/eJtX2Gsipo5/oPzSXaoZfoNvJdbBVIfQZeYe8TV5LW+TXAiFXTp4a5mthz9GLizkraSJ1X7MSjVTJXj+Cw3r9uFISzPoTx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350999; c=relaxed/simple;
	bh=UF8B5DVnStRck5sMzmDzOwCOV+E4FmHURou880UH9z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/3zQFTAbIynkJofSRkWkQDwAgPtHGDA4m6syhHV8TvUaOYer9ko/rbgmZRNrJWIEdLScEMWgWp5Yf9WDE3R93DZkd93J97bT3swi040tbrnFPgP7mSqRyOJwNz7qPx7GXsWieLTzYJQlSFirAfvZKBraGZ9zFEMh5QYzq5V92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQFuAyuN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQFuAyuN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35051F00A3D;
	Wed,  2 Sep 2026 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788350996;
	bh=jIXfuktxBX9npVbn29PNwEDcICMHnTCbs+iOm5eKoxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CQFuAyuNHerDnWsaFITNdyKdYk0CDRDVo85WOXqItPK45gd2qprMEyHWZtia5OZSD
	 F+oNuD69Rox5filuXKINVTARp9sP3eAtoharI+a3M2Rss1fvn2x2VqC6o2bnFRH5lX
	 sWfvLXb1DLtYNwb7jeTUmS/hQ/87QH/5c2hyMiXPXNLunXSDqWjqqIHT7fx0mtt1cb
	 p1IfB55BWUQcWZ/99vYKL/i24P6KmHe42oWKm5A/Bq3divRGIFn/AZs9yj28TGXlGE
	 TBOPKGpJU+vTbGBPFq8cP7Iz3+tYBQsIeMQbIxlczwpxE4pmP+9v23ctQP2IEoPg8k
	 nC6gFCN9OuuFA==
Date: Wed, 2 Sep 2026 15:09:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
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
Message-ID: <apgSCyj-h2xVc2ss@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
 <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>

On Wed, Sep 02, 2026 at 01:41:54PM +0200, Eli Billauer wrote:
> On 01/09/2026 19:46, Mike Rapoport wrote:
> > > * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
> > > it returns?
> > It's not pageable in the sense of demand paging. Some architectures lazily
> > synchronize vmalloc page tables and this can cause page faults that will
> > take care of the page table synchronization.
> > 
> 
> Thanks for this clarification.
> 
> This sounds like a showstopper to me. Immediately after the allocation of
> these buffers, data from the USB device can arrive at 400 MB/s. If the data
> flow is throttled as a result of handling page faults while trying to write
> the data to these buffers, this could lead to an overflow in the USB
> device's own RAM buffers. This is because the USB device is an FPGA, where
> RAM is an expensive resource.
> 
> So using vmalloc() may result in a malfunction in the data transport where
> the __get_free_pages() would have been successful. This outweighs the
> benefit of a somewhat higher probability of success in allocating very large
> buffers, and surely the improved aesthetics of the kernel code.

kmalloc() still works, just like __get_free_pages()
 
> Regards,
>    Eli
> 

-- 
Sincerely yours,
Mike.
