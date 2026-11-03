Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726470;
	b=Z42/RuWiXw4kQ/vQFC8aorg9m0uFBF00BwNV2QGzb+UVtX0bdqXEPau2HbMiengN53dF
	 VqMUNeV41bh/TP/pxcS9acxijT4o/b4eLgnjD5/U+qCrr6J54UN4vOBP4jAtXYp26S4Qt
	 X+hrVmUCFsDO6YoFd9u6ewu1z4C/VildQw4FkBlhT2yFePx1HfQMSP0nBKABDjWttXCFQ
	 iKWoWg3ReX7z8uGJZBV0u6MBUVNScWM31sm+RaTKuNhRYLWHyh/2HvuDAcf779vLAELnB
	 +sDHRdZkAEypg6Pdug8EaR3xwnYBBPFns6mLSXTiHJAPMOYfyctXJczQ6s8MqE+j4Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=roOiO3ldaNsjLxe0CYehd5v8rGn8f4LGIVU12eUR/M4=;
	b=ebmRwaLRE4UZX6z7WOzpxsA21cynUYMejBWnOpUhF5cK4ykvwlApyJECAvgdBuxDqGRi
	 1iMt/xtbeFTkPxW1Klj4NrtsYuNF6omB30EhUf4MkkuN9TZ4C3jXInfMJAzEve3J7CoAd
	 g32SYyHQQjaAYfKwE/vbtppOcP+eJfi9V3x6qvTxN5YTu9WH6ePxQ+1pPiJROpDLrmHci
	 V03eguszk6B2WiBPnBUk1FOytGOHon2rAPOtvInSKD7I9/8WiKqR2IlAgI65b7TLQa55d
	 eUhlVVXLS0NyDIYPXtnNUitiPG38AeSNMP8UNxd/68WO0B34bqHlYEuoi1D70i2lg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpUukxdp;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270F606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2270F606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TpUukxdp
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so29816835e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726468; x=1794331268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roOiO3ldaNsjLxe0CYehd5v8rGn8f4LGIVU12eUR/M4=;
        b=TpUukxdpYG9assmBfrFi6axTBVe0+dFXxNmwZX1d7X+jav48mhN8CnCEJao7E1aP4W
         USBKunWX0det+kHvEuGFSWSm85lB87LU4ju+qZvA6raej1Jymy8lJmihDqADTGiz8Jy2
         fzLh4wEOHyPgx4RO+iJgQK63tG47iAZxN+KkjC1730rPonzcI+Tkx94wt4POeALJDiJr
         WxKwvWwLkRvR66uD7qXOCd3kvAYRrUacUHnEp9xLue9W2JnL8EWKtFm80QO+btwwsfR8
         IuzvDDX4YgeIvcBnqINQiCpYdABloPP97/aIVdl7SqsZX/w5i//jrrZIaJ2XLOYx5Z5J
         DKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726468; x=1794331268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roOiO3ldaNsjLxe0CYehd5v8rGn8f4LGIVU12eUR/M4=;
        b=maUbaTJ4idHSV9MFA0wVAMnXpzmsRCtgZ2sGNlHxm8TjhWJmbesbZYgQXZRo6xCUZs
         A6+bvbodqtS166G7F5rE/ZOiJ1nr6jgN5o9dPNYUp1Z+rqyGvxjPKR5SdmrKM1kIfAel
         Qv+PmGJoiO0ezyr3IOLqmr+4eVOptNmJD3V5vw2W3BQeVSj2e7aOgTGsLzbQ1+KOnrxK
         rp9F008lWWZra4mLlWGdiocvNjE4lyZQ9NyKXzjU3K4VLNeku7NQm9SxWcqkv2D/CW/c
         4rpouHFfDuQy+ZR9+JwJHs4ktgm8//uWCXEbzlpWHEzJOijINwZde1GycLZeXRqCAAH6
         anXg==
X-Forwarded-Encrypted: i=1; AKwUvBym/zW10f/W2xJys9kzcnuIhSwyTnhaGG7C1hI7RCQS2JrDz8xqixULLqBY2mDdUmScmR+h5PS/OKCg58I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F1HXywBUakP6qq6tw0XP8jzQPSphHJFF8COkIqpmX3mZjIc/T
	T1Lu2Z5soKGjBxftoKqPAWuZC+8nMAxl2bWqwcTsZd9LEjKHC9tDOpXM
