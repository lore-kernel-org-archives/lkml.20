Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910989;
	b=A0q63otVO1Ht/W4j0JUuqso2CqOj3H6OPUebCOzS6L/zbv9xG1QtS8b1N3YDA6o2C+W4
	 RJM1bOTZF4bQvNzQ0op7vz/UM65+HnKVKpA3PcFXEEbHDcZW/jZo8OuKUoPjy4eu0pWsN
	 m67+hIFR5CgPWlViAxk0Zw34dppzvB8l4Rnw5gUzeGFWKgCTTOXJp+C7zhUPLazVZypdI
	 q6EtjHJ8mHpvoxRLAWPhE0btlUWF/jN7QGHEh3rXpd6CwglyasbA2A+LmotZAEPzr99/t
	 G92GEcIlzuY5DSM+b+7chyexjeEEwG08po7xR1CI7Q4xyOuScsAHbkNBKzBkJmjq+zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910989;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=jLMD7Jcy+SufZWp/84cELInAfnlXl2JNyOiu/MIj0FU=;
	b=jc0cvI6VHqhqGNZKGXGOGI6wIMocWmtbPf6EbEEtBEzlAyJbp3RaS8n8S0jytSfWzTyA
	 1+3OKup9mRaWamO8705t7to0M0sRRpkTDJDPXomyLvJYEXHtdlJcI9ltWFtx7Sw8dSzS/
	 EzVU6QNu/+tVM4YFV3/UVZgpjXG+nYGbhGOxk+Wf8J/ymMcOgO4hv5trnOv0BppY/nxB4
	 jzzxGw8S9OxdroLr7MiFbl6W6uiQB0W0bIIlK5DMBBZS4FBvmFYKxwvdOzy2UMwpAVVCQ
	 1Hf36vSHkFm0Rtp4seakB/VTXMdbo1eb0HXUzMkSs5vTVogg6I1B1tbMr9EW8lPyK5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d3z5tUbW;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B142606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B142606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d3z5tUbW
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 117C01A158C;
	Tue, 17 Nov 2026 10:23:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D955A5FC81;
	Tue, 17 Nov 2026 10:23:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7731111BC02EE;
	Tue, 17 Nov 2026 11:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794910986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jLMD7Jcy+SufZWp/84cELInAfnlXl2JNyOiu/MIj0FU=;
	b=d3z5tUbW2GcoX0WC/98MuU2z0bAT8USRMeH+o2CGaNOep+aeNYXELx4Y1v2MHRoM0xGICq
	oxOYKwvOKqmUeGhZfl9swdwLLx10azhdpMnKdr9ZMKtfiKYBi/1HCPBGXQAiVu3BY4g4+S
	6tN5i+TTIz/p0rFUKOo5WN4/Cx468e3XAcwRGb7ZOeoNRlJ7hYmCmVjOSTyXHI5WuCeYO/
	1cPo3/BM7QFOiCN6Slf0sfuS+/c4QW9arb0kJYsywuZYnO+rme+SzwOnd7zfmAhlljzNyR
	7b40lWdEOpoO8h8tyc3b+b4Or4Bv5ymopOUXYYm6ytVPUnyGCyn9byOqwX4voA==
