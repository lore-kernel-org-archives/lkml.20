Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628442;
	b=1PA3Dmc6QXLV/5eWmUAXjOnKdg87B7lpllG2anFbblpPioeppzBwPRg01bqEYEgufYZN
	 yB4oId5+yOkR7WiWFZNYotSy7Xybtp1U9+Qjv2VePvtlIbzo2U/x8nFgrtdgvpdWDgzUE
	 rNMVYIn3KBCMECfT7eetemeiaq/+tI4Bgp4Bgrr+1ngyDNVaHHkUh5aq71mTcZmAeHTfx
	 CB7CvEgdEY7zQCT3DMTfsHNY+ZoH4KEURLFkYL4wHlz7aUu022D8JrcZEmfIXQfbJiWft
	 2e+2/7+sz6im7x0Bb1eA7SBvamc41QvS4SmLDq78VahVPGF10wsOpydCnGOnuvYOEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628442;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XU7NgO7ikkcuAODAla/GTJ/uKE9KKokx9jR+UBm8e9I=;
	b=G2cI0Llbl2+Z1pd2gjEELYyrSsisETWxtpXv7ATfurERSpr/nkr5LLe2SKk4FasCxQdV
	 DwYiatGtCykN0tCX/jwJLaaKmR/beeeMTnnggjMlOBXbYewms4fPXdjjD3P6F68Y51Ruh
	 lKLYuWiP7ObLtNxW9+uF5Xmk2pMqns/F6cgy9qnVMWeL2iezBfhHmxIAht1C7iNCT/7ga
	 DKSla+JRcpFqWeKR1Le2HmrqzA/ay/+9b71Vv/SHcCbferf9cJIXsKY7wcZ/ACSNXH7CV
	 K0a6SgMmoGZ/3/5esRj3g/kL1aJOSK//q8VJuGNDNu6B/+EbZHWTLR0LvuvGPeQ/+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jBnJTgXW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CE6606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87CE6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jBnJTgXW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 688DD1691;
	Mon,  2 Nov 2026 06:07:17 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8799A3F59E;
	Mon,  2 Nov 2026 06:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628440; bh=okA/++pW27xIdWmqVZy2ykipgObAMuboinr6ec1sU5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBnJTgXWfHg+QNg7DQOItwTLd4XyLxdbeDwlTbO7ufrAlk2WRjxuW02nKMvY37PPk
	 QL0RxH1OvafU8aG9fX+0TV5TunRW15831s/wOJZNZVYvdCkmiqkmIFDuopKtGau0G/
	 +lMCckX1nd4n1qkrQi9h+UUvCfMyPVH/6hwSKrnU=
Date: Mon, 2 Nov 2026 14:07:16 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rik van Riel <riel@surriel.com>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v2 2/4] mm: internal: fix inconsistent in
 folio_pte_batch_flags() for shadow stack
Message-ID: <auiZFJ7Bb6cQnqtX@e129823.arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-2-bc1ac018c834@arm.com>
 <85c4a87b-2c8b-4ef5-bb30-6518080f8be0@kernel.org>
 <auiI8jzumVHmmSV9@e129823.arm.com>
 <9a67e7f6-0ec6-414d-8689-c70eeed6100c@kernel.org>
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
In-Reply-To: <9a67e7f6-0ec6-414d-8689-c70eeed6100c@kernel.org>

> >>> +		if (unlikely((flags & (FPB_RESPECT_WRITE | FPB_RESPECT_DIRTY)) == FPB_RESPECT_WRITE &&
> >>> +			     writable != !!pte_write(pte)))
> >>
> >> It might be nicer and more efficient to track if any was readonly/not-writable and
> >>
> >> 	any_unwritable = !pte_write(pte);
> >>
> >> And checking once after the loop.
> > 
> > Sorry. But I couldn't follow. If we accumalate with any_unwritable
> > and check it out of loop once only, we couldn't properly nr value or
> > Am I missing something?
> 
> Ah. The idea was to simply reject the batch entirely if that happens. It would
> only matter if some folio PTEs are writable while others are not ... well, ok,
> there are some cases where that can happen, but it's not really the common case.
> 
> I think we should simply disallow ever getting large folios into shadow stack
> VMAs for now. So I'd prefer the fix below.
> 
> Thoughts?

That's my preference too and we've discussed :)
I'll repost with below unless anyone has any strong comment.


> 
> >>
> >> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >> index 4b71d010b2aff..9a2dc90ef9690 100644
> >> --- a/mm/khugepaged.c
> >> +++ b/mm/khugepaged.c
> >> @@ -367,6 +367,9 @@ int hugepage_madvise(struct vm_area_struct *vma,
> >>  {
> >>         switch (advice) {
> >>         case MADV_HUGEPAGE:
> >> +               /* PTE batching doesn't work reliably. */
> >> +               if (vma_test_single_mask(vma, VMA_SHADOW_STACK))
> >> +                       break;
> >>                 *vm_flags &= ~VM_NOHUGEPAGE;
> >>                 *vm_flags |= VM_HUGEPAGE;
> >>                 break;
> >>
> > 
> > Yeap. once we do this, we don't need to this fix patch anyway.
> > But I don't know whether there is practical case changing the
> > VMA_SHADOW_STACK with huge though it is initailised with NOHUGE.
> 
> 
> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely,
Yeoreum Yun
