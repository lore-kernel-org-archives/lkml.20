Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831117;
	b=Q5AKdeuzq6hTcjHT2VgFVPe+2fI15FKoqDU0YJlv/pZ3/nGkRrtkJIJQiyDt7edhOUfh
	 uvv3PS9QSX4kEF+sTQgXYW1THSBBC1Rxml17IlUTAOmU7L8pIoLo8oaElxcewNo1dZmsa
	 mI/VOB6ocxJ5XMwZe7oBHnGwwuFJKh5uZHxpz3ECAqqwYwwgLV5SC+xiKo0W/SNUDik/1
	 hvRSVpDqrfVA188c5WEACeTt0/IR/GXx2MpGcjPrhxPR10ovfbAyW6lZNf6H43XG4pFvQ
	 qb5K+1qF8LGbb6njA7Pkfoo3HltKdbW6OnrlbYuWQ5rSxsRI9opBm3mp15BDf1BNmxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
	b=XfplQt76YstLWqu9x3SrAcAAb7TVVaFvleIvqEtMak6eZy825Hs1uwRPM2tgs9QoccJD
	 dUdUgiQCJ7AZNeXq9znMR59T2BytCRipSNk2zMNdqxGq2v620uSkvMsGecnc3B55phzbs
	 2FOkPrQQOlqNcCrHhFefp8RX2+WSpIUUB4wtWKr/mqsXd+aUhMLqlMrFWQJLVEbCtj4Cz
	 +z1x/uhQrjqxc/c29NMXkx2DIbQ3B8sOsOcdVaacpwvBoLeJyEmr1qmmDZ9eTWKHMNSyz
	 dcYqmYqVgmjhQW4OAXbMAtL+MeDQZTbsJusXazJ4rr6APozm4OLsyEQSRCN8k5y9F1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9Go8mMR;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65066606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65066606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9Go8mMR
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so37590975e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831115; x=1795435915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=e9Go8mMRt6CeWWTDO4HPH5sj1A7YFgUu/hybUxyiZsIm94O5mAosz72l8YPgiWdFG2
         lU5MOSD37s2mn/eEKrtnWqEtBbMSRZCmadviDFlv4rEoEJ+O6K3MNON88r35Ag1kKeCl
         /FzW5fX+zqW8lnxkkthYpLvGuqR7cH/cUWG/MaooR4/YaGo7WNAUihTrV9l1ifgCQXQY
         nKj64+d2yEbvqf4Dcx6t/Harg0oXfug+Ndb3bHsXKbpAmAnSU/xteNeP0oiUdul6FNgY
         cta/aYMWeAWcC/SGSaMll51wrAKFcKtkKcXUQQSucKwBiBsqlu4YHL60ap7XGf9gsq2p
         CDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831115; x=1795435915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=nJpjNEP0Uc2FBf7mAuBG0qWzcRfcNIpbkjHenDFg8TY5ohILUkpwzvPckR3/0cGDNF
         JDXMHi3PGwHXZGVSjdV/JSAyvwGKMI4vyrHkToTMRO6j8+9AEKLps1ZXNhb1COJ1DeLL
         KhY7EltNsiNPedfh/5UoeVnArbSZ7DoFIeF3GWuCC5vjG+zl9whvfR5WXTU7YRJqcurR
         QhvT9HZ1qIiQCeCSvzp6GPtCENieBP1T7AinNqWWrqN4Y2vSLlqw27jZ2Jei2KSNxCgs
         mOvFO0Bf69l3m7DhMPhZLf8swnRB1lyuo9MFmrSNHQTAKBucsv7Lu9jzT/46NyLQTb+k
         qwFQ==
X-Forwarded-Encrypted: i=1; AL+hErGyYa1hL8M+C3LRQUKFbLhNLmaABmW0OBgBGHgiKggSXKvPsnR9Uv1OCMkNFPqhyCBYldLGXi1NsfOx2AQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lc1NHsGzHtbsiNAwAObZkijROk5ZJKtIDAjD7YI9QKUXOxkof
	xyb6J2lqJtcmldQb/bZSKs5XOyL7gdldw+erdenxcnM6Kt+Alky37Zok
