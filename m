Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D25356778
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711923; cv=none; b=imzV7CquJM1EfAnIDjGglGPEswTHr8LOSEx2riU/PCK9Wqedkzf+11deD22hx1mUZead9Gwyq6j6r8v4UyxirtuHYushroO56F3mh5HMuR4QKtx0dcQI4H+IT2zm3HSTpF+ZK2iCAQ/2UJr7TgV1jVH9vBVOWOkKO8L1coAFwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711923; c=relaxed/simple;
	bh=UsNPXOQ+/mjEx3zNqHEGVZbTxAiganeip35rDBwddlo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s91zUJH8lt56Yy5TOXxx5xrt3imSZwt52xt1h2DbmnBbvL8swIjsw8Ll7WHcq+dxKN2ZkQZGICODW+GuJaRJiGMpnrNavIrclREWrZUFcurFUgRx+7sjsqnDdi72p2uztepipx/Z3F7nx8WaLshHovaEGBtnUooi0QAH7kDTfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGJ+mBqd; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGJ+mBqd"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso141903766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711920; x=1792316720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMWKtk6aRSbfvQLUR3KyOPOC0cuhIr7sFz+mSYCpkyE=;
        b=aGJ+mBqdDG7hmU/ZR2PoumLsJKPY9Hwi+cF/MKBwsG5DeJUdmeFlcVyU/FbFtpE67O
         u0popeXOVftOXnVhPzpmPvvvPfc7V9VQlZEoGcbDujChJAeJLQW4Yd/SYh4uOMtCxz1g
         N7L/SD5JjdUiGIlE+NXRNZSKZSOTIcpIuIKvmSORj122JtW24ybIk7Y+aZGSrWzUUHMw
         GsPjCroymGXHfwHRI5y5apLyDgFeBsNJiA7Ahi1g8PTXWBzA3wBaj8eQ8EHKNMFfs/XL
         xm9n2MdCyvTRgO21LtyiWon81R4/5+Vzf3j7GPg4Os45i5k5ueaq/f5fQr1yJ/zbWx5N
         RiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711920; x=1792316720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMWKtk6aRSbfvQLUR3KyOPOC0cuhIr7sFz+mSYCpkyE=;
        b=L572o97BZBhkxo2D8N45J09ii/G5E6sJfBFIPKEAE4FnFnmzUn8js8Tcr15WL6Yg9d
         Fl7ccjY/K9/1JTtNunm6u/zSSelFlDt6FB5a3LyIPUpL1yuVOe8i4s7T3YH6qPwGlC3g
         4+Pu/q0d4M0ZypezdHnMLUwWFjtEQj+mdms5P1xpWlte2BM5UbICvjDEF4eYr/UWGqI8
         3tI/dtPF9Jeh9kRj2puc7EYkiKZZ2yMXksCgfVyFtEu7ELURQ4dnt6OheOAMH5Aqp9E/
         sfVfr80avd7aEMaejLxpnQJvEMrSIURgma4LquT0HRlGBfHtAEkKyoRdo8TwcO2axmat
         gRtQ==
X-Forwarded-Encrypted: i=1; AKwUvByarFHiWZHpzQI8KvTvYRROFw0vVrKNkkSMRkUppV7OgALcNUGUihY34UcDhjcfmTU2K0G8JIiBX7k+H7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVAuroePoBtLQbt0C5GYiGG4VFAVDDbD3njOjiPZRpE6y4AEnZ
	AvfV+w/2Oy6MrqmtDRTuWSnfxippykrtzyb692ZUPJM5qpnILr4USxI4
X-Gm-Gg: AYBFou25rbvL4boatbTCRU/lmHfRzyv/KiJRk7Ysa8bLVZ/LafkFsaKwSe69iQoFkoW
	TYHKtt/DcN+UuWSE5Lu434cnFmNfD46oym9aRz6M0C0km/rUgufbtgJ2akC6Qml98OKPWR+KehX
	miOxHK9CdAgme/h6r+6yYUuOAkHhQYLZG7j75RwpfD1RYdcFPSapJePS7X7YKAHYgMpl8yv57kV
	jCgAqW7U8aqS1slcwVw1feeTFU2Uoh1a7ietUQz85g71jJMPbhNuTxVp4Qf0KsYkp8cIuWIDydw
	L+rZ/HdzJy2xqfZAaSalg3D4X1uRpiDk4XtAbkaWjjBMTu0Gj9PTTMXqKp+Xwgh3kJhK4hTXYKx
	IvKpiTolog04iPnf6t6f5Tqct6U2g829sINpOkt+BLVIIa2IRMoLrZDjbOVNfNQiQqunI0Tuk8P
	TUXm0ftlNQR95otz7ls+EA9NYWZCzn06ZWCWfUGdl9tMS1RA==
X-Received: by 2002:a17:907:8687:b0:c16:4e5:944a with SMTP id a640c23a62f3a-c31aa02a1ebmr650442866b.21.1791711919938;
        Sun, 11 Oct 2026 02:45:19 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ad0ad1sm347200666b.77.2026.10.11.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:45:19 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 11 Oct 2026 11:45:16 +0200
To: ryan.roberts@arm.com, dev.jain@arm.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v10 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Message-ID: <astarANeoldvqBxc@milan>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-6-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002090947.869220-6-jiangwen6@xiaomi.com>

On Fri, Oct 02, 2026 at 05:09:42PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.
> 
> Previously the function returned a single CONT_PTE_SIZE for an aligned
> range, so the caller mapped one CONT_PTE block per iteration. Now, for a
> CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
> that fits within both the remaining range and the caller's max_page_shift,
> so a single pte_set_huge() call installs several CONT_PTE blocks at once.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..c29704a19e276 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
> -	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
> -	 * aligned in both virtual and physical space, then we can pte-map the
> -	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
> +	 * virtual and physical space, return the largest CONT_PTE-aligned size
> +	 * that fits, for more efficient use of the TLB.
>  	 */
>  	if (max_page_shift < CONT_PTE_SHIFT)
>  		return PAGE_SIZE;
> @@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
>  
> -	return CONT_PTE_SIZE;
> +	size = min(end - addr, 1UL << max_page_shift);
> +	size = round_down(size, CONT_PTE_SIZE);
> +	return size;
>  }
>  
>  #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
> -- 
> 2.34.1
> 
This is arch/arm64 code. Can you, Jain or Ryan from ARM folk review this change?

Thank you!

--
Uladzislau Rezki
