Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CDA379EE7
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792278067; cv=none; b=Ash3GpXTWkYigARjyniCqPyePFpqeZcbGh9RYt1xFz/0vqpEoLarv85NGXE9MkmkoehcZRDW3w2xpH+Rw/EcRFmFEiMkuiotq//yhTAckY5Ic1uIq5105zMYb5bzZHlLQJVVRcz80iPpbptB32ZRsYWCMd5aJjgtCGpsfvzua1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792278067; c=relaxed/simple;
	bh=Gj/SK00v3D8Yn0daF2aLp4/1TPvMRdrjJ8UTQO+Zr30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pauASfJ6KJ6eNYVM/o/OfAO3lsivXaTquF9ouXS9lSlQWSpLTZ769AF0dnCoig/xTBtPykexswGb3VvNHLiiQLN9vNLHjMxFHdEPmpXrSByYQeP13KHffuM9cSlBRs3eAKBd51QBNHLpyf0DZl/iOdckZa5W90T/M4ze13TuVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYUqmuXf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYUqmuXf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so7244515e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792278063; x=1792882863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/I4CWTOnF72MO6TJ0fAD5XD9Zo2YxliNSAqMZbnA6s=;
        b=jYUqmuXfwAjC0Oe0ij6kyr9L0VMj73saamlArC7/0+vng0uX8RmHD8xTmd3d515o+q
         uJFOcOEXYyryeCM1/82z9i3zM9EWadt6Sz8qM0vmevG/ZDF8xjlh4BVyT918Y1TlBZqo
         7HG9IZ4DVNXRYIkPwn5dXvehbTe1OMm0qcqujJiTIAxXaqmjCFPC9RqPh7vXnfSY4tcL
         scelot8zcKm63gdu/SjQ6exGCF9kAvaIvpJ8JhBXgNi1qsq7C4MhFjBnAEG7jyXqw/6s
         TcgT/j5MnNmm+48msYv6FholKUvsvJ06IzGJpW8u/Zny6IgjhQ/N6eYCJrLQ+gzRPcsv
         gDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792278063; x=1792882863;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/I4CWTOnF72MO6TJ0fAD5XD9Zo2YxliNSAqMZbnA6s=;
        b=SokhIn7PIbBlqXNN2fgliA+TxPNhjlZBVEctk+gX0wWN4jKV0MZJEJZqBxoBGBdbrz
         gcLmZtt86pdMRPQHbFjP1W4aBKNoW2fEToS0xuFCCDROD8cKEP2PcplVYfiOHofok+je
         a5eCmrpFiYMIPc3jnkP738JUfQixGfVH3dOJizmfzYlN1xD6a6fbMvtbtwZUkZEii3f5
         p6WmNNM5BXQhhfV56rC+SKYssBbq+io1igKtRuSYmKrodrL0kkHKoOWKrSFmAnqOLkoT
         hyH7rTJ57m1YGC0zOIb3l5pLex05LO5XDMRlqpfdVmMvpTxrajGGRMPkAkI+F2YomQ+2
         gVmg==
X-Forwarded-Encrypted: i=1; AKwUvBxSIwX2swqEKIg0Kn/7YS3/0p8aS7K/SbuATo6J/kZJot11u9tRrQuEZe41GbyCB8e/4PkWw2ouWm2pLTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZbujUeoh+chgyVzk6sDAYennuc52i4S/m2asSvduNz1l3S4HK
	saJ2nAW2FzQnC+83zukZJkVm71dOWpWZ+NkynVB7EJAUi2Qd+LMe2i0eleznksHl/X4=
X-Gm-Gg: AYBFou3Q2k/sgcuqhxjsYo7i9rvMDxV3evnLd0+rwIyZE4+Bv9P4aX7G5HNIKoC1T19
	lok02t2cnnbd9rhReCyNGLIRAHNrSZixVTakiRrwbsNSzxpBfBJ7M9vAjRnhTCYOphI0uRRrnbt
	mzAzBFZ+ByGJjA+FMY0FOiMcMQ9xANoddXi0/jCz02buhtN/YFDWUxnRnyCOjRM2m30TxQTA0yN
	ecjcZjtQtmgaO6IuTiwybr631qwhIOelwlNsxf5o16wj/MTqERY2c3jB99zuNlDBiSXDqsclx7v
	h6HcsbTLr/XfmGhrN2ieh55XOu0ovrUZ59dNMivMMFTEOz6c3WDoooLAjvZXGEAwfoKrKaR5+v/
	+0VtYLecZ56obbbbHXQpnnWCx/3ofStYEPAjxPo6CnYtQL2l+HqB6Vk0jftBrq7sLM/FlCm82K4
	55Th4EnmOT55rzHfS5xjPkKUa4NECHH2uKQZAOQMQ7PkX7IUVeiyJ26zYIjvYc84JsgpXTEFhif
	yYoAdrgXGwp
