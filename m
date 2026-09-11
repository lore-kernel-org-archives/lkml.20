Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2D36EAB1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139290; cv=none; b=mVz3FQVn4TqPnkHGNGOpy6G/DcaPOGwPSKdLKffr2g9ACQRHn/mxZN8StSNRSISZ/qyFGyLXadNhzUFD14G5cnEGSnXOZtq9H1k5jygIthSQtXMN2MlkJYgUlQxbt83sf1ds5+wUEdBsCSsK4L0donDDZg78qZaNj84Bm6cCPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139290; c=relaxed/simple;
	bh=JnGSVu3UDeZfs19aBLRbahGw8qa44K1IDS2nqJVBmxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9K7tKG3zaxLVrVA4i1dTzsP6l6F9QBnJidRouEmLPjibkjN5/J3tin1gH2ShIe+5LDFpEsfSCOpPrs2qXO02h/wg35QZHO549GbRy5quLCiYchg28X2qPvuHXcox+8MS2xTEMLtyLdTWHUmPgvufg4mNla0PohxRnFBZgITVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=WYmvmoLC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="WYmvmoLC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so8467075e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139287; x=1789744087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKoUQPl97tCE2V3tDl7BS8pogacuY1Z0BZO5HcUf/cc=;
        b=WYmvmoLCFP5IAffDewSw284fIeyRKaUMFjmue1b0Xr3SIh1IgbbYA5/Wzq2NZfR1hY
         F2l0a6zk5YF65gtGTip/wHKokkVC1W3tQeJWsxdZumNwRbjXVXcmY/Bvv+FZ2M0oudrs
         3+ducTh0ew0Mn3thTnwEupxPfh+6oDqULKNd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139287; x=1789744087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKoUQPl97tCE2V3tDl7BS8pogacuY1Z0BZO5HcUf/cc=;
        b=eK3HOSdLYj7A5o5x5q8OckmYPV32aTwJIvyrfzTY7cxq9RXe/aHqA+f7NZIBQjotym
         EcPHDkc/weWylB7Hp5F6rEBwSCRt06dy1njBPn4LOzeAJiwqUHe9tUaSo9p0JNpuK6+m
         gjkt3dEOqfIVwN1wwtsrCkMm10Z3IY8psp8wbBj4dJOPbuFpzrPwR+23X5lCNJjvazXZ
         VodhFJCw/pQLxttr00JQ3EsBJs5AiqyIO7f1W7nYzBPVh4pla0XGZLrCTRXGMm+6N352
         1sS2zrb3kxGHaguHXI/88+iu23y34GlF7PecNHxvaunF8ostPG2LYIhLkM648ZRX2wy+
         HjRg==
X-Gm-Message-State: AFuF++mf+XT/oj2RqDqPraTU07nRPn46JAxWdZmyQ6Cra55CZTod3KcN
	00TSYQIc4+GCyp7b7TiT5JRGjV4qmUiOM673e+IJVG4lWt4PSSD+dfPdPNQuZ75uVp2PPCkGKvN
	YMjJc
X-Gm-Gg: AYBFou3SIaxKBLRyCvVbCkUuCcWcmkuYI3wzDDslNcG+dB5N7RKzcky1UtcW4ZWna/h
	UzEb6LBx9o26EEcImw7xhpgX2lvotp5cYhsu9IfPLkC+HUkBbJTzCnVrEWrl+R6zQjUSsamIVNK
	99MPtISSp9W99L3d6R7NsXIF+Dyh3GEPaS2mn0jemuGwC5WShNyGf0X+yfl75qG0QHtVLP025jk
	Jd1Wk4sxxES1micbg/jOuPp/knc2oacjbInF2ioLCjlb9ohs9a8ELy04rR7OgGRetJJYpYXaeYY
	TpwF5uvlU7j/Q81CAxo2Zbw/DxMZJuCyNXM73DZRigT92iqnx5AVePAZmlfViyUr85r9whqXevl
	h/Kfd6mU+ch5w0wHoI1jEjJFols6y5BDh8WhWAfqaVPyssZGaB5BF1r4+PnM7gOazfAQZp6dsa0
	l8COE9jrUJ4W3EN09skwlmbpUTzemKJ8u+1NMgR/6HV2PqNTigZiW1kYhtwvUV2e63ncGlIR086
	QC+bgGRhGPWHyO6
X-Received: by 2002:a05:600d:644a:20b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49e619837a5mr40907845e9.6.1789139287320;
        Fri, 11 Sep 2026 08:08:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:06 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Fri, 11 Sep 2026 18:07:54 +0300
Message-ID: <20260911150755.2803736-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911150755.2803736-1-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Draeger M48 is a CPU module built around the NXP i.MX6q.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

diff --git a/arch/arm/boot/dts/intel/socfpga/Makefile b/arch/arm/boot/dts/intel/socfpga/Makefile
index 8df0976da01c..cdcea11abdfa 100644
--- a/arch/arm/boot/dts/intel/socfpga/Makefile
+++ b/arch/arm/boot/dts/intel/socfpga/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria10_mercury_aa1_st1_emmc.dtb \
 	socfpga_arria10_mercury_aa1_st1_qspi.dtb \
 	socfpga_arria10_mercury_aa1_st1_sdmmc.dtb \
+	socfpga_cyclone5_draeger_m48.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb \
 	socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
new file mode 100644
index 000000000000..838708acb31b
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,M48", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	aliases {
+		/* this allow the ethaddr uboot environmnet variable contents
+		 * to be added to the gmac0 device tree blob.
+		 */
+		ethernet0 = &gmac0;
+	};
+
+	soc {
+		gpio3: gpio@ff202000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202000 0x20>;
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+			};
+		};
+
+		gpio4: gpio@ff202020 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202020 0x20>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+			};
+		};
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	rxc-skew-ps = <1860>;
+	rxd0-skew-ps = <0>;
+	rxd1-skew-ps = <0>;
+	rxd2-skew-ps = <0>;
+	rxd3-skew-ps = <0>;
+	rxdv-skew-ps = <0>;
+	txc-skew-ps = <900>;
+	txd0-skew-ps = <0>;
+	txd1-skew-ps = <0>;
+	txd2-skew-ps = <0>;
+	txd3-skew-ps = <0>;
+	txen-skew-ps = <0>;
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	eeprom_mac: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&mmc0 {
+	status = "okay";
+};
+
+&qspi {
+	status = "okay";
+
+	flash: flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "micron,n25q256a", "jedec,spi-nor";
+		reg = <0>;
+
+		/* chip select */
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <4>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+	};
+};
-- 
2.47.3

