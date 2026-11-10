Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304338;
	b=uKpVosdCk34Pbo0yeWdcJG/s8uxiSadOs5nprWSilW44SudWjqTEpil0ESLtBRZQOOjT
	 2nLYZUDOAPQXKaYlsqqgCgnpDFKPMBmLoN5F0rJoXMD0lIbxe1FQEJolGnk8K69P4jlVe
	 tAajw+V/7yVMB+QeC3FFiP6U+7cMKR/pik7gdpvhaCMb30Zkj0izLjgO7qSe4sz2J2485
	 Hv+YUMu/XGvW/3DQvz8wwqLfbTxTDbXqvsr5MuLqlWvtSVsyQuaVyvHPBS0Sb2SAlL31p
	 RH90Er5xoLbTzQLESJQeFSr2fAa/W4iUHpAC+Wmzayc4IZ59RNCYoNKJVzNFWadNxgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304338;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=E9OCRDpdhl9ezI4Dt9xCnAykvRO5aYgqDXJoDxDcO4A=;
	b=XVqfdmvckXQqQLoPMU6mGaoSLdaxZVTUUByD58gbtJe+zmIhi5VRPjmntqNtVqAH52wz
	 EyQMfsCSnwfB2qznMLiDM1hylYrNwn4oAfdFUR0nwifvqtql3In7AkKicRuPTp3Xj8pte
	 uP7vU+zQO3CKErUxLaMdgLrO+3+RmCsmOTyu2dQoOebSHSKr3vc3FuLq/8qdFV0RdJmYe
	 fEU3EcefrCLrVLmiWCM7Fd2t0UA20IDUA7ux5uwi8Cl6nG7MMhmZcTFEaQmrQdm/Q9ehM
	 jBTJuP5dLnjs8xB+9mfnYzsBSW1u2sZSSz9oJh2onJHycqUDdYFSlWbdUxb7LfK4ocQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sVl7ceVC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB697606A915
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB697606A915
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sVl7ceVC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C0CC1516;
	Tue, 10 Nov 2026 01:52:12 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 577563F632;
	Tue, 10 Nov 2026 01:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794304335; bh=r95rZWFyLLy/Is7W2LahOTY7fMts9HzjUauH3N9Wg8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVl7ceVCZogJeR0J7IZ4ZnzgP5rcwz3zd6BL4kbZu50h5Ym1pxPDhVQmR2mFBMe6C
	 ahyWZW0agDPSvwbYF7k+BW41V+0cup+pDowAWQL5eFe6qV9c+96Geza9g3UHl+B4Rz
	 NdfK0nn2v+u/BZxPf4MFn6aQ/Qgf372Z1LuYZXBw=
Date: Tue, 10 Nov 2026 09:52:10 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Rik van Riel <riel@surriel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v3 2/6] mm: gup: clarify a reason to check pte/pmd in
 gup_fast_pte_range()
Message-ID: <avLpSsyssYgT_EuC@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-2-2aaef02df0e1@arm.com>
 <a6d539cbab73091647fc2308b69fdab3069b0fe5.camel@surriel.com>
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
In-Reply-To: <a6d539cbab73091647fc2308b69fdab3069b0fe5.camel@surriel.com>

On Mon, Nov 09, 2026 at 10:50:32PM -0500, Rik van Riel wrote:
> On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> > Clarify a reason to check pte/pmd in gup_fast_pte_range().
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  mm/gup.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 7d43ce717b246..7f9348c633d58 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2881,6 +2881,14 @@ static unsigned long gup_fast_pte_range(pmd_t
> > pmd, pmd_t *pmdp,
> >  		if (!folio)
> >  			goto pte_unmap;
> >  
> > +		/*
> > +		 * Recheck the PTE after grabbing the folio to
> > detect concurrent
> > +		 * unmapping or protection changes such as by KSM.
> > +		 *
> > +		 * Also, recheck the PMD: THP collpase can detach
> > the PTE table
> 
> collapse

Okay.

> 
> > +		 * while its entries remain unchaged. Checking the
> > PTE alone
> 
> unchanged

Acked.

> 
> > +		 * would not dtect that we are walking a detached
> > page table.
> 
> detect

Sorry for typos..


> 
> Other than that, Reviewed-by: Rik van Riel <riel@surriel.com>

Thanks ;)


> 
> > +		 */
> >  		if (unlikely(pmd_val(pmd) !=
> > pmd_val(pmdp_get_lockless(pmdp))) ||
> >  		    unlikely(pte_val(pte) !=
> > pte_val(ptep_get_lockless(ptep)))) {
> >  			gup_put_folio(folio, 1, flags);
> 
> -- 
> All Rights Reversed.

-- 
Sincerely,
Yeoreum Yun