X-Gm-Gg: AYBFou3BNlGeMeRa0U6re2ldvuwSH+FK09Wogdpknfc3PnRfI6ZhsRW7oHm75gJY/Lj
	FEgQY3fyZRnzVacCL/J/cFqArL+QNEsp3c5AKjL4i0x0QmDtLSnEue/zrJwgyHuC8vdpxf1PDM3
	vjEebga3Ib79IFpjvYETzCvLdqXtDOanOd1mCZ8NRDKO/oYS4yG0lS9Upz/yp0iGwI03GfHBNTJ
	57oHqjCYuQhOquCayqOnXM4y0uvW2Eqq0iVm0oBJqTLQ3omlyaoAgx47viAsJekysO4DjUMLEtV
	CnLlCUkE7LlVFBlqFvSkf13z1Qbp2giqYUt7XyuCL3aW0L4OQusBuHp+vT4AmHgbI+OhsWlBiSz
	dBNaNA6YfQ7R9y/VpTI6cskzYnlswxD6EBBnRsSkVDQlaJq0WhCCu2N+dj+Upx+I6HrmC3NtsXP
	uo62DzQAkHQUECH4g9+hWC7yvo3/SIGjyVdsREs9Y/ybuMq7F+ZlPMKjWKBSKZuMl/hdQX06ADJ
	FBYWlyc+sqqta8PVurnR7Na4yvOxw5SVRErOoJfMkRA0+qLkdQuOIQtZUQHLkXgA3qt7Xe0MG8v
	95VHsDZTOxHPqHEX1BXEBxXF6k5cerLxgj5KUqkakDB/vJj1OgJ5BkORpvJs0DaafWf+hWi/tZ9
	mcYK5lWlo0amS1S4v95CDNb5PzVJ31WIn75kgfQ4=
X-Received: by 2002:a05:600c:811a:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4ac18e5dac8mr287441665e9.34.1793726468458;
        Tue, 03 Nov 2026 09:21:08 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:8b77:19e1:26f7:89f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72579sm8800675e9.2.2026.11.03.09.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:21:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH 3/4] drm: renesas: rz-du: mipi_dsi: Improve DSI PLL parameter selection and cache results
Date: Tue,  3 Nov 2026 17:20:56 +0000
Message-ID: <20261103172057.617203-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261103172057.617203-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Mode validation searched the divider table once, kept the best CPG match
and only then checked the DSI PLL. A divider losing on CPG error alone
was never tried against it, so reachable modes were rejected.

Evaluate each divider on its own and keep the one with the smallest DSI
PLL error, handing it to the CPG via rzv2h_cpg_cache_pll_pars(). The
search also takes the PLLDSI instance as an argument and records it,
walking the instances described by the new num_limits field.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 87 ++++++++++++++-----
 1 file changed, 66 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5b257f5adf06..682bbb339bef 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/limits.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -55,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 		const struct rzv2h_pll_limits **limits;
 		const u8 *table;
 		const u8 table_size;
+		const u8 num_limits;
 	} cpg_plldsi;
 	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
 	unsigned int num_dsi_global_timings;
