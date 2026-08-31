Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884173CF69F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166037; cv=none; b=A+7AlO7Ozwp5VvMBvdwfZIlMBdlENqL5Uhmh7fjOPVnvv7gE0Iy5In68L+wvlfe/GfMeGjw920qBADHXncG2Y7I82PNXVsVH2OSSTvllK60BHdh4C7UZWCqy91EIhIQ/1/ipd5iC5jIQoWAP1kLyhHZqy1oPYDWVYazz2do8r7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166037; c=relaxed/simple;
	bh=6Y8mIgLOX9gNfB/CKfrbSpXaCIhqsITj6hzmi53La3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwcVK9WfSAQudPsrf8Da+u0QMk2Npqqdi0ECWi8HovFSVRCuZ9N7lRdOKpONxHrl5mb3o17/mouUolAD0lJRTMTRC3fFzFTo7KMJWdnb46dJcma8oanOURC38kfBPJN+bmgSJZYdNjtUj95adynoiVTTkPjENH4we9Qm93hWVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6rModvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6rModvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C131F000E9;
	Mon, 31 Aug 2026 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166036;
	bh=j2Mk0tZDWX6Jqg1UsT9JhoDtteuQwP3WlAW2gIqLEl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n6rModvzfMT8KL/sLyWh+3dibwD5hGqkyYm6uTnSlTJAl7ndHpZ5iFN/cT4UNk6sG
	 wdtyKWTMPdEjCD0GfAoq5YujtJnGBP1I10ojPNRxeYtUDr+rUSs2C0l/MDzt3Nrjek
	 xfDU+XZtyi7ldcCgIlvxvCmE6JCAwO4j7mU7zcRXCNGcXZ3NrPqTtQNVWgfbzrLy+g
	 BB9rHt1Tjv/ALrCnQQrr71byw/6m2pvjxj5GGzx9lp6p39NpHWglexa1Tc1j0UxjSr
	 RS+paGmo4R9TKKVOLsktBEOnphBuqcgwibnoZgH7W/Yxlm7kffQdVEFYshQDwcjkSs
	 DxQ1DI51igRnQ==
Date: Mon, 31 Aug 2026 09:47:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: remove stale hugetlb check in try_to_unmap_one
Message-ID: <apU_g-m8-IBY9iTm@gremlin>
References: <20260831082849.3573957-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831082849.3573957-1-dev.jain@arm.com>

On Mon, Aug 31, 2026 at 08:28:47AM +0000, Dev Jain wrote:
> Post commit d4ec5572825a ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
> try_to_unmap_one() cannot be called with a hugetlb folio. Therefore remove
> the folio_test_hugetlb() check.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> Rebase soup - my huge_ptep_get() fixes landed after the refactoring.
>
> This patch applies on Linux 7.3-rc1.
>
>  mm/rmap.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index d1819fd699380..606c8ecf31302 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2299,11 +2299,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>
>  		address = pvmw.address;
> -		if (folio_test_hugetlb(folio)) {
> -			pteval = huge_ptep_get(mm, address, pvmw.pte);
> -		} else {
> -			pteval = ptep_get(pvmw.pte);
> -		}
> +		pteval = ptep_get(pvmw.pte);
> +
>  		if (likely(pte_present(pteval))) {
>  			pfn = pte_pfn(pteval);
>  		} else {
> --
> 2.43.0
>

--
Cheers, Lorenzo
