Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8031D26FD97
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598470; cv=none; b=QeZ1gB+AxxNRHFGUJEKFFyzx7j8pcEtrt8SxVfIRU8AmPpAHkReygODUVimUwpGhzIyEN1mdmyMYTIClgnK2oP9hE3dpCYP3WtvAl2Yh5f15saEOSKN7FVqPILcFFoFfg5t4iEFfLZXT49mApHgE/2oYiqSrNuyb4+ZL3FmQUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598470; c=relaxed/simple;
	bh=8M5YOEIrXDD6XLd1ZsIBaFlISHd8WA2lKAFGHUrHgzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0lSoI5NE0umidABBs6tfZXlj3NIRg6qtBj2OLXJ1Hrsap80Cl2tzZeKn9a/pXx+LwYTFjBWc1ovKp9VH4m0+kMPDbCEpW7xjUmtu8BdRsjybDiuzfvhUoRjMyE1xGoeDN1RHpNFB3DmY57JAj/EzF9+UI9hkur5Kz1of2Z07hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=a5PRAD4X; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="a5PRAD4X"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f699fe49b3so309993b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791598468; x=1792203268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewsgbjqBMzM/54gVEY1eYtAsThNx/wBnYzgn18kV244=;
        b=a5PRAD4X3iPG5iL2hThLNfvRl79MBO4SY0SxpYHKQcWc4AZHIJaK62S4tnsh+aLMZb
         QrtBO4d5L1j5kCEfvIF0Odn11YXgiRL8wk2nSisTQ6uI8U5+eF3yCyGFIjUS0TKg0OIc
         Txoj+pMkv1pHY4Kmw4pwAqstaz0bq7P+0s1kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598468; x=1792203268;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewsgbjqBMzM/54gVEY1eYtAsThNx/wBnYzgn18kV244=;
        b=zP4PCwOtX2FTF0dtP6Pw3o8v1ZV37QDx8hBmcWE0BDfo1uo4clUrvdxyV++PvLGoKU
         ozm0Zp9VrZ2rYTPfGhoI41KgGjRnUK1KKLqJacexribkM+iwdVQME5ZVUH9Pmlr/mdIW
         4ACZH47bjKMCgsOO9EYXgfAvvgJ/oZm9FHp7wA0qiVV6vuEJW2Cyn606gCFT4PF5Qqjj
         +QWADwSFxwA1N+hbt0uGAd8uuiIB6CaVID3Dh2L+jU4A5/9ar+etTgJ0IqKczulIp5O3
         50ajKZ2OFvyG9c3JtIvqFQVi6I322zRUmEyK/mwAYnmPq4hufnH3y5XyKL8ekG2IwplH
         Kusw==
X-Forwarded-Encrypted: i=1; AKwUvByH4LXGHzvqwyl6sLpQOxphMfObw15CDVa34Lc9aLmVnTFHWK8J2WBLwRd2Kcqzi7YBTvcgqHp/ddcS+Zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhMIAhmpJGAedhmKLitFn32u7vVTwBOcnZ+ZQ5/RI4GGpg3p0f
	bqZoNREWvIrFY+HKQyV++ZiPn9a29jd1Sl2n857fQFYR+lxcQTh0hLyYZajKS0O2DgM=
