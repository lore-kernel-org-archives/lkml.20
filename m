Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12AF3DAC13;
	Tue,  1 Sep 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788279030; cv=none; b=UFRz0ZR8RjQIEfS2krQLzssjDB7HDsBMdsk4Kl4WQXHHImz3Y58ay1Mlu36UxkbI9K3eRyD+OCXQ96Arcgo8gDv1QEksbHucqkXaIHMQSssotz1IP8C3Ve38JQUsJhV2puLx7fQ5Z3AIUXL2hde/Mw8dAiZEXW9UHUBKGEqVyWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788279030; c=relaxed/simple;
	bh=BdK1Um6IHi0RAu5V89/ijTa0ATD99QmBOFgMArRrCc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGmo6M7kuNWK7RHk54uSXs8J7/aroARfFbfEGH3Z3XCZdhijMLsloZhFtOl49SoDg6jFmDpOWkje0ZUbBYmVXhYNbYncaHZ9URb2+hjc3UIha4tgjrtA+omHJ/JHYXJCXQtHI66Wa9OOoKj0B1xuk9qdO1fCyELKmz9sL/0WyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OC+M8gjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OC+M8gjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05851F000E9;
	Tue,  1 Sep 2026 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788279029;
	bh=nU8qGw7zBAB9FyzOBq4+DQ5jWvbJw+bt1tKhVtpbGP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OC+M8gjghk29AmKMTgxa73kHrqTtwQ+sADXbLP4qeJ0bRA4W89p+gz0AH0NEWeqzF
	 c/OsxPewPaN/MTnMv4PdIOEWWT2QtAsiFnmCb9tbONv5xBnfgq4M/3OU+QlzHEIpFB
	 ofgA9PiOgqKv7/aoadrfbnUutyJM/wlWU15Pmg1DoilbqyODrPE//w3eMsGQddefh4
	 Mqp6rBrRST9l9qf+idOM77HA/ROpVNXvAiCR9CtiZftMcbOqQ7hXDbj3uzD72KYvQR
	 bgu03LPdcs2Fw9nf/AuKTqw/+xV/eVWWQQ/vHjFZVYGplm4SAc0cWc7Id9Zj2UPfku
	 3mc+D8yXT7cPA==
Date: Tue, 1 Sep 2026 19:10:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/2] docs/core-api: memory-allocation: add
 k[mz]alloc_obj() and clarify kmalloc
Message-ID: <apb47Rsnz1H36SOy@kernel.org>
References: <20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org>
 <20260831-docs-memalloc-guide-v1-1-547718c274c1@kernel.org>
 <23db34a1-ba1b-495d-91ea-18419e0dc8df@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23db34a1-ba1b-495d-91ea-18419e0dc8df@kernel.org>

On Tue, Sep 01, 2026 at 12:17:02PM +0200, Vlastimil Babka (SUSE) wrote:
> On 8/31/26 17:13, Mike Rapoport (Microsoft) wrote:
> > Since v7.0 the most used memory allocation function is kzalloc_obj().
> > 
> > Update hte memory-allocation guide to describe k[mz]alloc_obj() family
> > and make kzalloc_obj() the first answer to "How should I allocate
> > memory?" question.
> > 
> > While on it, clarify description of kmalloc() size limitations.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks!
 
> Suggestion below:
> 
> > ---
> >  Documentation/core-api/memory-allocation.rst | 30 +++++++++++++++++++++-------
> >  1 file changed, 23 insertions(+), 7 deletions(-)
> > 
> > -For large allocations you can use vmalloc() and vzalloc(), or directly
> > -request pages from the page allocator. The memory allocated by `vmalloc`
> > -and related functions is not physically contiguous.
> > +`kmalloc` always allocates physically contiguous memory and the maximal size of
> > +a chunk that can be allocated with `kmalloc` is limited by `MAX_ORDER`, the
> > +same limit also applies to the page allocator.
> 
> Would it be better to say the maximal size is KMALLOC_MAX_SIZE which is
> derived from page allocator's MAX_PAGE_ORDER? 

My point was that whenever you allocate with kmalloc() the limit is
MAX_PAGE_ORDER, not necessarily for actual slab allocations.

> (Also `MAX_ORDER` doesn't exist anymore)

Will fix.
 
> > +Internally, slab allocator differentiates allocations of different orders and
> > +delegates larger allocations to the page allocator, but for the users of
> > +`kmalloc` family it is entirely transparent.
> > +
> > +For large allocations that do not require physically contiguous memory you can
> > +use vmalloc() and vzalloc() family.
> >  
> >  If you are not sure whether the allocation size is too large for
> >  `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will
> > 
> 

-- 
Sincerely yours,
Mike.
