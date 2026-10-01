Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A54A0901
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847654; cv=none; b=e18bvizJ/R5PSmEF1llSzwhb7kJ6PBuab51d43K/ZqsSsGserbntHmSkXdeBjo7WEvyYrOpH4vJpLI0Sa80Y4A1qSFhbDO41dxZ6oa/3q+ykZravbihFK0xqxigkmJ0QE9w3SGhM8EUHO1FqSeP0rrrGCvlXtaHF6jqJwLILi8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847654; c=relaxed/simple;
	bh=bZVqfsg0fYkNmi9fnZh+zxw/752628imayBdG5s7AIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgKjxkzebha4lWSh6V0NLNCjP3czfdh5hPjzNM7mZSVv4kd7FjpWwlLN7Bnk0AnpK4FdDxkCg8ZaDDkKhS9yK8qVdUQiqcLMg8Im9uXqqmDa5BsVOoUcOSoE+/Yx+9x0yzyl3DBzNOaX3CxtxGyLiKSokYClN7dhBxin1T4kIM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsKxnt+g; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsKxnt+g"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so38692375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847649; x=1791452449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GQjvEPjsV1ioeI6s6lSaF39OQgtna/kFakp0UtgRYw=;
        b=CsKxnt+gVoHlG3IGGVA6aOoXiNmAz1AS1pYYIX3JRchBUMDFDl6ytXaos1NFbTJBiW
         1ASSO2nAYJxOkkfyTXrM4wLX+ghIF9GnWFaRLcrTqL4xMTJ+ulh5+XKrAc/y5qJX59bz
         +2e2VVP/JPXZyiibVuViy+9C4zgKjur+BQ8X/geebLFJL8bE8oRP0dfaDuXNQBWv2Ol6
         TvDeQkRXscC4ZmdRMtPzivK0DptS/N6yaNaleuGPxmvIJMcu2dA0mPfUnqceCQygq+Pz
         CgK2sM4GfiukUL9fiEswf3QTLnUp+44oVaLELw2OQ7eSZ1aEwHlr/1FIuciyrgf8XbFG
         joBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847649; x=1791452449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GQjvEPjsV1ioeI6s6lSaF39OQgtna/kFakp0UtgRYw=;
        b=bmOmyg1D/VsK67yacP319z86pbwIqe4r297Z8ow0Obc/PsELbIn94ZTmn8TiH9Za/S
         b75Cp7I6ZCTwfH7txBKjvcu+vrwZ4Qt48ctaaVq2cOqWAt1eS6f4Uw566mNNnzqyMDHb
         s9ZfJ8IYi/bVa1u+k8uhdr/nbu+g0sQRYC+CeiH8wQPkESqPiRB0G0yiTla02NeQGNQU
         O0gSwll0XAQbiSd1kDwj/ObkaMt/S78a89JswBJKxhMM5ALjMgwMN9owa4J9KGNpQqsK
         jq9Qpk0yga1ksiggiAALvFXYm5Z1RqizIk9qHU6VSNW4XxGe0JiPIntqHnBNOWGT+dwv
         G5zQ==
X-Forwarded-Encrypted: i=1; AKwUvByVPZIdiEPBRBdKWClbsXx9wCdOT4B1+TryM8wU5CdrOWSCIqXIlljem3aNYrpWuIUHIukSp0Ym7xcrAtM=@vger.kernel.org
X-Gm-Message-State: AFuF++lW7ODBMiMzoE309lZryhcnL9yFqdIqGJQEwv8HRfc7uTwQCAL2
	F+EVxn76dotFB6fCdxvqKI3CHI3NXmXrRZlrgInD9j994KmXDXXkdAUL
