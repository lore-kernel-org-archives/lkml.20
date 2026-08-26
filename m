Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC1647042F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766558; cv=none; b=B9slVkA1CLdbOrJCNy+qtHzxXlqJwy+AFMdpajosQJs9LaFytBGNLynIoOpDt8N1qnynWf1+/oeEnelHaxDEeZJk68X/Jer2zijEB0ZGxImWk+LEajwsuQ1bzKmiFftDTBBKkjOcYNZ44oEwcKUtQhTS6GjpFDE0EqLA720V+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766558; c=relaxed/simple;
	bh=uhz+aETG8muM+OaL+7Y3gQD7N+nO0gC4WFUbQR4TZ2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwLAUNFVsFAJ3zu9Tqe98BJslZj2NeY2SDl9m6bV0VK/PFE9IQsS9WsROVPC9+QPcdxwSqvAdocZRfSb+8EkPAx7J0Fkb56zgR001UADGtI/Auey2YkOR7SkmcZSngtU87/HyEKYw+gXiWnBfLekAuaEVbwUx1SuY6sSik6aZXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWCw/Urp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWCw/Urp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c253425b253so43366366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766541; x=1788371341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdCoo9ded4E53Moqvr4ZcBU+4FPafYbozkQJvalYbuE=;
        b=rWCw/Urpiv6WhZtlffK0Wdz4TjXQz9E7iDsnkZyFtFmCpfwULR4tEEveE1FVWYY3eo
         AQfQ2BMnLFiZkhagbftVSDojZAh9ovCA29B7SZoUMhWTOAfv29GWO619QBVx8Kl/usGa
         /NlukMD7LTWpHJFlMP4a3qPLoCGAUOZiEh2h95jwO85f/++CV+z+Q3Kgwfr/vsPuYDme
         I7Kn3FE4Ai67BVVXeWas0JZ3JO8ePR2Et8YI1vMrz94Xs0xfIouxXDfrrDpbT4+rJVe8
         bZ/eq1UDW/jUHowHeQTKlfd9vD2GtbsaWpCIWRgESp6yDOP3QmKBwich1l4QneIwXPYn
         nOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766541; x=1788371341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdCoo9ded4E53Moqvr4ZcBU+4FPafYbozkQJvalYbuE=;
        b=T2SzYUiAJNeLBdVRu8lKkTFTAmP17QJLiOtjc8a2L+IOY0dehFGc9UBfdczii9xROB
         cGkzJxj+7SByynHncrXJlWl0fZihb4XAu8c011ZBLa0KI/OoD5qN4sIue0zPtbNDF8uF
         TJBbaDk2LKo/BCiOnB26bRf5t9aMd7Vmk0qST1s2TIRlZoMfcGV9zeVFALPs2d0evA+p
         eC4N6cIjGQYJlXiPM24bjXIT6UgeRpXWNniVtrnEOYLuz9Hly2n7F043KdRC8oaEorV8
         /jp8vA3t9vOthG7snTvzxmEhTQVSjD9Bo3SID8rhGQFDGaTzx4MlsIztvVdxdEilMCDx
         UrEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQrlblFjK76aSNAHPEfJszADwZF/I1eLzAnRNrq85YYR6rVnDbD71nKsDI5gUhO8fkqfCZx4WH6jTY7J0=@vger.kernel.org
X-Gm-Message-State: AFuF++n/MCd200aw7moSCXWCYDqqzMGRRzJ6UczU4JOK9HNKgZ+ar2ew
	83UCQo7s+9C0jmavnbuPZ+9CrHmxoZW/ttLaQ8IrJwKzfFwLwcxqrncw
X-Gm-Gg: AR+sD11ZKiQwcS8Dlne1pNGzTYWCUEhzJf+0Y0GSS7yMSlD2cVSE7ezH9qfj+jgcAo1
	NaufPoquSyIT7pCAJHeYyHukpOP1BARkB9tOXfHaq7bWYay4mdqXtAofPLhzwvSbL37+GvmxW0V
	wgcGUrTDthHMCENiCeWpBXIAKRNhhOMWwcd4gr+sGAdYt8K1CXiM7qvYC4H0qmbOyCz1M+sRXHT
	kmGTOQkO8mZL/O5SVWx7B7ldYWvvF8sAUWAN8gzNX8j7nbUszBcoPKVcMwSESxnKwAfabB2obTM
	WwNE6yKU+FiImt/bvJ+PbExOFtE11Tf2PjPKQe5Ewj6FPXGV8L5r6CWFSPh+o84NyWs2ramT78O
	DZfAlF4BJJsJrXbteuMmNalyM8RujcGbDG/j1a2nwB743W0cklwdRJMOs5hlHAcpFUTckKWSpRM
	Sy6ofg+nfMND+ykIJ+t2iRaDNBE1DFCwNpcC0s8+4lRaDHDcdVyeu1FSs0jLd2ivNeSqs4DnxXa
	VQ89lbD3UitoA==
X-Received: by 2002:a17:907:9616:b0:c24:457b:86fc with SMTP id a640c23a62f3a-c250c329bf3mr831430866b.21.1787766540789;
        Wed, 26 Aug 2026 10:49:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:00 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 03/13] drm: renesas: rzg2l_mipi_dsi: Move global timings into hardware info struct
Date: Wed, 26 Aug 2026 18:48:37 +0100
Message-ID: <20260826174854.199139-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

