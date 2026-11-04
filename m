Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805318;
	b=jfBcDw6iI0YO9n+g1H5f+fEDJv7LkyMLA2ITG7zi9/1+J1IIkYgEmdENYrGVrlYJStW8
	 yShk6Hvkh9CbvNrgZ/B227X0zUfliqSkHRyt9eTrjjJmMZQWF54OoiLFihqMyPR1Jrfvy
	 NGhpBisIpr0v92MkProuK6cJTugtWkSCiskxCHtcNDmceFYmICe3rGP8BSo+y0ZsPLnXp
	 P/2vRO86RHV3105Xpc94QQsVnbvcYGjpb88zeCFPBRX1296q8YynOIcMqpgYr7qx4/02C
	 Vqh+2dPZcQH9yhoD0BftwnlE9iwFT8X2gSwtLc17FPiXyUADbd1xvIC1+qdGJDnMU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E/fC2fFGisZaDoaQ2M/6N54bF3u4m4yJgqdv4yUEuaI=;
	b=B0nRbyfoOnru8rr+XTnLkx/5KGZfUNr1n7CKkPckksVUTB4htBIJEC5oysEb8XHBoADo
	 EAzw86FGoUKjTBV3RasGtGeth7Pm2/2duSfYW+FNLFKRT0BjnQkIgLkPTUqctq+hKb5wr
	 H/yS9T/DHBWvzevHkbtHWMbUGbdAIqCLNyJHMegTHACzcpmjZ5EBU8YEKflHnCqXcOm09
	 w1Px1U/l6FxsnLhgZCGAr9Tv9pFzTzocKj73G+/JRpb0Tod2fsWvhIqbR+N2lTpFnJxjp
	 hmOxwIHJLIJyVxw2x3rBou6aHrs//4mjKXitKtKNB7IWlm0p/+sCMiVzXotHDoq8/1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLRU+Tdp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D26606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D26606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLRU+Tdp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48fd2e38825so599435f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805317; x=1794410117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/fC2fFGisZaDoaQ2M/6N54bF3u4m4yJgqdv4yUEuaI=;
        b=WLRU+Tdp+3pDCB6CjUfwuPkPY0nJLQgd5Bb1pIzuW8ZPL1XCMQSDT19oGhb5X5yxGo
         0c/EnzWMc1Gjwmy+MSd4z8yHlU6MXCc+KjYNh0PLKXVtP2rjebWnJuKD/tdfkROEDZ+P
         rHPTuZExhJq5GPGUphbtKsh5Y0HrrO9qj57qep4mrNP+j45SsVzJe+5793q1CLeCxnKZ
         jJc+ObI2ypj5hP+gQpKqKhyowbf9uCjDYvNutZBl0gG6GW0afUyVFdMBgBttwQlK/w2V
         A8XjYXUptWGdzYZ4La8iPnom0sJFIjRiofLhM3CM4wSAZ/nsB56WkWOLOrtbO777i5bs
         l0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805317; x=1794410117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/fC2fFGisZaDoaQ2M/6N54bF3u4m4yJgqdv4yUEuaI=;
        b=UQLGsNrcDK672rUi2oyWdpJCQogT/SQLsShPfx/AmgxAXgUAhoibrjrEKJwdx8pDcM
         xeRCjAmG25JE5SXiBDOc3EC9MJ4pgyVN7Wm/7PEMLjVYQYfd7+QD6dIo2Zv9NHmjxZ7O
         +DR0rR1VRPpF7dho5elnwlexCI32tLUhG85DL6OtStVF/WLVoJQecxHVUWSYv6Q0cxwl
         LGl98V6RA3tpng7B8rGpFIudDIGgLWT+m1q7ouM7vGqVxiq5b+rHXYdUSQT9uGdOlFq6
         GTY/EOYcLoN7h1y9dLuDvjuuHQPuGEGjud+JnfHkoAqZnWhLkcXJL1MGWjuSaKIanPbT
         GgFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC7UtGKsZA5aLI59d6BAklNFdtE1FkJbJCicCMCmMvh/fP1YhDSlW1iB6Gu+bPq9XMUAp0LhHQL5qDL2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uCvj4QlpCaYWvFwujuWQFib6r1TQwn/Pq/DJwmxiElB/RMhrf
	VjNfng8F+BT8vG57mi2o8IuS+rKMi5hmM3DhXAZlf4W9tZCIxiHycdJc
X-Gm-Gg: AYBFou14gYTKBEHzd+G1dcD+e2Ejw+OxiJQsZ3P+je1h13BbnDP/tRYhZR+f7ZxQF0s
	m4lGO+9ncjhg1eUn0h4NK89A7Fa1nY/6dD/EeeyHDggKWhc/Yn3hyin3wRssYkNLvu67lKVn87Q
	fTmLNwxMC1tc1l+2nJYGCHu8lCwU93udztbUm3XGxYoWEk/GLTcwMnAh3OCFGJbHamGb7vhZMnH
	D1KFsIcVN9QLVhT+ApOoQCVXDCUuYhTnxrXsZihIUZ6IZjvtg0KFm9as8IpR5kKng4QEVZgbxAN
	L+AY6dqd2WecDe5vvhDauDSsdrH0HqF6dEKV93mcNkV/o40m2X2GBEX7z1FjppzQheHA4Utkj60
	tdmH1qe3VGqvRNupPmFP2n8OFcwS9zg/8/KshXvXmaX0iKhAdlSFeqlViLA4LPrMwC1v+TWwnpZ
	ipQClj8knDxgGaWAvkcsooqhM6uyID15h2drpTCF0p+o9TCcplTUpfJweVL+UTMwpT8ZGCR81+z
	FoaAZSixzWNb0LCIhJ7hk2OxNsRD6J3YJ6zMuMH9aCiFcDlPOU2mAbPRodINTHX8zhlEtdt+7t8
	j1lo+wOn5cs6z+8IFC2ShmD/I/Q8J53lIiPtZGKMD57/hxZNYUGAzK0vpHvaB/8+JQ==
X-Received: by 2002:a05:6000:250d:b0:490:76de:c78c with SMTP id ffacd0b85a97d-49076decb07mr2812629f8f.9.1793805316530;
        Wed, 04 Nov 2026 07:15:16 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:16 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:11 +0000
Subject: [PATCH v8 2/4] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy
 device nodes
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
Message-Id: <20261104-usb_rzg3l-v8-2-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=4175;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=5VvLyGi/TtYzIa3NV+rO+kElbcXZqOG+hF1Kq89+y6M=;
 b=q9p3GpW5Zxm4R1S2OxNnoguGWnDsbH9q6B/rJUyGaPE1XTHtIj1yQiGj48yyShbafzH+JbKkx
 B5oomTmaMWGAo+eVH6WsgOZuTaDe3wYuMIraHE9P4LCpGTxHSI3leE3
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Replaced place holders.
v6->v7:
 * Updated commit header
v5->v6:
 * No change
v4->v5:
 * Dropped renesas,sysc-pwrrdy property.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 92 ++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 35046c7dac54..4df290c9937d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1301,24 +1301,108 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
 		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e10000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11e90000 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e10100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11e90100 0 0x100>;
-			/* placeholder */
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		hsusb0: usb@11e30000 {

-- 
2.43.0

