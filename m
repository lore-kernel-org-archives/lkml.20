Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777905;
	b=02UtFtIxsrtfWbk73tzDpHiAMCdYEMQVz6L0Ldkl6H9U+FX5ZvPdSo4CDGWEKHcIB8DU
	 EZRIz7b07ayuLaXw9bv1ccsM3Hbpszs3U+IE1Z2RPMhpipEw+HVn2dP7P/tkwaVWX/f0t
	 Rzk6R4o5eJoYsPcXMsB4dfe/pxNIDPZ/rF6xQpknojiCBbQYBYy0pCdk2p9Gz5Sqj3SUq
	 u676QuBAimiuX4h4+jGWEvr64s4F1CH8MF/jIFRetsNX7Ab8UuTXjtJvqdC3kiOoxxn1o
	 McbRZhmQ9E8DDxhZDZIM2YSw+XJ7QLTfrkB9bbFC62jD+VLd/bplEPAZcSRIGDtIfhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bfQkbGmxkZ9/E2Cz55EueAzwIal30Q7LNxKxPAHeTlQ=;
	b=a+fTPhMdIwm1zvZc/oax9Vi4DVeMxFtA1FBZZY9xlEWRksolanq2MHv8tDwKK5/q/LXX
	 IDXciK/4fhjWByzdA4wwgZcd/ia/gX7A58RrkHj3s6qzj8TS1mP5CbAUdZ0FaC0DJ2dZS
	 X+wHmKoYPJRRC4gXe/4g/CTmKacgzc2zXLVVWaw+uJNNHG688Q/aVrw3RpUDQtwRpTc6i
	 z/4+8kr2mRb88u1hxbMP8Wn6FZXbTYfLyXzkm0NJjev6jei6o3p7eL0FA494ah8LrfD/L
	 KHGBelr3Yep3wYQoMhUNobh4duUuEXSVu4WjVPCk2DEE6Z8Mo9oBI1AwMQyCPy3yOAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao9R4HSc;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB66606D80D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB66606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ao9R4HSc
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2108555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793777904; x=1794382704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfQkbGmxkZ9/E2Cz55EueAzwIal30Q7LNxKxPAHeTlQ=;
        b=Ao9R4HScyys3YEArHR/4pGI/RlIHIDcJtOGVmNQ672/7pzc/sZw9uT3LpSxmbkk8Co
         +2P0Rgsp7Oyus19VttwZWkEkvo8tV/B7nWZrhwThXnPNixXHHurto+HsNGMJgchXsO/7
         Mnnb4plyal+malmZuAaCBMhT/nU/9rR14ODUAE+ARev501UASpDA7S8y8tVQcMV/hqat
         rQ7Aci9pK50MChcrr9oYYvpDneaMRPn9ua/i0ujURymuH0HR5I25/kNTEhDT3Vv31P39
         ZzGkiGMr7iaKO8iDojbo99sAZFmL06b0q3Zy7vKP8UwU0RjT6JRtjdZFgHFUMEQ9vr+w
         kd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777904; x=1794382704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfQkbGmxkZ9/E2Cz55EueAzwIal30Q7LNxKxPAHeTlQ=;
        b=SiGkKF57RlD3limPdplsqOtn1U0c7sE1ilXvrnI/pB32CMwVGPRDUpUjBE968WXpWw
         Qj0GOH6s3RUsk033tOdr+ofIOh6W4Rsw/2xp8Gn9PPEVCqDNSjcFIrunNdyMgLWF+MaA
         4zkC2yAroGRJgj6ArcGeClCTfBraB9m3M6ff4Qk9h1hZKWv4C6ztnYRdPa7IkBrOsm6H
         ZN4/7N5GRcOhYzh2zP0YOx5gt+LswEUYhyn6thGywxS72mEfQumDj+0UnR0WRn3p6ZKe
         U0SzcltMMmeqJjQ74/cMzJEpK05VUEZjlp/4NJ6jaGQxCv0LteAYJ4FiMqLoLQoviVcv
         RTYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkhRa7Lz65w9thwiSfEG360GsSgycseMOjZVOjQ/i/iqY36dkm5bEHPFo92tWtWxaSB2nbzVZ8MDvyT+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7iZQDlg9s9e/vMv9vkzy/zkFYA/0wQgwltu/wmQ5HBQ4m3QEw
	b+WyF1KYKH2rlIqENi/pmIZxw719oPku8rDYcL4wyTIYnYMbCInrstQ=
