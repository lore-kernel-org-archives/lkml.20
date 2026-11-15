Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794774966;
	b=FKVHrcSPeWKgZraMpnbA4d9URextu+lTGNGbogmwrtVIaeOPycxQqF5ykxzMs3h+fe0q
	 FIVu0GE2/kvzHOznadAkyLodZbDWFIiVR+AiPgauwR2VW0NACRT192Z/hu6ZWqo8XROX+
	 m2BNz58yPY3Xw5llaid9YbyaJgvCk4aSowOY6+uF+nsk5PtVucolsPd4JjgljetM+bA7c
	 5DWNP4ydQDuQ/WRKAsTAU4g22os4mZXxNDNPBXwlxSvDat+CoHoEu19JiH0UiTw5rNGo2
	 3BKY32EYFqAp1BVNzPo3yjMMTk25+3kB634SeYAMoI8IVP5qSdjVSEbhFvIEeWSg+3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774966;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qtFjACsgE9KlInxvJU2KH+BMV2N5plnWkORrrV6yL/E=;
	b=Fd8Hfqc0sHit/aQrrdVMIM2RwEEq/7e/92jgLMOw4gXrtN5LM83amaltDJCU9BVOPv8b
	 l88m+3bpTGLrmGc7pyNSaBewB9WvkMjn+9+ulq53De5ONVedqwxjedQkr7WSNk8xsr76m
	 TWLPOXotRdCBWDDLOJbZLKDNBAGpcJH4wI4N+ALTMaov+cJvs7YeFKgantuuXhQ6uLQCQ
	 kkvmVkpaV4mtMQXUsvjztJQ21EDIUVUOgpIzGqxSVWQVV27DwAJmjP5vg9XF1SSWXsfP4
	 dR1K4XQWXV66kNCJAujB8A7UO+iI863JkUvMgmDaWCXQANkocbWPQ5aqNKWumkubHsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD4606A31F;
	Sun, 15 Nov 2026 20:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD571F000C4;
	Sun, 15 Nov 2026 20:36:01 +0000 (UTC)
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
Subject: Re: [PATCH 2/3] phy: cix: add Sky1 USB/DP combo PHY driver
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fugang Duan <fugang.duan@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102082112.2306326-3-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261102082112.2306326-3-gary.yang@cixtech.com>
Date: Sun, 15 Nov 2026 12:35:54 -0800
Message-Id: <179477495413.135135.11903806810723285954.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=39455;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=6y6Rmob6EDbXq7H3Hvm29Xu9MTwX46YkVs1RIIvh1zY=;
 b=kA0DAAoBVZ8R5v6RzvUByyZiAGr6F6zInU0bFlMV7HeMNsTpw/AC3m6yTHthV/Nt/QtUSwx9r
 IkBMwQAAQoAHRYhBGelQyqBSMvYpFgnl1WfEeb+kc71BQJq+hesAAoJEFWfEeb+kc71FVcIAIm7
 RBL3Q3Dod5aAT8iqYKCu1pCYoFe3FA68Yt6gvWdwcdxv51vWAYqGN3VCF9Vny86HNXX0VipaHW/
 Sc6ecxyCuCDZDKxCvCp9Ul1ZWToakOEcUvqZb8SplIgDLkClEKit6aU+kRG+KYsJzT9uumbOKIy
 lEuHbUUN57Yx9adnH7ku1iRTEG6gqFGAEPUAEP1UGEIg2tTCF1g1x6gxjwmSOL6sd2XgfgmpmwN
 CivdTr0xiTnKeMA7u7YTKLxhL+qM5ySB5kIXxX4+ZU3fCF71/Wf5/WYifguoLQhUcVNkQYnNzNH
 Nba3qCItA3oLJBAqWjh8juMv6Qu9v6NDEKWqMlQ=
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-02 16:21 +0800, Gary Yang wrote:
> Add a driver for the USB/DP combo PHY found on the CIX Sky1 SoC. A
> single PHY instance drives one SuperSpeedPlus USB lane and one
> DisplayPort lane of a USB Type-C port, and exposes the two lanes as
> separate child PHYs so that the USB and DP controllers can bind to
> them independently.
> 
> The PHY supports Type-C plug orientation switching and lane muxing
> between USB and DP, both driven through the S5 system controller. It
> registers a Type-C switch and mux with the Type-C class, so the
> orientation and mode decisions are taken by the connector driver
> instead of the PHY.
> 
> The bootloader may hand over the port already initialized; in that
> case the first power_on calls skip the re-initialization.
> 

How is this accomplished?

> Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  MAINTAINERS                     |    1 +
>  drivers/phy/Kconfig             |    1 +
>  drivers/phy/Makefile            |    1 +
>  drivers/phy/cix/Kconfig         |   22 +
>  drivers/phy/cix/Makefile        |    2 +
>  drivers/phy/cix/phy-cix-usbdp.c | 1477 +++++++++++++++++++++++++++++++
>  drivers/phy/cix/phy-cix-usbdp.h |  265 ++++++
>  7 files changed, 1769 insertions(+)
>  create mode 100644 drivers/phy/cix/Kconfig
>  create mode 100644 drivers/phy/cix/Makefile
>  create mode 100644 drivers/phy/cix/phy-cix-usbdp.c
>  create mode 100644 drivers/phy/cix/phy-cix-usbdp.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8fb940a3ea3b..ed595861174b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2906,6 +2906,7 @@ F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
>  F:	Documentation/devicetree/bindings/phy/cix,sky1-usbdp-phy.yaml
>  F:	arch/arm64/boot/dts/cix/
>  F:	drivers/mailbox/cix-mailbox.c
> +F:	drivers/phy/cix/

This one is also trying to add a new CIX PHY entry:
https://lore.kernel.org/linux-phy/20261102030425.1957585-1-Luo.Liu@cixtech.com

Can you please co-ordinate?

>  K:	\bcix\b
>  
>  ARM/CLKDEV SUPPORT
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 105fbe408aa2..876e5857634c 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -176,6 +176,7 @@ source "drivers/phy/axiado/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/canaan/Kconfig"
> +source "drivers/phy/cix/Kconfig"
>  source "drivers/phy/eswin/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
>  source "drivers/phy/hisilicon/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index c6dd02003bbe..5a31c5df1746 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   canaan/	\
> +					   cix/		\
>  					   eswin/	\
>  					   freescale/	\
>  					   hisilicon/	\
> diff --git a/drivers/phy/cix/Kconfig b/drivers/phy/cix/Kconfig
> new file mode 100644
> index 000000000000..769ec302657c
> --- /dev/null
> +++ b/drivers/phy/cix/Kconfig
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for CIX platforms
> +#
> +
> +config PHY_CIX_USBDP
> +	tristate "CIX USB3/DP combo PHY driver"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	depends on RESET_CONTROLLER
> +	depends on TYPEC
> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	select REGMAP
> +	help
> +	  Enable this to support the CIX USB3/DP combo PHY, which provides
> +	  one SuperSpeedPlus USB lane and one DisplayPort lane for a USB
> +	  Type-C port.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called phy-cix-usbdp.
> diff --git a/drivers/phy/cix/Makefile b/drivers/phy/cix/Makefile
> new file mode 100644
> index 000000000000..68b5d7a029a8
> --- /dev/null
> +++ b/drivers/phy/cix/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_CIX_USBDP)		+= phy-cix-usbdp.o
> diff --git a/drivers/phy/cix/phy-cix-usbdp.c b/drivers/phy/cix/phy-cix-usbdp.c
> new file mode 100644
> index 000000000000..d596e89c74f7
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usbdp.c
> @@ -0,0 +1,1477 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * phy driver for cdn_sd0804_t7g_typec