X-Gm-Gg: AYBFou3MAiZBr4kAkcpX+0/QjWFakgq1b0tYJuEb+X6LMuDhENxP7IOO0Mt6kc+r5ik
	qLr74m2nZqYWXiAnNqbwq5fyrzM/niwXW44UdalSnz0HcggSFdPwH/YCvk3zN6mpo2yV2VOZ366
	ujX9KgCDXIt7uwP9gFDezjT1KltjgkoBQI8P5Bxp3uVrjq/275Q8gK4LxTaRIRYDbolU8+F6csi
	PYvvG/0cjH7NBLo5SwauzJ2q/HkoZaNhgKDVDztrk2fVrLpBjtwutPOU3vQLUZn2u04AiCKKPrr
	gArJimIiQfgjJnLr9paAs/xNSW5FdfXaSzpSZ8l0hV0bkhvSKK27X/Asw7bpuzEZMwHgKyA0U1o
	PsE6DjiOHDoG8dWcr6/uSyPeM8TFsQVrSsQ1PgUArNwhsGyoyQGMPC4cNgU9Rn7I4LS6w8a5QWI
	sDcVtJDirgg931zaN8s1+D6uenBwLZ3XT10bszWBNZTAAX8MmT/p5uj8aQLn9Zv70npssgXl/qH
	qSK/sa5a2rNmLUe6hgxv8ymT1s3MSU1uCPzTLcrv4BT+gK5ld6NVg==
X-Received: by 2002:a05:6808:3384:b0:4b9:a8ac:489 with SMTP id 5614622812f47-50c52a4eb8cmr3292704b6e.39.1791598467997;
        Fri, 09 Oct 2026 19:14:27 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe916sm4211994b6e.1.2026.10.09.19.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:14:27 -0700 (PDT)
Date: Fri, 9 Oct 2026 19:14:22 -0700
From: Kyle Zeng <kylebot@openai.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>,
	stable@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: don't discard lazyfree THPs at PMD level
Message-ID: <asmffmSz9MSjxD04@com-75606>
References: <20261009-lazyfree-stable-fix-v1-1-70997958ef8d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-lazyfree-stable-fix-v1-1-70997958ef8d@nvidia.com>

On Fri, Oct 09, 2026 at 10:08:18PM -0400, Zi Yan wrote:
> __discard_anon_folio_pmd_locked() clears a lazyfree THP PMD before it knows
> whether the folio can be discarded, and restores it if the folio was
> redirtied or has extra references. A concurrent munmap() or
> MREMAP_DONTUNMAP skips the temporary none PMD and unlinks the VMA from its
> anon_vma, so the folio stays mapped after the anon_vma is freed and a later
> rmap walk uses the freed anon_vma.
> 
> Using an invalidated PMD instead of a cleared one requires additional arch
> code fixes. Instead, disable the PMD level discard of lazyfree THPs, as
> before commit 735ecdfaf4e8 ("mm/vmscan: avoid split lazyfree THP during
> shrink_folio_list()").
> 
> Fixes: 735ecdfaf4e8 ("mm/vmscan: avoid split lazyfree THP during shrink_folio_list()")
> Reported-by: Kyle Zeng <kylebot@openai.com>
> Closes: https://lore.kernel.org/r/20261009165214.40212-2-kylebot@openai.com
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
> The proposed fix[1] requires additional arch code fixes[2]. Disable it
> first for stable fix. The function will be re-enabled along with arch code
> fixes.
> 
> Link: https://lore.kernel.org/all/20261009165214.40212-2-kylebot@openai.com/ [1]
> Link: https://lore.kernel.org/all/DM0II2QHWWS1.2RXEJXC8S0101@nvidia.com/ [2]
> ---
>  mm/rmap.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 805db93fe0428..1131b76bbbc28 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2275,17 +2275,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  		}
>  
>  		if (!pvmw.pte) {
> -			if (folio_test_lazyfree(folio)) {
> -				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
> -					goto walk_done;
> -				/*
> -				 * unmap_huge_pmd_locked has either already marked
> -				 * the folio as swap-backed or decided to retain it
> -				 * due to GUP or speculative references.
> -				 */
> -				goto walk_abort;
> -			}
> -
>  			if (flags & TTU_SPLIT_HUGE_PMD) {
>  				/*
>  				 * We temporarily have to drop the PTL and
> 
> ---
> base-commit: 8b38ed9ab5b09c8ba168cbcc49524e9b380ee5c4
> change-id: 20261009-lazyfree-stable-fix-67712b2049dd
> 
> Best regards,
> --  
> Yan, Zi
> 

Reviewed-by: Kyle Zeng <kylebot@openai.com>
