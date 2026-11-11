Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403906;
	b=qi2tcjSgqv8g9Bq47zDhD/GKbfBNpTQ9m/wdA/nqO+smTrSjJ7WXflRQtKXkdcsYw3IU
	 eh8fuwWHKf/AIxQcvW+VQMEdeZDkstXQTTepTbkRPaUrH6HbC0HVp258UEJS4hSuMkbEy
	 esty+JimTfKS5yQHja7pYkqxyKu5vl8P9WT+qmMnuuaCyaSp4EavBXOQQoIQT+bxF0hNE
	 BBte2m+ZfO7OK6uBdu81ozX43zSON3JvVF3kp9CshdPVAzNlVH5eGesrntImFp8kXEu4B
	 sqdB2kX8lGpf8sEmLva3PoDCM1CAVcxyxLVrDsUk2O6fZk0IP+pilKkyZcVsul331Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
	b=GaV1abnckEDExfg1V7bjum+31SWW4O+y1SGF2MGy49NBmH302+coirL+xBI9N1lLQzlz
	 54PAc7TRLvn1FHuZdJ0KgSbwNecJ4j7mgAphRn1EhRj7ZeemJHoBNdaBOglrY6AlsQ589
	 AQdC/lqBl9QrRTLdSSCyIYwx43ibjjAN908AuBfbGifM9iOsQvdWXVtuBswuT6PxK7sQ+
	 rseoL7dwCaOkK8ySYEBlJn0KFkF79F0tcYyLAciRXqRO3btLoGMHWIWaeN6tscMHPAxsq
	 nhNxwNjB5uFM/6HdpQR1K7WqDDdzaUjELkPSplc0DChXdnGTIUOA9tQZPBfBignMC9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FekIPMwG;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7035606A8A3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7035606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FekIPMwG
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38424855e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403904; x=1795008704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=FekIPMwGx7yh/nYv6KSPNlOCyLlIbCjmyBhzMQnkD7ULKNXkBZECk/rQxZEM5RUGcW
         KiZbA5rizOv4mOw2tRvViDDTwf9c0oY+yB2ogK0xYvQTutVnUbuKyf1SuwN81kqA5kHP
         BK6yNWVKAv7JB/uq01NUryWOqbuzlRHQu6yKzqOVPblyVPFZALr9zMpvZNUko/1vqYp0
         2icnOsKKEg1SCpMF547oIBQl8pnyYIxM11TaArtGQYjNLMWly0gQXR/jLUTW1zlxBwmK
         T1coSiUNFftypUepY/ifXI3GV8G5DC2MCgRf0GSVI5fOJiJ/BJfDp//qQ0PNu5oR7SI0
         LP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403904; x=1795008704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=W9aXjMUt0BzPXNq/+z8TTjUceKXOdg/g3J2RUnZLXqOq4+xkSNbNPxfIdPy1KsSCob
         RIfWo8R2JpnmCqsWFQ4UWU0D4WVwwBTI4mLaGLvq1oOP0sCacY74GiFpiVN5DDERB5Zi
         9NhsU49Wp74ThccldqrwcVqYbzMN0ig19d7ZlEMUjURSv+cTk8bIGHXG6uGZHMiT46RG
         hwf1POQD/5rrXEwVmA0oEQqg8I4cLl4FibJFdUu3vH9Y8kRqwu5T1CN6zY46nqz85dXu
         RgIGFfiilVAa/Mf1ZhjOehmQgDENVyQlEGIEDf3bT6Gzo7Ww7+F0W37ut8EuQX+Q27cy
         /RWQ==
X-Forwarded-Encrypted: i=1; AL+hErE53HXCY+K8CfY5/cwJqHWdDXArGQw0uChq+0djkykwYN0MKhyBwVPTrOOEXT89OTuV5CV03KKf4hhHnS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/kevBSZfxmryx2M95fXFq8oL8XoX5NdtKr7MMp52V0PHMISs6
	d1+huSX8rMe5UPp9kl/Gf7SVqDUaXlfuTsCQNxgf/WVyev+d+AJL2Yf6UH/wpQkPYKE=
X-Gm-Gg: AYBFou2ajtxGGxWvIeBbL1nZJ4oreGeVS8bggnzLGkRp8lRoMFy/Q7nu0c4QgvHkQxH
	ezKDks7x1QmYckkDWVdoCCgC2L54+u9rRIGZiq9RJp8HvlDxvr4626zeoptoYmwOylL4wkQxxr+
	IHZZ2WQRrcju5H7BBsErnliYNVs7gdRR2iBQaiaGPD/lyIgVgN5PN/ULZVS+Z7fSzwnpJ3RmGxU
	Uq2a81GltyiZXkUWDXofwD9x2I19eMtQkfVk/5Pl+NI21huR0QDhPawXsl2Bpcu/By/2dA8a825
	/LvoaxxDNyKUbPiDI97D2Xv2CnobAEldamk86NVvyUZ9/ksF27me77W+0W13YhCrSc9EGVKS7+r
	HP7/PiXEJqS8Or4ylNm9cAOjlM1ZvWn9MigFtx1E/656ZJrLDJzJkf78Lrns09JrXbf+l6YL4FL
	rPpjei3N5+/0zCC0athkRsq3tAjZSz86lMg100VRid22QuLdgmSu9jwTp2hO7Qxp++wBLtoWcgQ
	QHu640pa7+qNGQ+GaxhHTfuP+SdTFDcjRJU8D4Tc18RWIZyJwp/UJL8z/Yba8vhK2xJ0M0miQUH
	fGeaC474GqfBfT2iQrawrU3dDeKCWBsBfHqKbV1bHSwNb2em81BSAFsK+e3rHww+BuNMLQ0Y0gk
	VsvklUP/MZxI=
X-Received: by 2002:a7b:c342:0:b0:4a2:f58:9a82 with SMTP id 5b1f17b1804b1-4ba08e16f94mr38360965e9.13.1794403904169;
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:43 -0800 (PST)
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
Subject: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 14:31:17 +0100
Message-ID: <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
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

Add dsi node to the i.MX93 for support with mipi dsi panels.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index e926b6360a9d..1123e372eb79 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -58,6 +58,39 @@ npu@4a900000 {
 						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
 			assigned-clock-rates = <800000000>, <133000000>;
 		};
+
+		dsi: dsi@4ae10000 {
+			compatible = "fsl,imx93-mipi-dsi";
+			reg = <0x4ae10000 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_MIPI_DSI_GATE>,
+				 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+				 <&clk IMX93_CLK_MIPI_PHY_CFG>,
+				 <&clk IMX93_CLK_24M>;
+			clock-names = "pclk", "pix", "phy_cfg", "phy_ref";
+			fsl,media-blk-ctrl = <&media_blk_ctrl>;
+			power-domains = <&media_blk_ctrl 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dsi_to_lcdif: endpoint {
+						remote-endpoint = <&lcdif_to_dsi>;
+					};
+				};
+
+				dsi_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 
 	sram: sram@20480000 {
@@ -183,6 +216,7 @@ lcdif_to_ldb: endpoint@1 {
 
 		lcdif_to_dsi: endpoint@2 {
 			reg = <2>;
+			remote-endpoint = <&dsi_to_lcdif>;
 		};
 	};
 };
-- 
2.47.3

