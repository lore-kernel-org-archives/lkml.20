Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393037;
	b=scu+EIhVWC9Utxn0XSrMeQH/CeTCWPvXPClqWMqPHsWeDCMNR4xFxv5yugPRFCYED6hm
	 Ffs2j5DXtSt0ODR5uMxIoir6Atfs59cTAovma/upLLN8IJs5HUXy1dQWgvNTtULkTH8kO
	 cRAh84vUEx9la/cYbPAkAuyzxASCDmajb74Y0g8Oie76+Q48bQOo4sAYoqtWnOhI2dFcB
	 +OYN2V5wSqm2e1JbHipuM5kVUXHAmfI77GVDVTGXSq1kMaa8tLhH9vgXmqEm/ZbVQ7cBZ
	 iqtB9y2b/34z6KTT8ZkWHo7SPunFRPOzRHno+5VmqFbKfEcr8TMhc0sh7h7IsgbN/Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393037;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KxrhFMa8/sp9xXjPYISbhRzyRkp2BmT2lD81VC2uH5g=;
	b=Zs7js/Fm54NGeiX/yV0TzeiAGKCHIifkQCy/vdUAkqUU5T1o4yWegYDVeeJKjdo1QhkR
	 oXsKvDZluIWVNhXEJEDjlCJOj/vgwxo69dduTiLzd1+RgbGG8/E67gukjz1duKT9wYdlt
	 DOsfPA/AUk+STXm2bTk5SsYY6/LGSalM0WWXRol8rzeoy9/BIOLemvx2Vm2pDxKvCNHxH
	 DVyunG9lzbSAwkIcDKNUS+iL/iQzBhDSqy43Abeqy1xQk+audoCyiQwOyROwSSih9A4QO
	 IeTCepgO3VdIfpPoHvMndhd66uELhjQllHi+k3qh4Yr8JH6FFyZpD7PxYVSFnAdmDKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrTLwSLE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5E606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrTLwSLE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB69F1F00A05;
	Wed, 11 Nov 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794393037;
	bh=KxrhFMa8/sp9xXjPYISbhRzyRkp2BmT2lD81VC2uH5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JrTLwSLEd+YvzAemdyR51xbG4OegeC7uVGwCapD1h/0s5JMcEnFwWTDyHw8hxhFYc
	 Yceo4rD3o841E85q5UtJ63r9LzJ+/IPSvgm54TH6mNqnP/tb0WyhsqEDBspvr1nMgU
	 Hu4Q34UrszFwNjN+s0A0uWuX0SBJx41Hhlkwlrl2IZ2jWWBFyeM5f6ONI7me+XJd2x
	 tDLrSIQN0h+XzgIJDmF0lUAShZ6b6bEeZ/g2Px2DPD5n88Mxnvvk5FF5+ArOFgekE3
	 KuBbgHWL/Op3aP1kzP2GjMevvmUd+kFCCVz2h+/uqELmyOPdyL+R577xO/dD9peHYL
	 sFm19EJSuqEpQ==
Message-ID: <e66b6c19-95d2-459a-926c-8429df693acb@kernel.org>
Date: Tue, 10 Nov 2026 14:06:23 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 13:32, Yeoreum Yun wrote:
> This is preparatory patch to make gup_fast_pte_range() batchable.
> 
> Introduce gup_unshared_pages() to count consecutive pages within a folio
> that do not require unsharing, and use it to implement gup_must_unshare().
> 
> Also add a folio argument to gup_must_unshare() so callers can reuse an
> existing folio and avoid the compound_head() call implicit in PageAnon().
> 
> There is no functional change.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  mm/gup.c | 111 +++++++++++++++++++++++++++++++++++++--------------------------
>  1 file changed, 66 insertions(+), 45 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index bfe83ce1411d5..c863bae33e2f1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -633,58 +633,39 @@ static struct page *no_page_table(struct vm_area_struct *vma,
>  	return NULL;
>  }
>  
> -/*
> - * Indicates for which pages that are write-protected in the page table,
> - * whether GUP has to trigger unsharing via FAULT_FLAG_UNSHARE such that the
> - * GUP pin will remain consistent with the pages mapped into the page tables
> - * of the MM.
> - *
> - * Temporary unmapping of PageAnonExclusive() pages or clearing of
> - * PageAnonExclusive() has to protect against concurrent GUP:
> - * * Ordinary GUP: Using the PT lock
> - * * GUP-fast and fork(): mm->write_protect_seq
> - * * GUP-fast and KSM or temporary unmapping (swap, migration): see
> - *    folio_try_share_anon_rmap_*()
> - *
> - * Must be called with the (sub)page that's actually referenced via the
> - * page table entry, which might not necessarily be the head page for a
> - * PTE-mapped THP.
> - *
> - * If the vma is NULL, we're coming from the GUP-fast path and might have
> - * to fallback to the slow path just to lookup the vma.
> - */
> -static inline bool gup_must_unshare(struct vm_area_struct *vma,
> -				    unsigned int flags, struct page *page)
> +static unsigned long gup_unshared_pages(struct vm_area_struct *vma,

Besides the function name, LGTM.

gup_pages_requiring_unsharing() ? Don't quite like it, but something along those
lines.

-- 
Cheers,

David
