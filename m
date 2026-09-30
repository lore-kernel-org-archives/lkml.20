Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338014FDA78
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775206; cv=none; b=brzVFPB0oKSRZVwcuqEI6fVbMu3dVs8NAX213aRHJ8wykPC64avdG45a4JmmVYZPcn9zQohHvepwbu06B2wIGZdceR5ImObbkeIMLkczv9AN17v6wg7rm3xGGrxsEEOOcM5cfWm+CJZI+G2THVR3WKMNoo7zLpdvcbpE88t/gDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775206; c=relaxed/simple;
	bh=NxSxXG45ksSan0+7vO92C7mzSh/lgrEJUoBt/iABemg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFnMGCuUDsnfvsLbxClXk3Oj26dgATFtO2hHHrHzwvDzlQuSYsbOly9rJGDE9q3bD9HLqHJA05WhkFdH0i8eOQl5wex+Lmg2Diq7x//X/DiVcK7DkxSw0zfBcr7AhfhBHJW2Qsgm1g9BFHCsXdO1g67crhD3Cn362fERG4OU9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5ntEHZx; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5ntEHZx"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe3b2383so686129f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775190; x=1791379990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPsWMT9i9nylSWouOSwMbPtdRCHe/UuhEVMIeLy6TSQ=;
        b=R5ntEHZx0CGSHlW8xh2lIXs6CSX6mgKu8/W+mOZcAgofL4fVLTHkbO8aCGuzUEYXOS
         9gQGFlXWqxcc161vB7bJogqrkR0Rbp4tXfARkzc9bjNQdJQ4xvrPaIrGm+kNzl5Pdxpf
         OXomsMomuHguuAntUji3WGs6wBNsIx/64reFy0MQE1ITwTFSsuBEPkyi+ywRVJ+QPEIl
         rf7iTaFR8c5CWY5dgnOC0SUiVH0kP3VOmAOuGkPhzPRbBi7kdIhERoXjsEqHOjuEmDPY
         AxpBTAfDPX8ix26iXXYNS2vU1AC2JUGRGIygCID+JQ0VBTtseuLDAZmpQr4CREci5h0/
         iTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775190; x=1791379990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPsWMT9i9nylSWouOSwMbPtdRCHe/UuhEVMIeLy6TSQ=;
        b=nxVeQfVIp70wGAHI0DQWLnBrimnF7Z0DxdJDY4dJzbMWRhQlyrx5cSXgj0RzYfxRul
         HFmqhjI1s2WpWArX5ClyXyddyvZ/3GFmOS4DpHeworejdezRDVkbgVzh70eOgDOfUWls
         M7+thV5PW2hUbIxxqMzo7YIxG7L2Nxup2ezASk1cwiXBOwXxlSOU9b0cUxBFUu0RIH/b
         st99aLZIuFoLT5BABuZrKi2KV2eWKGPjnSSTNJ2I77QOmDUqBxeAyeEK7XR0N320cGuY
         fKQrBm/32T2/5gLZwv3on8JjihZbYy61gNs3a8RJ73AntkYiGhdz4BYDJOBM8HKPPFvP
         V9GA==
X-Forwarded-Encrypted: i=1; AKwUvBymM+rISjtT6daugcuPtNikQtPyGnBYlk3c86lTrNSkcWZVOLejgKhDxjkvonmYKr4v6VZJ2kufxgnJpcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuPb2hhvGI7/W3i0xjyOKn9L5MlWFO51g5YjW5hZWwGBlt+si6
	kiVz02oj0ovf5E9MXa5synJ1lbIgygPYOqhp5sJv0ouTqJxIj9jOoCvg
X-Gm-Gg: AYBFou0tCtLyYPWoTTk0OHpibhLUxu705CVie+l9IJDvoH0IeQqb21RaxlXDgISHRlK
	DZDYz8cODu13PD9yFdgIcSyR4MaJUfvYzyXUDljbjYjy9GpZ/pR2DdSeQeweTkTwa9xytbbh3s6
	VSotJRKSnRN5T2UPCdJLnqrw9oT0eg2aOvzx9/4kEIc05Sw7Iv2z3sIFfMFIB+L40ry9bvsILLE
	3JRcPk+msAWLzGL2T8wfXOnJyH6XHjSlk5vNjNV1nh3fkzTuy994uBaN1JUpPPVsH1eoBPkTmS/
	yTaqPIQTnpQz+notGEOqyZJqxY4bLOmzq8n4WkknP8b4icajcrFFAoSDFgTqKekH7SSfiqS63sb
	5IUpBxRUf9BnISGvRlsMT0kfEZ/jbGnakppQwRT4aDel3dgkUC6oYHtas8F2tWOH4rh6M4xAa3Z
	wvwWZmriI/y9S7Ho9P84bWVFcb9yb5rxQZGR/sIn5jV198njmTfODYaNzleznI/uSD4ZzbVTmom
	U46rEcXjJ3ELX1Pm5PmkdQ=
X-Received: by 2002:a5d:5d82:0:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48b025352acmr3183416f8f.44.1790775189985;
        Wed, 30 Sep 2026 06:33:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:08 -0700 (PDT)
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
Subject: [PATCH v4 5/9] drm: renesas: rzg2l_mipi_dsi: Add RZ/G3L MIPI DSI support
Date: Wed, 30 Sep 2026 14:32:47 +0100
Message-ID: <20260930133257.23210-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
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

