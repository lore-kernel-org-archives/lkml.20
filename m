Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D254FDE7B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775202; cv=none; b=KxgbNWseSuFw2+vlXl/WbvSeaCYQasL53ESyh2+rtZudM2SD08DoTNqP2DtMxNr0e05x26VBDvigbBnBKf+4tDnGKnSIwTEJeEq0yyWkaAspC3NrXMtrcyJeQQddN4aYWwhRAO7WcHGmNBiokNF5m4n+xO0diytujQuMCy4n/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775202; c=relaxed/simple;
	bh=XpjDxAeCeXsnOIhL04x/xcfuRzts/TqLFHDPnkmVzBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9QcY7N6uGVKjjWP1xHOdIk56knYNcotoC8C7yiV1QcW+RZJZncdd9KAZZuD0AOBds3eY6M4ifsarvcp62v0qOTV5PznhZEcvmF5panQn2D0azrIYGsDfdGQqvNLwcFS3MWqANUiXWOb8YADkVBqB55AmDf9Q6XVVaU4n+Na8io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHxNV94A; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHxNV94A"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso461635f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775187; x=1791379987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5kSzTFtU8H0oThccK4Asw1nQQnIMXeScYzPiW6YHxE=;
        b=oHxNV94AauogJyH+xxiqCICvJt+RFqkEoBqRTm8j1qDjMqIwopzBVuoZkD5G9W8crD
         iwJrPCEpnuLOtUENdFnJLnNuRs8SAIj7cZhsRlF9eViQXpefSn7AQ4YP0vgJpErHBm9p
         hQy5hk5MrgFrZK2F0xgkagd9xFW4x2ehGit0hyPA2+acjJNuh2PhSz+px6IMlDjR+KpG
         PkT07fX6sLyhsX0L4PYMPXNiIVxAojWmWVUef6POZK/m52OA1sAe0B9e5ont2HqpasRI
         XzyYkAPZ//JY9gAadfDRlFf4/r78yBITlHOw8m4+dBWCCW+q0qzjZganL2loHpbnYfEm
         Nabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775187; x=1791379987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5kSzTFtU8H0oThccK4Asw1nQQnIMXeScYzPiW6YHxE=;
        b=QHIwCQSkVaJjF/Vcekq6BAJhWS9mexG+CKyh44zzKfrWnYz+IroTolZkRkn+qtKOca
         ALmoElxjKgfrguPvHNHnB3A0p4Pk01o9ylkOpDvPBOb8+QL56ydJPDsgWhybAA6vyhA0
         Vi7F4led7g+XShrn51AMAofe/BQRMiF8Ojo1jQPRkasbwZE0oqvFcqTrAyH3cTF5v+xr
         LdrMFHr1AMENpvZwzNrZgZWg8+p45qhBMIbH70OB3uDTl/oBIUNdqf0vpJ4Odusuwkfs
         b7pJgimhpz44C2inzdE+Y+B6Nh8V0VvrkkTL6XNV+3xJULs2s46UKANErxHmNVDQlZ/S
         jbZw==
X-Forwarded-Encrypted: i=1; AKwUvBzJMHsR5L46sp06TdU/4eP2JPWBmrsR3i8Ivc1RiZXHUL3vECrn/fWlblmQmrCmO4K02x52tlr3tHv+v7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyqdakiuTQlDgOe+VM+o7leBogY+CE3gPtQP5MugdP3MEgbNV2
	f6Ipvp9IVZScHtRN19D6WCDhhdJYbM5zvZdqzBUd5eoDLaCSvACqRemF
X-Gm-Gg: AYBFou3AKctz3nAgYlZNeNNrJtyA9vwyhu+Ugn2q/3wcI+pJIJAIkwzGKMV4pQ6R1zt
	nGq/VL7lmCWJBEd+PyYGoXVB7Kjz3CQEaQL8Gnb/g2SDCabrBLvPFxBmdV84aN7nRUHIQ3lLPat
	KY2oQPMNqFGVz7bVlUA7wSP5EQhC/+Q7fBBp+6qevLOU6I1iSYy8ed3Oh7Cy0e9uRYtAoy4DFsf
	xz1VuvlmFli6iCEqEeWA5LPeF9HCyqKNmto/SebjE1ckoILZoARglNNMcE8A5Q5shIFFLuTCGWE
	ZVrjve3gT8gvn7uHwAJOcN6EcBplaewsJ/cnsF2n+zvI4/f8jPM7PG59khFHZilhXwhcxVYcixX
	GIvGzkc1StsKDfJDIXZnVbyBCmCV0C4EnF1ojcaP7rFIzNzWv3PnppROA173jPwb3bpRMJb4sAC
	1CUom+y5Xn03+9bNKecRC9LN9YQ9U9EzGKZIY2P7+rcJQ+qB8dBE248lcHbValE7ENhKS+sFvzv
	+N8iEGdMywhKNQ8K18N2+Y=
X-Received: by 2002:a05:6000:4814:b0:48a:eeef:b4a7 with SMTP id ffacd0b85a97d-48b02541665mr2708487f8f.48.1790775186962;
        Wed, 30 Sep 2026 06:33:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:05 -0700 (PDT)
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
Subject: [PATCH v4 3/9] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Wed, 30 Sep 2026 14:32:45 +0100
Message-ID: <20260930133257.23210-4-biju.das.jz@bp.renesas.com>
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

Move rzg2l_mipi_dsi_global_timings and its array size out of the hardcoded
ARRAY_SIZE reference in rzg2l_mipi_dsi_dphy_init() and into the struct
rzg2l_mipi_dsi_hw_info. This allows future hardware variants to supply
their own timing tables rather than sharing a single global array, making
the driver more extensible without code duplication.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected tag.
v2->v3:
 * Dropped .dsi_global_timings from rzv2h_mipi_dsi_info as it uses
   different path.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 1538eeece2b5..d67e1230b70c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -54,6 +54,8 @@ struct rzg2l_mipi_dsi_hw_info {
 		const u8 *table;
 		const u8 table_size;
 	} cpg_plldsi;
+	const struct rzg2l_mipi_dsi_timings *dsi_global_timings;
+	unsigned int num_dsi_global_timings;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	u32 dphyctrl0_init_val;
@@ -488,8 +490,8 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim3;
 
 	/* All DSI global operation timings are set with recommended setting */
-	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
-		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
+	for (i = 0; i < dsi->info->num_dsi_global_timings; ++i) {
+		dphy_timings = &dsi->info->dsi_global_timings[i];
 		if (hsfreq <= dphy_timings->hsfreq_max)
 			break;
 	}
@@ -1530,6 +1532,8 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
 	.dphy_conf_clks = rzg2l_dphy_conf_clks,
+	.dsi_global_timings = rzg2l_mipi_dsi_global_timings,
+	.num_dsi_global_timings = ARRAY_SIZE(rzg2l_mipi_dsi_global_timings),
 	.link_reg_offset = 0x10000,
 	.dphyctrl0_init_val = DSIDPHYCTRL0_CAL_EN_HSRX_OFS | DSIDPHYCTRL0_CMN_MASTER_EN |
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
-- 
2.43.0

