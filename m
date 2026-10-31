Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468110;
	b=FcI2DznIdhYG+QwCX3Sp6NqSIgIn2VgQ8n/WQy3JSiVUrd8CGgnfSQh8sB65akL3j9Zk
	 ThIzsigCGNqSiyuaSW7iauFxgCJDNBn/qHQoYb0Zc2fcNSBLkNWl4DerqHMO5iDz7E5xI
	 BS/C8I2SFSzY3roSYomT94lNQ5l0ZsvwQrsUQIkTdub+ltkEdiPbSDAUH6S/27IKaQU6j
	 EN7Bk0l4QGzWaKbc9gXJN4HFqFmSm12xzv1oyvsK9AJFOtihq0D7BYAc+7rgkzN/6OHkV
	 KGf93AmoTUmh/pK8Ly1q5+IEZD73vPtdP5ro79nmIfhKlk/FhGWA6NaGwRG14p79vcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468110;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rzUv+bCg4DfcE7WNYbARyWoeBIYpfTOv26PrVMDDHik=;
	b=cHowq+ryCH5ed959zhasbrEI4X44ajp0GQ08J4DvIEp95LNp65aze2DMLLkT1iqlciyx
	 qSD/oFfOUSH67fKasUXDFPl1A58BdZ8rHv/uEXri0HpDl5X2fu19tLFo1tRKhbjReOjWN
	 d3tkXCBlQOgIKCZw7hoEmbRrkhI+Ds8cgpYiJOidJRT8KG6COr1D7nhNrKquTHCHbl7Z1
	 j5Mf1RAOTJ7Dilq9ckk3spLnOtf3nWur+hwxbRigEDTOsbJD2W+bkKbTtjlYtGnV7GZow
	 cCtU67q91DJrfYRwuvfsQnxvpDzFHJ1N8PovhsZ4kLOMtnrZl9jPZQT4CTf/cj67QFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bC8KJopt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B3D606A31A;
	Sat, 31 Oct 2026 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bC8KJopt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF2F1F000C1;
	Sat, 31 Oct 2026 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793468109;
	bh=rzUv+bCg4DfcE7WNYbARyWoeBIYpfTOv26PrVMDDHik=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bC8KJoptrvmHuwDb17lf70KW1Oa5YrMPd7H7oYXfbQ7chGda/Ct6rJ2LbdAVGWQXs
	 heOJ0okWEjIJmqq2ZaUSqvr/d+URI/C2vOJy/yetp9Uf05/Z60F8E9Ijq5MlUdOIR1
	 ceKYILaO2Wgb/+7xJWk7ylJspGL5fLhguJzDBwTRI/gV2NsHUlYUohyHc4ku6TocG2
	 wnz87aO+Px9/B8HtKnidaJ8eGDK6FtzHw+Z32xL1E+GuNn6TH9ZJFuNTrgsRMZABZD
	 vF3+lWmDBLmh+qBVf1v7WUuxW3MbnREZ1pAGaZjDeDpQyTzy/cLAS0w0sZqPguFIQv
	 ZZFHWDcEwovDg==
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
Subject: Re: [PATCH v3 2/3] phy: cix: Add Sky1 DP PHY driver
From: Manivannan Sadhasivam <mani@kernel.org>
To: Luo Liu <Luo.Liu@cixtech.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 gary.yang@cixtech.com, fugang.duan@cixtech.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com, 
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, Wuyi.Shen@cixtech.com, 
 EastLake.Yang@cixtech.com
In-Reply-To: <20261013095900.758464-3-Luo.Liu@cixtech.com>
References: <20261013095900.758464-1-Luo.Liu@cixtech.com>
 <20261013095900.758464-3-Luo.Liu@cixtech.com>
