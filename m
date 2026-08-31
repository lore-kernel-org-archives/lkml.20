Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0860047606F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191971; cv=none; b=KCfu2LJbZ7ZV32B1Tvm1+VyYT4HQtm08Sek56U678IWSlH3jkGoJS7P/DABUIsg4Sj/NBPJphZu2J6kgl6PtNDXb9bs/+NQykzmG3YQvW2u5eQj9hJ5eKw1HSHxxcDi2sf8j5EUVsskdT3Uj9jj9/CpVta5eisqP73yOW5oo7nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191971; c=relaxed/simple;
	bh=o1FlrGPMHZrUJtCpdYwtq2kuTdCYRTFJX7Aw6G7fg7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwYbKeu86Rptvtw78ft2EMgmPsyI30ziPdBlg3Kl3AhVMumadEbZJPNE1KbVZaJFz8w17b3VDUV4rmk1YAwcL2jYjU5QEROXr5tNujppv3Y25nluJBE8oEUhBBgL38SccrNRWovnF6iv6adqA1bAOnElEl+xVIHh6S3d85tN8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCwgrqsv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCwgrqsv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3081881a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191969; x=1788796769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S55ppFl9FgwQ4vQKooEY5Qf66QJ+aBK7c5+37bZh5e0=;
        b=dCwgrqsv33KpVnDXfUM8Wn9uuyTG5b3QW0EdUyDM9QkbEKSxR5pvrXfAq+kjRaJWGN
         rbNk5zBdBTkddqrgJB7wHEOergWzc1ngaramdv9USVNtOQ5JjuOnrlyp5DNkwECbXlbY
         5+Z3E4hNImCx39KL8hpMp6LQW+gWp/kfUbBmOONlKNWB/4V3LiZ85L+H3T/n1Lf9XaXF
         vywEhCf0hsr1q1pJHe6Ec+HAHsU1Hq6S2BgjvOw0DyN6/UOZ7vc+f8gaFaDxPlcTZGIN
         AeA5R6cn488vkaNF3zFRhZ3EGc59Jobv4Mg5c6VmkxD0Z1+vfC1yMwCY88tYVYoX3IoN
         diBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191969; x=1788796769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S55ppFl9FgwQ4vQKooEY5Qf66QJ+aBK7c5+37bZh5e0=;
        b=QDkdC3czNDUuh17CCZg9yopaIUy2CVmJSqDtYnHAIR9UNPZdspxXIxrjayhMO6XT6o
         vcNIKkI44vCr3ii2RQWN0zF3IsMAApNlAXdLTPNg1YYZpb7y2U93DEamUlycKSs9yiZI
         RpYYKmy4RY6P3QIg4bYEO9Z3z1bTlZv9H9itceHhj5oHT7Urw3Y0HspQtEr4hfM5YRWB
         VhfqlNej1o97xCZMyuyy1BumgiwZAYiCoNzKNxMM6NNkM7RwDRh83JlScTyYfwzx0BdD
         K7S+gP2Dc+GwCa6vmRn7haB9ifUck2y+xDSH6EpX0NpsmFgxAW0zaBLHC3Bemr3pKlD2
         GZig==
X-Forwarded-Encrypted: i=1; AKwUvBzHUjMehVdmcV7zHM4Y7YMcc6Veo06Mr6plLZ+YPshSV7dZG+poUFVrE7VNqRVPp1t9dkCh2kE9bAiurGM=@vger.kernel.org
X-Gm-Message-State: AFuF++nQojvyDBd/0ZyVviJRtBe+On8nKpRKd2RJ1RpCR4VK1fGIpwzM
	iObMu90OOxzGfmfsz+7m24EYx1VjpRY1pt0sB+pZNcjJcLg6nW7FNUh+
X-Gm-Gg: AYBFou2npdnAGNK1jOE758YnvuFB00ZJZZywSPuEi08heDW499NqwMQT89blOq3GKML
	hEloSPWtNzu/27jw6Sj9SzIKvMr/V/sKn4GQVLqcCci5gmDy+wXgTjswVagE+kWlbxGZZz7pIiX
	XbL6aB9n2tuEY//DCVqr1s8hsM7eiwkKsP6CB2ttCdBqz3E2gXsbZGRMwW1dHhDpo1cDQolXuUH
	DygDFv8GF6h7TtizhUqZ39DRkRt23QLp/kurNVGQTvZ2EUGyGXhqXc+5RFJInCNIyLJW2y3vVbd
	8wmF6BkYx3EhwRtoNBE1fmCExxQ27h14Pd0fdvMIrxf16/rM62h3L6m8rLPvA0tb9OTfbhJ6NLz
	zWelpGC3XuFVSisZ2gtvbEUyeLjE3Lbu0P6j/aQmzpPFZCo+6rNZmagX5ZVweJclUYuvnsyLAcL
	uhsvM0FCavf+bqj8NuIX6sBr3NEOOLEB13RDobc+kiDTVUJQcxVjT+N9uj9Bg=
X-Received: by 2002:a17:90b:3c45:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-398c292b6b2mr20410535a91.10.1788191968691;
        Mon, 31 Aug 2026 08:59:28 -0700 (PDT)
Received: from gmail.com ([185.220.238.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d630371sm115535a91.17.2026.08.31.08.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:59:28 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: Dev Jain <dev.jain@arm.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	riel@surriel.com,
	liam@infradead.org,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: Re: [PATCH] mm/rmap: remove stale hugetlb check in try_to_unmap_one
Date: Mon, 31 Aug 2026 23:59:12 +0800
Message-ID: <20260831155913.2497152-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831082849.3573957-1-dev.jain@arm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 08:28:47 +0000 Dev Jain <dev.jain@arm.com> wrote:

> Post commit d4ec5572825a ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")
> try_to_unmap_one() cannot be called with a hugetlb folio. Therefore remove
> the folio_test_hugetlb() check.

Yes, the d4ec5572825 change shows that try_to_unmap() dispatches 
hugetlb folios to try_to_unmap_poisoned_hugetlb_one(), 
so try_to_unmap_one() cannot be called with a hugetlb folio.


It would be better to add:
Fixes: d4ec5572825 ("mm/rmap: add try_to_unmap_poisoned_hugetlb_one")

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
KunWu

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
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
> 

