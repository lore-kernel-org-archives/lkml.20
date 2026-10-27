Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103753;
	b=Cz9SpnPGnGq14ILIuT2Exq9OMX6vrjw5nGgltUjs2RrzByIGxb/E0840mNynF66KlHQG
	 +beLhb1nNc5AV2Y6fDtpWHBMgWLt4tBdeir0AybYE931S78/p3aKHpRhXqWbnoiCnkrOK
	 kFu3nLT9+7Rarfo8NfdymNSrvXIxHyxigz60PuII8ntNIcLOAeCK9rL+io3aFbrCUiYmx
	 uqjCytOaswqNrKXR2wYfblPOohDCOghKo1fPgTJbYPgUUGI1SWFGqDwPwvBAXkBoVct+6
	 kKdfklS+MOSEYO2PaZ//lmEvDxOoml/gEI9VUHqGzPoFLlHQnfpMZuhLWtAt324TeXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103753;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=PYupT4R2wrTtuLnmT+K+EYDPSdbL6IVQkich1PHb7RU=;
	b=S+Bot+ijGM9OHsUFXkJ8XsxdsdmToeve07iOBrFq83LJZtqxod65NOzhyXpXxQUYjAqc
	 fG2hkye+KXbsIXd4TFqPyLHvtpEWj96ezg7eGmo4nB6/8GbbzV5DJPANrqUQYINH6YQt7
	 ebzrivUPKfttT9akz32xwWRQ/ODv1Y7/QNzQQs6BIU8Do80jQiSI+eR+iz2wHRtDPLfjV
	 PhCafSlo6QO0YZs/6ry5IqTxqcbgq203lbY9HxJREH+h0BnTYTAPCRwzm6J/k+Rt1qRg0
	 F3pYrEQx5GztvZ72xdY8bakuCVyNrSHCX+iryZRBiPUdl2HCesxoh27Edn/uxSy8lUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EucCbRvd;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA819606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA819606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EucCbRvd
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 102FE15A1;
	Tue, 27 Oct 2026 05:22:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C703F7B4;
	Tue, 27 Oct 2026 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793103752; bh=b1JEKZq+qFyqBeJCpYq5W3IAj8ygrX65I0RZCYtIPJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EucCbRvd8KoSEkBB6E0N+iAtZB854R2c9Agr4NE1ihGmQzd3iO3ZT9WsNHayT2nJB
	 nX7jN2yfpviE7lXh91GBNjJbf9lTah3PoJrurIEBcOCXKguPqNxRpfwQ5hx7hSzVsa
	 RkUPOU0qMgMtzUGIFCSu8q/y5EKM0x0VpResoxQU=
Date: Tue, 27 Oct 2026 12:22:27 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Aristeu Rozanski <aris@ruivo.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
Message-ID: <auCXg7VMr7NdkPdN@e129823.arm.com>
References: <20260917083747.786-1-aa9736195201@gmail.com>
 <7dd4ec994502233cdc09fe5c4369adc89168d738.camel@surriel.com>
 <20261010195202.689-1-aa9736195201@gmail.com>
 <ff62aeaeb5ced49640c959c047b2e9f320f5c10f.camel@surriel.com>
 <c3c6f83d-380f-4a9b-a204-fd157ee77648@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3c6f83d-380f-4a9b-a204-fd157ee77648@kernel.org>

On Mon, Oct 12, 2026 at 09:05:55PM +0200, David Hildenbrand (Arm) wrote:
> On 10/12/26 19:58, Rik van Riel wrote:
> > On Sun, 2026-10-11 at 03:52 +0800, Yuan-Hao Hsu wrote:
> >> On Wed, 07 Oct 2026 06:47:06 -0400, Rik van Riel wrote:
> >>> Since this is lockless, the PTEs could change under
> >>> us between when we walk them in folio_pte_batch_flags()
> >>> and the batched try_grab_folio().
> >>>
> >>> Is that race condition safe, or do we need to re-check
> >>> afterward that:
> >>> 1) the ptes still point at the same folio, and/or
> >>> 2) the folio still spans the entire range, and was
> >>>    not split before we grabbed the refcount?
> >>
> >> It is safe, because the batch only runs after the first page of the
> >> run has gone through the unchanged per-page path: the folio reference
> >> is already held (and for FOLL_PIN the _pincount already raised, with
> >> the smp_mb__after_atomic() in try_grab_folio_fast()) before any of
> >> the other ptes is read.
> >>
> >> 2) With that reference held the folio cannot be split:
> > 
> > You are right. The page tables can still be remapped
> > to point at something else after gup_fast_pte_range()
> > grabs a reference to the folio, but that can happen
> > no matter what precautions we take inside gup_fast,
> > because it can happen after gup_fast has returned.
> > 
> > I have no other concerns, so feel free to add my:
> > 
> > Reviewed-by: Rik van Riel <riel@surriel.com>
> 
> There are a bunch of things I don't like about this, including suspiciously LLM
> -sloppy looking stuff like
> 
> +	if (!pte_write(pte)) {
> +		for (i = 1; i < nr; i++) {
> +			if (gup_must_unshare(NULL, flags, page + i))
> +				break;
> +		}
> +		nr = i;
> +	}
> 
> I'll find someone to polish this up.

Thanks David, I'll post with a little bit fix in next rc-period.

-- 
Sincerely,
Yeoreum Yun
