Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240435;
	b=WCq3I7Wd1xYet7dyvQh6GorVK5Pp/IZ1UD7+h1UQB81KAvXe4eHSPJutJvo3HEJgFPPy
	 W8bDwmdH/hDvbhNdu4K4CbcMyni6VB3TVTSbYA/D31AsgGjhwr6P5PLWk0X1bkdaByP/o
	 RxwqPf64YeIpzLTyyUdkqz/R3UpHY/c7I8qMjWj5Qv54PpyFNW+zx8JUKtl3HD2sC/JbA
	 KfOwtZxwj+8UNnTcA1EOEGcA0/wfxBWb3XZd6XR1NQ7byDmrdb+gw7hBUGE/dNHWOQVZp
	 1ZJRd7gQQouD4fL/n/GlU6id1/SU0lIWAfzTRzXq3dVsZwCjk22VuOFFQhGqOoMLdNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
	b=r2ZlM+0LQ3rdjllvYVE7ikQUScT8oMrQO6Ym9d7UPVF3sx++rBd4PHRmi21qwBVktJ2S
	 lEjawZCGwR781GICDeccAvok26/CQXNf/HBhAfwGckNDeCpF1mjlINXtxfjX/ZgQzwCmz
	 XNXfQzsv2gaTsmrI6ayo0xHVjksTPQFYZl5LPYKX3kdPiOV9fqWd9+ShNU+2qH9wf8bFe
	 +VCYu2dOskwVIcvO+U1ixYyMYs/sk2CiNpmHBeUMKDBtm6Ca40ObrNaYSsCwiBlcDYb7V
	 l49nMrDeMVUX7SshrqNvQkpc7Qu4JjqjLo64clb2oIWJLI1aCEK8Il1eXEVawDLVE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFrFFRUK;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF73606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF73606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFrFFRUK
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8691445e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240433; x=1794845233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
        b=IFrFFRUKmrl0G5M6KzrrHVX/yiDKWpxTOMMw6wixzTS499UzgQttumJQ43svtgmzYL
         7//QeLJqEBP14PoPakszYxjFaT6qzzgJKRYp7jLfekVg8+zoQSJ00JsXbyEu/uscZVAL
         OADcjiNLJbGwMUUSEOl4nWXS9d5p8HmPdCt62zWq7nDU/57JoQcD6T4Qd8MZYIN3j0wj
         Bhnjz128jjJTYZ+Wil8+c2M81SdWYJCPcPZr9K9aB0VjqOdqjaNZmHfYyP/HCFzhXwJ9
         wVu2NU4borqXng+ThFuQkT0TmArYRkjSJA3y6Qad7ptP0tZWXMN/PJq1vAvUKS3r4FYc
         +vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240433; x=1794845233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NgIZ94zuDgUp+uszh12oHM+e3kglPF/onpqBOfOj5g=;
        b=UmoYoBqW/P9w7nSMVau+wDgbVEt4ApmpjbdYBzvRMAms8bDBodpkb/XqbBp5ueYzto
         X90mOvw9iS51UtlqRlp16vE1Oi6vUEvKSyUAH5Ug6nn3fVuNoVHDLOvgEG6SyQZPSmC/
         5kVPFoDnlxyScUBs+5ORqNm7tw4f1J+urVbJqoWnTkrN7Nsi1nshnRXstDYSsLShq2YF
         sizK8RyMgeZJouLr13kbS5YTiiZ3QAoqx1UqJu+fOJY1Gui3pG0Uh+V2/mYdOt2Dwifu
         aYDMBFjN1prDlkPZ2KjHvJM3Vyzb3UBrV2A2XM1PI9+h+Dsqew54QnrL+XllIX+T2nPq
         weEw==
X-Forwarded-Encrypted: i=1; AL+hErGitL3CqSKZxTB6p+Up3bt1/D3rvZd9SICsbPfjgbo4foZ214hSij0GR/uIJ0O7Mkf6Jj9QsqkNcSzU4Vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wna5BArtzJ0viSX15stBDwxvopnbJxkTxRdJFDsCMnPD26Iu2
	EqHBfBajIREht9e+gAJF0nALUMOh2Otx8bAvPvpVg9l/fqh4vOd378dd
