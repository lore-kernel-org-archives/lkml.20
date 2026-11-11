Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384791;
	b=clZqz1Ci/xR3y5H2vgcTBe9K6JokmvcThBKi8SNJh2z2Z/RYvJwTh17ik/mwKBzDPHn4
	 qIHdptD5r7udje2gR3umPjdcsvKgnGuLFzd1nY0JniADZTt2CbzUWgchbCc+EFyDi12QF
	 Pqv4/kbZux54Mz2vftYG0st3JthQzvQTUa3la0mfu5yef7XiNeoT4pGOIHUrOo8cU9+eU
	 MtWojZPdGk4Hm41ThxduihYM/PawT3uFlfROCyN3RUAp1Vhg+GkmCzQMHux5mPkVwqcMb
	 ISuUoYU707JpBFKWU4KmzLQPksgaqynhXunmEmFzY5kW00w4hpu7hjwBkqKxMLmBmLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjtgi0UYo9/SymaC8Xh1lvuGB4LWnhALLEWFQ2VfEfw=;
	b=Nsnz1BF0oJCxKUpOGJXqNIC5Ks//naeNmbuaDOCr7xvcamKCNm1aH5QdQ18ao1O/4ygh
	 K6GFOuZmLApEcxjbGaa5kJJQtBQPRtba/cD195gfYzBIeBzTSDADv72D2CLfeE3JCL4SS
	 nShhlsOcNqgFRcei0vmSoqAaVbwPEfJ1E1eXLrXSranMZ3eE3AgZRKq3XgyLrVbf+TLoH
	 81hoPQW4p7AKIJG356w08IgIDPF3SXuVJ820dzgufInX8tq8DsTph8JiJwXmbyMu+6X+b
	 Reijs8mmfJkAK2PqezTJPHqd/2YIW5u/ebeXBuFzsXL3oq6Dj+YBfDbol7caYdw+z2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H+XncpNe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F960A2607
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327F960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H+XncpNe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16686825e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384789; x=1794989589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjtgi0UYo9/SymaC8Xh1lvuGB4LWnhALLEWFQ2VfEfw=;
        b=H+XncpNecpgkKwOV5wStwnCUNKCIISZMKKlVQ+JV2IJkCm8FXbgYpHvYQT1ZHx4yXM
         Zxi274IYuHvjRfLGpaKsFjEr1X1hGtQnNP6v8SItITQ9GhisCOD3mMzLU4/qI/GH29EY
         yXaN4A3KMO6dZW0gygE1QurqRf8RjTkxp6Zm74GGP95u2bKy8NwlZG2dy0ZlTIrq89MM
         4EVIKwAk7XwRB9uAvdd3+BCTRcDsPLor+LPUPan+EsEpi7njdEFUQpAM0T0PJgzpeF2L
         i8omxFNJigLzLdDZ0yztIREBI1VCzGeFo6oDnRjeAVlvtSRMRBb3Ktj3Ny/CGXhnBgka
         QsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384789; x=1794989589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjtgi0UYo9/SymaC8Xh1lvuGB4LWnhALLEWFQ2VfEfw=;
        b=XrGEyJf+pdqDpxmEU7KEFD+jSaFvIjR25nl4Tf7liYy8/TGQNvyKuVfF253e6Q3Him
         jXNBVV5vnGEqdYMFhT8YTNoXntd/vAiwckLTNoPXofmqZ6hDQq9wgO3JOSqp+OpR1Xi5
         8os/54pHFZrvOBWWzr1XplWILP7ZQqw3TmRvsD2IIB04431Ns0ed2xbMZxdWwnHDZWKO
         11txFWj/36rgln3Kgx2/h0EocJ1APU4QoITYZmN5DZpAnn8QkuTgLwLwoTauIPDTHjiB
         0nrXF43uBlfepOJ7XGjrT9PaZSMfm4PNGP7laYXjkFMqoT6y4BljaRgrwLRPdm+5JSiV
         /3qw==
X-Forwarded-Encrypted: i=1; AL+hErE98uQtoT/D2+OvF4bTzmU1JRJkllvYMakFVq9gDpUaEOHvXn9VhfkB7q6lj3JW8Yy2p3DdVTwH5ak8kT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JuNGx6x5jBZFdwM7uDp0psGDlbcmZu34rE2LwM/t39RV4BQiu
	VCp8amBAwn9y5SC4N1uClaoFaYfOe3N5Io79kXLdgi7UVzHARRnvdLQ3FIc6lRNWJ94=
X-Gm-Gg: AYBFou2vJDranAxSsK2zbe6ASy7VUtk9f4WpGbP/LFOaE1OrsMWqtUf/5n03HonviC4
	ZOOdrBNAJLSrD1765kSsMF/x4sIa5DEyVu1mtm14DbWZn+Dh/JbNTVZtccD039GUiJcQHqjS2qa
	ciwjs0inINJTS4H0VvB2N/zRKY+YPVgNfOoRRGsn7u3D6AxMjBI8zZXQB/KaZwkp1a3x0BOWutq
	szAwlnyB461yndtbrZkjV0aFlcUSyeHAMAu4m7Jynw0z5d8I4URwY3ejHMRYe3Gp6Y/dURdVkSe
	Nydfi+BCDKF71iJQ7lao2x8zY0Ecpa/43eKtVSQ5z6XSOsmpk522xpvdILsXgCgG+oZntMYXpkX
	+A+qb1q6fAIgC3wyvIqDswwKPBvR5VTIVJOQdEpmzdclwEP5G9RKOGXYSVgXfKINEQfD5q9Yv24
	1aUWHXd4w472ChfAkmOHLxcPBiFLqjA0wyQWVOk2TRksIVL1QMcF4kMMLq6BxRKQ44DBsjaxB7n
	LJguvXmnwObRXs39eyWFENWqzTJh131YWygskZLk9jiMyGnK8Bj2X/giEnn/17iRYqib+KeRVus
	TTGR4RxV/w3M3y97cLXQDsGPpB5orzYpZoC4ziFgD46Kfd6uRZrk/7D+rZE5wfc9LIBlk/v5XxP
	P/sThGwpgqQ==
X-Received: by 2002:a05:600c:4e0e:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ba093ae6f2mr24758275e9.28.1794384789490;
        Wed, 11 Nov 2026 00:13:09 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:09 -0800 (PST)
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
Subject: [PATCH v2 2/5] drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
Date: Wed, 11 Nov 2026 09:11:47 +0100
Message-ID: <20261111081150.950272-3-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

