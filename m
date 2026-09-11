Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D746EF9F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129545; cv=none; b=DPMz1U2stwwk0+yaOr7Ey1n/JcljgZ8A1pGfJhHfCu2e3ERAXl/KbCUbh3T8sHvqWm+Cg1utcL7MMoxw6O27uLdH7j7/WFfi1aPfBVul87JPkWqODsW6YHwmaaDndl1VRn5ACwNQP3KKo0EiX+/hG1xxbNHSCCOTNojwz2n9fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129545; c=relaxed/simple;
	bh=MJixkhuHNsY4dxHUntmpcSbTndvyyB1dcOjMcYvEgyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMUNEaZLAPCMZDn/L2xkeR9m99B/iTq5nzXdMqNlRca65RaZAioyV9L/NADUbtb1PG/QHwmIYGhAgJrN9UU14LFBGTXPegfQ6dhqQ12jhymiLgZdb7kseQxltC03w+kZrQS7u4cfDM4z1pfkiZgXZ6mZoHJDTkIYJ1wltjAML4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6LDBp4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6LDBp4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077811F0089B;
	Fri, 11 Sep 2026 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789129535;
	bh=zy0ha+3Wm2i5qSTOnPHKqrhi8KuQRgCXKyT8cpq+e1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l6LDBp4uBNZoClVFT0rfPbTA1cYRDfrw4aUp56uV6Yh61PJFzVx7GLxy3XJO5dtyL
	 xzMyLDj+FLCMM8q+66DwuA7dLb4rIvxU4CicyuKj80mg7NtcLc9zHwyI3aExLirQiB
	 W4sQmxf+gn7GnPcNsN/sE3hr26q5nZF0WrUVGYjQr+l5mXxGawmc379+Z+eGDMGpdF
	 K5+6znpbitxH5aO35rZLl4QadAhg+A7ch7y5Q3HK+GZZRS6vigy74rcLnyvBEbESkh
	 oM5eQrnvu2EZaxGAl3bhW3+wAKTEoQWX/XRBPzaMrksgDzckFec9KSK4bk4t4/79BQ
	 ik1iwxe4aU3Bw==
Date: Fri, 11 Sep 2026 13:25:30 +0100
From: Will Deacon <will@kernel.org>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: anshuman.khandual@arm.com, gshan@redhat.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, zengheng4@huawei.com,
	linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: io: Reject non-user protection in
 ioremap_prot()
Message-ID: <aqPzOn0ksb_IEJ-Q@willie-the-truck>
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
> From: Zeng Heng <zengheng4@huawei.com>
> 
> Mapping a stack-top page via /dev/mem with PROT_NONE and then
> reading that process's /proc/<pid>/cmdline triggers a spurious WARN
> in ioremap_prot() through generic_access_phys():
> 
>   WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
>   Call trace:
>     generic_access_phys+0x1c8/0x228 (P)
>     __access_remote_vm+0x2b4/0x398
>     access_remote_vm+0x14/0x30
>     get_mm_cmdline+0xf8/0x2a0
>     proc_pid_cmdline_read+0x68/0x120
> 
> generic_access_phys() passes the protection derived from the user PTE
> to ioremap_prot(). On arm64, a PROT_NONE mapping is represented by a
> present-invalid PTE, so pte_present() still returns true and the
> protection reaches ioremap_prot().
> 
> A PROT_NONE mapping does not have PTE_USER, causing the existing
> WARN_ON_ONCE() in ioremap_prot() to fire even though this is a valid
> user mapping. Execute-only mappings have the same issue and must not
> be readable through this path either.
> 
> ioremap_prot() should therefore reject protection values without
> PTE_USER without warning. This makes the access fail cleanly for
> PROT_NONE and execute-only mappings while retaining the existing
> user-protection contract.
> 
> Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  arch/arm64/include/asm/io.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
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

I was initially worried about getting an invalid PTE here which happened
to have PTE_USER set (e.g. as part of a swap entry), but it looks like
follow_pfnmap_start() returns -EINVAL if the PTE isn't present.

So I think this is ok, but I'll wait to see what Catalin thinks.

Will