X-Received: by 2002:a05:600c:1910:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a1d7607bcdmr73735745e9.26.1792278062528;
        Sat, 17 Oct 2026 16:01:02 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.131.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm14416701f8f.6.2026.10.17.16.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 16:01:00 -0700 (PDT)
Message-ID: <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
Date: Sun, 18 Oct 2026 00:00:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
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
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2026 05:17, Anusha Arun Nandi wrote:
> Add PHY_MODE_MIPI_CPHY, struct phy_configure_opts_mipi_cphy and three
> helpers: phy_mipi_cphy_get_default_config(),
> phy_mipi_cphy_get_default_config_for_hsclk() and
> phy_mipi_cphy_config_validate(). These mirror the existing MIPI D-PHY
> generic configuration API (phy-core-mipi-dphy.c) so PHY providers can
> be configured for C-PHY via phy_configure().
> 
> C-PHY encodes 16 bits per 7 symbols across a 3-wire trio; the default
> config helper derives the required per-trio symbol rate from the pixel
> clock, bits-per-pixel and lane (trio) count the same way the D-PHY
> helper derives its HS clock rate. The timing fields are filled in from
> the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
> Operation Timing Parameters"; unlike D-PHY, these are not data-rate
> dependent, so phy_mipi_cphy_get_default_config() fills the spec's
> minimum values directly rather than computing them from the symbol
> rate, and phy_mipi_cphy_config_validate() checks each field against
> its spec-defined bound.
> 
> No existing phy consumer or provider selects GENERIC_PHY_MIPI_CPHY
> yet, so this commit has no functional effect on its own.
> 
> Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>   drivers/phy/Kconfig               |   9 ++
>   drivers/phy/Makefile              |   1 +
>   drivers/phy/phy-core-mipi-cphy.c  | 131 ++++++++++++++++++++++
>   include/linux/phy/phy-mipi-cphy.h | 177 ++++++++++++++++++++++++++++++
>   include/linux/phy/phy.h           |   5 +
>   5 files changed, 323 insertions(+)
>   create mode 100644 drivers/phy/phy-core-mipi-cphy.c
>   create mode 100644 include/linux/phy/phy-mipi-cphy.h
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d..a6b0749a40cc 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -46,6 +46,15 @@ config GENERIC_PHY_MIPI_DPHY
>   	  Provides a number of helpers a core functions for MIPI D-PHY
>   	  drivers to us.
>   
> +config GENERIC_PHY_MIPI_CPHY
> +	bool
> +	select GENERIC_PHY
> +	help
> +	  Generic MIPI C-PHY configuration helpers.
> +
> +	  Provides a number of helper core functions for MIPI C-PHY
> +	  drivers to use.
> +
>   config PHY_AIROHA_PCIE
>   	tristate "Airoha PCIe-PHY Driver"
>   	depends on ARCH_AIROHA || COMPILE_TEST
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d7aa516bcc49..a94dc1b352e1 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
>   obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
>   obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
>   obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
> +obj-$(CONFIG_GENERIC_PHY_MIPI_CPHY)	+= phy-core-mipi-cphy.o
>   obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>   obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
>   obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
> diff --git a/drivers/phy/phy-core-mipi-cphy.c b/drivers/phy/phy-core-mipi-cphy.c
> new file mode 100644
> index 000000000000..303b9a02f096
> --- /dev/null
> +++ b/drivers/phy/phy-core-mipi-cphy.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Generic MIPI C-PHY configuration helpers.
> + */
> +#include <linux/phy/phy-mipi-cphy.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +
> +/*
> + * C-PHY carries 16 bits per 7 symbols per trio (lane).
> + */
> +#define PHY_MIPI_CPHY_SYMBOLS_PER_GROUP		7
> +#define PHY_MIPI_CPHY_BITS_PER_GROUP		16
> +
> +/*
> + * Fill in the C-PHY global operation timing parameters based on the MIPI
> + * Alliance Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
> + * Parameters". These parameters are not data rate dependent (see sections
> + * 6.14.3 and 6.14.4 of that specification), so unlike the D-PHY equivalent
> + * this helper does not need the symbol rate to compute them.
> + */
> +static int phy_mipi_cphy_calc_config(unsigned long pixel_clock,
> +				     unsigned int bpp, unsigned int lanes,
> +				     unsigned long long hs_clk_rate,
> +				     struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (!cfg || !lanes)
> +		return -EINVAL;

Lanes must be a multiple of three to be valid, at least for your three 
submissions to be logically consistent, this statement must be so.

> +
> +	if (!hs_clk_rate) {
> +		if (!bpp)
> +			return -EINVAL;
> +
> +		/*
> +		 * Total payload bits/s = pixel_clock * bpp, spread over the
> +		 * active trios. C-PHY carries 16 bits per 7 symbols per trio,
> +		 * so the per-trio symbol rate is the bit rate scaled by 7/16.
> +		 */
> +		hs_clk_rate = (unsigned long long)pixel_clock * bpp;


> +		hs_clk_rate = DIV_ROUND_UP_ULL(hs_clk_rate *
> +						PHY_MIPI_CPHY_SYMBOLS_PER_GROUP,
> +						(unsigned long long)lanes *
> +						PHY_MIPI_CPHY_BITS_PER_GROUP);
> +	}
> +
> +	cfg->lanes = lanes;
> +	cfg->hs_clk_rate = hs_clk_rate;
> +
> +	cfg->t3_prepare = 38000;
> +	cfg->t3_term_en = 0;
> +	cfg->t3_settle = 95000;
> +	cfg->t3_hs_exit = 100000;
> +	cfg->lpx = 50000;
> +	cfg->init = 100;

Whatever about how DPHY does this in upstream Linux, these values should 
be defines with names that mean something WRT the specification.

> +	cfg->ta_get = 5 * cfg->lpx;
> +	cfg->ta_go = 4 * cfg->lpx;
> +	cfg->ta_sure = cfg->lpx;
> +	cfg->wakeup = 1000;
> +
> +	return 0;
> +}
> +
> +int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
> +				     unsigned int bpp, unsigned int lanes,
> +				     struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (!bpp)
> +		return -EINVAL;
> +
> +	return phy_mipi_cphy_calc_config(pixel_clock, bpp, lanes, 0, cfg);
> +}
> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config);
> +
> +int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
> +					       unsigned int lanes,
> +					       struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (!hs_clk_rate)
> +		return -EINVAL;
> +
> +	return phy_mipi_cphy_calc_config(0, 0, lanes, hs_clk_rate, cfg);
> +}
> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_get_default_config_for_hsclk);
> +
> +/*
> + * Validate C-PHY configuration according to the MIPI Alliance
> + * Specification for C-PHY (v1.0), Table 18 "Global Operation Timing
> + * Parameters".
> + */
> +int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy *cfg)
> +{
> +	if (!cfg || !cfg->lanes)
> +		return -EINVAL;
> +
> +	if (cfg->t3_prepare < 38000 || cfg->t3_prepare > 95000)

T3_PREPARE_MIN T3_PREPARE_MAX etc I'm stating a preference of course but 
I think its better practice to define your constants with names that 
mean things as frequently we end up reusing constants all over the place.

> +		return -EINVAL;
> +
> +	if (cfg->t3_term_en > 38000)
> +		return -EINVAL;
> +
> +	if (cfg->t3_settle < 95000 || cfg->t3_settle > 300000)
> +		return -EINVAL;
> +
> +	if (cfg->t3_hs_exit < 100000)
> +		return -EINVAL;
> +
> +	if (cfg->lpx < 50000)
> +		return -EINVAL;
> +
> +	if (cfg->init < 100)
> +		return -EINVAL;
> +
> +	if (cfg->ta_get != 5 * cfg->lpx)
> +		return -EINVAL;
> +
> +	if (cfg->ta_go != 4 * cfg->lpx)
> +		return -EINVAL;
> +
> +	if (cfg->ta_sure < cfg->lpx || cfg->ta_sure > (2 * cfg->lpx))
> +		return -EINVAL;
> +
> +	if (cfg->wakeup < 1000)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(phy_mipi_cphy_config_validate);
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mipi-cphy.h
> new file mode 100644
> index 000000000000..7627602eb57f
> --- /dev/null
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -0,0 +1,177 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef __PHY_MIPI_CPHY_H_
> +#define __PHY_MIPI_CPHY_H_
> +
> +#include <linux/types.h>
> +
> +#define PHY_MIPI_CPHY_MAX_DATA_LANES	4
> +
> +/**
> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * MIPI C-PHY phy. The timing fields are named after their symbol in
> + * the MIPI Alliance Specification for C-PHY (v1.0), Table 18 "Global
> + * Operation Timing Parameters", and are all time values in picoseconds
> + * (microseconds for @init and @wakeup) that are not data rate dependent
> + * (see Table 18 and sections 6.14.3/6.14.4 of that specification).
> + */
> +struct phy_configure_opts_mipi_cphy {
> +	/**
> +	 * @lanes:
> +	 *
> +	 * Number of active C-PHY trios (data lanes).
> +	 */
> +	unsigned int		lanes;

This statement and how you go about using the data aren't consistent.

In CAMSS you do

/* Set data trio lane positions and polarities (no clock lane) */
for (i = 0; i < num_lanes; i++) {
	cphy_cfg->lane_positions[i] = lncfg->data[i].pos;
	cphy_cfg->lane_polarities[i] = lncfg->data[i].pol;
}

where num_lanes == lncfg->num_data;

Let's assume dt has data-lanes = <1 2 3>; => num_data == 3

Then in qcom-mipi-csi2-core you do:

/* C-PHY has no clock lane; all entries map data trios. */
for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
	if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
		dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
		ret = -EINVAL;
		goto out_put;
	}

	csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;
	csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i];
}

