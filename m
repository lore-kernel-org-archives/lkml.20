Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E12F7EE4;
	Fri, 11 Sep 2026 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104619; cv=none; b=rroZ25zuWzmlkNgbAzkwLtQd1jGuQoDysxUfwjHdtxGv/Ip7jPYyDFVCIaWTjMBL3D5woAVI7OdWe744/vtS4qgVNxxOCXLPzF/cKGDvj1bMgfdmxWBcBDKeUWR4rqFG8yiHRGtS+QUElTugW8efINbzYJHRNef2CIr08EJhdHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104619; c=relaxed/simple;
	bh=4LFLaPw7O5MpjhkCuraYK7DIvSTP5ruMTj1dpkq3oeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgHfneobdRzSJwlifh+eDj8RY1JQC8/+WwznZoucc8Aw8UgE19fz9JEnDNGTS+VC/Z7bJxqKWSCleCn5O5iLaw+LzxPW4VSY9r0mY6MKzD1hkIaTrDBSq1W00cUyzIKyLxo9c25PbvsbIpeFMmYYvvc1/55A87FaFd5TBiL/89E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbFWDbIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbFWDbIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3458D1F000FF;
	Fri, 11 Sep 2026 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104618;
	bh=aAEQkMu/TV7j/670viXKSJtglxVTRR7CotfrQlJUCTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbFWDbIisbjRFiHlu2iZqaRYMWR/Kyv8BYPftCIsnwEpJoHj0JgP3U7BMlJGAaG6a
	 n/NIdbfzbCkgQ9rqcgDq3bJwXU+ueoinu+6Ty2tgSLNrs8I78AqESEZBXNGhN63JTP
	 o+HEL5HF2hzQCqm1+hlcc4FqavuyLmYqXwiCoWrz+2R+PXjvaz0lhvjqeWSvb3tbn3
	 pv4s1d8O+YEY6H9MV82riiqDaHJ27WkzO46dg7ly+yeJjojWY72TjlZ8Jw+c23p+Ao
	 ytqCKLmtNMgzq29nFKA+xIpwwn3Xyt0p14vZrKH1b/zVaElidPbFsUnhJrCxS7fVQl
	 93oAC20F5oVmQ==
Date: Fri, 11 Sep 2026 07:30:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/9] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
Message-ID: <rtpmf4gfixtn3ka44reaurodo7fgsaj4amajklef22ersizweg@a2drblb654bv>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
 <20260908-glymur-phy-v3-v4-6-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-glymur-phy-v3-v4-6-ff22e5150538@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 07:30:59PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Extract the common DP PHY initialization sequence shared between
> qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
> qmp_combo_configure_dp_phy_common() function.
> 
> The common sequence covers:
> - Validation that dp_aux_cfg2 is configured for the platform
> - Writing dp_phy_cfg1 and dp_aux_cfg2 hardware-specific register values
> - Calling configure_dp_mode() for TypeC lane orientation
> - Programming AUX_CFG1, TX lane control registers
> - Invoking configure_dp_clocks() callback
> - PHY_CFG reset/enable sequence
> - Polling COM_C_READY_STATUS and COM_CMN_STATUS for PLL lock
> 
> Refactor qmp_v456_configure_dp_phy() to call the common function,
> removing the duplicated initialization code. Update
> qmp_v8_configure_dp_phy() to call qmp_combo_configure_dp_phy_common()
> directly instead of going through qmp_v456_configure_dp_phy().
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

One comment below. With that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 99 ++++++++++++++++++-------------
>  1 file changed, 59 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 0ec382aebe2b..79006469f3d4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3459,6 +3459,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v8_configure_dp_phy,
> +
>  	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
>  	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
>  	.dp_mode_ignore_reverse	= true,
> @@ -3766,6 +3767,62 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
>  	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
>  }
>  
> +static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	u32 status;
> +	int ret;
> +
> +	if (!cfg->dp_aux_cfg2) {
> +		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(cfg->dp_phy_cfg1, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
> +
> +	qmp_combo_configure_dp_mode(qmp);
> +
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	ret = qmp->cfg->configure_dp_clocks(qmp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
> +			status,
> +			((status & BIT(0)) > 0),
> +			500,
> +			10000))
> +		return -ETIMEDOUT;

Didn't I suggest that you should just return what readl_poll_timeout() returns? 

- Mani

-- 
மணிவண்ணன் சதாசிவம்
