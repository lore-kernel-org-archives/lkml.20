Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7EE434E39
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792279152; cv=none; b=XijROb+D0F9n9Cx9DpqzoYGOcnBKqHA/pRtVuqBVv9hHLgWnpFVDEuj4YKC9zMkfjt2Qq5g4pEtVRMTRxlYKI66Fg9ReDF8F/Ib3lWZbTdOIkxwFe0tlpsX8byQos3GUzFSKxrrwqXQQDmBXL1+LX7JeLPMbNGzLGUKKPZNbM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792279152; c=relaxed/simple;
	bh=wxQJcM1nzj0u0YC5WPGv0E74vQi/0Zqjmxg04qA6rGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXkefZXZSTydMZIo2X4xnKm1T73b1mnfNf6QAaXjjQa1JPx9wGaF0WBNvkNcavkOXFjdDpVUf83wZVOZbzZUElEE5H47alAqyZA3rmHLuHX7TD6Q3wLvG+XVgseka6F+BUdI2JeaRjaGgH5O3jugkYwHE4jMl0xviyLRV7ZxxHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDCkAiHX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDCkAiHX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso479238f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792279144; x=1792883944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6Y7YJ+0YF9Z3Fq1RjXuA9yE1ZtBUtNuiAmEM1+Dljk=;
        b=cDCkAiHX4hntmMrSOnZBl6hTkcFuowGokk13vSOf0ltroZ1wAngHZXIYk2zRJLFr/n
         55U4UNHKqse9pfFk2LRfJ1oBfNi/rtKcXxfTPWJgIfVUmlyHyuf5aqMnVxRO1rh2e7PR
         ur66CdWxCJjEgpFXnqpPzQMsVVKtzuDZs5f8QsGpwcConxww0xhwvIzSYVPWcba5tSEf
         63j2wnUVdHN57eMKIj+U5SFSDcGaR2Sz10jfN5Yn5yAtyUC8BBDQMdkz95P52z4L6LM1
         yE4s0/pnHPi2etYivCugAjo6ouG1dD8X7sq6LbjSZJuErtMyBzGcMeWCHhWS6qEFXZBA
         LD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792279144; x=1792883944;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6Y7YJ+0YF9Z3Fq1RjXuA9yE1ZtBUtNuiAmEM1+Dljk=;
        b=AeBkRuXV3CVC2SyUAWd/boaAI95Fmgo7OQSiUmhew4gysvyDao9vcFTwWhdmNwT50r
         IJZUndzNy69JTs7og5OmpMDjMy2hE1XZ3eF4Dg2TsS7CdUnviCgr58eG9AuHQepVGqiF
         8RpnPJk8FB8YkOg4drJppZfAYYB13vEN0ucciKe5zRkY8JoZJIWG/qZygGVPi6H9dIII
         J9fL+7T9tKFB3F1bx7MgT1fTHN0d89KxxN3h2lnDpTlepmWI3wp8AU65DPMXoaj7Tu9r
         PfhmHQQFgYUi+wFIxpRkaV85YH+M6wrPh2HxfZhipdBNDeuGvQ3rUWaMeo16E6THPiVf
         KmOA==
X-Forwarded-Encrypted: i=1; AKwUvBySOmPNEu4reG3TiLl5b2MLG8cbg2rVlLA/NKCoQDIw7WNzCY5GMetklUbrEu+4gjtXMJvU9XXd0xWZp8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvUyernpXMfG2DWf+YB23OXT5GE6x0vF0IDDufmaE5xE4OT22d
	rbONYOL+yuecV5uMyfjgy9hDnk2gAJiqv1LnwyaIZdros+Dz8zE6LiDUtbcGsO4fM/c=
