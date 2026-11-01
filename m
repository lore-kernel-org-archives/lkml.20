Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556692;
	b=Vthgl0wXch71HvBBBoQLHjnCorIfoqXCFMt8cWxmt2dh4i36swpdz7fkugoxJ/HwTPch
	 vgdumPevDTu27Giqt+topCL6aYpuKWq9LWTPFV1KbU8Ys8TMCrU9JFeEQ4tG6S6Kc3XQm
	 coEJ2wzeZSHctYamEypoKQNFsuQPuddny6Vsj4CUYhpEzgudAM4YbNQiUzx1FvkKsBmQy
	 Z+X0gVw2gizbadqokxAOLLCcpslwJQ02uV1QmTQkbdrQBmnV3D4wcAyYHRhiTU9P6k4kq
	 LeG72SZte8mTmhHDWqdftq0k02zyXxssULAt5VfL9SayAPmJe7SxZeDR6F+Eu0xjXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556692;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Zk/xFJUvpptQoHdHEaeuVhwsJCx4lSLvvDbqB+bW+vw=;
	b=jOr1YPTK24BCOZkpmjiYX1aoRLf4ASNoWMW/76OLMce65hddiEb+jBWZzKrybooSAHsz
	 j9imSmK1c6hRi9PQEvtf/KvPmk0sFS1mGuI8ZccYAZSPG//8EM9/u1MjPLJt28BH6uuMQ
	 8oOJCRdKapAn0PFI3LQS33nbYlHCqORkXB03nYHyO60TPODXN6ov0U5QcnILLh1wMqemz
	 pZnf6b16oo6/w45hkYT39mRsrYSeZdEd0pGZDSF+XvqjH9o7O5Q+6PsDKWeRJ0737WGOp
	 Ttg/ePvqrLG41NHwRF4rpB+5fcAy0epeEAG3CNr60HagSt00n6030b46MxWhlE9KqWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtxP6fXD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtxP6fXD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04E51F000C1;
	Sun,  1 Nov 2026 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793556691;
	bh=Zk/xFJUvpptQoHdHEaeuVhwsJCx4lSLvvDbqB+bW+vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HtxP6fXDfmT0rvIllJX1TjxmAptTL1keHNyLrhMec4tzYta4xCLHG7DmeCk0NIBEM
	 duYQoZDCEXKk89Du3QYSNf08uDk25WuEy+vhOOLIiTIHk87Y4ZEzkVvUBWi3MlJvbF
	 i1avA+rgj0Krl7GCfOYJtue+Hrkbl327CPRmEcJ35wGae6M/H+hpvQgc3YCn19z+ly
	 CCL/+yMTtzKawo6mK6xLYfDr+IPTO2Niqeh23lTW1jEj7VgitWX13fsIMYFTUhsGBP
	 12CVBI15ZGEeuRlQiV41Svp7z0U+4ZDTdGZPZzFbx4GCi0G0YUDvFmWS7Hdg3hYIvI
	 qA6MDmn+i6nkA==
Message-ID: <79820b33-7e74-4e12-926f-1e03987d7bda@kernel.org>
Date: Sun, 1 Nov 2026 19:11:25 +0100
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
Subject: Re: [PATCH] mm/ksm: avoid anon_vma UAF during page merging
To: Zhao Gongyi <zhaogongyi@bytedance.com>, akpm@linux-foundation.org
Cc: xu.xin@linux.dev, chengming.zhou@linux.dev, aarcange@redhat.com,
 riel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Lorenzo Stoakes (Arm)" <ljs@kernel.org>
References: <20261031182256.40205-1-zhaogongyi@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261031182256.40205-1-zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 19:22, Zhao Gongyi wrote:

Hi,

thanks for the report! CCing Lorenzo.

> KASAN reports a use-after-free in page_address_in_vma() while ksmd
> merges pages. ksmd keeps a folio reference across an mmap_lock drop,
> during which mremap() can remove its last mapping and free its
> anon_vma. page_address_in_vma() then dereferences the stale pointer
> from folio->mapping.

Do you have a link to the report or the actual KASAN report?

> 
> KSM needs only a candidate address. write_protect_page() checks that
> the PTE maps the folio, and replace_page() verifies the saved PTE
> before replacing it. Compute the candidate from the folio index and
> VMA instead of dereferencing the folio-side anon_vma. Reject KSM
> folios because their page index is not meaningful.
> 
> Fixes: 21d0d443cdc1 ("rmap: resurrect page_address_in_vma anon_vma check")
> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
> ---
> Testing:
>   Unpatched mm-new: fixed-pool KSM/mremap reproduced the KASAN UAF.
>   Patched mm-new: the same workload ran for 12 minutes without KASAN,
>   BUG or WARNING; fork/COW KSM smoke passed.
> 
>  mm/ksm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index d6f736a..f8af5ee 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -1307,7 +1307,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
>  	if (WARN_ON_ONCE(folio_test_large(folio)))
>  		return err;
>  
> -	pvmw.address = page_address_in_vma(folio, folio_page(folio, 0), vma);
> +	pvmw.address = vma_anon_address(vma, folio_pgoff(folio), 1);
>  	if (pvmw.address == -EFAULT)
>  		goto out;
>  
> @@ -1408,7 +1408,7 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
>  	int err = -EFAULT;
>  	struct mmu_notifier_range range;
>  
> -	addr = page_address_in_vma(folio, page, vma);
> +	addr = vma_anon_address(vma, page_pgoff(folio, page), 1);
>  	if (addr == -EFAULT)
>  		goto out;
>  
> @@ -1515,7 +1515,7 @@ static int try_to_merge_one_page(struct vm_area_struct *vma,
>  	if (page == kpage)			/* ksm page forked */
>  		return 0;
>  
> -	if (!folio_test_anon(folio))
> +	if (!folio_test_anon(folio) || folio_test_ksm(folio))
>  		goto out;
>  
>  	/*
> base-commit: 243e8cdab64129d6207c398f8cf5fbb1962ff7e1


-- 
Cheers,

David
