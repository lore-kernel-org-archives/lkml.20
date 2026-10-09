Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739CB51A15A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570594; cv=none; b=KoDx2lv2GL3b29jBdooZBHW6I5YBPUwdTzVIJ+NlzJq4anZZVP+yWPqH6Eg1LpRTNtwvhmVbpOR1AmV7lXgqz8vc/8Bxs4CX0hSyJYPshjdS5mdiLRZw4vbMPF/wwR1KHB6MfwPcXeZl9GeebU1cmDERR7N/Mbtsl/4nbZZ/3rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570594; c=relaxed/simple;
	bh=hqh6Oz8jthBJvM6D58JFS6alnDs/Glpqv2ePGiXx8QM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eKjRTZFYXuGDmr5kdWrtHe2F3ATILqi1XbbkJwcRALdGgykpNQgKerLOQghOjYcJ4pDRExoyCcgrd7dKhobxYgLjL2MksnUZxdBxDpX4xUNF6/bDhkloTSxTiGWQA8oN6BYCCaTtJRtpywm0vhUumfGxlanxxqPNV4h/TRWQUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ABpHM5Ti; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ABpHM5Ti"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d870d54so58421f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570584; x=1792175384; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/afa+kv2Lz5RKZtvNmWgTzIvifY9Vb7PPR36VvNXyQ=;
        b=ABpHM5Ti0tKorqQaGxWBDdHR53/kWciDt2FtCCvYnWLuSUoQLJH63duc8oi4PkXA3o
         8HF/7gZR6O8EBJnK1oktDY/aVdOg6+umiK6QDOs1yk6mFGcY1O6EpA44Ia7W4qK1gGoW
         7+0uYjdhHCbLDQgMNrCcrxvd6e45w5VoBRH+fk6Oe05dxCeFDBEMGXL+ExP7P91CXFSS
         QcGkJ+hEHiks0WD1dgQ3qEnRI0uEWrrvO47gvNYMjKRi27wv8GLXi3J5Rf6SREFStqH6
         Vby+mTaA5Zbo6yO+5lbavt74U4JLNOA8mDtz9Fu0C9xpRffCW5LoLBdZqUiRow2uD3BR
         cYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570584; x=1792175384;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/afa+kv2Lz5RKZtvNmWgTzIvifY9Vb7PPR36VvNXyQ=;
        b=SUeiYAcNvr+2VFtkCfjyTMRkrOsePVj59kqlAt5P/qyImHhwl2xVzfDayXO3X98VTf
         JSnr7HuO1Jubf1Zb4+NxZz0GSUbyl7dHdTssvYMTK+zmpaJfoNBn47p4VyvG9l4f8aCc
         +3KHhj+p8peYs3r/AE/CuaYlE7W1iM4yAlherTnw7ZMyW6WhZmLU7+eI92sw/0BmLMIx
         47tOal8uk8lXl/H/7IRTNsJl64RMxf42Ot4Qi3WbXo5RanD0JVt0mjEK9DuetBcZc3rX
         gpeO7FTMmZxG2dbgblNWCRTsRtRv+rEdZdwiFBxkFzcQFy7smkgPd8nIaLBh18hkDDH7
         r7uw==
X-Forwarded-Encrypted: i=1; AKwUvBy+9r60jVGebG/jC/VbJ8ESiZoHk06uaJjIBFMyNkPLnFc+NJawErvaBJujWEtWaWWkiUX1gxix9Lyjp8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk4zYMwOh7D4OvL5MEV3k7ta3RwKvFpujrytYpovLcOWWSuQWZ
	o8iKDGYRUnnmuNHT5nCK8k3RgCLNkxBDnf+AVx2Du4M0MH0HhhXacj3sAHz54qgTDno=
X-Gm-Gg: AYBFou17K0oEo62CTpmG4MCpBAG401sbXAGxIp8XQnXXw54D+/MrFZPFhK9er8F2p6C
	QCPFHwYSlmLy+NYoNNjyvostmpSQMjQaVu1af9iv5YwlOrx63XJDCtwtwwYH55YKpkQEMkMoNV8
	2Lzd4+GMlr1DoCXwa9J3+j5faOJp/6DmDLYJQ11ckcFrBQ1mcs3lzyIoCF/JiDLBmR/L/MfZbzu
	gaknxXNkoosdAuFh52WETjda0+yAnvDZn2Ua0W///12GK1cwiKt5lZGaQ/LHdGYdUhKgdQjMaJD
	U625rcnR1gMvopz0fQRbl16z77g8gloKkf5DyQi45BD0Zsp1uKZ9pP7EfQ/T/N4neyF7/bT2uaN
	LuVqa4OEuDyXTwGoGLTfb2Rwi0OIJYHrz8irMBk8NGcLvPMTab4vN6TMoWJkQzuFApoRnh2vUK6
	xwNdhVbluMA3j5+K1YVvQqhjyD1QqfvcZoEMz06bHAlJsPBsewRr2++CcPzW76bh41TdzGRaEBM
	b/jOqidmVcbLoGVaA==
