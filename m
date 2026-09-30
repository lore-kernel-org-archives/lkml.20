Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492924BF947
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767146; cv=none; b=HaMF2zAEOcYJHv5nwo5L18n0sy2s6aN+p6X0DmpABqjzikJfRIV2N9voqYqheuFEylf4qwlf1/FE7ySd1/QwJxvvYJokpru8xJ96IA3Y8L+mpJ/aaDpvASs04E8JE8xGNZNy1F/xQaDiIAGbSF9hSVEFy4cZpqr5a54VF7+byFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767146; c=relaxed/simple;
	bh=0u6v79Krh5wgu6ieg82TJioz7VCyU2eQjOin5lWXN1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfW9gLXvjYEgXrCOWu6dvNy1v43eTvZQkUur50GMtgr02EDlEuQXA7IEj9j+ekWvjoFLmKq+8tw/G0IjtFL6Dxv7YFXcmTLXBA+EPkmipS373KPvf4a61e+kTyCj2E4ET1phEXeRR/EPCM5nAF0hV5wec/JkvcErFm9S0Qf0/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+zrEM42; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+zrEM42"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8686f46e4adso3342941b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767144; x=1791371944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=;
        b=N+zrEM42NdDwzKyYBSeBTVVsrHljzwH3GsovrRL7gA4w0U1F/ocwM6X0dG8wtv0mC1
         J0Rd1NvvIy4tItEX6hGuXOpRrzegfMNIoHyvqN+RZtiSQJJg4Vc25JHTqykVXBKAQNFo
         FJR0pGbme2BYD7yMA0F8kpxXc8sPT2kBGc0TMRHs8IDQk5M+DLfCSGVkVuP4D9b9EKCJ
         jecYK6jL1pmgezeXwMQNXxb7Ut1AGJJ9HHP2zeWhFO0Uxv1hpJWlDMpD3TNPh9UYixaT
         oLP6eRr8RfMS/c4qwuaCKjWxz93IamQz7zH03004UBbgW+37LCFAj7s5jQqWO3lz+HNS
         FOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767144; x=1791371944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=;
        b=JsxQd85E8YFOcIWB0h0cMybhlsaeO9eOSCDZNzIUZGjcZ2Rumq5cCcuCDJ4xT6MQEn
         kao/I6dWsoF1DI0m4srbfDWh92b1qX4hoaOS+ZwWFC7NcwiK7Ak73uSK4QtQFMwMqkHy
         5ZuRmJ2vOxlTZG2DwEHWES3LZDpTpm1NzskAOAwi1IjI/7t8A92Js1T/Hwnvip/HTm0O
         ugToCPgz9ZhHbIp1/eV5Yf/52TGI2yt2vFrd9BDNf+G33D6ljbUHGERpgSK1b9ApX1A3
         aJF8Vq3Q3oLV60QBTGhE7QJoooVSwTlNLLwfwUPSBqrfkxANI22fVIN6rSqWnTOFhbqn
         2cKA==
X-Forwarded-Encrypted: i=1; AKwUvBzCVaub8a0laZe7N4kn6x47zWGVb2ke30Bq9a76UAingQpd4c/vX0GaAycjGD+p6hBOCgbVFQzRPNKhW5A=@vger.kernel.org
X-Gm-Message-State: AFuF++l5QZzCERGRZX5vLKw5DdoLoz3rZqPjM4dyqkJ3gh/zMlLUNxOp
	BRHYPNDvooJKtm5H8brX9BUXl+TVUPRFtMX1X/U9d4h6UlRsL9LWQ1Ed
X-Gm-Gg: AYBFou0Yk31ZFC0cPLC3jgLOmrworD3zXg6rJDdxXIrPEfDgkamWOnHqDE90r/2sw90
	usIG6fFSsLELwK2DAKFe4C4uHpn06N7jnRDB/7fZmQHhDQd3w/Owt52iSj69nOZ6sQv0ibZe9GC
	6Cr2Lo1+VR3q1+APbihiHbsq2nhUWgi0Hn3c+QhBEumKCUoEpA/yfIEUzYI11wsE65/vKip/EJX
	iEmJBUVYdmcW6UhI4trGziu+3z+v/coTlcvLnz5BYpMBhXyM1uHwJZii6n6wkYI+5ZW27LvEwOP
	J2mmYRKG134KkMrzonUhKvpe5Pz0+NwpYVY/GoC0Ot3JNNGJJn+K0+6bRcixQygsyHvd8paHF3Y
	hFkNpLjODBHiA3KQWDDkFB4wFCAt0wc35a/CILWxVv/MGk9CRLM8SSEBsNv2S/+n0BeAZ29N+QF
	O9q1jdYojsd641je/Hsd0OWig/ff2yx3Z1zIYKIO9YisGZ6u+voicvMznSHNfKhg2WAhZfOspvB
	dZMGPF0OdfIM0LaTgwACQ7QzjHGaKdgGi1wypJBNqACXHNYIi+1Mmw=
X-Received: by 2002:a05:6a00:4390:b0:880:fe7b:bc56 with SMTP id d2e1a72fcca58-8874e53ec84mr760256b3a.50.1790767143558;
        Wed, 30 Sep 2026 04:19:03 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:03 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 1/4] ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
