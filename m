Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DE326939
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426954; cv=none; b=Q+nDLdBjhR0DggGD16JG/TN5+zyFFdPeYyDTx19TLhBQGtNeS+DTbuHAdfgrVT5k89X6YTlJWaYYjFrTXCMfJ6bW/7c6T7M+nnLzbsnBy82aq/KdFbgEnI2fH7SwZ39r6B30aC1OEZxgrGVyBPk2yUExMA2WWvw/kt0X67SzUX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426954; c=relaxed/simple;
	bh=xGpvJdD7G94JTLKCZn+gTZiTbnXYpaJnW40NsnpU+lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqpDUGd5W8Ph0cxmlQfGDwK56EnE2Hm9MZsRFGYfr1cIMRKKSdhw2ZN29zWvYYEMraivWz7qUpUf49plg86cfwRWVF3W8VclF+wMTnXDP9FOe+CiwiqS7/GngG2Mc6u/ln1ePUvJ98/YG6SUDFckX6ogSdxl1dTtUmI8rdMcyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0zsCHKQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0zsCHKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCB61F000E9;
	Thu,  3 Sep 2026 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426953;
	bh=2a8yIQ3NE86fziYRRmM1NyoVwXAqG0dHOhexSSfbtW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0zsCHKQLk4p8gAn3X8j4oy3KYslGMK/guDz3UOJRR2N9We0sVvbpFK/tqFZEs6hS
	 QGZTNx4CYKtVtsv0C4c6LK+370dmf6vuYWyChytDHcZjngcrLBJRbI1EPFabmoqMSA
	 qZY2m0BNqpRVODEnXYlMUDe3XKdhPYn1UADPoG0K7Kp5YbWUwTwJMx998EnYZp5x+E
	 7GFc412nEoX9MMCL8ZxJywrQM0nTSpoDEGJ7jQOSeDwqfeL2JHMR5tpX8WtDYELqbb
	 7IrVKjbr8LEORFSJMs8oYP5mXCSNx/j4l/PbFzx/kbmKrHsqq6Xbb9o6tQoUAyn5GT
	 6o2UQOGFJA4eA==
Date: Thu, 3 Sep 2026 12:15:46 +0300
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
Message-ID: <apk6wr2S1IOQp_Kf@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
 <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
 <apcKQBRCFeF-usK7@kernel.org>
 <2d7b127d-6079-40c0-2020-dc7767b2396b@outbound.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d7b127d-6079-40c0-2020-dc7767b2396b@outbound.gmail.com>

On Wed, Sep 02, 2026 at 01:40:21PM +0200, Eli Billauer wrote:
> On 01/09/2026 19:24, Mike Rapoport wrote:
> > On Tue, Sep 01, 2026 at 10:42:47AM +0200, Eli Billauer wrote:
> > > On 31/08/2026 13:32, Mike Rapoport wrote:
> > > > For large sizes kmalloc falls back to page allocator anyway.
> > > > 
> > > > And the doc is out of date unfortunately.
> > > I think it would be a good idea to update the doc first, and by doing so
> > > officially change the API. After getting this change approved, it's indeed
> > > safe to rely on kmalloc() even for larger memory allocations.
> > The documentation always lags behind the code and "official" API is what
> > include/linux/slab.h says :)
> 
> This is what I found in slab.h:
> 
>  *
>  * kmalloc is the normal method of allocating memory
>  * for objects smaller than page size in the kernel.
>  *

Citing vbabka:

that sentence doesn't exclude >PAGE_SIZE allocations :)
 
> Regards,
>    Eli
> 

-- 
Sincerely yours,
Mike.
