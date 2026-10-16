Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8065349CA;
	Fri, 16 Oct 2026 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171576; cv=none; b=SPfMTf/8bP9GVAWmPfogoMgKRl2GP4Kp1Z/5zChKqVsaB4lo7jWXCJ3c5c+SRG9+e2MjrDw8/PRMSiHgpguETjITb7ypaUt5DWLoWzwTJq0LJpTe5q1YcVmI5ZTbX4QeP219JV88xNv5D5BBfUh5S8eTBX1lW6bBw9UALxCFYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171576; c=relaxed/simple;
	bh=7/Ypo8HXoPhqe0tOudB/GpG79nEQuR+mWQGy9BzaOCI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYlkSMN23plX2XD7VSjyWE+s2a7fapuQK18Om+86pdV55HuUuGwPMhGoNZngwRyxSSH/lDmB09Te6Mht2DspWV3zsHqXMrpxCfN5EH5vVipxKF7urSQbAxcZ3OffXY1Di7TGfGfSXvwWij19sJ/+bT2hviJ52MA34quw0RusYuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+kL7cwR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+kL7cwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF65B1F000C4;
	Fri, 16 Oct 2026 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171575;
	bh=ds77SXosasjtMVQTiI+LOMaZdzFU2/HluRX2Mznn/fE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=d+kL7cwR5U1A+HE8FSFooseFBDTkfzAE6Fnf5OMHk1apxjLszudLlwZJ9QCmz9cqt
	 1GRUux95OYIyByMntRs5NeR0hvR5tqaptfdjkBRxmKxFCxpoz58prj4OcaCVjeGIis
	 qOsD/ichywzR8r0NtQ0T2F1fHJx19sM6a+5JJgSVyQQx7MoLT8zv419ezq6jRYds1r
	 PHkFC+EMvDBRUD1hMMpbve83N0VdzWV7cd5fsgabVvlXvEwICdMDaJZD7jAgj8AywX
	 WKi4knJnoDNmXT2VgCTwuezNOdoeQYaME7P0CVnrdrLfeSSzcfFiN/6p7zWwoPB0u/
	 Ddprk6r1FUN1w==
Date: Fri, 16 Oct 2026 18:26:08 +0100
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
Subject: Re: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
Message-ID: <20261016182608.65bae12d@jic23-hlaptop>
In-Reply-To: <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
	<20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 21:26:18 +0530
Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:

> Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
> firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
> report per-bank correctable and uncorrectable DDR DRAM ECC errors.
> 
> LCP/SRP setup is skipped when ecc_irq_configured is set (e.g. Shikra,
> where DSF firmware handles IRQ routing). A missing lcp_irq is
> non-fatal; TRP/DRP ECC reporting continues unaffected.
> 
> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Trivial stuff only inline.

> ---
>  drivers/edac/qcom_edac.c | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
> 
> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> index f3da9385ca0d..b4f7b2493650 100644
> --- a/drivers/edac/qcom_edac.c
> +++ b/drivers/edac/qcom_edac.c