Date: Wed, 30 Sep 2026 19:18:10 +0800
Message-ID: <20260930111813.52396-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder child nodes in i2c0-i2c6 to follow ascending unit address
ordering as required by scripts/dtc/dt-check-style. No functional
changes.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 430 +++++++++---------
 1 file changed, 218 insertions(+), 212 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index d1a04b63df9e..b022bdd02c1e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -343,10 +343,25 @@ flash@0 {
 
 &i2c0 {
 	status = "okay";
-	ina230@45 {
-		compatible = "ti,ina230";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
+
+	sled1_fusb302: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled1>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
+		};
 	};
 
 	mp5023@40 {
@@ -354,11 +369,6 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-
 	sled1_ioexp41: pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
@@ -370,20 +380,20 @@ sled1_ioexp41: pca9536@41 {
 		"SLED1_CLKREQ_N", "SLED1_PCIE_PWR_EN";
 	};
 
-	sled1_ioexp: pca9539@76 {
-		compatible = "nxp,pca9539";
-		reg = <0x76>;
-		gpio-controller;
-		#gpio-cells = <2>;
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
 
-		gpio-line-names =
-		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
-		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
-		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
-		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
 	};
 
 	sled1_leds: pca9552@67 {
@@ -401,13 +411,33 @@ sled1_leds: pca9552@67 {
 		"","","","";
 	};
 
-	sled1_fusb302: typec-portc@22 {
+	sled1_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled1>;
+		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled2>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -421,39 +451,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled2_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
+		"SLED2_CLKREQ_N", "SLED2_PCIE_PWR_EN";
 	};
-};
 
-&i2c1 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled2_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled2_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
-		"SLED2_CLKREQ_N", "SLED2_PCIE_PWR_EN";
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled2_ioexp: pca9539@76 {
@@ -471,29 +513,18 @@ sled2_ioexp: pca9539@76 {
 		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
 		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
 	};
+};
 
-	sled2_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c2 {
+	status = "okay";
 
-	sled2_fusb302: typec-portc@22 {
+	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled2>;
+		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled3>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -507,39 +538,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled3_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
+		"SLED3_CLKREQ_N", "SLED3_PCIE_PWR_EN";
 	};
-};
 
-&i2c2 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled3_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled3_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
-		"SLED3_CLKREQ_N", "SLED3_PCIE_PWR_EN";
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled3_ioexp: pca9539@76 {
@@ -557,29 +600,18 @@ sled3_ioexp: pca9539@76 {
 		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
 		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
 	};
+};
 
-	sled3_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c3 {
+	status = "okay";
 
-	sled3_fusb302: typec-portc@22 {
+	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled3>;
+		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled4>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -593,39 +625,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled4_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
+		"SLED4_CLKREQ_N", "SLED4_PCIE_PWR_EN";
 	};
-};
 
-&i2c3 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled4_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled4_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
-		"SLED4_CLKREQ_N", "SLED4_PCIE_PWR_EN";
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled4_ioexp: pca9539@76 {
@@ -643,29 +687,18 @@ sled4_ioexp: pca9539@76 {
 		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
 		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
 	};
+};
 
-	sled4_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c4 {
+	status = "okay";
 
-	sled4_fusb302: typec-portc@22 {
+	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled4>;
+		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled5>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -679,39 +712,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled5_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
+		"SLED5_CLKREQ_N", "SLED5_PCIE_PWR_EN";
 	};
-};
 
-&i2c4 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled5_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled5_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
-		"SLED5_CLKREQ_N", "SLED5_PCIE_PWR_EN";
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled5_ioexp: pca9539@76 {
@@ -729,29 +774,18 @@ sled5_ioexp: pca9539@76 {
 		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
 		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
 	};
+};
 
-	sled5_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c5 {
+	status = "okay";
 
-	sled5_fusb302: typec-portc@22 {
+	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled5>;
+		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled6>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -765,30 +799,11 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
-};
-
-&i2c5 {
-	status = "okay";
-	ina230@45 {
-		compatible = "ti,ina230";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-	};
-
 	mp5023@40 {
 		compatible = "mps,mp5023";
 		reg = <0x40>;
 	};
 
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-
 	sled6_ioexp41: pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
@@ -800,20 +815,20 @@ sled6_ioexp41: pca9536@41 {
 		"SLED6_CLKREQ_N", "SLED6_PCIE_PWR_EN";
 	};
 
-	sled6_ioexp: pca9539@76 {
-		compatible = "nxp,pca9539";
-		reg = <0x76>;
-		gpio-controller;
-		#gpio-cells = <2>;
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
 
-		gpio-line-names =
-		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
-		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
-		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
-		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
 	};
 
 	sled6_leds: pca9552@67 {
@@ -831,45 +846,36 @@ sled6_leds: pca9552@67 {
 		"","","","";
 	};
 
-	sled6_fusb302: typec-portc@22 {
-		compatible = "fcs,fusb302";
-		reg = <0x22>;
+	sled6_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled6>;
-
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
-			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
-		};
-	};
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+		gpio-line-names =
+		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
+		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
+		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
+		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
 	};
 };
 
 &i2c6 {
 	status = "okay";
 
-	eeprom@56 {
-		compatible = "atmel,24c64";
-		reg = <0x56>;
-	};
-
 	rtc@51 {
 		/* in-chip rtc disabled, use external rtc (battery-backed) */
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
 	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0

