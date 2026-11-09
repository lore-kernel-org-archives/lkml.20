Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227045;
	b=DkPdBs6D1qK9SFUPt1eXYUgBKZ5ZhZgfgtfbsJ0f5D9Q/hMylZSv7f2Go2EMsk4BnJUY
	 jPSy7rLxcTIfxZ2kXf2Nq3Tv5osFJFz+KDTTpTMAI+MYwi1tvVCpqU1VT5DngWkt1q2tZ
	 o5a5HHKx190tofRqKsFqhvEpGRzEfV2v5VKFfI/L2uHqUxgMRs37A2pinQyaHXo50wpVu
	 /CK+iJ5PSuN7cE7WD6gw4tExEKZJ30UcRFlV7mvmA9wYQPqhDqOkKFLfEpE85Kov2PqAu
	 8EI5zev3fjSA4PZ5WTXk8ka3Im1xTIN0n7zwv+Dujj93Lfg0P2zfkcAdQx6JEH2HE9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
	b=RQZcDRbp+I6z5h6P5SsLb+/rWx4FPmzT0JP7p8nAMGU1Sn1RFpkPtjOzUae43TXj1/By
	 QtVjmWtPqzpcQbb6lLnSVU7D4jxwFPSIRVlA9FMStQJZjgycZCwh/60BffniS+eVOF/Pi
	 5636UhfcjsKdtPAghWWXqC8rDKe0IZJadJQoTmmVwGrzGxjS5uVmUJUkO/4Z+6LFKOW7i
	 pKKdwd/z+uONuKVgIIqcFkAmJcKbT76/m3kvfMQUZS8h4L+6aORLNUN/NPuOTgUic3U4V
	 wOJaYESXmeeUAZPXGJNWP9rqlR2GZSeoCfIkcjbNvJOtFBvHL92eZe9+ra/Q3aZa6OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aMXikT/1";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814B6082BFF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0814B6082BFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aMXikT/1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5596555e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227043; x=1794831843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=aMXikT/1i+nirRpg3diNLBj6e61GPmaqVh9Rgimyrs2QFUjxAmWOBk2yjz5SYdyRmX
         LuZGZ8P06KuM3ysMB8fFwTmHbLID1TtdVKMJ+YoBYmwTHsdoR42rUxUfoTa5H8YdGwPA
         Sepx8ZDvT1Ia89rn6AYfla/8Kdq7yb0Fx0Rq/74i9CI2YCqPr02MP5+qnZJKduVL8jrT
         MYsnRlBhEswTpuICt3J+QQ8m/xV78Hu7BbC1SbzE5m0xg3mwEBcOJwJ9B6brm9P3DoCN
         uegC1mSB5Zf3moubtMvVPzx6TSk7fkBuoQl+c9O9CI3aV7mIiN7cI8eWELW8D/ObQbJm
         GpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227043; x=1794831843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=wulx54cYt+ZceR2Rr9VEaXQVW7UuD3gx9zCxnofH2qvP7tDZF1gt/DldCbGB16GVBe
         +W3PV1RnYwlXIp7lB9r11ZEGQYKO2DN9WITWqbyn9fOS3uZhSURTKHus9DeFcdHIy/jd
         h9gexjSFRhIOQI0GC0Z11v/4oJiqzclHQul/oSq0fucbK/25qwIppXF+kUL9yl+KdAde
         +d556ME16jcaMI3aS34cRbLPgCUOF5A4qP9HKDDxdl7HmzcFxQKkwgdIMWVoOndVfbaR
         xE0YZhMmF8bsjG8+M3vL6AAVqis4rtIC5AmwtvPcl/6XC9/NDJ6tBPiUyJ04OcSoGlwl
         lS5A==
X-Forwarded-Encrypted: i=1; AL+hErGAWGgUaXzz+SGmNZm2HPdnKdPIB94eJGDoEtrI3OlIi/LiNc5M/pf4emErK60cGcIRdCSr4FwObk8Fx8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jaG/KdB4XPaQj3+zaAA61w2elQNr1v+G06GV8WdqzW72zGIiR
	KvEPUETFVkiNOKQXC0l9xceZ75H/nxxBPMDuYwpggOtxJBNRSZFwJ9GvWGaQ1LFPxfg=
X-Gm-Gg: AYBFou1WGHPCl59kS2WSYWQ8lou1/iLqnJTrBcDrHpZvWDjEgG9maTFtmJ272KMM9Au
	5SSiYGOVZfz5APjoR+kf22WPMrL16lPoo/jsMDfw54pe+ypxonhzBjDc0Yq6hcmtzx2rPCtWnRp
	WjL+BcXzDFpCoyNrdh6Rw+pUKtoLRvEJESNxWV6CCt8uVeLb/FwPJUZsJjZphjzQS4AlQj9g6eV
	l5noGC9tz9mrrl9629t35+PHx56jdJIUM+pmjH0V2fxDE4DqsFRotBsDjEjR8dJKjT2pFetg7Ci
	vBn2MI27ZegiG1MCqEv06qfwohhX4kzaE+PYl3aveGokX8m++rfgCLIIwknDA4k3hjTTKKQd4nv
	PQeQVrZTDQ2Y0wjTBxDEvoQfKj471xf5CZT8tMTfXd0k0aRPgA0CUXhHxvyGB61RqsWw1ZB803Z
	YnGG1Ai4oKkjmNyqLQvDHfjsHVLPoJR/98qJXEh+uESDPdxErgF7uDQdDy5FQfgRiT2d8/HygRx
	ibgGrQIlSjENCLDsKXzB0yHF8K2xuySVPc+3Qubp0mXS6mQHsXONTsLaMdU7xhKD1bdt58OwmWl
	pIl616b8GCKY8i9JCldAlzA/9b3Rs8rhWJdCnTr9bHG40ezk/GH0ZBQ56ybFjoVt+CVNz1dNnN7
	QtqABISELeA==
X-Received: by 2002:a05:600c:8b70:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4b963c73ab1mr72661995e9.12.1794227043509;
        Mon, 09 Nov 2026 04:24:03 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:02 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Mon,  9 Nov 2026 13:22:48 +0100
Message-ID: <20261109122250.720757-4-frank.obergfell@bytesatwork.ch>
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

Add dsi node to the i.MX93 for support with mipi dsi panels

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

