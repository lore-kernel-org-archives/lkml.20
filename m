Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3224F5DF0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737727; cv=none; b=jYCA6gpAOdFniU36bXkm0k+OEAwvWqSudCDhumSTbnzl5aOHRT9/XXHSqcfRpFNP5kJx50paMEAKKDuiUC5Ip3HekBYLxfEqAJm0YxdS/KKLphvdM4CIoY4tW/PFz+XV/C332rfI25X1Nm8xnjLiDWMx9qRI/7MGdjci5YgzygY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737727; c=relaxed/simple;
	bh=c2uAbp6cDyt7XZIt8IFdFpXqokCdCrRh4t91+4CD4zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO02tX4eiPBDldE8/bkVRQt4B4Tn0r1dGi6KSIHiaS6B9m7T0MB0lxV/qnLhFjxf4rE1w27sD0AvTmr037qybMKycaR8jGR4LFNHG2XnQtpG8m9hCqujRoQsXypRjjk8MZuUCCPLz7dme3zznDZs3iv9JFVYHyFdYb9NLLMaUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUjS4QLU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUjS4QLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489711F000FF;
	Fri, 18 Sep 2026 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737725;
	bh=JXII+Q4kZ59ziwT+f57cW04XNzn9YSEFXSVEdQXYv8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aUjS4QLU04DUHHmNztLdm95g6DWY7n8ihJMtYkMjWMJ/ZRGha9aL3TXwk2bTkp1wM
	 zRr5g/TzqAPfdwIYoJdjC3oCCIvW3L1yV8K3Oa929JgHjUtjMsPVoOt8MR03KDQ3fU
	 mRuhOi1x2NVG0KbnYm11d96z1qPr2j9mo25lKdf7coIXO1V1EBhVlgbwEyl2bu/ePG
	 LpUq6pyVlF+LGbWu+XFNzCtMvQapYhlJrNA0WMlBmUKKRymo+bWMMVn2WPEAwIpSIF
	 OyNdZBs+USGUULCcAyQbb+8My0kPtU//nwYIDQCAcMKH5SCBQS1jVYlfjkZVziVik+
	 hHuZJJ6gvdhNw==
Date: Fri, 18 Sep 2026 14:22:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Constify arguments in default pxdp_get()
Message-ID: <aq067wpXbhL1bRqK@gremlin>
References: <20260918064928.793742-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918064928.793742-1-anshuman.khandual@arm.com>

On Fri, Sep 18, 2026 at 12:19:28PM +0530, Anshuman Khandual wrote:
> Generic MM default pxdp_get() helpers fetch the values contained in pgtable
> entries via READ_ONCE() without modifying them. Just make their arguments
> explicitly 'const' for some additional protection.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> This patch applies on v7.2-rc3 and builds on many platforms. Some earlier
> discussion could be found here. Platorm implementations for these helpers
> could convert into these "const" format later if required.
>
> https://lore.kernel.org/all/yjqldpl7il6uqfoqrszaopchqthhlffssprmlqjkljvpkbpwkt@zetb5hyvllsl/
>
>  include/linux/pgtable.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 2981e386da7b3..f09a91ff5833b 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -490,35 +490,35 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
>  #endif
>
>  #ifndef ptep_get
> -static inline pte_t ptep_get(pte_t *ptep)
> +static inline pte_t ptep_get(const pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
>  }
>  #endif
>
>  #ifndef pmdp_get
> -static inline pmd_t pmdp_get(pmd_t *pmdp)
> +static inline pmd_t pmdp_get(const pmd_t *pmdp)
>  {
>  	return READ_ONCE(*pmdp);
>  }
>  #endif
>
>  #ifndef pudp_get
> -static inline pud_t pudp_get(pud_t *pudp)
> +static inline pud_t pudp_get(const pud_t *pudp)
>  {
>  	return READ_ONCE(*pudp);
>  }
>  #endif
>
>  #ifndef p4dp_get
> -static inline p4d_t p4dp_get(p4d_t *p4dp)
> +static inline p4d_t p4dp_get(const p4d_t *p4dp)
>  {
>  	return READ_ONCE(*p4dp);
>  }
>  #endif
>
>  #ifndef pgdp_get
> -static inline pgd_t pgdp_get(pgd_t *pgdp)
> +static inline pgd_t pgdp_get(const pgd_t *pgdp)
>  {
>  	return READ_ONCE(*pgdp);
>  }
> --
> 2.43.0
>

--
Cheers, Lorenzo
