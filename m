Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E703F1ADB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958215; cv=none; b=Oo+nrbgkJE5aovdrdaAub+Kfd+kBVrK5WP1QRp2KhIMjmpVVPgE65Tn/6kzRXRDesi75v9ALeCzSsYWgYVFpod5sENZZo+fMkqjVukRh3iIIoksIFayYe7pINnQPUb1a+4kh85BqJBhG0CEWNXa30dbcnm5z0S1jjDtRGG2+5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958215; c=relaxed/simple;
	bh=2P592ah1QHrGLdfR2K13ZZmvuzgE+vLBRsQx+QWBuZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2oO1AMVm9Ai33yRTKFxAtr2eFmnwQ+Q3wKL5kDRpE7MDWzhQNWgUeNda0aB2uo3go9W6CEVgaf/1skJ2u9dVi3BVAnLcPWDMXZAFXfOwcx9TCpTCLNNoDwB6WdWTQs/O3fB1tjzV1Vg+Eh3VwIJpQBgABxwNX0d9dB8m6Bn63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qaKZYbRI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qaKZYbRI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E01C11576;
	Wed,  9 Sep 2026 05:50:08 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6146D3F7B4;
	Wed,  9 Sep 2026 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788958212; bh=2P592ah1QHrGLdfR2K13ZZmvuzgE+vLBRsQx+QWBuZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaKZYbRIoUxjc//OrU3dZPXMX0rs1FbFYRJ+KkU3YUc22K8ElUhMZ7QzQ8sSWSJgp
	 cfi2vHXQh/nyhcJYjnXPELKYbC31J+XjP/I79GUQejXRI5c9sqDjXTykoTXv0Wdj/E
	 DDjelwFrtxQbqwHtWxMNol29T1dIU0lgQOrI/YNM=
Date: Wed, 9 Sep 2026 13:50:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: suzuki.poulose@arm.com, anshuman.khandual@arm.com, gshan@redhat.com,
	david@kernel.org, will@kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: io: Reject present-invalid user prot in
 ioremap_prot()
Message-ID: <aqFWAWNzYagW2NNH@arm.com>
References: <20260905033148.3657516-1-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905033148.3657516-1-zengheng@huaweicloud.com>

On Sat, Sep 05, 2026 at 11:31:48AM +0800, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> Mapping a stack-top page via /dev/mem with PROT_NONE and then reading
> that process's /proc/<pid>/cmdline triggers a spurious WARN in
> ioremap_prot() through generic_access_phys():
> 
>   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>   Call trace:
>     generic_access_phys+0x1c8/0x228 (P)
>     __access_remote_vm+0x2b4/0x398
>     access_remote_vm+0x14/0x30
>     get_mm_cmdline+0xf8/0x2a0
>     proc_pid_cmdline_read+0x68/0x120
> 
> generic_access_phys() passes the full pgprot derived from the user PTE
> to ioremap_prot(). A PROT_NONE /dev/mem mapping is encoded as PAGE_NONE,
> which clears PTE_VALID and sets the software PTE_PRESENT_INVALID bit.
> On arm64 such an entry is still pte_present(), so follow_pfnmap_start()
> reports the pfn and generic_access_phys() reaches ioremap_prot().
> The PTE_USER assertion, which is meant to catch kernel prots being
> passed by mistake, then fires for a PROT_NONE user mapping
> that legitimately lacks PTE_USER, producing the spurious WARN.
> 
> Reject a user prot encoding a present-invalid (i.e. PROT_NONE) entry up
> front so that generic_access_phys() cleanly fails the access instead
> of warning. Note that PTE_PRESENT_INVALID aliases the PTE_NG bit and
> is only meaningful when PTE_VALID is clear, so both bits must be
> checked together.
> 
> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  arch/arm64/include/asm/io.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 21c8e400107c..bbfbc4682639 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -272,6 +272,10 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
>  	pgprot_t prot;
>  	ptval_t user_prot_val = pgprot_val(user_prot);
>  
> +	if ((user_prot_val & (PTE_VALID | PTE_PRESENT_INVALID)) ==
> +	     PTE_PRESENT_INVALID)
> +		return NULL;
> +
>  	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
>  		return NULL;

I wonder whether we should just drop the warning and return NULL if
!PTE_USER && PTE_UXN. The latter check would also catch execute-only
mappings (Sashiko pointed out this case still trips the warning). The
PROT_NONE case would be covered automatically as well since PTE_USER is
cleared, PTE_UXN set. Maybe add a comment that that pte_protnone()
relies on !PTE_USER && PTE_UXN, so it's not that we avoid the PROT_NONE
issue by chance.

Unrelated to your patch, also spotted by Sashiko, we only test a single
pte but the size can span two. The fix should be at the higher level in
generic_access_phys().

-- 
Catalin
