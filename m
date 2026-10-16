Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE43B6C15;
	Fri, 16 Oct 2026 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149339; cv=none; b=EHjXAFltbC1XTJpUGPJVNj0uQXwylp410V+8xGEatQpbqtHlk8M++aKkHCzZ95d8ZbpDeNIK+QsjmYmIG/FaWVr57iTJTQ/Y2ZAzMI/89ZBuEGkadkSvqfebmy4EKMd32z/DmFin4k/JBFf0jTWnTO0INzszzrui17FHycXhnPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149339; c=relaxed/simple;
	bh=ZeraoPhZ4i01B3BTWwIttij1IkZbtWHw1b3zuJ2WSUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIQS9BVYk3X5uNa0k7IsD/AWrhn++lw4pB8Jc2UZdEgTkPUUk88bMknGw0/Md/DeDM/kcCXenVaFzqQqvTYfL1KHzrIB5dpX7omgTKz0eteyg3jCmMY9p5pZ8snX+RQQHLv1/2+DCqlIDBoYClJIzsyU97aAAHleVRvGLtEmmVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/8bnX9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/8bnX9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C78C1F000C4;
	Fri, 16 Oct 2026 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792149336;
	bh=5qVf8hwx8FU5X+R8x4dVr0b9V03VbaOtKH+D8Kks6wE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I/8bnX9wckZXpj6PBWou2bO4R61SfIGS8MWfPt9DVmAMtFRSi0JBvfOa8KtuU1ERU
	 NGgLW6BKO9S15evXX3qv38RZu2dL6qdkm61QBfOQ16/ziAb3c4qgHrbXNNfLqlkc+h
	 f4oAOsWpcLybwpNkDbptHppqtfuTRYZI3hp8/yPz3RQEqX7zQmWdv2lyUQ6/07poEJ
	 AOyIR34EYeWYWNG1GSLaJpCBIMslAxCU9l1GeawuZJpQbfGWfO4DK41Xz8asW62hOq
	 dGOyC/USm6ij43N3ycA+hB1o05N00m8XNGJDAv0Rs+tpUI5NE7+tNvYc3/i39rm9bV
	 oISM4Pp/FXnoQ==