X-Gm-Gg: AYBFou02NByaCm2AH3laR2Cfrd1aCysg7Egxz470CJsQxIioCb0epxqdGgfTFj9S/Iu
	s0EU/qDW7Ro3iPVAlvpASP4PXGAjW8Pw7egMs8K6W4Z9EsH2+24+E1OPG7etGuCtcVREDy23FtP
	MCpQgnT9tfJyGQpmN0NRMrRBJx9Nhp40XnnlYBBl0bLf+CYEL6A90KcrSRshlzJtOSF9GJ1KIDW
	J6UMw3D1v3oSoRrTkYU954Tr0NlI388BgobWDT3K4+Fcw6YlhrPo9U1xPbDgVXBqDVhPcDbSubV
	8fQgaQjmTVmpKHeA18RV+DndJzQL6zQOnMN7el/ZzgYSDnGKucf/O3Kq58XjwkNdIkbscrqZnFr
	FwRdENGK4XmNMpNMABJf7OtTY3ibJ3h92uSe9gNb1fUci+uzJdkG20yhtkb/2NchnJYIT67nD/l
	7PRlIakZi2A4Z+gh6UjkBw9nn71Vj/MmXkI8K/CeBFWEEKLOu5mRebCvCS8Lr28gdaEvEgBtBLY
	PHEyTjbsuRG
X-Received: by 2002:a05:600c:3556:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a1d76051b8mr79536145e9.17.1792279143631;
        Sat, 17 Oct 2026 16:19:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.131.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm103431715e9.4.2026.10.17.16.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 16:19:02 -0700 (PDT)
