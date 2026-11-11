Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418466;
	b=XOsIk3PWyHzpB4DfIL9+95EwC411YqE1Y24und4ySCfk3IKvAROMnIPnEXfCOfnKuNRY
	 GTxoRJakvVODIGQhQzgRKU3Bz5pXyQ+DRZVkdJp4G4rpsT4zshvTLpASUOHxBUdSBrLVD
	 YoRD9Bqz0jFqU1uRJxtj/Z7j1PD7EtlQswqihtz5behY9fFeNbeM1Yi1wBxWtCAzMZYHk
	 Lmjm3eEH9CsEOR90wrFlfTd46FIcWPg7nNIw6C7Q+vu0f+sX3CeJjBsnd8WA8Mp2eUjjt
	 Mujjb+gUXDocjyMDz9LfArdRGNMOfRrq4D/3QVuJ0Tbd4HLqnmH+V84LYFwCQv9k86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418466;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+JExMpkIghyJdkvx3jA5EHdqZ15V1KhbmwxXrb+zoAY=;
	b=Dmvr8+UVSZoKQgfu7tUs+9yhVMujKw2yPekjHIlKigXBDWTiRXzWvkNuRdRys503sUQW
	 jq4lWrd0LHv1bMaJxqaeNyZ6zK7XfyMxQrWp9cg9xRktxYoseDKLLYpcaOPKwVTBrm5pN
	 I/1Xu0h/vt1kGIvCGLhQhcGlfh+EVaxz5Vzm6nkhTAObzRsFU4X4qz49PB/SRcYeamUz5
	 auD30768jMIcTXnJHgOXUbCabgQYemh4X/hiErS5wHSvohgZH5/1h7QS04vVhQAUAegRk
	 A4gjwKKfl0f5XGUJHwut0jU/YLAuq7L3hUOz1CppZdgc9q0Dcx33kBFgrXAMVEGsDOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbxorCOd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A78606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbxorCOd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7580E1F00A05;
	Wed, 11 Nov 2026 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418466;
	bh=+JExMpkIghyJdkvx3jA5EHdqZ15V1KhbmwxXrb+zoAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XbxorCOdp5Fzs+qsjf4cdqT8tVln/LvFUqnRQ/rR/nMRSMA0wXTJcXs8hWDOGP7wX
	 v7eEbTkgLCAVMKTTwieMyUdNV2SOmvgRYDI7rNQnJDOwTEJR7yp/JrrQ+M55TzI4hC
	 Xfr3F/z2tr7HZZBI5XOBSRMs27oURPlsKVR8PpvyaJijihReH5b1pQCwxkbHnHqIqm
	 6ftNsLqVBnUmBUMpTgsiEJ3FVNikvrN4tYApYUNfIJvxY4HMRimjzgvunnhGxpTU4F
	 zzJWt/y0uU/ewp4WXL+v+Y2dqW3b9jcsVbhrC+1xeB1NYTL31q7xCYRwfAnVTMklvD
	 M+5sPsw33oVOw==
Date: Wed, 11 Nov 2026 19:34:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] x86/mm: Convert printk(KERN_*) to pr_*() in
 initmem_init()
Message-ID: <avSnG2SVpeyKDAXt@kernel.org>
References: <20261111133635.75044-3-blum@kernel.org>
 <20261111133635.75044-4-blum@kernel.org>
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
In-Reply-To: <20261111133635.75044-4-blum@kernel.org>

On Wed, Nov 11, 2026 at 02:36:35PM +0100, Thorsten Blum wrote:
> Convert printk(KERN_*) to pr_notice() and pr_info(), use %lu for the
> unsigned long arguments, and add spaces around the shift operators.

Heh, there are about 90 printk(KERN_*) in arch/x86/mm and way more in
arch/x86. 

Maybe change them in a scripted sweep?
 
> No functional change.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/x86/mm/init_32.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index 9b0a3dd02da0..a799f4cff63f 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -616,8 +616,7 @@ void __init initmem_init(void)
>  	unsigned long highstart_pfn = min(max_pfn, max_low_pfn);
>  	unsigned long highend_pfn = max_pfn;
>  
> -	printk(KERN_NOTICE "%ldMB HIGHMEM available.\n",
> -		pages_to_mb(highend_pfn - highstart_pfn));
> +	pr_notice("%luMB HIGHMEM available.\n", pages_to_mb(highend_pfn - highstart_pfn));
>  	high_memory = (void *) __va(highstart_pfn * PAGE_SIZE - 1) + 1;
>  #else
>  	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE - 1) + 1;
> @@ -627,12 +626,10 @@ void __init initmem_init(void)
>  
>  	__vmalloc_start_set = true;
>  
> -	printk(KERN_NOTICE "%ldMB LOWMEM available.\n",
> -			pages_to_mb(max_low_pfn));
> +	pr_notice("%luMB LOWMEM available.\n", pages_to_mb(max_low_pfn));
>  
> -	printk(KERN_INFO "  mapped low ram: 0 - %08lx\n",
> -		 max_pfn_mapped<<PAGE_SHIFT);
> -	printk(KERN_INFO "  low ram: 0 - %08lx\n", max_low_pfn<<PAGE_SHIFT);
> +	pr_info("  mapped low ram: 0 - %08lx\n", max_pfn_mapped << PAGE_SHIFT);
> +	pr_info("  low ram: 0 - %08lx\n", max_low_pfn << PAGE_SHIFT);
>  }
>  
>  /*

-- 
Sincerely yours,
Mike.
