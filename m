Received: from mail-pj2-f33.google.com (mail-pj2-f33.google.com [74.125.227.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF913A7F68
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535985; cv=none; b=lZm5bfyZpVCW/F24eSCjd9lDbr1UCnUge2XVLb5GfOY1josmRW6VaEb2D3GAw6h/9iA0wmp5MNA0GuOxSuqgnFn/WHznz4/7OVdEYC5jBL0LJHVoyPEBUR76lQdDQ9VT3/24aQGtUqL95ldNsrzrxJgyQmFptyWI57oKq/DYLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535985; c=relaxed/simple;
	bh=WgMGniVVojHFcTV4ie1ZIvD+esdcbCOoJWN0+xyuU8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WbHymY5IWQwm4RfdNww8wt4wNinfcy2HUO4sxFM1zdBi24RPdkCn0oOLdwlBQnrG+lyPbttQm+29eVFv/Evs2MTuzlEDQVm9o3VxvgZNan2dErM3lytLvgRraVH+s+9nX/lX1rNSul4NtOOUlIWc+9Lv5uZC7zE7DlmcDTRaoBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiEgH/ut; arc=none smtp.client-ip=74.125.227.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiEgH/ut"
Received: by mail-pj2-f33.google.com with SMTP id d9443c01a7336-2d747ed1368so5609795ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535981; x=1790140781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IuUZGoiNHCcd6WaoCznRINiS0bC0Kq9wMArlqVtdSjs=;
        b=BiEgH/utysaq8fG2Ky/83aGEJWlSaeH7oOIDqAxG6elbnef/dQK05TB+5OO6UYpXH+
         I1xy09pKSbRK2k2/yNPUsc+tB2VsNhNDnj6kLZ6I63KQB6aVRD2ORPaP67/OnZAoKcXT
         P3QU2K32/MwgfZJPXHnfYt5Pt/dncMnJ492op8dR1rUm8N50huf7a9ZJ5JfQ7HkaYbJL
         baux2B7xh/9nO2Z3AKV70tuabT0ago8B5ST1ZoKmYItA3oIrDwgkSrx5/C7HQTlghezS
         hla9JlPmvfxy5Sboh+bM2wxRjrZ5OSvVnQt1SzghiIPufXL2FcV8HQIaFyvvrSvhr1ru
         4zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535981; x=1790140781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuUZGoiNHCcd6WaoCznRINiS0bC0Kq9wMArlqVtdSjs=;
        b=TJ3NCPYGUi5GapUK6EBFuYOZxQehbgmy3ADDH+8dDurIOtYkch7GjgRH3gpS4R1mhb
         meryVZ5tcU5W4KPOBy/OjjFEr84Upa+SsSMqGqU8sH8OG/y6eHRnHSZlvf1kl82EuzMY
         2vLY1cOO1xgkyt3/rmMVZC4zPJU3x5NCI39pYBKLGbgw96ZeXV93qNwnz5eNQ4jpBNrn
         eRMnBEcDnhN61D5rdEBLg23aLW/hM8s811VObUqcndNBMDr3m5DhdsfXXrSYgOUNqgrk
         1Bwy7vY5IlVy16n4LD17JFsP1EfdAS+YT3cqOrN3yDik9TFRlKQZVGQGU8uVE+C7xllS
         rtlA==
X-Forwarded-Encrypted: i=1; AKwUvBzIMa/e96S4P7spO43yze7q1y4tdgeXTfMAVhnXiUrE95hF5eKn9FavBDmpgi9kHBO9n8LLuMNp0055pT0=@vger.kernel.org
X-Gm-Message-State: AFuF++mavDQ0uKiAkaZzo65YAjk8KFvShmyGuw5djFes7wO0L3rdehba
	tYYgOa1gx4ftgTiCG61lD+hrCnBKq0vjAv6H41UYY52hK7DyAnZn0jSAoenAtA==
X-Gm-Gg: AYBFou14ER+KVTEUWffK6hQeRsfjFcno85e5rRE7yoBs6lrBhriMUi6y15iTZKuOJWE
	IjYE9wq1x/FrJEqfRJZ12Um1R9cFiy89YCdQwRHb0bTtUFU8LsDha0psU84RUPH93XoJ+mYemZG
	8Z+u3iMXXonym1XSy2kevJLmr4P8+99i/qNA0K5WCA+Dkd1KZnwUNzMIxZSbgutGgBwekKjwbvc
	HWjMIHZPViAyRN39G9SRqZjggr7aDa6LRrTPFTJqukzrEMmQxTb8U6QIazZvzsJRfiPcK9p0oIA
	YHBg/C1XTvgset2NRO3Eaa/HOHMivwSljVzDqdx3c+HUPc/b1IYKtPz9B1cFjBcT7kyfLhUbUZ7
	Takg5xlu4REhqXWrY99lJ9ilBatasl8abLjmSfVXywwxkBxbJdSsJo1mjIeTc33fxqIQOFXxdU4
	q6GM1kCpA/rBtDm4RldzSn4DJT7ZkDBPjokeWSDV+3nLfAkHA1VLhykSMPpbMI51oMXfDEJIEBQ
	wWtouQRL7wypCBcI1xfAsqun5Jc0U262T69oR/tM105u82CSUtwEtTa
X-Received: by 2002:a17:903:1251:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2dd8e752f13mr25316615ad.16.1789535980862;
        Tue, 15 Sep 2026 22:19:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e92c0fsm5325165ad.23.2026.09.15.22.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:19:40 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mkl@pengutronix.de,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4] arm64: dts: nuvoton: ma35d1: add CAN nodes
Date: Wed, 16 Sep 2026 13:18:27 +0800
Message-Id: <20260916051827.919538-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add controller nodes for the four Bosch M_CAN blocks found on the
Nuvoton MA35D1 SoC.

Additionally, configure pinctrl and enable CAN1 and CAN3 on the
MA35D1 SOM board. Also, update the APLL frequency to 160MHz to ensure
the CAN controllers receive the required input clock for 80MHz operation.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
v4:
 - Add hardware reset properties for CANFD0 through CANFD3.
v3:
 - Change CAN clock to 80MHz and APLL to 160MHz to use a higher multiple
   of 40MHz, as suggested by Marc.
v2: 
 - Move assigned-clocks and assigned-clock-rates configurations of
   CAN_DIV from SoC-level ma35d1.dtsi to board-level ma35d1-som-256m.dts
 - Update APLL frequency to 200MHz to ensure the CAN controllers
   receive the required 50MHz input clock.

 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 56 +++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..e2d3fde1dab3 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -39,6 +39,22 @@ clk_hxt: clock-hxt {
 	};
 };
 
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	assigned-clocks = <&clk CAN1_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
+&can3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can3>;
+	assigned-clocks = <&clk CAN3_DIV>;
+	assigned-clock-rates = <80000000>;
+	status = "okay";
+};
+
 &clk {
 	assigned-clocks = <&clk CAPLL>,
 			  <&clk DDRPLL>,
@@ -47,7 +63,7 @@ &clk {
 			  <&clk VPLL>;
 	assigned-clock-rates = <800000000>,
 			       <266000000>,
-			       <180000000>,
+			       <160000000>,
 			       <500000000>,
 			       <102000000>;
 	nuvoton,pll-mode = "integer",
@@ -58,6 +74,20 @@ &clk {
 };
 
 &pinctrl {
+	can-grp {
+		pinctrl_can1: can1-pins {
+			nuvoton,pins = <11 14 4>,
+				       <11 15 4>;
+			bias-disable;
+		};
+
+		pinctrl_can3: can3-pins {
+			nuvoton,pins = <11 10 3>,
+				       <11 11 3>;
+			bias-disable;
+		};
+	};
+
 	uart-grp {
 		pinctrl_uart0: uart0-pins {
 			nuvoton,pins = <4 14 1>,
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..b3b8c8673a2a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -244,6 +244,62 @@ gpion: gpio@340 {
 			};
 		};
 
+		can0: can@403c0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD0>;
+			clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can1: can@403d0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403d0000 0x0 0x200>, <0x0 0x403d0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD1>;
+			clocks = <&clk HCLK3>, <&clk CAN1_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can2: can@403e0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403e0000 0x0 0x200>, <0x0 0x403e0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD2>;
+			clocks = <&clk HCLK3>, <&clk CAN2_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
+		can3: can@403f0000 {
+			compatible = "bosch,m_can";
+			reg = <0x0 0x403f0000 0x0 0x200>, <0x0 0x403f0200 0x0 0x2000>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			resets = <&sys MA35D1_RESET_CANFD3>;
+			clocks = <&clk HCLK3>, <&clk CAN3_GATE>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
+			status = "disabled";
+		};
+
 		uart0: serial@40700000 {
 			compatible = "nuvoton,ma35d1-uart";
 			reg = <0x0 0x40700000 0x0 0x100>;
-- 
2.34.1