This specifies which physical lanes will be in CPHY mode and what their 
polarities will be

=>

lanes specifies the number of pads in a trio
data_lanes specifies which pads are in those trios
lane_polarities specifies the polarity of each of the given pads

To my knowledge the C-PHY specification doesn't mandate adjacent LNx as 
required in a trio.

=> lanes % 3 should be invalid
=> for each trio lanes must increase by 3 also.


> +
> +	/**
> +	 * @hs_clk_rate:
> +	 *
> +	 * High speed symbol rate in symbols/s derived from link rate.
> +	 *
> +	 * C-PHY encodes 16 bits per 7 symbols across a 3-wire trio.
> +	 * Consumers fill this from the sensor link frequency and hand
> +	 * it to phy_configure().
> +	 */
> +	unsigned long		hs_clk_rate;
> +
> +	/**
> +	 * @lane_positions:
> +	 *
> +	 * Physical-to-logical trio (data lane) position mapping. Entry @i
> +	 * gives the physical lane position carrying logical trio @i. C-PHY
> +	 * has no clock lane, so all entries map data trios only.
> +	 */
> +	unsigned char		lane_positions[PHY_MIPI_CPHY_MAX_DATA_LANES];
> +
> +	/**
> +	 * @lane_polarities:
> +	 *
> +	 * Polarity (0 = normal, 1 = swapped) of each logical trio. Entry
> +	 * @i corresponds to logical trio @i.
> +	 */
> +	bool			lane_polarities[PHY_MIPI_CPHY_MAX_DATA_LANES];
> +
> +	/**
> +	 * @t3_prepare:
> +	 *
> +	 * Time, in picoseconds, that the transmitter drives the
> +	 * 3-wire LP-000 line state immediately before the HS_+x line
> +	 * state starting HS transmission.
> +	 *
> +	 * Minimum value: 38000 ps
> +	 * Maximum value: 95000 ps
> +	 */
> +	unsigned int		t3_prepare;
> +
> +	/**
> +	 * @t3_term_en:
> +	 *
> +	 * Time, in picoseconds, for the slave to enable the HS line
> +	 * termination, starting from the time point when the A, B
> +	 * and C wires cross VIL_MAX.
> +	 *
> +	 * Maximum value: 38000 ps
> +	 */
> +	unsigned int		t3_term_en;
> +
> +	/**
> +	 * @t3_settle:
> +	 *
> +	 * Time interval, in picoseconds, during which the HS receiver
> +	 * should ignore any HS transitions on the lane, starting from
> +	 * the beginning of @t3_prepare.
> +	 *
> +	 * Minimum value: 95000 ps
> +	 * Maximum value: 300000 ps
> +	 */
> +	unsigned int		t3_settle;
> +
> +	/**
> +	 * @t3_hs_exit:
> +	 *
> +	 * Time, in picoseconds, that the transmitter drives LP-111
> +	 * following an HS burst.
> +	 *
> +	 * Minimum value: 100000 ps
> +	 */
> +	unsigned int		t3_hs_exit;
> +
> +	/**
> +	 * @lpx:
> +	 *
> +	 * Transmitted length, in picoseconds, of any low-power state
> +	 * period.
> +	 *
> +	 * Minimum value: 50000 ps
> +	 */
> +	unsigned int		lpx;
> +
> +	/**
> +	 * @init:
> +	 *
> +	 * Time, in microseconds, for the initialization period to
> +	 * complete.
> +	 *
> +	 * Minimum value: 100 us
> +	 */
> +	unsigned int		init;
> +
> +	/**
> +	 * @ta_get:
> +	 *
> +	 * Time, in picoseconds, that the new transmitter drives the
> +	 * Bridge state (LP-000) after accepting control during a
> +	 * link turnaround.
> +	 *
> +	 * Value: 5 * @lpx
> +	 */
> +	unsigned int		ta_get;
> +
> +	/**
> +	 * @ta_go:
> +	 *
> +	 * Time, in picoseconds, that the transmitter drives the
> +	 * Bridge state (LP-000) before releasing control during a
> +	 * link turnaround.
> +	 *
> +	 * Value: 4 * @lpx
> +	 */
> +	unsigned int		ta_go;
> +
> +	/**
> +	 * @ta_sure:
> +	 *
> +	 * Time, in picoseconds, that the new transmitter waits after
> +	 * the LP-100 state before transmitting the Bridge state
> +	 * (LP-000) during a link turnaround.
> +	 *
> +	 * Minimum value: @lpx
> +	 * Maximum value: 2 * @lpx
> +	 */
> +	unsigned int		ta_sure;
> +
> +	/**
> +	 * @wakeup:
> +	 *
> +	 * Time, in microseconds, that a transmitter drives a Mark-1
> +	 * state prior to a Stop state in order to initiate an exit
> +	 * from ULPS.
> +	 *
> +	 * Minimum value: 1000 us
> +	 */
> +	unsigned int		wakeup;
> +};