X-Gm-Gg: AYBFou11FLl7pm2uvM6YC9ei4kSf85Jo3/kCJypQEn2aM9Ql6Ict5hgwUjtGeXRsef1
	SHgofU4+caYkDBx6Bht1T9VumzhO9WYjzskVRzFR5KoeCziZHkdWP61pqNQFOHLn5Li8e2HWFo9
	jyMM7CxEsx5do2h8h+Ww8OQLhvfw1BdBs3Qp698iKq2NakP40FjbFC4Jnvqs01RRi4x98FBS99i
	BqV2S1KHOAK9f7YzEEL7GP0z/Do9ZCuuqviQtDLKcWHb16bJqGoCcJJW6y5kYfwKes/nfsqMkRR
	Fh5QkzOQXAoPFnorYp8iMquoABDoR8NpFF7kVBtByxt9YpElCSiQBEnMWmfNn5mClCVZnWuQVc8
	B1v5gLsS3nORLfUajJRuHicdP/LvJSy9klkA7OvqQpSustH4vCgh8pSQE6i+/45txhVKe29Iu+V
	Bhrp2y/xl9Xw0iq3zqSAll8sRymVd/h+HpjIuGRdybHz38LEgO6whOm5x8xAHEHZThhZ5tCIGrC
	pF8CLRV0DwXkr0SJswgtgkCRmpT7+Ar0pf3HcjVlUhbAcVffMExQ5IF54G3Nu8sh0c6TgUjSRYF
	B7j36Zu3P34luMLw7ERvIHhGr+/ETjkcS86WUrwEjk9ISgGDBMwrieFCXC6nB4VPo+hrCwRhPRg
	oJVpbPQPJxMFgM8uxxOl5MWlEvTSPiBfGZgXSkd2Cuk5QKnefPTE=
X-Received: by 2002:a05:600c:46d2:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ac187a6a38mr353371115e9.19.1793777903551;
        Tue, 03 Nov 2026 23:38:23 -0800 (PST)
