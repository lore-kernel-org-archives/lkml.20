Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D3E330656;
	Wed,  9 Sep 2026 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974714; cv=none; b=cp9LWFH9FKdVmZ/Ch9YHJ0xtoyDfErgQWuxivsbcNODGdIRjvcDkgoHLgNc5o0ZnGoi1/psP+7z0jWnmk1x4899jo4nJs+Nq216uRxtBlYlgPcERu0yKM+Z5w/RogiVOATHmquCFzqBeC35EoVrj91NrkMXNt8hgR1I5O5r8Iho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974714; c=relaxed/simple;
	bh=5rFM+3004Q7764Q5ps3RoCHOL05xYse9OzbYlGtf5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvVBgtzRFG9guCrNgN83aq46bVQYsg75PzpKQMOjVV/32gALC1ENT9Y1fiiKvWdozbbHGJFpGGd1uAQDLQAHuinth+vzdX58i3xaqhdoPqQuigQ0EfZveymMoR1KCP/iY4B1xxoohYXbhbotTARlbcexCBd0k6QhTD+AgpWoqc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W24FkBl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W24FkBl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6531F000FF;
	Wed,  9 Sep 2026 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974713;
	bh=pGC6HZ9uyZkKy06/6NNUy5COxbIDi6w5V6zYh4L2LLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W24FkBl5KvkzxbniUTFT3e5LDRnH2G5w9A6DSLU8/IKFQ+F88esI3/gY6j3yyXHBL
	 Ow5Qw769UBFZHL1VJNQiWhbM1696eQYezkbX0FAXsfr58MoNhzdZd4mX11WCNid4PS
	 jzYTqa3JTTL4CA8rtD+m3Yvxj8KARVZ2wHhw75LI54IEUqtCq0V1A+eNe7DxjCfTqw
	 neS4N8WNEJePRmlY8NgblD2FuCKIq6ov8qVj4E/fpvUc6gLw7pKw9G5tYkdQBiQuH/
	 8rjDJwsDwvDF/LCbRXPHy2rClREH/ta27xO8Hj34IW50I5F2ml++zqMYSGGNLiKpV0
	 LeePmTnGMZ1PQ==
Date: Wed, 9 Sep 2026 19:25:03 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
Message-ID: <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>

On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the eDP PHY found in newer
> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
> data.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> index 4603f28d1466..f5aadc5fdc42 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
>   * @regs_ana_lane:  Register (layout) offsets for ana_lan
>   * @regs_dig_glb:   Register (layout) offsets for dig_glb
>   * @regs_dig_lane:  Register (layout) offsets for dig_lan
> + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
>   * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
>   * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
>   * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
> @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
>  	const u8 *regs_dig_glb;
>  	const u8 *regs_dig_lane;
>  
> +	/* Register masks */

Duplicate comment. With this removed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
