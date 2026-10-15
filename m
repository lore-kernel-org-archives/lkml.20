Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6A1524AE6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070044; cv=none; b=XXfkIZzFY0O/pX4UufOo877Im4SKF2W/5xU//3urCpKFfRntj5sITNMQYfbod6EEfZ3Z2DHnOLkyH6/uQorvtS/Ypj4wxdN7GCLj1/n7YriZfKMMC8X/ZxTDXI6Zhdxupyc4Owk1XAsWcFti62B02p4wpkpSxVhSlyfZHSAuqoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070044; c=relaxed/simple;
	bh=0ILwPVBwTlJQetiFAJBoaVkFIQ5glk94CcNOuAbNTA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBKC9bgY+4ql2NJyohao7egKCCEamLSFVl5bKbUQJ1NwN8RhkUMZaaBEWby3M4jdv4h2jbSInPzZOefmFCgZeMi5NV445v+o5Pguk/1V2rgOHVhzsyK2t9tKwIe/6EWOr0OcV+TWskVRTXRbryPzwXgIwC1RqrOPtVX0flDickA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=J687cFzV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="J687cFzV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so37458425e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070041; x=1792674841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Pa+BVm/DhJcByTKomguMW7cTHpnU4nIsYz26aY9oVs=;
        b=J687cFzVozdmybEmO1V4eOx2+U/Rs08f6nZfXvXO2kyIGVxD3GaxLTq4KL8F+jdbKh
         ANA5Bh1aCx19icFrhYCWuwzOkGO/D+ZTVT8ixtJO/mZOP4rr2Vqf3igaKVeAXy+XFugQ
         N/jSOTwkwV3Y7amCsXp7F+BmpLMm9nGiOXIKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070041; x=1792674841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Pa+BVm/DhJcByTKomguMW7cTHpnU4nIsYz26aY9oVs=;
        b=FPP0Ilq8EiYgVES3zJWRRQ4zIEA3pgVvJUq1S/ojRHnl8W2EkLKN9Yi4hgB1AUrLMi
         0d7PjJkVfbdtNb8v8rMvht+nE8R3Y/P9Iox2e4axW9aP9XAGdmV+08Rp4xOu2keDyuQX
         dSCi/Yn9IzD2vIbDbi7x8CDXyabDKU2QnUHtOyM+MDly76lsz5HLnR+AT0zWQwYPmnj8
         wjKXqaQsOo3S9/eBSgOgPM9Rh8LzMzE25nMWm4o2l/F1fX1wi2n+jwAYP61mizla6+dd
         RcbpJmA4V4foIuaOM3nnsCW1lN+qN8Zk6JEB3YCdtK3oYOjzgMmes0+LQ/It5t4xDFiu
         mraA==
X-Gm-Message-State: AFq9FYLKzUGN0RnvZeVltb5rubtIDnfpne4P2nxV3jcW+fGHmJXG0ee/
	mGsZsxszQP83RQUzV95RHKOqLuy5r/T33elelC2kocS56dEs9a5ExW3t05Vttqe/ZWbdIMqx2AO
	V3OmI
X-Gm-Gg: AYBFou3EtWzcqRp3hqDu7TYWYpXoseJ1vFTQDO+aSamzycv5CkwS4+WunAgxtJivhLv
	J7wVkCv/KGVb/Bu2KaCqmonjrleaMxt3saeMc5zIJxhgCdoMDgbWwE27QFRwSvwHj6vVQ++WMBl
	50V/tS38N8ry2tc36iXZufys3pGqrbfsViSIDPXH6SwkhE7PQFO1jF/61rOmbp8fwWK29vaMuTA
	bbVRZVVci1w7b0HgJ4okhUimiGgNm/Z7mVjNmTiH6tByUiXfVuaYRsnxceRgBPnB+v9BC85rJgW
	oLUHEMyomihKRQZJ7M79Ytf0h3BWDNGmfUzbSyz4J8YUGNP3zgljeIff1ZlQyFzBzUvZnLPODZ1
	rXHw/WJcqxt2Ow0gYKNs1PEBPMWEvu0cIXmtqqi700KUoy8jaBIT9DjIMHB3B4jLDNcVBu9WysG
	pTbOq59Ly3dEf7Coo7/wS9KXczk0i4P+44I0Ck5FGyCtmLE7UQGAcJBsNHOfWpxFmlwBo5xqE+S
	wiAL+IPU0KTBKw=
X-Received: by 2002:a05:600c:3e8f:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a18e44653cmr390868755e9.4.1792070040716;
        Thu, 15 Oct 2026 06:14:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:14:00 -0700 (PDT)
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
Subject: [PATCH v10 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Thu, 15 Oct 2026 16:13:51 +0300
Message-ID: <20261015131352.3624327-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015131352.3624327-1-petko.manolov@konsulko.com>
References: <20261015131352.3624327-1-petko.manolov@konsulko.com>
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
index 000000000000..f19e24c80e89
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
+			compatible = "snps,dwmac-mdio";
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