Date: Sat, 31 Oct 2026 23:04:51 +0530
Message-Id: <179346809190.7309.2236612395810425367.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18811; i=mani@kernel.org;
 h=from:subject:message-id; bh=K1f0r23RWRjS0QIPr/Fv+3dftweaM05hv3+K1dGssdI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5ia/LNfyGVdiHkX6AsD8eLd24qkPXta6mnvKk
 vDDe4atsqqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauYmvwAKCRBVnxHm/pHO
 9ZC4B/0c9M2wR+CxFv0JbHkQbHlnGNmmNHcZ4a2AdwuJlviiDLjWte3NrVaTqUdYHkJOuXLTsqx
 YO4RXSxfqMSX+3uOYcQP36BCf38CUVXz4M0RJIAAtnKidu3/PRM/i7wYe6TPqZvdfx4jNadiIWu
 oovKmcz6T4hsws5QFItcS33Qxw8A3oU/5ZpCkUDXGZ8Ygnvu3YliWZHbr+9FGo9zzdP6FvlkShj
 UWfuFsD8jmldsKcdmQaXga7gPYqc1STHNP+jfIamjpiff3ZpW4+Hprej7vxImPcKD7RgWjXCzmG
 tu4DZ6fPq/vx4fVROBZcSatDoxB7C0xf69Psof1eEu6a0ZNs
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-13 17:58 +0800, Luo Liu wrote:
> Add a PHY driver for the CIX Sky1 dedicated DisplayPort PMA. Support
> link rate, lane count, SSC and voltage swing via the generic PHY DP
> ops. Load PMA tables in phy_init and enable the analog path in
> phy_power_on so configure can run before power-on.
> 
> Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
> ---
>  drivers/phy/Kconfig          |   1 +
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/cix/Kconfig      |  18 +
>  drivers/phy/cix/Makefile     |   2 +
>  drivers/phy/cix/phy-cix-dp.c | 987 +++++++++++++++++++++++++++++++++++
>  5 files changed, 1009 insertions(+)
>  create mode 100644 drivers/phy/cix/Kconfig
>  create mode 100644 drivers/phy/cix/Makefile
>  create mode 100644 drivers/phy/cix/phy-cix-dp.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d..cb0d4be47628 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -175,6 +175,7 @@ source "drivers/phy/axiado/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/canaan/Kconfig"
> +source "drivers/phy/cix/Kconfig"
>  source "drivers/phy/eswin/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d7aa516bcc49..6fd0f3910018 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   canaan/	\
> +					   cix/		\
>  					   eswin/	\
>  					   freescale/	\
>  					   hisilicon/	\
> diff --git a/drivers/phy/cix/Kconfig b/drivers/phy/cix/Kconfig
> new file mode 100644
> index 000000000000..0e429e2790bf
> --- /dev/null
> +++ b/drivers/phy/cix/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for CIX PHYs
> +#
> +
> +config PHY_CIX_DP
> +	tristate "CIX Sky1 DP PHY driver"
> +	depends on OF && HAS_IOMEM
> +	depends on ARCH_CIX || COMPILE_TEST
> +	select GENERIC_PHY
> +	help
> +	  Say Y here to enable the dedicated DisplayPort PHY used by the CIX
> +	  Sky1 DisplayPort controller. The PHY provides the physical layer
> +	  used by the dedicated DisplayPort output and supports link rates
> +	  up to HBR3.
> +
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called phy-cix-dp.
> diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
> new file mode 100644
> index 000000000000..cc56c7586ec5
> --- /dev/null
> +++ b/drivers/phy/cix/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_CIX_DP) += phy-cix-dp.o
> diff --git a/drivers/phy/cix/phy-cix-dp.c b/drivers/phy/cix/phy-cix-dp.c
> new file mode 100644
> index 000000000000..4cc8f5e715f0
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-dp.c
> @@ -0,0 +1,987 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * CIX DP PHY driver
> + *
> + * Copyright (C) 2023 Trilinear Technologies
> + * Copyright 2024 Cix Technology Group Co., Ltd.

I don't really care about your copyright, but shouldn't the year be updated to
2026?

> + */
> +
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +
> +#define CIX_DP_PHY_ID_REV_REG			0xfc
> +#define CIX_DP_PHY_ID				0x4d
> +#define CIX_DP_PHY_PWR_STATE_IDLE		0x0000
> +#define CIX_DP_PHY_PWR_STATE_A0_TXRX_ACTIVE	0x0001
> +#define CIX_DP_PHY_PWR_STATE_A2_POWERDOWN2	0x0004
> +#define CIX_DP_PHY_PWR_STATE_A3_POWERDOWN3	0x0008
> +
> +#define CIX_DP_CDB_ADDR				0x0000
> +#define CIX_DP_CDB_WDATA			0x0004
> +#define CIX_DP_CDB_SEL_WR			0x0008
> +#define CIX_DP_CDB_READY			0x000c
> +#define CIX_DP_CDB_RDATA			0x0010
> +#define CIX_DP_CDB_RSTN				0x0014
> +#define CIX_DP_CDB_ENABLE			0x0018
> +#define CIX_DP_CDB_SEL_READ			0x2
> +#define CIX_DP_CDB_SEL_WRITE			0x3
> +
> +#define CIX_DP_NUM_LANES			4
> +#define CIX_DP_POLL_SLEEP_US			10
> +#define CIX_DP_POLL_TIMEOUT_US			100000
> +#define CIX_DP_PWR_TIMEOUT_US			10000