Message-ID: <85393f60-d89a-4e31-b398-722e5414fe58@kernel.org>
Date: Fri, 16 Oct 2026 12:15:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <qJpjvnDtJqkgJx1kJIaijnXRw1SULyg1z03l2qGE60n0pz2m2Jr1hzFgXy6Ckyul3Jh76LgBywOejAALyl0uKg==@protonmail.internalid>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2026 11:57, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The CSI2 PHY schema already allows bus-type C-PHY, but the driver
> rejects it. Accept it on SoCs that provide a C-PHY sequence, with up to
> three trios and no lane polarities. The endpoint's bus-type now sets the
> PHY mode, set_mode() only accepts that mode, and in C-PHY mode
> configure() takes the symbol rate and keeps the matching link frequency,
> so clock scaling works as for D-PHY.
> 
> lanes_enable() picks the sequence for the mode and is split into
> helpers: the CTRL5 lane mask, where the trios are the odd bits and the
> D-PHY data lanes the even ones plus the clock bit, and the D-PHY lane
> polarities. The settle count is computed in both modes. With a C-PHY
> link frequency of half the symbol rate, the unit interval in the
> existing formula is one symbol, which is also how David Heidelberg's
> CAMSS C-PHY series computes it. Sequence delays now use fsleep(), as
> the C-PHY sequence waits 3 ms after its reset exit.
> 
> The X1E80100 sequence is Qualcomm's for the v2.1.2 3PH PHY at 2.5 Gsps,
> taken from the downstream camera driver's GPL-2.0
> cam_csiphy_2_1_2_hwreg.h (csiphy_3ph_v2_1_2_reg, datarate_212_2p5Gsps
> and the 3PH reset exit), as the D-PHY sequence above it is. Its three
> settle count entries are the ones downstream marks as such.
> 
> Tested on the Surface Pro 11 (X1E80100) with an IMX681 on CSIPHY2, one
> trio at 2.4 Gsym/s, and raw capture through CSID1 and an RDI interface,
> with David's CAMSS C-PHY series and two CAMSS patches on top:
> 3844x2640 at 30 fps, and the sensor's colour bars are byte-identical to
> the same pattern captured with an out-of-tree driver. The timer runs at
> 400 MHz and the computed settle count is 28; forcing anything from 6 to
> 48 gives the same frames. D-PHY is unchanged: an OV13858 on CSIPHY1
> over four lanes streams at 29.9 fps with the same settle count as
> before.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 216 ++++++++++++++++++---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  53 ++++-
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
>   3 files changed, 242 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index b2d4ec3e8..39e48e7ac 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -161,6 +161,137 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>   	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>   };
> 
> +/* Qualcomm's 2.5 Gsps settings, from the GPL-2.0 cam_csiphy_2_1_2_hwreg.h */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_v2_1_2_cphy[] = {
> +	/* Power up lanes 3ph mode */
> +	{.reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	/* datarate_212_2p5Gsps: AFE settings */
> +	{.reg_addr = 0x0268, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0294, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0288, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0278, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x026c, .reg_data = 0x3d, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x028c, .reg_data = 0x30, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0270, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0274, .reg_data = 0x03, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	{.reg_addr = 0x0668, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0694, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0688, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0678, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x066c, .reg_data = 0x3d, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x068c, .reg_data = 0x30, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0670, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0674, .reg_data = 0x03, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	{.reg_addr = 0x0a68, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a94, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a88, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a78, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a6c, .reg_data = 0x3d, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a8c, .reg_data = 0x30, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a70, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a74, .reg_data = 0x03, .delay_us = 10, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	/* csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x02f4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02f8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02fc, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x02f0, .reg_data = 0xef, .delay_us = 3, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	{.reg_addr = 0x06f4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06f8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06fc, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06f0, .reg_data = 0xef, .delay_us = 3, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	{.reg_addr = 0x0af4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0af8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0afc, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0af0, .reg_data = 0xef, .delay_us = 3, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x020c, .reg_data = 0x22, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
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
> +
> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x060c, .reg_data = 0x22, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
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
> +
> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x0a0c, .reg_data = 0x22, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
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
> +
> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   static inline const struct mipi_csi2phy_device_regs *
>   csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
>   {
> @@ -246,9 +377,18 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>   				     u8 settle_cnt)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> -	const struct mipi_csi2phy_lane_regs *r = regs->dphy_init_seq;
> -	int i, array_size = regs->dphy_lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *r;
> +	int array_size;
>   	u32 val;
> +	int i;
> +
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY) {
> +		r = regs->cphy_init_seq;
> +		array_size = regs->cphy_lane_array_size;
> +	} else {
> +		r = regs->dphy_init_seq;
> +		array_size = regs->dphy_lane_array_size;
> +	}
> 
>   	for (i = 0; i < array_size; i++, r++) {
>   		switch (r->param_type) {
> @@ -264,38 +404,41 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>   		}
>   		writel(val, csi2phy->base + r->reg_addr);
>   		if (r->delay_us)
> -			udelay(r->delay_us);
> +			fsleep(r->delay_us);

Here's one that is trying to sneak in under the radar.

A change like this needs a distinct patch with a description why instead 
of inlined in a "make CPHY work" patch.

A delay is a delay is a delay - changing the nature of that delay is a 
functional change in itself which is ! a CPHY thing.

>   	}
>   }
> 
> -static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
> -					   struct mipi_csi2phy_stream_cfg *cfg)
> +/*
> + * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> + * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> + * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> + * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> + */
> +static u8 phy_qcom_mipi_csi2_lane_mask(struct mipi_csi2phy_device *csi2phy,
> +				       struct mipi_csi2phy_stream_cfg *cfg)
>   {
> -	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>   	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> -	u8 settle_cnt;
> -	u8 val;
> +	u8 lane_mask = 0;
> +	u8 offset = 0;
>   	int i;
> 
> -	if (cfg->link_freq <= 0)
> -		return -EINVAL;
> -
> -	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
> -	if (!settle_cnt)
> -		return -ENODEV;

To make the decomposition more readable, please bundle the deomp into 
its own precursor patch "add helper function x"

> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY)
> +		offset = 1;
> +	else
> +		lane_mask = BIT(lane_cfg->clk.pos);
> 
> -	/*
> -	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
> -	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
> -	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
> -	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
> -	 */
> -	val = BIT(lane_cfg->clk.pos);
>   	for (i = 0; i < cfg->num_data_lanes; i++)
> -		val |= BIT(lane_cfg->data[i].pos * 2);
> +		lane_mask |= BIT(lane_cfg->data[i].pos * 2 + offset);
> 
> -	writel(val, csi2phy->base +
> -	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +	return lane_mask;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_dphy_lane_polarities(struct mipi_csi2phy_device *csi2phy,
> +					struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> +	int i;
> 
>   	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
>   	for (i = 0; i < cfg->num_data_lanes; i++) {
> @@ -308,6 +451,29 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
> 
>   	if (lane_cfg->clk.pol)
>   		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
> +}
> +
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
> +					   struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> +	u8 settle_cnt;
> +	u8 val;
> +	int i;
> +
> +	if (cfg->link_freq <= 0)
> +		return -EINVAL;
> +
> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
> +	if (!settle_cnt)
> +		return -ENODEV;
> +
> +	val = phy_qcom_mipi_csi2_lane_mask(csi2phy, cfg);
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY)
> +		phy_qcom_mipi_csi2_dphy_lane_polarities(csi2phy, cfg);
> 
>   	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>   	writel(val, csi2phy->base +
> @@ -374,6 +540,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   	.reg_info = {
>   		.dphy_init_seq = lane_regs_x1e80100,
>   		.dphy_lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.cphy_init_seq = lane_regs_v2_1_2_cphy,
> +		.cphy_lane_array_size = ARRAY_SIZE(lane_regs_v2_1_2_cphy),
>   		.common_regs_offset = 0x1000,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20e..1185561a1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -96,6 +96,25 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>   	return ret;
>   }
> 
> +static int
> +phy_qcom_mipi_csi2_configure_cphy(struct mipi_csi2phy_device *csi2phy,
> +				  struct phy_configure_opts_mipi_cphy *cphy_cfg)
> +{
> +	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
> +	int ret;
> +
> +	ret = phy_mipi_cphy_config_validate(cphy_cfg);
> +	if (ret)
> +		return ret;
> +
> +	if (cphy_cfg->trios != stream_cfg->num_data_lanes)
> +		return -EINVAL;
> +
> +	stream_cfg->link_freq = phy_mipi_cphy_link_freq(cphy_cfg);
> +
> +	return 0;
> +}
> +
>   static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>   					union phy_configure_opts *opts)
>   {
> @@ -104,6 +123,9 @@ static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>   	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>   	int ret;
> 
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY)
> +		return phy_qcom_mipi_csi2_configure_cphy(csi2phy, &opts->mipi_cphy);
> +
>   	ret = phy_mipi_dphy_config_validate(dphy_cfg);
>   	if (ret)
>   		return ret;
> @@ -124,10 +146,13 @@ static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
>   {
>   	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> 
> -	if (mode != PHY_MODE_MIPI_DPHY)
> +	if (mode != PHY_MODE_MIPI_DPHY && mode != PHY_MODE_MIPI_CPHY)
>   		return -EOPNOTSUPP;
> 
> -	csi2phy->phy_mode = mode;
> +	/* The endpoint's bus-type sets the mode; only that one is accepted. */
> +	if (mode != csi2phy->phy_mode)
> +		return -EINVAL;
> +
>   	return 0;
>   }
> 
> @@ -258,6 +283,7 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	struct fwnode_handle *ep;
>   	int num_polarities;
>   	int num_data_lanes;
> +	int max_lanes;
>   	u32 bus_type;
>   	int i, ret;
> 
> @@ -278,14 +304,26 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	bus_type = MEDIA_BUS_TYPE_CSI2_DPHY;
>   	fwnode_property_read_u32(ep, "bus-type", &bus_type);
> 
> -	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
> +	switch (bus_type) {
> +	case MEDIA_BUS_TYPE_CSI2_DPHY:
> +		csi2phy->phy_mode = PHY_MODE_MIPI_DPHY;
> +		max_lanes = CSI2_MAX_DATA_LANES;
> +		break;
> +	case MEDIA_BUS_TYPE_CSI2_CPHY:
> +		if (csi2phy->soc_cfg->reg_info.cphy_init_seq) {
> +			csi2phy->phy_mode = PHY_MODE_MIPI_CPHY;
> +			max_lanes = PHY_MIPI_CPHY_MAX_TRIOS;
> +			break;
> +		}
> +		fallthrough;
> +	default:
>   		ret = -EOPNOTSUPP;
>   		dev_err(dev, "Unsupported bus-type %u\n", bus_type);
>   		goto out_put;
>   	}
> 
>   	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> -	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +	if (num_data_lanes < 1 || num_data_lanes > max_lanes) {
>   		ret = -EINVAL;
>   		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
>   		goto out_put;
> @@ -302,6 +340,11 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
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
> @@ -322,7 +365,7 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> 
>   	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> -		if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
> +		if (data_lanes[i] < 1 || data_lanes[i] > max_lanes) {
>   			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>   			ret = -EINVAL;
>   			goto out_put;
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 0d6031a4d..f49f334fd 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -50,6 +50,8 @@ struct mipi_csi2phy_lane_regs {
>   struct mipi_csi2phy_device_regs {
>   	const struct mipi_csi2phy_lane_regs *dphy_init_seq;
>   	const int dphy_lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *cphy_init_seq;
> +	const int cphy_lane_array_size;
>   	const u32 common_regs_offset;
>   };
> 
> 
> --
> 2.53.0

