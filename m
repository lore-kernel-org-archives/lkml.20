Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25583CC32D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479499; cv=none; b=hol9TpKf7vYXDWf29uqka/wsIB8yCwB/CmtQXmS74bdbmmwcxuMnCtBNyYZBsllBmnx9rnRmrvummioEsdND/lgySxto9/EfpDowgWwutsP8cKcbfSNlD0CkFXG8SIycZEblWYDylMZLSYS8WO8SgIdJrJsqy6S5pQpcDTa3Sik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479499; c=relaxed/simple;
	bh=QC6afpBtL82X+UF5WesVglQXTxSNZpFrH32lX3Ntvjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIbN0DmK/qitk0WqyB9rGhTCUFvnxqtjoelVlU/SCZwSbMO8NJbIjjkyTiIdnmNYSAGpeZtiYhr2LoN180XoxNpRZEkFiOc3rX/nT72f4DM713MyS2MXPtO4hUsxZnw8gwHc40SsAXep0/wSEd3jzRdLNDa3DvtOOz/78w+YJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=dk16z4/H; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="dk16z4/H"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso154541f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479495; x=1790084295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEZaqDlaxAWY8085K3outRUpWn/E6iPzhbXl9cMesOM=;
        b=dk16z4/H8MkohJA27lhOmWzEo0aKXpzerQGkXn9IdcbOjWYBs4jfIVvrxovliZqN2+
         xxrVp7JFhskf6nUm3YyVAz4ECuU1aEdazkfWI7zrO+trTSDIKQRL3rWLS5QjVM0PG+Jx
         tY48R4WPHqoXTMdYQdd1XhQjYff6tLLsJ+UEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479495; x=1790084295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEZaqDlaxAWY8085K3outRUpWn/E6iPzhbXl9cMesOM=;
        b=bBz/tF+7hoCwrTZu4/HlurzVL1umGE5AcrOzlKzEHmh2a0k7goIfXVUZIm3nNvGAHM
         uy4izKohpKI4Ot2wnrBg+f9fKURmgPYWkMu84fomVT+VPn8k3YhhgDEI3lE6Bs/fm5/y
         OVNpVLZrd4RnG99ZlhyBuDwgj6MWY+8abFpHHmQGMIcxz2wWnUfgRcByo7+sBjIVIG2e
         7IO4VOz8Sg7M9sBzQC1jAdU1AKOMkGcFfB1X6AryJ6HAYxuf+9sUdTSDDHOfSin5hs1X
         sHMN5AoOOmxuhNXTGd4Svw6EihEhiCZ4BlcqgKR+k+uE9eruEVpz3o0BIWOx9tI8HJwU
         Rj3g==
X-Gm-Message-State: AFuF++nNvze9z8mkQoXsw3fNnQS78NPzGbfrG/hQu+QyGlIE4nqNxbTR
	b76sys5CdCUxp0lkv4BStYnpsf9GVqdziRfwYWMzNXYgUYwfTI1UN1g1tEYxEZq067Z2RhmUmQH
	v6rl2
X-Gm-Gg: AYBFou3rZCqFcqRVDwa7XLdPqrLVQMLoMuiOFRICCfbM5qPuwYu21sjPFOak73OtS6d
	e6QfG2s4DOwKzW1HY1V8va4kUz7FGc4PkXnh12SwPypTedZge3wuX3gkSTFfu4ZF9f5plvHCB9T
	/AuZgbibVvQMMbElsSwAAkAi9X+GXwzeomxw/8s8G0HSjUpuGBzOcvatd2TSuCv3ZIWd2Ol6MbI
	q8uiw8KP/SlnYECbBcU7URL8K5S9Qh1QCXmI9cKPbKyls+YOTM4I2TA5bX1lMZhAZbGkjfzXfdp
	Rh9AR747ljlC11ds2lJaf5i/1r+U9EH5Ruyxj+DG6B2SuH9gG/gFpiklJi/oln7MQRFNJKJLLPk
	OQDpcNSjhXNu7+sfafggL4P2M7H5RGsqOT5lybAOoqp9imOwjX9muI3zna7bU7Fq12lp30o1UqQ
	LfvbZGiLtk+Dfh70i22iBf760H1oEueFJ6WPD2aufF0u4vaccopLwQFy02BztAqAu/piwySo3zQ
	LxrpZ9Tvan8fCYd
X-Received: by 2002:a05:600c:1d01:b0:49e:6de9:62e8 with SMTP id 5b1f17b1804b1-49e8222c825mr16852135e9.6.1789479494783;
        Tue, 15 Sep 2026 06:38:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:14 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Tue, 15 Sep 2026 16:38:04 +0300
Message-ID: <20260915133805.3249587-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915133805.3249587-1-petko.manolov@konsulko.com>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
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