No copyright?

> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
> +
> +#include "phy-cix-usbdp.h"
> +
> +enum {
> +	UDPHY_MODE_NONE		= 0,
> +	UDPHY_MODE_USB		= BIT(0),
> +	UDPHY_MODE_DP		= BIT(1),
> +	UDPHY_MODE_DP_USB	= BIT(1) | BIT(0),
> +};
> +
> +#define PHY_LANE_MUX_USB			0
> +#define PHY_LANE_MUX_DP				1
> +
> +struct cix_udphy;
> +
> +struct cix_udphy_con_dir {
> +	u16 offset;
> +	u8 bit;
> +};
> +
> +struct cix_udphy_cfg {
> +	const struct cix_udphy_con_dir *con_dir;
> +	int (*udphy_init)(struct cix_udphy *udphy);
> +	int (*udphy_exit)(struct cix_udphy *udphy);
> +};
> +
> +/*
> + * USB 3.0/3.1 Type C Alt Mode
> + *   port 0: USB_TCAM; port 1, DP, 8.1 Gbps by default
> + */
> +static const struct reg_sequence sky1_udphy_usbdp_conf_normal[] = {
> +	{CMN_SSM_BIAS_TMR,              0x0018},
> +	{CMN_PLLSM0_PLLPRE_TMR,         0x0030},
> +	{CMN_PLLSM0_PLLLOCK_TMR,        0x00f0},
> +	{CMN_PLLSM1_PLLPRE_TMR,         0x0030},
> +	{CMN_PLLSM1_PLLLOCK_TMR,        0x00f0},
> +	{CMN_BGCAL_INIT_TMR,            0x0078},
> +	{CMN_BGCAL_ITER_TMR,            0x0078},
> +	{CMN_IBCAL_INIT_TMR,            0x0018},
> +	{CMN_TXPUCAL_INIT_TMR,          0x001d},
> +	{CMN_TXPDCAL_INIT_TMR,          0x001d},
> +	{CMN_RXCAL_INIT_TMR,            0x02d0},
> +	{CMN_SD_CAL_PLLCNT_START,       0x0137},
> +
> +	{RX_SDCAL0_INIT_TMR_LANE0,      0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE1,      0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE2,      0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE3,      0x0018},
> +	{RX_SDCAL0_ITER_TMR_LANE0,      0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE1,      0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE2,      0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE3,      0x0078},
> +	{RX_SDCAL1_INIT_TMR_LANE0,      0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE1,      0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE2,      0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE3,      0x0018},
> +	{RX_SDCAL1_ITER_TMR_LANE0,      0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE1,      0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE2,      0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE3,      0x0078},
> +	{TX_RCVDET_ST_TMR_LANE0,        0x0960},
> +	{TX_RCVDET_ST_TMR_LANE1,        0x0960},
> +	{TX_RCVDET_ST_TMR_LANE2,        0x0960},
> +	{TX_RCVDET_ST_TMR_LANE3,        0x0960},
> +
> +	{CMN_PDIAG_PLL0_CLK_SEL_M0,     0x8600},
> +	{CMN_PDIAG_PLL1_CLK_SEL_M0,     0x0601},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE0,   0x0041},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE1,   0x0041},
> +	{XCVR_DIAG_HSCLK_SEL_LANE2,     0x0001},
> +	{XCVR_DIAG_HSCLK_SEL_LANE3,     0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE2,     0x0000},
> +	{XCVR_DIAG_HSCLK_DIV_LANE3,     0x0000},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE2,   0x0019},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE3,   0x0019},
> +
> +	{CMN_PLL0_DSM_DIAG_M0,          0x0004},
> +	{CMN_PLL1_DSM_DIAG_M0,          0x8004},
> +	{CMN_PDIAG_PLL1_ITRIM_M0,       0x003f},
> +	{CMN_PDIAG_PLL0_CP_PADJ_M0,     0x0B17},
> +	{CMN_PDIAG_PLL1_CP_PADJ_M0,     0x0B17},
> +	{CMN_PDIAG_PLL0_CP_IADJ_M0,     0x0E01},
> +	{CMN_PDIAG_PLL1_CP_IADJ_M0,     0x0E01},
> +	{CMN_PDIAG_PLL0_FILT_PADJ_M0,   0x0D05},
> +	{CMN_PDIAG_PLL1_FILT_PADJ_M0,   0x0D05},

Use lower caps for hex.

