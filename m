Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227044;
	b=uMSfv+cT1ydg2Ft6k4a2tQu6S5nsSTbp0mwVejIiw3LjxpWbsvIrUXFTt0lHyVfVnMm8
	 WnyqAg4ItQOzQwcVt+aG4h0aI7IgJdymbvGaqcN32ZURhkadFGKwAKhD5v22GbDc8phJr
	 0twtwce1GiJC1t35hScaW9jYf+x4Tr/v7qahKOqvRrGCAZkFDfWzh2vn3/ksVGpxtcYaG
	 GtpvuMAeIaQ77zFZY/j4swrlunZ44Vgv9Ra0tfcubuAz6NDfebRXNDc4W0qg/v4OOJwfY
	 ce/wPu57KUxrsT6FMJfXcrKkX2+Q1MnW5T28cQieYdAlGnDf4qqYS62n+YCSzHn+l5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227044;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unq0WKDEle+Wus4ofayVOUX93q/BO/0hZHr5A2W0Qck=;
	b=5Mp8/8ZPwjzcTt6Y1XZsLI16zzyX4kTYhMap7CmKZjOPBUCSjH/ktRTJcYzwa8onRTZy
	 PHjxDoLvBSGokjT0nEhXAi8DGm3f4gjX0FNWhn/8yRbnSeK3HoR45FGOWGe/EkNud3n+o
	 Di/3c8Ns7tuWCuMyA+dzzk8VCHxeUlGGGitQYBqnOgAdWoPDkRQLHrzyxAAhKs25uH3eE
	 i/NhlxgEnel6GJjTGvhYCD/ZtsetcHVxwyH/JwfF3Efa3Xtb/DK4pF9zvKqnhjTzDYTDU
	 2EpK61QAvjav5qK/uQ2gY0fW9o3n1yCGav1NH1rSHhCxCJkERChlxyR0g2nsenClbNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K54wcqgU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3A6082BF8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF3A6082BF8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K54wcqgU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so7055725e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227042; x=1794831842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unq0WKDEle+Wus4ofayVOUX93q/BO/0hZHr5A2W0Qck=;
        b=K54wcqgUM5TLIPGTJk7U0iDKMeq4tXJuEXac25j3xtaraOi7feGN2Hv9Y4Q5u+eCJZ
         gOgtS6gNcH2PdQH932yDSsFs+6dAnY/xQcPFFPnzXpd3Qt/vs9cNmRkiR1guPhXFPjZw
         wyrdE2A+PoBXGBP5Qa/59Zg8J9Nd4mA0NGSHGQHfIICQgjSjtV5167/M7n5SL/zfy1gE
         kSwZn1NIKkvY4FHR5iNB3wjkfa0pU8SlMhiMeJz+alPz4sDJqweigqKR2I1XAen3nmzF
         w14rGibQVuIkaNtIqgw/+eXwix5w2tK9bSsYYoNsY+kavjRY/THmB16f5fcOMYt1N5Jx
         rRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227042; x=1794831842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unq0WKDEle+Wus4ofayVOUX93q/BO/0hZHr5A2W0Qck=;
        b=OdZZyFA+Vm5sl3tj1VEeYjJyFovd3Gr4zsP3AdVV3EFIbzZ9CQZFVcuXpIsYgYT16u
         iKG/AjGlIY4d6Bg+934ZYCmA3FbWsf1Bjeh/HhR5rIVKyhA5X1AOnPEv3QQZGHQigVjc
         iiiG7mA+hm+8NuNHOHDr+MM9FoMikNoDzAr9Yh5ZCzfizVY5y+MKPPqMHAmXwVjLsQTq
         RxjgFNqdlCK5VvEaOxiUqr43JH3+NRNHyZUWOLF9+X8ZTdvjMRkPl9qNJ5zdgXAlcxn4
         JfDm4BluATFKvjR3WhIhFhwiYnQoVfWMgZQwhZXVYX9KZJZfQArrUjSpX6YZ7W6Ct+/q
         1C0w==
X-Forwarded-Encrypted: i=1; AL+hErEZoxk/JIfnlDC1NNy/bf0kgSj39v9NEnkcihy3+BroMxAQeeUBH8IHcfmuKD0Ga0Y64jwJGbf6PApH/XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bRuaP/7jyenxkKuDR9TCc2424BNstXf9lVSTv8SGtDt7fJTKQ
	gOoY24206CtSnqJEpz578/xo58fR4ODFYM+x2K6ybZfirlKO9Dk9PGw+olI0TSxdVdA=
X-Gm-Gg: AYBFou0oqLl66omtMeXdP2kgVSjOV2G4gy+l2uqiNlaR/KjHvG5q+O94TX6p7q3yoVs
	xfLgpaIKb1eGz99v1j0SaODFm7ubRDies7TrA0AfRLctbJxAU89q6j00TnIwtNNoCUSRyU/6/8b
	QgyMlmYntMSwSB3ZkBp3yf5ZCRF8xZPoGDjIJq8PhxT8MD9QaVL0OgkhiiRO6hEz5FiG/FRMtQX
	h9tZBZslVW0pdxKPZvym0gT4iOZw+VIKJV8XYOQy3uGjr0T2jsxkNYhowytmvUpNX34fLM+l0Ha
	pUc9LPQO3ry3/ZxpFb1Pl51MU1Kx0Xwob8xIypeU4Aybiw7N9SzTpqN97fSNQRsBqUp9KwzjXee
	9iIZVLy7Ju92WYVrCZjWC4PkRpfjPN0RuEP9OeviuXdeVWdvR4kbjTYEj4DGmotHTCgoAZd4UhW
	rBkzQRz1Cohfpl9xlmvCgWmHCfKvhf+3FosdjVebKvWfAKYZRcvOGNsTstY4euwmwMWge1VloMt
	63hNkoisSVOtGmQfIQ9wOBtin3dR/ZQeXmFOAf6ovt73wczxPnEeS+PVqP/E9bdjjIAN8+ImG3i
	38qY5UAMvPqO9kq/OKwxsl4h/5fx16XesngI+CvPzu1tpKxppFBMWfYySx7IONZWrKcxM2sSFGm
	3nVIgS5nUeg==