Message-ID: <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
Date: Tue, 17 Nov 2026 11:23:01 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261116114923.1157920-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261116114923.1157920-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/16/26 12:49, Zxyan Zhu wrote:
> stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> MAC_FSM_ACT_Timer register.  Per the databook the checker only fires once
> NTMRMD is programmed with a non-zero duration; NTMRMD == 0 disables the
> timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> never reported and the advertised timeout protection is ineffective.
> 
> Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> TMR field (CSR clocks per 1us tic) from the CSR clock rate and defaulting
> to a 1s timeout.  A platform can override the default through the new
> ntmrmd field in stmmac_safety_feature_cfg.
> 
> The NTMRMD field holds a power-of-two microsecond timeout per the
> databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> 
> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
> not reported through the safety interrupt despite TMOUTEN being set.
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> ---
> v3:
> - Make the MAC_FSM_ACT_Timer write a read-modify-write so the other
>   fields (e.g. LTMRMD) are preserved.
> - Warn when a valid CSR clock rate cannot be obtained.
> - Document the NTMRMD encodings and fix 0x2 to 1ms (was 4ms).
> 
> v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@gmail.com/
> v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 22 +++++++++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 ++++-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++++-
>  include/linux/stmmac.h                        | 17 ++++++++++++++
>  7 files changed, 80 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index f1bb981cab7c..c1e3d634f153 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
>  // stmmac Support for 5.xx Ethernet QoS cores
>  
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/iopoll.h>
>  #include "common.h"
> @@ -184,7 +185,8 @@ static void dwmac5_handle_dma_err(struct net_device *ndev,
>  }
>  
>  int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> -			      struct stmmac_safety_feature_cfg *safety_feat_cfg)
> +			      struct stmmac_safety_feature_cfg *safety_feat_cfg,
> +			      unsigned int csr_clk_mhz)
>  {
>  	struct stmmac_safety_feature_cfg all_safety_feats = {
>  		.tsoee = 1,
> @@ -245,6 +247,24 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  		value |= TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
> +		u32 ntmrmd = safety_feat_cfg->ntmrmd;
> +
> +		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
> +			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
> +			 ntmrmd : STMMAC_NTMRMD_1SEC;
> +
> +		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
> +		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
> +		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> +			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> +		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
> +	}
> +
>  	/* 4. Enable Data Parity Protection */
>  	value = readl(ioaddr + MTL_DPP_CONTROL);
>  	if (safety_feat_cfg->edpp)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> index 00b151b3b688..734e7630f28d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> @@ -8,8 +8,11 @@
>  #define MAC_DPP_FSM_INT_STATUS		0x00000140
>  #define MAC_AXI_SLV_DPE_ADDR_STATUS	0x00000144
>  #define MAC_FSM_CONTROL			0x00000148
> +#define MAC_FSM_ACT_TIMER		0x0000014C
>  #define PRTYEN				BIT(1)
>  #define TMOUTEN				BIT(0)
> +#define MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
> +#define MAC_FSM_ACT_TIMER_NTMRMD	GENMASK(19, 16)
>  
>  #define MAC_PPS_CONTROL			0x00000b70
>  #define PPS_MAXIDX(x)			((((x) + 1) * 8) - 1)
> @@ -82,7 +85,8 @@
>  #define GMAC_INT_FPE_EN			BIT(17)
>  
>  int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> -			      struct stmmac_safety_feature_cfg *safety_cfg);
> +			      struct stmmac_safety_feature_cfg *safety_cfg,
> +			      unsigned int csr_clk_mhz);
>  int dwmac5_safety_feat_irq_status(struct net_device *ndev,
>  		void __iomem *ioaddr, unsigned int asp,
>  		struct stmmac_safety_stats *stats);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index f8ab347f7b5b..1fd501728b18 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -169,8 +169,11 @@
>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
>  #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
>  #define XGMAC_MAC_FSM_CONTROL		0x00000158
> +#define XGMAC_MAC_FSM_ACT_TIMER		0x0000015C
>  #define XGMAC_PRTYEN			BIT(1)
>  #define XGMAC_TMOUTEN			BIT(0)
> +#define XGMAC_MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
> +#define XGMAC_MAC_FSM_ACT_TIMER_NTMRMD		GENMASK(19, 16)
>  #define XGMAC_MDIO_ADDR			0x00000200
>  #define XGMAC_MDIO_DATA			0x00000204
>  #define XGMAC_MDIO_C22P			0x00000220
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 7ad08651675e..b3f99a6dfcd7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -4,6 +4,7 @@
>   * stmmac XGMAC support.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/bitrev.h>
>  #include <linux/crc32.h>
>  #include <linux/iopoll.h>
> @@ -837,7 +838,8 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,
>  
>  static int
>  dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> -			    struct stmmac_safety_feature_cfg *safety_cfg)
> +			    struct stmmac_safety_feature_cfg *safety_cfg,
> +			    unsigned int csr_clk_mhz)
>  {
>  	u32 value;
>  
> @@ -873,6 +875,25 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {
> +		u32 ntmrmd = safety_cfg->ntmrmd;
> +
> +		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
> +			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
> +			 ntmrmd : STMMAC_NTMRMD_1SEC;
> +
> +		value = readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> +		value &= ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
> +			   XGMAC_MAC_FSM_ACT_TIMER_TMR);
> +		value |= FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> +			 FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> +		writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> +	}
> +
>  	/* 5. Enable Data Path Parity Protection */
>  	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
>  	/* already enabled by default, explicit enable it again */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 8ae95e91a36a..395655b01ea8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -378,7 +378,8 @@ struct stmmac_ops {
>  			     bool srgmi_ral);
>  	/* Safety Features */
>  	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
> -				  struct stmmac_safety_feature_cfg *safety_cfg);
> +				  struct stmmac_safety_feature_cfg *safety_cfg,
> +				  unsigned int csr_clk_mhz);
>  	int (*safety_feat_irq_status)(struct net_device *ndev,
>  			void __iomem *ioaddr, unsigned int asp,
>  			struct stmmac_safety_stats *stats);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 552840d29668..949ed3e5bb05 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3691,10 +3691,19 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
>  
>  static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>  {
> +	unsigned int csr_clk_mhz = 0;
> +
>  	if (priv->dma_cap.asp) {
>  		netdev_info(priv->dev, "Enabling Safety Features\n");
> +		if (priv->plat->stmmac_clk)
> +			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
> +				      1000000;
> +		if (!csr_clk_mhz)
> +			netdev_warn(priv->dev,
> +				    "unable to get a valid CSR clock rate\n");

I know it's the bot who asked for that, but I don't agree with this log here.

FWIU it's legit to have ASP but no CSR clock (e.g. stmmac PCI)

>  		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
> -					  priv->plat->safety_feat_cfg);
> +					  priv->plat->safety_feat_cfg,
> +					  csr_clk_mhz);
>  	} else {
>  		netdev_info(priv->dev, "No Safety Features support found\n");
>  	}
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d22..35c39cd6b630 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
>  	u32 edpp;
>  	u32 prtyen;
>  	u32 tmouten;
> +	/* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The TMR
> +	 * field (CSR clocks per 1us) is derived from the CSR clock by stmmac.
> +	 * 0 selects the default 1s timeout.
> +	 */

I'd rather this comment to be with the register value definitions :)

> +	u32 ntmrmd;

I don't see any user for ntmrmd. If this is prep work for upcoming glue
drivers, then this should come with the driver in question. If really
needed, can't we just program a reasonable hardcoded default for the
time being ?

Maxime