> +
> +	{CMN_PLL0_INTDIV_M0,            0x01A0},
> +	{CMN_PLL1_INTDIV_M0,            0x01C2},
> +	{CMN_PLL0_FRACDIVL_M0,          0xAAAB},
> +
> +	{CMN_PLL1_FRACDIVL_M0,          0x0000}, /* reset value. */
> +
> +	{CMN_PLL0_FRACDIVH_M0,          0x0002},
> +	{CMN_PLL1_FRACDIVH_M0,          0x0002},
> +	{CMN_PLL0_HIGH_THR_M0,          0x0116},
> +	{CMN_PLL1_HIGH_THR_M0,          0x012C},
> +	{CMN_PDIAG_PLL0_CTRL_M0,        0x1002},
> +	{CMN_PDIAG_PLL1_CTRL_M0,        0x1002},
> +	{CMN_PLL0_SS_CTRL1_M0,          0x0001},
> +	{CMN_PLL1_SS_CTRL1_M0,          0x0001},
> +	{CMN_PLL0_SS_CTRL2_M0,          0x0416},
> +	{CMN_PLL1_SS_CTRL2_M0,          0x044F},
> +	{CMN_PLL0_SS_CTRL3_M0,          0x007C},
> +	{CMN_PLL1_SS_CTRL3_M0,          0x007F},
> +	{CMN_PLL0_SS_CTRL4_M0,          0x0003},
> +	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
> +	{CMN_PLL0_VCOCAL_INIT_TMR,      0x00F0},
> +	{CMN_PLL1_VCOCAL_INIT_TMR,      0x00F0},
> +	{CMN_PLL0_VCOCAL_ITER_TMR,      0x0004},
> +	{CMN_PLL1_VCOCAL_ITER_TMR,      0x0004},
> +	{CMN_PLL0_VCOCAL_REFTIM_START,  0x02F8},
> +	{CMN_PLL1_VCOCAL_REFTIM_START,  0x02F8},
> +	{CMN_PLL0_VCOCAL_PLLCNT_START,  0x02F6},
> +	{CMN_PLL1_VCOCAL_PLLCNT_START,  0x02F6},
> +	{CMN_PLL0_VCOCAL_TCTRL,         0x0003},
> +	{CMN_PLL1_VCOCAL_TCTRL,         0x0003},
> +	{CMN_PLL0_LOCK_REFCNT_START,    0x00BF},
> +	{CMN_PLL1_LOCK_REFCNT_START,    0x00BF},
> +	{CMN_PLL0_LOCK_PLLCNT_START,    0x00BF},
> +	{CMN_PLL1_LOCK_PLLCNT_START,    0x00BF},
> +	{CMN_PLL0_LOCK_PLLCNT_THR,      0x0005},
> +	{CMN_PLL1_LOCK_PLLCNT_THR,      0x0005},
> +
> +	/* usb_part */
> +	{PHY_PMA_LANE_MAP,              0x5100},
> +	{PHY_LANE_OFF_CTRL,             0x0100},
> +	{PHY_PIPE_USB3_GEN2_PRE_CFG0,   0x0A0A},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG0,  0x1000},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG1,  0x0010},
> +	{CMN_CDIAG_CDB_PWRI_OVRD,       0x8200},
> +	{CMN_CDIAG_XCVRC_PWRI_OVRD,     0x8200},
> +	{TX_PSC_A0_LANE0,               0x02FF},
> +	{TX_PSC_A1_LANE0,               0x06AF},
> +	{TX_PSC_A2_LANE0,               0x06AE},
> +	{TX_PSC_A3_LANE0,               0x06AE},
> +	{RX_PSC_A0_LANE1,               0x0D1D},
> +	{RX_PSC_A1_LANE1,               0x0D1D},
> +	{RX_PSC_A2_LANE1,               0x0D00},
> +	{RX_PSC_A3_LANE1,               0x0500},
> +	{TX_TXCC_CTRL_LANE0,            0x2A82},
> +	{TX_TXCC_CPOST_MULT_01_LANE0,   0x0014},
> +	{TX_TXCC_MGNFS_MULT_000_LANE0,  0x0007},
> +	{RX_SIGDET_HL_FILT_TMR_LANE1,   0x0013},
> +	{RX_REE_GCSM1_CTRL_LANE1,       0x0000},
> +	{RX_REE_ATTEN_THR_LANE1,        0x0C02},
> +	{RX_REE_SMGM_CTRL1_LANE1,       0x0330},
> +	{RX_REE_SMGM_CTRL2_LANE1,       0x0300},
> +	{XCVR_DIAG_PSC_OVRD_LANE1,      0x0003},
> +	{RX_DIAG_SIGDET_TUNE_LANE1,     0x1004},
> +	{RX_DIAG_NQST_CTRL_LANE1,       0x00F9},
> +	{RX_DIAG_DFE_AMP_TUNE_2_LANE1,  0x0C01},
> +	{RX_DIAG_DFE_AMP_TUNE_3_LANE1,  0x0002},
> +	{RX_DIAG_PI_CAP_LANE1,          0x0000},
> +	{RX_DIAG_PI_RATE_LANE1,         0x0031},
> +	{RX_DIAG_ACYA_LANE0,            0x0002},
> +	{RX_CDRLF_CNFG_LANE1,           0x018C},
> +	{RX_CDRLF_CNFG3_LANE1,          0x0003},
> +	/* usb adding to upspeed */
> +	{XCVR_DIAG_BIDI_CTRL_LANE0,     0x000f}, /* new add */
> +	{XCVR_DIAG_BIDI_CTRL_LANE1,     0x00F0}, /* new add */
> +
> +	/* dp_part */
> +	{PHY_PMA_ISO_PLL_CTRL0,         0x000B},
> +	{PHY_PMA_ISO_PLL_CTRL1,         0x2224},
> +
> +	{TX_PSC_A0_LANE2,              0x00FB},
> +	{TX_PSC_A0_LANE3,              0x00FB},
> +	{TX_PSC_A2_LANE2,              0x04AA},
> +	{TX_PSC_A2_LANE3,              0x04AA},
> +	{TX_PSC_A3_LANE2,              0x04AA},
> +	{TX_PSC_A3_LANE3,              0x04AA},
> +	{RX_PSC_A0_LANE2,              0x0000},
> +	{RX_PSC_A0_LANE3,              0x0000},
> +	{RX_PSC_A2_LANE2,              0x0000},
> +	{RX_PSC_A2_LANE3,              0x0000},
> +	{RX_PSC_A3_LANE2,              0x0000},
> +	{RX_PSC_A3_LANE3,              0x0000},
> +	{RX_PSC_CAL_LANE2,             0x0000},
> +	{RX_PSC_CAL_LANE3,             0x0000},
> +	{XCVR_DIAG_BIDI_CTRL_LANE2,    0x000F},
> +	{XCVR_DIAG_BIDI_CTRL_LANE3,    0x000F},
> +	{RX_REE_GCSM1_CTRL_LANE2,      0x0000},
> +	{RX_REE_GCSM1_CTRL_LANE3,      0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE2,      0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE3,      0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE2,    0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE3,    0x0000},
> +
> +	{CMN_DIAG_GPANA_0,             0x0100}, /* new add */
> +};
> +
> +/*
> + * TYPEC_ALT_MODE_DP
> + *   DP only
> + */
> +static const struct reg_sequence sky1_udphy_dp_conf[] = {
> +	{CMN_SSM_BIAS_TMR,              0x0018},
> +	{CMN_PLLSM0_PLLPRE_TMR,         0x0030},
> +	{CMN_PLLSM0_PLLLOCK_TMR,        0x00f0},
> +	{CMN_PLLSM1_PLLPRE_TMR,         0x0030},
> +	{CMN_PLLSM1_PLLLOCK_TMR,        0x00f0},
> +	{CMN_BGCAL_INIT_TMR,            0x0078},
> +	{CMN_BGCAL_ITER_TMR,            0x0078},
> +	{CMN_IBCAL_INIT_TMR,            0x0018},
> +	{CMN_TXPUCAL_INIT_TMR,          0x001d},
> +	{CMN_TXPDCAL_INIT_TMR,          0x001d},
> +	{CMN_RXCAL_INIT_TMR,            0x02d0},
> +	{CMN_SD_CAL_PLLCNT_START,       0x0137},
> +	{RX_SDCAL0_INIT_TMR_LANE0,      0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE1,      0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE2,      0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE3,      0x0018},
> +	{RX_SDCAL0_ITER_TMR_LANE0,      0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE1,      0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE2,      0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE3,      0x0078},
> +	{RX_SDCAL1_INIT_TMR_LANE0,      0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE1,      0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE2,      0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE3,      0x0018},
> +	{RX_SDCAL1_ITER_TMR_LANE0,      0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE1,      0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE2,      0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE3,      0x0078},
> +	{TX_RCVDET_ST_TMR_LANE0,        0x0960},
> +	{TX_RCVDET_ST_TMR_LANE1,        0x0960},
> +	{TX_RCVDET_ST_TMR_LANE2,        0x0960},
> +	{TX_RCVDET_ST_TMR_LANE3,        0x0960},
> +	{CMN_PDIAG_PLL0_CLK_SEL_M0,     0x8600},
> +	{CMN_PDIAG_PLL1_CLK_SEL_M0,     0x0701},
> +	{XCVR_DIAG_HSCLK_SEL_LANE0,     0x0001},
> +	{XCVR_DIAG_HSCLK_SEL_LANE1,     0x0001},
> +	{XCVR_DIAG_HSCLK_SEL_LANE2,     0x0001},
> +	{XCVR_DIAG_HSCLK_SEL_LANE3,     0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE0,     0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE1,     0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE2,     0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE3,     0x0001},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE0,   0x0019},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE1,   0x0019},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE2,   0x0019},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE3,   0x0019},
> +	{CMN_PLL0_DSM_DIAG_M0,          0x0004},
> +	{CMN_PLL1_DSM_DIAG_M0,          0x8004},
> +	{CMN_PDIAG_PLL1_ITRIM_M0,       0x003f},
> +
> +	{CMN_PDIAG_PLL0_CP_PADJ_M0,     0x0b17},
> +	{CMN_PDIAG_PLL1_CP_PADJ_M0,     0x0b17},
> +	{CMN_PDIAG_PLL0_CP_IADJ_M0,     0x0e01},
> +	{CMN_PDIAG_PLL1_CP_IADJ_M0,     0x0e01},
> +	{CMN_PDIAG_PLL0_FILT_PADJ_M0,   0x0d05},
> +	{CMN_PDIAG_PLL1_FILT_PADJ_M0,   0x0d05},
> +	{CMN_PLL0_INTDIV_M0,            0x01a0},
> +	{CMN_PLL1_INTDIV_M0,            0x01c2},
> +	{CMN_PLL0_FRACDIVL_M0,          0xaaab},
> +	{CMN_PLL1_FRACDIVL_M0,          0x0000},
> +	{CMN_PLL0_FRACDIVH_M0,          0x0002},
> +	{CMN_PLL1_FRACDIVH_M0,          0x0002},
> +	{CMN_PLL0_HIGH_THR_M0,          0x0116},
> +	{CMN_PLL1_HIGH_THR_M0,          0x012c},
> +	{CMN_PDIAG_PLL0_CTRL_M0,        0x1002},
> +	{CMN_PDIAG_PLL1_CTRL_M0,        0x1002},
> +
> +	{CMN_PLL0_SS_CTRL1_M0,          0x0001},
> +	{CMN_PLL1_SS_CTRL1_M0,          0x0001},
> +	{CMN_PLL0_SS_CTRL2_M0,          0x0416},
> +	{CMN_PLL1_SS_CTRL2_M0,          0x044F},
> +	{CMN_PLL0_SS_CTRL3_M0,          0x007C},
> +	{CMN_PLL1_SS_CTRL3_M0,          0x007F},
> +	{CMN_PLL0_SS_CTRL4_M0,          0x0003},
> +	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
> +
> +	{CMN_PLL0_VCOCAL_INIT_TMR,      0x00f0},
> +	{CMN_PLL1_VCOCAL_INIT_TMR,      0x00f0},
> +	{CMN_PLL0_VCOCAL_ITER_TMR,      0x0004},
> +	{CMN_PLL1_VCOCAL_ITER_TMR,      0x0004},
> +	{CMN_PLL0_VCOCAL_REFTIM_START,  0x02f8},
> +	{CMN_PLL1_VCOCAL_REFTIM_START,  0x02f8},
> +	{CMN_PLL0_VCOCAL_PLLCNT_START,  0x02f6},
> +	{CMN_PLL1_VCOCAL_PLLCNT_START,  0x02f6},
> +	{CMN_PLL0_VCOCAL_TCTRL,         0x0003},
> +	{CMN_PLL1_VCOCAL_TCTRL,         0x0003},
> +	{CMN_PLL0_LOCK_REFCNT_START,    0x00bf},
> +	{CMN_PLL1_LOCK_REFCNT_START,    0x00bf},
> +	{CMN_PLL0_LOCK_PLLCNT_START,    0x00bf},
> +	{CMN_PLL1_LOCK_PLLCNT_START,    0x00bf},
> +	{CMN_PLL0_LOCK_PLLCNT_THR,      0x0005},
> +	{CMN_PLL1_LOCK_PLLCNT_THR,      0x0005},
> +	{PHY_PMA_LANE_MAP,              0x51D9},
> +	{PHY_LANE_OFF_CTRL,             0x0100},
> +	{PHY_PIPE_USB3_GEN2_PRE_CFG0,   0x0a0a},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG0,  0x1000},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG1,  0x0010},
> +	{CMN_CDIAG_CDB_PWRI_OVRD,       0x8200},
> +	{CMN_CDIAG_XCVRC_PWRI_OVRD,     0x8200},
> +
> +	{PHY_PMA_ISO_PLL_CTRL0,         0x000b},
> +	{PHY_PMA_ISO_PLL_CTRL1,         0x2224},
> +	{TX_PSC_A0_LANE0,               0x00fb},
> +	{TX_PSC_A0_LANE1,               0x00fb},
> +	{TX_PSC_A0_LANE2,               0x00fb},
> +	{TX_PSC_A0_LANE3,               0x00fb},
> +	{TX_PSC_A2_LANE0,               0x04aa},
> +	{TX_PSC_A2_LANE1,               0x04aa},
> +	{TX_PSC_A2_LANE2,               0x04aa},
> +	{TX_PSC_A2_LANE3,               0x04aa},
> +	{TX_PSC_A3_LANE0,               0x04aa},
> +	{TX_PSC_A3_LANE1,               0x04aa},
> +	{TX_PSC_A3_LANE2,               0x04aa},
> +	{TX_PSC_A3_LANE3,               0x04aa},
> +	{RX_PSC_A0_LANE0,               0x0000},
> +	{RX_PSC_A0_LANE1,               0x0000},
> +	{RX_PSC_A0_LANE2,               0x0000},
> +	{RX_PSC_A0_LANE3,               0x0000},
> +	{RX_PSC_A2_LANE0,               0x0000},
> +	{RX_PSC_A2_LANE1,               0x0000},
> +	{RX_PSC_A2_LANE2,               0x0000},
> +	{RX_PSC_A2_LANE3,               0x0000},
> +	{RX_PSC_A3_LANE0,               0x0000},
> +	{RX_PSC_A3_LANE1,               0x0000},
> +	{RX_PSC_A3_LANE2,               0x0000},
> +	{RX_PSC_A3_LANE3,               0x0000},
> +	{RX_PSC_CAL_LANE0,              0x0000},
> +	{RX_PSC_CAL_LANE1,              0x0000},
> +	{RX_PSC_CAL_LANE2,              0x0000},
> +	{RX_PSC_CAL_LANE3,              0x0000},
> +	{XCVR_DIAG_BIDI_CTRL_LANE0,     0x000f},
> +	{XCVR_DIAG_BIDI_CTRL_LANE1,     0x000f},
> +	{XCVR_DIAG_BIDI_CTRL_LANE2,     0x000f},
> +	{XCVR_DIAG_BIDI_CTRL_LANE3,     0x000f},
> +	{RX_REE_GCSM1_CTRL_LANE0,       0x0000},
> +	{RX_REE_GCSM1_CTRL_LANE1,       0x0000},
> +	{RX_REE_GCSM1_CTRL_LANE2,       0x0000},
> +	{RX_REE_GCSM1_CTRL_LANE3,       0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE0,       0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE1,       0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE2,       0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE3,       0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE0,     0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE1,     0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE2,     0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE3,     0x0000},
> +	{CMN_DIAG_GPANA_0,              0x0100},
> +};
> +
> +static const struct reg_sequence sky1_udphy_dp_8p1_conf[] = {
> +	{CMN_PDIAG_PLL1_ITRIM_M0,       0x007f},
> +	{CMN_PLL1_SS_CTRL2_M0,          0x0430},
> +	{CMN_PLL1_SS_CTRL3_M0,          0x0062},
> +	{CMN_PLL1_SS_CTRL4_M0,          0x0004},
> +};
> +
> +static const struct reg_sequence sky1_udphy_dp_partial_conf[] = {
> +	{CMN_PDIAG_PLL1_ITRIM_M0,       0x003f},
> +	{CMN_PLL1_SS_CTRL2_M0,          0x044F},
> +	{CMN_PLL1_SS_CTRL3_M0,          0x007F},
> +	{CMN_PLL1_SS_CTRL4_M0,          0x0003},
> +};
> +
> +static const struct reg_sequence sky1_udphy_usbdp_conf_flip[] = {
> +	/* common_part */
> +	{CMN_SSM_BIAS_TMR,             0x0018},
> +	{CMN_PLLSM0_PLLPRE_TMR,        0x0030},
> +	{CMN_PLLSM0_PLLLOCK_TMR,       0x00F0},
> +	{CMN_PLLSM1_PLLPRE_TMR,        0x0030},
> +	{CMN_PLLSM1_PLLLOCK_TMR,       0x00F0},
> +	{CMN_BGCAL_INIT_TMR,           0x0078},
> +	{CMN_BGCAL_ITER_TMR,           0x0078},
> +	{CMN_IBCAL_INIT_TMR,           0x0018},
> +	{CMN_TXPUCAL_INIT_TMR,         0x001D},
> +	{CMN_TXPDCAL_INIT_TMR,         0x001D},
> +	{CMN_RXCAL_INIT_TMR,           0x02D0},
> +	{CMN_SD_CAL_PLLCNT_START,      0x0137},
> +	{RX_SDCAL0_INIT_TMR_LANE0,     0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE1,     0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE2,     0x0018},
> +	{RX_SDCAL0_INIT_TMR_LANE3,     0x0018},
> +	{RX_SDCAL0_ITER_TMR_LANE0,     0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE1,     0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE2,     0x0078},
> +	{RX_SDCAL0_ITER_TMR_LANE3,     0x0078},
> +	{RX_SDCAL1_INIT_TMR_LANE0,     0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE1,     0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE2,     0x0018},
> +	{RX_SDCAL1_INIT_TMR_LANE3,     0x0018},
> +	{RX_SDCAL1_ITER_TMR_LANE0,     0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE1,     0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE2,     0x0078},
> +	{RX_SDCAL1_ITER_TMR_LANE3,     0x0078},
> +	{TX_RCVDET_ST_TMR_LANE0,       0x0960},
> +	{TX_RCVDET_ST_TMR_LANE1,       0x0960},
> +	{TX_RCVDET_ST_TMR_LANE2,       0x0960},
> +	{TX_RCVDET_ST_TMR_LANE3,       0x0960},
> +	{CMN_PDIAG_PLL0_CLK_SEL_M0,    0x8600},
> +	{CMN_PDIAG_PLL1_CLK_SEL_M0,    0x0601},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE2,  0x0041},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE3,  0x0041},
> +	{XCVR_DIAG_HSCLK_SEL_LANE0,    0x0001},
> +	{XCVR_DIAG_HSCLK_SEL_LANE1,    0x0001},
> +	{XCVR_DIAG_HSCLK_DIV_LANE0,    0x0000},
> +	{XCVR_DIAG_HSCLK_DIV_LANE1,    0x0000},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE0,  0x0019},
> +	{XCVR_DIAG_PLLDRC_CTRL_LANE1,  0x0019},
> +	{CMN_PLL0_DSM_DIAG_M0,         0x0004},
> +	{CMN_PLL1_DSM_DIAG_M0,         0x8004},
> +	{CMN_PDIAG_PLL1_ITRIM_M0,      0x003f},
> +	{CMN_PDIAG_PLL0_CP_PADJ_M0,    0x0B17},
> +	{CMN_PDIAG_PLL1_CP_PADJ_M0,    0x0B17},
> +	{CMN_PDIAG_PLL0_CP_IADJ_M0,    0x0E01},
> +	{CMN_PDIAG_PLL1_CP_IADJ_M0,    0x0E01},
> +	{CMN_PDIAG_PLL0_FILT_PADJ_M0,  0x0D05},
> +	{CMN_PDIAG_PLL1_FILT_PADJ_M0,  0x0D05},
> +
> +	{CMN_PLL0_INTDIV_M0,           0x01A0},
> +	{CMN_PLL1_INTDIV_M0,           0x01C2},
> +	{CMN_PLL0_FRACDIVL_M0,         0xAAAB},
> +
> +	{CMN_PLL1_FRACDIVL_M0,         0x0000}, /* reset value */
> +
> +	{CMN_PLL0_FRACDIVH_M0,         0x0002},
> +	{CMN_PLL1_FRACDIVH_M0,         0x0002},
> +	{CMN_PLL0_HIGH_THR_M0,         0x0116},
> +	{CMN_PLL1_HIGH_THR_M0,         0x012C},
> +	{CMN_PDIAG_PLL0_CTRL_M0,       0x1002},
> +	{CMN_PDIAG_PLL1_CTRL_M0,       0x1002},
> +	{CMN_PLL0_SS_CTRL1_M0,         0x0001},
> +	{CMN_PLL1_SS_CTRL1_M0,         0x0001},
> +	{CMN_PLL0_SS_CTRL2_M0,         0x0416},
> +	{CMN_PLL1_SS_CTRL2_M0,         0x044F},
> +	{CMN_PLL0_SS_CTRL3_M0,         0x007C},
> +	{CMN_PLL1_SS_CTRL3_M0,         0x007F},
> +	{CMN_PLL0_SS_CTRL4_M0,         0x0003},
> +	{CMN_PLL1_SS_CTRL4_M0,         0x0003},
> +	{CMN_PLL0_VCOCAL_INIT_TMR,     0x00F0},
> +	{CMN_PLL1_VCOCAL_INIT_TMR,     0x00F0},
> +	{CMN_PLL0_VCOCAL_ITER_TMR,     0x0004},
> +	{CMN_PLL1_VCOCAL_ITER_TMR,     0x0004},
> +	{CMN_PLL0_VCOCAL_REFTIM_START, 0x02F8},
> +	{CMN_PLL1_VCOCAL_REFTIM_START, 0x02F8},
> +	{CMN_PLL0_VCOCAL_PLLCNT_START, 0x02F6},
> +	{CMN_PLL1_VCOCAL_PLLCNT_START, 0x02F6},
> +	{CMN_PLL0_VCOCAL_TCTRL,        0x0003},
> +	{CMN_PLL1_VCOCAL_TCTRL,        0x0003},
> +	{CMN_PLL0_LOCK_REFCNT_START,   0x00BF},
> +	{CMN_PLL1_LOCK_REFCNT_START,   0x00BF},
> +	{CMN_PLL0_LOCK_PLLCNT_START,   0x00BF},
> +	{CMN_PLL1_LOCK_PLLCNT_START,   0x00BF},
> +	{CMN_PLL0_LOCK_PLLCNT_THR,     0x0005},
> +	{CMN_PLL1_LOCK_PLLCNT_THR,     0x0005},
> +	/* usb_part */
> +	{PHY_PMA_LANE_MAP,             0x5100},
> +	{PHY_LANE_OFF_CTRL,            0x0100},
> +	{PHY_PIPE_USB3_GEN2_PRE_CFG0,  0x0A0A},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG0, 0x1000},
> +	{PHY_PIPE_USB3_GEN2_POST_CFG1, 0x0010},
> +	{CMN_CDIAG_CDB_PWRI_OVRD,      0x8200},
> +	{CMN_CDIAG_XCVRC_PWRI_OVRD,    0x8200},
> +	{TX_PSC_A0_LANE3,              0x02FF},
> +	{TX_PSC_A1_LANE3,              0x06AF},
> +	{TX_PSC_A2_LANE3,              0x06AE},
> +	{TX_PSC_A3_LANE3,              0x06AE},
> +	{RX_PSC_A0_LANE2,              0x0D1D},
> +	{RX_PSC_A1_LANE2,              0x0D1D},
> +	{RX_PSC_A2_LANE2,              0x0D00},
> +	{RX_PSC_A3_LANE2,              0x0500},
> +	{TX_TXCC_CTRL_LANE3,           0x2A82},
> +	{TX_TXCC_CPOST_MULT_01_LANE3,  0x0014},
> +	{TX_TXCC_MGNFS_MULT_000_LANE3, 0x0007},
> +	{RX_SIGDET_HL_FILT_TMR_LANE2,  0x0013},
> +	{RX_REE_GCSM1_CTRL_LANE2,      0x0000},
> +	{RX_REE_ATTEN_THR_LANE2,       0x0C02},
> +	{RX_REE_SMGM_CTRL1_LANE2,      0x0330},
> +	{RX_REE_SMGM_CTRL2_LANE2,      0x0300},
> +	{XCVR_DIAG_PSC_OVRD_LANE2,     0x0003},
> +	{RX_DIAG_SIGDET_TUNE_LANE2,    0x1004},
> +	{RX_DIAG_NQST_CTRL_LANE2,      0x00F9},
> +	{RX_DIAG_DFE_AMP_TUNE_2_LANE2, 0x0C01},
> +	{RX_DIAG_DFE_AMP_TUNE_3_LANE2, 0x0002},
> +	{RX_DIAG_PI_CAP_LANE2,         0x0000},
> +	{RX_DIAG_PI_RATE_LANE2,        0x0031},
> +	{RX_DIAG_ACYA_LANE3,           0x0002},
> +	{RX_CDRLF_CNFG_LANE2,          0x018C},
> +	{RX_CDRLF_CNFG3_LANE2,         0x0003},
> +	/* usb adding to upspeed */
> +	{XCVR_DIAG_BIDI_CTRL_LANE2,    0x00f0},
> +	{XCVR_DIAG_BIDI_CTRL_LANE3,    0x000f},
> +
> +	/* dp_part */
> +	{PHY_PMA_ISO_PLL_CTRL0,        0x000B},
> +	{PHY_PMA_ISO_PLL_CTRL1,        0x2224},
> +
> +	/* lane0, lane1 */
> +	{TX_PSC_A0_LANE0,              0x00FB},
> +	{TX_PSC_A0_LANE1,              0x00FB},
> +	{TX_PSC_A2_LANE0,              0x04AA},
> +	{TX_PSC_A2_LANE1,              0x04AA},
> +	{TX_PSC_A3_LANE0,              0x04AA},
> +	{TX_PSC_A3_LANE1,              0x04AA},
> +	{RX_PSC_A0_LANE0,              0x0000},
> +	{RX_PSC_A0_LANE1,              0x0000},
> +	{RX_PSC_A2_LANE0,              0x0000},
> +	{RX_PSC_A2_LANE1,              0x0000},
> +	{RX_PSC_A3_LANE0,              0x0000},
> +	{RX_PSC_A3_LANE1,              0x0000},
> +	{RX_PSC_CAL_LANE0,             0x0000},
> +	{RX_PSC_CAL_LANE1,             0x0000},
> +	{XCVR_DIAG_BIDI_CTRL_LANE0,    0x000F},
> +	{XCVR_DIAG_BIDI_CTRL_LANE1,    0x000F},
> +	{RX_REE_GCSM1_CTRL_LANE0,      0x0000},
> +	{RX_REE_GCSM1_CTRL_LANE1,      0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE0,      0x0000},
> +	{RX_REE_GCSM2_CTRL_LANE1,      0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE0,    0x0000},
> +	{RX_REE_PERGCSM_CTRL_LANE1,    0x0000},
> +
> +	{CMN_DIAG_GPANA_0,             0x100},
> +};
> +
> +static const struct cix_udphy_con_dir sky1_udphy_con_dir[] = {
> +	{0x420, 0},
> +	{0x420, 1},
> +	{0x420, 2},
> +	{0x420, 3}
> +};
> +
> +struct cix_udphy {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct regmap *phy_regmap;
> +	struct regmap *usbphy_syscon;
> +	struct reset_control *preset;
> +	struct reset_control *reset;
> +	struct clk *apb_clk;
> +	struct typec_switch_dev *sw;
> +	struct typec_mux_dev *mux;
> +	struct mutex mutex; /* mutex to protect access to individual PHYs */
> +	bool flip;
> +	u8 cur_mode;
> +	u8 next_mode;
> +	u32 id;
> +	const struct cix_udphy_cfg *cfg;
> +};
> +
> +/* Link rate change */
> +struct phy_link_cfg {
> +	u32 hsclk_div;
> +	u32 clk_sel;
> +	u32 pll_intdiv;
> +	u32 pll_fracdivl;
> +	u32 pll_high_thr;
> +};
> +
> +static const struct phy_link_cfg link_cfg[] = {
> +	{ 0x0002, 0x0f01, 0x0195, 0x0000, 0x010e },  /* 1.62gbps */
> +	{ 0x0001, 0x0701, 0x01c2, 0x0000, 0x012c },  /* 2.70gbps */
> +	{ 0x0000, 0x0301, 0x01c2, 0x0000, 0x012c },  /* 5.40gbps */
> +	{ 0x0000, 0x0200, 0x0151, 0x8000, 0x00e2 },  /* 8.10gbps */
> +};
> +
> +struct phy_voltage_conf {
> +	u32 tx_txcc_ctrl;
> +	u32 drv_diag_tx_drv;
> +	u32 tx_txcc_mgnfc_mult_000;
> +	u32 tx_txcc_cpost_mult_00;
> +};
> +
> +static const struct phy_voltage_conf volt_cfg[] = {
> +	{ 0x08A4, 0x0003, 0x0028, 0x0000 }, /* swing level == 0 */
> +	{ 0x08A4, 0x0003, 0x001f, 0x0014 },
> +	{ 0x08A4, 0x0003, 0x0012, 0x0020 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x0027 },
> +	{ 0x08A4, 0x0003, 0x001f, 0x0000 }, /* swing level == 1 */
> +	{ 0x08A4, 0x0003, 0x0013, 0x0012 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x001f },
> +	{ 0x08A4, 0x0003, 0x0000, 0x001f },
> +	{ 0x08A4, 0x0003, 0x0013, 0x0000 }, /* swing level == 2 */
> +	{ 0x08A4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x0013 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x0000 }, /* swing level == 3 */
> +	{ 0x08A4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x0000 },
> +	{ 0x08A4, 0x0003, 0x0000, 0x0000 },
> +};
> +
> +static int udphy_dplane_get(struct cix_udphy *udphy)
> +{
> +	int dp_lanes;
> +
> +	switch (udphy->next_mode) {
> +	case UDPHY_MODE_DP:
> +		dp_lanes = 4;
> +		break;
> +	case UDPHY_MODE_DP_USB:
> +		dp_lanes = 2;
> +		break;
> +	case UDPHY_MODE_USB:
> +		fallthrough;
> +	default:
> +		dp_lanes = 0;
> +		break;
> +	}
> +
> +	return dp_lanes;
> +}
> +
> +static int sky1_udphy_clk_enable(struct clk *clk)
> +{
> +	int i, ret = -EBUSY;
> +
> +	/*
> +	 * If the clock could not enable 10 iterations,
> +	 * it considers this clock is broken.
> +	 */

Make use of 80 columns please.

> +	for (i = 0; i < 10; i++) {
> +		ret = clk_prepare_enable(clk);
> +		if (!ret)
> +			return 0;
> +
> +		usleep_range(5000, 6000);
> +	}
> +
> +	return ret;
> +}
> +
> +static int sky1_udphy_exit(struct cix_udphy *udphy)
> +{
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +	clk_disable_unprepare(udphy->apb_clk);
> +	return 0;
> +}
> +
> +static int sky1_udphy_init(struct cix_udphy *udphy)
> +{
> +	int ret;
> +	u32 value;
> +	const struct cix_udphy_con_dir *con_dir = &udphy->cfg->con_dir[udphy->id];

Use reverse X-mas tree order for local variables.

> +
> +	regmap_update_bits(udphy->usbphy_syscon, con_dir->offset,
> +			   GENMASK(con_dir->bit, con_dir->bit),
> +			   udphy->flip << con_dir->bit);
> +
> +	usleep_range(10, 20);
> +
> +	regmap_read(udphy->usbphy_syscon, con_dir->offset, &value);
> +
> +	/* usb rcsu reset is default deassert */
> +	reset_control_assert(udphy->reset);
> +	reset_control_assert(udphy->preset);
> +
> +	ret = sky1_udphy_clk_enable(udphy->apb_clk);
> +	if (ret) {
> +		dev_err(udphy->dev, "Failed to prepare_enable udphy apb clock\n");
> +		return ret;
> +	}
> +
> +	reset_control_deassert(udphy->preset);
> +
> +	if (udphy->next_mode == UDPHY_MODE_DP) {
> +		ret = regmap_multi_reg_write(udphy->phy_regmap, sky1_udphy_dp_conf,
> +					     ARRAY_SIZE(sky1_udphy_dp_conf));
> +
> +		if (ret) {
> +			dev_err(udphy->dev, "Failed to write the reg sequence\n");
> +			goto assert_apb;
> +		}
> +	} else {
> +		if (!udphy->flip) {
> +			ret = regmap_multi_reg_write(udphy->phy_regmap,
> +						     sky1_udphy_usbdp_conf_normal,
> +						     ARRAY_SIZE(sky1_udphy_usbdp_conf_normal));
> +			if (ret) {
> +				dev_err(udphy->dev, "Failed to write the reg sequence\n");
> +				goto assert_apb;
> +			}
> +		} else {
> +			ret = regmap_multi_reg_write(udphy->phy_regmap,
> +						     sky1_udphy_usbdp_conf_flip,
> +						     ARRAY_SIZE(sky1_udphy_usbdp_conf_flip));
> +			if (ret) {
> +				dev_err(udphy->dev, "Failed to write the reg sequence\n");
> +				goto assert_apb;
> +			}
> +		}
> +	}
> +
> +	reset_control_deassert(udphy->reset);
> +
> +	return 0;
> +
> +assert_apb:
> +	reset_control_assert(udphy->preset);
> +	clk_disable_unprepare(udphy->apb_clk);
> +	return ret;
> +}
> +
> +static const struct cix_udphy_cfg sky1_udphy_cfg = {
> +	.con_dir = sky1_udphy_con_dir,
> +	.udphy_init = sky1_udphy_init,
> +	.udphy_exit = sky1_udphy_exit
> +};
> +
> +static int udphy_regmap_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct cix_udphy *udphy = context;
> +	u32 offset = reg << 2;
> +
> +	writel(val, udphy->base + offset);

