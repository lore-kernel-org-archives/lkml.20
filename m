Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843190;
	b=elkyZOd0PAVpyIBSI0OSiuvvElIMtXMGUh68yrFpOPfN9xZQ3tcmGMEjpLvLOBrqJtHn
	 ETmUqqEq8kPbgb7nWnbkrUwEayIlPEfJ+2Afmd4djxmMSBa574q2KNN19+W+3qy4XmCG0
	 s78EWO5W5hBbieyMJdV/RNhHhlTj2FrWlYtk3vCLl9xay18joyFBn4RYfq5U71tf8M2hN
	 EjUhRQCvkQJrzEwZmy89vubEMRwq5TeAV28iOeK3LGqcU4nCTbEv43hNPni+TsOPjqP/6
	 7kJlr7Bw126UQoKFJC5QjtVXih86bHqaOKdJNdf33wsdv5jvvGBFN1E4o80caSYaGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
	b=Tz8Yk8F4K5bVe3lx0Naw5TldYZoR2e7GD+osPW0/lB+ytKLSjLJUH+q2v0z+u4gsHD9i
	 P6ILos0PD7lVtykid4hJC0Yeobiu5cLFZX9Hjb8xPagkaaPNbXwOcYXHRfo0yZENeH+wc
	 NzFh2TPnPcbm1GS0swO9mjTOSbxlnvYGXqHM1nCvKC8c9ZL/kyy3cyrdBsm+W/633CpAw
	 ead9DGU5Dc5VUt0fCMyJX4QetJ3C1d8P4W02tjOgNbeXsRx4Gd509utZM3HpxsJm+j9Br
	 MKCp/O5EuQRUWGx90z/R2CLeJwIpMaAE8L6yzyxOXVbd5teDLoQ8oQJCmqhrdmc73hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUYELq1S;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39470606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39470606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUYELq1S
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20050405e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843189; x=1795447989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
        b=oUYELq1SPtFfNTxWfBeeumYdjCkNzVj1iSWVVpu9Uc8hStEZTU9yVTMC0rEvBGhp0z
         oqISG4ts1WI2TMzmV/IzCrfohGqLnTOE1t8hGEAXOQC3QMvPtADUtIuEDu1LS9c9NuIH
         P7A6Tg5cn4YMb7tCOaJ+yqdpFjDdHCqlV06maRe/TiYdhXZOltisdio5ng1r2d6WvGPc
         WlaKCAl/YtWeyLHyI7s5sNjvudIgxLqhnCFo+bpPHSjBUbTyy6xr8poN+MQI4f1Zk54h
         VS8FLdpGFg8LP64gnw/m1IJ3LMK0WiOpWvnL/nXS1arotJwqARJs8NSQ0yhZMcgAh8zu
         kIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843189; x=1795447989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/ThZEAwDdMnIObWDz3GVS4c78zlGkgBTeVD6XHYglY=;
        b=dNXsKzKUaW/OdazVLDyntKe7bNoiJ8fTgaqrRnAAeRJR9u1H8Dzax0e4s4oESnljXD
         NlcYL5FmbYbF/wVpSKSIf4A7nhcXgNGRsqmPanlepVHy/ytXV/0DJgDeRkRSVgfjyvbQ
         x0szHkGKGDjzZ8KQ1FUGRjAOH4LcwTNPjMA91Lo2qIaD1lgWxSXFBCQXO8NoKyEYcOFS
         GEQE693IHRMxI9vPeCOvEKr22rtOFoTnuBBR8vAB+zdKBfILMFOzb81eH8VtpVAM44wi
         mUIH+QIKLQSsCl2nVnLtrpLWmVfUYMGJPVIp0+1LwQ4iIjKhe+1WSk/oZqlr0SnMJtJ3
         LK4A==
X-Forwarded-Encrypted: i=1; AL+hErGoU/w9WAlmFCtLNpi7zma0G8aamHmK5NJlnaxtfe62JppEbwWFipQmHxVHphusTeqeGV7lSUnATZh6oL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GEiOx50X1Gr8B99oOY/rI/TVBogsFf8BMiLWIuL8Ldp38d38l
	sW5XVZ23oHmwDQstGPbH2ezj42gC2F5Ya4WtTz+kN+s6jgYz7z0k+AKb
