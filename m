Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2190347125E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952538; cv=none; b=Aw9GSFHT5bZStqu9OdQpCHnr5ywo+VYvN7DQNJSVNaZOuwlgRFVrHl3+WA7UeUUyeDpARISu39qwFq6+blzU54rmiWGblrrZPL0cKI/94+tHnSQERSkh0Ehyaxa80q7u39egaLbnn+eXqSZXbY1O0+lTHrpxAnMccwnn/xniaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952538; c=relaxed/simple;
	bh=Rt5AMnm3cbBr/FEKZtrzivgkIKDkGbPcEEXPgrfZEzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdB4egsS5cym1C7LIkiO4YX06fLR7RgsUHBFArXEEV7xPY6RrWUTuu7EeWjeVL7OxTX4KRM6NRw95BUd/TxQYsc78T/gX+6J9oBKBwLHP92Refdc+xsYGvsF9k8/mSD88XCS8m9w5vC32/3JkAcLMUPnG1IfV1fH5IlXQoieI9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=jGTy7CUB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="jGTy7CUB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so37091025e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952534; x=1789557334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx4kaXVzQD9B9LP9ODwGSrAK0chcdTumd6i3FGfD6Ks=;
        b=jGTy7CUBMfXuiPL31DK1E2dr6Peuxhzxsh8cq0UKPlscxwXDofpv0t2I8fZwcnS0wC
         HeaVVnXhN/3mbz3+l/3HLBuilaqUjRUaYUx3Q+HbnGxk1MarhYpQrCaL8+Gr6vY2ChmV
         YaW1w/FbCxUVi0BSCxWgFql+kSmv5hv1qJH/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952534; x=1789557334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx4kaXVzQD9B9LP9ODwGSrAK0chcdTumd6i3FGfD6Ks=;
        b=pjAZIwESalmrKGlKbVoHGT5ezEm4PDNa0hMaSlp9XD8+0ftbEWpbT0tTg+GSLTA49J
         fMWeOP+tO20Aox0ynEme8JvyZxrKPUrjwAU8PxU7uHBjMDvepxcssuBoh8Jm6lktbgUM
         Y9+TIjZ6RSq2bwqJRA0ls319kSvzlxC92/THWrVUSo8zVhZB+Th2WTiLRytyfbKk3Fr2
         9MfX1Xlu3RRnhnbxOxCk8jGKxDqzJGC3yD/od8sW3/W3/b1+SWA8ySlwMocwVpXOeXaq
         AoJAdfvi/nkDMKdM1fozz4twKMdKuVRDZY/eGNfcVMs1LM44DlNWTeAIibUi4VVbwp6j
         wvFw==
X-Gm-Message-State: AFuF++nD5K1F4jON3hAfJ3cs68x60Ik3xLDb+hi4avWGXAsm4Q3yh90G
	ZRMNegnE8X/1wof1J8WqUD7F5ccgeCKMhlriAdUus7iu4nosK/uJQVjjHVvhZMRddHh9H/5b1vv
	86/0Y
X-Gm-Gg: AYBFou1th5vlG9D1nKSp1DuOErJePZ5eXGbAo8+m0RlTfd6bQb6/DYHxNI5Ip3l007c
	Ozo/h9B6CVpi+beFInpnD4VhkVoa+WqgcPzwrHDJWpBmVVFaocwHe7F1K2p0EVPrCfrtX63N9jF
	evKhHjbcklooBD9sQ5EHirS+9iLcYEbrt6ltQjJpAGFbA/lHoiE/DM8ubBx3vKT5CcB6LUbpIhh
	ebytuWyr3IxUBl5zTcYtAkXZVDyNT2dXOuIevctUTSfQamu7SC3P7mlW0+vJEJV5rTXbq1U7GD7
	hwgLa5UXcHw52LW55ihtRlXkW7DxM/h/qIGjDIAGnbPgwTlZlX47hImUKW1dDa7cSQmYwz7V+i6
	LvP8A9LS2lljop0x6uRwqM+C0zKpqX1jqYsLZ2GgOWOaxu8rwTYtyAaplleNaJrThymEpAK9lNb
	4govzV6riiyDd6XRSqucA5Y8eml7AoNbVJWUQ4cuF7rYevwuiw7pbyD5ZNCsadVZRf16jea+Yyb
	+fVwEMvxpVK
X-Received: by 2002:a05:600c:358d:b0:49d:797:8488 with SMTP id 5b1f17b1804b1-49d0797853emr248559335e9.1.1788952534000;
        Wed, 09 Sep 2026 04:15:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm107391915e9.4.2026.09.09.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:15:33 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Date: Wed,  9 Sep 2026 14:15:11 +0300
Message-ID: <20260909111513.2259643-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909111513.2259643-1-petko.manolov@konsulko.com>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
 2 files changed, 130 insertions(+)
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
index 000000000000..6c5a8013d40c
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,129 @@
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
+
+		/* 1GB */
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
+			status = "okay";
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_I";
+			};
+		};
+
+		gpio4: gpio@ff202020 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0xff202020 0x20>;
+			status = "okay";
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <2>;
+				reg = <0>;
+				bank-name = "SYNC_O";
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

