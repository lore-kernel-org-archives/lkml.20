Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218976;
	b=4OnK9T/2p0/iqc6R3yaat9UTFskrH0InVopn+Ix8ERkSTBrFAnD6koTNfNQGKvMJkqKf
	 Y5ZrnsbeV3DDrRxDkE8HaKCdyICJqDpxhlXNM7kw6ZAlxkw214UV6b1XRSd0t4CA9QtRe
	 rXJ5BRvESX1DhbypDHDWQhsmUwYNW+7g6u04k9mzli1wI5r8SoHoPORJc8xEO/l8fIrUM
	 dDGfA5KC+PfxNEzP4qJCFcR6836bGT6/CYhToH/5wR1gUeYwA9xqlACmzSix4DdmkEUiJ
	 8T7aWcSH1ljwO2Kv5TnLdgM9n9YOwQP4yCPyfolbY8qyQ1q43X6H7L8SIZ4EY+ZGPcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218976;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=cVDZpxqqtGXanXSa85zXaSGNSgk4+pujulEU5rVUYrI=;
	b=veqMXMNZCpS4Ywa1Y2FRN+jPnD8RCjs2T+iduT+e1D9ARa/sT0G3NZcIOTm4rfJ4VGDV
	 9G+wI659VZibNyi5AjGxv+lzMdcgGtQoOttGUTJYBH2WmEfxKP9rFUsy4CgrRkHR06Gq2
	 7251KcRd+0hNxArXuzc9VhaIbsKzlYIweaZWBORBd+0PxC/rz11opf71kBtUiLlAUMRdK
	 kQpu815hURABeOg4owrnLH/ykugKtwhM40/Y/aZgPm4+PXm6saXG+m/PjKuRvpNBioFdR
	 G4oX3OygJFlwBcrFb/Ejhke9y0GQXH5p1uH2jfmOMvctkV5BSU7/GqGNhSNoSqwcRKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkD0ZTkK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8794606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkD0ZTkK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52AA01F0089F;
	Mon,  9 Nov 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218976;
	bh=cVDZpxqqtGXanXSa85zXaSGNSgk4+pujulEU5rVUYrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RkD0ZTkK4UPON4c35h81yShsugX7KG37JtcxD2aUF6JUC30zWJqFhbDGyKqUah9ae
	 fP2maAVrCgbTCNnhOWJVTJhjX79zLJ/0RE7a7icltlw54oqi2yDeZ2WhBVR4ulKCT2
	 swE1tBlCR8QmzwQs3Tm3msHIU6pou/hNuz26EdKD3d+L0lrIbcRdJcLxUFT0dGV7A2
	 T4+0CI8h+D2boYeyH/j/gl6VVoSMgqf/fas9k5ObVWEF/08LvOecImOd6GEnB+Vvv9
	 TKnxk59d9A/Keuth0/lDlaE1ixFwS/OTMmkPcerP53RJx8DGnJL0EkgK2mC53fElRk
	 2xZZqsrVZFqkw==
Date: Mon, 9 Nov 2026 12:09:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kho: Don't release incoming bootmem areas when
 kho_init() fails
Message-ID: <avGb2Trm-C3_YC-7@kernel.org>
References: <au_vQhHAcJbkryXN@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au_vQhHAcJbkryXN@chrisdown.name>

Hi,

On Sat, Nov 07, 2026 at 07:40:50PM -0800, Chris Down wrote:
> kho_populate() adds the incoming bootmem areas without reserving
> them. memblock_free_all() then hands the remainder to the buddy
> allocator.

This paragraph is confusing.
It reads like kho_populate() should have reserved bootmem areas, but it
didn't.
 
> Unfortunately however, if kho_init() fails, err_free_bootmem
> currently frees every area with free_reserved_area(). This can free
> pages still backing early allocations or free buddy pages a second
> time.

Is this an issue you hit in practice or it was reported by a code analysis?

> To fix this, let's only free the areas on a cold boot when
> kho_reserve_bootmem() reserved them.
> 
> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  kernel/liveupdate/kexec_handover.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..a566ad6634d8 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1899,11 +1899,13 @@ static __init int kho_init(void)
>  	kho_radix_destroy_tree(tree);
>  err_free_bootmem:
>  	kho_out.fdt = NULL;
> -	for (int i = 0; i < kho_bootmem_cnt; i++) {
> -		void *start = __va(kho_bootmem[i].addr);
> -		void *end = start + kho_bootmem[i].size;
> +	if (!fdt) {

I think using !is_kho_boot() makes this clearer.

> +		for (int i = 0; i < kho_bootmem_cnt; i++) {
> +			void *start = __va(kho_bootmem[i].addr);
> +			void *end = start + kho_bootmem[i].size;
>  
> -		free_reserved_area(start, end, -1, "");
> +			free_reserved_area(start, end, -1, "");
> +		}
>  	}
>  	kho_enable = false;
>  	return err;
> 
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.
