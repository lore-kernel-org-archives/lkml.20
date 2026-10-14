Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46B50B8BE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982965; cv=none; b=SLYkc/9MQ7eZyTil0h/zSmm3Y1hYAui6DIaHZ3kcrdVRhlN5bY/JJgTd4ymeI597uROn5XIwuVlYeEqJ5JiC1Jk36j6+Pu717Cf/zStpxnL5AX4ELTH3goIAuXsriRgqQDW6dtJVJwJUoY/dAfZ8A1kXe8rTrqPtYU/MvGSssj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982965; c=relaxed/simple;
	bh=4FdlLBJoqpDFYA6HjvNHnqM5yD09QQJ4fKl32c09zsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lK1YS5gjHTw01+mTjwLJEajZFG8Hh1a2MUJvc6LFG2qKslQKCCF9ZXrT9cRtzIiepRjdDPvR2zQi66gZD6dMgwqkVLuRVEz7f2ssehXWgwyc2itRgLcyknhd/QUX99u28k0UPMgF8dE1itn8F4JeUaeTHpyKRwgjiPp1VuCJwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=LB2lEkVI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LB2lEkVI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so37202105e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982959; x=1792587759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzolvO3m4kvSEWLa664TtxJM99Sg9wbekRZaNIqbzEU=;
        b=LB2lEkVI8SSDysZgU2wVSUFE9yLba3GLpVQj+D+iTyDLN5z4u0VCHPY+GnXw/bhIDj
         WGT7WqoHpZH2ifQR1y/IvvjfxsIIqD3eTZXt7d70Ukiul9ihnCP38lY3bRNoa25ASkbo
         WGeyIbwe3MI/QQw7wkPFT2Sd9Xr8PetJHPulo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982959; x=1792587759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzolvO3m4kvSEWLa664TtxJM99Sg9wbekRZaNIqbzEU=;
        b=0YJ09hFgioQahc2EpsjPBSwhMgeRMe0EwdLJEy7/+TyVOSpRcr5f+C3GDnMqyUCZ6Z
         iH1NksQvPAFcMktGSRbvSA7Mn0bOOZcoYv93gxKrF1JvUdPhZPXyVPgCs0jNNDQS+TPa
         MKuZiKCLEqpEjIL7e54YoOe7a1g2xtQuP3DiI5MOu9vYz7l9XB8MtK81J9kLG0F972ok
         iX1XKUHAsqxLszggW9z2aUBpTW2ySbZZDxxmvfbHtsoFP/UPpzVvaZvCMCNi2assFdlq
         MIGdIHe4gHwAe4PR1xT2YvFxa3/Zo8myJvkeAbsalDtqRErWZ7v/Sh9KAvfTVmb7hrfX
         Jq5Q==
X-Gm-Message-State: AFq9FYIZKDr6pbjnW8wmvrMJlKuNe+nqSGwMtvRrUccCKIIa9fzI+IrR
	Jdxy/CZbW2JEcAeAo9R2Ef4SK3Q+TXDK3qIhjTZOz+RjSbCnVCE+YNeEIshxcyBLtRoYhzBdY12
	xoOaN
X-Gm-Gg: AYBFou0QOBaguqzBWVZIWVUxHyabSWtSF7oAowy01hXYc6dJgp2uGbAMfJ0MbBoJk9v
	E1JitJbARL/0gPMXWkDzZEchTicemsULhKoWrehg08nskSKD9ZBiPEOODp4CUQSrbpT/Sgh1lma
	dYb+Fdim+Zpfy5vhV9HnKflglr4SSUSEYXYE7FNpqHAsya/tOGxgPZT6aRWV/8dBijBTMt0lViM
	dLT0kr94BhrjTRr7jFo7x0imR8jK7ZYQlaSloEbW8OAvtCgYo3Z6Z5x9cniCMbRpxU6GTJfQlcM
	kcTMyQLXKw8+397yzUvKx1D7Fr6mwMSeBPJUOAZUEkasXPpbHiz/ofIRZ1LsYY4nVDL3IY0gQHf
	dLx+OkrQoxR/p8sadrYDFJoIRCNGb9xzJaaqZbIxz8eBErXDCvZP8U57B5CHZTSl4eSc1rcFRbh
	j9qoakxCi8Ky3mi7YaRNRFyGgwCWiEBvhCFtGmJ3y3a6apvDnOCT6WT+HRUOrKLKJaU2FhDRcqO
	owxiiBYQBdBxWI=
X-Received: by 2002:a05:600c:820d:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a18e47b302mr284953305e9.8.1791982959485;
        Wed, 14 Oct 2026 06:02:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:38 -0700 (PDT)
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
Subject: [PATCH v9 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Wed, 14 Oct 2026 16:02:26 +0300
Message-ID: <20261014130228.2780803-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014130228.2780803-1-petko.manolov@konsulko.com>
References: <20261014130228.2780803-1-petko.manolov@konsulko.com>
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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
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
index 000000000000..bc1909126e19
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,100 @@
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
+		compatible = "snps,dwmac-mdio";
+
+		ethphy: ethernet-phy@0 {
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

