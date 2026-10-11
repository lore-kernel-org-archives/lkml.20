Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398E62809
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725835; cv=none; b=COglGx5MW/QJdzgx3f9bYAesefnC4ARe2wLkiU/Daw5D9zA0icLH+hPFT9VH73tSHwdGRYmpvL6pkTQ+b2WLLNxfQNITNZJTxBSCxBe+Gboy2/bKhBMZahU/tmudLYWbgDlMTjOLZ3B7FS83NwF65GjOdm+UMgX+ISoWkCv3xaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725835; c=relaxed/simple;
	bh=ReOWJePWTB6oSxmPOJ98tJSy+llvV3ay0akloovQg7s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3djXexx9QBN86P2cK5/+Rcu4tMcmdjtGvaarTAuQd98ibQpp2969aUihGQLy57d0q7tzjyWqHKymjwincs4DF/1GwwGpit4yA+1uNdFIF2HLikcVpTebwJd8eW8t1TFeIVznoOaPA4BhajYXNgTCB4wi3H30Yd91vv2U7j20bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mns9V+EO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mns9V+EO"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso124391166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725832; x=1792330632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X8y55PrXkGOudIsFCasLzIDfqrrSmuwJHtcshJbz80=;
        b=mns9V+EOhzbAm8IgYoMAosnjKBV0uZYJ0rRktYWIyNFzFnj47i9YPDbvf+oR6iM8p3
         nyHGOwlHtVz59+oxZlJ9zgZSM9JesmHcV+ficSxiU6paEdJElSpQjR01SnpuyZH0xmNR
         xsJ2Tfj99ZNNRyx28WKAl1VolhivWhbaVxQMEL0NHO4et5wSWEIQ3aff49kIV3fyCr8B
         n7Jg5vLDYzSMWHMe4uhaWjHPjREjRhWICTxSP7WP1ROGH0G3bU6LTz1lIgJUr3vn969B
         7HK3pF7v4QCI9MM1gmGzF+E9bLnyMJxLKYlRiI+DL12KzskPwB34X70IP0DusucqjDEv
         9jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725832; x=1792330632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X8y55PrXkGOudIsFCasLzIDfqrrSmuwJHtcshJbz80=;
        b=pg0GMpWnBg/uJps27DGRpu8tDmlj5LnjmgQGdjmzPYn8Ion2Kx5xdLw0bbdBsmovKT
         phNPceSBjpbgnzD+hLzWH6mym0iPaNMWep4lqI6gRW0v96LdFqW9D4GY9NrZSTMFTAzl
         tOdsaa+2gCZDxDdE3aJwFKnTWQNZc27I1qdLZVBQI0IxMN5b8CtTTA5rvsoyL3lV9P/l
         eLF+MvwJAFObQhaAVHCBWANFwG/AVXCVwm76kvhibgrKCgmSGgAbjGS4+wXwLmnETjw+
         4OkC4ZUHOEm81K7lrrU9z5ON6jprXlKX94x2ZQ/XWrit8YJGeGMTqihylSnOPvLBZCoa
         oxOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIzOM+GWQYPFDz7QlQ0i32bMD/RIPwUiCuUYymRDJADvgQOsYGstv+T/05urHOGKSODC0PP5p28njKPYM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsswsATuD55/Hlp6T7lkQJ26IbxHNxTkjtFMPvEmCg2THTnVeX
	exvNTwSvhavwlOhMvAYTEQXr+6kbj4IcGtGyrqpiErgQqF6Akx75WKc7
X-Gm-Gg: AYBFou29dezOUUYY5B0R51uS8lBaKJ8Ov90hKXRdu4Kgx1EkE1V/cZdPOZDzKJqVc0B
	eaZ1tIxEUKm+oztylwnARUcS5nUcSEjbRoNUAJcqLEZZa87wxZkeB3gbaU/ABWZZOrDxqzHZdqn
	Oz5aZm2OYWFmkZCPvi/McglKezs2Yps+mb9YMC/hPkz+U+8rrOt7xDDCmjJ+eIpFaOJZb/FHwL3
	bKnOHpIj79k1XSn6gkcBD0AKGpVZnVFRRm4E8Zj7wZP0q2MJ26c9zP7nhuEwWl5iWduz2SYbeEG
	E4hq5SChqAamaSQFWJL1aX/ehPuf4c+bk/R7b6338sUz/t3luj4/gctfU5wj+Vn6fKBzf+FV2ei
	xMmVpC3hC0ioDAhSsu8RKB6daNHbEoQp4ZR6bCqTV9NXhMxTENq3kfpwx5RpT2Nam/ZE930cJ4N
	TOSPMzVEhphoMHokk3Ju+gpkyLRJeNFCx1d1Y=
X-Received: by 2002:a17:907:3f8d:b0:c2c:d06f:cf87 with SMTP id a640c23a62f3a-c31aa0d3106mr668410766b.46.1791725832001;
        Sun, 11 Oct 2026 06:37:12 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a7b976sm361047966b.36.2026.10.11.06.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:37:11 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 11 Oct 2026 15:37:09 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v10 04/10] arm64/hugetlb: drop the init_mm special case
 in clear_flush()
Message-ID: <asuRBRZS9KzC7Y8q@milan>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-5-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002090947.869220-5-jiangwen6@xiaomi.com>

On Fri, Oct 02, 2026 at 05:09:41PM +0800, Wen Jiang wrote:
> clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
> was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
> pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).
> 
> Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
> longer a caller of set_huge_pte_at() on arm64. The only remaining
> callers passing &init_mm are in arch/powerpc, which uses its own
> implementation. Remove the dead branch.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/mm/hugetlbpage.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa6..ce247b06fe03d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
>  
> -	if (mm == &init_mm)
> -		flush_tlb_kernel_range(saddr, addr);
> -	else
> -		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
> +	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -- 
> 2.34.1
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
