Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772545C6FC;
	Fri, 16 Oct 2026 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143004; cv=none; b=Uv5KXicgKAUBH8Gp2GdjOg1BkUB8J/EmfSW3nQWGzGjA3KCyd/k44KoQh62VM9i1C5N1SlJobtom87VP+GS25Eowqs07/CQhou4wxWy9PYCvdOoE1IY29c1GghA6+P0fxnxtGblKBNRvzqaZKEyBqKlsgIAH8rnADNJ/kQJuDRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143004; c=relaxed/simple;
	bh=a/0j1jiwNMhEbBPgTKlSn3WNTcfYRdc5fc4otmnxSgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBBFRyE8boAiZyJ9/XzGlsvZrkhvBbFCTQ5UFF5FMFjvTRY3O+Z7ypO5P7OU8uBqc1SOxSgzogs39ed4qo1fqIZ734+BFxqHIOIF78Q86zIGw4N5W9HJoNx86c3emBu90QCXa3NOwZhD3rSMEVxDIdNdBp6Zhp6+9M9VT9WorGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPcmQZSd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPcmQZSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944EA1F000C5;
	Fri, 16 Oct 2026 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792143001;
	bh=nOfeJyFBL+jO8PhfQZZrGFIuipv72Pg53az+ypV+4g0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oPcmQZSdJvT6M6S5iMzP9acmqwysyNMHnAPhKidwpHgUJhBqGZ6XiCa3ZgnWFgHvv
	 1bGDD4ddcnOO5+DQHcgBjJswlQw73AWi2eDDS+GgWg7INxC76FWxiMe9vGPRhgJ/RO
	 Nt/sOdfXB+TmSSQykvdOkJA3lJqdUp7ctXovsjnoDcxavkeWrBc+uOGNoFGfWUwAiU
	 4a/7s7/MgFP2qg0urxX3F6aWSWzExdANkRVerTMsiV6pKoBeYYQI0P7MA+cO75JWTe
	 6UpKD+Fkh7pqdcylLRnGf5gHcG6sRG2JwB5ibDLf2OtqBE7I9h88KnAybea23K1mT1
	 kp8C8hHWMl9xw==
Message-ID: <7aed254e-18c5-481b-a77f-576944fff1d4@kernel.org>
Date: Fri, 16 Oct 2026 10:29:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
 <sc6h52UubEDyznKtmARMCx0ViGdFyPhYOw_Tyw6iS2WQgiThjlICuhLGtrUjS1AbG2hxyMgYFiBzopKxAr2vkA==@protonmail.internalid>
 <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2026 23:20, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The CSI2 PHY schema already allows bus-type C-PHY, but the driver
> rejects it. Accept it on SoCs that provide a C-PHY sequence: up to three
> trios and no lane polarities, and set_mode() has to ask for the mode the
> endpoint describes. In C-PHY mode, configure() takes the symbol rate.
> lanes_enable() powers up the trios on the odd CTRL5 bits and writes the
> C-PHY sequence, which carries its own timing, so no settle count is
> computed.
> 
> The X1E80100 sequence is Qualcomm's for the v2.1.2 3PH PHY at 2.5 Gsps,
> taken from the downstream camera driver's GPL-2.0
> cam_csiphy_2_1_2_hwreg.h (csiphy_3ph_v2_1_2_reg, datarate_212_2p5Gsps
> and the 3PH reset exit), as the D-PHY sequence above it is.
> 
> Tested on the Surface Pro 11 (X1E80100) with an IMX681 on CSIPHY2, one
> trio at 2.4 Gsym/s, and raw capture through CSID1 and an RDI interface:
> 3844x2640 at 30.01 fps, and the sensor's colour bars are byte-identical
> to the same pattern captured with an out-of-tree driver. D-PHY is
> unchanged: an OV13858 on CSIPHY1 over four lanes streams at 29.9 fps.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 151 ++++++++++++++++++++-
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  49 ++++++-
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   4 +
>   3 files changed, 197 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98..e758b6755 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -6,6 +6,7 @@
>    * Copyright (C) 2016-2026 Linaro Ltd.
>    */
> 
> +#include <dt-bindings/media/video-interfaces.h>

This is the first place your patch doesn't apply.

