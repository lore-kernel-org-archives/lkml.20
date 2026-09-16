Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A034D09FD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562124; cv=none; b=timCtMRC9rbvccMt4TQm2BYJdS/+pLI23TLMwF98JuAfYTbYHz1AoWvTkisnQcSutnfpRYQur1FP7lhlpyQ12saYcEq3JCnbDbbizWrhKhyMfgKaVI+L3z661rvLjq0mJqx2zPCiU/Wjn+JhXL6I4SknN/L2d3+zBmQVM0ejYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562124; c=relaxed/simple;
	bh=Op1NyF8N8G6gt5qdhV5aOHeCjZNmST0Aq6Tq9dA/a5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoY5IpjpuQIbl7kyKUxbnlC9X7ciu0oQdEeTv3SisqS2xff9/iP2Q9PSPTZEqHvFR1oJ/cRl0cZhQ2vaBRJQMZ14Zc32bX5lvQAfYiiuSJcfmegrdTKf6nFF79oAxYGODUCjw75Fl0l4Sg71IfBXznzqeCQAi1CuD+dESdUwQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JNlDyhNI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JNlDyhNI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9389A152B;
	Wed, 16 Sep 2026 05:35:09 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38CA3F7B4;
	Wed, 16 Sep 2026 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789562113; bh=Op1NyF8N8G6gt5qdhV5aOHeCjZNmST0Aq6Tq9dA/a5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNlDyhNIEisaCgDhSdHO7WiOYNl/Y63Jc+5Helh/6XuIeSWv9m1IlE19liB5WB74P
	 rIucpaZ/17XnM5mevYWlHl2XylaZi7Rl1QSUX147RTq8MzibUucMKYvekGu9oOem1i
	 /4k/2OUi+BGxjQ1Ja7x+RCow9gQM9cpaxe+8E6aM=
Date: Wed, 16 Sep 2026 13:35:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: anshuman.khandual@arm.com, gshan@redhat.com, will@kernel.org,
	suzuki.poulose@arm.com, zengheng4@huawei.com,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in
 ioremap_prot()
Message-ID: <aqqM_NoRRePxXzOO@arm.com>
References: <20260911015859.71164-1-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911015859.71164-1-zengheng@huaweicloud.com>

On Fri, Sep 11, 2026 at 09:58:59AM +0800, Zeng Heng wrote:
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 21c8e400107c..31e67f6bd4a7 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -272,7 +272,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>  	pgprot_t prot;
>  	ptval_t user_prot_val = pgprot_val(user_prot);
>  
> -	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
> +	/* Reject PROT_NONE and exec-only */
> +	if (!(user_prot_val & PTE_USER))
>  		return NULL;
>  
>  	prot = __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK,

Looks alright to me:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

It would be good to get Sashiko's finding sorted out as well
(pre-existing issue). I reckon that should go in the core code.

-- 
Catalin
