Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833712;
	b=Sk/MqykpV6B+o5zb4AdoiaNrNUvUFLZtIE1wxltEeCTTnItHeqceHR5AFlp0vuFY7umK
	 FLxrlPTtJ+RoRnxJrEHVOixb9b1TXuchd+I7F6Df4O6JsvfuUJd8G1u6wCghwAb5NuHdt
	 KTSgjxqyXhQyYVwq7W8R1v6oG3KmSLxLoOcH9CgvfaWwL/LYJ9Cpa0qV7B/rfnbqogszq
	 oGsNOPFScHKQuMDds0A1HB5YrVa8V8FueXRCdvKp7n7aywiMcrTLRmGkHS5jfQXcX9ODz
	 YVCiQ+H1zNLKzeFJFYuE67WZWdo2Izku7IazFdaQZ6zjcf4muhIoyGVvzLcBsB7zmjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=SKyZ+gA1zFAPWJawTLjZLkuT07Eh+TPRF0t3dr63la0=;
	b=Hm99xQHVoV7atmivBaxV+4fCx/3+iq67tnQhTZ3uwg5KhBK/Hc8Fc/5pDd+mjwc5GUSH
	 o5560sIKKuABPo5iHUcSH0qPv/06sxGkxUnnJ5/2BD6oq3DlYpy8kTKHxcj7X4xPpnvam
	 nNMVZJbWzXA1XhykUdHy20L34+ZdiKhTTAxDys084VNSVDHucwI5pr6OpBjRiSs4fvr0M
	 imcZnzPBjOcRmerZwkHgDT2XTTPicDVsfIHS2QBMRaWh/ejqWjSGB0Xtm+/6aE3ZhIIrD
	 V7qUKO0Ra/W0HdaaCZ8Bn+wSKP2T2JcFmY/8chZgIvobZU2kKspc+BE+meK4PmrJWBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AbBuSqHp;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D1606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63D1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AbBuSqHp
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e00eee27dso976278f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833710; x=1793438510; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SKyZ+gA1zFAPWJawTLjZLkuT07Eh+TPRF0t3dr63la0=;
        b=AbBuSqHpxV8ao8L5x75uJGbyR23dLTGgDmjh6t4PL8BCXffJdad7D4R6YK3+EKZ6w+
         Pi19BDhVC+naD2HJmAfuo4TiAkh0BQoff7b0Q7nFQTRt8ZomzJ7fKL90abrLeJz8fRz9
         0Wb2iQBsQrG1YM2pKGD9dSwZdV3Gca5PDFzRueb/XfITIU3omrmhslto3L9545bkOhsJ
         SupohLzGAqBywv3VXEU1IVB1m6+YkXA+sG+dNLFD1gTRtbaDzvZNkRqWQsFuIFl0bOAy
         JgeCdR4caPns9DzR3Jn1/VNNFDCc8/mcOmFxMBbje5z7V5TkPzkp0KYUZ2UIOQZcsKz2
         2Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833710; x=1793438510;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SKyZ+gA1zFAPWJawTLjZLkuT07Eh+TPRF0t3dr63la0=;
        b=O5HLio3Tnn9elD2qyghQVRLWlYII667uicQpmgs3kECHq6/y+DJzsDKgd9/J5b7uWW
         s6g0qrCDXXxJ/jzzHO6pDPL/4GCVYU/g29I/bw6F1Vokzk/HE27cQJXcoyScBIwJgSJ8
         b3oLojS7CgKX2m/Xd2vF+oXeEnvlMhVehobxhmF/7Km98DXTG/b/79n6lsS+a9sW6ltL
         sjF5Q7rWbYvlE4Gx50z12cJrp+lyXYsGiJJkb15nDXxtAJf5MKk2sK4K4892y33LWoLT
         LevUeOOTWuKz9M0H7uCFhNMxAV6mRFkK81Wmji+/gf4sFUgLebFYhnV0owz10CGzXdWb
         mH8w==
