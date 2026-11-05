Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908519;
	b=d9qJLg7IGvcjybN4NRYmfEde12+AyjGqe4PBn4V5rpM/REOA5YnPYJTPEkb8EzoWh6xQ
	 djNrYlzNwqe6wNf9ay22y3RrBVCGC7BIuTK7ZndjrFWjMPzUAP/EhyKRbHQy9Px1LWJ2p
	 6U4PsFuwjOspaiNg6pK5Xxv9qp7ZgaE4EIYcjK8RYaWAavR29YuTOsg+wwDdf/Sj8aHkd
	 idV1JR7KqzkOfdN+i6lHqajQt45otwJEZ/mcBOf9zMo04Su58qA64dNOaRCjzNo18chMz
	 fpJPHzYBmxuvy6PtYOoCF23DMPJelLbhRWU6a/C+gzEjldLNZZFLgLek7HPuU2eBW+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
	b=Np1nlLQBwzB+AUsF8x+whT9HUzK/WxDts9s2N39eKq7p4djv/vihvfwLKizpXXNR2ES6
	 EuwdbmC2epRtNeXUdM4DPWnvUrOMPtppGsis0s4IXhfbWPktSanbirIZrLh4zBwBaVbis
	 FMehoqqWG0wSzdjHMGYEC15PAmN13El5JmFwLMJDYYhfEGaQusQx/2IZT8aYzN+hJ9F9g
	 7Q6qaVpCK+X0VpXjoQAWJ7lOJpi5HrCSOK4muul998RnHo9RX270fNFW4ihSLojv1T+Tv
	 7TsOfyYmzgg+K7aW0LfhTgYxwZAhqlQmenXStqOBcOhOjDr8Fe2UzBp563M4J01qlUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvLLcQNt;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905E606A6F7
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C905E606A6F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvLLcQNt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso17679265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908517; x=1794513317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=qvLLcQNtgJw1h8ipzcaSkR1lmwIJrqC1AFECRVaek3oI6lK5OtE98lExxnGvM0fvCU
         GojEDMIBnDnagS60gS1AnFE/Nmue4V2s879W+IZE2Lkl6QEd135hofco9PovVS2lC+FY
         xSMk7dQ+JlpzPAH9AObsOSonUjMNfNF/Q9DXb7lwyx33y11u7TsiL3oLVK4jXt4tbkwz
         o3LYpKpYogPxAjyBIZpl7zJ5Kvez+RFvLESYCX2H7VGm+G/jyk/ZcXuniMsEpXjTE783
         EZrYtWcRuY6LYCEZUQHMA5VPK5zZHx6JSNOdIyrNpQN6nO07/EkCO4An95PO24fXcn6Y
         5pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908517; x=1794513317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=ZyPtZCDVD1set9G3OxMrphtJ8PzhQ8FtBuVAZpUKqBafjIRKG3bcmztwUunecs18Cp
         B/A0mi9kMo4LOhZ987YIUOHnP7Ej4qcGhqHWCR2C9dOktjM5rnyw0GGUhaD9OMk2Cpxs
         vH6l+lGOZv9h4MSrJuewjqJx0exKDNWuPwTxD2AwMCplQvjxn9A8ovY45tDteFo0JO9s
         dP579BAdtZnqlgYJY1G928YuFbHGIeb3fmc/8NZ7uVkVSeu/bi2pMdS0ZdxlNd6zXfeq
         vtq0/7KcEab/x3LpVSO1Ked/3zyKvpk08tbhZnqL541BS0P4acRK2LsxqrN+fnXgKHkK
         pjyQ==
X-Forwarded-Encrypted: i=1; AKwUvByDvWQpbsUB1C3MiB+UjOhotmqsZiLbWkhkCBmTAMrKv48tI/W8pqZljgqq4XLXpdfBEpReAGSps+qoFhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sr7ydpaajIRzWZTjNbMFAt72nII2HYsqpW2+H3NoWP6exFduN
	/PXKl/S/UyQCp+vjhD92bcq4PnuJMydPPLTgUvyCElY6qJGIILrZyYGF
X-Gm-Gg: AYBFou0W7+xgUSPcXvzR6NQhh31bkP/dsEY/L6c2UfTJeiic1ReyQaKhZAlaA3Zrgvp
	k8bgmFMWW4QmW3J2NrVdlYJ7PaKZsv2XEzO82wbggRIiYXBtEGUlgU/zMSrUzZAVQ3aONo85qKh
	I4ayXrWVlZTav+g2a6Lo9aaHdWBR/JIpDp20Bx1m72saw25144N+klqrCQ5rlxwq67qB+oPhtvP
	LFnuCYW3gseV8+LqyIs1xv83XRQ4Hr01TUm26oWtitiGvOeZVaUg5VQ8t5z3nw0TrYvSWMTFrPU
	f9cug/nhWkUq6tIEna5dqXTLWBY/7TGWr9/3As93/Kd911aNXooA+rgDNGhkQyodWZq50GZCbu9
	yXhC5GhaiFmV5z7gZw3R8VZNlMiYMdsXawQquRNGcCBRoD63rMkX/PN8P8VwSHoZc1GCJ/KKBJL
	z8xPJbARqDO873KOYQH06Xfxg+eHFSsJ/RLV0L2PDA4us4UlazfB/Ij70QpUysWSOk5DSZSi2/a
	S/rdRz7kBg3KikTYSukYToq4YDKZuKsC/aHjEPaFMfcWY4zNZTlI9LR5bOcpzn2XkJyljkJO2TT
	jWHC2VMZZfKhMNDZxucXXJ1n
X-Received: by 2002:a05:600c:871b:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4b6df5e87f8mr2566715e9.26.1793908517156;
        Thu, 05 Nov 2026 11:55:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:55:16 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 8/8] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Thu,  5 Nov 2026 20:50:28 +0100
Message-ID: <20261105195206.3440-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards and
declare the regulators that must be enabled at boot for proper operation.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  82 ++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..cc4770d70246
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc { };
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..c6af3def4a29 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
@@ -160,6 +162,11 @@ &i2c2 {
 	status = "okay";
 };
 
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -251,3 +258,78 @@ pins-eth {
 		};
 	};
 };
+
+&mt6392_vcore_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vproc_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vsys_reg {
+	regulator-min-microvolt = <1400000>;
+	regulator-max-microvolt = <2987500>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vxo22_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud22_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <2200000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vadc18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vusb_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vmc_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vmch_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vemc3v3_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vm_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
-- 
2.43.0

