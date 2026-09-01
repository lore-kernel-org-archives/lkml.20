Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C741A559
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276860; cv=none; b=sv/YRr26+6xaF2rdG1D8nyAvYtWxQJWwMarTxfv1Osh8F/Rdmf1ma7mRtzE2CPoZu2r4Ke66L9jgZQvdeA8b4LiElpB9kVph7UwjBBVWtqqWpNIVrfG5QQS7Bwux4NzRMbAIBWhrn0zI9Gdh+lvuExQ90P7O8Q0+HYjM9WGQ/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276860; c=relaxed/simple;
	bh=FXXhaGwT2CHxXM9rmZ9cakXkn+w+VPN3qc03AzEa7Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YsLF28ESy5QVoJ8U+uhGRi7ToLBSsqjb0OqF+tzuaT1kDFqPNasgLhMvmukLFaYqIkGRXeYSowMkSRx4yIi3SUhp9qKrY6aLkNe+6D5GRdaXho1NaJgqSheVKjOt6fVRBK6HXk9v85tBCzIMWBMHkze/GV/W5bIvLcP/zG869cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNvDgjGa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNvDgjGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E551F000E9;
	Tue,  1 Sep 2026 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276858;
	bh=hChj9oqRFW11MkUP6/iyHcLe24IWLQWtgzrEOUInO1M=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=WNvDgjGa0098t3vVQttA1f9RWfM85voA2ukWyWO2as8yG5rYT5MGJqGUJBln2g+X7
	 rOYkFtXD2QHLBGwRHQGNiRGlIT1egI9NcrsM/2mT6QdzvVrExYgnJzvMIdS83H5+cH
	 KwcNa7yhKcZj1lv0ua37RbAYKbyJ0y9v4S3trIHTg8Yd7jtbFKxGrH4Ge0SaE4Dc7T
	 8NPyWWypC3vYeIOKxFjZu2zXP44xjndd5L5I/NSZqNWsqFE5ARhFrGwZCumc1BHnkY
	 Lc08fVDAgFN/c+p9F4Jvv0IDxIbOWJMvgOziXYEKkS8ax+PicfLdeWoCdmiWfRgZdh
	 6zPjJV7DhBokw==
Message-ID: <d4af29ce-54e0-49aa-8b5f-b2ce06fa8f76@kernel.org>
Date: Tue, 1 Sep 2026 17:34:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 2/4] memory: fsl_ifc: Use devm_platform_ioremap_resource
 and fix error paths
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
References: <20260721202450.485171-1-rosenp@gmail.com>
 <20260721202450.485171-3-rosenp@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260721202450.485171-3-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2026 22:24, Rosen Penev wrote:
> Replace of_iomap() with devm_platform_ioremap_resource() for automatic
> resource management, eliminating manual iounmap in remove and error
> paths. devm_ioremap_resource() reserves the region and checks for
> overlaps, which is safe here since the IFC controller register space
> and child chip-select ranges are always at distinct addresses in all
> DTS files.
> 
> As one of the errors is -EPROBE_DEFER, run it before anything else to
> avoid doing actual work in such a case.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/memory/fsl_ifc.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> index dce94d8b05b9..7e6800fc8480 100644
> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@ -92,10 +92,6 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
>  	if (ctrl->nand_irq > 0)
>  		free_irq(ctrl->nand_irq, ctrl);
>  	free_irq(ctrl->irq, ctrl);
> -
> -	iounmap(ctrl->gregs);
> -
> -	dev_set_drvdata(&dev->dev, NULL);
>  }
>  
>  /*
> @@ -201,6 +197,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  {
>  	int ret = 0;
>  	int version, banks;
> +	void __iomem *gregs;

Why another local variable?

>  	void __iomem *addr;
>  	int nand_irq;
>  	int irq;
> @@ -217,6 +214,11 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  	if (nand_irq == -EPROBE_DEFER)
>  		return nand_irq;
>  
> +	/* IOMAP the entire IFC region */
> +	gregs = devm_platform_ioremap_resource(dev, 0);
> +	if (IS_ERR(gregs))
> +		return PTR_ERR(gregs);
> +
>  	fsl_ifc_ctrl_dev = devm_kzalloc(&dev->dev, sizeof(*fsl_ifc_ctrl_dev),
>  					GFP_KERNEL);
>  	if (!fsl_ifc_ctrl_dev)
> @@ -224,12 +226,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  
>  	dev_set_drvdata(&dev->dev, fsl_ifc_ctrl_dev);
>  
> -	/* IOMAP the entire IFC region */
> -	fsl_ifc_ctrl_dev->gregs = of_iomap(dev->dev.of_node, 0);

This is not equivalent and commit msg does not address that. Old code
allowed multiple maps of the same address space but new code bails with
EBUSY.

Again, I asked last time - how did you test it?

Please mark the patches as RFT.


Best regards,
Krzysztof