Move these 4 defines to the end of all defines or leave a newline here itself.

> +#define CIX_DP_PHY_CONFIG_RSTN			0x0040
> +#define CIX_DP_PHY_CMN_READY			0x0044
> +#define CIX_DP_PHY_LANE_EN_BITS			0x0048
> +#define CIX_DP_PHY_LANE_RSTN_BITS		0x004c
> +#define CIX_DP_PHY_DATA_ENABLE			0x0050
> +#define CIX_DP_AUXHPD_ENABLE_BITS		0x0054
> +#define CIX_DP_TX_ELEC_IDLE_BITS		0x0058
> +#define CIX_DP_PHY_LANE_PWR_STATE_REQ		0x0060
> +#define CIX_DP_PHY_LANE_PWR_STATE_ACK		0x0064
> +#define CIX_DP_PHY_LANE_PLLCLK_ENABLE		0x0068
> +#define CIX_DP_PHY_LANE_PLLCLK_EN_ACK		0x006c
> +
> +#define CIX_DP_PHY_PLL_CFG			0xc00e
> +#define CIX_DP_PHY_PMA_CMN_CTRL2		0xe001
> +#define CIX_DP_PHY_PMA_PLL_RAW_CTRL		0xe003
> +
> +/* Common (CMN) registers */
> +#define CIX_DP_CMN_SSM_BIAS_TMR			0x0022
> +#define CIX_DP_CMN_PLLSM0_PLLPRE_TMR		0x002a
> +#define CIX_DP_CMN_PLLSM0_PLLLOCK_TMR		0x002c
> +#define CIX_DP_CMN_PLLSM1_PLLPRE_TMR		0x0032
> +#define CIX_DP_CMN_PLLSM1_PLLLOCK_TMR		0x0034
> +#define CIX_DP_CMN_BGCAL_INIT_TMR		0x0064
> +#define CIX_DP_CMN_BGCAL_ITER_TMR		0x0065
> +#define CIX_DP_CMN_IBCAL_INIT_TMR		0x0074
> +#define CIX_DP_CMN_PLL0_VCOCAL_TCTRL		0x0082
> +#define CIX_DP_CMN_PLL0_VCOCAL_INIT_TMR		0x0084
> +#define CIX_DP_CMN_PLL0_VCOCAL_ITER_TMR		0x0085
> +#define CIX_DP_CMN_PLL0_VCOCAL_REFTIM_START	0x0086
> +#define CIX_DP_CMN_PLL0_VCOCAL_PLLCNT_START	0x0088
> +#define CIX_DP_CMN_PLL0_LOCK_REFCNT_START	0x009c
> +#define CIX_DP_CMN_PLL0_LOCK_PLLCNT_START	0x009e
> +#define CIX_DP_CMN_PLL0_LOCK_PLLCNT_THR		0x009f
> +#define CIX_DP_CMN_PLL0_INTDIV_M0		0x0090
> +#define CIX_DP_CMN_PLL0_FRACDIVL_M0		0x0091
> +#define CIX_DP_CMN_PLL0_FRACDIVH_M0		0x0092
> +#define CIX_DP_CMN_PLL0_HIGH_THR_M0		0x0093
> +#define CIX_DP_CMN_PLL0_DSM_DIAG_M0		0x0094
> +#define CIX_DP_CMN_PLL0_SS_CTRL1_M0		0x0098
> +#define CIX_DP_CMN_PLL0_SS_CTRL2_M0		0x0099
> +#define CIX_DP_CMN_PLL0_SS_CTRL3_M0		0x009a
> +#define CIX_DP_CMN_PLL0_SS_CTRL4_M0		0x009b
> +#define CIX_DP_CMN_PLL1_VCOCAL_TCTRL		0x00c2
> +#define CIX_DP_CMN_PLL1_VCOCAL_INIT_TMR		0x00c4
> +#define CIX_DP_CMN_PLL1_VCOCAL_ITER_TMR		0x00c5
> +#define CIX_DP_CMN_PLL1_VCOCAL_REFTIM_START	0x00c6
> +#define CIX_DP_CMN_PLL1_VCOCAL_PLLCNT_START	0x00c8
> +#define CIX_DP_CMN_PLL1_LOCK_REFCNT_START	0x00dc
> +#define CIX_DP_CMN_PLL1_LOCK_PLLCNT_START	0x00de
> +#define CIX_DP_CMN_PLL1_LOCK_PLLCNT_THR		0x00df
> +#define CIX_DP_CMN_PLL1_INTDIV_M0		0x00d0
> +#define CIX_DP_CMN_PLL1_FRACDIVL_M0		0x00d1
> +#define CIX_DP_CMN_PLL1_FRACDIVH_M0		0x00d2
> +#define CIX_DP_CMN_PLL1_HIGH_THR_M0		0x00d3
> +#define CIX_DP_CMN_PLL1_DSM_DIAG_M0		0x00d4
> +#define CIX_DP_CMN_PLL1_SS_CTRL1_M0		0x00d8
> +#define CIX_DP_CMN_PLL1_SS_CTRL2_M0		0x00d9
> +#define CIX_DP_CMN_PLL1_SS_CTRL3_M0		0x00da
> +#define CIX_DP_CMN_PLL1_SS_CTRL4_M0		0x00db
> +#define CIX_DP_CMN_TXPUCAL_INIT_TMR		0x0104
> +#define CIX_DP_CMN_TXPDCAL_INIT_TMR		0x010c
> +#define CIX_DP_CMN_RXCAL_INIT_TMR		0x0114
> +#define CIX_DP_CMN_SD_CAL_PLLCNT_START		0x0128
> +#define CIX_DP_CMN_PDIAG_PLL0_CTRL_M0		0x01a0
> +#define CIX_DP_CMN_PDIAG_PLL0_CLK_SEL_M0	0x01a1
> +#define CIX_DP_CMN_PDIAG_PLL0_CP_PADJ_M0	0x01a4
> +#define CIX_DP_CMN_PDIAG_PLL0_CP_IADJ_M0	0x01a5
> +#define CIX_DP_CMN_PDIAG_PLL0_FILT_PADJ_M0	0x01a6
> +#define CIX_DP_CMN_PDIAG_PLL1_CTRL_M0		0x01c0
> +#define CIX_DP_CMN_PDIAG_PLL1_CP_PADJ_M0	0x01c4
> +#define CIX_DP_CMN_PDIAG_PLL1_CP_IADJ_M0	0x01c5
> +#define CIX_DP_CMN_PDIAG_PLL1_FILT_PADJ_M0	0x01c6
> +
> +/* Lane / TX / RX / XCVR registers */
> +#define CIX_DP_TX_TXCC_CTRL			0x4040
> +#define CIX_DP_TX_TXCC_CPOST_MULT_00		0x404c
> +#define CIX_DP_TX_TXCC_MGNFS_MULT_000		0x4050
> +#define CIX_DP_XCVR_DIAG_PLLDRC_CTRL		0x40e5
> +#define CIX_DP_XCVR_DIAG_HSCLK_DIV		0x40e7
> +#define CIX_DP_XCVR_DIAG_BIDI_CTRL		0x40ea
> +#define CIX_DP_DRV_DIAG_TX_DRV			0x40c6
> +#define CIX_DP_TX_PSC_A0			0x4100
> +#define CIX_DP_TX_PSC_A2			0x4102
> +#define CIX_DP_TX_PSC_A3			0x4103
> +#define CIX_DP_RX_ST_TMR			0x4123
> +#define CIX_DP_TX_DIAG_ACYA			0x41e7
> +#define CIX_DP_RX_PSC_A0			0x8000
> +#define CIX_DP_RX_PSC_A2			0x8002
> +#define CIX_DP_RX_PSC_A3			0x8003
> +#define CIX_DP_RX_PSC_CAL			0x8006
> +#define CIX_DP_RX_SDCAL0_INIT_TMR		0x8044
> +#define CIX_DP_RX_SDCAL0_ITER_TMR		0x8045
> +#define CIX_DP_RX_SDCAL1_INIT_TMR		0x804c
> +#define CIX_DP_RX_SDCAL1_ITER_TMR		0x804d
> +#define CIX_DP_RX_REE_GCSM1_CTRL		0x8108
> +#define CIX_DP_RX_REE_GCSM2_CTRL		0x8110
> +#define CIX_DP_RX_REE_PERGCSM_CTRL		0x8118
> +
> +/* PMA bit defines */
> +#define CIX_DP_PMA_CMN_CTRL2_PLL0_READY_BIT	BIT(0)
> +#define CIX_DP_PMA_CMN_CTRL2_PLL0_DISABLED_BIT	BIT(2)
> +#define CIX_DP_PMA_PLL_RAW_CTRL_PLL0_FORCE_RSTN	BIT(0)
> +
> +#define CIX_DP_LANE_OFFSET(x) \
> +	((x) * 0x0200)
> +#define CIX_DP_XCVR_DIAG_HSCLK_DIV_LANE(x) \
> +	(CIX_DP_XCVR_DIAG_HSCLK_DIV + CIX_DP_LANE_OFFSET(x))
> +#define CIX_DP_TX_DIAG_ACYA_LANE(x) \
> +	(CIX_DP_TX_DIAG_ACYA + CIX_DP_LANE_OFFSET(x))
> +#define CIX_DP_TX_TXCC_CTRL_LANE(x) \
> +	(CIX_DP_TX_TXCC_CTRL + CIX_DP_LANE_OFFSET(x))
> +#define CIX_DP_DRV_DIAG_TX_DRV_LANE(x) \
> +	(CIX_DP_DRV_DIAG_TX_DRV + CIX_DP_LANE_OFFSET(x))
> +#define CIX_DP_TX_TXCC_MGNFS_MULT_000_LANE(x) \
> +	(CIX_DP_TX_TXCC_MGNFS_MULT_000 + CIX_DP_LANE_OFFSET(x))
> +#define CIX_DP_TX_TXCC_CPOST_MULT_00_LANE(x) \
> +	(CIX_DP_TX_TXCC_CPOST_MULT_00 + CIX_DP_LANE_OFFSET(x))
> +
> +enum cix_dp_pwr {
> +	CIX_DP_PWR_A0,
> +	CIX_DP_PWR_A2,
> +	CIX_DP_PWR_A3,
> +};
> +
> +struct cix_dp {
> +	struct phy *phy;
> +	struct reset_control *reset;
> +	void __iomem *base;
> +	bool is_edp;
> +	bool powered;
> +	unsigned int num_lanes;

Move bool to the end.

> +};
> +
> +struct cix_dp_link_cfg {
> +	u32 link_rate;
> +	u32 hsclk_div;
> +	u32 clk_sel;
> +	u32 pll_intdiv;
> +	u32 pll_fracdivl;
> +	u32 pll_high_thr;
> +};
> +
> +struct cix_dp_reg {
> +	u32 reg;
> +	u32 val;
> +	bool per_lane;
> +};
> +
> +struct cix_dp_voltage_conf {
> +	u32 tx_txcc_ctrl;
> +	u32 drv_diag_tx_drv;
> +	u32 tx_txcc_mgnfs_mult_000;
> +	u32 tx_txcc_cpost_mult_00;
> +};
> +
> +static const struct cix_dp_voltage_conf cix_dp_volt_cfg[] = {
> +	{ 0x08a4, 0x0003, 0x002a, 0x0000 }, /* swing level == 0 */
> +	{ 0x08a4, 0x0003, 0x001f, 0x0014 },
> +	{ 0x08a4, 0x0003, 0x0013, 0x0020 },
> +	{ 0x08a4, 0x0003, 0x000a, 0x002a },
> +	{ 0x08a4, 0x0003, 0x001f, 0x0000 }, /* swing level == 1 */
> +	{ 0x08a4, 0x0003, 0x0013, 0x0012 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x001f },
> +	{ 0x08a4, 0x0003, 0x0000, 0x001f },
> +	{ 0x08a4, 0x0003, 0x0013, 0x0000 }, /* swing level == 2 */
> +	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 }, /* swing level == 3 */
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +};
> +
> +static const struct cix_dp_voltage_conf cix_dp_volt_low_cfg[] = {
> +	{ 0x08a4, 0x0003, 0x002f, 0x0000 }, /* swing level == 0 */
> +	{ 0x08a4, 0x0003, 0x002a, 0x000d },
> +	{ 0x08a4, 0x0003, 0x0026, 0x0015 },
> +	{ 0x08a4, 0x0003, 0x0022, 0x001b },
> +	{ 0x08a4, 0x0003, 0x002b, 0x0000 }, /* swing level == 1 */
> +	{ 0x08a4, 0x0003, 0x0027, 0x000b },
> +	{ 0x08a4, 0x0003, 0x0023, 0x0012 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0027, 0x0000 }, /* swing level == 2 */
> +	{ 0x08a4, 0x0003, 0x0023, 0x0009 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0023, 0x0000 }, /* swing level == 3 */
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08a4, 0x0003, 0x0000, 0x0000 },
> +};
> +
> +/* Default PHY programming, including SSC enabled (SS_CTRL1 = 0x1). */
> +static const struct cix_dp_reg cix_dp_reg_conf[] = {
> +	{ CIX_DP_CMN_SSM_BIAS_TMR, 0x0018 },
> +	{ CIX_DP_CMN_PLLSM0_PLLPRE_TMR, 0x0030 },
> +	{ CIX_DP_CMN_PLLSM0_PLLLOCK_TMR, 0x00f0 },
> +	{ CIX_DP_CMN_PLLSM1_PLLPRE_TMR, 0x0030 },
> +	{ CIX_DP_CMN_PLLSM1_PLLLOCK_TMR, 0x00f0 },
> +	{ CIX_DP_CMN_BGCAL_INIT_TMR, 0x0078 },
> +	{ CIX_DP_CMN_BGCAL_ITER_TMR, 0x0078 },
> +	{ CIX_DP_CMN_IBCAL_INIT_TMR, 0x0018 },
> +	{ CIX_DP_CMN_TXPUCAL_INIT_TMR, 0x001d },
> +	{ CIX_DP_CMN_TXPDCAL_INIT_TMR, 0x001d },
> +	{ CIX_DP_CMN_RXCAL_INIT_TMR, 0x02d0 },
> +	{ CIX_DP_CMN_SD_CAL_PLLCNT_START, 0x0137 },
> +	{ CIX_DP_RX_SDCAL0_INIT_TMR, 0x0018, true },
> +	{ CIX_DP_RX_SDCAL0_ITER_TMR, 0x0078, true },
> +	{ CIX_DP_RX_SDCAL1_INIT_TMR, 0x0018, true },
> +	{ CIX_DP_RX_SDCAL1_ITER_TMR, 0x0078, true },
> +	{ CIX_DP_RX_ST_TMR, 0x0960, true },
> +	{ CIX_DP_PHY_PLL_CFG, 0x0000 },
> +	{ CIX_DP_XCVR_DIAG_HSCLK_DIV, 0x0000, true },
> +	{ CIX_DP_XCVR_DIAG_PLLDRC_CTRL, 0x0011, true },
> +	{ CIX_DP_CMN_PLL0_DSM_DIAG_M0, 0x8004 },
> +	{ CIX_DP_CMN_PLL1_DSM_DIAG_M0, 0x0004 },
> +	{ CIX_DP_CMN_PDIAG_PLL0_CP_PADJ_M0, 0x0b17 },
> +	{ CIX_DP_CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0b17 },
> +	{ CIX_DP_CMN_PDIAG_PLL0_CP_IADJ_M0, 0x0e01 },
> +	{ CIX_DP_CMN_PDIAG_PLL1_CP_IADJ_M0, 0x0e01 },
> +	{ CIX_DP_CMN_PDIAG_PLL0_FILT_PADJ_M0, 0x0d05 },
> +	{ CIX_DP_CMN_PDIAG_PLL1_FILT_PADJ_M0, 0x0d05 },
> +	{ CIX_DP_CMN_PLL0_INTDIV_M0, 0x01c2 },
> +	{ CIX_DP_CMN_PLL1_INTDIV_M0, 0x014d },
> +	{ CIX_DP_CMN_PLL1_FRACDIVL_M0, 0x5555 },
> +	{ CIX_DP_CMN_PLL0_FRACDIVH_M0, 0x0002 },
> +	{ CIX_DP_CMN_PLL1_FRACDIVH_M0, 0x0002 },
> +	{ CIX_DP_CMN_PLL0_HIGH_THR_M0, 0x012c },
> +	{ CIX_DP_CMN_PLL1_HIGH_THR_M0, 0x00e0 },
> +	{ CIX_DP_CMN_PDIAG_PLL0_CTRL_M0, 0x1002 },
> +	{ CIX_DP_CMN_PDIAG_PLL1_CTRL_M0, 0x1002 },
> +	{ CIX_DP_CMN_PLL0_SS_CTRL1_M0, 0x0001 },
> +	{ CIX_DP_CMN_PLL1_SS_CTRL1_M0, 0x0001 },
> +	{ CIX_DP_CMN_PLL0_SS_CTRL2_M0, 0x044f },
> +	{ CIX_DP_CMN_PLL1_SS_CTRL2_M0, 0x03c7 },
> +	{ CIX_DP_CMN_PLL0_SS_CTRL3_M0, 0x007f },
> +	{ CIX_DP_CMN_PLL1_SS_CTRL3_M0, 0x007f },
> +	{ CIX_DP_CMN_PLL0_SS_CTRL4_M0, 0x0003 },
> +	{ CIX_DP_CMN_PLL1_SS_CTRL4_M0, 0x0003 },
> +	{ CIX_DP_CMN_PLL0_VCOCAL_INIT_TMR, 0x00f0 },
> +	{ CIX_DP_CMN_PLL1_VCOCAL_INIT_TMR, 0x00f0 },
> +	{ CIX_DP_CMN_PLL0_VCOCAL_ITER_TMR, 0x0004 },
> +	{ CIX_DP_CMN_PLL1_VCOCAL_ITER_TMR, 0x0004 },
> +	{ CIX_DP_CMN_PLL0_VCOCAL_REFTIM_START, 0x02f8 },
> +	{ CIX_DP_CMN_PLL1_VCOCAL_REFTIM_START, 0x02f8 },
> +	{ CIX_DP_CMN_PLL0_VCOCAL_PLLCNT_START, 0x02f6 },
> +	{ CIX_DP_CMN_PLL1_VCOCAL_PLLCNT_START, 0x02f6 },
> +	{ CIX_DP_CMN_PLL0_VCOCAL_TCTRL, 0x0003 },
> +	{ CIX_DP_CMN_PLL1_VCOCAL_TCTRL, 0x0003 },
> +	{ CIX_DP_CMN_PLL0_LOCK_REFCNT_START, 0x00bf },
> +	{ CIX_DP_CMN_PLL1_LOCK_REFCNT_START, 0x00bf },
> +	{ CIX_DP_CMN_PLL0_LOCK_PLLCNT_START, 0x00bf },
> +	{ CIX_DP_CMN_PLL1_LOCK_PLLCNT_START, 0x00bf },
> +	{ CIX_DP_CMN_PLL0_LOCK_PLLCNT_THR, 0x0005 },
> +	{ CIX_DP_CMN_PLL1_LOCK_PLLCNT_THR, 0x0005 },
> +	{ CIX_DP_TX_PSC_A0, 0x00fb, true },
> +	{ CIX_DP_TX_PSC_A2, 0x04aa, true },
> +	{ CIX_DP_TX_PSC_A3, 0x04aa, true },
> +	{ CIX_DP_RX_PSC_A0, 0x0000, true },
> +	{ CIX_DP_RX_PSC_A2, 0x0000, true },
> +	{ CIX_DP_RX_PSC_A3, 0x0000, true },
> +	{ CIX_DP_RX_PSC_CAL, 0x0000, true },
> +	{ CIX_DP_XCVR_DIAG_BIDI_CTRL, 0x000f, true },
> +	{ CIX_DP_RX_REE_GCSM1_CTRL, 0x0000, true },
> +	{ CIX_DP_RX_REE_GCSM2_CTRL, 0x0000, true },
> +	{ CIX_DP_RX_REE_PERGCSM_CTRL, 0x0000, true },
> +};
> +
> +/*
> + * Supported DisplayPort link rates in Mb/s. 2160 and 4320 listed by
> + * phy-dp.h are not implemented on this PHY.
> + */
> +static const struct cix_dp_link_cfg cix_dp_link_cfg[] = {
> +	{ 1620, 0x0002, 0x0f01, 0x0195, 0x0000, 0x010e },
> +	{ 2430, 0x0001, 0x0701, 0x0195, 0x0000, 0x010e },
> +	{ 2700, 0x0001, 0x0701, 0x01c2, 0x0000, 0x012c },
> +	{ 3240, 0x0002, 0x0b00, 0x0195, 0x0000, 0x010e },
> +	{ 5400, 0x0000, 0x0301, 0x01c2, 0x0000, 0x012c },
> +	{ 8100, 0x0000, 0x0200, 0x0151, 0x8000, 0x00e2 },
> +};
> +
> +/*
> + * Sky1 routes 1- and 2-lane DP through physical lanes 2/3, not 0/1.
> + * phy-dp.h describes logical lanes starting from lane 0; map them with
> + * +2 so enable/reset masks and voltage programming hit the wired pads.
> + */
> +static u32 cix_dp_phy_lane_bits(unsigned int lanes)
> +{
> +	switch (lanes) {
> +	case 1:
> +		return BIT(2);
> +	case 2:
> +		return BIT(2) | BIT(3);
> +	case 4:
> +		return GENMASK(3, 0);
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static void cix_dp_phy_write(struct cix_dp *dp, u32 offset, u32 value)
> +{
> +	writel(value, dp->base + offset);
> +}
> +
> +static int cix_dp_phy_cdb_ready(struct cix_dp *dp)
> +{
> +	u32 value;
> +
> +	return readl_poll_timeout(dp->base + CIX_DP_CDB_READY, value,
> +				  value & BIT(0), CIX_DP_POLL_SLEEP_US,
> +				  CIX_DP_POLL_TIMEOUT_US);
> +}
> +
> +/*
> + * After kicking CDB_ENABLE, READY may stay high for a few clocks before the
> + * IP drops it. Poll tightly for busy so a stale READY=1 is not taken as
> + * completion. The busy pulse can be shorter than a sleeping poll, so ignore
> + * a missed busy and still wait for idle.
> + */
> +static int cix_dp_phy_cdb_complete(struct cix_dp *dp)
> +{
> +	u32 value;
> +
> +	readl_poll_timeout_atomic(dp->base + CIX_DP_CDB_READY, value,
> +				  !(value & BIT(0)), 0, 1);
> +
> +	return cix_dp_phy_cdb_ready(dp);
> +}
> +
> +static int cix_dp_phy_cdb_write(struct cix_dp *dp, u32 offset, u32 data)
> +{
> +	int ret;
> +
> +	ret = cix_dp_phy_cdb_ready(dp);
> +	if (ret)
> +		return ret;
> +
> +	writel(offset, dp->base + CIX_DP_CDB_ADDR);
> +	writel(data, dp->base + CIX_DP_CDB_WDATA);
> +	writel(CIX_DP_CDB_SEL_WRITE, dp->base + CIX_DP_CDB_SEL_WR);
> +	writel(1, dp->base + CIX_DP_CDB_ENABLE);
> +
> +	return cix_dp_phy_cdb_complete(dp);
> +}
> +
> +static int cix_dp_phy_cdb_read(struct cix_dp *dp, u32 offset)
> +{
> +	int ret;
> +
> +	ret = cix_dp_phy_cdb_ready(dp);
> +	if (ret)
> +		return ret;
> +
> +	writel(offset, dp->base + CIX_DP_CDB_ADDR);
> +	writel(CIX_DP_CDB_SEL_READ, dp->base + CIX_DP_CDB_SEL_WR);
> +	writel(1, dp->base + CIX_DP_CDB_ENABLE);

Add a define for BIT(0)

> +
> +	ret = cix_dp_phy_cdb_complete(dp);
> +	if (ret)
> +		return ret;
> +
> +	return readl(dp->base + CIX_DP_CDB_RDATA) & GENMASK(15, 0);
> +}
> +

[...]

> +static int cix_dp_hw_power_on(struct cix_dp *dp)
> +{
> +	int ret;
> +
> +	if (dp->powered)

Why do you need this check? PHY core does its own refcount. So smells like you
have a race in the driver.

Rest LGTM!

- Mani


