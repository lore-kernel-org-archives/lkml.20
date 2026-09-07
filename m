Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214492E06D2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767673; cv=none; b=on+O93+BU3qCEQSZjmJze4vgrFMP3JLuNugOXVaK1fe2CovpV10nt198rC8wmlWW1tgpoZeoUinX2AsLRoow1P6fStdHiNnNkfKXjHYsSPzZ45c/J1cZ/eCTTi8tYRNbatEOW9m65Bct962innHPNCfliPhzpzG4AZ+ZNlQhMLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767673; c=relaxed/simple;
	bh=qX0AknaM4KCNcEypji8hjpkAWQD4xaVLCJK+99Wl69E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoMtp0d663p9NioUg6EATN1BvIA/TLYo9U2UiVmYUGZTqzDfr+9+jy1ci0P3f6ow89xf5y4oEyI2HNW3wa1/MRrddilOVu+7yTmuitoMKPXzSfD8Ia2G++XhI7DHIfJ1ghuC/Wv3RKthLnDEnFZkWKHR/PJOAoSb9Q10Bk6Lxq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=i/De0b7z; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="i/De0b7z"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788767662; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=r3clthTDzgWN3aslLZg1SpQ+K40AFK+hZOg9wxrfKeA=;
	b=i/De0b7zN2nNs9k+hx53UPFX5/cq1wI4O856oKzloYIDQiXpk/3cxY1ULsQYXDPDBnv38PrMc3hAkbGCAkrD3VLvEo2TNVe7bcqN+JTKHMiwZfYatD7xDJfI2RWC48S72TBhdbMUSE/+K2GRzCNsKUu2JZdWrLbXMygau2T7Itk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XARWU-u_1788767659;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XARWU-u_1788767659 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 15:54:20 +0800
Message-ID: <273e167f-32b7-49f0-8589-5883a4ec2d99@linux.alibaba.com>
Date: Mon, 7 Sep 2026 15:54:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] mm/khugepaged: rename mthp_present_ptes bitmap to
 eligible_ptes
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
 <aeed00c71bab856afb18c12c8e9b904f82185942.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aeed00c71bab856afb18c12c8e9b904f82185942.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The name says less than the bit means.  A set bit means not only that the
> PTE is present, but also that it passed the other checks: uffd,
> lazyfree, anonymity, sharing.  The PTE can be considered a collapse
> source.
> 
> mthp_collapse() then reads the bitmap starting at the PMD order, so the
> bitmap is not specific to mTHP either.
> 
> Name it for what a set bit means, and update the comments that named it.
> 
> No functional change.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   mm/khugepaged.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index a6dfd8cddc50..6a437d6fe016 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -115,8 +115,8 @@ struct collapse_control {
>   	/* nodemask for allocation fallback */
>   	nodemask_t alloc_nmask;
>   
> -	/* Each bit represents a single occupied (!none/zero) page. */
> -	DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
> +	/* Each bit marks a PTE the scan accepted as a collapse source */
> +	DECLARE_BITMAP(eligible_ptes, MAX_PTRS_PER_PTE);
>   };
>   
>   /**
> @@ -627,7 +627,7 @@ static void collapse_control_init_scan(struct collapse_control *cc)
>   {
>   	memset(cc->node_load, 0, sizeof(cc->node_load));
>   	nodes_clear(cc->alloc_nmask);
> -	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> +	bitmap_zero(cc->eligible_ptes, MAX_PTRS_PER_PTE);
>   }
>   
>   static void release_pte_folio(struct folio *folio)
> @@ -1482,8 +1482,8 @@ static unsigned int max_order_from_offset(unsigned int offset)
>    * mthp_collapse() consumes the bitmap that is generated during
>    * collapse_scan_pmd() to determine what regions and mTHP orders fit best.
>    *
> - * Each bit in cc->mthp_present_ptes represents a single occupied (!none/zero)
> - * page. We start at the PMD order and check if it is eligible for collapse;
> + * Each bit in cc->eligible_ptes marks a PTE the scan accepted as a collapse
> + * source. We start at the PMD order and check if it is eligible for collapse;
>    * if not, we check the left and right halves of the PTE page table we are
>    * examining at a lower order.
>    *

Should also update the following comments: s/occupied/accepted as a 
collapse source ?

"
  * For each of these, we determine how many PTE entries are occupied in the
  * range of PTE entries we propose to collapse, then we compare this to a
  * threshold number of PTE entries which would need to be occupied for a
  * collapse to be permitted at that order (accounting for max_ptes_none).
"

With that and Zi's comments addressed,
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
