Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2812C3D34BB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076302; cv=none; b=gDllHOiiEVVC50t1TcoEOV0iKPVRqAWJ/RZJjweSUDh2+PYLLoKgBnJ+5k+l5Yr7BalzkXpzzfnmi5VDhLejhv4MgSnEhpwqwo8tMO+Lb8j0FapqJJ2xDARYpmhsn8pdcPCSbgmMHytbecl+YVlxqNrIpJeCI90c08ZiJMnSUzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076302; c=relaxed/simple;
	bh=M0cMsCZ02U77183RUkE74lsRpwml0sDNx7C3ANSra1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzvSr0XDSgyWteUrr1o5NuL5y+IpJgksYJycyqM6tgngoTNc4nDFtrUrzrKNcBwO2tXMfVJQtPEVNOyhArRFod6FjnCfgZkXl5f3MiGWU48+eBfaCAJbu91hKMRwEO025aG5+pRmZ/a3Fbf7BJfWHcTBOhRaTW3v2UbR8KER+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XCoydP7n; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XCoydP7n"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so49377795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076295; x=1792681095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULoHMGCXXt8+sjvVncJ7Ytp+FPxeGBVxIqJ27YF1NHo=;
        b=XCoydP7nMfUDz3OjRd5rQftGWenP03kMuc20BEVKMK4qwzWSzSNjrQ/GlUA0gfKAmZ
         Wet9YlGBwbfapjW+NTAIOvso7B3sGs4POplyhEuuGHFpY9JC1Pe8qbPKG4gmx033OgiL
         F99LNgeZ/fVnbIHdANra/udGveOCwomSBk1GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076295; x=1792681095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULoHMGCXXt8+sjvVncJ7Ytp+FPxeGBVxIqJ27YF1NHo=;
        b=Tjk8pXT2WJ9fTe0YQkGe47vUmylR9OThP/6E8+6dR6N1JGtbTF+8NzxTWWlIaFLtGM
         djWkHNvH/wABuwxbyLDgGYtipwOWWuk0UnrI+PiOSVzIuinWM1MhimylEIMDuqM3kasg
         Sp5E5FYG8Owufm+kp1Ln2NFV4VhHxXtuSA2vhMcPLLeAy7PmUcsclWOaW8xafn/5m37j
         VpnhjbBrISG45/6KmTDzTi96JriQFy9iZPvPG3mhYCS/mzU6uX+xK+TOSKIN/ZKMixmV
         ZkAv7HmSRSBQp+PDIN6YTxNBN3uu5ynlR+g8dG2d8DCbO299scVt9MuJlfx5uqt77CPz
         KHDg==
X-Gm-Message-State: AFq9FYLd91LKhPynuDA3TZv/hCYBQCY6A26qupCcH/8S4Xooyp+sDdfH
	jl7pl5/h3DM0dpj7QIJn/EjgCJYpMX9zIVZM8J7BY1xtFpACWfJToPXLLYlYad7Vv21B18tDt6B
	benjM
X-Gm-Gg: AYBFou2m6gjNfciMd+G/DfocmIPDkhlNbUfjBbXhD/B/gTAxtTISOHHSwOc57Rbjv2B
	EpT1iKToHdaZuYrK9i1XK99ed5M2Ee2gI5cS04XDoniKJSFX0rj61dEGqzU164iQtI+0fo0XVqA
	0mGHsTpkkKCXavV5bSMUs/stFUid/Jg2r8+z5Bp3INJ7vina4IWXl8oUq4qgo690iG6JgxBlcGy
	mp08jrYwij+rMC6C0bY8w+pQQCwArqXfpSXkwWj74w//MYCIU6glbs/HjYGlgtl4tGy7MnnZbjH
	ga+HZ1CPVLUquU8ajLYEfw4rMZsWHJyCksa6GFVnO4Foepr2YXsK/hUnTtZ3wg0sjOuFOvFNkeK
	smVg/aeC3ZzrbzWyD32pfvlDPqiBI+pkULCHLlr7EnZN0/gJpO6AURiC1GpPeLiFHCuAYXDgP1W
	9GluvlmqwGUhiaSFKAEior//sB822yDiLnNKD/3KZx+KU9Bb9emOCKQKJD0xQciJJigetYCDCQU
	UEhXPAGUN3/ooR2/o66TOyf6A==
X-Received: by 2002:a05:600c:46cf:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a18e47ad5fmr428103185e9.10.1792076295305;
        Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
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
Subject: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Thu, 15 Oct 2026 17:58:03 +0300
Message-ID: <20261015145804.3632839-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015145804.3632839-1-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+)
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
index 000000000000..314930a52de5
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ */
+#include "socfpga_cyclone5.dtsi"
+
+/ {
+	model = "Draeger M48 Cyclone V SoC";
+	compatible = "draeger,socfpga-m48", "altr,socfpga-cyclone5", "altr,socfpga";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	aliases {
+		/* this allow the ethaddr uboot environment variable contents
+		 * to be added to the gmac0 device tree blob.
+		 */
+		ethernet0 = &gmac0;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			rxc-skew-ps  = <1860>;
+			rxd0-skew-ps = <0>;
+			rxd1-skew-ps = <0>;
+			rxd2-skew-ps = <0>;
+			rxd3-skew-ps = <0>;
+			rxdv-skew-ps = <0>;
+			txc-skew-ps  = <900>;
+			txd0-skew-ps = <0>;
+			txd1-skew-ps = <0>;
+			txd2-skew-ps = <0>;
+			txd3-skew-ps = <0>;
+			txen-skew-ps = <0>;
+		};
+	};
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

