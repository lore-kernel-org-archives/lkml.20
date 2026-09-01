Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00190434406
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276589; cv=none; b=IXMVE0Wpf6aiF6mnJQ+bGrNQEJgv2U0utnD41w3uC27nXi56CF30+BWy3b6IHn5E/RZ6vZ4m8nnCHkn13h3yQgnr35y1asyNQelN7VNOhBQYRLL8vsdZSdY1hIp3FzfscOdyXx1f1uZZthP0rZZ+NjvyaSDClSx2HjU7CSyYH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276589; c=relaxed/simple;
	bh=gLLa+LQsKzTOZs3X1QfXt+qiVzqtAAkpgAkf0r1H6GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k1Fn6syXZgjeNL9Is2fqxbgseXwnjA16ALw6YBruwXUjZoVn2urEYDdg4SHSp7tTCl1KhWJLhDt/mD8l0+0y28T9Q9SAM6L5b1JeLUcuvlBurcJyffuuqTAiJk3G2nPWtc1Dp2zBAP9LBk2oDOaJ/lXJV4t9fFzkTe/uIDY4Y7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0/soRz2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0/soRz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62CC1F000E9;
	Tue,  1 Sep 2026 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276587;
	bh=o/syEHCv1guCm/vmnIaZa70JsD2J++4F5PYglM5fdwE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=i0/soRz2SNzFmTbgCwHkMy1040NMxdaqWhrJCM3etG9HXyQOF6iPnTW2yeauP3A9c
	 J1zbPaTOgh1L9VrhDI2X+Vz9pPShgAZL3A0jusuvN46wLMj5wCFGSiNz7PnVTrKaYW
	 4b6vSc3thnxQCJDW/g4MIWXeVqrb64PYve5rAjXw1V213yq6qT+P7W/c8+i7VS2M07
	 VmnAWTXEULZhFZXSO061gVnHE8d1DO6P/MZToFttCdC7r2HqNgF5qermvIYoE7xf7q
	 /uDeH3rLxrIuTug+FqOneHSN2iRKPYEZkA+ekmEjuO9pKuXfG+POqIKKHbo+qkdaUT
	 CPQSrAMZHeYrA==
Message-ID: <3bfabe23-b88d-4548-a7a4-06bf526c3a31@kernel.org>
Date: Tue, 1 Sep 2026 17:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/4] memory: fsl_ifc: Fix optional NAND IRQ handling and
 migrate to platform IRQ API
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
References: <20260721202450.485171-1-rosenp@gmail.com>
 <20260721202450.485171-2-rosenp@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20260721202450.485171-2-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2026 22:24, Rosen Penev wrote:
> Switch from irq_of_parse_and_map() to platform_get_irq() for the main
> controller IRQ, and use platform_get_irq_optional() for the NAND IRQ
> which is optional. Guard free_irq() calls on the NAND IRQ with a
> nand_irq > 0 check to avoid passing invalid IRQ numbers on platforms
> without a dedicated NAND interrupt line.
> 
> Get IRQs first as they can return a probe defferal error. Helps avoid
> doing actual work in such a case.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/memory/fsl_ifc.c | 43 ++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> index e89e0c6cc4bc..dce94d8b05b9 100644
> --- a/drivers/memory/fsl_ifc.c
> +++ b/drivers/memory/fsl_ifc.c
> @@ -89,12 +89,10 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
>  	struct fsl_ifc_ctrl *ctrl = dev_get_drvdata(&dev->dev);
>  
>  	of_platform_depopulate(&dev->dev);
> -	free_irq(ctrl->nand_irq, ctrl);
> +	if (ctrl->nand_irq > 0)

0 is a valid IRQ for Linux, I think.

> +		free_irq(ctrl->nand_irq, ctrl);
>  	free_irq(ctrl->irq, ctrl);
>  
> -	irq_dispose_mapping(ctrl->nand_irq);
> -	irq_dispose_mapping(ctrl->irq);
> -
>  	iounmap(ctrl->gregs);
>  
>  	dev_set_drvdata(&dev->dev, NULL);
> @@ -204,9 +202,21 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  	int ret = 0;
>  	int version, banks;
>  	void __iomem *addr;
> +	int nand_irq;
> +	int irq;

Why do you need the intermediate variables?

>  
>  	dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
>  
> +	/* get the Controller level irq */
> +	irq = platform_get_irq(dev, 0);
> +	if (irq < 0)

... as also shown here.

> +		return irq;
> +
> +	/* get the nand machine irq */
> +	nand_irq = platform_get_irq_optional(dev, 1);
> +	if (nand_irq == -EPROBE_DEFER)
> +		return nand_irq;
> +
>  	fsl_ifc_ctrl_dev = devm_kzalloc(&dev->dev, sizeof(*fsl_ifc_ctrl_dev),
>  					GFP_KERNEL);
>  	if (!fsl_ifc_ctrl_dev)
> @@ -246,23 +256,13 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  		addr += PGOFFSET_4K;
>  	fsl_ifc_ctrl_dev->rregs = addr;
>  
> -	/* get the Controller level irq */
> -	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
> -	if (fsl_ifc_ctrl_dev->irq == 0) {
> -		dev_err(&dev->dev, "failed to get irq resource for IFC\n");
> -		ret = -ENODEV;
> -		goto err;
> -	}
> -
> -	/* get the nand machine irq */
> -	fsl_ifc_ctrl_dev->nand_irq =
> -			irq_of_parse_and_map(dev->dev.of_node, 1);
> +	fsl_ifc_ctrl_dev->irq = irq;
>  
>  	fsl_ifc_ctrl_dev->dev = &dev->dev;
>  
>  	ret = fsl_ifc_ctrl_init(fsl_ifc_ctrl_dev);
>  	if (ret < 0)
> -		goto err_unmap_nandirq;
> +		goto err;
>  
>  	init_waitqueue_head(&fsl_ifc_ctrl_dev->nand_wait);
>  
> @@ -271,10 +271,11 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  	if (ret != 0) {
>  		dev_err(&dev->dev, "failed to install irq (%d)\n",
>  			fsl_ifc_ctrl_dev->irq);
> -		goto err_unmap_nandirq;
> +		goto err;
>  	}
>  
> -	if (fsl_ifc_ctrl_dev->nand_irq) {
> +	fsl_ifc_ctrl_dev->nand_irq = nand_irq;
> +	if (fsl_ifc_ctrl_dev->nand_irq > 0) {

...but not here.

>  		ret = request_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_nand_irq,
>  				0, "fsl-ifc-nand", fsl_ifc_ctrl_dev);
>  		if (ret != 0) {
> @@ -292,12 +293,10 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
>  	return 0;
>  
>  err_free_nandirq:
> -	free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
> +	if (fsl_ifc_ctrl_dev->nand_irq > 0)
> +		free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
>  err_free_irq:
>  	free_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_dev);
> -err_unmap_nandirq:
> -	irq_dispose_mapping(fsl_ifc_ctrl_dev->nand_irq);
> -	irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
>  err:
>  	iounmap(fsl_ifc_ctrl_dev->gregs);
>  	return ret;


Best regards,
Krzysztof
