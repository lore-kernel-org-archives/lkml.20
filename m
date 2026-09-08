Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846D5293FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865831; cv=none; b=VsmVIuVNhncXAjj7eYjdHCQaTO6MWL7Gg4rw16c7cxRvuDNKJ9NeyPA1/qG7tciU6akaXHh5c2VF2aBKaXim0Ns9jOGcJLqR2mnVows+r/T8ZEwIzuacGh2P8PAh9cMFixzkIr3syaSOhl+4Z+cBnVzmVCZi8D7k+/1NXuD/kxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865831; c=relaxed/simple;
	bh=RfAAa/ezxcoTvltT1sgPf5b6PR4/MQAxo6ei5Ly/z2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5wa7FS/+SZFPTBsv92SvOINSj3qJ70wFe5d04oyC4h5I+pF1ao/6MBfTxZFguySXTXk5hPPebq4bRuW+oT6O8KzzgpndFX+XvDBakRLBLxJMZa+r3vroF36WbEF9H89G5K5C31tb8+qfvdofUWNFpDurZiwbyNVhShX9FO3Qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Ch/a0EKF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Ch/a0EKF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484392e3d33so3190406f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788865822; x=1789470622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV1cFa0SmiOJFSUVittr8PT+5fPSzY0p/A7pJa5ekQ4=;
        b=Ch/a0EKFrg1UtV1RA424XcWEJu0UL8nz0z0R3Ex7HuDC3I5plgXSrHjF0Hn2xd4RXZ
         xOE+2VDmHSu68VuxmIiQCAEP0UOBcV2PhypeSTyA4szuun8V3CsX4BZZFtv4JbtnoO0g
         c+/9xGHlhd3tZJxAbDALmAivXrBsJdLXqJIYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865822; x=1789470622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dV1cFa0SmiOJFSUVittr8PT+5fPSzY0p/A7pJa5ekQ4=;
        b=b7cY2DLVgUADUf29pbfvosnbX11+6HbCfyU9lkBy7Rhg1jQ6DJytR6kUZErjxrmPBL
         DImqbhu131oUZxlH/L3hLl78qJRRa6sNesCBMvoSjTacaWfUbZwAAFnkeBVZzFuTC8dd
         x5Ye8ynwkXDlv7EzEl9Qx9cOePXBd+9TCqKhnr8fX2+DIik1NMlGOBcmFQXgqKKDH5dT
         L4rVoVG4K36vJIk5KhczbdAPfE4ruXs4GT3htHaO0OGVnkfa19yVf5wWP3WbEI703m9C
         MXnsSKGRGnk5PSP7pESDdX5aiX7X+q1THqE8Meo//Ml6vlHbOhzKlnJK6aHbIPdAlX9Z
         N+9w==
X-Gm-Message-State: AFuF++l/ps3iR+OnfEtU/A+fU38pp8jEYoJi+ucPI7XqukStQmdSM1Oa
	7miLZkA3WVy+GApcicTs36kYnjjGq0zrfsx8SaP2Dwcqm8ejgyoMmJ3EqDCPvUq9r/rk2SBCQ4W
	ls2gG
X-Gm-Gg: AYBFou12AfL0C4wYGgMwL6ZJnjWK9wnpwT/ix9PL0/yCTClvA/enkdDiOY3ngNBdJ9P
	PayDu1a/zEHgPmdJ5cpw9qm/7X7luZrVjAmz5pu9bxHCdPcN8wzcD/HLuIGIMdofhNFQEvWk52I
	6CadS92mlpn2iHBlt0L2ac+NwwLnhZM4xhRq0vW+I3KROR1DrgnwHQzv2U47RRi7xe0CJ84hK+p
	7yf+OZpdHHOB7SlCcNlrxLD2Z1vL55Kw1dYBZeF5GORsZmju7wBPttcWGvNp2Zau9U/s7lJa+jZ
	cLqhMEnyisQTH0m04yGlnGx4OefzEBWU/avKVJg+WPG91bw8mS31TVV47RRPVmvMJG0GNIB5XTq
	H9S+it9naWWm8AzQHtmowUHUHm6K0KJ4jLXl0GOmBuFtDAIcMuHsuNxLiXRq7AqBXCxchs/IIup
	J7qsj47RSyMeOcE/28AZS7LdZrr5V7ZbjcAfeSV9b+vSYd8mcmqyl+vU2LP2+TnZ2c8P2gwCKo/
	ziu4A==
X-Received: by 2002:a05:6000:208a:b0:485:8c17:9763 with SMTP id ffacd0b85a97d-4858c1799c0mr23168185f8f.37.1788865821270;
        Tue, 08 Sep 2026 04:10:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm26855073f8f.15.2026.09.08.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:10:20 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.
Date: Tue,  8 Sep 2026 14:10:00 +0300
Message-ID: <20260908111011.960876-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908111011.960876-1-petko.manolov@konsulko.com>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 130 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
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
index 000000000000..423c76cd1d4a
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,130 @@
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
+		bootargs = "earlyprintk";
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

