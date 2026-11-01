Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527218;
	b=fCPGNxCe65TX1vP5Iko+UWHozy7oUXO30m8M2zSE+cU8txtfwrG0KJcxiZ2wsTsi1ojl
	 d1IuSL8YiXNhVYo2HOwX6cabxzrFPDO7oQQ+iN5dtoa6HKbh4WOysJkR2oezfur5i2oys
	 NaZ6BPXz/cjrDpdWAL9Bm/yCzZ6aHkDYm8irtmWrKZ/dELyifYeisAr04dL2ZiGtGFYcZ
	 JEeCTXb3P8cijTThVsgMVmgD6xA7Mdp6yKUdypMqU0pxC+3LrHdOTEKGdaD5Q0X1IcMQF
	 OzxawZXuY7GK6uLbCB5Oi4N+4RiIbXdIS75iCUknwALdQjmY1G8EJ1JeVlCzDyg+a6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527218;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status;
	bh=qkfPS8hofwtnNm0CXa6ZP95vc5TkVzOTDVJ6YjTfRpo=;
	b=OiOkFQNK7lnB6PiLMp+9WEZLOXSx9AW1A8eSo5xvVWxM8QJlFCdA0YqDIV0pCCSkqgfC
	 JjYUY2p3/3PpYXOIUO4PRx2II4OExyUk5z6/RLZgqa8omPLzgsEA+k3AP45KhEn/SZDOI
	 rVB4uW0ZLIMOCYaFxRi+3kqq6X2mMT6OsKg2VnsZF71IjzQDkxZp+0BP9Hjc9CitQnJUz
	 EZbm29Th7lH3wnwNxwGPHOL1K5l9gctLmj1hr1my00JiujMQnLkMUZvtEoM7c/I/xdjJA
	 RnopRlYLw/dmMtQ3seoTTwypFcjQKvgU2LwaLoAU33jz0yl0BaWr+6tiz7KsuMuIwKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5F7606A325;
	Sun,  1 Nov 2026 10:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5F7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [IPV6:240e:3bc:2e87:4e80:2a7b:821a:ffcf:549e])
	by smtp.qiye.163.com (Hmail) with ESMTP id 531059d45;
	Sun, 1 Nov 2026 18:00:04 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] arm64: dts: allwinner: a523: drop redundant status=okay
Date: Sun,  1 Nov 2026 18:00:00 +0800
Message-Id: <20261101100000.725282-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa1968d4b0703a2kunm959b05f2a51c2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkwYVkwaHk8aH00eHUpNQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZGEFJHkNMQU8eQ0tBSRpMGUFDSUoaQR0dGB1BTk
	9CHllXWRYaDxIVHRRZQVlPS0hVSktJQkNDTFVKS0tVS1kG

Device nodes are enabled by default, so no need for
status="okay" property.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Changes in v2:
  Remove `status = "okay"` from the pmic node.
  Link to v1: https://lore.kernel.org/lkml/20250901120020.181414-1-amadeus@jmu.edu.cn/
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 1 -
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..aa23d9062a3d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -386,7 +386,6 @@ wdt: watchdog@2050000 {
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
-			status = "okay";
 		};
 
 		uart0: serial@2500000 {
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14..384a6174de3a 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -297,7 +297,6 @@ axp323: pmic@36 {
 		interrupt-controller;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index eb9fd0a65b41..ff772dfd5c92 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -249,7 +249,6 @@ axp323: pmic@36 {
 		interrupt-controller;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85247186461d..e6c24e925a54 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -356,7 +356,6 @@ axp323: pmic@36 {
 		interrupt-controller;
 		interrupt-parent = <&nmi_intc>;
 		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 26ce579b42bf..7d056d555e36 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -341,7 +341,6 @@ axp323: pmic@36 {
 		reg = <0x36>;
 		#interrupt-cells = <1>;
 		interrupt-controller;
-		status = "okay";
 
 		vin1-supply = <&reg_vcc5v>;
 		vin2-supply = <&reg_vcc5v>;
-- 
2.34.1

