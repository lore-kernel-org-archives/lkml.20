Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4E3321DC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819063; cv=none; b=EmomoOv0t71zHDegkFQ5nAMEnVahLHBs/XKjuycpT/Xd2QnBchJKJ2Y7NAi4Yy47IUf0JCSksdoGdvkv0e+soT0z6d0sKI23mIXzCaWX2rA9xJDduhQKqa96djuF3Oq4VOX8Jri45Hj3/6rVoZTOA7FpQyZayCjQgvC5OULE1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819063; c=relaxed/simple;
	bh=Q1xRWIuT1UcJakuU+d2NvgTz2PfPhyXqy+ZlPVDLRi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuSL+rRLLDOmsVGkOmBx7EZL0AOTKxvJakoFnRWDJzu52B+4CLyvK+x+LC5vt2VO2vL60SqVzciNvGf4hDDJVSk3uOuALcmWcprop+oX/TPaZOuE2SOcQVT2ncd3YTPijt9MG4yqfJ1cLk4a3FCjwfvODOkkFB3Et9vkP3muhHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bd8ktOay; arc=none smtp.client-ip=91.218.175.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bd8ktOay"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q1xRWIuT1UcJakuU+d2NvgTz2PfPhyXqy+ZlPVDLRi4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787819057; v=1; x=1788423857;
 b=bd8ktOayRThHB9Dmv3mP0vteSINEXbfzeg880B9yL4lvfWMbjmo5CpH3RbIXnQtRCMOnt0nG
 cnl9qcSah8/Amn0GwWBOS0kh7mGV9iA0GUeaA4GqU4ZoIBGmxWQ+VVsucaeU28cWj/+xvdqmpGz
 32Y8uMYj8VNNzt9T/M5WWCNM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 277c755c97f5e739;
	Thu, 27 Aug 2026 08:24:17 +0000
X-Mizu-Trace-ID: 277c755c97f5e739
X-Migadu-Flow: FLOW_OUT
Date: Thu, 27 Aug 2026 16:24:13 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baohua@kernel.org,
	youngjun.park@lge.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mm/swap: Remove unused declaration
 swapcache_clear()
Message-ID: <ao_0Ld8lISiaVAEf@MiWiFi-R3L-srv>
References: <20260827082722.1809702-1-yuehaibing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827082722.1809702-1-yuehaibing@huawei.com>

On 08/27/26 at 04:27pm, Yue Haibing wrote:
> Commit c246d236b18b ("mm/shmem: never bypass the swap cache for
> SWP_SYNCHRONOUS_IO") removed the implementations but leave this.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  mm/swap.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mm/swap.h b/mm/swap.h
> index d077e5893a42..29060a305443 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -344,7 +344,6 @@ void __swap_cache_replace_folio(struct swap_cluster_info *ci,
>  				struct folio *old, struct folio *new);
>  
>  void show_swap_cache_info(void);
> -void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry, int nr);
>  struct folio *read_swap_cache_async(struct swap_io_ctx *ctx, swp_entry_t entry,
>  		gfp_t gfp_mask, struct vm_area_struct *vma, unsigned long addr);
>  struct folio *swap_cluster_readahead(swp_entry_t entry, gfp_t flag,

Reviewed-by: Baoquan He <baoquan.he@linux.dev>

> -- 
> 2.34.1
> 
