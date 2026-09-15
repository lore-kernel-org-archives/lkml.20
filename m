Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE13C062D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476843; cv=none; b=hLOUQ+Y5mfLl18RtFp8daUbelZBk9dWkPEZWzaWRY4LAD4IqkRWF4jqCHmn78G3dQ7ikURRNf/lE2cpfmcMfGR1ac/i0OHfMl5F93bneHoAP09b360QzYZ084hb6Zr1KYFVazTIGS176aJmLu5qufcswNUntebKKC5f3nG+mxTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476843; c=relaxed/simple;
	bh=M0IzIsWiPP1002jx1x32ohvsScyH0p5PmYjJWCPWxCs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=r7PdCpnOgcJkohQ2shX4INroS6tMy6Ndr5h7q3BnmqVh+xXLCdG6iWI1S/uinBuzg+WJwpR3x3jNznYMtkJz1taz6zyYgdemn0rN1LyHNP4Tg0NEGDJ4YxaNMwNeXCjZh2Hl9CXHJ7OGC4aE6nZ/Tx32Dj2UGxlrqvo5EF2DyJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FiVME32X; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FiVME32X"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so1818045e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789476839; x=1790081639; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=;
        b=FiVME32XVD1iAVGitvogCHAwq/awfFUzLl+DoXa52u4fOQuVTx8ZhEGNI4Xb7ba2da
         ceMRzg8zkPzVG19uUCv7IAVzfq+2HI3gFKdCAUPLJp+wfWouKTmUNezoFuSTl+ImliKX
         Xj/00EFOcmMIpXWnJUDN00mtQANb1Q+EKbaQTlp48R2d3PyY7PQejbAwcgw7tGtalX3N
         SE8sffIsMOWoc1EREk8yQ8Ozzas3X7Mzz2Y2nMaVZuUfh+1LGvZqHMlUYClePVzx7iAz
         nzcyb0J68+LzrKA+lBqeSlP0Ao0NZVodFRdXYcGwzahnP6ydTZsy9DoY+USM7gE1wGPI
         J4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476839; x=1790081639;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=;
        b=M4gEon8tDoH8SiLGEmPe3uNeiXsIDPZw74lqwZxodtLrLyHjTj6PI6GL/8UhCPtt8u
         VulIK5c/sZe8yh4syoS6Vm+CWMjGu91uMPsrpBMOEpuwXEeIA/641c+Wy0hZwF6twfNQ
         LnOGOywXfsagHkXOXLz3hr9pKbla/otEShb59QLlUHXnfCpEc2u2JDbU9hPBMFzRwKA2
         7CcfIHyXl7RcC+mXFB2LJcEy1Yl0q1HFrrri/thMF6yiOb1KtWXU89Q1oJVd4IH/Se+M
         E/29fNc/7Lhrc+OcRvsGk7RIVdk5FeEyaqUjkvowhmVvGc37AITOvGVvbEAcca5aF4q7
         nu4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzL14BJfoQLxKLzbf5uHDB91egU7+2v0HXWd2CCoFKclZL3Rl7spNPxumwVrkaui6dpWNu292sNc0qEEFM=@vger.kernel.org
X-Gm-Message-State: AFuF++kXxyYy4+GBoN1tKmFD4hb6Y0Jea3imMfUikb8C1qi4KKLxdivZ
	lLr/vhSKZxGGLJ7vpUV8YDDwGREcnAhCouielPp9RhONpckv+g4pEKEfRJsTiw5z7zI=
X-Gm-Gg: AYBFou3gIuQlvMjEB0bQT1b8QFOPB6jFfnp0QzpjkxfPOUkjNdOlf+H/r7JHQxfM5lw
	IQ+GgXWrdU4OUg+BC5tmBzBVwPWHZOjvPXji6QzVAxQOvzuT4hp5p/LDPyZ/xPuTw+2adJVscRd
	MPggOnxd04FqVdf8yPDfzhX8dBnDCSqkANZMeOnM0dBG0ygiHZdtJvHT3WLf46R/WE/Fgv+HzyW
	kAXDKWNKT/HgYLsuJvEToTKIbPiwBTKJNyPrm08FkHfJ2bsC70JEST+5oHbkcc8K9jC1OpdisBB
	5NKGgPCkx1uXqqI5VTZbgx2QyRoov0rxi0aSmXI7AxfYd8juROrMRnGarWs4/iWXzbjA2c2X3V6
	m5KhhEznKQencS4mIcwZ0BFyXWY5P0fjQWuTwVsveHA83IZ3WEKZfUkdNYqxF1E0h2bQJvridhZ
	XFO9Un5eoMmZgsqQLlQV/XH01R4d3xKrLGzTkp2+Z8JiUeJCLQQ3i+Dj3PF9oOkS+u7qFD7dVBw
	/tcI/NZG3Ac4uRjRQ==