Please use writel/readl directly.

> +
> +	return 0;
> +}
> +
> +static int udphy_regmap_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct cix_udphy *udphy = context;
> +	u32 offset = reg << 2;
> +
> +	*val = readl(udphy->base + offset);
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config cix_udphy_regmap_cfg = {
> +	.reg_bits = 32,
> +	/* register width, if =2, then only reg 0 2 4 ...2^n can access */
> +	.reg_stride = 1,
> +	.val_bits = 16,
> +	.fast_io = true,
> +	.reg_write = udphy_regmap_write,
> +	.reg_read = udphy_regmap_read,
> +};
> +
> +static int udphy_orien_sw_set(struct typec_switch_dev *sw,
> +			      enum typec_orientation orien)
> +{
> +	struct cix_udphy *udphy = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&udphy->mutex);

Can you use guard()?

> +
> +	if (orien == TYPEC_ORIENTATION_NONE)
> +		goto unlock_ret;
> +
> +	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> +
> +unlock_ret:
> +	mutex_unlock(&udphy->mutex);
> +	return 0;
> +}
> +
> +static int udphy_setup_orien_switch(struct cix_udphy *udphy)
> +{
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = udphy;
> +	sw_desc.fwnode = dev_fwnode(udphy->dev);
> +	sw_desc.set = udphy_orien_sw_set;
> +
> +	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
> +	if (IS_ERR(udphy->sw)) {
> +		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",

s/register/registering

> +			PTR_ERR(udphy->sw));
> +		return PTR_ERR(udphy->sw);
> +	}
> +
> +	return 0;
> +}
> +
> +static int usbdp_typec_mux_set(struct typec_mux_dev *mux,
> +			       struct typec_mux_state *state)
> +{
> +	struct cix_udphy *udphy = typec_mux_get_drvdata(mux);
> +
> +	mutex_lock(&udphy->mutex);

guard()? Consider using it everywhere where applicable.

> +
> +	switch (state->mode) {
> +	case TYPEC_DP_STATE_C:
> +		fallthrough;
> +	case TYPEC_DP_STATE_E:
> +		udphy->next_mode = UDPHY_MODE_DP;
> +		break;
> +	case TYPEC_DP_STATE_D:
> +		udphy->next_mode = UDPHY_MODE_DP_USB;
> +		break;
> +	case TYPEC_STATE_SAFE:
> +		udphy->next_mode = UDPHY_MODE_USB;
> +		break;
> +	default:
> +		/* usb only handle as usb+dp mode */
> +		udphy->next_mode = UDPHY_MODE_USB;
> +		break;
> +	}
> +
> +	/* TODO: check whether the HPD state needs software */
> +	mutex_unlock(&udphy->mutex);
> +
> +	return 0;
> +}
> +
> +static void udphy_orien_switch_unregister(void *data)
> +{
> +	struct cix_udphy *udphy = data;
> +
> +	typec_switch_unregister(udphy->sw);
> +}
> +
> +static int udphy_setup_typec_mux(struct cix_udphy *udphy)
> +{
> +	struct typec_mux_desc mux_desc = {};
> +
> +	mux_desc.drvdata = udphy;
> +	mux_desc.fwnode = dev_fwnode(udphy->dev);
> +	mux_desc.set = usbdp_typec_mux_set;
> +
> +	udphy->mux = typec_mux_register(udphy->dev, &mux_desc);
> +	if (IS_ERR(udphy->mux)) {
> +		dev_err(udphy->dev, "Error register typec mux: %ld\n",
> +			PTR_ERR(udphy->mux));
> +		return PTR_ERR(udphy->mux);
> +	}
> +
> +	return 0;
> +}
> +
> +static void udphy_typec_mux_unregister(void *data)
> +{
> +	struct cix_udphy *udphy = data;
> +
> +	typec_mux_unregister(udphy->mux);
> +}
> +
> +static int cix_usbdp_phy_power_on(struct cix_udphy *udphy)
> +{
> +	const struct cix_udphy_cfg *phy_cfgs = udphy->cfg;
> +	int ret;
> +
> +	if (udphy->cur_mode == udphy->next_mode)
> +		return 0;
> +
> +	if ((udphy->cur_mode == UDPHY_MODE_USB || udphy->cur_mode == UDPHY_MODE_DP) &&
> +	    udphy->next_mode == UDPHY_MODE_DP_USB)
> +		return 0;
> +
> +	if (phy_cfgs->udphy_init) {
> +		ret = phy_cfgs->udphy_init(udphy);
> +		if (ret) {
> +			dev_err(udphy->dev, "failed to init udphy\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int cix_usbdp_phy_power_off(struct cix_udphy *udphy)
> +{
> +	const struct cix_udphy_cfg *phy_cfgs = udphy->cfg;
> +	int ret;
> +
> +	if (phy_cfgs->udphy_exit) {
> +		ret = phy_cfgs->udphy_exit(udphy);
> +		if (ret) {
> +			dev_err(udphy->dev, "failed to exit udphy\n");
> +			return ret;
> +		}
> +	}
> +
> +	udphy->cur_mode = UDPHY_MODE_NONE;

Newline before return.

> +	return 0;
> +}
> +

[...]

> +static int cix_u3phy_init(struct phy *phy)
> +{
> +	struct cix_udphy *udphy = phy_get_drvdata(phy);
> +	int ret = 0;
> +
> +	mutex_lock(&udphy->mutex);
> +	if (!(udphy->next_mode & UDPHY_MODE_USB))
> +		goto unlock;
> +
> +	if (udphy->cur_mode & UDPHY_MODE_USB)
> +		goto unlock;
> +
> +	ret = cix_usbdp_phy_power_on(udphy);
> +	if (ret)
> +		goto unlock;
> +
> +	udphy->cur_mode |= UDPHY_MODE_USB;
> +
> +unlock:
> +	mutex_unlock(&udphy->mutex);
> +	return ret;
> +}
> +
> +static int cix_u3phy_exit(struct phy *phy)
> +{
> +	struct cix_udphy *udphy = phy_get_drvdata(phy);
> +	int ret = 0;
> +
> +	mutex_lock(&udphy->mutex);
> +
> +	if (!(udphy->cur_mode & UDPHY_MODE_USB))
> +		goto unlock;
> +
> +	udphy->cur_mode &= ~UDPHY_MODE_USB;
> +
> +	if (udphy->cur_mode == UDPHY_MODE_NONE)
> +		ret = cix_usbdp_phy_power_off(udphy);
> +
> +unlock:
> +	mutex_unlock(&udphy->mutex);
> +	return ret;
> +}
> +
> +static int cix_u3phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	if (mode == PHY_MODE_INVALID)
> +		return cix_u3phy_exit(phy);
> +
> +	return cix_u3phy_init(phy);
> +}
> +
> +static const struct phy_ops cix_u3phy_ops = {
> +	.set_mode       = cix_u3phy_set_mode,
> +	.exit		= cix_u3phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +/*
> + * PHY lane to PMA lane mapping for a normal plug orientation
> + *
> + * PMA LANE     C       D                 E
> + * 0          DP TX2   USB TX0          DP TX2
> + * 1          DP TX3   USB RX0          DP TX3
> + * 2          DP TX0   USB RX1/DP TX0   DP TX0
> + * 3          DP TX1   USB TX1/DP TX1   DP TX1
> + *
> + * PHY lane to PMA lane mapping for a flipped plug orientation
> + *
> + * PMA LANE     C       D                 E
> + * 0          DP TX1   USB TX1/DP TX1   DP TX1
> + * 1          DP TX0   USB RX1/DP TX0   DP TX0
> + * 2          DP TX3   USB RX0          DP TX3
> + * 3          DP TX2   USB TX0          DP TX2
> + */
> +static void udphy_set_default_mode(struct cix_udphy *udphy)
> +{
> +	udphy->cur_mode = UDPHY_MODE_NONE;
> +}
> +
> +static int cix_udphy_probe(struct platform_device *pdev)
> +{
> +	struct cix_udphy *udphy;
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	struct device_node *np = dev->of_node;
> +	u32 id;
> +	int ret = 0;

Reverse X-mas order.

> +
> +	udphy = devm_kzalloc(dev, sizeof(*udphy), GFP_KERNEL);
> +	if (!udphy)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, udphy);
> +	udphy->dev = dev;
> +
> +	udphy->usbphy_syscon =
> +		syscon_regmap_lookup_by_phandle_args(np, "cix,usbphy-syscon", 1,
> +						     &id);
> +	if (IS_ERR(udphy->usbphy_syscon))
> +		return dev_err_probe(dev, PTR_ERR(udphy->usbphy_syscon),
> +				     "failed to get usbphy syscon\n");
> +	else if (id >= ARRAY_SIZE(sky1_udphy_con_dir))
> +		return dev_err_probe(dev, -EINVAL, "failed to get id\n");
> +	udphy->id = id;
> +
> +	udphy->cfg = device_get_match_data(dev);
> +	if (!udphy->cfg) {
> +		dev_err(dev, "no OF data can be matched with %pOF node\n", np);

Use dev_err_probe() consistently in probe().

- Mani

