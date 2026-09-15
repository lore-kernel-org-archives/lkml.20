Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF13CB2E0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441587; cv=none; b=MJC/Ud668pfsMQUliurCdNyI2QJ5J8ycAPL1c225EyE1poEkXpgmrhq4ujEHpoe+6J9boGGMw4lpRaWtjDvQ1lLWSvc/iCwzoJ7faggPAxFUKU1Skf9wtIsk6qCGNvEKW+pl6Qao+2SaEd8L7vmbpqLLF8urDQNvTtELeR0rNIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441587; c=relaxed/simple;
	bh=uXNMDvyO4kl4ltOhJ8oInY+Sy61HJ839sxYVp5QCT/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNq1eqg3hDVBWDupp7VFQVWVf2OqOiuZP2dIapT2PyhnHPw7KYtUhcUImHzx/w9FYxZ1+UXiugwxEGEuHhiHwOlZN/fD46bCKzeGClrgBuuBRd71q6XUF7gCg9ANRPiQlB5nwnJz/I46rWdQO2/aNSSDiW/vSHBoCLavrtrOdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CRCsoEYU; arc=none smtp.client-ip=91.218.175.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CRCsoEYU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uXNMDvyO4kl4ltOhJ8oInY+Sy61HJ839sxYVp5QCT/o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789441583; v=1; x=1790046383;
 b=CRCsoEYUECttlVZWyUKGf7DOwzORbBibH9Lqi/vOuv/QypPfxEN9xpSx1KflR56gHBNJNzUB
 cdjXJAJ2WJyxYZtkU5LJ6rRMWdaZfm6gB+jtehF3urMbvOb8oUguQy8ltEF8pBOU/N/6g1t0a07
 637icX+Khjd27+J4CKPFkM74=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5e95220afe937ecf;
	Tue, 15 Sep 2026 03:06:23 +0000
X-Mizu-Trace-ID: 5e95220afe937ecf
X-Migadu-Flow: FLOW_OUT
Date: Tue, 15 Sep 2026 11:06:20 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
	chrisl@kernel.org, kasong@tencent.com, ljs@kernel.org,
	ziy@nvidia.com, linux-mm@kvack.org, ying.huang@linux.alibaba.com,
	willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
	riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr,
	kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev,
	linux-kernel@vger.kernel.org, nphamcs@gmail.com,
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
	luizcap@redhat.com, kernel-team@meta.com
Subject: Re: [RESEND v7 01/29] mm: rename pmd_to_softleaf_folio() to
 pmd_softleaf_to_folio()
Message-ID: <aqi2LBchW2ehBhCA@fedora>
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-2-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914122950.3283997-2-usama.arif@linux.dev>

On 09/14/26 at 05:27am, Usama Arif wrote:
> pmd_to_softleaf_folio() reads as if it converted a PMD into a folio. What
> it does is decode the softleaf entry stored in the PMD and return the
> folio that entry references - the direction softleaf_to_folio() already
> spells out.
> 
> No functional change intended.
> 
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  include/linux/leafops.h | 4 ++--
>  mm/huge_memory.c        | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Nice cleanup.

Reviewed-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> index 4c1476ae32343..7c13c58a5e218 100644
> --- a/include/linux/leafops.h
> +++ b/include/linux/leafops.h
> @@ -657,7 +657,7 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
>  }
>  
>  /**
> - * pmd_to_softleaf_folio() - Convert the PMD entry to a folio.
> + * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
>   * @pmd: PMD entry.
>   *
>   * The PMD entry is expected to be a valid PMD softleaf entry.
> @@ -665,7 +665,7 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
>   * Returns: the folio the softleaf entry references if this is a valid softleaf
>   * entry, otherwise NULL.
>   */
> -static inline struct folio *pmd_to_softleaf_folio(pmd_t pmd)
> +static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
>  {
>  	const softleaf_t entry = softleaf_from_pmd(pmd);
>  
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 7140a1031fb2e..ee8d46827ffdc 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2518,7 +2518,7 @@ static struct folio *normal_or_softleaf_folio_pmd(struct vm_area_struct *vma,
>  
>  	if (!thp_migration_supported())
>  		WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> -	return pmd_to_softleaf_folio(pmdval);
> +	return pmd_softleaf_to_folio(pmdval);
>  }
>  
>  static bool has_deposited_pgtable(struct vm_area_struct *vma, pmd_t pmdval,
> -- 
> 2.53.0-Meta
> 
