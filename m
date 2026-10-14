Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE724A92E9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021688; cv=none; b=blCJGhaFc2ondVsQxpgLYC72zqtRUPJgxpnlyE1twelMqsT/E/AS+YRc1s++Sek5X0Tw1OVvYDiGDGymXWmbUoU9s0ZmVSbpr8ypHLgKCiSU3/zXYBXAI1tTZiQW2Y25NDkOyvjYG88Kyf+CbMppjzYmz3oxgUYfhk63omWzFCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021688; c=relaxed/simple;
	bh=/Jj66UMHGIQ/4k0M1sK2sHPXFGPTHu8wc7uis9sYSXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qX1/Uw9D+jxNHSZ7HrrFsHOq7OceHu6ubSWANG3uxzsjluA4UNvTfW1Ov9diw891jT6YqzFGAS8uh0H1zZTzHTF4mojbLZH48xrGxD72+Ch+pG7kqdMsEyaDDkkXH3i1fgFVMXf5Rn4x83u9zR9ePNicXrGCA1FcNuEf9olpghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8c1hXPu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8c1hXPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88571F000C4;
	Wed, 14 Oct 2026 23:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792021686;
	bh=gCyvDUwHt5+cJZfjR8z7IVTBfcPA96zhImRbO5hQhvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P8c1hXPuc6oJ37/sT7AEwfa+lnclKmoJcWqIq6sjkeqmbCTYVZC/akKJUNSi0jmI4
	 ux+A/19Y1zKf5YsTINeEhTOIlRbH1ELYhpbYg9OJ4ju4VwACF6Z5y6klVm/ZEEy6Oq
	 31PH+GVMXwqZtxlhYWoY8qPcHGamkx4ULIfFBaibCIniy6kDH6yfXSBpeEk3bpAPU+
	 P3fo5Zfgqo8P80tohMLWwPhtuK5UherJjCGGDoK5SvqbjGrUn/P5giP0tP3HipRtoW
	 1MzCk4T73Ar1JhQwMFpFrxzHI/Qcqk4BCHbvNzhUVzXCPOmmfZunxzRhjIiIEKTr7u
	 J0S66hp/GLocg==
Date: Thu, 15 Oct 2026 07:28:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend
 on MMU
Message-ID: <atAQAI0WWtwh8kvf@xhacker>
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>

On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> These options are irreleant for nommu systems.
> 
> Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/riscv/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 15f6e67c60410a87..15beeb4690aebcc4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
>  
>  config RISCV_ISA_SV48
>  	bool "Page-Based 48-bit Virtual-Memory System"
> -	depends on 64BIT
> +	depends on 64BIT && MMU
>  	default y
>  	help
>  	  Add support for the Page-Based 48-bit Virtual-Memory System.
> @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
>  
>  config RISCV_ISA_SV57
>  	bool "Page-Based 57-bit Virtual-Memory System"
> -	depends on 64BIT
> +	depends on 64BIT && MMU

hmm, I think we also need to make RISCV_ISA_SV57 depend on
RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
!RISCV_ISA_SV48. Human won't make this wrong combination, but
the random config can.

with that change,
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

>  	default y
>  	help
>  	  Add support for the Page-Based 57-bit Virtual-Memory System.
> -- 
> 2.43.0
> 