X-Received: by 2002:a05:6000:46c8:b0:487:1c89:f158 with SMTP id ffacd0b85a97d-48dbaadebc8mr3400904f8f.14.1791570584563;
        Fri, 09 Oct 2026 11:29:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm5786376f8f.9.2026.10.09.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-6-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-6-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.7662236812996349329.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8040; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hqh6Oz8jthBJvM6D58JFS6alnDs/Glpqv2ePGiXx8QM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaZ6XD2gxBc7UcxvMqv66R9tfMfl32j8upP+fZ6id
 0cV50mLjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyEcz4jw5qAl/6Cpc9TZ9UG
 hx7OtNFZ/ahMVML8S+MftuzfBf+fiDH8T+W6Knej7crxOQvKtGPbr8wI4mm59qhhz7Q3nA0zFIU
 u8QIA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 13000ed4ba11..71edc18121c6 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
> +clk-rtk-y += clk-pll.o
> +clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 000000000000..31670b8316cd
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include "clk-pll.h"
> +
> +#define TIMEOUT 500
> +
> +static inline struct rtk_clk_regmap_pll *to_rtk_clk_regmap_pll(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_pll, clkr);
> +}
> +
> +static int wait_freq_ready(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	/* reg == 0 means not configured.
> +	 * Register offset 0 is never a valid address on Realtek SoCs.

Fix the comment style please

> +	 */
> +	if (!clkp->freq_ready_reg)
> +		return 0;

Do you need to protect against your own driver providing bad offset ?

> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
> +		(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val, 1, TIMEOUT);
> +}
> +
> +static bool is_power_on(struct rtk_clk_regmap_pll *clkp)
> +{
> +	u32 val;
> +
> +	/* reg == 0 means not configured (assume always on).
> +	 * Register offset 0 is never a valid address on Realtek SoCs.
> +	 */

You've already said this. It would be more helpful to tell us that PLL that does not
provider a power reg is considered to be always powered, if that is the case

> +	if (!clkp->power_reg)
> +		return true;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return false;
> +
> +	return (val & clkp->power_mask) == clkp->power_val_on;
> +}
> +
> +static void rtk_clk_regmap_pll_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);

What do you protect with this ?
regmap does provide some locking already and CCF too. Do you expect something
to poke the registers you are writing ?

> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +}
> +
> +static int rtk_clk_regmap_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	ret = is_power_on(clkp);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int rtk_clk_regmap_pll_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *ftblv = NULL;
> +
> +	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);

Doesn't this completly disregard the parent rate ?

I understand that SoC vendor may expect a single frequency as input but it
it is pretty fragile to do so.

A PLL is usually some sort of (fractional) multiplier.
It is way better to provide the table of multiplier you support, along with their
sequence and properly doing the calculation here.

> +
> +	if (ftblv && ftblv->rate >= req->min_rate) {
> +		req->rate = ftblv->rate;
> +		return 0;
> +	}
> +
> +	/* floor result is below min_rate; find the smallest rate >= min_rate */
> +	ftblv = ftbl_find_ceil_by_rate(clkp->freq_tbl, req->min_rate);
> +	if (!ftblv || ftblv->rate > req->max_rate)
> +		return -EINVAL;

This is not how determine_rate() works. You just round to the closest rate the PLL
supports. You are free to round as you wish (bellow or closest)

Just test the different multipliers you support and return what is best compared to
the request. There is no reason to return EINVAL for this.

> +
> +	req->rate = ftblv->rate;
> +
> +	return 0;
> +}
> +
> +static unsigned long rtk_clk_regmap_pll_recalc_rate(struct clk_hw *hw,
> +						    unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *fv;
> +	unsigned long flags;
> +	u32 freq_val;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val)) {
> +		spin_unlock_irqrestore(&clkp->lock, flags);
> +		return 0;
> +	}
> +
> +	freq_val &= clkp->freq_mask;
> +
> +	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
> +					freq_val);
> +
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return fv ? fv->rate : 0;
> +}
> +
> +static int rtk_clk_regmap_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	const struct rtk_freq_table *fv;
> +	unsigned long flags;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		goto unlock;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +static int rtk_clk_regmap_pll_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp = to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	if (!clkp->seq_power_on)
> +		return ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (is_power_on(clkp))
> +		goto unlock;
> +
> +	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = wait_freq_ready(clkp);
> +	if (ret)
> +		goto unlock;
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
> +
> +const struct clk_ops rtk_clk_pll_ops = {
> +	.enable         = rtk_clk_regmap_pll_enable,
> +	.disable        = rtk_clk_regmap_pll_disable,
> +	.is_enabled     = rtk_clk_regmap_pll_is_enabled,
> +	.recalc_rate    = rtk_clk_regmap_pll_recalc_rate,
> +	.determine_rate = rtk_clk_regmap_pll_determine_rate,
> +	.set_rate       = rtk_clk_regmap_pll_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "CLK_REALTEK");
> +
> +const struct clk_ops rtk_clk_pll_ro_ops = {
> +	.recalc_rate = rtk_clk_regmap_pll_recalc_rate,

is_enabled ?

-- 
Jerome

