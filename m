Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941A34041B;
	Tue, 13 Oct 2026 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898769; cv=none; b=Vwsmt7cTgpN6R/UD608a8br3UTppQIXo+Sx2prcSzU7bWGGijaVWANVfG0U/nxy5h4FoIxwwDwl75P8/eBVDVldlwab17BhxYLAgdsoRNozph8qrJLkIGQUp9ivt3fJI/uHQLNzGMbQMzHDhVsEhlG/I7D4Alus5sS4RKiDG1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898769; c=relaxed/simple;
	bh=9tnJK+2NFm1yv3PI7xsxRgp6js0QhgsLFeVB9gRharc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T44c7QXLPKwgZC83PdDrM2lo3CCAKt3cIo8m/lMv5Mg4q0sSlvGpzY+WuclC1s48fOBHmCSVybA9Y9lLpjr64GmWeh14V06kunjNOdx+tKWnc4X5oIdWveMEJE2Mqd/EENzJlVB3/9G5dvXi5FrC5te2lwHufpMpu6Qyvjbu6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oLYydJqR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oLYydJqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743DF1F000FF;
	Tue, 13 Oct 2026 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791898768;
	bh=P59KkAzU1D8sfVvMRGRgZVlKjGsZSJgyZFlyymM0Qiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oLYydJqRSwapEIsZTJ2NQfs32OXtnK/Xd2R/7VtWu9jmJqRxB4RfUMy9cWwQq1YrK
	 dVt5Pa/Fks7DYA/Dkr9ePeZwa9daE6xFumNVYkENRtvNwdVReW5LWsoGapa4d4hzaa
	 sUNsPib1qd64URLlSlX3+A2gwqv3y0LUwyakwp4A=
Date: Tue, 13 Oct 2026 15:39:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: Re: [PATCH v2] staging: sm750fb: fix resource leaks on probe error
Message-ID: <2026101326-pectin-decent-7407@gregkh>
References: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com>

On Sat, Oct 03, 2026 at 08:50:55PM +0300, Tymofiy Zakharchuk wrote:
> If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
> the framebuffer structures are released. The write-combining MTRR,
> the MMIO and VRAM mappings, and PCI region 1 remain allocated.
> 
> Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
> release_fb error exit path to prevent leaking resources.
> 
> Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
> ---
> v2:
>  - Fix From and Signed-off-by email mismatch.
> 
>  drivers/staging/sm750fb/sm750.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 8b93bfeb2..456b3da86 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
>  
>  release_fb:
>  	sm750fb_framebuffer_release(sm750_dev);
> +	arch_phys_wc_del(sm750_dev->mtrr.vram);
> +	iounmap(sm750_dev->vmem);
> +	iounmap(sm750_dev->mmio);
> +	pci_release_region(pdev, 1);
>  	return err;
>  }
>  
> -- 
> 2.53.0.windows.1
> 
> 

How was this found and tested?

thanks,

greg k-h