X-Gm-Gg: AYBFou0MsBJshigNueAOEoKLhRP6L0HA4+SMyMdNGRQCCTfIpW1x5xUZ37vla7igjQf
	T/Ww4LnbFG3kSNZ9HhPtH8jjMCysagpifpSTji2PERYujxl6Yj1++944ZNn7mgFoCOcik4PXUAq
	abx2sLVoNoI9dnTRUiOKg08KTb5cVSsPEWKDLo0pmjfQOVqIf2fSRWY8sInr73o+SgYJ5TbcNPg
	j/b9RBkCUbTu5HoER4DmU4TmYPx3J7ERdNJfC4PinMI0pnKJ3WqzcimkcOwELEvBM0hFvinWHae
	G4gsNI3ux4rj29FTiRjnfF/iWCQ5zp894n+WXhrch1d/g2axCoE1OgDJywX7jIlV2Ikexv2xKKe
	q9fgHSPjd4bVqwxE6WPdT3jby8Bwqop2fDjQZnlJVdf7HKIh72XvxMe6BGRRG0otrtNjWxp2x5s
	yE3c4xyECLpwm4b8p9mk1WLlrOy3Y1KQhQ0eVRvKkUMlvYN+ZS58FBUcsQqJlWeymQH22wBy/Hb
	QL1kq9hB1TIZtWJ+5a5fyiq+FZQQEe4La5D5n4voxdoAqKTHVwnhQVNmOAsRjDYJ0a3yAYFuVbI
	cnROPn72LMtn2UvYmOE6etYgcQAiL3g1Ln+h26GmxNCahUg26vSKQuBeqbqGur0ruleFuLD2Jdf
	DpZZEyJUpIJq/lq+DpG1uocCTzEBZ5NQLrp4kimHzxak3xF/rVIQ=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb60bd5507mr142579815e9.10.1794831114708;
        Mon, 16 Nov 2026 04:11:54 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:53 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:49 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mq-mnt-reform2: Drive the internal
 panel from DCSS
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-reform2-internal-panel-v1-2-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The panel is driven by LCDIF through the NWL MIPI-DSI host and a
SN65DSI86 eDP bridge. LCDIF underflows at 1920x1080. The picture shows
horizontal streaks and the underflow flag in LCDIF_CTRL1 is set several
times per second, even when idle.

DCSS does not have this problem. Connect it to the MIPI-DSI host and
leave LCDIF disabled.

Use IMX8MQ_CLK_DC_PIXEL as pixel clock, with the video PLL at four
times the panel pixel clock. The DCSS binding only allows three
assigned-clocks, so the PLL setup is in the MIPI-DSI node.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..31c7428f0386 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -171,17 +171,61 @@ edp_bridge_out: endpoint {
 	};
 };
 
-&lcdif {
-	assigned-clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
-	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>;
-	/delete-property/assigned-clock-rates;
+&dcss {
+	clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+		 <&clk IMX8MQ_CLK_DC_PIXEL>,
+		 <&clk IMX8MQ_CLK_DISP_DTRC>;
+	assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+			  <&clk IMX8MQ_CLK_DISP_RTRM>,
+			  <&clk IMX8MQ_VIDEO_PLL1_REF_SEL>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_CLK_25M>;
 	status = "okay";
+
+	port {
+		dcss_dsi_out: endpoint {
+			remote-endpoint = <&mipi_dsi_dcss_in>;
+		};
+	};
+};
+
+&lcdif {
+	/delete-node/ port;
 };
 
 &mipi_dsi {
+	/*
+	 * DCSS takes the pixel clock from the video PLL. The PLL runs at four
+	 * times the 138.78 MHz panel pixel clock.
+	 */
+	assigned-clocks = <&clk IMX8MQ_CLK_DSI_AHB>,
+			  <&clk IMX8MQ_CLK_DSI_CORE>,
+			  <&clk IMX8MQ_CLK_DSI_IPG_DIV>,
+			  <&clk IMX8MQ_VIDEO_PLL1_BYPASS>,
+			  <&clk IMX8MQ_CLK_DC_PIXEL>,
+			  <&clk IMX8MQ_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>,
+				 <&clk IMX8MQ_SYS1_PLL_266M>,
+				 <0>,
+				 <&clk IMX8MQ_VIDEO_PLL1>,
+				 <&clk IMX8MQ_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <80000000>, <266000000>, <20000000>, <0>, <0>,
+			       <555120000>;
 	status = "okay";
 
 	ports {
+		port@0 {
+			/delete-node/ endpoint@0;
+
+			mipi_dsi_dcss_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dcss_dsi_out>;
+			};
+		};
+
 		port@1 {
 			reg = <1>;
 

-- 
2.56.0

