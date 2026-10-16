Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2E5304C1;
	Fri, 16 Oct 2026 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171221; cv=none; b=UTJPenKl+49W6bNNEElRq7LEulY5aZEor5vNCD89NQbRs2YxVY/amz36WH2WSuo/Tgj4ltu8+ACDTiGrMlJv7+VEFEe9Sdzh4hfO8zKJW7ZCh2etLgH/0YvjOeaeR87pHmuAKSepo3Xi4z1PAJMwWWmlokH7ZyVFSvX2ludqAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171221; c=relaxed/simple;
	bh=1qLqgUK3O0JJhHLhaf7ZLoaVvBVeWeJEIM055yE2WPk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KATsVPDbOUR+cRePWYlXXgMQIgnapdrubKmhxkIsm3R5DqstAyspNdLFtXavUgzp/x3zxLvaqNaNtfDULr6mtGpW3maCRO1ONFLaOwztIUrTnO0vVPOTTzmYol+vyu7bne83cqyN2LrpzEO7GjB70rzhYiAHa4WPULHSZIDtYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7ALYj3F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7ALYj3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3280E1F000C6;
	Fri, 16 Oct 2026 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171220;
	bh=xD3yRsvoIFwL/JZOKynIA6QUqNyu8SGGZTONrw/z9U8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=I7ALYj3Fi/lEtMpo8+EeCt4CJ84OF0OUGVAAszi/qL9LDCsN59Sro0hqbPrUY2nB+
	 Xk3sKpfAuQofcEExNilFlFX7NUYwfJ/tQn27vKQ3NIOOJ6HF6IOmENAYgHrDLSa5qM
	 tnnS0scAKEKhMXDyF8T0ZFiAjGNb2YtxWZix4gEhU6ysTduzeoJsSj3rM3hzqayyYi
	 vctMZs5IIDkfHuM8GS1IMXgRW65eV66UhjmhmlLRTIJqulH/d9UgsQbtzJar1oWXIW
	 T0rig6mzNB+3Mykwuxw29Hm5t3RSyZO7nZW6ME+f4OJpQ6DZAbuvCPEDv7OxYSU1w7
	 bnCHK+iP+Z+ig==
Date: Fri, 16 Oct 2026 18:20:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Borislav Petkov <bp@alien8.de>, Tony Luck
 <tony.luck@intel.com>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa
 <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
Message-ID: <20261016182014.7d2d8bbe@jic23-hlaptop>
In-Reply-To: <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
	<20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 21:26:17 +0530
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:

> Add LCP/SRP ECC register offsets to struct llcc_edac_reg_offset and
> create llcc_lcp_srp_edac_reg_offset for QCM2390, leaving the shared
> llcc_v2_1_edac_reg_offset table unchanged. Switch shikra_cfg to the
> new table so other platforms with the same block can reuse it.
> 
> Add lcp_irq to struct llcc_drv_data and retrieve the optional second
> interrupt in qcom_llcc_probe(), propagating non-absence errors so the
> driver defers correctly.
> 
> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Hi Faiyaz,

One comment on existing code + a suggestion to tidy the new stuff
up a little.

That global for drv_data is less than ideal, but given you are touching
the driver please tidy up initial assignment to use INIT_ERR_PTR()


>  static const struct llcc_edac_reg_offset llcc_v6_edac_reg_offset = {
>  	.trp_ecc_error_status0 = 0x47448,
>  	.trp_ecc_error_status1 = 0x47450,
> @@ -4767,7 +4802,7 @@ static const struct qcom_llcc_config shikra_cfg[] = {
>  		.sct_data	= shikra_data,
>  		.size		= ARRAY_SIZE(shikra_data),
>  		.reg_offset	= llcc_v2_1_reg_offset,
> -		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
> +		.edac_reg_offset = &llcc_lcp_srp_edac_reg_offset,
>  		.irq_configured = true,
>  	},
>  };
> @@ -5798,7 +5833,13 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  	if (drv_data->ecc_irq < 0 && drv_data->ecc_irq != -ENXIO)
>  		return dev_err_probe(&pdev->dev, drv_data->ecc_irq,
>  				     "failed to get IRQ resource\n");

Unrelated to your patch, but why don't we need that tiny bit of error cleanup under
goto err for this path?  That use of a global is not the best anyway, but none
the less I'd expect either some consistency or a comment on why not in the above
path.

> -
> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);
> +		if (drv_data->lcp_irq < 0 && drv_data->lcp_irq != -ENXIO) {
> +			ret = drv_data->lcp_irq;
> +			goto err;
> +		}

Maybe it's local style, but generally I'd put the value in ret until you've checked validty
then copy it to the good location.

		ret = platform_get_irq_optional(pdev, 1);
		if (ret < 0 && ret != -ENXIO)
			goto err;
		drv_data->lcp_irq = ret;
Both more compact and obvious when we trust the value to be good.

		
> +	}
>  	drv_data->edac_reg_offset = cfg->edac_reg_offset;
>  	drv_data->ecc_irq_configured = cfg->irq_configured;
>  	drv_data->dev = dev;