X-Gm-Gg: AYBFou3YrG+LvxcWsaUIimo9gdZBQTkpXnqlB3PvfoaUax+p4xr9aKiJXts7CJ44+TC
	Cw0Vfdm/+zmulfakP7I46qUbVcp4uWgvb68XueI5EoWDSjyYdKZFQcUqdQE8uS9i9VV9s/LtlGj
	P/YwUBlGdbrxrLQOgHLEjCp14wVJ/gDcKuLC3N2lwqsOYO6AjMYaMsofMD0aYelWnQV+ffUoFbD
	pnB3xnif9BHrVqd0ofM1oSGF86jaGQMJMFZuAkr8KgLRzcL9dg30Vip2GWGeMleJiv+xd00ZQwm
	5GMbu0AWfADzEwOknIk9TsF+TmXUDQIAOhm57wyuXqXQ24AXyrQ3TlaHjKDNurB1w+3W7pZ6m75
	39GXqz5VXHU5wn3gyxuIvKnXEAb1i3QySUc7IEmWS78SiBRrx8TExtIw9OPT2s9z2/wABYTSWib
	3eTJwCQTnOh7z6KAaMC0OZwDnWIIng19p9T4phzU0olZZgJjqssII0csraeoMKk59DrvIPr23AH
	VfH
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a01b133e02mr67398465e9.34.1790847648999;
        Thu, 01 Oct 2026 02:40:48 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 5/9] drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
Date: Thu,  1 Oct 2026 10:40:20 +0100
Message-ID: <20261001094041.135697-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the MIPI DSI controller found on the Renesas RZ/G3L
(R9A08G046) SoC. The D-PHY global timing table of RZ/G3L SoC different
compared to the other SoCs. Introduce a dedicated D-PHY global timing
table rzg3l_mipi_dsi_global_timings and wire it up via a new
rzg3l_mipi_dsi_info hw_info variant for RZ/G3L SoC.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Dropped pwrrdy variable from struct rzg3l_mipi_dsi_info and instead
   using RZ_MIPI_DSI_FEATURE_PWRRDY feature flag.
 * Collected tag.
v2->v3:
 * Moved set duty cycle to DU encoder.
v1->v2:
 * Replaced syscon_field->pwrrdy in struct rzg3l_mipi_dsi_info.
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5263b2b8f1ca..5b257f5adf06 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -226,6 +226,107 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+static const struct rzg2l_mipi_dsi_timings rzg3l_mipi_dsi_global_timings[] = {
+	{
+		.hsfreq_max = 100000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 18,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 22,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 150000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 16,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 94,
+		.tclk_trail = 10,
+		.ths_zero = 16,
+		.ths_trail = 15,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 250000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 13,
+		.tclk_zero = 35,
+		.tclk_pre = 13,
+		.tclk_post = 58,
+		.tclk_trail = 8,
+		.ths_zero = 16,
+		.ths_trail = 10,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 400000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 12,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 58,
+		.tclk_trail = 7,
+		.ths_zero = 16,
+		.ths_trail = 9,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 600000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1000000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 5,
+		.ths_zero = 16,
+		.ths_trail = 6,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+	{
+		.hsfreq_max = 1500000000,
+		.t_init = 79801,
+		.tclk_prepare = 10,
+		.ths_prepare = 11,
+		.tclk_zero = 35,
+		.tclk_pre = 4,
+		.tclk_post = 35,
+		.tclk_trail = 4,
+		.ths_zero = 16,
+		.ths_trail = 5,
+		.ths_exit = 15,
+		.tlpx = 9,
+	},
+};
+
 /**
  * struct rzv2h_mipi_dsi_timings - Timing parameter table structure
  *
@@ -1569,7 +1670,22 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.activation_dly = 1000,
 };
 
+static const struct rzg2l_mipi_dsi_hw_info rzg3l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg3l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg3l_mipi_dsi_global_timings),
+	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CMN_MASTER_EN | DSIDPHYCTRL0_EN_BGR,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.activation_dly = 100,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP | RZ_MIPI_DSI_FEATURE_PWRRDY,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-mipi-dsi", .data = &rzg3l_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0

