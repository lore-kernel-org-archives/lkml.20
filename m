Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F5F37E5CB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967082; cv=none; b=S16SQBrGDimCYuEze2ifUO3TY5kTcJY2F56RY0njA1xXXdi8zo+iq1b0GYzzi1t+ZtfJtGv/UCfUf5nuTZsfUhlJFwXve1SHr4sb20XimF/bgH8hcAWk+5GzYrg0X7HcsrSvHadqAxZtB3dO28A3iC/5k/0vy1ljGIgY8JZdgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967082; c=relaxed/simple;
	bh=Lvh1ebzqQWLVy/QzryOeVmDqirZlakF61dyc2OgQxSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXudzrOzToUopYg8KvgeM+tZ9h4037R92bFphwmmbacRsz/UyQsFOHL7quf9mh8HwFxEWPzfAZXMoitSC4U1ZH5SNdm5LnDHpyFMJJUfVoZdSjza28wtSZRbovNgq81OKD2ZFhR6aYqicCyLAlyOT7rza8dMQBFqFzHmMQPRutc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YW+O5SxZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YW+O5SxZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BC551596;
	Wed, 14 Oct 2026 01:37:57 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C018B3F7B4;
	Wed, 14 Oct 2026 01:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791967080; bh=Lvh1ebzqQWLVy/QzryOeVmDqirZlakF61dyc2OgQxSQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YW+O5SxZcPWoxb2kG3EQpKGLvC8F36KUBW01MWK6X9q57dGo6HKRHPLgvQ6s2VAKU
	 P1X7INSncDesFr7A7sT/tuUyrkfiKfCdFHG5ahDf+NUh+8hSrgfzD92ECUDiEdb2lH
	 w1XLvv7Z80od/QksxuojE4SaYRCMTIxQkcYwlU3g=
Message-ID: <498336e2-8a48-4cd4-80fd-b3da571ded12@arm.com>
Date: Wed, 14 Oct 2026 14:07:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/10] mm/vmalloc: extract vm_shift() to consolidate
 mapping shift selection
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, chleroy@kernel.org, david@kernel.org,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-9-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-9-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/10/26 2:39 pm, Wen Jiang wrote:
> Extract the vmalloc mapping shift selection from
> __vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
> vmap batching path.
> 
> No functional change.
> 
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/vmalloc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 99bd22c086bf8..aae6141aaebf5 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3568,6 +3568,14 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
>  
> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> +{
> +	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> +		return PMD_SHIFT;
> +
> +	return arch_vmap_pte_supported_shift(size);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -4079,11 +4087,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		 * supporting them.
>  		 */
>  
> -		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> -			shift = PMD_SHIFT;
> -		else
> -			shift = arch_vmap_pte_supported_shift(size);
> -
> +		shift = vm_shift(prot, size);
>  		align = max(original_align, 1UL << shift);
>  	}
>  