Received: from localhost.localdomain ([2a02:6680:2104:2097:c9b1:3ad5:7d89:fd1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm124190015e9.2.2026.11.03.23.38.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:38:23 -0800 (PST)
From: amit <amittibi123@gmail.com>
To: neil.armstrong@linaro.org
Cc: hanxu5@huaqin.corp-partner.google.com,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	icenowy@aosc.io,
	jagan@amarulasolutions.com,
	linusw@kernel.org,
	robert.chiras@nxp.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amit <amittibi123@gmail.com>
Subject: [PATCH] drm/panel: Replace deprecated DCS display-on calls
Date: Wed,  4 Nov 2026 09:38:13 +0200
Message-ID: <20261104073813.42429-1-amittibi123@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Signed-off-by: amit <amittibi123@gmail.com>
---
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       | 14 ++++++++++++--
 drivers/gpu/drm/panel/panel-dsi-cm.c               |  7 ++++++-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |  7 +++++--
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |  6 +++++-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  7 ++++++-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  7 ++++++-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |  7 ++++++-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |  7 ++++++-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c    |  7 ++++++-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |  7 ++++++-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |  7 ++++++-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |  7 ++++++-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  7 ++++++-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |  7 ++++++-
 14 files changed, 88 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
index 4a8560b4b..a4b35e042 100644
--- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
+++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
@@ -155,7 +155,12 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	/* T6: 120ms - 121ms */
 	usleep_range(120000, 121000);
 
-	err = mipi_dsi_dcs_set_display_on(pinfo->link);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = pinfo->link,
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	err = dsi_ctx.accum_err;
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
 		goto poweroff;
@@ -178,7 +183,12 @@ static int boe_panel_enable(struct drm_panel *panel)
 
 	usleep_range(120000, 121000);
 
-	ret = mipi_dsi_dcs_set_display_on(pinfo->link);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = pinfo->link,
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index ae6e9ffc4..37dd2961a 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -289,6 +289,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	ddata->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
+	struct mipi_dsi_multi_context ctx = {
+		.dsi = ddata->dsi,
+	};
+
 	r = dsicm_sleep_out(ddata);
 	if (r)
 		goto err;
@@ -314,7 +318,8 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+	r = ctx.accum_err;
 	if (r)
 		goto err;
 
diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
index 8c3a231c1..baa64b7ae 100644
--- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -344,12 +344,15 @@ static int k101_im2ba02_enable(struct drm_panel *panel)
 {
 	struct k101_im2ba02 *ctx = panel_to_k101_im2ba02(panel);
 	const struct k101_im2ba02_init_cmd *cmd = &timed_cmds[1];
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = ctx->dsi,
+	};
 	int ret;
 
 	msleep(150);
 
-	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
-	if (ret < 0)
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		return ret;
 
 	msleep(50);
diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index c1d8ca5ca..070faf55f 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -93,11 +93,15 @@ static int feiyang_prepare(struct drm_panel *panel)
 static int feiyang_enable(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = ctx->dsi,
+	};
 
 	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
 	msleep(200);
 
-	return mipi_dsi_dcs_set_display_on(ctx->dsi);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int feiyang_disable(struct drm_panel *panel)
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 80afeeab9..300cb5a3c 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -117,7 +117,12 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 	/* T6: 120ms - 1000ms*/
 	msleep(120);
 
-	err = mipi_dsi_dcs_set_display_on(innolux->link);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = innolux->link,
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	err = dsi_ctx.accum_err;
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
 		goto poweroff;
diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 67ca055f0..1dca6c592 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -694,7 +694,12 @@ static int khadas_ts050_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	err = mipi_dsi_dcs_set_display_on(khadas_ts050->link);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = khadas_ts050->link,
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	err = dsi_ctx.accum_err;
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
 		goto poweroff;
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 893af9b16..deb82404d 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -250,7 +250,12 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	/* T6: 120ms */
 	msleep(120);
 
-	err = mipi_dsi_dcs_set_display_on(kingdisplay->link);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = kingdisplay->link,
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	err = dsi_ctx.accum_err;
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
 		goto poweroff;
diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index ff35b62a3..f1d9e4eed 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -553,7 +553,12 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	/* 120ms to exit sleep mode */
 	msleep(120);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", ret);
 		goto disable_iovcc;
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 22560384e..eeb18ad87 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -303,7 +303,12 @@ static int panel_nv3051d_prepare(struct drm_panel *panel)
 
 	msleep(200);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret < 0) {
 		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
 		goto disable_vdd;
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 3189d89c7..d977b9f28 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1039,7 +1039,12 @@ static int nt35510_prepare(struct drm_panel *panel)
 			return ret;
 	}
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret) {
 		dev_err(nt->dev, "failed to turn display on (%d)\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index 2af6aa47a..bf9644424 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -371,7 +371,12 @@ static int rad_panel_enable(struct drm_panel *panel)
 
 	usleep_range(5000, 7000);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret < 0) {
 		dev_err(dev, "Failed to set display ON (%d)\n", ret);
 		goto fail;
diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index c535dc931..38993f821 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -281,7 +281,12 @@ static int rm68200_prepare(struct drm_panel *panel)
 
 	msleep(125);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index 1f825d995..36edb80b1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -389,7 +389,12 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index d159b0e4f..e462c47f6 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -206,7 +206,12 @@ static int sharp_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	err = mipi_dsi_dcs_set_display_on(sharp->link1);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = sharp->link1,
+	};
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	err = dsi_ctx.accum_err;
 	if (err < 0) {
 		dev_err(panel->dev, "failed to set display on: %d\n", err);
 		goto poweroff;
-- 
2.54.0

