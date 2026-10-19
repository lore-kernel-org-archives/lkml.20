Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE028C009;
	Mon, 19 Oct 2026 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394335; cv=none; b=IQ2nHOl/wTfMSbOObhp0m1Dc43xKp2MM1cXTjoECzm+va87CbJm0eKce9bisEwHGOZEzy+LZzqImXu55NAtw40fj90APnJ3AXSIqxrjuMiU4EQjeC0rrJiNvTbjBM5Ybd/ojzcNz+S3prV1u5f7gB0yMPCbpY/NMEJizQG30UfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394335; c=relaxed/simple;
	bh=tFJep5aUKvNPz87Rwc3Qztw1PyN2kr8LlIEgthtejLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBALfoo78jiNRlkS8F7NCoNFuvU0FWs5M/v4QyvN5OHGutF8UcgyjYsm4TDTr+jVsCuW90vBRGNm+/1y/8iKxSTX4vLyqf5oQqGqxlPZZBRPY87RigEu+S+xqE+co3Xys4Y/faHcL/wDS49YSd9zS66vSgwvI9xGM8ytjCWMLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF2B815e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF2B815e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A1A1F000C4;
	Mon, 19 Oct 2026 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394333;
	bh=FpFYLEuv/mXXrF5wldjDzhbtiP+OUzmvIGx5zxg1Lso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WF2B815eYiTU3xMQGG9PDH559aNypUoocZ2ZAaP3MobHB2mB/bXlw+9K2zDYE7Evx
	 XuktHBjjmmTnJj6M9Cxh3urD2HhZLOh9ELNH86549nfSCCXMlrXAt5EKgDKa9C0vSn
	 60jTkI6qemu5yH8zBkCUfp71zA6lhSfpcXgaHVTga5PqTfuOJZMLwtiy+VAVD9G0dG
	 tjB4YaYREtEywALLNas5MAaZSKnndpeTtKzpZadMhqBGwC/rzKLCTyRykXIzbiBqzm
	 BGudqJpT22+IarMlCEAqyT2X6pOlZKzialt5k+4sS6PHHSx/meWlsiILr4Wtj2Yu/P
	 pFAYg51ii+Yfw==
Date: Mon, 19 Oct 2026 09:18:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	gjorgji.rosikopulos@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
	jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
Message-ID: <20261019-elastic-psychedelic-chamois-e8bbae@quoll>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>

On Fri, Oct 16, 2026 at 04:55:00PM -0700, Anusha Arun Nandi wrote:
> Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
> sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
> and SA8775P share the same CSIPHY: in the legacy in-tree
> CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
> cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
> and common_regs_offset (0x800), and camss.c gives both SoCs the same
> pd_name = "top" Titan Top GDSC. No new register data or power-domain
> wiring is therefore needed; only the compatible string is added.
> 
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index 821c6a0a916c..cef4a90ca539 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
> +	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },

So devices are fully compatible? Then express it and drop this.

Best regards,
Krzysztof

