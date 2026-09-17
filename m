Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E052554087
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662729; cv=none; b=T5zPLQeIHMSJch3T5kjxT/tDztrZjRbUTXVvbHBRAdiHR5AIpDtfwdCbe6rLFeaREJBgkcKc7lRWUxuzis9WktVBjtvu+5fhh+E8+yEt58TQRsS+BPw+R9OOAuTSBAyy5AqgfxH2MEduaHPXMSGXCgcGCMuWyAka7iyTofkibw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662729; c=relaxed/simple;
	bh=bVHUXHUOUexMnPvGq2onJmA5oGKTIVSb8tJKzygO4/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skcn6WSPZ5FJz67vSk6r/u2rp6L4hSdx41yDqcMG1z6h3yM5W9whFsYTUtZe32ELntU/HN2000SM4lxuD/EbKXsUzKd2+f4+GjkUt0Qbd+fNxRcOsHfUokV1enQ6fxKOZAq1b1hKCpqT080mxXWDm07YEu941YLRar0fV5w6JMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=moTb35UO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="moTb35UO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso667749f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789662726; x=1790267526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRGmy+CD/OZqkunxYFlKpBWDzUnxWp+wru3td2Hvozs=;
        b=moTb35UOORPHc4OW1jgyZHA5D7MsPFNIMZfbV2d/0YkXDZKj21/ISzeozJ2W0D7w7O
         MkFyCQBNyTD3C7yUvPDLUtKWD9qfnm+LYVa5D4YEaIM9Fc1cn2m2Mqmg3rh7pOX5PLNK
         jDYI31HfSrdKsvXrdvnV49+VxpefBCprFKepU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662726; x=1790267526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRGmy+CD/OZqkunxYFlKpBWDzUnxWp+wru3td2Hvozs=;
        b=jnppI5PLokOjBnMSl/iSiR5vdy+/fc09DntvzAFVnruJ58x2Mak6YfSjpjvl+0YJXT
         82Q8aUuGUtPzdLZM+XGH9/zUil4Mg6DbWQXZuxAjCjxUyE2GKxtBCdCUy9kPifh6u5XE
         S6ju8N4P1nN7zJy/vvZdBHHk/UayN+T4DjqtJ3yrL2a3enNaZV+idjN4wB2Vu4bpt0/l
         H7xp8llWzd/KLrHE2X1QjQ8ZFh5GXNsbnoK7B1S7Mv/z7b18jetXzYr0eYMh9cp8j3j2
         J2VOdQz6B3eTKik0akaefzka9JqpTgcaELizI1RXcPo0noJCrC0EdaXG4Y73Pnplttq4
         Vtjg==
X-Gm-Message-State: AFuF++kBbmW+hlg2x4GW1xvHdph72HoK3K7GweUvr7vUT/YL3Y0lZvT0
	3VAsStCtzzxcuTptqcvy4tteVZb/PLIYCZspGgun/ZTDgjgXR9FAwhier4c5UKqtpuhx+yS7ARk
	BBiIB
X-Gm-Gg: AYBFou0a+CLZcZ1LA0MH95wl/nTi8BXWnWmLTHtL77sf2DV0rIZsiWIHk8ijN493MJH
	qY3olsnMlwBX+oWXtyiehw3XNSd5j3LWlRqIAs1woRaURWSmuGnSmHna1zepXO37KLu2o3cLLFl
	STziTQ/WtHeb5JnbLufkmy7x6QkOM5RjClG0yJqsmzBDcBfkHYubykahGOnC0vjlgrWQT5RwJx+
	H/d5kwSDZtYNZN032JmEN78SfPDYFf6tT5WPespd2w448A+mrivIL3suRk2Fh+U21lergSS59QW
	VgKSHSZ5wlSY8jOhEMew0M3gaOVft+LlSzmwLq+6qTChZ2y4n1+KB4aI91rZcDHouD17IIFlQFK
	HlOvI5PC0Ix40asUEawB5YhW+cgsrbr5ij+gECCdCa1shH3DZgNvDW4RY2lNCb7/PjgEzXRvILI
	6xQHOHajvshIocw5AQAfo/FmyxqvFI8+z7geT9IKMyhF5mJMAGmArVrZkLw2K5vYTOqY60roP7/
	MAuCMtgO18kFLWw
X-Received: by 2002:a05:6000:41d3:b0:487:ff2:14f5 with SMTP id ffacd0b85a97d-4870ff21542mr7461497f8f.4.1789662725767;
        Thu, 17 Sep 2026 09:32:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16842652f8f.35.2026.09.17.09.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:32:05 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Thu, 17 Sep 2026 19:31:56 +0300
Message-ID: <20260917163157.1380860-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163157.1380860-1-petko.manolov@konsulko.com>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Draeger M48 CPU Module that is built around Altera SoCFPGA.

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
index 000000000000..dae809c02adb
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
+	compatible = "draeger,m48", "altr,socfpga-cyclone5", "altr,socfpga";
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

