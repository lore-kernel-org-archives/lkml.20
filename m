Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376546AA7C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766551; cv=none; b=hFljmjvNDjY28P1HMqnDN25TNEd2v+AxyMzMn+9ofS5+tFroXX0ax3OrNJXBnFyuP/eVguz6L6iJGzlxz7gJ5VTyFSyHrF1AH/jxfPovgnVT0yq2vBIgNalxXfl4mlW8YWNzuK52uB8OJkyPXxDYSpnqqJAkSAN+7quGl004hq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766551; c=relaxed/simple;
	bh=tSeXZbu+IyDdA55Dzj10eGeaT2xWJZxw+5BeKoS2Hnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnaJvSpceTAraCqzpdKh/judf/XG6apVbrncUDEedoebNcq/oibwYTizUihIdTTnTGp+k7jY+dwNROtI3FOyoXu5y2Ddr9lFxJJCQEaD1C+BEp/iKU/MPfeC9k1QK5iY/vQMeTzg3OxjTJBAh6zUO59rrhuFdHhV8d4h3Tx33d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLdHJvm4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLdHJvm4"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1919677a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766539; x=1788371339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGCUJbrGi7S4/RW/jQIrHeNXdMRfy5zYhPa2LNyhWxc=;
        b=pLdHJvm4TgOet4R8UaJVPvCRy+ivuN/pINxKmDKOfTqtMqjB4MU38YgwSFjwA7tEQB
         kpnQTS9pCHk7cUDtKNB6O6fvfLKyJwxRmw9XdnkJJpy+zNefOKU5aqRouwjptFUkMiQp
         DDHtDu1df9G7HSRk3M5F0d8D5CGTmG3+ElAP7vdpCXVzFcSkfuE1OJujjYon3fINtF0a
         tRnvZw5xAyMqS4JlAC/GmgMD0NcyE+GeCniXkgE0TK9zWur15PDMPdHedSwsel3ttclm
         /E9onjE6qyEcnt0xd/EYfoTAARlVxhLHbdhecVv5lJZ9F/SdfaBkmI+nvPShX/HFpbQ+
         IThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766539; x=1788371339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGCUJbrGi7S4/RW/jQIrHeNXdMRfy5zYhPa2LNyhWxc=;
        b=Lj8RQyG3x9PVdnrlMR3SSUfBaqF+TpoGapnm6V5II5wAalIagWgiXCg0zKqpwOG8Hx
         XZTne/+242WPUX45s+eGZnGGFsjxgZe/9O/HwScAr4wjJRT41uLumUGylM4GA6fiPhAg
         C3F2vIeuYIXwhLpNHaeRDkoP9k9ZDEMCaD7EgtJnf0aCdset2D4K3PIkenSTK8TQA0jS
         OShdOLHXtCIIOVL7yNQc5XxcfAlXmIS9ZZoUqw/CVlzPQpZT+NLqIEhNie6xlDzZNbf1
         hC0E85IZ02+pU0FKuQgwx3FuBvW0cUbCcksFJ4PyTXKPeqQyT/ERXmcnWPvo+KhyP4jl
         vLQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rotf3EtNE52mlyPw0pKfeHAVyIyF06pzp1Anj9J7jRsRWPC2e/uh7r91bizf01xfuFfPfZgccuvfuu6wJM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfYhXL/zLhPdi9mt1VDap7NOozSWLhbIfXhiaB44yvpzydhfXY
	7YKgV40WdZAB0XMF5rNYuovKT/hh8lOPiQsjrW7VCp9P3FLiT4UwYxaN
X-Gm-Gg: AR+sD11IGuM3uf1FAlN+FuPABNe8unb+T6G8Yd9YXNDBj11SdeTS4P01joXb0Pty0oE
	pJdSP5zBNXf7Ba+WWxkRWGz/HqkEbXg6L/ateNES1aXlRIaJRWi60i7tYVCTya/2BbwWT6tXZEb
	39SNKAyoiPuKn5ZZ8ySt9zadJB/BnGXnnAoxuG4yNY2oi3TVPvSSOODXHFy5xe6dOGwTUvGOu4i
	g4aJINS/bhTBrZ35oUmzq1xPu80p+cc9tBNoaJm91tbFE1w3cwS8+txibfLDirj+ZW55MDY3mfs
	DCvXLl74+2kxhKnqcy+OD0dYy/rCq8Nt1SAlGvZyF3CVxJUInfaymKAw7f/SXSvxyN5NL7tMBb8
	FdGSnfY6Ry/dYYmhV6z0tr17ixUBMhYguyvTGHZGhnH3Xf73ymuvYKid1/nP3iThgVYU2MRL46H
	EMkvwvO4fTYFbfCLWm9/BQYJsSEp7g+BJrXqDuyAGTqXN/xs91THHnCDkSxQNJ3/10a02MaiirW
	HmDJp4q3oV2Vw==
X-Received: by 2002:a17:907:8b91:b0:c25:3001:4699 with SMTP id a640c23a62f3a-c2530014f82mr425766266b.12.1787766538844;
        Wed, 26 Aug 2026 10:48:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:48:58 -0700 (PDT)
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
Subject: [PATCH v3 01/13] drm: renesas: rzg2l_mipi_dsi: Add dphyctrl0_init_val to hw_info
Date: Wed, 26 Aug 2026 18:48:35 +0100
Message-ID: <20260826174854.199139-2-biju.das.jz@bp.renesas.com>
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

Move the DSIDPHYCTRL0 initialization value into the hw_info structure as
dphyctrl0_init_val, allowing SoC-specific D-PHY control register
initialization to be defined per compatible. This prepares the driver for
supporting SoCs that require a different initial DSIDPHYCTRL0 value.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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

