Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614731;
	b=iWiyAkYKVrPL1CbrSFMjSgE/zk6+WbwuG6HJrV2FDKrORCkqMoM56OfQzoABn58foWw2
	 49R+qTUAM3/L2Vh3jUP5INj4g4XoOe5KN6iL/I1aCWVbKmlE4k21H6oyES33fzhETPImz
	 3+6BQD+WptGsG5h6cwMJqEFq9GX/Fnc7LvsCctCgBGoYKBFelQXqXUfvi8quXRfV/jWYC
	 dMgQ1I1qi7EFEp33uSTU1WYlimVbM1DmQU2D6k0ux0DGS0hDN5nN9ccIQJYYnEd1QGkzx
	 HgIOrRxgJpnfvEQCOiqXUDeMB+Dq1nYbXM6wKhmFxk77PCeKUA3cXNuQ67CBHxQ3ulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614731;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MOA0zqYyWmFskN0gCu/F5291zfD/d1SuvL7/LJWrUO0=;
	b=mfvNdcXlByXDCMu2bYEyzB20VXXWIscZ36hyKG+wUWhOJUPv9jC9v3juPHGL7+3KEJUv
	 Gr7xugr+hJXdGBNkGFNw3R7KlJa++twJRcnw6CnlEUGxE9pS/E2HWoMb0dahw5zo7db63
	 /4o19vMf3ECLo9jeiUD13MroW0Id1nb499OVWH5bQ0jWb7bQYsg71BjnPykPtNcb0tD3i
	 H09qcqmYIioYqZPRSKDL4hDd2TeFGKHvjVP5kEGNre04aMn64Qq7Q7VbF21AkCgVAMuMp
	 +BVGNDsxbQcdRHq/kcLNlPsEKh4Zz+tvVTlugw6xORoTnDNg1f3dfshcwNnSLuhMRKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DB60A2607
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83DB60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y06hHy2Q0v2jtRGnaYJJ08RCM/zmMrDx1xjhyL2iHp8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793614727; v=1; x=1794219527;
 b=PzoTH4Ky9b06Fib+kcsq2A55/2t437A0fMPhVCak5dkGwxcAcG0fSkRO4JmXzXuTbt7bJSdx
 +134soB/l0xdw1oVwvK14oOHjCpR5sTN3tGkfTi4GDZu4YP5r0E1kiLYEu3YKQNo/m+CMMDnokr
 LMjUXxhTO52g+pzz49Gr2TLs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id bfe08981aebe711e;
	Mon, 02 Nov 2026 10:18:47 +0000
X-Mizu-Trace-ID: bfe08981aebe711e
X-Migadu-Flow: FLOW_OUT
From: xu.xin@linux.dev
To: zhaogongyi@bytedance.com
Cc: aarcange@redhat.com,
	akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	riel@redhat.com,
	xu.xin@linux.dev
Subject: Re: [PATCH] mm/ksm: avoid anon_vma UAF during page merging
Date: Mon,  2 Nov 2026 18:18:31 +0800
Message-Id: <20261102101831.218090-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261031182256.40205-1-zhaogongyi@bytedance.com>
References: <20261031182256.40205-1-zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> KASAN reports a use-after-free in page_address_in_vma() while ksmd
> merges pages. ksmd keeps a folio reference across an mmap_lock drop,
> during which mremap() can remove its last mapping and free its
> anon_vma. page_address_in_vma() then dereferences the stale pointer
> from folio->mapping.
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

Thanks for the report.

I’d like to ask whether this issue is easy to reproduce on 6.18 since
I suspect the accuracy of the “fixes” tag in the commit description.

Besides, adding an extra folio_test_ksm() check is unneeded, see reasons below. 

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

The check folio_test_ksm(folio)) in try_to_merge_one_page is unnecessary, because before
try_to_merge_one_page() is called, cmp_and_merge_page() invokes folio_stable_node(), which already checks
whether this is a KSM page. Only KSM fork pages are allowed to pass through; even if they do pass, they
will ultimately be intercepted by the if (page == kpage) check in try_to_merge_one_page.



