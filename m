Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1945C711
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981670; cv=none; b=eIQsf88Vd6Pnm0oMDfY4IiW1Y0/XGhq1S06oeGyNbG8TYU0V/Sm/wRF275ku9Ph17NKB1Wi6M42SWdefVSEg46AY5StX9euq1I2G8txRANYQaXN/bvkbwutjFaMfYkNt0jiMJkck+noKZspkpXAqNGssxT69l6HLdx6Q4kNdFGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981670; c=relaxed/simple;
	bh=WncuUMOrb+o1nLPTlnkYK/LlYBTttwBzacj96h5tcUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRDWASNZ39bf19x7bqGn1l3Hz4ZExOwc57QyY6meY7PA5xuU2yquY/NGIBLAhrp0ffmRoDuDahEzsqCA+7O3gA4al4aTiyCCEKbZZOg0dBY38Sg09KoPgs6+kn+E17RdBRZbDqrH6nBqQjA7PDXg91DKBXOeVZpXVzfr8OxuxJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=AtY/ST5I; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="AtY/ST5I"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso19977495e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981666; x=1790586466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9P0bAkfacAdN+uMzT0rVC2aiF/z3uaeg9DH0YZC9Ng=;
        b=AtY/ST5IUNGGApmlZNbpNh50ApX7+7Fa53eHDZIfAE7R/MRAQa6x2DA0OM1HHeoQ7J
         IZGUQmWjjwXRGQzGh5DpVWkSJ67B/DRvUG2FiGxLbMAC7VLu0oCNm7TuYmkM1vwPRypn
         E4Bf0tFH6vnJm5m6+0T6qEn0f15oowHnz4kSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981666; x=1790586466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9P0bAkfacAdN+uMzT0rVC2aiF/z3uaeg9DH0YZC9Ng=;
        b=zzTMJCmmdIXGL63Al8TagkXXHCsULuEGyjBav6zI8WIlQIR2e1DKT2A5OS9qLsfiX6
         xA7/E+ewUViqPZQio8yvIR0kUc/I775RkxNrPlwYxJ8IWG2q27dRhqaDLCT+dLye0ip2
         w/MFIak8dnKxbqPu++YccO8qaZigQw/RJAsFw5LTUI6OrACYsB9zmvXxO+msCJ4qdTeP
         uHsNsW3NNxwKKfoprfyVBLVpvvkK88z4yQckQrDr9uQayNXgwjb8+5Qu3L/A0J7fOwT+
         L+d8BoOUAYEXh8RhbRZqvg1fTIeUsr6GgcAna2qb3prxceA7F7qstPryMBI/Nf8MAApe
         WsOg==
X-Gm-Message-State: AFuF++liK9JVgXGfhldRDvSEtGkP191FfRBzirNJZmPBNwUSr/FWAQjC
	JKpJQ4U5iT24olmqI4Y7c9+dg5JTkzHmyfN6q+ywZrKv6FsHOUWViCw1vIIYhMJG3JP+mIeUh0t
	ST6YmI08=
X-Gm-Gg: AYBFou0WBGjf3kSevwSyxG93EmtCBcxYtWimokHsVDEy7QZqbMgRhOom1RhCGu0jGCV
	U6j3nsFiJBoxZwgwPkML9UjUv2UX6QkjSUUa+DgSCYbxY4qg9P31otW8Ke1wotH6uLe/dH/ASa6
	1P9FTSrBEalJ+fKRRLGcYbQjjNB+pwjKNOX0tG4r07ACHIQxzW1QNvC7r1zS8wlZcxh4bbbT131
	bmbu5dQVMKKJ6YOaLKIWQ4XrIP/Puksnap35Cns5isrYk+SE4eEJKxzN6GwGaLdNqBvAhsgCRMd
	fXo8pJIR8/z40T/M5RQyPRm8GWeYXCGp1rEfC9SP4wAwEfdZlWyzUQlrvlGfaJHF3l+gBQxScG/
	vnZzzMFhyTkUDUWD08JsWBafLnBm9TQXxXojBuXjGe4jClb5wdkNQgTtW0MnSePW4WDlQ5BgTc6
	6v0+fuU4zvi661kWv6PecXgzrgWrNIh5zuf5AEQZmvaYeOfS5u1/8ZKO4H8mxwNkeN80O/2laPz
	B/EETmOKSG4s7Nm
X-Received: by 2002:a05:600c:6211:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fc5728f84mr128229845e9.18.1789981665716;
        Mon, 21 Sep 2026 02:07:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:45 -0700 (PDT)
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
Subject: [PATCH v7 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Mon, 21 Sep 2026 12:07:33 +0300
Message-ID: <20260921090735.3174292-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921090735.3174292-1-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

This one adds the DT for the Altera SoCFPGA part of M48.

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