>  /* Clear the error interrupt and counter registers */
>  static int
>  qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
> @@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
>  	llcc_ecc_irq_handler(0, edev_ctl);
>  }
>  
> +/*
> + * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
> + * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
> + * instance's address space, so iterate over all banks and read status
> + * per-instance.  Broadcast-write the clear after the full loop, mirroring
> + * the TRP/DRP handler pattern.
> + */
> +static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
> +{
> +	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
> +	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
> +	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
> +	irqreturn_t irq_rc = IRQ_NONE;
> +	u32 intr_status, err_status, clr_reg;
> +	int i, ret;
> +
> +	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
> +	for (i = 0; i < drv->num_banks; i++) {
	for (int i = 0;

Fine in modern kernel code and makes scope more explicit.

> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,

I'd use a local variable to hold the regmap pointer.

> +				  &intr_status);
> +		if (ret)

A read fail, without any logging seems unwise as you may have just jumped the
error. 

> +			continue;
> +
> +		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
> +		if (!intr_status)
> +			continue;
> +
> +		irq_rc = IRQ_HANDLED;
> +
> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
> +				  &err_status);
> +		if (ret) {
> +			edac_printk(KERN_ERR, EDAC_LLCC,
> +				    "LCP/SRP error status read failed for bank%u: %d\n",
> +				    i, ret);
> +			continue;
> +		}
> +
> +		if (intr_status & LCP_DB_ECC_ERROR) {
> +			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
> +
> +			edac_printk(KERN_CRIT, EDAC_LLCC,
> +				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
> +				    i, db_cnt, err_status);
> +			edac_device_handle_ue(edac_dev_ctl, 0, i,
> +					      "LCP/SRP DDR DRAM uncorrectable error");
> +		}
> +
> +		if (intr_status & LCP_SB_ECC_ERROR) {
> +			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
> +
> +			edac_printk(KERN_WARNING, EDAC_LLCC,
> +				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
> +				    i, sb_cnt, err_status);
> +			edac_device_handle_ce(edac_dev_ctl, 0, i,
> +					      "LCP/SRP DDR DRAM correctable error");
> +		}
> +	}
> +
> +	if (irq_rc != IRQ_HANDLED)
> +		return irq_rc;
> +
> +	clr_reg = reg->lcp_srp_interrupt_clear ?
> +			reg->lcp_srp_interrupt_clear :
> +			reg->lcp_srp_interrupt_status;
> +
> +	if (clr_reg) {
> +		ret = regmap_write(drv->bcast_regmap, clr_reg,
> +				   LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR);
> +		if (ret)
> +			edac_printk(KERN_ERR, EDAC_LLCC,
> +				    "LCP/SRP interrupt clear failed: %d\n", ret);
> +	}
> +
> +	if (reg->lcp_srp_ecc_error_cntr_clear) {
> +		ret = regmap_write(drv->bcast_regmap,
> +				   reg->lcp_srp_ecc_error_cntr_clear,
> +				   DRP_TRP_CNT_CLEAR);
> +		if (ret)
> +			edac_printk(KERN_ERR, EDAC_LLCC,
> +				    "LCP/SRP counter clear failed: %d\n", ret);
> +	}
> +
> +	return irq_rc;
> +}
> +
>  static int qcom_llcc_edac_probe(struct platform_device *pdev)
>  {
>  	struct llcc_drv_data *llcc_driv_data = pdev->dev.platform_data;
> @@ -372,6 +490,8 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>  			edac_op_state = EDAC_OPSTATE_INT;
>  			goto irq_done;
>  		}
> +		dev_warn(dev, "failed to request LLCC ECC irq %d: %d, falling back to polling\n",
> +			 ecc_irq, rc);
>  	}
>  
>  	/* Fall back to polling mode otherwise */
> @@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>  		return rc;
>  	}
>  
> +	/*
> +	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
> +	 * Skip hardware routing setup if firmware already configured IRQ
> +	 * propagation (irq_configured); only request the IRQ handler.
> +	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
> +	 * this LLCC variant actually has an LCP/SRP block.
> +	 */
> +	if (llcc_driv_data->lcp_irq > 0 &&
> +	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
> +		if (!llcc_driv_data->ecc_irq_configured) {
> +			rc = qcom_llcc_lcp_setup(llcc_driv_data,
> +						 llcc_driv_data->bcast_regmap);
> +			if (rc) {
> +				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);

> +				goto lcp_done;
> +			}
> +		}
> +		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
> +				      llcc_lcp_ecc_irq_handler,
> +				      0, "llcc_lcp_ecc", edev_ctl);
> +		if (rc)
> +			dev_warn(dev,
> +				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
> +				 llcc_driv_data->lcp_irq, rc);
> +	}
> +lcp_done:
> +	rc = 0;
>  	platform_set_drvdata(pdev, edev_ctl);
>  
>  	return rc;
> 

