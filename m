Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4950B37BE64;
	Sat, 17 Oct 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254894; cv=none; b=crPlWhcVaRfPv/q7qYyRvLT0I7c5+s+C64mdePzv+SIh7KpFlM6LiEM1owSGwRiyrQJz99oFsZB3rsicIksP1xbqdein+j538bAfQNeTJtzIOubEeuVE8L7zStYU+Uw+zrkf3Q0c9GyiCNv4evbaLWgJd9XXfEpbYv5OoQH7j7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254894; c=relaxed/simple;
	bh=+ZGylb3y7feP0pdp6zbcgqFSZsaKuHJG3gq4El7x5rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0B2OMzlDxOPP7IUrBoI0AnrhtYXowDczixZ+VTJXFSFo7w6+JsFWXB5EDDetaNuuY3w4JYnm8wFWzUVVnKsk55J9j8WHC82GGOGVZjbPErLvKYf9ovIQscA9Szb3TOw+kqMiGL5zglMgwRMKmkQzsmndZdTgoqpnEySrM2VXAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYoCep99; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYoCep99"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6251F000C5;
	Sat, 17 Oct 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792254893;
	bh=Hh6UEvYqRhRZQkJlh69N8w4f1D/rdwQus7PrUPI2PbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYoCep99Jxdz05YBX3raQQtxCxsn23eZ6yJDkOQgIIVpAC4kd4WTUDeJLkw8yCkhi
	 hYTHeQ+mI+D/tH9J4W0hac1t7/n9Dxin9GW+19MUa1wMYUzUxePPWQAmD7CiXTe9bI
	 d5Ic2ok0lY5/1NW6bDFthyO6olAr2IaqGOsRvbvkQZ1QpT8R6wIYFbCs24ovAqZhDo
	 TkEYsDniTOsrSaNtXo8BRYJ2MYwz0jJAHNg7RbxidrglL1PDqwZQznRjBJzfr6JLTA
	 +TYSmxg0viwRUGEeXpCWUt09PK1BSqF3jRW/mnWY6zPgPFA/BNzMrr6rdzFkzwEnJQ
	 KZd7NQaw5tPTQ==
Date: Sat, 17 Oct 2026 18:34:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH 2/4] soc: qcom: llcc: add LCP/SRP DDR DRAM ECC register
 offsets
Message-ID: <20261017-spiffy-shapeless-caiman-d658a6@quoll>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-master-v1-2-aba3cfcfbac9@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 09:26:17PM +0530, Faiyaz Mohammed wrote:
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
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 45 ++++++++++++++++++++++++++++++++++++--
>  include/linux/soc/qcom/llcc-qcom.h | 13 +++++++++++
>  2 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index d7a42a8040a1..39e0da14b36d 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -4509,6 +4509,41 @@ static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
>  	.drp_ecc_db_err_syn0 = 0x52120,
>  };
>  
> +static const struct llcc_edac_reg_offset llcc_lcp_srp_edac_reg_offset = {
> +	.trp_ecc_error_status0 = 0x20344,
> +	.trp_ecc_error_status1 = 0x20348,
> +	.trp_ecc_sb_err_syn0 = 0x2034c,
> +	.trp_ecc_db_err_syn0 = 0x20370,
> +	.trp_ecc_error_cntr_clear = 0x20440,
> +	.trp_interrupt_0_status = 0x20480,
> +	.trp_interrupt_0_clear = 0x20484,
> +	.trp_interrupt_0_enable = 0x20488,
> +
> +	/* LLCC Common registers */
> +	.cmn_status0 = 0x3400c,
> +	.cmn_interrupt_0_enable = 0x3401c,
> +	.cmn_interrupt_1_enable = 0x3402c,
> +	.cmn_interrupt_2_enable = 0x3403c,
> +
> +	/* LLCC DRP registers */
> +	.drp_ecc_error_cfg = 0x50000,
> +	.drp_ecc_error_cntr_clear = 0x50004,
> +	.drp_interrupt_status = 0x50020,
> +	.drp_interrupt_clear = 0x50028,
> +	.drp_interrupt_enable = 0x5002c,
> +	.drp_ecc_error_status0 = 0x520f4,
> +	.drp_ecc_error_status1 = 0x520f8,
> +	.drp_ecc_sb_err_syn0 = 0x520fc,
> +	.drp_ecc_db_err_syn0 = 0x52120,
> +
> +	/* LCP/SRP DDR DRAM ECC registers */
> +	.lcp_srp_ecc_error_cntr_clear = 0x59004,
> +	.lcp_srp_ecc_error_status1 = 0x59010,
> +	.lcp_srp_interrupt_status = 0x59070,
> +	.lcp_srp_interrupt_clear = 0x59074,
> +	.lcp_srp_interrupt_enable = 0x59078,
> +};
> +
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
> -
> +	if (cfg->edac_reg_offset && cfg->edac_reg_offset->lcp_srp_interrupt_enable) {
> +		drv_data->lcp_irq = platform_get_irq_optional(pdev, 1);

Why do you exactly require interrupt-names?

Best regards,
Krzysztof

