Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186033;
	b=a5pLmLAF7zNst4yNH8kM/wUGwZVNX/eytKF81GVaptLSqKjXdT/30EhgX6JF8B+mHnwK
	 al/UY13oz0fUyLNt3bAD0hHNmTayqZuitMlaTW0vf7YVtWWrKTPg42przJrlV5UbcfMhl
	 nGGQYCsX01lB6+3HhlyeTw1sQWwXagNB39rTvqWM1z/TeQ1ZUJGT1GRQZmViloCLWYhgI
	 GHWaERMSfcriRWt8XCb+eSHuPI+mgQs9OwvHWpCBipOWHAI3FKrS8UiFXDfwiNHkfQUjR
	 Ysm5jUlaQogXPFV1l1Wt7mghjjTFuXusQgQttw3vpK7YCEm4BmXIqSvpXi3mEhQA3EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186033;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=F5Zte+8AHYgNHGdRO053wS8pXJCV78zgJQHjS+bvvIg=;
	b=JpcyY42g91vz313/4I+bzfe5bALxNCIUVCfNKUhk+crdWAiNYTh7e/HYx+EFx2IQxRhN
	 gQAdRza+utI2Ki8AsoBgZ/TYAptiDf3iRr+hlf2GXvGc9f+UB7XIHwJt5aPk5A3PUXxIB
	 n/PLWSGOSOcHiNuXUmMjAC8k8HFtqylKXsnlhZdTwEewnmJvViLDlTPkn6U4kItOf2LH1
	 2MzKyUAfVJv1yVzu9CyejSzKV5NjWlRFWNXGrDaaEOqs/NVDDnJxw8euy/Ht+wDecAcan
	 EBRcZoscFLrRyofvLgglijJcvNRQ7o2SN06raMGOb2kvWgQj/F5j1W4+Hd+0Rbq2b/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eLtM/wgJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C60606A31A;
	Wed, 28 Oct 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLtM/wgJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338DD1F01825;
	Wed, 28 Oct 2026 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186033;
	bh=F5Zte+8AHYgNHGdRO053wS8pXJCV78zgJQHjS+bvvIg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eLtM/wgJ+Yw1WoZwScJscpFG7ogXoOj0WwaS9eNeL0W9Lb+ZvvJlPRYjH/hm6wZHq
	 cpJLnJlr+PZVXfSIFWulei3gVgcnZxG3wje7YJsGen4AMQA01FB2AF4S+olx0aiqAk
	 TQQ4wHiiVF6AxyUkGPB2FbNZjThhBlYbsmaNHUIVL86dRGpQDWwyWsBzqQBFlgRIKa
	 qrgdibn+un/s2lNttBauA+I3D1PLh7krFZrXDNJVaQ8BVJQoTeYRRXGmpI6HsNe3Mn
	 aPiLtB/m05ZominGFPgetJTig1nac69IrOVIc/Ilpvn1yLgSuqdbKQMvomI/yqhoV1
	 TSWUSGMrxFlMA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:43:36 +0530