X-Gm-Gg: AYBFou3YTJxQLnfVZZrdYOFppcfZUfJah4aJUjf5KtxqLt7f7PX94cESfxOuIGJO6gk
	uIZyMkp9xgLdu09FFILnDpKvE4l1sr8xIge6ugnU2uhEllvScnUgBpLslPwDuHpMuWa/1Hewdk1
	Dl33QBXR+ofVwmFx/vEsaCPOv8ps28wZX9cGhVRgxOVsByMi/nzhwJXb0GPid9VCtH2LfJuL8q6
	eo20vmCKeSb5+dNpU5SYoosqX0qoFeIJ8Sj7Wy2RMU2CcwpkqqjGXUN8rBubF5ZDPHkZbGewNWr
	W2bvpvDKMB1b1cmbCelSRaXLUmvMoK91rLP3Rupu4Ta6NBbHW5DbQkyJ9JE/fPtqJUja4BRpsHS
	jFHngeOJfOupq5wLA3Cs+K6T8XW6M78dhwHoGDqGph2fOxCH3I7+dogOjUSdNA5sN56xjs1NvpY
	6mR6czH+rfa8/Py3qaU3hU47OP8FlJFkq4PeaHKEEtyKySyWd4rcAnndwM+iFA2FSK3TfRHodPw
	/y9b7wYgRtT9k4qZTmBJOD6fHbPrM9Tmbq00GG2Qn1batOLc1wzGpi1286cduRFArTcQSvA2/TL
	ZNpq+DnCnfYvCq5tPbD4A19On5jNDMWIaNPKY7KFmx2DWI5O8ZnzmhF2DMRIbHghf1aYborIUrO
	tZByqkHMHaUvl+bjczQ6/A55TSuB11MRJ6AGrny8rzs4JhA+YFlX9pALfVFcNHX8=
X-Received: by 2002:a05:600c:1d0a:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b963c741f8mr77671625e9.20.1794240433343;
        Mon, 09 Nov 2026 08:07:13 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:13 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 3/3] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:06 +0100
Message-ID: <20261109160706.2272332-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109160706.2272332-1-romain.tisserand@gmail.com>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
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

The Miyoo PocketGo S30 handheld (Allwinner A33) has a 320x480 1-lane
MIPI-DSI panel built around an Ilitek ILI9488.

The init sequence is the stock kernel's, read back from the running
stock system. It differs from the E35GH-I-MW800CB sequence only in VCOM
(0x26 instead of 0x25), the display function control (2 parameters
instead of 3) and the position of the inversion command. The interface
pixel format (COLMOD) is kept at the stock value.

Timings and video mode are from the stock configuration: 12 MHz pixel
clock, htotal 382, vtotal 524, active low sync (lcd_hv_sync_polarity 0),
non-burst video mode with sync pulses and without EoT packets.

Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
index 6ab8ae72abbf..29b869a6e909 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
@@ -86,6 +86,50 @@ static const struct drm_display_mode e35gh_i_mw800cb_display_mode = {
 	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 };
 
+static void pocketgo_s30_init(struct mipi_dsi_multi_context *ctx)
+{
+	/* Gamma control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE0, 0x00, 0x10, 0x14, 0x01, 0x0E, 0x04, 0x33,
+				     0x56, 0x48, 0x03, 0x0C, 0x0B, 0x2B, 0x34, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE1, 0x00, 0x12, 0x18, 0x05, 0x12, 0x06, 0x40,
+				     0x34, 0x57, 0x06, 0x10, 0x0C, 0x3B, 0x3F, 0x0F);
+	/* Power control 1,2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC0, 0x0F, 0x0C);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC1, 0x41);
+	/* VCOM Control */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xC5, 0x00, 0x26, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x48);
+	/* Interface pixel format 18bpp */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3A, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB1, 0xA0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB4, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xB6, 0x02, 0x02);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xE9, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xF7, 0xA9, 0x51, 0x2C, 0x82);
+}
+
+static const struct drm_display_mode pocketgo_s30_display_mode = {
+	.clock = 12000,
+
+	.hdisplay = 320,
+	.hsync_start = 320 + 22,
+	.hsync_end = 320 + 22 + 12,
+	.htotal = 320 + 22 + 12 + 28,
+
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 4,
+	.vtotal = 480 + 22 + 4 + 18,
+
+	.width_mm = 49,
+	.height_mm = 74,
+
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
 static inline struct ili9488 *panel_to_ili9488(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9488, panel);
@@ -269,8 +313,19 @@ static const struct ili9488_desc e35gh_i_mw800cb_desc = {
 	.bpc = 6,
 };
 
+static const struct ili9488_desc pocketgo_s30_desc = {
+	.init_sequence = pocketgo_s30_init,
+	.display_mode = &pocketgo_s30_display_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 1,
+	.bpc = 6,
+};
+
 static const struct of_device_id ili9488_of_match[] = {
 	{ .compatible = "focuslcds,e35gh-i-mw800cb", .data = &e35gh_i_mw800cb_desc },
+	{ .compatible = "miyoo,pocketgo-s30-panel", .data = &pocketgo_s30_desc },
 	{ }
 };
 
-- 
2.43.0

