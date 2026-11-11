Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403904;
	b=ZGmX7yXzLU4g4k9bdYi2u5hRsysFBsNqpwtf9sxuJVWAweTqOE16NMP1u8KekBTPtA9W
	 J3MxP8Em1TWNJeDJv/ErUu7SxsEfUgA9AZCOvCgmMLK1h6w8zOZqNhoKQgyjKU3RSZE1O
	 dZBPJW0mx4EKuzDnxItL3XF1cAUhbq6TpYHikCkVccfjbARsEXLjMEUG7g9cJPf51kOPs
	 EWCKNlEmsnfWm8asocNBRJYUPKzsiFPAU7opiM+qwyOpr7vA5d9Yd69DrZLdVTg3ahB+C
	 sO+XDAZz4q97iJmX3hy7CJFQU/Br7z+AqUNHabq443a+k9eP1LSC4ApHjMZorDm9AGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjtgi0UYo9/SymaC8Xh1lvuGB4LWnhALLEWFQ2VfEfw=;
	b=VbB8ouHEJ8x4XbAoJ1GNjqRbZ8WlqzYoJRVHoH2FAs8whvE4xN0+6ocQEwiSckxtlClb
	 3cu0zhQGHo5UgeMWuYOwXwIM46PKEmaWXtPb0auoIX2Q3pS0NVI93+6Rv2DXDff+YcBC1
	 IciA61uwxL9nhmkG/DGXu5L+rt6Wc1vQ3BeYsQjYa2z6Knh4y1r3GyEvnE1tD/HR/sRAH
	 wjqW4Wekbq0AhqpQ6ZUG7q0CCTzlUFo3OB9wVfgR/ECUSEk7VUyGg/bOySQl4dajQj2u0
	 o6KwH5Hn0cp971bSS8XQpdGqyvcmGf/KGeHjJ1PhtdeSU35u3pLFcJ7XMvXU5NKh7mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CQQjz7CM;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC29606A88E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC29606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CQQjz7CM
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490f38e9688so2533641f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403902; x=1795008702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjtgi0UYo9/SymaC8Xh1lvuGB4LWnhALLEWFQ2VfEfw=;
        b=CQQjz7CMuG6U0e7kgrUwguxnUvnAxMTBH7i20/XrURphHNb0iIKFgztmzZ/NiD3RSh
         PxKTzOew80zHdPXsLDoXPWYW7XjQ1eSATkLF7XTwFMg4C7Gd/WiFA56oy2d5f25REoUs
         gUp1xlxuW3KgmxjZ2tIVxAVCKNWMvvLK2YMHPdogw2QO60G/EMvaNv5Raul6AbTTsYwE
         fNrNWbysMYhVGN/2W8zUTjzlmQbPWO0BNTBBL1Y5HVz3kVvZSsPx3RaQ6Ysw/H4DAWkr
         aYbhLYCATzQ4kv2M0IrUoZNmtbMcdLtjWF9iK2z8+jvWY8OUEzmeZdu6AQ7SEzVn+uKt
         Cv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403902; x=1795008702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjtgi0UYo9/SymaC8Xh1lvuGB4LWnhALLEWFQ2VfEfw=;
        b=e+2r0Xkorz8/sIXIWpf1JkghQmKuFFiAi6JnmIMP0T7ssxIVrQRpXRzUgFgLPxw4B/
         6F2rhXayJWRqOgZojesTmPCs8rJb7Pk1Ee5IefdsyMnarnVmNyQ6Lf1C3jbl+RRi08lR
         Qzu2CXz/qtBa3gRlihz5DNEexcFNbEcyPdZsDudDukc5T6l8eb347Ra9AuYmFfY89jpw
         AU7PaNqbGCRKIexJrpGke63Fdb6B8mmaUcSF0y0UQiSKI99desYFC28vVOMwLcpUQ72S
         /TxFxAvS4pdEAOJUsWO7YF+/VmvXQxxNp8Zk5/DO+g9UyNe2OB/s2s0fSz7sOqzbHGnG
         WNLA==
X-Forwarded-Encrypted: i=1; AL+hErGPL7m5gT912zYoe5KEAXI6y3AcnrVIpPFKIJrBADcnqepDKwcBvCcOKAMg17Frn3qhxe5xBqUv5JYIfQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iXWdlihWJwr4gc+n4MWtYam5OGdicB/9p6FE/uHJJwWwHON7/
	ObNlUfE8vWgQhiimLvt8y1FdjJNxcq4i9hd/CwIb2qUphj6SknX1waaaf2p7z+3XdfQ=
