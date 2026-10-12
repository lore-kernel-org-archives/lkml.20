Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B755F3769F9;
	Mon, 12 Oct 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811160; cv=none; b=sDa4Dsq7ZInH+/THTciBPn9glbrrR6CBummFWLci/RkxO9J7zazmyNlWkrQ+QBURV6h83t2VQDSx9MVqVHwKWP6Wt4fWOdJyFLl4kiM8U/WCL87qOHJSokxmgEZw7mtFJoZw/OCi8xIxABlLjEmilQP1dhhr4kIUVaUTBGh7iPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811160; c=relaxed/simple;
	bh=pfyMjRuo5gK65y7V95drRwLw2b8/N7RrtiB4LiZB2j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2ICUuKEcqH9iY5NkBTJn4Wjd6gDBRTUK4i9FJ5fcj7gDDeikTwwYQb0qiUfKitampqs2Z+V4AHLzZNqmyxhH25INny/g0horeOp4E2fb7rIwKKHzKcenIUgO69wpiSapdsfu1z+rfy1qedBN/dndx9Lm4E/CEltxqaVvrULkik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRW6XwmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRW6XwmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4437E1F0089B;
	Mon, 12 Oct 2026 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791811159;
	bh=l8F4WlE83w/gzZrKmJrEQ/hWZM/K60nnEHKAMTgjHJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRW6XwmNU4pS1UBwDwmzH7Dj6icbWlkneHuKE1wfxjmsQYEqzhgsWMsjhg8rTWsWv
	 AUzRQfsMKXMmlx+METx2RDDHR0l71GYbo52W+t+LAmf04U/scU+gYQzVC/vP3xgKSO
	 2RnXaF5xfPen5CugsXtz3sFLD8uCAyejLSadFkTHHfhaTOffz4Ag0y/mjM8XuI30nj
	 +/8i/YmmC5VLWWn+wVthiR6FCv1jzmxw2rz7pxVZbEtwPTIL0nJ2PYhyCmyR4YQZq4
	 osYB/2VEOqpEaKr92HfGAwGADBQu043VEwmQU/4c+aSX31hYriWFo5+nVbzF6ozzF7
	 JOjsl5zN3oPUQ==
Date: Mon, 12 Oct 2026 18:49:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 09/17] phy: qcom: edp: Add Nord AUX channel and VCO
 divider configuration tables
Message-ID: <aszdt5JPfDYvMB__@debian>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 09:06:40PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires different AUX channel and VCO divider settings compared
> to existing SoCs.  Add edp_phy_aux_cfg_nord and edp_phy_vco_div_cfg_nord
> with values sourced from HPG Tables 2-1-a and 2-1-b respectively.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 373f13b3d6d5..ee0d7f1a90fe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1508,6 +1508,25 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> +/*
> + * nord AUX config (eDP mode).
> + * From HPG Table 2-1-a: edp_phy_aux_bist.csv
> + * Index:  0     1     2     3     4     5     6     7     8     9    10    11    12
> + */
> +static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
> +	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
> +};
> +
> +/*
> + * nord VCO_DIV config for eDP mode.
> + * From HPG Table 2-1-b AUX Clock Settings (eDP mode) - Nominal/Turbo column.
> + * Indices: [0]=1620, [1]=2700, [2]=5400, [3]=8100
> + */
> +static const u8 edp_phy_vco_div_cfg_nord[4] = {
> +	0x00, 0x00, 0x02, 0x01,
> +};
> +

From this patch onwards you are introducing -Wunused* warnings for each patch.
You *must not* do that.

If logical split is what you are aiming here, I can say that it isn't what you
are doing here.

Please group Nord SoC support in one patch and keep the preparatory patches
separate.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
