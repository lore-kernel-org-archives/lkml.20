Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39D4BD348
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847650; cv=none; b=HB4/Brp6Rfal3krLFCThSUwBwaiLMiWGcrpWER01/4M9ivxp5mJeZka6prhDZElpgBq0BNcvajjceAKp68l6iBsQ4cxjVOcWYrWDUkDTLP8ms7hCYoZ7Ivs/h68wlz4AX2Xkrn5ZRRwyJSTi8bFZLuY0iFS36gChz/EitdEg3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847650; c=relaxed/simple;
	bh=HzJ0XdBe4e+3eV5s/AAOK7HQGzgLyDAyz0pIZk2tifU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to+58B62jPVRycP7R7xFLGFSnyc5EHphJhCqMBy909DRWoiD1Ivh5XmP0gY0p4wRcBKKX9b24ORP/pLVZwPkjDCr2w+NHhg4lYvSzerzzNAcgYOMgzLeFHvoEdYtOcZ+y1Wkw+iVfy6nEwfdtzOcy3xmRNYgbTwFE7fg+Yt+Xgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKbFLiyR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKbFLiyR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so37266215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847647; x=1791452447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2InO87pmSFWFpzCtL0kBSIEBqZO5yulpRnkLLV7Amw=;
        b=mKbFLiyRsUTzjq098xriHo/xYaEhGbLO+4sxsc6e1cYkD56sUzw4Q8g5uRJD6aVywf
         PjUtVIzWxLoYKpv8i3yr43qr4yItE26JJlfTM5qgy5SF4/Ij3T3y0dAYd8twgRUrRXwa
         xKHwYjyEWESp6sWa8EKP5wlJ8N4WmdSCsMkoaLxR+6dmInGZ3MJ+O8ksKiHEtIlrfYo1
         MVVvAKLhF3RTkUSedk/QlTer4ZNqG9HuesChUzcK/XPBS+Z3PinkH8/hM/Zc8By0msx5
         8+gYS8wekUh1B6KDYTrxPVGVsQUXtlY9/JOQbdOsp8Xz0DXu53oDppZK1SI2atTv5enM
         Qm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847647; x=1791452447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2InO87pmSFWFpzCtL0kBSIEBqZO5yulpRnkLLV7Amw=;
        b=asUwJGhbX8uArwShoGzh5wFpq8XbCckdBAi1lXiDVszc1Wy/Au+CIJ00Mw3W6Mrj7U
         sPEGYBnrd7O6tLH80GvhvCIJLtRwJrVV6G/65K0XTkb2zfblwr33OzH8oz2oZAUy6SEX
         UAFAOmNO/BqlyQogsTo5QbrWREa1GxBOYQmFlT5efSaI1h7Zm9KhtpepSmm6PI7ECMjo
         zxkgERryvIVs+veCUud/duPEK3klSM4YkUdRpAxGdPGMSUcOcfMy03MyhEpKvzEk2ayo
         EAELAK3Vv0UW3PYJh4ME0iLcFLKv8SGvEd6uNCOzl0dx6QA4Jch/9/+inXMGesYgI9X3
         voiw==
X-Forwarded-Encrypted: i=1; AKwUvBylUOFGbevnNrqF1ilIC5urJaCX+NMbYBLMTLQhF3fYyubSdbHvKAtPlzdozxRto6ddXT3h5ZiAfncypus=@vger.kernel.org
X-Gm-Message-State: AFuF++lKCBcimARfaT6a0Deg/WJO2+5eehzchUvOFzHTHr9N10u5UqZl
	/wqhJNZGqQ36CYLY0vsj0pqVm0CzYmco0pL6XegFlRBUw/E6vsXm/deu
X-Gm-Gg: AYBFou0iyoi5rSHZF50iRJBcIA5g+OBJsouKMPYxZBZHzMW5uxFVLahZhDbyjHCfCFn
	IFXTdR2DKuhHj0XWKzQHW/P9xKXQHL6N8Dplo21612bg7N29DmvVNv+MsqyPZyJ0DV1yNEosTuO
	UH+QIRB83Qb91DqcnjW2vj/YCdIir46GbYpKhHfRO70dipLPQrC48Dqie1Klau7sAeUz6gfHVBy
	B+iD4sh7jVeRiS5gJTzHDXuGLxmwQfDKucSFSXMVAanp/VYjarkJAYo49g0GhG/FD3ik6+W9rwj
	YqsimkxWgUeUtSFNBNruaccTrM5EysBbG3nwu6DzGohkAaiMLNn4IgXzhXWGcbAxKZFMN2Y3ncX
	DNjwQDHeGaNyCO+QcIea6zi/unJtftpZ4rJOn10VQ2pBtyk2jrkFz9Zoynmo296O2GLVW/Xcr8w
	DvDwa66UA/6tsuU+H1j3RZHJTyXQW2i6LMhcSdllzXwK7ZKmNgoAfQpLKsYx7M3ylzccB9Grzi5
	+KS
X-Received: by 2002:a05:600c:c490:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-4a01b12d914mr68051805e9.34.1790847646421;
        Thu, 01 Oct 2026 02:40:46 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:46 -0700 (PDT)
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
Subject: [PATCH v5 2/9] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Thu,  1 Oct 2026 10:40:17 +0100
Message-ID: <20261001094041.135697-3-biju.das.jz@bp.renesas.com>
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

Move the post-reset activation delay into the hw_info structure as
activation_dly, allowing SoC-specific values to be defined per
compatible. This prepares the driver for supporting SoCs that require a
different delay after reset deassertion.

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
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2128fd16ebc9..1538eeece2b5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -59,6 +59,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u16 activation_dly;
 	u8 features;
 };
 
@@ -806,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 		if (ret < 0)
 			goto err_phy;
 
-		fsleep(1000);
+		fsleep(dsi->info->activation_dly);
 	}
 
 	return 0;
@@ -1534,6 +1535,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.activation_dly = 1000,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0