X-Forwarded-Encrypted: i=1; AKwUvBx9iJaJR7vO8g7y4OJ1wuOT3WxRZIuod215nh9np4PmC68UhZ3HeJdsQC0yr5uXSO59aesrcTU23CaihaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwpO8vY39mbzjVUOLADUtJl6Uwh8EzUd/75p7veRT1Mh+iSOq+
	CE84MEigh8SjrIojDK+ZO86qRmJlxPNVI7pquAz7ua0pBbAuIngXIFZJ
X-Gm-Gg: AYBFou0RsRy78uO38Sev+0LGfxB2uCMLvk1Fwe+VA8Ocjwf0CBmZ65q03UxgCY0ZW9n
	Ggz46S0uBLY3ggYJkKXNHrGLQTIRiEnsxvQlYDVSmXDupdoqLPxYar1ZzfaTtvcUevPSgDPmzbU
	B2pa6yQ5IdkxiIcVAUJEVgtOhpSt9pGZBbHCFt2+zp6n5MIdGA5w17ADPl48cahjY/KvsY1Qeik
	EolUNxQWFPVjsqvINYdUdGlpG5F5ZgRSENWL1nEBYtFZ1Xp16Qs9vOD03MPCMpYAZ9RCMsRsJme
	6WXbtvFI/a+ma1qIxKJxip8lUvECoVq/dxY2Uj735U+nTrOyVT2MnxqosLYTLcIugYjXNeBDl4d
	y2LDBr1iF2cy9uJGeXSYbBQpjXAQELswN0MbvwlFGkyPZ+HrTVRYPITO6pkEx2KOz0EsRkz1/qG
	b3IGxt6G/eNmvBN7L+AqlhriNwx9qba2/qKts7oBY0I2J0gPlnuXyhf1FX6Wcb3UU769UhuCnli
	lBxTO1+hh1ybrDzIvmjGRCUmWDFTSAErrDYSu20dNQSbCQtboWFFWVYfV78r1tZuX8E
X-Received: by 2002:a05:6000:46c8:b0:48d:ed30:f863 with SMTP id ffacd0b85a97d-48e3eb8dafemr1392309f8f.30.1792833709909;
        Sat, 24 Oct 2026 02:21:49 -0700 (PDT)
Received: from crispy-cucumber.local ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm3262044f8f.57.2026.10.24.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:21:49 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 24 Oct 2026 12:21:34 +0300
Subject: [PATCH v5] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13Myw6CMBCF4Vchs3ZML1zEle9hXLQwLTUWTAeIC
 eHdBd0Yl39yzrcAUwrEcM4WSDQHDkO/RXHIoOlM7wlDuzUooUoplECOlVQFsok89R61pUq6om5
 LrWA7PRO58PqA19u3ebJ3asZd2RcuDRHHLpH5gaX+h+ccJWqldS2kzU/WXnw04XFshgjr+gYNt
 kWQuAAAAA==
X-Change-ID: 20261020-sm7125-samsung-3be71f59d632
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
in 2021. Add initial device tree for SM7125 Samsung platform with
support for:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- Grip sensor
- UFS
- USB

Tested-by: Stefan Hansson <newbyte@postmarketos.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
(atoll) platform. This patch series introduces support for SM7125
Samsung devices with the following components enabled:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB
Along with that, SM7125 was affected by a hang when launching SHM
bridge. A similar issue was reported on a similar chipset:
https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.
---
Changes in v5:
- Moved the grip sensor i2c from /soc to /.
- Added spaces between bit-banged GPIO polarity flags.
- Changed "semtech,proxraw-strength" to 2 - that is the value set in
  vendor code.
- Link to v4: https://patch.msgid.link/20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com

Changes in v4:
- Dropped patches which were already merged.
- Added the Semtech SX9360 grip sensor. Unlike the rest of sensors which
  are behind SLPI, this is sensor is bit-banged over 51 (SDA) and 52
  (SCL) GPIOs.
- Because of a new sensor added to device tree which may require
  additional review, dropped the Reviewed-By: tags added by David and
  Konrad.