@@ -69,7 +71,9 @@ struct rzg2l_mipi_dsi_hw_info {
 
 struct rzv2h_dsi_mode_calc {
 	unsigned long mode_freq_khz;
+	unsigned int pll_instance;
 	struct rzv2h_pll_pars dsi_parameters;
+	struct rzv2h_pll_div_pars cpg_dsi_div_parameters;
 };
 
 struct rzg2l_mipi_dsi {
@@ -671,43 +675,83 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
-static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
-					      unsigned long mode_freq)
+static unsigned int rzv2h_dphy_check_instance(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq,
+					      unsigned int pll_instance)
 {
 	u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
+	struct rzv2h_pll_div_pars best_cpg_dsi_parameters;
 	struct rzv2h_pll_div_pars cpg_dsi_parameters;
+	struct rzv2h_pll_pars best_dsi_parameters;
 	struct rzv2h_pll_pars dsi_parameters;
+	bool found_valid_parameters = false;
 	bool parameters_found;
-	unsigned int bpp;
+	unsigned int bpp, i;
 
+	best_dsi_parameters.error_millihz = S64_MAX;
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
-	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
-					&cpg_dsi_parameters,
-					dsi->info->cpg_plldsi.table,
-					dsi->info->cpg_plldsi.table_size,
-					mode_freq_millihz);
-	if (!parameters_found)
-		return MODE_CLOCK_RANGE;
-
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.freq_millihz * bpp,
-					       dsi->lanes);
-	parameters_found = rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
-					      &dsi_parameters, hsfreq_millihz);
-	if (!parameters_found)
-		return MODE_CLOCK_RANGE;
+	for (i = 0; i < dsi->info->cpg_plldsi.table_size; i++) {
+		parameters_found =
+			rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[pll_instance],
+						&cpg_dsi_parameters,
+						&dsi->info->cpg_plldsi.table[i], 1,
+						mode_freq_millihz);
+		if (!parameters_found)
+			continue;
+
+		hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.div.freq_millihz * bpp,
+						       dsi->lanes);
+		parameters_found = rzv2h_get_pll_pars(&rzv2h_plldsi_div_limits,
+						      &dsi_parameters, hsfreq_millihz);
+		if (!parameters_found)
+			continue;
+
+		if (abs(dsi_parameters.error_millihz) >= 500)
+			continue;
+
+		if (abs(best_dsi_parameters.error_millihz) > abs(dsi_parameters.error_millihz)) {
+			best_cpg_dsi_parameters = cpg_dsi_parameters;
+			best_dsi_parameters = dsi_parameters;
+			found_valid_parameters = true;
+		}
+	}
 
-	if (abs(dsi_parameters.error_millihz) >= 500)
+	if (!found_valid_parameters)
 		return MODE_CLOCK_RANGE;
 
-	memcpy(&dsi->mode_calc.dsi_parameters, &dsi_parameters, sizeof(dsi_parameters));
+	memcpy(&dsi->mode_calc.dsi_parameters, &best_dsi_parameters,
+	       sizeof(best_dsi_parameters));
+	memcpy(&dsi->mode_calc.cpg_dsi_div_parameters, &best_cpg_dsi_parameters,
+	       sizeof(best_cpg_dsi_parameters));
 	dsi->mode_calc.mode_freq_khz = mode_freq;
+	dsi->mode_calc.pll_instance = pll_instance;
+
+	rzv2h_cpg_cache_pll_pars(best_cpg_dsi_parameters, pll_instance);
 
 	return MODE_OK;
 }
 
+static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq)
+{
+	bool found = false;
+	unsigned int i;
+
+	/*
+	 * Check every instance instead of stopping at the first match, as
+	 * rzv2h_dphy_check_instance() hands the parameters it computes over to
+	 * the CPG, which needs them for whichever PLLDSI ends up feeding the
+	 * encoder.
+	 */
+	for (i = 0; i < dsi->info->cpg_plldsi.num_limits; i++)
+		if (rzv2h_dphy_check_instance(dsi, mode_freq, i) == MODE_OK)
+			found = true;
+
+	return found ? MODE_OK : MODE_CLOCK_RANGE;
+}
+
 static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
 				u64 *hsfreq_millihz)
 {
@@ -715,7 +759,7 @@ static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long status;
 
 	if (dsi->mode_calc.mode_freq_khz != mode_freq) {
-		status = rzv2h_dphy_mode_clk_check(dsi, mode_freq);
+		status = rzv2h_dphy_check_instance(dsi, mode_freq, 0);
 		if (status != MODE_OK) {
 			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
 				mode_freq);
@@ -1647,6 +1691,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
 	.dphy_conf_clks = rzv2h_dphy_conf_clks,
 	.cpg_plldsi.limits = rzv2h_plldsi_limits,
+	.cpg_plldsi.num_limits = ARRAY_SIZE(rzv2h_plldsi_limits),
 	.cpg_plldsi.table = rzv2h_cpg_div_table,
 	.cpg_plldsi.table_size = ARRAY_SIZE(rzv2h_cpg_div_table),
 	.phy_reg_offset = 0x10000,
-- 
2.56.0

