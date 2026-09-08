Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0785550DC3;
	Tue,  8 Sep 2026 21:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904531; cv=none; b=O2vb6klch1CF0R3hyxr1fiq77NnRWA3iG21LVows4VSLPGOxrzp4cN8uGcIpLydJK+m5uUdRy3gqlA0M3m9KvG6GAJAFZSzjVNJgZ5W814CX90QUFYPqkGuBjUbzoZNa9n1yC6BiR6sYFcnt5l+iEbKT0L62WsFY97CYdTz+dbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904531; c=relaxed/simple;
	bh=382uOfWKw9shIIHoy5dE+ILCsYYms/zIoHM1a/Ci/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YP+sqTzi7UgKGfoNd26jbQLvez0EdYJdbD23GBXn5WOpT3qPFTxGPq2JssaAdIL3gdyEPiglg59Ppf6PCr3V2tY7i0r6CJngFLffUuHfIP9h2oKAzB1+zi0O+qGpCMQkoP9PhezXWQbJ78LUsptnThppfe43C1/MrLDPa5KCghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=eKACFwtP; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="eKACFwtP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D80B8100346;
	Tue, 08 Sep 2026 23:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788904523; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Lx8vUrl8G0vy6Q42VWe8patHE21Kb5u7SDIaA+quT4A=;
	b=eKACFwtPGFXiQXRqzxq816VuwkNmQSN7przuyniCP6SnnCZDU1IkDWeFLGeLV8KUhk6NcJ
	KSjkBpHDvBVLi5B1rPl4TyTbFTAlyCkCIzCLj9cqaTbfLOWwPLmjUASyPMRwGA8gXvAGdi
	FucFCZgFrR4sEsVvKHbskZ7h86HVlNShKv11B6WailahDlg9lYPLKyQDmVeJSKWjmGqQJ3
	fb7hCeTK212kz5n/bmttw3wrQj349GElJxIkCWKhQjGdVmzNKic92185c5jQSzCohgi/O2
	Qij43O7TdHvOujuXMzQLU5UvFPexEGu1SiF8T1BpnP9fO0YetfCUz3E5rGUSqg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mm: imx8mp: Update EEPROM with nWP GPIO, label and layout
Date: Tue,  8 Sep 2026 23:54:37 +0200
Message-ID: <20260908215519.33061-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Describe ID EEPROM nWP GPIO, label and nvmem layout. The i.MX8MM eDM SBC
and i.MX8MP eDM SBC nvmem layout is almost identical, except for length
of product-name@32 field, which is 19 Bytes on the Mini and 24 Bytes on
the Plus.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../freescale/imx8mm-data-modul-edm-sbc.dts   |  56 ++++++++
 .../freescale/imx8mp-data-modul-edm-sbc.dts   | 128 ++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index df857de0375cf..2b7fed0c5a7c7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -431,7 +431,63 @@ usb-hub@2c {
 	eeprom: eeprom@50 {
 		compatible = "atmel,24c32";
 		reg = <0x50>;
+		label = "dmo-board-info";
 		pagesize = <32>;
+		wp-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			company-name@24 {
+				reg = <0x24 0xd>;
+			};
+
+			product-name@32 {
+				reg = <0x32 0x13>;
+			};
+
+			board-revision@4b {
+				reg = <0x4b 0x3>;
+			};
+
+			serial-number@4f {
+				reg = <0x4f 0x8>;
+			};
+
+			manufacturing-date@70 {
+				reg = <0x70 0xa>;
+			};
+
+			test-date@7b {
+				reg = <0x7b 0xa>;
+			};
+
+			product-number@86 {
+				reg = <0x86 0x8>;
+			};
+
+			board-variant@9a {
+				reg = <0x9a 0x9>;
+			};
+
+			company-acronym@a4 {
+				reg = <0xa4 0x3>;
+			};
+
+			mac-address@b0 {
+				reg = <0xb0 0x6>;
+			};
+
+			board-id@100 {
+				reg = <0x100 0x4>;
+			};
+
+			wifi-id@1200 {
+				reg = <0x120 0x4>;
+			};
+		};
 	};
 
 	rtc: rtc@68 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index c284edfa1f4c8..1d03cf73588c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -421,14 +421,142 @@ tpm: tpm@2e {
 	eeprom900: eeprom@50 {	/* board rev.900 */
 		compatible = "atmel,24c32";
 		reg = <0x50>;
+		label = "dmo-board-info";
 		pagesize = <32>;
+		wp-gpios = <&gpio3 14 GPIO_ACTIVE_LOW>;
 		status = "disabled";
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			company-name@24 {
+				reg = <0x24 0xd>;
+			};
+
+			product-name@32 {
+				reg = <0x32 0x18>;
+			};
+
+			board-revision@4b {
+				reg = <0x4b 0x3>;
+			};
+
+			serial-number@4f {
+				reg = <0x4f 0x8>;
+			};
+
+			manufacturing-date@70 {
+				reg = <0x70 0xa>;
+			};
+
+			test-date@7b {
+				reg = <0x7b 0xa>;
+			};
+
+			product-number@86 {
+				reg = <0x86 0x8>;
+			};
+
+			board-variant@9a {
+				reg = <0x9a 0x9>;
+			};
+
+			company-acronym@a4 {
+				reg = <0xa4 0x3>;
+			};
+
+			eeprom900mac: mac-address@b0 {
+				reg = <0xb0 0x6>;
+			};
+
+			board-id@100 {
+				reg = <0x100 0x4>;
+			};
+
+			wifi-id@1200 {
+				reg = <0x120 0x4>;
+			};
+
+			board-lvds-id@140 {
+				reg = <0x140 0x4>;
+			};
+
+			camera-id@160 {
+				reg = <0x160 0x4>;
+			};
+		};
 	};
 
 	eeprom902: eeprom@51 {	/* board rev.902 */
 		compatible = "atmel,24c32";
 		reg = <0x51>;
+		label = "dmo-board-info";
 		pagesize = <32>;
+		wp-gpios = <&gpio3 14 GPIO_ACTIVE_LOW>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			company-name@24 {
+				reg = <0x24 0xd>;
+			};
+
+			product-name@32 {
+				reg = <0x32 0x18>;
+			};
+
+			board-revision@4b {
+				reg = <0x4b 0x3>;
+			};
+
+			serial-number@4f {
+				reg = <0x4f 0x8>;
+			};
+
+			manufacturing-date@70 {
+				reg = <0x70 0xa>;
+			};
+
+			test-date@7b {
+				reg = <0x7b 0xa>;
+			};
+
+			product-number@86 {
+				reg = <0x86 0x8>;
+			};
+
+			board-variant@9a {
+				reg = <0x9a 0x9>;
+			};
+
+			company-acronym@a4 {
+				reg = <0xa4 0x3>;
+			};
+
+			eeprom902mac: mac-address@b0 {
+				reg = <0xb0 0x6>;
+			};
+
+			board-id@100 {
+				reg = <0x100 0x4>;
+			};
+
+			wifi-id@1200 {
+				reg = <0x120 0x4>;
+			};
+
+			board-lvds-id@140 {
+				reg = <0x140 0x4>;
+			};
+
+			camera-id@160 {
+				reg = <0x160 0x4>;
+			};
+		};
 	};
 
 	rtc: rtc@68 {
-- 
2.53.0