X-Received: by 2002:a05:600c:c174:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4b963c675c1mr76221585e9.12.1794227042108;
        Mon, 09 Nov 2026 04:24:02 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:01 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 2/5] drm/panel: ilitek-ili9806e: Add support for Youritech ILI9806E panel
Date: Mon,  9 Nov 2026 13:22:47 +0100
Message-ID: <20261109122250.720757-3-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add the MIPI-DSI driver for the Youritech panel with the ILI9806E
controller.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../drm/panel/panel-ilitek-ili9806e-core.c    |   4 +-
 .../gpu/drm/panel/panel-ilitek-ili9806e-dsi.c | 158 ++++++++++++++++++
 2 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
index 81d48c402aec..4447a65c9007 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
@@ -91,7 +91,9 @@ int ili9806e_probe(struct device *dev, void *transport,
 	if (of_device_is_compatible(dev->of_node,
 				    "densitron,dmt028vghmcmi-1d") ||
 	    of_device_is_compatible(dev->of_node,
-				    "ortustech,com35h3p70ulc")) {
+				    "ortustech,com35h3p70ulc") ||
+	    of_device_is_compatible(dev->of_node,
+				    "youritech,ili9806e")) {
 		ctx->supplies[ctx->num_supplies++].supply = "vccio";
 		set_prepare_prev_first = true;
 	}
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index 89915d58f69d..e83d643363b3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -464,9 +464,167 @@ static const struct ili9806e_dsi_panel_desc dmt028vghmcmi_1d_desc = {
 	.lanes = 2,
 };
 
+static void youritech_ili9806e_init(struct mipi_dsi_multi_context *ctx)
+{
+	/* Switch to page 1 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x10); /* Output SDA */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x00); /* set DE/VSYNC mode */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x01); /* DE = 1 Active */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x01); /* Resolution 480 X 854 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x00); /* Inversion setting 2-dot */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x16); /* BT AVDD, AVDD */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x41, 0x33);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x42, 0x03);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x43, 0x09); /* SET VGH clamp level */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x44, 0x06); /* SET VGL clamp level */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x50, 0x88); /* VREG1 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x51, 0x88); /* VREG2 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x52, 0x00); /* Flicker MSB */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x49); /* Flicker LSB */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x55, 0x49);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x60, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x61, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x62, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x63, 0x00);
+
+	/* Positive Gamma */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa1, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa2, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa3, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa4, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa5, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa6, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa7, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa8, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xa9, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xaa, 0x15);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xab, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xac, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xad, 0x12);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xae, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xaf, 0x00);
+
+	/* Negative Gamma */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc1, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc2, 0x10);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc3, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc4, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc5, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc6, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc7, 0x04);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc8, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xc9, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xca, 0x14);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcb, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcc, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcd, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xce, 0x09);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x00);
+
+	/* Switch to page 6 (GIP settings) */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x20);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x04, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x05, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x98);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x07, 0x06);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x09, 0x80);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0e, 0x05);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x0f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x10, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x11, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x12, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x15, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x16, 0x08);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x1d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x22, 0x45);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x23, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x24, 0x01);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x25, 0x23);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0x45);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x27, 0x67);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x11);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x32, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x33, 0xee);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x34, 0xff);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x35, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0xaa);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x37, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x38, 0xcc);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x39, 0x66);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x77);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3b, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3c, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3d, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3e, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3f, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x22);
+
+	/* Switch to page 7 */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x22);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x77);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0xb2);
+
+	/* Switch to page 0 & set Pixel Format (RGB888 = 0x77) */
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
+	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x77);
+}
+
+static const struct drm_display_mode youritech_ili9806e_default_mode = {
+	.clock		= 30000,
+
+	.hdisplay	= 480,
+	.hsync_start	= 480 + 25,
+	.hsync_end	= 480 + 25 + 10,
+	.htotal		= 480 + 25 + 10 + 125,
+
+	.vdisplay	= 854,
+	.vsync_start	= 854 + 20,
+	.vsync_end	= 854 + 20 + 4,
+	.vtotal		= 854 + 20 + 4 + 16,
+
+	.width_mm	= 68,
+	.height_mm	= 121,
+
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct ili9806e_dsi_panel_desc youritech_ili9806e_desc = {
+	.init_sequence = youritech_ili9806e_init,
+	.display_mode = &youritech_ili9806e_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 2,
+};
+
 static const struct of_device_id ili9806e_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1d", .data = &dmt028vghmcmi_1d_desc },
 	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
+	{ .compatible = "youritech,ili9806e", .data = &youritech_ili9806e_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9806e_dsi_of_match);
-- 
2.47.3

