Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413984;
	b=vs394yVUqKK0vwkZBvXMKLQ5FgqHjSLWD/eukTOPhpOW8T345tyn0yLAgU4nXyPDXG6i
	 jJ5gx6aT81Qd7lNQF9splz6nMM+38+UhpqBHzehe85V5N2aK0KSP3CuE4kCYTHg9rwMt+
	 LPLq5yqWjm5hPu7kU1kLxw2sAAu9CNLFOl4+EwhLz1Ba3znhRFjQ5CZjGX2EHYU+a7ULa
	 7cuO5nunJkwL34r1mnsB8TRsOEZUeg4fQgm+T1j7FDyegBkZD/Oz3MCE0PrMFa150XMBv
	 rAQ1SmHOvuQ2y43s3UsJK2CQGHU8VFAjMKNJuX4saGgQh1l4MpQ7OlqN1TKaGdhtthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413984;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=QUWGBjRK4vnPkCT1ZLrQXDasRmh2ai6B3MpKFpudntA=;
	b=new1NgdXIAfJE2135W7zmtI0kFAzwYzT+Nz5DhSCMn8WDVGGmgSUzO7Hl8TSjhzKG+QU
	 RGAuVRNvzRp5NjMNqqOU/p5WciY6SutPihAQMdQWE8bfKAWY7osF9L5N7XCl6kht0lW4k
	 eDXvMNnavz6aqqGtotw72tHBBrJvmy5GcxVk9KG/7Y14JxVrYPu7/MB6TQlvgWOuG8Wgi
	 XqMgRDZBifJEyli6h6KFkBT532dvH9sP+4/yfaGGuwYZPbfkkqNFvDi5vAOldeZvVkeU+
	 r1cl2z3EBaFY4zK98/nLHpedcCPfuulrrPsZS0UhceaKJ6Wvx67rErSwehz3qm3Fl4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uGs7yAnE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB99606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB99606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uGs7yAnE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 94F04C79A90;
	Wed, 11 Nov 2026 16:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF52C6017E;
	Wed, 11 Nov 2026 16:19:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7655E11BC11DE;
	Wed, 11 Nov 2026 17:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794413976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QUWGBjRK4vnPkCT1ZLrQXDasRmh2ai6B3MpKFpudntA=;
	b=uGs7yAnEzSB45jaPYAOLd1SeD0iG00I9YGwJVCHzqfyH6vHiTONHDF20B6Vs5n6npq/IUo
	2E1y4mLXYbJ14oey8u7i/CcoF4To3ZPcWPvVh/XHNtPhKXwgvxaX+Tl1nR+vDuaBHK9loP
	7uR/DyvICiGBYlucX3LIe4TrR12VtxI8RWAQMOdHJV+5+2e/71R+YqkmS/Mn/ZcWEh3B/m
	k5NnnFh4xNeG6/h2GwAjrTdF2NZH/RkDTEkkTVbub2JVUixqQIW6sP5m56Di9Fb2fF5clp
	EbwxsN9gc+EenXTKkSrMiMjbS+jn9Ia2cYi76On+QHkksYfHETY0jHgPzREwcg==
Message-ID: <8cecf0d6-d04a-4bb6-91fb-b5c9b091ae8e@bootlin.com>
Date: Wed, 11 Nov 2026 17:19:12 +0100
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
Subject: Re: [PATCH] net: stmmac: program the FSM timeout timer
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, Jose.Abreu@synopsys.com
References: <20261111143322.2234321-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261111143322.2234321-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/11/26 15:33, Zxyan Zhu wrote:
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
> The issue was hit in testing on a downstream platform, where a stuck FSM
> was not reported through the safety interrupt despite TMOUTEN being set.
> 
> Fixes: 8bf993a5877e ("net: stmmac: Add support for DWMAC5 and implement Safety Features")
> Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

IMO this should go to net-next, this seems to just never have worked.

Out of curiosity, did you test on dwmac4 or on dwxgmac ?

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 20 ++++++++++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 +++++-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 20 ++++++++++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
>  include/linux/stmmac.h                        | 17 ++++++++++++++++
>  7 files changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index f1bb981cab7c..4ab7a3df98c6 100644
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
> @@ -245,6 +247,22 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
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
> +		writel(FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> +		       FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
> +		       ioaddr + MAC_FSM_ACT_TIMER);
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
> index 1a88cbaed70c..76c850ea13a5 100644
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
> @@ -835,7 +836,8 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,
>  
>  static int
>  dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> -			    struct stmmac_safety_feature_cfg *safety_cfg)
> +			    struct stmmac_safety_feature_cfg *safety_cfg,
> +			    unsigned int csr_clk_mhz)
>  {
>  	u32 value;
>  
> @@ -871,6 +873,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
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
> +		writel(FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> +		       FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
> +		       ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
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
> index f8dceafdda2d..52f63f624d67 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3639,10 +3639,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
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
>  		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
> -					  priv->plat->safety_feat_cfg);
> +					  priv->plat->safety_feat_cfg,
> +					  csr_clk_mhz);
>  	} else {
>  		netdev_info(priv->dev, "No Safety Features support found\n");
>  	}
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d22..cb470a153bf8 100644
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
> +	u32 ntmrmd;
>  };
>  
> +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> +#define STMMAC_NTMRMD_1US		0x1
> +#define STMMAC_NTMRMD_4MS		0x2
> +#define STMMAC_NTMRMD_16MS		0x3
> +#define STMMAC_NTMRMD_64MS		0x4
> +#define STMMAC_NTMRMD_256MS		0x5
> +#define STMMAC_NTMRMD_1SEC		0x6
> +#define STMMAC_NTMRMD_4SEC		0x7
> +#define STMMAC_NTMRMD_16SEC		0x8
> +#define STMMAC_NTMRMD_32SEC		0x9
> +#define STMMAC_NTMRMD_64SEC		0xa
> +
>  /* Addresses that may be customized by a platform */
>  struct dwmac4_addrs {
>  	u32 dma_chan;