>   #include <linux/delay.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> @@ -161,6 +162,131 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>   	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>   };
> 
> +/*
> + * 4nm 3PH v2.1.2 C-PHY, 2.5 Gsps, from Qualcomm's GPL-2.0 camera driver
> + * (cam_csiphy_2_1_2_hwreg.h: csiphy_3ph_v2_1_2_reg[], datarate_212_2p5Gsps[]
> + * and the 3PH reset-exit write), one trio block per lane triplet.
> + */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100_cphy[] = {
> +	/* Power up lanes 3ph mode */
> +	{.reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* datarate_212_2p5Gsps: AFE settings */
> +	{.reg_addr = 0x0268, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0294, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0288, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0278, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x026c, .reg_data = 0x3d, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x028c, .reg_data = 0x30, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0270, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0274, .reg_data = 0x03, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0668, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0694, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0688, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0678, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x066c, .reg_data = 0x3d, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x068c, .reg_data = 0x30, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0670, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0674, .reg_data = 0x03, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a68, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a94, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a88, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a78, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a6c, .reg_data = 0x3d, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a8c, .reg_data = 0x30, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a70, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a74, .reg_data = 0x03, .delay_us = 10, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x02f4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02f8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02fc, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02f0, .reg_data = 0xef, .delay_us = 3, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06f4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06f8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06fc, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06f0, .reg_data = 0xef, .delay_us = 3, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0af4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0af8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0afc, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0af0, .reg_data = 0xef, .delay_us = 3, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x020c, .reg_data = 0x22, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0208, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0210, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0214, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0204, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02e4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02e8, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02ec, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0218, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x021c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0220, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0224, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0228, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x022c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0264, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0244, .reg_data = 0xb2, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0310, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02bc, .reg_data = 0xd0, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0254, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0240, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0260, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0284, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0290, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x060c, .reg_data = 0x22, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0608, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0610, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0614, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0604, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06e4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06e8, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06ec, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0618, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x061c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0620, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0624, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0628, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x062c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0664, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0644, .reg_data = 0xb2, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0710, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06bc, .reg_data = 0xd0, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0654, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0640, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0660, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0684, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0690, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x0a0c, .reg_data = 0x22, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a08, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a10, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a14, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a04, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ae4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ae8, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0aec, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a18, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a1c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a20, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a24, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a28, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a2c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a64, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a44, .reg_data = 0xb2, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b10, .reg_data = 0x35, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0abc, .reg_data = 0xd0, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a54, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a40, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a60, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   static inline const struct mipi_csi2phy_device_regs *
>   csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
>   {
> @@ -246,8 +372,11 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>   				     u8 settle_cnt)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> -	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
> -	int i, array_size = regs->lane_array_size;
> +	const bool cphy = csi2phy->bus_type == MEDIA_BUS_TYPE_CSI2_CPHY;
> +	const struct mipi_csi2phy_lane_regs *r = cphy ? regs->cphy_init_seq :
> +								regs->init_seq;

This hurts my eyes to read - just derive the pointer below with an if/else

> +	int i, array_size = cphy ? regs->cphy_lane_array_size :
> +				   regs->lane_array_size;

No declare the array_size on its own line and then calculate it.

>   	u32 val;
> 
>   	for (i = 0; i < array_size; i++, r++) {
> @@ -273,13 +402,26 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>   	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> -	u8 settle_cnt;
> +	const bool cphy = csi2phy->bus_type == MEDIA_BUS_TYPE_CSI2_CPHY;
> +	u8 settle_cnt = 0;
>   	u8 val;
>   	int i;
> 
>   	if (cfg->link_freq <= 0)
>   		return -EINVAL;
> 
> +	if (cphy) {
> +		/* The C-PHY sequence carries its own timing; trios are the odd bits. */
> +		val = 0;
> +		for (i = 0; i < cfg->num_data_lanes; i++)
> +			val |= BIT(lane_cfg->data[i].pos * 2 + 1);
> +
> +		writel(val, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +		goto common;

no gotos for this.

Functional decomposition please.

> +	}
> +
>   	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>   	if (!settle_cnt)
>   		return -ENODEV;
> @@ -309,6 +451,7 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>   	if (lane_cfg->clk.pol)
>   		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
> 
> +common:
>   	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>   	writel(val, csi2phy->base +
>   	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> @@ -374,6 +517,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   	.reg_info = {
>   		.init_seq = lane_regs_x1e80100,
>   		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.cphy_init_seq = lane_regs_x1e80100_cphy,
> +		.cphy_lane_array_size = ARRAY_SIZE(lane_regs_x1e80100_cphy),

haveing "init_seq" and then "cphy_init_seq" is discordant naming.

>   		.common_regs_offset = 0x1000,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20e..892c3da55 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -104,6 +104,19 @@ static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>   	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>   	int ret;
> 
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY) {
> +		struct phy_configure_opts_mipi_cphy *cphy_cfg = &opts->mipi_cphy;
> +
> +		if (!cphy_cfg->symbol_rate ||
> +		    cphy_cfg->lanes != stream_cfg->num_data_lanes)
> +			return -EINVAL;
> +
> +		/* As for V4L2, a C-PHY link frequency is half the symbol rate. */
> +		stream_cfg->link_freq = cphy_cfg->symbol_rate / 2;

Just use the helper.

> +
> +		return 0;
> +	}
> +
>   	ret = phy_mipi_dphy_config_validate(dphy_cfg);
>   	if (ret)
>   		return ret;
> @@ -124,8 +137,19 @@ static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
>   {
>   	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> 
> -	if (mode != PHY_MODE_MIPI_DPHY)
> +	/* The mode has to be the bus the endpoint describes. */
> +	switch (mode) {
> +	case PHY_MODE_MIPI_DPHY:
> +		if (csi2phy->bus_type != MEDIA_BUS_TYPE_CSI2_DPHY)
> +			return -EINVAL;
> +		break;
> +	case PHY_MODE_MIPI_CPHY:
> +		if (csi2phy->bus_type != MEDIA_BUS_TYPE_CSI2_CPHY)
> +			return -EINVAL;
> +		break;
> +	default:
>   		return -EOPNOTSUPP;
> +	}
> 
>   	csi2phy->phy_mode = mode;
>   	return 0;
> @@ -258,6 +282,7 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	struct fwnode_handle *ep;
>   	int num_polarities;
>   	int num_data_lanes;
> +	int max_lanes;
>   	u32 bus_type;
>   	int i, ret;
> 
> @@ -278,14 +303,25 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	bus_type = MEDIA_BUS_TYPE_CSI2_DPHY;
>   	fwnode_property_read_u32(ep, "bus-type", &bus_type);
> 
> -	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
> +	switch (bus_type) {
> +	case MEDIA_BUS_TYPE_CSI2_DPHY:
> +		max_lanes = CSI2_MAX_DATA_LANES;
> +		break;
> +	case MEDIA_BUS_TYPE_CSI2_CPHY:
> +		if (csi2phy->soc_cfg->reg_info.cphy_init_seq) {
> +			max_lanes = CSI2_MAX_TRIOS;
> +			break;
> +		}
> +		fallthrough;
> +	default:
>   		ret = -EOPNOTSUPP;
>   		dev_err(dev, "Unsupported bus-type %u\n", bus_type);
>   		goto out_put;
>   	}
> +	csi2phy->bus_type = bus_type;
> 
>   	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> -	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +	if (num_data_lanes < 1 || num_data_lanes > max_lanes) {
>   		ret = -EINVAL;
>   		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
>   		goto out_put;
> @@ -302,6 +338,11 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	/* lane-polarities: optional, up to num_data_lanes + 1 entries */
>   	memset(lane_polarities, 0x00, sizeof(lane_polarities));
>   	num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
> +	if (num_polarities > 0 && bus_type == MEDIA_BUS_TYPE_CSI2_CPHY) {
> +		ret = -EINVAL;
> +		dev_err(dev, "lane-polarities do not apply to C-PHY\n");
> +		goto out_put;
> +	}
>   	if (num_polarities > 0) {
>   		if (num_polarities != stream_cfg->num_data_lanes + 1) {
>   			ret = -EINVAL;
> @@ -322,7 +363,7 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> 
>   	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> -		if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
> +		if (data_lanes[i] < 1 || data_lanes[i] > max_lanes) {
>   			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>   			ret = -EINVAL;
>   			goto out_put;
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007..442c4d6fe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -11,6 +11,7 @@
>   #include <linux/phy/phy.h>
> 
>   #define CSI2_MAX_DATA_LANES	4
> +#define CSI2_MAX_TRIOS		3
>   #define CSI2_DEFAULT_CLK_LANE	7
> 
>   struct mipi_csi2phy_lane {
> @@ -50,6 +51,8 @@ struct mipi_csi2phy_lane_regs {
>   struct mipi_csi2phy_device_regs {
>   	const struct mipi_csi2phy_lane_regs *init_seq;
>   	const int lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *cphy_init_seq;
> +	const int cphy_lane_array_size;
>   	const u32 common_regs_offset;
>   };
> 
> @@ -75,6 +78,7 @@ struct mipi_csi2phy_soc_cfg {
>   struct mipi_csi2phy_device {
>   	struct device *dev;
>   	u8 phy_mode;
> +	u32 bus_type;
> 
>   	struct phy *phy;
>   	void __iomem *base;
> 
> --
> 2.53.0