Message-ID: <6ae313c5-a6a0-42f3-ae2f-741c0f9a5f5b@linaro.org>
Date: Sun, 18 Oct 2026 00:19:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom-mipi-csi2: Add sa8775p C-PHY support
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-3-anusha.nandi@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261017041733.3946816-3-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 05:17, Anusha Arun Nandi wrote:
> Extend the generic MIPI CSI2 PHY driver with C-PHY (3-phase) support
> and wire it up for SA8775P, so the same qcom,sa8775p-csi2-phy provider
> can drive a sensor in either D-PHY or C-PHY mode.
> 
> Unlike the driver's D-PHY mode selection (which is set once from the
> consumer's phy_configure_opts_mipi_dphy in the original x1e80100
> series and later dropped in favour of DT), this driver derives the
> phy mode from the devicetree bus-type property, in
> phy_qcom_mipi_csi2_parse_routing() at probe time:
> 
> - bus-type = MEDIA_BUS_TYPE_CSI2_DPHY (the default) -> PHY_MODE_MIPI_DPHY
> - bus-type = MEDIA_BUS_TYPE_CSI2_CPHY -> PHY_MODE_MIPI_CPHY
> 
> phy_qcom_mipi_csi2_set_mode() now validates that a consumer's
> phy_set_mode() call matches the DT-derived mode rather than accepting
> any mode; phy_qcom_mipi_csi2_configure() and the power_on()/power_off()
> lanes_enable()/lanes_disable() dispatch both pick the D-PHY or C-PHY
> hw_ops/reg_info based on that same stored mode. lane-polarities
> parsing also branches on mode: D-PHY has a separate clock lane
> (clock-lane-first array, matching video-interfaces.yaml), C-PHY has
> none (all entries map data trios).
> 
> Add the C-PHY 3-phase hw ops (phy-qcom-mipi-csi2-3ph-cphy.c): common
> control programming (CTRL5 trio-enable mask, CTRL6/CTRL7/CTRL0 in
> their C-PHY values), settle-count calculation, the odd-bit-position
> trio lane mask, IRQ-mask clearing and lane disable, matching the
> legacy in-tree CAMSS C-PHY programming register-for-register. The
> software-reset and HW-version-read helpers are phase-mode agnostic
> (they only touch the common-control block) so they are de-staticised
> in the D-PHY file and shared rather than duplicated.
> 
> Populate the SA8775P C-PHY register data: the base init sequence
> (lane_regs_sa8775p_cphy[]) and the five bandwidth-keyed datarate
> override tables, ported verbatim from the legacy
> camss-csiphy-3ph-1-0.c tables, plus the full per-trio init for all
> three trios. reg_info_cphy is a pointer so NULL cleanly means "no
> C-PHY support" for SoCs (e.g. x1e80100) that only implement D-PHY.
> 
> QCS8300 shares this exact CSIPHY and is bound to the same
> mipi_csi2_dphy_sa8775p soc_cfg (see the "phy: qcom-mipi-csi2: Add
> qcs8300 CSI2 PHY support" patch in the companion D-PHY series), so it
> picks up ops_cphy/reg_info_cphy here automatically; no separate QCS8300
> C-PHY patch or register data is needed.
> 
> Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/Kconfig                  |   1 +
>   drivers/phy/qualcomm/Makefile                 |   3 +-
>   .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 447 ++++++++++++++++++
>   .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   6 +-
>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 133 +++++-
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  30 ++
>   6 files changed, 591 insertions(+), 29 deletions(-)
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index d802e63ad74a..7fb08fe41a8e 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -37,6 +37,7 @@ config PHY_QCOM_MIPI_CSI2
>   	depends on COMMON_CLK
>   	select GENERIC_PHY
>   	select GENERIC_PHY_MIPI_DPHY
> +	select GENERIC_PHY_MIPI_CPHY
>   	help
>   	  Enable this to support the MIPI CSI2 PHY driver found in various
>   	  Qualcomm chipsets. This PHY is used to connect MIPI CSI2
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 4b5e6640a6fa..07670425182b 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -8,7 +8,8 @@ obj-$(CONFIG_PHY_QCOM_M31_USB)		+= phy-qcom-m31.o
>   obj-$(CONFIG_PHY_QCOM_M31_EUSB)		+= phy-qcom-m31-eusb2.o
>   
>   phy-qcom-mipi-csi2-objs			+= phy-qcom-mipi-csi2-core.o \
> -					   phy-qcom-mipi-csi2-3ph-dphy.o
> +					   phy-qcom-mipi-csi2-3ph-dphy.o \
> +					   phy-qcom-mipi-csi2-3ph-cphy.o
>   obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)	+= phy-qcom-mipi-csi2.o
>   
>   obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
> new file mode 100644
> index 000000000000..f388997390b1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
> @@ -0,0 +1,447 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0, C-PHY mode
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/time64.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)	((offset) + 0x4 * (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
> +
> +/*
> + * 3 phase CSI has 19 common status regs with only 0-10 being used
> + * and 11-18 being reserved.
> + */
> +#define CSI_COMMON_STATUS_NUM				11
> +/*
> + * There are a number of common control registers. The offset to clear the
> + * CSIPHY IRQ status starts @ 22, so CSI_COMMON_STATUS0 is cleared via
> + * CSI_COMMON_CONTROL22, STATUS1 via CONTROL23 and so on.
> + */
> +#define CSI_CTRL_STATUS_INDEX				22
> +
> +/*
> + * C-PHY common control values, per the CSIPHY v1.3.0 3-phase C-PHY
> + * programming sequence (differ from the D-PHY values for the same registers).
> + */
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL7_CPHY		0x5a
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_CPHY		0x0e
> +
> +#define CSIPHY_DEFAULT_PARAMS				0
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE			2
> +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE			3
> +
> +static inline const struct mipi_csi2phy_device_regs *
> +csi2phy_dev_to_cphy_regs(struct mipi_csi2phy_device *csi2phy)
> +{
> +	return csi2phy->soc_cfg->reg_info_cphy;
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_cphy_settle_cnt_calc - Calculate settle count value
> + *
> + * Helper function to calculate settle count value. This is based on the
> + * CSI2 T_hs_settle parameter which in turn is calculated based on the CSI2
> + * transmitter link frequency. The calculation is identical to the D-PHY
> + * one; the CSIPHY settle-count timer is not phase-mode specific.
> + *
> + * Return settle count value or 0 if the CSI2 link frequency is not available.
> + */
> +static u8 phy_qcom_mipi_csi2_cphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
> +{
> +	u32 t_hs_prepare_max_ps;
> +	u32 timer_period_ps;
> +	u32 t_hs_settle_ps;
> +	u8 settle_cnt;
> +	u32 ui_ps;
> +
> +	if (link_freq <= 0)
> +		return 0;
> +
> +	ui_ps = div_u64(PSEC_PER_SEC, link_freq);
> +	ui_ps /= 2;
> +	t_hs_prepare_max_ps = 85000 + 6 * ui_ps;
> +	t_hs_settle_ps = t_hs_prepare_max_ps;
> +
> +	timer_period_ps = div_u64(PSEC_PER_SEC, timer_clk_rate);
> +	settle_cnt = t_hs_settle_ps / timer_period_ps - 6;
> +
> +	return settle_cnt;
> +}

Nope - why do we have identitical code ?

Identitical code should be shared code not cloned code, that's a blanket 
statement for this series.

> +
> +/*
> + * phy_qcom_mipi_csi2_cphy_lane_mask - Compute the C-PHY lane enable mask
> + *
> + * Unlike D-PHY (which sets the CTRL5 clock-lane enable bit and uses even
> + * bit positions), C-PHY has no separate clock lane and enables each active
> + * trio at an odd bit position (data lane logical position * 2 + 1).
> + */
> +static u8 phy_qcom_mipi_csi2_cphy_lane_mask(struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> +	u8 lane_mask = 0;
> +	int i;
> +
> +	for (i = 0; i < cfg->num_data_lanes; i++)
> +		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + 1);
> +
> +	return lane_mask;
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_cphy_pick_datarate - select the bandwidth-tier override
> + *
> + * Selects the first entry whose bandwidth is >= link_freq, falling back to
> + * the highest entry if none qualifies, or the first entry if link_freq is
> + * not yet known (0). Returns NULL if @regs has no datarate_regs table.
> + */
> +static const struct mipi_csi2phy_datarate_regs *
> +phy_qcom_mipi_csi2_cphy_pick_datarate(const struct mipi_csi2phy_device_regs *regs,
> +				      s64 link_freq)
> +{
> +	size_t idx;
> +
> +	if (!regs->datarate_regs || !regs->num_datarate_regs)
> +		return NULL;
> +
> +	if (!link_freq)
> +		return &regs->datarate_regs[0];
> +
> +	for (idx = 0; idx < regs->num_datarate_regs; idx++) {
> +		if (regs->datarate_regs[idx].bandwidth >= link_freq)
> +			return &regs->datarate_regs[idx];
> +	}
> +
> +	/* No tier reaches link_freq: fall back to the highest one. */
> +	return &regs->datarate_regs[regs->num_datarate_regs - 1];
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_cphy_write_regs(struct mipi_csi2phy_device *csi2phy,
> +				   const struct mipi_csi2phy_lane_regs *r,
> +				   size_t count, u8 settle_cnt)
> +{
> +	u32 val;
> +	size_t i;
> +
> +	for (i = 0; i < count; i++, r++) {
> +		switch (r->param_type) {
> +		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> +			val = settle_cnt & 0xff;
> +			break;
> +		case CSIPHY_SETTLE_CNT_HIGHER_BYTE:
> +			val = (settle_cnt >> 8) & 0xff;

u8 settle_cnt = 0xFF;

settle_cnt = settle_cnt >> 8;

== 0

Can't be correct - probably a copy/paste from the existing code, buggy, 
mine I guess...

/checks

no this is a new bug - so please fix and make all of this generic code 
common instead of copy/paste...
> +			break;
> +		default:
> +			val = r->reg_data;
> +			break;
> +		}
> +		writel(val, csi2phy->base + r->reg_addr);
> +		if (r->delay_us)
> +			udelay(r->delay_us);
> +	}
> +}
> +
> +static int phy_qcom_mipi_csi2_cphy_lanes_enable(struct mipi_csi2phy_device *csi2phy,
> +						struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_cphy_regs(csi2phy);
> +	const struct mipi_csi2phy_datarate_regs *tier;
> +	u8 settle_cnt;
> +	u8 val;
> +	int i;
> +
> +	settle_cnt = phy_qcom_mipi_csi2_cphy_settle_cnt_calc(cfg->link_freq,
> +							     csi2phy->timer_clk_rate);
> +
> +	/* Enable the active C-PHY trios (odd bit positions, no clock lane). */
> +	val = phy_qcom_mipi_csi2_cphy_lane_mask(cfg);
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +
> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL7_CPHY;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 7));
> +
> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_CPHY;
> +	writel(val, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
> +
> +	/* Base C-PHY lane_regs init sequence. */
> +	phy_qcom_mipi_csi2_cphy_write_regs(csi2phy, regs->init_seq,
> +					   regs->lane_array_size, settle_cnt);
> +
> +	/* Bandwidth-tier overrides on top, if this soc_cfg has any. */
> +	tier = phy_qcom_mipi_csi2_cphy_pick_datarate(regs, cfg->link_freq);
> +	if (tier)
> +		phy_qcom_mipi_csi2_cphy_write_regs(csi2phy, tier->reg_array,
> +						   tier->reg_array_size, settle_cnt);
> +
> +	/* IRQ_MASK registers - disable all interrupts */
> +	for (i = CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++) {
> +		writel(0, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, i));
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_cphy_lanes_disable(struct mipi_csi2phy_device *csi2phy,
> +				      struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_cphy_regs(csi2phy);
> +
> +	writel(0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +	writel(0, csi2phy->base +
> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> +}
> +
> +const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_cphy = {
> +	.hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
> +	.reset = phy_qcom_mipi_csi2_reset,
> +	.lanes_enable = phy_qcom_mipi_csi2_cphy_lanes_enable,
> +	.lanes_disable = phy_qcom_mipi_csi2_cphy_lanes_disable,
> +};

Please separate out the enabling works for CPHY and the sa8755p.

- Reducing the size of the patch
- Making the commits more logical
- Making the commits more revertable

> +
> +/*
> + * sa8775p C-PHY (3-phase) register tables.
> + *
> + * Ported verbatim from the legacy in-tree CAMSS C-PHY driver
> + * (drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:
> + * lane_regs_sa8775p_3ph[] and data_rate_settings_sa8775p_3ph[]). The
> + * per-lane-block macro addresses (CSIPHY_LNx_CSI_3PH_CTRLn_ADDR(n) =
> + * base + n * 4, base 0x0100/0x0300/0x0500/0x0900/0x0a00/0x0b00 for
> + * LN1/3/5/9/10/11) are expanded to the literal flat offsets used by
> + * this driver's mipi_csi2phy_lane_regs format.
> + */
> +static const struct mipi_csi2phy_lane_regs lane_regs_sa8775p_cphy[] = {
> +	{.reg_addr = 0x0168, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x016c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x015c, .reg_data = 0xc8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0104, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x010c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0108, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{.reg_addr = 0x0114, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0150, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0188, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x018c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0190, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0118, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x011c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0120, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0124, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0128, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x012c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0144, .reg_data = 0xb2, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0160, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x01cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0164, .reg_data = 0x33, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x01dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0368, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x036c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x035c, .reg_data = 0xc8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0304, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x030c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0308, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{.reg_addr = 0x0314, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0350, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0388, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x038c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0390, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0318, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x031c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0320, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0324, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0328, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x032c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0344, .reg_data = 0xb2, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0360, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x03cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0364, .reg_data = 0x33, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x03dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0568, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x056c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x055c, .reg_data = 0xc8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0504, .reg_data = 0x06, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x050c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0508, .reg_data = 0x00, .param_type = CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{.reg_addr = 0x0514, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0550, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0588, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x058c, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0590, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0518, .reg_data = 0x3e, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x051c, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0520, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0524, .reg_data = 0x7f, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0528, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x052c, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0544, .reg_data = 0xb2, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0560, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x05cc, .reg_data = 0x41, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0564, .reg_data = 0x33, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x05dc, .reg_data = 0x50, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0984, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0980, .reg_data = 0x61, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x09b0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x09b4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a80, .reg_data = 0x61, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b84, .reg_data = 0x20, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b80, .reg_data = 0x61, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb0, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
> +static const struct mipi_csi2phy_lane_regs datarate_sa8775p_cphy_1p5gsps[] = {
> +	{.reg_addr = 0x015c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0168, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x016c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x010c, .reg_data = 0x24, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x035c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0368, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x036c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x030c, .reg_data = 0x24, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x055c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0568, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x056c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x050c, .reg_data = 0x24, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x09b4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
> +static const struct mipi_csi2phy_lane_regs datarate_sa8775p_cphy_1p7gsps[] = {
> +	{.reg_addr = 0x015c, .reg_data = 0x56, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0168, .reg_data = 0xae, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x016c, .reg_data = 0x65, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x010c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x035c, .reg_data = 0x56, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0368, .reg_data = 0xae, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x036c, .reg_data = 0x65, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x030c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x055c, .reg_data = 0x56, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0568, .reg_data = 0xae, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x056c, .reg_data = 0x65, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x050c, .reg_data = 0x12, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x09b4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
> +static const struct mipi_csi2phy_lane_regs datarate_sa8775p_cphy_2p5gsps[] = {
> +	{.reg_addr = 0x0168, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x015c, .reg_data = 0xc8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x016c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x010c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0368, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x035c, .reg_data = 0xc8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x036c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x030c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0568, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x055c, .reg_data = 0xc8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x056c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x050c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x09b4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
> +static const struct mipi_csi2phy_lane_regs datarate_sa8775p_cphy_3p5gsps[] = {
> +	{.reg_addr = 0x0168, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x015c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x016c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x010c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0368, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x035c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x036c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x030c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0568, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x055c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x056c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x050c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x09b4, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab4, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb4, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
> +static const struct mipi_csi2phy_lane_regs datarate_sa8775p_cphy_4p5gsps[] = {
> +	{.reg_addr = 0x0168, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x015c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x016c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x010c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0368, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x035c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x036c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x030c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x0568, .reg_data = 0x80, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x055c, .reg_data = 0x46, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x056c, .reg_data = 0x25, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x050c, .reg_data = 0x08, .param_type = CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{.reg_addr = 0x09b4, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0988, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0ab4, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0bb4, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0b88, .reg_data = 0x05, .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
> +static const struct mipi_csi2phy_datarate_regs datarate_regs_sa8775p_cphy[] = {
> +	{
> +		.bandwidth = 1500000000,
> +		.reg_array = datarate_sa8775p_cphy_1p5gsps,
> +		.reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_1p5gsps),
> +	},
> +	{
> +		.bandwidth = 1700000000,
> +		.reg_array = datarate_sa8775p_cphy_1p7gsps,
> +		.reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_1p7gsps),
> +	},
> +	{
> +		.bandwidth = 2500000000,
> +		.reg_array = datarate_sa8775p_cphy_2p5gsps,
> +		.reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_2p5gsps),
> +	},
> +	{
> +		.bandwidth = 3500000000,
> +		.reg_array = datarate_sa8775p_cphy_3p5gsps,
> +		.reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_3p5gsps),
> +	},
> +	{
> +		.bandwidth = 4500000000,
> +		.reg_array = datarate_sa8775p_cphy_4p5gsps,
> +		.reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_4p5gsps),
> +	},
> +};
> +
> +const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p = {
> +	.init_seq = lane_regs_sa8775p_cphy,
> +	.lane_array_size = ARRAY_SIZE(lane_regs_sa8775p_cphy),
> +	.common_regs_offset = 0x800,
> +	.datarate_regs = datarate_regs_sa8775p_cphy,
> +	.num_datarate_regs = ARRAY_SIZE(datarate_regs_sa8775p_cphy),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index f3d67d75105e..41664a593f91 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -168,7 +168,7 @@ csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
>   	return &csi2phy->soc_cfg->reg_info;
>   }
>   
> -static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
> +void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>   	u32 tmp;
> @@ -199,7 +199,7 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>    * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
>    * @phy_qcom_mipi_csi2: CSIPHY device
>    */
> -static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
> +void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>   
> @@ -490,6 +490,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p = {
>   		.lane_array_size = ARRAY_SIZE(lane_regs_sa8775p),
>   		.common_regs_offset = 0x800,
>   	},
> +	.ops_cphy = &phy_qcom_mipi_csi2_ops_3ph_cphy,
> +	.reg_info_cphy = &mipi_csi2_3ph_cphy_regs_sa8775p,
>   	.supply_names = (const char **)sa8775p_supplies,
>   	.num_supplies = ARRAY_SIZE(sa8775p_supplies),
>   	.clk_names = (const char **)sa8775p_clks,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index fca67d3625b8..79e002c94ac4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -14,6 +14,7 @@
>   #include <linux/pm_opp.h>
>   #include <linux/phy/phy.h>
>   #include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
> @@ -96,11 +97,10 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>   	return ret;
>   }
>   
> -static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> -					union phy_configure_opts *opts)
> +static int
> +phy_qcom_mipi_csi2_configure_dphy(struct mipi_csi2phy_device *csi2phy,
> +				  struct phy_configure_opts_mipi_dphy *dphy_cfg)
>   {
> -	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> -	struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
>   	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>   	int ret;
>   
> @@ -119,24 +119,73 @@ static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>   	return 0;
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
> +	if (cphy_cfg->lanes < 1 || cphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +		return -EINVAL;
> +
> +	if (cphy_cfg->lanes != stream_cfg->num_data_lanes)
> +		return -EINVAL;
> +
> +	stream_cfg->link_freq = cphy_cfg->hs_clk_rate;
> +
> +	return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +					union phy_configure_opts *opts)
> +{
> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> +
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY)
> +		return phy_qcom_mipi_csi2_configure_cphy(csi2phy, &opts->mipi_cphy);
> +
> +	return phy_qcom_mipi_csi2_configure_dphy(csi2phy, &opts->mipi_dphy);
> +}
> +
> +static const struct mipi_csi2phy_hw_ops *
> +phy_qcom_mipi_csi2_get_ops(struct mipi_csi2phy_device *csi2phy)
> +{
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY)
> +		return csi2phy->soc_cfg->ops_cphy;
> +
> +	return csi2phy->soc_cfg->ops;
> +}
> +
>   static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
>   				       enum phy_mode mode, int submode)
>   {
>   	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>   
> -	if (mode != PHY_MODE_MIPI_DPHY)
> -		return -EOPNOTSUPP;
> +	/*
> +	 * The phy mode is derived once from the DT bus-type in
> +	 * phy_qcom_mipi_csi2_parse_routing() at probe time; consumers must
> +	 * request the same mode the devicetree describes.
> +	 */
> +	if (mode != csi2phy->phy_mode)
> +		return -EINVAL;
>   
> -	csi2phy->phy_mode = mode;
>   	return 0;
>   }
>   
>   static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>   {
>   	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> -	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
> +	const struct mipi_csi2phy_hw_ops *ops = phy_qcom_mipi_csi2_get_ops(csi2phy);
>   	int i, ret;
>   
> +	if (!ops)
> +		return -EOPNOTSUPP;
> +
>   	ret = regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
>   				    csi2phy->supplies);
>   	if (ret)
> @@ -194,10 +243,11 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>   static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>   {
>   	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
> -	const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
> +	const struct mipi_csi2phy_hw_ops *ops = phy_qcom_mipi_csi2_get_ops(csi2phy);
>   	int i;
>   
> -	ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
> +	if (ops)
> +		ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
>   
>   	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
>   				   csi2phy->clks);
> @@ -291,7 +341,14 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   	bus_type = MEDIA_BUS_TYPE_CSI2_DPHY;
>   	fwnode_property_read_u32(ep, "bus-type", &bus_type);
>   
> -	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
> +	switch (bus_type) {
> +	case MEDIA_BUS_TYPE_CSI2_DPHY:
> +		csi2phy->phy_mode = PHY_MODE_MIPI_DPHY;
> +		break;
> +	case MEDIA_BUS_TYPE_CSI2_CPHY:
> +		csi2phy->phy_mode = PHY_MODE_MIPI_CPHY;
> +		break;
> +	default:
>   		ret = -EOPNOTSUPP;
>   		dev_err(dev, "Unsupported bus-type %u\n", bus_type);
>   		goto out_put;
> @@ -312,14 +369,24 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   		goto out_put;
>   	}
>   
> -	/* lane-polarities: optional, up to num_data_lanes + 1 entries */
> +	/*
> +	 * lane-polarities: optional. D-PHY has a separate clock lane, so its
> +	 * array is up to num_data_lanes + 1 entries (clock lane first,
> +	 * matching the video-interfaces.yaml convention); C-PHY has no clock
> +	 * lane, so its array is up to num_data_lanes entries.
> +	 */
>   	memset(lane_polarities, 0x00, sizeof(lane_polarities));
>   	num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
>   	if (num_polarities > 0) {
> -		if (num_polarities != stream_cfg->num_data_lanes + 1) {
> +		unsigned int expected = stream_cfg->num_data_lanes;
> +
> +		if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY)
> +			expected += 1;
> +
> +		if (num_polarities != expected) {
>   			ret = -EINVAL;
> -			dev_err(dev, "clock+data-lane %d/polarities %d mismatch\n",
> -				stream_cfg->num_data_lanes + 1, num_polarities);
> +			dev_err(dev, "lane %d/polarities %d mismatch\n",
> +				expected, num_polarities);
>   			goto out_put;
>   		}
>   
> @@ -331,19 +398,33 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>   		}
>   	}
>   
> -	csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
> -	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY) {
> +		csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
> +		csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
>   
> -	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> -		if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
> -			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
> -			ret = -EINVAL;
> -			goto out_put;
> -		}
> +		for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> +			if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
> +				dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
> +				ret = -EINVAL;
> +				goto out_put;
> +			}
>   
> -		/* Convert data-lanes = <1 2 3 4> to bit positions */
> -		csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;
> -		csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i + 1];
> +			/* Convert data-lanes = <1 2 3 4> to bit positions */
> +			csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;
> +			csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i + 1];
> +		}
> +	} else {
> +		/* C-PHY has no clock lane; all entries map data trios. */
> +		for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> +			if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
> +				dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
> +				ret = -EINVAL;
> +				goto out_put;
> +			}
> +
> +			csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;

This looks wrong.

In D-PHY mode the monkeying about comes from the fact that data_lanes 
and lane_polarities have different indexes - data-lanes only pertains to 
data-lanes but polarities covers both data-lanes and clock-lanes.

For CPHY there is no clock lane so there is no need to offset nor to 
check that data_lanes[i] < 1

Indeed CSI2_MAX_DATA_LANES for CPHY is not the same as it is for D-PHY.

Also just copy/pasting an existing check instead of functional 
decomposition of that check would be wrong on its own too...

> +			csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i];
> +		}
>   	}
>   
>   	ret = 0;
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index e2a346bcec89..af8426af2ae3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -47,10 +47,31 @@ struct mipi_csi2phy_lane_regs {
>   	const u32 param_type;
>   };
>   
> +/**
> + * struct mipi_csi2phy_datarate_regs - bandwidth-keyed register overrides
> + * @bandwidth: data rate, in bits/s, this entry applies to
> + * @reg_array: register writes to apply on top of the base init_seq
> + * @reg_array_size: number of entries in reg_array
> + *
> + * Some C-PHY configurations need small register tweaks (impedance, deskew,
> + * timing calibration) that vary with the link data rate. A
> + * mipi_csi2phy_device_regs may carry an array of these, sorted by ascending
> + * bandwidth; the hw_ops picks the first entry whose bandwidth is >= the
> + * configured link rate (falling back to the highest entry if none
> + * qualifies).
> + */
> +struct mipi_csi2phy_datarate_regs {
> +	const u64 bandwidth;
> +	const struct mipi_csi2phy_lane_regs *reg_array;
> +	const size_t reg_array_size;
> +};
> +
>   struct mipi_csi2phy_device_regs {
>   	const struct mipi_csi2phy_lane_regs *init_seq;
>   	const int lane_array_size;
>   	const u32 common_regs_offset;
> +	const struct mipi_csi2phy_datarate_regs *datarate_regs;
> +	const unsigned int num_datarate_regs;
>   };
>   
>   struct mipi_csi2_genpd {
> @@ -62,6 +83,9 @@ struct mipi_csi2phy_soc_cfg {
>   	const struct mipi_csi2phy_hw_ops *ops;
>   	const struct mipi_csi2phy_device_regs reg_info;
>   
> +	const struct mipi_csi2phy_hw_ops *ops_cphy;
> +	const struct mipi_csi2phy_device_regs *reg_info_cphy;
> +
>   	const char ** const supply_names;
>   	const unsigned int num_supplies;
>   
> @@ -99,4 +123,10 @@ extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
>   extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
>   extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
>   
> +extern const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_cphy;
> +extern const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p;
> +
> +void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2phy);
> +void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy);
> +
>   #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