Message-Id: <179318601645.5872.14222392238387100610.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17801; i=mani@kernel.org;
 h=from:subject:message-id; bh=phmNu8FS4zZxKTeCViylN+gK9fCWU+OJWNMYsvS1Xv0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4djjA1W1cyGIMH9LH2VRl/NMCVHKoLtQqTQYB
 TPQAEl3gkqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHY4wAKCRBVnxHm/pHO
 9RWSB/4/lCpdJExz3JAm0N2lVrk8rOtDjNet8xes2R0Bt+hhd2QkwoFPa7b8PCSD96Ifjg/pFuM
 Em/AQqRfz53Q0NkwuntlOzvqJj/IYrb4GE7BkQsSyQhEcuznZALsf/VxKrRd2TjSC6o6AWOOFj0
 8OD1lvsHLjrDkeMIjMWIZp0uSmu1loR992Q+t8uE5APDVmt1wp9tt4HEGfvxn/aYNxWi+Zhafrw
 1xt72v5z5SspRM4LUue6xCVeiot6wSGNGSqKorEBDf3acNtR7JLvE3JSArfCcCC7xP5sRFI6yYX
 POtZJ5kzhCIQHMP3XBi1rP6y8lLhs0M7VZibkekWlhDCDlmv
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-09-23 05:34 +0530, Mohd Ayaan Anwar wrote:
> Nord uses a QMP v7 SerDes block which is an updated version of the
> SGMII SerDes PHY IP.
> 
> The SGMII SerDes PHY supports multiple operating modes by programming
> different SerDes line rates. The driver currently handles SGMII and
> 2500BASE-X configurations only.
> 
> Add support for configuring the SerDes to operate at 10.3125 Gbaud,
> enabling both USXGMII and 10GBASE-R PHY interface modes. Finally, add a
> driver compatible for Nord.
> 
> Select USXGMII as the initial interface mode for Nord. phy_power_on()
> can run before the consumer calls set_mode(), so this ensures that the
> first calibration selects the 10.3125 Gbaud programming sequence.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 ++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 166 ++++++++++++++++++++-
>  4 files changed, 177 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> index 4d8c962f5e0f52974f3edd5d1acdd8da535de200..67ab2fe085de3d90520cfc43cc0ac7abaab1f21d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> @@ -10,11 +10,16 @@
>  #define QPHY_PCS_POWER_DOWN_CONTROL			0x004
>  #define QPHY_PCS_SW_RESET				0x008
>  #define QPHY_PCS_LINE_RESET_TIME			0x00c
> +#define QPHY_PCS_RETIME_BUFFER_EN			0x018
>  #define QPHY_PCS_TX_LARGE_AMP_DRV_LVL			0x020
> +#define QPHY_PCS_TX_LARGE_AMP_POST_EMP_LVL		0x024
>  #define QPHY_PCS_TX_SMALL_AMP_DRV_LVL			0x028
> +#define QPHY_PCS_TX_SMALL_AMP_POST_EMP_LVL		0x02c
> +#define QPHY_PCS_RX_SIGDET_CTRL2				0x08c
>  #define QPHY_PCS_PCS_READY_STATUS			0x094
>  #define QPHY_PCS_TX_MID_TERM_CTRL1			0x0d8
>  #define QPHY_PCS_TX_MID_TERM_CTRL2			0x0dc
> +#define QPHY_PCS_SGMII_MISC_CTRL7			0x114
>  #define QPHY_PCS_SGMII_MISC_CTRL8			0x118
>  
>  #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
> index 7430f49214779855df1cf40acac96440957f9e6d..e8b4a26b361adab6e2b0bd3c91e719f84d1ffbc1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
> @@ -58,6 +58,7 @@
>  #define QSERDES_V7_COM_CLK_ENABLE1				0xe0
>  #define QSERDES_V7_COM_SYS_CLK_CTRL				0xe4
>  #define QSERDES_V7_COM_SYSCLK_BUF_ENABLE			0xe8
> +#define QSERDES_V7_COM_PLL_EN					0xec
>  #define QSERDES_V7_COM_PLL_IVCO					0xf4
>  #define QSERDES_V7_COM_PLL_IVCO_MODE1				0xf8
>  #define QSERDES_V7_COM_SYSCLK_EN_SEL				0x110
> @@ -75,6 +76,7 @@
>  #define QSERDES_V7_COM_CMN_MISC_1				0x184
>  #define QSERDES_V7_COM_CMN_MODE					0x188
>  #define QSERDES_V7_COM_PLL_VCO_DC_LEVEL_CTRL			0x198
> +#define QSERDES_V7_COM_BIN_VCOCAL_HSCLK_SEL_1			0x19c
>  #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_1			0x1a4
>  #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_2			0x1a8
>  #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_3			0x1ac
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> index 6ab943ff57ff666e4f23f4ad0b4eff211c6dbfd0..0c38d62284e4d0e64a27fb82c468f47aee3760bb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> @@ -7,9 +7,11 @@
>  #define QCOM_PHY_QMP_QSERDES_TXRX_V7_H_
>  
>  #define QSERDES_V7_TX_CLKBUF_ENABLE				0x08
> +#define QSERDES_V7_TX_TX_EMP_POST1_LVL				0x0c
>  #define QSERDES_V7_TX_RESET_TSYNC_EN				0x1c
>  #define QSERDES_V7_TX_PRE_STALL_LDO_BOOST_EN			0x20
>  #define QSERDES_V7_TX_TX_BAND					0x24
> +#define QSERDES_V7_TX_SLEW_CNTL					0x28
>  #define QSERDES_V7_TX_INTERFACE_SELECT				0x2c
>  #define QSERDES_V7_TX_RES_CODE_LANE_TX				0x34
>  #define QSERDES_V7_TX_RES_CODE_LANE_RX				0x38
> @@ -35,26 +37,32 @@
>  #define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW			0x3c
>  #define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH			0x40
>  #define QSERDES_V7_RX_UCDR_PI_CONTROLS				0x44
> +#define QSERDES_V7_RX_UCDR_PI_CTRL2				0x48
>  #define QSERDES_V7_RX_UCDR_SB2_THRESH1				0x4c
>  #define QSERDES_V7_RX_UCDR_SB2_THRESH2				0x50
>  #define QSERDES_V7_RX_UCDR_SB2_GAIN1				0x54
>  #define QSERDES_V7_RX_UCDR_SB2_GAIN2				0x58
>  #define QSERDES_V7_RX_AUX_DATA_TCOARSE_TFINE			0x60
> +#define QSERDES_V7_RX_RX_TERM_BW					0x80
>  #define QSERDES_V7_RX_TX_ADAPT_PRE_THRESH1			0xc4
>  #define QSERDES_V7_RX_TX_ADAPT_PRE_THRESH2			0xc8
>  #define QSERDES_V7_RX_TX_ADAPT_POST_THRESH			0xcc
>  #define QSERDES_V7_RX_VGA_CAL_CNTRL1				0xd4
>  #define QSERDES_V7_RX_VGA_CAL_CNTRL2				0xd8
>  #define QSERDES_V7_RX_GM_CAL					0xdc
> +#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL1			0xe8
>  #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2			0xec
>  #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3			0xf0
>  #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4			0xf4
>  #define QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW			0xf8
>  #define QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH			0xfc
> +#define QSERDES_V7_RX_RX_IDAC_MEASURE_TIME			0x100
>  #define QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
> +#define QSERDES_V7_RX_RX_OFFSET_ADAPTOR_CNTRL2			0x114
>  #define QSERDES_V7_RX_SIGDET_ENABLES				0x118
>  #define QSERDES_V7_RX_SIGDET_CNTRL				0x11c
>  #define QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL			0x124
> +#define QSERDES_V7_RX_RX_BAND					0x128
>  #define QSERDES_V7_RX_RX_MODE_00_LOW				0x15c
>  #define QSERDES_V7_RX_RX_MODE_00_HIGH				0x160
>  #define QSERDES_V7_RX_RX_MODE_00_HIGH2				0x164
> @@ -75,6 +83,7 @@
>  #define QSERDES_V7_RX_DCC_CTRL1					0x1a8
>  #define QSERDES_V7_RX_VTH_CODE					0x1b0
>  #define QSERDES_V7_RX_SIGDET_CAL_CTRL1				0x1e4
> +#define QSERDES_V7_RX_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE	0x1e8
>  #define QSERDES_V7_RX_SIGDET_CAL_TRIM				0x1f8
>  
>  #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> index 029dafacee7853648ef24afd0d9c4b83a549badf..3c68bfe0ea443ef5cf7f17cead4974862dc04884 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -15,7 +15,9 @@
>  
>  #include "phy-qcom-qmp-pcs-sgmii.h"
>  #include "phy-qcom-qmp-qserdes-com-v5.h"
> +#include "phy-qcom-qmp-qserdes-com-v7.h"
>  #include "phy-qcom-qmp-qserdes-txrx-v5.h"
> +#include "phy-qcom-qmp-qserdes-txrx-v7.h"
>  
>  #define QSERDES_QMP_PLL					0x0
>  #define QSERDES_RX					0x600
> @@ -221,6 +223,114 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
>  	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
>  }
>  
> +static void qcom_dwmac_sgmii_phy_init_10g(struct regmap *regmap)
> +{
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
> +
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BG_TIMER, 0x0A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_IVCO, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_BIAS_EN_CLK_BUFLR_EN, 0x07);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CLK_ENABLE1, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CP_CTRL_MODE0, 0x08);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_RCTRL_MODE0, 0x16);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_CCTRL_MODE0, 0x36);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_INTEGLOOP_GAIN0_MODE0, 0x1F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_INTEGLOOP_GAIN1_MODE0, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_EN, 0x03);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_SYSCLK_EN_SEL, 0x1A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_LOCK_CMP1_MODE0, 0x23);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_LOCK_CMP2_MODE0, 0x43);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DEC_START_MODE0, 0x43);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START1_MODE0, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START2_MODE0, 0x38);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START3_MODE0, 0x02);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE1_MODE0, 0xE6);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE2_MODE0, 0x01);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE_INITVAL2, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_HSCLK_SEL_1, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_HSCLK_HS_SWITCH_SEL_1, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_CORE_CLK_DIV_MODE0, 0x04);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CORE_CLK_EN, 0x30);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CMN_CONFIG_1, 0x16);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xD7);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x11);
> +
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_CLKBUF_ENABLE, 0x0D);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TX_BAND, 0x04);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_SLEW_CNTL, 0x08);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_1, 0xF5);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_2, 0x06);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_3, 0x3F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_4, 0x3F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_5, 0x5F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RCV_DETECT_LVL_2, 0x12);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TRAN_DRVR_EMP_EN, 0x0F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TX_EMP_POST1_LVL, 0x2B);
> +
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FO_GAIN, 0x0D);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SO_GAIN, 0x03);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_PI_CONTROLS, 0x81);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_PI_CTRL2, 0x81);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SB2_THRESH1, 0x11);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SB2_THRESH2, 0x22);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_TERM_BW, 0x03);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_VGA_CAL_CNTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_GM_CAL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4, 0x5A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW, 0x80);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_MEASURE_TIME, 0x20);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CNTRL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_BAND, 0x18);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_LOW, 0x1F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH, 0xBF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH2, 0xFF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH3, 0xDF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH4, 0xEF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_LOW, 0xE5);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH3, 0x14);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH4, 0xB6);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH3, 0x3B);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH4, 0xB7);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_DCC_CTRL1, 0x0C);
> +
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1A);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_POST_EMP_LVL, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_POST_EMP_LVL, 0x0B);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CAL_CTRL1, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_RX_SIGDET_CTRL2, 0xCC);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL7, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x14);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_RETIME_BUFFER_EN, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
> +
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
> +}
> +
>  static inline int
>  qcom_dwmac_sgmii_phy_poll_status(struct regmap *regmap, unsigned int reg,
>  				 unsigned int bit)
> @@ -265,6 +375,40 @@ static int qcom_dwmac_sgmii_phy_poll_sgmii_ready(struct device *dev,
>  	return 0;
>  }
>  
> +static int qcom_dwmac_sgmii_phy_poll_usxgmii_ready(struct device *dev,
> +						     struct regmap *regmap)
> +{
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_QMP_PLL + QSERDES_V7_COM_C_READY_STATUS,
> +					     QSERDES_COM_C_READY)) {
> +		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
> +					     QSERDES_PCS_READY)) {
> +		dev_err(dev, "PCS_READY timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
> +					     QSERDES_PCS_SGMIIPHY_READY)) {
> +		dev_err(dev, "SGMIIPHY_READY timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_QMP_PLL + QSERDES_V7_COM_CMN_STATUS,
> +					     QSERDES_COM_C_PLL_LOCKED)) {
> +		dev_err(dev, "PLL Lock Status timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
>  {
>  	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
> @@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
>  	case PHY_INTERFACE_MODE_1000BASEX:
>  		/* 1.25Gbps mode */
>  		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> -		break;
> +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
>  	case PHY_INTERFACE_MODE_2500BASEX:
>  		/* 3.125Gbps mode */
>  		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> -		break;
> +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> +	case PHY_INTERFACE_MODE_USXGMII:
> +	case PHY_INTERFACE_MODE_10GBASER:
> +		/* 10.3125Gbps mode */
> +		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
> +		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);
>  	default:
>  		return -EINVAL;
>  	}
> -
> -	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
>  }
>  
>  static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
> @@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
>  
>  	if (submode == PHY_INTERFACE_MODE_SGMII ||
>  	    submode == PHY_INTERFACE_MODE_1000BASEX ||
> -	    submode == PHY_INTERFACE_MODE_2500BASEX)
> +	    submode == PHY_INTERFACE_MODE_2500BASEX ||
> +	    submode == PHY_INTERFACE_MODE_USXGMII ||
> +	    submode == PHY_INTERFACE_MODE_10GBASER)

So the driver supports all these modes for all platforms? The commit message
sounds like only Nord supports USXGMII and 10GBASER.

- Mani

