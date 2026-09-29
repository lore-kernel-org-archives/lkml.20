Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F752CCE4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689273; cv=none; b=fPZnKA/al0ij3wU7wTGxNKGjQcSHZ7/Yti37ZUr9NMwXBTAJ9nDAFhSDhVLpAchr5tJUFDyTr9oLBp3HYKZ06M5Sgi/qyxyvwyywV5G7OFbPN71wG/xWTNiAONA5B9v4zA4cNb4qVcm6Puv1nb2Q1amVRoueRkquw7fNExjUr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689273; c=relaxed/simple;
	bh=u68RXmT/Sqpj774qbZttK750ZjXFsc8Kd5cz8NV2MSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XanGl9TJKxA9qR30GvU9flx4WlA0V6J2S93nbbxMp6o74BsKcxYF81YQxH+ZD5B/NRlTtQl61xWfXuN/B3EKsJz1vMEXq8/DnDut5DT4PWyKnhksjeP6MNuehCV82pk6SJbEIbkzOiA4JkiuWFrpx7gO6ZY65oE6T8Bn3gpawr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=akp5e2k7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="akp5e2k7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso31305555e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790689270; x=1791294070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROyJEnjBCwjimM7c0QNu2igXzZ8L2z4GWuRsYUdhFyU=;
        b=akp5e2k7UJRgaFSb/x9b8qAMNyuOorBayacrlWudcZaIVlTSTv+H3ZsIjpnVK6t2aY
         E5TYQDwRoYsT2+8bs9xBDmo+YQaz96sxN35ZWdd9kAsLSo530GdcCnNiAidd7OBaIibC
         hoQ9WHo118JkRlb2EnTm2ir4e+KzewL4HDMG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689270; x=1791294070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ROyJEnjBCwjimM7c0QNu2igXzZ8L2z4GWuRsYUdhFyU=;
        b=pqguYeUjoLxMY9urZt89neOpuuhTXzDVCXnh5dZrlHx5fQYY/+N6RicBs5eRx9izch
         hJ5Edr+hKUNdgYKAqI/nBgdySx+JpoVvsO7qdIGdi6TxuRqDcYq+K9C62yJDf/5hI4G0
         ipsYyW59VGl2TUjIWZJ9yagxCsx9JRgrGZx6cTloxPwJkAC2IGUYIA3XSBf1FNM+XNTM
         ckUkXGof19zNiujrC59ux3R0KyV7QBG0yUKXBj7czCSPN9zAq18omvoTVmwEp92ThRN+
         0StUnSThzXKbOMtLxOGe2I/omIASXJHbBE/mTK3QMC7oUIlLvvLa2gyTHzs8babr3Bsu
         wG5w==
X-Gm-Message-State: AFuF++mwRzlfO3LhqotnlNP8GBm6Av2UuGIVGmZoc0bJe/eOKx6+O0qn
	dS8cIpsPDEtEgtFVCj9lrYDAOWhp46bBqjuubpVHko7CrXvukze0cKlZAmERQzpFgIWdeT5CGBO
	3NIxh
X-Gm-Gg: AYBFou2lyynuwEXpPVjePS1/bnWbNsnMDXeiZP4yIdoBDaWTUSnaCivqCVSl8ByALrx
	wAccuu7lxPLHq3yXlrQZ7aTlISh2+neKX+QxevrWcoVXcti1b00gvVjF5EOhjGrKFwUBu9Xrnr9
	PcHoFB/B37XsPT1CLcFRvEL5e1qyUnr/6iLRKCuIH1lVL9cXytwzjW6tpTaue826kX7Xzvzfc+y
	f885vCiDl8/ZGmm6c5bcX+OyfxJCyqJjGaTS/YAc1C9XK3GDaAxieFtlHHMeefjjXzO87UM7EtJ
	k/j0x6KwzIQYmWR1Xl7rwZhjvVZSlE4ZzK1iS9zfXRNSPfUKQn+M7SIz5wg4YUqkMXf6gMNpni3
	/BRLsohj0IzGgsJIHkW9Jeejst79qaoJkWBKE1dgO4Rm3m1aJTHlfMdlN3G3dxvpjqF6DeJTqYf
	sSXSdDS4QbITwoh50luO28gQTRk9Ub5BA8aIvGsYD7P1zLRgwEsUw7E36CR0NTsrkJQ9zvdMeVX
	ASC7JXfzSKIOfU=
X-Received: by 2002:a05:600c:3494:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-49fff7399f4mr136125885e9.18.1790689269703;
        Tue, 29 Sep 2026 06:41:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d1011d9sm91835165e9.15.2026.09.29.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:41:09 -0700 (PDT)
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
Subject: [PATCH v8 3/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Tue, 29 Sep 2026 16:40:57 +0300
Message-ID: <20260929134058.819371-4-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929134058.819371-1-petko.manolov@konsulko.com>
References: <20260929134058.819371-1-petko.manolov@konsulko.com>
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
 arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
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
index 000000000000..85daa839c314
--- /dev/null
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
@@ -0,0 +1,91 @@
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

