Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7E83BAD93
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114065; cv=none; b=D23umxAZlNsTPLSg/2RmiqcGsv9LqBC/4zTrscERooGsvGEM2x9M03HkvdCV6oIMsoj1EDL3zwm1hOYHnJDo0qn5MTGWCXCsq4unmqs5GqQ34pAP7Y9prtJT1uVvPsGR0ulgc89HniIXQIlVg1izXDlyjtufUpYbZr7x+jC73Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114065; c=relaxed/simple;
	bh=2JIYF14Q93avKZHdVMTlY5UdLr6Jwx5oSbgDmxdxKI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJV/2GqF4Kj2e9XC0qhlOmIaDXkzD5L2ROnirBC/dlb3v3/pDVIWy9k/q+NvlSvCRxrbRVB87WySRbnTDmM8lZdYIMWdXsrEJMTStoKbDosthpN+3ViunoY8wXWtWeIyrNd45J7YcBNYGC/UO4gVDVVr26KJgzakLyIr4l0NHZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MevNldj6; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MevNldj6"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedf433a99so2995726a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114063; x=1788718863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=;
        b=MevNldj6QzGX/uLuZazb88Lk/640FYCw/tnXHsxdnmCiuHDdesHiMwo9XuJ3ewJlP7
         swxkC0OzFeHI67zYoGNlrD0FDLmpfJkmUgFJaDbxxVSIwwsogZCEUhUGeKnHYtNraOY6
         KsYBUbUsyVI9UP7jPVFwu0JMLsGEF23D5sSi9E8N94FI1N480QAtq5TMbkpS41+IL5k3
         0JJ6Ba3qqeIYyVKYV1xvoOoLST+6N7Fp9HYCMKH4l6C0xKhxSnWwVfxJ4/HDScEwpFF/
         eC6FY+92FxsVWpCmohwp3HrrLpVW+1d85Qw26yBQ764T3xKSlwsAZjoTiEUpmxfuOcbo
         Iq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114063; x=1788718863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=;
        b=GN6t4Hcxbb0MD8zmQ0gxSUItaBDv6/Cv9JqfUT5OGt3MBM+zCQ2PwYezSn91vo6Efp
         qz81NzA4lc3z7r8/nU5s32dTxJCdIYl8JAF0mO7jk7Efjn/NsOvSRpGkrEaw2lFA6ueW
         po1Nl154+vZiac9BeXu3sAGyD/xIQ60em5qL2WE/S8zUjhvcnbZ/fkRU/AFlbV2ME/I2
         GB1DcPd0OuRvIIiomKlETQh2JYvcsCIjBbIHvSRZUVx8BKhBfDRXw5JKwvK6KKuqC1Rs
         OoErSxUJaM5zR7EjS0frr971w+01dM038rPSaivy1UkdMWIZisJ3wgRKLqS8v1t9t+Yr
         J9Kg==
X-Forwarded-Encrypted: i=1; AHgh+RrshwHzy3x+3W0HGpWYi/sgpoTWz2JB6SUXD1/fBQRAuuuUE7xuVGJJ9KaEkVEyaxOk7GkvSF4WanER5U8=@vger.kernel.org
X-Gm-Message-State: AFuF++lR0x2rSDDavNwbUZ9oLUQdYad1BrJOLZPG4xs1m1ot23MX4ODi
	BofjdVdgZGy7V/CRMkwoq21LSCp1iiYV6EJSZraMs1l+iFTT2200NowN
X-Gm-Gg: AR+sD11k+aaQ2lU5qpZi+Vkrm3yJ7uo66xa9KihqHxSxMQL09HkzDEIPvlzWVkEomtd
	kmCFIuGd+6cKMGYJj1BsdYaBvbGxFrFpzpSN8AsSt2NEOxRgOHuEfIr7GJhTCfgzRkZXJZin5j2
	4DgBUfHyLdu88GdyI1tXjResECIasAf6bbMZJudgHHH0gllA88V++UwSjCpSkhskPwNxqBPo/5s
	2ChtM7EQlfi9M5HwzGW/iV9yPjeZ4n/nUA4CWMwZIaQwp8p5uEKUNTklwc+NDwcRSX4MdIl/VIR
	j7a8YNl+IV4d/IErEf8gxkxrpF3DO4OibIjV3BYiASQb9CzYmzyuU5ZThXilBEl3wbXlKtNmvq/
	cxHt6M8FtsKu4+gZg/VqsNfusc9eXusp8CfZ2WUb7UiFOTl+jfG5ugilgAOqlCYftyFJfqOFi5G
	ReXbLbJKgWqxqtNtIUfkX8XUqxpeV3vJOtuU3V7Hx/Fn5KqHZkD4r6tgJWSkeszm9Dr/mqSMs8T
	yZwAIln1tJm8YBo3A==
X-Received: by 2002:a05:6a21:4784:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3d3ae509971mr20102216637.21.1788114063191;
        Sun, 30 Aug 2026 11:21:03 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:21:02 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Sun, 30 Aug 2026 23:50:36 +0530
Message-ID: <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console, and
MAC0 connected to an RTL8211F Ethernet PHY.

The MAC0 RGMII RX delay configuration was validated on hardware.
The RTL8211F requires its internal RX delay for reliable operation,
while an additional TX delay is not required.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..aa623f0ca36c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		status = "okay";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				reg = <0x00000000 0x000e0000>;
+				label = "u-boot";
+				read-only;
+			};
+
+			u-boot-env@e0000 {
+				reg = <0x000e0000 0x00020000>;
+				label = "u-boot-env";
+			};
+
+			kernel@200000 {
+				reg = <0x00200000 0x00800000>;
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				reg = <0x00a00000 0x02000000>;
+				label = "rofs";
+				read-only;
+			};
+
+			rwfs@2a00000 {
+				reg = <0x02a00000 0x01600000>;
+				label = "rwfs";
+			};
+		};
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	/*
+	 * The RTL8211F provides the required RGMII RX delay. No additional
+	 * TX delay is required for this board.
+	 */
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3

