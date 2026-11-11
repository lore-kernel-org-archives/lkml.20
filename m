Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384792;
	b=DHiWbPfE5Te+CrA4eSqm9UKxdsQlMWMXj85FOpjM200mQgPr6Sc3Fffvx93vYseDjuIW
	 H86W76T/YGrCtopTckrf4aLXdlqqheqP0Hsv+0lkknWtMB3OrwyqqV6yvxw4dURqErVq5
	 NHEPAnbS0f7tJkrsTbMNDyzxkO1Bu2UIyPYq0DHjl1zaxaMWZ4GCpzTXNKdgDMFjKhZWP
	 zIHzsEI2Y6+UaN/t2Hxx+W/z16QRhgG9H6KhYNBf499N3iRBz+fFLofBM6ATpn33u0MhO
	 c872jS1drdjXQ3NwJmSkc3WWGs4og0/dmbKqEkHjivjH7U5ziUANHvTj4YsJ4d2XAXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
	b=oqiN72x/Zv2+UyILd3LJumBOe5kvzimsMPH6Df2nswXYspzAg8KE3R0f2UCdN6ReWg/U
	 c/97Tkd4C69l5JsiG3r2BOkSaoarGuOkMGfc3SgaExSe07ZAsDnkXnZrrPPjBMR9aGinT
	 iddKBWDqHtZYqg9EFljfg+0weGJchTEYq3sMUvaDNLFcQuNycMEbJqU8uW89Z97sosJI8
	 Brg1MR0rG7IxckKHh8dOmUQb90eREEE/3K5GIvqQRQrEoYLvPqj2Q9jZyi53nFWQahMKR
	 A7G3m66B5s1+Em7lj8FiHzHpMWSz/zKd028Wso/Kz0fBCPwkW9XTZ6NNPSx9Kx4WKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aZmFw9jQ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C87D60A261C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C87D60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aZmFw9jQ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a208d93758so30926595e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384791; x=1794989591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=aZmFw9jQm5ocbKm+MfE6RsR2KEAhnRCXokz2wChJUPowgm0UF7AtO0KwWfjhHbDGjI
         l69sBPidmFk8Mtb0FbVrnpF+0QsJMVQ5EkXOCc7O/JRTHPkqjIRlz7tRLsB4Dyvp1Q81
         7otq1ovQg67qdY7R8N8Im7C1uVzoY/qVEReha4T51EPqow2MhdTl+9T3QTAwmU/7dd7q
         hYwokDpEuBbB/IlHwsM7eVP6l61FvdbN0Ce5glXJA/CCwVtfF1n7tOx8KroImABmX6uU
         pNU95P+/sZ+JjDmkgDSEE51epRg1cc5/RHEyvCOcYmmFIuT6OFUqT2vOiFh6ojkAOq7M
         TVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384791; x=1794989591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=OohHH+e2KEBd+YBeWWuXX6dR4fx+E48Vsd46Z7mb0gO1ErzyxHFEhWagQDGV9ACBm7
         p8N7lIes3jmWpxVf/D1UUybNSYrey6lBianHraw1yPE4Eugjz33CPp+caix7TGXAvjvf
         sIfYpUnmpOBfVXdvuClLUszYKDWShMh4L1Bc7ptk9dBPeWtQYKES+ZQQ1XeU1Gy/EHgt
         smHGV3GZHfGOPPYWythbuxxEOBzc4O9V7eEwzrDItNzRbJFqtPraNCKPTK9RpcOwzG2D
         HDOHjKBjUQir1/qxmKg2ZyRAYxHsVu9pqFw+PJiMh/asQgera1L05/TbzVEAKK4B4eXN
         9xow==
X-Forwarded-Encrypted: i=1; AL+hErHrpTLzi/908Yw8JTGzdejuEJ5XoEcZK5aCIyxMfLmdjbv03qWuAKAyttTkrfGvz1FlMko+vsMj8iMKPro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VqvDP7bANaDm5/i1pWhMsZLiwZ1UcBggH0LcCyVAQkb3ORNp3
	dKar7hfkz1pdxZipcwgpQ1orrS/D2502MOzEqtXFklV0FQz14NhSI8j3SgpO9hqSUTI=
X-Gm-Gg: AYBFou3BMEq6B3QfnY84/Gj2mcRVQniGANmmvpI+6trtCTne/idstXZI2yp7iSAh7IP
	C6p34nTNhiKbEr7HqaL1i6FCq4qL7RcELq8bLVWzsNZGQm5cpnl374XKddZV7o0px3gqHHgiwaM
	J19G8YV/5kGbSxiKOXbwODgOT5iOCJT4EVRRVdNEWK7i6kJHg60umF0T952ZT/1sn4CDwGhJGzr
	UbUfFJIqXkLQ1yAByJWxMtfnY1k/x0EYZUKuBvyA295UZgZ6DJOT/4FDYQSO3q7C6Nu+alIipwI
	Fpe2g1PXV33iTlb3caw613FDWXMuGm2qftsv1KWShXV+AC8j/hX1BoWl/BruU53TEjSGnXd853l
	QdBj5Sgzv2wctBX934oYFeruCrE+0u1XEW5uROHesnQCLju0U7AO3tCKpo+w3QWYjDvdu1bWf3i
	uF/6yKmztSDM/gFDsleGewwXtdSNjWgg4vLo116kLEdC7zIDgAzDXKqzJ8X1DeqGcRqrumFLBX8
	KFY+QCGFM6ctgQmEu6aupvX2XXtnoAEPHV4AtPHg+3Fa7Qser2S1SpUKbScjXUyNZE3l9Ne4UXX
	eqjncbs4CpRHmtCXUJnz9o/2mNllVqxWXeE+8j7jYEUnOAoNFxIYbbuRXiH4G6DCSB5IT8hO/T0
	W0SYEuZCyvLk=
X-Received: by 2002:a05:600c:4704:b0:4b3:8529:eb27 with SMTP id 5b1f17b1804b1-4ba09389f82mr26248335e9.27.1794384790692;
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
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
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 09:11:48 +0100
Message-ID: <20261111081150.950272-4-frank.obergfell@bytesatwork.ch>
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