Should the following fields be included in this definition too ?

- T3-PREBEGIN
- T3-PROGSEQ
- T3-PREEND
- T3-SYNC
- T3-POST
> +
> +int phy_mipi_cphy_get_default_config(unsigned long pixel_clock,
> +				     unsigned int bpp, unsigned int lanes,
> +				     struct phy_configure_opts_mipi_cphy *cfg);
> +int phy_mipi_cphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
> +					       unsigned int lanes,
> +					       struct phy_configure_opts_mipi_cphy *cfg);
> +int phy_mipi_cphy_config_validate(struct phy_configure_opts_mipi_cphy *cfg);
> +
> +#endif /* __PHY_MIPI_CPHY_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index c480d6cb42c5..f12337834031 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -19,6 +19,7 @@
>   #include <linux/phy/phy-dp.h>
>   #include <linux/phy/phy-hdmi.h>
>   #include <linux/phy/phy-lvds.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>   #include <linux/phy/phy-mipi-dphy.h>
>   #include <linux/phy/phy-thunderbolt.h>
>   
> @@ -42,6 +43,7 @@ enum phy_mode {
>   	PHY_MODE_PCIE,
>   	PHY_MODE_ETHERNET,
>   	PHY_MODE_MIPI_DPHY,
> +	PHY_MODE_MIPI_CPHY,
>   	PHY_MODE_SATA,
>   	PHY_MODE_LVDS,
>   	PHY_MODE_DP,
> @@ -69,6 +71,8 @@ union phy_notify {
>    *
>    * @mipi_dphy:	Configuration set applicable for phys supporting
>    *		the MIPI_DPHY phy mode.
> + * @mipi_cphy:	Configuration set applicable for phys supporting
> + *		the MIPI_CPHY phy mode.
>    * @dp:		Configuration set applicable for phys supporting
>    *		the DisplayPort protocol.
>    * @lvds:	Configuration set applicable for phys supporting
> @@ -78,6 +82,7 @@ union phy_notify {
>    */
>   union phy_configure_opts {
>   	struct phy_configure_opts_mipi_dphy	mipi_dphy;
> +	struct phy_configure_opts_mipi_cphy	mipi_cphy;
>   	struct phy_configure_opts_dp		dp;
>   	struct phy_configure_opts_lvds		lvds;
>   	struct phy_configure_opts_hdmi		hdmi;