- Link to v3: https://patch.msgid.link/20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com

Changes in v3:
- Updated copyright information.
- Added tags given in v2.
- Link to v2: https://patch.msgid.link/20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com

Changes in v2:
- Renamed regulator nodes to satisfy dtbs_check.
- Renamed pin configurations for SD card to satisfy dtbs_check.
- Moved rmtfs_mem to the common dtsi, shifted addresses 0x1000 to the
  left and added "qcom,use-guard-pages".
- Converted decimal 0 to hex 0x0 where applicable.
- Pinctrl names are now listed after pinctrl themselves.
- Renamed vol-up to button-vol-up to satisfy dtbs_check.
- Framebuffer uses cont_splash_mem instead of retyping reg.
- Removed pinctrl-names from vibrator.
- Added a blank line at the top to the comment for &pm6150_pon
- Added a comment explaining what the reserved gpio ranges are.
- Added a blank line before "status = "okay"" where applicable.
- Link to v1: https://patch.msgid.link/20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 583 +++++++++++++++++++++
 4 files changed, 625 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..b0403077f867 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -394,6 +394,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-willow.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-samsung-a52q.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-samsung-a72q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
new file mode 100644
index 000000000000..ecba5be8164e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SM7125 Samsung Galaxy A52 (a52q) specific device tree source
+ *
+ * Copyright (c) 2026, Erikas Bitovtas. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sm7125-samsung-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy A52";
+	compatible = "samsung,a52q", "qcom,sm7125";
+	qcom,board-id = <0x22 0x6>;
+};
+
+&rmtfs_mem {
+	reg = <0x0 0xf4f00000 0x0 0x202000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
new file mode 100644
index 000000000000..f18d03de1585
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SM7125 Samsung Galaxy A72 (a72q) specific device tree source
+ *
+ * Copyright (c) 2026, Erikas Bitovtas. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sm7125-samsung-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy A72";
+	compatible = "samsung,a72q", "qcom,sm7125";
+	qcom,board-id = <0x22 0x5>;
+};
+
+&rmtfs_mem {
+	reg = <0x0 0xf3700000 0x0 0x202000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
new file mode 100644
index 000000000000..3a8339395d6c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SM7125 Samsung common device tree source
+ *
+ * Copyright (c) 2026, Erikas Bitovtas. All rights reserved.
+ */
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include "sm7125.dtsi"
+#include "pm6150.dtsi"
+#include "pm6150l.dtsi"
+
+/delete-node/ &rmtfs_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &tz_mem;
+
+/ {
+	chassis-type = "handset";
+
+	qcom,msm-id = <QCOM_ID_SM7125 0x0>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&gcc GCC_DISP_HF_AXI_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>, <&hall_sensor_default>;
+		pinctrl-names = "default";
+
+		button-vol-up {
+			label = "Volume Up";
+			gpios = <&pm6150l_gpios 8 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&pm6150_gpios 10 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			debounce-interval = <15>;
+		};
+	};
+
+	i2c-grip {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		i2c-gpio,delay-us = <2>;
+
+		pinctrl-0 = <&grip_sensor_i2c_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		grip-sensor@28 {
+			compatible = "semtech,sx9360";
+			reg = <0x28>;
+
+			interrupts-extended = <&pm6150l_gpios 5 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&vreg_l5a_2p7>;
+			svdd-supply = <&vreg_l8c_1p8>;
+
+			pinctrl-0 = <&grip_sensor_int_default>;
+			pinctrl-names = "default";
+
+			semtech,resolution = <1024>;
+			semtech,proxraw-strength = <2>;
+			semtech,avg-pos-strength = <512>;
+
+			#io-channel-cells = <1>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tz_mem: memory@80b00000 {
+			reg = <0x0 0x80b00000 0x0 0x7100000>;
+			no-map;
+		};
+
+		mpss_mem: memory@8b000000 {
+			reg = <0x0 0x8b000000 0x0 0x8900000>;
+			no-map;
+		};
+
+		wlan_mem: memory@93900000 {
+			reg = <0x0 0x93900000 0x0 0x200000>;
+			no-map;
+		};
+
+		ipa_fw_mem: memory@93b00000 {
+			reg = <0x0 0x93b00000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_region: memory@93b10000 {
+			reg = <0x0 0x93b10000 0x0 0x5000>;
+			no-map;
+		};
+
+		gpu_mem: memory@93b15000 {
+			reg = <0x0 0x93b15000 0x0 0x2000>;
+			no-map;
+		};
+
+		adsp_mem: memory@93c00000 {
+			reg = <0x0 0x93c00000 0x0 0x3e00000>;
+			no-map;
+		};
+
+		camera_region: memory@97a00000 {
+			reg = <0x0 0x97a00000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_npu_region: memory@97f00000 {
+			reg = <0x0 0x97f00000 0x0 0x500000>;
+			no-map;
+		};
+
+		venus_mem: memory@98400000 {
+			reg = <0x0 0x98400000 0x0 0x500000>;
+			no-map;
+		};
+
+		cdsp_mem: memory@98900000 {
+			reg = <0x0 0x98900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 (1080 * 2400 * 4)>;
+			no-map;
+		};
+
+		qseecom_region: memory@9e000000 {
+			reg = <0x0 0x9e000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		pstore_mem: ramoops@b4600000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb4600000 0x0 0x100000>;
+			record-size = <0x40000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x40000>;
+			pmsg-size = <0x40000>;
+		};
+
+		rmtfs_mem: memory {
+			compatible = "qcom,rmtfs-mem";
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 57 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm6150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a_1p1: smps1 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_s4a_1p0: smps4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s5a_2p0: smps5 {
+			regulator-min-microvolt = <1744000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_l1a_1p2: ldo1 {
+			regulator-min-microvolt = <1178000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_1p0: ldo2 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+			regulator-min-microvolt = <968000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a_0p9: ldo4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_2p7: ldo5 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_0p6: ldo6 {
+			regulator-min-microvolt = <568000>;
+			regulator-max-microvolt = <648000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_cx_wlan:
+		vreg_l9a_0p8: ldo9 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a_1p8: ldo11 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_1p8: ldo13 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1728000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p1: ldo17 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_3p0: ldo18 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a_2p85: ldo19 {
+			regulator-min-microvolt = <2696000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s8c_1p3: smps8 {
+			regulator-min-microvolt = <1120000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1616000>;
+			regulator-max-microvolt = <1984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p3: ldo2 {
+			regulator-min-microvolt = <1168000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_3p0: ldo6 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p95: ldo9 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
+
+&dispcc {
+	/* HACK: disable until a panel driver is ready to retain simplefb */
+	status = "disabled";
+};
+
+&pm6150l_gpios {
+	grip_sensor_int_default: grip-sensor-int-default-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-disable;
+	};
+
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm6150_gpios {
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio10";
+		function = "normal";
+		output-disable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
+&pm6150_pon {
+	/*
+	 * LinuxLoader fastboot implementation has most of its commands removed
+	 * by Samsung, making it useless. So reboot to Odin download mode instead.
+	 */
+	mode-bootloader = <0x15>;
+};
+
+&pm6150_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm6150_rtc {
+	status = "okay";
+};
+
+&qfprom {
+	vcc-supply = <&vreg_l11a_1p8>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9c_2p95>;
+	vqmmc-supply = <&vreg_l6c_3p0>;
+	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sdc2_on>;
+	pinctrl-1 = <&sdc2_off>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <59 4>; /* Fingerprint sensor SPI */
+
+	grip_sensor_i2c_default: grip-sensor-i2c-default-state {
+		pins = "gpio51", "gpio52";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sdc2_on: sdc2-on-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		sd-cd-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdc2_off: sdc2-off-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		sd-cd-pins {
+			pins = "gpio69";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l19a_2p85>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_l12a_1p8>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l11a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l17a_3p1>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l4a_0p9>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+
+	status = "okay";
+};

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261020-sm7125-samsung-3be71f59d632

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

