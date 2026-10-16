Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7F4908D3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154069; cv=none; b=pS7N9wmO2Owv/Q+NIBayFDf6tqhQKEU4avA5+sDRa321eyq90ilEGo1rMPJkT76g2aY0G/BP3yn7tCQGoIBUWAM006Ws1M2zXgzQ3AoVUbS/bZOsoGOCqMQZOjtDU5/FHptV4lvIIvmWIFsxipMHEM7goLLpkA+mI/pKnoPFf9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154069; c=relaxed/simple;
	bh=OLNSZrzF/eaqutZvktMtyMNI2nbpbIOVNRJswO6WqSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYbxjg2vKRkrQ4ct7iJVKW/6hRnmQXhXTPmsKNyQuoRFGKLM+yOufzQeWLL/ZAPVcwPbWOjabM8PAdKw1arb26igonKHKT+5kIfDOj2K18zuPYmChyAiY39uGn0NcH/zb31hCn/iVvBNYcqcTvuOZNDnYcNG05lVvQZCE6zWBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=J+OYz338; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="J+OYz338"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so57555165e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792154066; x=1792758866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoH3FFcfZAjONuLiIkivXi4hnxqhQZd4Qylq+O8iD0Y=;
        b=J+OYz338UB0ysaoYk1+YzPAlv0/39/FV8AOzUTTUOvl1XEedU314cWO5jXpnn16ZZl
         KRqQcCRkHoR7l+nXHN+00MgWsR3Xfm/dg8yd4jnqfXwqjXsox6uLN9qaRpk47k87/cJs
         pcX+co4hJlvOg6FNIQA43Y7aOhUUK3t7twazU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154066; x=1792758866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoH3FFcfZAjONuLiIkivXi4hnxqhQZd4Qylq+O8iD0Y=;
        b=qrvxgrnYvzmH1xuvLDSvurzaxE2ar7cihdUZutbZjwxeSkXpEW8chis+sR+rAVOlqa
         uxoFjQFSibcHoA443hbzIvs9SAf9IevwrK0owPOzajm7DpA8sd+D1/NDHEg3pG9NR4UE
         OaLdrZNYiwvey/Yqe7cH9pz2X4TgIPSAA8XqAJvoHqhUuObt1GV28thpxBYQe4M/YzTq
         ck4SAay43fKej+JTmjUHvIQa//mQ7Knmiq5QGRFWvw0wqhuxWh+QScgUZVlVFHqv7GZq
         XRvdGlrU/qApg9roWztgsGrR/H9yafvqf2suKW8wVE+As3ua28rIfGBXdlwhmI9vzeW5
         lb9g==
X-Gm-Message-State: AFq9FYIhnaYY2GneG1R9dDXwFWh7jZCJVus7TTWriY8rm7Iy4Bd8oAmB
	VVBNs6ugNoJ/wIbm4U2X4cmGGvn/PvUpORrz7wm+34w/X7cyWId2SgKwJSSZK3zUz0oOKrhQLId
	D9p1J
X-Gm-Gg: AYBFou3EkcI1IuigVJ5zticB3qwm8KLHrQ+t10g6sEKdKbAcMfQnB+zRJZUmGOt1JM+
	i5F7Her3TzVTn/SafD3dBDLHl++DvdPV6OvBf+STmp1tlWUcKp/cIibBmjj9SmCW2SeoYuQTEF4
	3JnKPn9ARz1aDgmSlB8BBNKFbT6nsihWSQATJCn0+elZ2t/2DCwUAzNXE/KHXoi1BL8GPzszClv
	f50vn+KMag9tJSvwCwbY3FwYHTZHP8rPk3YQEXKCDAKbjwxDi0SFLmihnlybnEf0EJtlXAhAS+t
	hEwFVhfQ3gv1j2eb5pVCdmBEU+bzuO1RfhGYdhOz9lN2b1jdNuvoKjnszxyNmjhmFesuVPUOrzN
	olhm2PZZ2N+u9j2OCJvxXTLRwWTiEkv3LzhXz+0CkMPJN6U4PQqRrR4kR2N75x4RS6XrYsonfUn
	GPmGX+EpoIaYdfcEI/u+N5Bv37pGGDMoN/1O/qSMfmdmu6770yUW46GbYKme6C69v2Z9Af2/usi
	tBweFZ9JUqilQc=
X-Received: by 2002:a05:600c:6990:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4a18e49c43bmr470046445e9.6.1792154065843;
        Fri, 16 Oct 2026 05:34:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm110564045e9.1.2026.10.16.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:34:25 -0700 (PDT)
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
Subject: [PATCH v12 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Fri, 16 Oct 2026 15:34:14 +0300
Message-ID: <20261016123415.3272046-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016123415.3272046-1-petko.manolov@konsulko.com>
References: <20261016123415.3272046-1-petko.manolov@konsulko.com>
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
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
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
index 000000000000..e38590c4630e
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,102 @@
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
+		compatible = "snps,dwmac-mdio";
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

