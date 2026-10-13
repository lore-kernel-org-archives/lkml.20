Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A3F3D5657
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899911; cv=none; b=YeMgmcvKot3Rv670gMlFHEEYXjsD80oEgdE9/M+AzboOxagp8PIR2c0jKYV9aq/AQWhiAX/83hNR+L7ljBh96cJTyMbOxPYLvC9r2N3fzt1+TWwSZtDP3uy8PQ5Z7DSgE2W++mfqFrRgTU49bcu0gM1NfPb+A/DA6dwE5d7sIRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899911; c=relaxed/simple;
	bh=A6EgwcAPrkgd0TNYm4jKiRww+TmpIMKuOrZPLhmy5As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JqnDO3fE1vmx1kx8wg90wQUqKo6xLMScU12GiBjR/hQBxBtba5tDQAKSOPhQhIicfz19tlroxPb8nHFAddMrTju/oudPJRLGszVzpLEA5h6ZdfW1OruWFZSadQ2K+VgJLUpI0sUcJkcD0Y4D07KtBCHjhC72xDNls2fSlc1AhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLw68mxU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLw68mxU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso1767749f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791899908; x=1792504708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7facGHJY8nCIDmNABw6w2tDnLOcmNe/kQzSYMmWr2NI=;
        b=FLw68mxUeb6RLm4b3BKPWzUKz/xc85YQqMZRNx9S2a0PHlHJ8vxaoSZz2MDdMzesbO
         IvebL9uzH4IxQ/GJXD4fEPRSrZfM7Xl6K/aqkIkVScyGXdsRVs5i6ToGpn5iiwNTo7y6
         t7cfYk/7ok4CyrAanJ3tgWa5nqsvICKQAfUtz0Bio6ENfR+skA0enThah7yKIAC71gpE
         9bATpVXIqV3I3z3RwJB2SlHsr7erm2b9wQb1SkFqJOKJQcf0lSqFvHDI8KXZM84/RMyM
         t2Jnd/Q4srtvE+FAIQvQeInH9CnvJSi0H/a2iVFSans5dNhDfqVA2Als9obLyzmOHkcw
         b/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899908; x=1792504708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7facGHJY8nCIDmNABw6w2tDnLOcmNe/kQzSYMmWr2NI=;
        b=p5LGysKYYAtaR7SRjbICmjS0tfKThlNP68hrRtOueCjiAYH/JHWc9ot6UvdEtrAw+e
         qrjMFXAW7/J6En5FWSmG2HcX5SKbShAr7o+Gkm6LCCZ2uJ2ySBRxBn6eLaeIKIRSjjni
         yDXsKOp1VhZZhIAglUZCjTmEttKStCGpcIgBWpCoKdEODEuMiUxRUt0vln7Lu3yGN1t2
         OFF7iI7aU6H2F6eRl/QpmSxyk5q9otkAPpa1/1AKxlDeA7XmfUS91K8WPSfisIaByqbL
         B0GTtKlrCH9UzlpmeF0FoN+wSF25xGNHJohioCVDjghhQMyINIySRs7RVzxpGoYT+f7s
         wg+A==
X-Forwarded-Encrypted: i=1; AKwUvBxqxQy1dh/TbcLg3d3U5Uxdq79eAaTajNdwS4po78Q7uUER7EQ5JXhci5TbIlHRDMAuTUDPVCzz92cQGN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKje4nsQefvo5vQoLfLYTfZakUlMg30XP7Gmd/kb5UjKPaEBOIJ
	yFOu9+IKlZHw9n5ol4w7cELYALrG8hw6F2+CLPP7QuNXHGSvIm44bnLH
X-Gm-Gg: AYBFou1hUpP/bK4Z4nEogT/+Dl19OafaxzxOogF+f+2El8d7k8VUBU8GPMAPVXVeScX
	xhCOcQCoajl0eHAcskpdbt6y47kUWpH9yCkQtW0NJXFDpqLLml2h+YG1Tfn4lIJqPfWh6r366OR
	c9wV2cTaeTMaiIBU609pH+FRmVPBxizOsoQkNpQeGYyIz9XZVRI8Qolbc1YuE93pxOIXj9qtIrO
	+lPkSXlRpyC2uesStQpWzQDfX0wXLGE3GU4tRQmFrBTKy0RIK049AKP0bEYeyKIQjLMLT/Q3y6s
	2SWC7P36PTa2Cbp9eHvfC3lRoWCBYLaezE30CR1PN22dVkXzHIQmBP2wzwU0WXZUOGtQkiOKJcJ
	3i7X1AzjK0Pf0AkG2gx9B0AF0Q7O32+LE64V2C0U4WVeplmOyYLVECUVU7rddKbGSpFdH/0eflB
	yJxHRcElrw2SZK24RkjOje1gQIK5IoWNgz6s9Aq5bf/UP7RE5gJ/pgeM9XRA0WhCft2SNNhg5QC
	ayc/xYI3g==
X-Received: by 2002:a05:6000:22c2:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48dbacf3275mr23042807f8f.41.1791899907529;
        Tue, 13 Oct 2026 06:58:27 -0700 (PDT)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa05sm4753360f8f.13.2026.10.13.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:58:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 13 Oct 2026 16:58:20 +0300
Subject: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XPQQ6DIBCF4asY1qUZQMR21Xs0XQiOSlO1ESVtj
 Hcv6qJGly+Z7yeMxGFn0ZFrNJIOvXW2bcKITxExVdaUSG0eNuHAE0i4oq5WjEvqstoNTUl1kso
 81ReTx0ACendY2M8SvD/W7Qb9RNPPlfmisq5vu+/yomfz3RpXIPZxzyhQgbJQkkOcGnYr68y+z
 qatyRz3fMvlgfPAc6GZApBotNhz8ecpHL7mReCZASYuKE3C+JZP0/QD6vDDHjwBAAA=
X-Change-ID: 20260627-sm7125-samsung-b685d8b9cd40
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Abel Vesa <abelvesa@kernel.org>
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

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 589 +++++++++++++++++++++
 4 files changed, 631 insertions(+)

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
index 000000000000..7c5d062bd080
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -0,0 +1,589 @@
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
+	aliases {
+		i2c17 = &i2c_17;
+	};
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
+&soc {
+	i2c_17: i2c-17 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
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
+			semtech,proxraw-strength = <1>;
+			semtech,avg-pos-strength = <512>;
+
+			#io-channel-cells = <1>;
+		};
+	};
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
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

