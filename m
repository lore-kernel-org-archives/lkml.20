Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834ED501285
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775207; cv=none; b=Xwsn3WmmkDmHM6AetfppGk94Z2gzeVFF2rDddt0BpTLB2QbnHIJsOdP2qpKNKrQTZnL32HCGhWTTIPnsv6DPaQ4LTSPoUTOgtqvcrG7j1LYrinPvc0Ipaz0sd6xnn0NYtuHayL0rBN4NEkA74zjtyya3pwsCf1z91jQwYM34QsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775207; c=relaxed/simple;
	bh=g/NfNryed5nJATsZ/Sc/dWvIbxA6MU6lclvCcljG50c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3VvH23gU0lWhfeCCKXHCPAXFFonzZlbCnpwzUdHaOJPaRcmhpl1fFZykBC4jbrzUTDfYjYJKlAvCCNA6nze8i9GbB5sAQ78376k8S6LQQDsWkBU/MvsrfHgKQqTov2HLxkGU+c6INyp7hGQeA88Ku70Na6cZvjT3/0Nj7jkoXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdvC4O5x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdvC4O5x"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso173193f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775182; x=1791379982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xG0P97LACQjd3EgbiKcVcaE0+HdMc9QDAIUrR6Re04=;
        b=rdvC4O5x5wICJIerGi5cDi2eD8btx7VGreGIV+g9p1ZlIqfslNXkbbpfyujbmWgi16
         O4qKts6YItvLNvrcUJEOOaoCEM2KU7nTrIdsTPPJFkJHeimPDjIm7FcwHINFonSnADMH
         Kvvyvyh05HKCPoTMjhA/3REQ2AZMTnWDk9UR4SM0xgHsGcUkG69rUOrfaa+3sdiOVUC5
         ZmdfcKN2d9s9qWx/1lYpLTzb9lgc8t6Sxom5I9wocm7zjcivtn0AVR4JcER4S+GkMwVp
         o/hADiUTqC3SBur3VN9NEApAwK+7SK5OUpW6YtKG/dfJhkjERp3Hoa64xtK8LSWyspvz
         LN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775182; x=1791379982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xG0P97LACQjd3EgbiKcVcaE0+HdMc9QDAIUrR6Re04=;
        b=ATIV/8IVC/AcIo2AOqBFmuI05L0ppPum3EA7352x08BfJRea3z8HK1WxylkeOVFiJ2
         Ed4JHo1GDTXcsSE9xmOMomOLTHC4onydFDTIV/A5GvV3K3PZSNYgnFLbS5VSIUfGGRxd
         fpmuOB/RZIfYMLzp+vndSxE4DJX6P9qD3nj2r+mQGx/g44w/ONgcj7EqNIEuewIw0Fpk
         PUKZz8po6gNp+olvtSJTeKdfc3Kqi7e7+Wvl9sjY/WhK3s3uTuxdDDQwf9WNdshJ5J9j
         FH08jmaQVoshvlumFiVHItXYum5ghPeLiWMhh+vWZ5S9dVeRLXUiJUY8GZedIcqL5hh+
         spWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+/RsKys7pVdMQI3NlQwm8arRJdUlcKqF2fYp8GzYZHzaCQrEckbl7ZdVWNrfyInE8uklJLCWDZb77r08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcIgdPMEV8SifGYA6SeC4Yp9W0pSdTOQ+ZWXsMkQ0gQz28B5l5
	ZGJlO2TNBUcp1d3i7gqHCNKjGSIclvJgNsfb7if5isI76jJRuPu6fJFo
X-Gm-Gg: AYBFou0clEs8r4D995zb5KVdCi9586ACv8uIrVgVHqSjmoN2OFpZItD1vjMmcTmz2+h
	M07Ndh1UF9a1owaR1n4I1/s4bF72GJj1/T9cDO3ZaL54oSofkIyDgdSWFgZhittD+pkVN1si4Q4
	7IV5olVsLZDigxKnb7Jucf4Da/COnVAd0MS04yu6LLeMvwSH57IbiLX1+5MY7J04zI1w4gvyPge
	VpHZYbPPdftUHrj7rQxozHCaqME0AZloEegFPSyzF4jwyS721AEbYRxxjJu5P+1Wx8GAwHJAtNs
	ulXCdAAu9oHQjPknfsg+xPxS8rIFtICAz6rSKH0DVdElBWF9h6Qsuovj9ZLzbnZ8kQvElMtj1MK
	u1TLZ72VMzKrnoUk0zqGhyeULYN1IA/9kEJipnIv+aFfAIW5BqI+2vvYdlkNFaUs2/oM4losQJ1
	6AmSp2lM8XjMefFqw0+JlCB5onPFFnD266TlFdiOJd4omzh/GwY1WedlnDg4p6yaANuiliz8NNE
	X+x9QSWSy2iXJBL+dYFER4=
X-Received: by 2002:a05:6000:288b:b0:488:7ace:9c5c with SMTP id ffacd0b85a97d-48b0250c66cmr3650138f8f.23.1790775181803;
        Wed, 30 Sep 2026 06:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:01 -0700 (PDT)
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
Subject: [PATCH v4 1/9] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Wed, 30 Sep 2026 14:32:43 +0100
Message-ID: <20260930133257.23210-2-biju.das.jz@bp.renesas.com>
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

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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

