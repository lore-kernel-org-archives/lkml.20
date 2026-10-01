Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3A406261
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847649; cv=none; b=KodLrV+lTHOLsEGtebCq68VxGO4G/Ztci17WOLfojFEmF2/wzLUQpJeheKAnR/bQ0EXrHix9L2J64xlHfrM/LQmAqTq4a/6B/xW7FuQCSQUpQakcamP7StNbw0YfKyUGgMiVbslO/ZqMaHt2G3JVr78KyHkipMEQyXQUkjoid7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847649; c=relaxed/simple;
	bh=52Vf/IMSgaYjWyu12Z0cx0Cg3cWujAOm5dnVKDb3bgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cprPJ/MyXg9iM+Eht7likb3qf/n1zZpxG2ej/gea5JdAt/Xb8gv6bHnNPHOVILMVy1Thj2UScpnbMsYmMluFFxFPM3kDL/duK4fpk7a3KsoQ0iIJuqxgwfJURLCbxJF+FcKT0jCs0TAOLty8Rqth7vTyM5UjUg0ClzE8cjS1iA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYT8GHdh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYT8GHdh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so47954555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847646; x=1791452446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE8Y/GOA42pEAQBZUN716lEqGW7syf1sO2zhDpHNTp0=;
        b=HYT8GHdh4UShBqNncJSRRLBgFMhgoK7T0LNlCNOxIL0MwfiVIqwk3cayBbhdFWXFC2
         WskTwhn9oMjB++SHGKcub/tZggOJ5JtF53HoHG507A9KpDeG8n8l6UvCOKJS8YuGthFD
         Z6hVaYLeERrycUr4Yc/mKZodjKpTetE2v7nfs5lYIpdFtWI8q5vephZ4FGuDfgVXY9Xb
         it5egzuxbShHOZickd5EQGOU7JY63Q4GbqpBaBVMH2LL5zjrp1zN4sozLDtWLSF/efu1
         Z4xbkWLdEkXtTDdafWvdbtB5nSS5KzLCq6gejnJviF36t7J57RWTejjwZJycpdFGaHdV
         jlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847646; x=1791452446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uE8Y/GOA42pEAQBZUN716lEqGW7syf1sO2zhDpHNTp0=;
        b=2373hztWoyJhpddpobu+txgKy0FekDComL+ZLBKqfbjcu/pHx86jv83g7LXu/2BxVS
         wKrVpJjhXpyQoBn40UZbd6tyg5bfbKeqRxMjDX99/EKaoFRwrte2qANkPljMgKGchLEE
         87BcFQ/z5ImwXST2E1QUD8bUsqJHm/x/i3fNDt5LjUJpJXadg2hk0jYzTCDpyDbg2buS
         uwTV1g0OFNVK+BpixV0XegFO+jkvQMin0DEZcfwOCVDDodrZcx+yLJZ/vhljgXCbSlzF
         +0rwBSs758afpIMsFcbkdJgRLAyKVQNfyIWG5ZEdrKUhUcvSusrr+YL3Uqo7eNPgQpmj
         JKLQ==
X-Forwarded-Encrypted: i=1; AKwUvByecnZ4QqKuqCIyb13vPnTLRETRGaP/V03W5YVZtrLmF7gDzNjLptIaSfLz9dXVwZRBQOZQ+q6RfMrPYF4=@vger.kernel.org
X-Gm-Message-State: AFuF++mmzU/0weLNN+SBuNIM6qI7Y+zVtKLLTYXYsWl7rvU94/YN4zrO
	Z3P/iqWM6Z/9uWvH+59HLLgvqKK2pVv8VLlBI4T1Y8juTf5sTgtl6siv
X-Gm-Gg: AYBFou2Tdv5feMjKY7JjQBF1GlZFKk3mHuqcKmC4ii6geSNW57+ir90k3E8isora1iU
	B5IALSu6FGn/Fw4LkoRKHwLMP8W7PFTCNxv+zV8nOzSh02DsoRagUzfbVqE5VXbcxGw/qTtuPaI
	L7tvvPgT7jkQw2CFU1/hqMgVV0pJ2ba8f0oi9UhcxBomDJ17gNEPps3I7efl7uR/Mu5+n8TfbO2
	cDdmQtDjPLsAkFas4J17CJ3WYCkL1AfWDG51PcgTCI242vpuWs9/cMMFW0uzaD0aWEsd26RTFgR
	D0NT6XfTZ9OJm+3FuM87LG78v15p2Vb9/8VMW/eEuziwhQYPasNydECCevLQ9X68yTTqq8Txwyi
	ZlR0pp0ZjdhUjFc3z8WjgtxJE+UW1kPg4y/VmHhuIvyIiMZEcGEN3V/7T59Tz9v8JaA9sL4dBzR
	ZNSQ7XoZjq7avJ8oNuqvrFiZfEHVmzdHwJgXRMZPj2kU88RQwov+6Xtz6dPGqfmXynXTF+krAFZ
	niK
X-Received: by 2002:a05:600c:1c19:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-4a01adb2cb6mr88790415e9.2.1790847645616;
        Thu, 01 Oct 2026 02:40:45 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 1/9] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Thu,  1 Oct 2026 10:40:16 +0100
Message-ID: <20261001094041.135697-2-biju.das.jz@bp.renesas.com>
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

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 0590ade96b91..2128fd16ebc9 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -56,6 +56,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	} cpg_plldsi;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
+	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
 	u8 features;
@@ -493,9 +494,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	}
 
 	/* Initializing DPHY before accessing LINK */
-	dphyctrl0 = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
-		    DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR;
-
+	dphyctrl0 = dsi->info->dphyctrl0_init_val;
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
 	usleep_range(20, 30);
 
@@ -1531,6 +1530,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
+	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
+			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
 };
-- 
2.43.0