X-Gm-Gg: AYBFou3bU9S20kFKYtK5TUbOZKGR3w1lnrGg0UjfgMk2JWNKYsaJFT1PbQAj5F20UvZ
	R0qwi9ep3CAu5lXKLL96y5y1o/sZWaZ0upQDdmvhpFBbwz8tSILqXMh1PU0qvZPpQCicd+AsuAv
	a2UeX2ykLz+Shb5vBssGqzVAdweF3YR/zlAZJAy4T1sGwf0DzUUdk23Ai5iXmfHKmLaqeIFLBLG
	zlZsux7f5hXcxofEUegQqBsPEgdigrj5TIaL+RmJeVjfj3RCzXhHrxq8f18L9D4QdQiZ+KI4/HE
	KnuLSFM8ZMg+qicCBgQBdg+SxcBxPNqalHsErufmva57OxBi0y1dAeFf8IazTFJdGn9qlWzdPHk
	Jsn6uHIapmkeqX/4sCCRqhO0S6AftImSfjZXOwkZJ7yT3BZ+cfwxqqhBTPfC1fozijMHMwdtcC5
	6xGxL71ePACBZ83H9OSupe2AhT8M5McTGUci49mm87YUkAnJrFy8nYxIC8bQjGo/krzweei1ANE
	JgURC78ydcv+AdILglG23lO4TjroV6nnvrhZOG4YBobH7ZcUNyPZ4PAaP3eLmoTxGXMoZwneVHH
	ss9A0sFoTnPPmKWyKzCQruNirrojQhDEa5NmoQSLHtxlF/Zp2nughURilD/4Blp7EA==
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr167039245e9.32.1794843188567;
        Mon, 16 Nov 2026 07:33:08 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:08 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 15:33:06 +0000
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 CANFD
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
Message-Id: <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=2488;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=SlQdp/xtduEIxx0pMtkmUmj3788ItH7g8oWcHzROuzM=;
 b=paDL9ELG/I0ILOtSq6Lzvim+LgrEo7oa2/YsoCu9xRpFVnS1XLHyJcgKQcs0Mvbw9tfAqlFK0
 IjdxH+ShC+ABMnu6goPP7c8ajGkU1wBUGGYqJL+NHWSYJ8aj759wjfz
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable CANFD channel0 and channel1 on the SMARC carrier board.

Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
since it shares pins with the DPI interface. The CAN transceiver's
standby GPIOs are conditionally wired up based on the carrier-board
switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
   signal flow order.
 * Added missing check for !SW_DPI_EN in standby-gpios.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5f5441c47335..7804a903244b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -13,6 +13,8 @@
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
+#define SW_GPIO8_CAN0_STB	0
+#define SW_GPIO9_CAN1_STB	0
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
 #define SW_SDIO_M2E		0
@@ -87,6 +89,38 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&canfd {
+	pinctrl-0 = <&canfd_pins>;
+	pinctrl-names = "default";
+
+	channel0 {
+		phys = <&can_transceiver 0>;
+		status = "okay";
+	};
+
+#if (!SW_DPI_EN)
+	channel1 {
+		phys = <&can_transceiver 1>;
+		status = "okay";
+	};
+#endif
+};
+
+&can_transceiver {
+	standby-gpios =
+#if (!SW_SD2_EN) && (!SW_DPI_EN) && (SW_GPIO8_CAN0_STB)
+			<&pinctrl RZG3L_GPIO(K, 0) GPIO_ACTIVE_HIGH>,
+#else
+			<0>,
+#endif
+#if (!SW_SD2_EN) && (!SW_DPI_EN) && (SW_GPIO9_CAN1_STB)
+			<&pinctrl RZG3L_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+#else
+			<0>;
+#endif
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -153,6 +187,18 @@ audio_clk_pins: audio-clock {
 			 <RZG3L_PORT_PINMUX(H, 5, 6)>; /* AUDIO_CLK_C */
 	};
 
+	canfd_pins: canfd {
+		can0_pins: can0 {
+			pinmux = <RZG3L_PORT_PINMUX(3, 2, 3)>, /* CAN_RX0 */
+				 <RZG3L_PORT_PINMUX(3, 3, 3)>; /* CAN_TX0 */
+		};
+
+		can1_pins: can1 {
+			pinmux = <RZG3L_PORT_PINMUX(5, 2, 3)>, /* CAN_RX1 */
+				 <RZG3L_PORT_PINMUX(5, 3, 3)>; /* CAN_TX1 */
+		};
+	};
+
 	i2c2_pins: i2c2 {
 		pinmux = <RZG3L_PORT_PINMUX(A, 4, 4)>, /* RIIC2_SCL */
 			 <RZG3L_PORT_PINMUX(A, 5, 4)>; /* RIIC2_SDA */

-- 
2.43.0

