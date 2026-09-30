Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425750B419
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782695; cv=none; b=R65gDcjsLsXoV+tct2IQUfJ4B2Yt53hFN/tGvE9vwUivcqd0vEmZONS+2hX4MkwVjb49zsraCDhAchr93CkT3y5g9zrGvPugszBtOl2RIyA3IZqD27SGaIRRmGWGnJTVBGJ1HSxVkzxXf8wNnpqPeLsZbKbtAArh7V2+i4A4UdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782695; c=relaxed/simple;
	bh=R2qfNGD51dMVctCpDDzm8hhEzYp4zt7svoW4jPA8eag=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2t1oHoBJJs2kmCNnj5woXJO3F8LBYH2M95BZmjV77b1kaPoQZ/5mVjr0fWEdw5+lBiOyxRX58Y2u0er7jp9QTm4E/TOwyHTLvZZ8mBCmGRUXG8tn8WXgrJtQZ6qn+y1m+ETbfoHc0dlEQGMUliZ5LmgSgU1ryKFKM29JNjw8CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOF+5HdU; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOF+5HdU"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso828494866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790782683; x=1791387483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=blz14Kryy333MwsAfcVeWnCS/9nOHGV6aMGIkIjuVtM=;
        b=bOF+5HdUW7BNuiGncnMaOCC/ZZ633N+D1ZLmFan+W3kNtOUdi5bTzRgBnyR0o8ePwx
         +g+Pz97xvWVE8ILn0ftU5Eio+oshvQ0qJWhVjE5LqYCrt+Hb4OeVgGiU21IsGITbuMSS
         lzm2IPh3xsxvnNvf/gtTnM9v0r88g6Mnndze4hkrr4e5rDbx7pIfph5paRyawPGgZptW
         o2qJbz/j30i0rj8cur3l7EwXIee8MUVt5bG4npqC3VVh5boAwOMqVj1cDMKEXinbNxaq
         8+2WyEDMBPJkC/xyfLYmGBbqlip6o6p6RtB54RvYbrcYltZShU8R7/5pmBWtKZm3aCGR
         5PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782683; x=1791387483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blz14Kryy333MwsAfcVeWnCS/9nOHGV6aMGIkIjuVtM=;
        b=ttPDJ7DU5nJhXZPv1U0hng8bfSi7n+zmeVCPpKbupkbb07N7px0auuuLicAIU+jSoP
         lgD/UgEM0iZ6WexSBplg/n4PPxP6pScgnp73y15rpfC30Z8Hmx8qWwjYKOEyINOGMf4z
         64zreopdPmNtmli4O7ZlGRRWSrXXKpol+hb9i4yKVqYEUBsyXlJZuBufupNio9Kl83yl
         7NRxRT66LDbsantY7KLSKDISi9jmnUnnDd33u9DvGFr76huIpt6IpPhLemcV6SK0GB0f
         suyKkIRvxYbT9RC+CmzB4Fr3GD5Ercs7H/Z7pgDRcE3VLo+XZ6J/rgLYSg+TuZBo2bXN
         qGQw==
X-Forwarded-Encrypted: i=1; AKwUvBwQZKgykojNMEzm0tMjhaz9w2CuxDRH1jCj5inwldVB4P2B7OlmtS40kQ16plqAn8MmA5jcntlXIIAMXQs=@vger.kernel.org
X-Gm-Message-State: AFuF++lFoXU3EelnWbo0bvb9tmRgPIJ2o+rxDCsiXW4IngEn8MaXuQJ0
	fjUghnK2aeDWCqbPEBeNX0W+awPlHQAInE8eBu4GEavSbxz7InYkgI8j
X-Gm-Gg: AYBFou0QY3cBq0OGUqPMqn8nAu+/BU21XLYT8b5IX54FihI3HOELKmjRYumysvzct12
	Hi2BXQpN4Km7tFzzXSbbRc035TFNmse8U8eyILNaTU1msWXbnSp4Q2bkt3XQ0IrlI+Kmr3Rx9R6
	kH/vZJGtKOx0v1Nl3NJHMD2uhoR/EKeWdKlXS/Dl5SLtT9e3n0dgQS0dVXB/bAL+GlM5Bs8O5I9
	QlBab07FrCUXLfk5dw9yNQ6VXgCDhe45zGZt+uUOnL/4LrxrShBQ8WK7FTyUVngSgI+k/Do2qWz
	mi/YjtrN6RP/U/9IGuJY4xyMrnw1f+/87V3BLC0IyrRNDRmPAKkqAx9MwL1681KVm0ks9lFjl7E
	ZOxhCsGFby+l6MwpeeWU8/kjQmuUIr231+yIH0y1uJ+hGqC9keEzKyeJmFMZqyMBV4CHgIz33Xa
	tLN8BPkm1qSO+SdlZ19XmR1f2BQtaZn5UucUpZ
X-Received: by 2002:a17:907:9628:b0:c26:24ed:39e5 with SMTP id a640c23a62f3a-c2e23cd72e3mr159226866b.18.1790782682624;
        Wed, 30 Sep 2026 08:38:02 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3eb32sm30808366b.3.2026.09.30.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:38:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 17:37:59 +0200
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
Subject: Re: [PATCH v9 05/10] arm64/vmalloc: allow
 arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Message-ID: <ar0s14p8KPgmDKmR@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-6-jiangwen6@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-6-jiangwen6@xiaomi.com>

On Wed, Sep 23, 2026 at 02:28:27PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.
> 
> For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
> multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
> mapping spans, not HugeTLB hstate sizes.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..4053b1ec1902e 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
>  	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
>  	 * aligned in both virtual and physical space, then we can pte-map the
>  	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> +	 * capped below PMD_SIZE.
>  	 */
>  	if (max_page_shift < CONT_PTE_SHIFT)
>  		return PAGE_SIZE;
> @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
>  
> -	return CONT_PTE_SIZE;
> +	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
>
Capped below PMD_SIZE? It is half of PMD_SIZE. Where is that limitation
comes from? I think the commit message should be improved in that sense.

--
Uladzislau Rezki
