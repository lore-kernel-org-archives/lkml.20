Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825E8391E54;
	Wed,  7 Oct 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404355; cv=none; b=CsKWwpYeLOgkS5g9npMuEcSB0nIith4S7iL0KkF9YIyQ4vUotsVrsOfkxUw97iYXTmPlSA4V9a+gB23nUkzAFwvHplEhoLVR68qjzQxuUm1H3eOZD5S4Am6O2kExAXaR/9Oxz7FDcwTjBc+ZG0FQtNDtUYnwUZ1AgBabT47pYrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404355; c=relaxed/simple;
	bh=jHfWyy798a10mIUrzLTN0HSl3lMo4kO08szuc1ti3A8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UKgLre5si5p0BaAoUwksGw87IyX72fBDxObqk1+Bcp5QuKHXX4Ae8FeQKDwAOMTy0uP2UqmgUR10eowDPgQduMBj+GstOETFMXNlXhSD8oLQ1J2qjm5m+N6O5GC3yRU9rnt9qyvqOXrtHRsERpSpURMm/OnL1Bdhe17U8WvAh+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=oB3X4ZxO; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="oB3X4ZxO"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 668853D818A1;
	Wed,  7 Oct 2026 16:19:05 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id IsdM2LWTrSqw; Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7566F3D81881;
	Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7566F3D81881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791404343; bh=BoOgYaovbpMzuiEdkehFnyzqLLdRfrXfgzNSqabwWhI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=oB3X4ZxOHJZHWhx2U9D4WYBWWpCHwCsgnbLhVGREMu9Bi73GHy/SKce3E60lFvqpZ
	 rnN2MXKxZCLRMZ2lBSx/42Mn42zII6jgN7eUiGfJK3cUoPMoz7GYVmobTlth9KGEA3
	 48KYIUWIHgpk23GWTR9yKYVZPu0btUrLiqx0chCff7/dpfA/yHl2A5flXW2pqcnliV
	 UOtGWNiWz+jlGmf61JPfMAi/YHA9NLV6v4zN/quD4Y6GNwnhvCPtTsIiE5sFkIbOKR
	 HatVomDmvFbTM57nsnkhDmkr9vh+263FP0uAgiOEa6k9Z3GnvaX4uEY+TdSDZdvfWN
	 lnByrUz1vvfIg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JTzvyrS_kRMm; Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 15C4F3D8187E;
	Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>,
	Purism Kernel Team <kernel@puri.sm>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 2/4] drm/panel: st7703: move init commands to prepare()
Date: Wed,  7 Oct 2026 16:18:57 -0400
Message-Id: <20261007201859.3709656-3-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The panel init sequence is currently sent from enable(), i.e. after
the DSI host has started the video stream. Not all DSI hosts accept
command packets in that state, so the init sequence may never reach
the panel.

Move the init sequence to prepare(), right after the panel reset, to
ensure it is sent before the host enables the video stream.

Since the init sequence can now fail in prepare(), power the panel
back down on error: the panel core does not call unprepare() when
prepare() fails, leaving the power supplies enabled.

Both patterns are already used by other DSI panel drivers.

Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
index 368c57591817..f4635a7327de 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -774,8 +774,6 @@ static int st7703_enable(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx =3D {.dsi =3D dsi};
=20
-	ctx->desc->init_sequence(&dsi_ctx);
-
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
=20
 	/* It takes the controller 120 msec to wake up after sleep. */
@@ -784,7 +782,7 @@ static int st7703_enable(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
=20
 	if (!dsi_ctx.accum_err)
-		dev_dbg(ctx->dev, "Panel init sequence done\n");
+		dev_dbg(ctx->dev, "Panel enable done\n");
=20
 	return dsi_ctx.accum_err;
 }
@@ -819,6 +817,8 @@ static int st7703_unprepare(struct drm_panel *panel)
 static int st7703_prepare(struct drm_panel *panel)
 {
 	struct st7703 *ctx =3D panel_to_st7703(panel);
+	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx =3D {.dsi =3D dsi};
 	int ret;
=20
 	dev_dbg(ctx->dev, "Resetting the panel\n");
@@ -843,6 +843,18 @@ static int st7703_prepare(struct drm_panel *panel)
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 	usleep_range(15000, 20000);
=20
+	ctx->desc->init_sequence(&dsi_ctx);
+
+	if (dsi_ctx.accum_err) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_disable(ctx->iovcc);
+		regulator_disable(ctx->vcc);
+
+		return dsi_ctx.accum_err;
+	}
+
+	dev_dbg(ctx->dev, "Panel init sequence done\n");
+
 	return 0;
 }
=20
--=20
2.34.1

