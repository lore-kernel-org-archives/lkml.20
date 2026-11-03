Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703930;
	b=zCJwvljZfaKjMd72BveJC5pV8XSDGoFQHA1NDl9aaNmuIHUqBdtdhud66GqeZulU4eay
	 8Zlf/6ZQqZnD1zr37ETtfRdMJ07HRPoU7U/8ERgUJk+sZ7/tnq9Dl4j65UTOg5eXcNhVf
	 ETS1BBAinsU9tpb6EsDHmvvyVlwdzGiQqGBvHsHCKchm/kzncb9hOsJ1apcoVgiCYOuzM
	 Fx4abTZoCK2S3I0njL1hKe0gU/TebLAdiLQ9pGs4cR8DVNm5KIGhB/zUpK1sRNOFM7EyQ
	 WTSY+ZE14GR8JjLQ2VPMrU6+6cjv9hW4QhWgVlR1zyeTlMMN3fxKhoghFMiwUnQd73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8uVawaux8sNeEnQ6GG0I15QjU4Tv1ysiOdcaZPwS+rA=;
	b=movqfdLhqlUSwcLPziAB9JZwF9pDffalbSXUio6D9YmRJl0ySjofDft2r07d4SoZXFo/
	 crttZUguWxFw2mUIKQRT1yX3kuSxrLlpmKOf93J/TdWw5Gap2c+LjYid4ygcGctP9rikK
	 cAHfqLdm0Z7SXbI8a2Zy8hAsiaycq0qriW0oJqFR68HLV0iMGHjQEulHMVVZ4SmbVl2xK
	 E5MbTLVC7CTWoqtxTMWKLqywKWXcRf+T0h4yEouk68LXObB+u9P7dxzYScBNfNiE6qFvo
	 Kbd8V6Bt80CMRzX2a/9jUYJ3bPwrhBB8QrmlQ5rCTN7g7uuuF7J7Xy3xvTS+Zqeg1dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMGe99cV;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD56606ED9C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD56606ED9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMGe99cV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso28498805e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703929; x=1794308729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uVawaux8sNeEnQ6GG0I15QjU4Tv1ysiOdcaZPwS+rA=;
        b=cMGe99cVQwvxenLIq8hmGoLfLAMyCDSPrToFpISyapKnhEPANHCmKV8Zu53d0NmrWU
         QoNCf1CeCksZq9KqgIExqX0ZHZ9ek8Vr9Gu9nq5hQH4B+1ltLTQGZbE5TRpv7ZFMEPPG
         K9n4IMXh9EFj8z0jWJ3HfOTfx6YyP7L5YO6eMAHG3XhUgeICHviuLc32tyerHpy0oWyv
         2avthLjzlFjegKCm4lZsOPS3nTnZAccdn9YdBnqeppbBT+xUsSjictEXKu+swV/gnbdJ
         svRZ1+TpD+WpmdXJhCi33DN2Dq7HtXvWt/0vC9ZGHsZVeYFtWLJLMgon39KIufPIncDj
         KFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703929; x=1794308729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uVawaux8sNeEnQ6GG0I15QjU4Tv1ysiOdcaZPwS+rA=;
        b=If0XV4PaptoRFvoagLSZDKf2UI5QHJ1c4bIdSZS4lhcrvdkyrlpEB7fTJQ5U07IEuR
         HpU2BHccHJsSsOfDJo5BK2fUk9Q+BA1fh7XU7Wr6lGAJnufs5CFMDw3huE85hPnDGUCR
         NAxsBUZzLTVm2ssyiSzyl+eUhSyFuo8SbFX2Gaj5A2jumtx79jaRWn9bQfdQ0X4USD1e
         tesBFkZNahzOMqU57fVdYem1mU0RQu+NFcXuwn1B5nmkCML4MCSy3QB872RH+f1x5Za6
         2PY0MsMcNG0UPK6Um7lMWq7Ye4EpJj0bJ2ZCGTUMSgLHeckNP8HDs1Rzl9hIDXJXjrPD
         9srA==
X-Forwarded-Encrypted: i=1; AKwUvBxZeK0moT9we/Fof15k0Cc10nlCqUUw1/62WDiEgrXex1HxBIaUqaQJ/lFZv49yB/Sn6eEZLNyHJx77qc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+szvMT30ZdU+KHrSV/jjoxytpGvWaIW8KcviZ+lh4xwUG354
	/BAlkRg7D4BlV3NVu0PW+EHHTa9juMXTUhuKjhZoXvMY9cHYyFGBKngQ
X-Gm-Gg: AYBFou3gwgyWMRMtfORAm5/yqhFe0zpBySXryN5fHf6FuJOyidf1eHflFDn9jReTm0F
	39nx03mptuwjixALfwWtdK739I/ZY+dfVMgZmwU/QNbC+wRCzewSoxwuTSDYbs2TUpE/wAxlloO
	w9EnRpBY7ZT8DlJHVhc9eh3oXBAxFvFuXTG5iIFMYTx58HKrE12KKX8FItvFJFQZcR03UmxOEJ5
	lnQVgPreWj/whUhnTF2eknZ12e5Ptdt6AaDOhlwmIydD0BnF8LxJGkXyHKJCoSslgbfFzPRwd3V
	P7kMqLqkuvfEv6wDAUOXziALd1pTDj1+PRN2/leGqxMjWlOTdVbgykVvVUAwRJ6Nha4tqJ3tDTM
	oM4N5nOGyOhLs+q61aP4dOSXCKdotICFus1tkNe6W4anjxCAklD/l08T9AbM8bV4iJ0zGppCCV/
	uyEyawEFOibzd6Hvgj3BDoePFzoK05+nybcVgNFYdzk8nZvHpRF/ammyB09xwiWL3FkwUqhuIyE
	j3FFykpEexWv/p5QHxiHrOZ3r8Is4cQsXKsp48P2GxHj62+J5Xpv6VQTUPoMAhCy4YsYLvRctjP
	ghl/u3dGsXWbkiN4iOdataqoKnbOcXx/miNFSQtCdksBhcrjeKVxuJR6z6QFEKvksB90BKAKBhX
	WwFstJ41tQMmKFdI5t6XkfIidPyl99+jZqGbZFkcl0H2Jgg==
X-Received: by 2002:a05:600c:638f:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ac150b304cmr286208485e9.4.1793703928755;
        Tue, 03 Nov 2026 03:05:28 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:28 -0800 (PST)
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
Subject: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:24 +0100
Message-ID: <20261103110524.2812831-5-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The PocketGo S30 handheld (Allwinner A33) has a 320x480 1-lane MIPI-DSI
panel built around an Ilitek ILI9488.

The init sequence is the stock kernel's, read back from the running
stock system. It differs from the E35GH-I-MW800CB sequence only in VCOM
(0x26 instead of 0x25), the display function control (2 parameters
instead of 3) and the position of the inversion command. As on stock,
the panel is set to the 18 bpp interface pixel format while the DSI link
carries RGB888, so the panel shows 6 bits per color.

Timings and video mode are from the stock configuration: 12 MHz pixel
clock, htotal 382, vtotal 524, active low sync (lcd_hv_sync_polarity 0),
non-burst video mode with sync pulses and without EoT packets.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c | 55 ++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9488.c b/drivers/gpu/drm/panel/panel-ilitek-ili9488.c
index 6ab8ae72abbf..4be3d22360da 100644
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
+	{ .compatible = "pocketgo,s30-panel", .data = &pocketgo_s30_desc },
 	{ }
 };
 
-- 
2.43.0