X-Received: by 2002:a05:600c:1c26:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49e82213842mr16348805e9.5.1789476839476;
        Tue, 15 Sep 2026 05:53:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm73406825e9.10.2026.09.15.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 07/11] clk: realtek: Add support for mux clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, cylee12@realtek.com, afaerber@suse.com, 
 jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260901072446.2563145-8-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-8-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:53:56 +0200
Message-Id: <178947683646.448573.8652586338644531668.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4922; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=M0IzIsWiPP1002jx1x32ohvsScyH0p5PmYjJWCPWxCs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqT/kIj2H05/TQ42wyCS3cLOfpVaD8wrOMQ3y+
 Ny8dTCQUReJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk/5AAKCRDm/A8cN/La
 he81D/45r9CNZwZIVBcLR0EH1/ZBwuxMLr2LG9h4TeHpWHTcEMtRCnWHjpnlVR9r/MRkZM/5dxv
 J3ITQ2RCLm0YArSa+h6lzIQPyon1HsMu4WhNvHt3IxjliQ3r9VWrn5hSP8YARJZBP7EddBboad5
 LHVi0mWjIh8j8DsGUMs8ShpLE5W8AOmaR62C9AViwhEznxzyz3w9MCDnq5hgmSzpYVHS3aDat5Q
 d5c/L+INQNYBIEY3DmSfV2CiY50Xg3NZYhEnv0ZjYtOEQ4v/A1VVR7+yZxxA0hRDhEYYLJfqpyL
 2JGmOm9ST3nEPTB2QVJHrRXFcVWJzrz1S1lkaaczkzQa7w9x/72P0AaFv2JdQ5PDnTgZBelgylG
 DzH1uZXCIkxIsvUwHJMv/iDRwA52DphXgdiXzUZzmNc0FdL0txxPPNJ0eBixDbuMn7T8VMhemIt
 OA3NDET+hDgzz+xCJ7F2sOyLhqpXVl0SB4DL4aaz/MQjDPsr0/XOh0J/9C7tJcCFzn0YmvWdEtp
 /CZi/IbgYuw04Ql+j+Izsr2UmSk005u7rzwGXa2c25RYrUD2FoedEUTwbx6aSzO81pW9e97gooZ
 EriyMjYVl2D+cYSRN1YGN77gxpz/aOvAXq0F6zBCgedZ0Tt4YLY200PqACAI4be+lZE/9S8maXx
 4xTnCvcV44d+iVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tag to the correct position.
> ---
>  drivers/clk/realtek/Makefile         |  1 +
>  drivers/clk/realtek/clk-regmap-mux.c | 41 ++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 840aff067b61..217ccaf5644a 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
> +clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
> new file mode 100644
> index 000000000000..1069c95595aa
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-mux.h"
> +
> +static u8 rtk_clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
> +	unsigned int num_parents = clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0xff;
> +
> +	val = (val >> clkm->shift) & clkm->mask;
> +
> +	return val >= num_parents ? 0xff : val;

This is not really useful, the core already rejects val >= num_parent.
So returning a higher number changes nothing as it stands

> +}
> +
> +static int rtk_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, (u32)index << clkm->shift);
> +}
> +
> +const struct clk_ops rtk_clk_regmap_mux_ops = {
> +	.set_parent = rtk_clk_regmap_mux_set_parent,
> +	.get_parent = rtk_clk_regmap_mux_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
> new file mode 100644
> index 000000000000..ad524bb86a19
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
> +#define __CLK_REALTEK_CLK_REGMAP_MUX_H
> +
> +#include "clk-rtk-common.h"
> +
> +struct rtk_clk_regmap_mux {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int mux_ofs;
> +	unsigned int mask;
> +	unsigned int shift;
> +};
> +
> +#define __rtk_clk_regmap_mux_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
> +
> +#define __RTK_CLK_REGMAP_MUX(_name, _parents, _ops, _flags, _ofs, _sft, _mask) \
> +	struct rtk_clk_regmap_mux _name = {                                    \
> +		.clkr.hw.init =                                                \
> +			CLK_HW_INIT_PARENTS(#_name, _parents, _ops, _flags),   \
> +		.mux_ofs = _ofs,                                               \
> +		.shift = _sft,                                                 \
> +		.mask = _mask,                                                 \
> +	}
> +
> +#define RTK_CLK_REGMAP_MUX(_name, _parents, _flags, _ofs, _sft, _mask)               \
> +	__RTK_CLK_REGMAP_MUX(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
> +			     _sft, _mask)
> +
> +static inline struct rtk_clk_regmap_mux *to_rtk_clk_regmap_mux(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_mux, clkr);
> +}
> +
> +extern const struct clk_ops rtk_clk_regmap_mux_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
> -- 
> 2.43.0
> 
> 