X-Gm-Gg: AYBFou0RYNRzs6g97feuI0RRr5K8KJ892AMXoCtzAijsGGlWWFSws2Bn7T3z+vH1qFF
	V0V4BUvtfSVJjV6hb5yKyecwHxrGvEfpFNlzr0DKHQKCd7XcJD6c9/v226CRaqQJMshjgq7kuzT
	V7uhyZ7wVNG6M62vJGUBLDGfHyI8n9LbQS7EGuwWkCh4AS+2y5F8JlxtPpz4rvesh+LidGwRpWM
	Bgj8adSiopPDIKDrSHKRrjOZyQfWR2dv44ya+0xa2FCcSh6opk7IP0HKPlMCKP8P/ufyPyc99DH
	pATcof3UDjW3qnYOZEVXtDv1hmdfyUcRmpiN0/HHvL2J0fD7DGBl34S/Dad1ghvLBT/6/FfIEcu
	M32PbhsZCeIxqi3yRtB3+r+9hY6tVDXfVLyq9RxHD/Hgo27GW9JiJbSWHS4Gz+/T2ZcnFK3KbUM
	qWNyLqhtPGVA1WGFu/BefXgqU0fcziQ041Iy7SF+xaGVSQ9eV2Cob08Ia1UJWTmlWA/QCZxuwn9
	VR0DePtBZEx7kyKjXrosd4fqOacNXM0pdHDkrV0Qk84SmOjeCj/fQiUZ4Mjf/uSXP8lQLvUZr2c
	CpPMDAv0gWr9JHdaNv2G8DdWIKqsZMCaQz6778zfpTYU/nBL0D8Krqi1Vn9Q1xrgzx1LMt65hS5
	KLAw9V1FbwA==
X-Received: by 2002:a05:6000:2389:b0:492:1c22:f08f with SMTP id ffacd0b85a97d-499c764a764mr4945347f8f.14.1794403902425;
        Wed, 11 Nov 2026 05:31:42 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:41 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 2/5] drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
Date: Wed, 11 Nov 2026 14:31:16 +0100
Message-ID: <20261111133119.1063210-3-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

Add support for the Youritech et050fw01-kt 480x854 MIPI-DSI panel driven
by an Ilitek ILI9806E controller.

The panel requires 2 MIPI-DSI data lanes, video burst mode, and supplies
for vdd (3.3V) and vccio (1.8V).

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../drm/panel/panel-ilitek-ili9806e-core.c    |   4 +-
 .../gpu/drm/panel/panel-ilitek-ili9806e-dsi.c | 158 ++++++++++++++++++
 2 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
index 81d48c402aec..5509af289393 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
@@ -91,7 +91,9 @@ int ili9806e_probe(struct device *dev, void *transport,
 	if (of_device_is_compatible(dev->of_node,
 				    "densitron,dmt028vghmcmi-1d") ||
 	    of_device_is_compatible(dev->of_node,
-				    "ortustech,com35h3p70ulc")) {
+				    "ortustech,com35h3p70ulc") ||
+	    of_device_is_compatible(dev->of_node,
+				    "youritech,et050fw01-kt")) {
 		ctx->supplies[ctx->num_supplies++].supply = "vccio";
 		set_prepare_prev_first = true;
 	}
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index 89915d58f69d..c1b78700aaa0 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -464,9 +464,167 @@ static const struct ili9806e_dsi_panel_desc dmt028vghmcmi_1d_desc = {
 	.lanes = 2,
 };
 
+static void youritech_et050fw01_kt_init(struct mipi_dsi_multi_context *ctx)
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
+static const struct drm_display_mode youritech_et050fw01_kt_default_mode = {
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
+static const struct ili9806e_dsi_panel_desc youritech_et050fw01_kt_desc = {
+	.init_sequence = youritech_et050fw01_kt_init,
+	.display_mode = &youritech_et050fw01_kt_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 2,
+};
+
 static const struct of_device_id ili9806e_dsi_of_match[] = {
 	{ .compatible = "densitron,dmt028vghmcmi-1d", .data = &dmt028vghmcmi_1d_desc },
 	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
+	{ .compatible = "youritech,et050fw01-kt", .data = &youritech_et050fw01_kt_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9806e_dsi_of_match);
-- 
2.47.3

