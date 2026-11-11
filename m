Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399895;
	b=ZRy3wkko67zn50HhK4VtsBEuebcbrHTQRPBTLaMMRWRdSzjDHoSRC2/AaRR1r0ECjP13
	 iDwSjxzkPJIiqtHl70o3WyF+u1Bhm9KDfBZCbkKADy5d1DNRgLZGv2UQ1RT1QkDKefMiv
	 c5QQu6qiSR8t36Ml2OANuCsi+pq9MD+VbgEepUgK9nnDV4yla8XkTRehOszwLoNZlDpmm
	 aDuvuT/fbCmmki2EVvnjOdzIBuCyiocTm/u0QWXG/qUQ94dWxLHPoSxU5kL2JEOUK5yV+
	 cNHd2Ly+gr0bIx0g1t6MwUwA5tWVyrD8PFzCwymLE2W0+j1jpR92cCGidPKyaIlFe8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399895;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wpsDcyDpSi69RutiRKOtmYzv6Iz8lYPokeT9R4GfvUY=;
	b=3kXTChqhvYZGaM53Ws/ejeciqMc415gH8VWRoJ/2sSHDFjrRrwjfKmOMVjLZTbGe4POd
	 59WJSyhnUGqg4lIYdVZKMBrN8moAwsN+vEj+LYGaJ9r/bm3IAgWJokjGCmxUP0uJaFYNK
	 tiajPZZriyWDsL9oTOMg9Z0J3ky9bKZAC75wn5CZc2SU5zFhOPfRrn9a3+EJS8QcEqNTs
	 shOMnKxcgEnFzKdbTBpKRGFsXGHnM3d7mOI+I05UxkiNT1vOImCvmA//VatXXNLkWgUsL
	 U2dQBU1GETrSyWCOkOn8Vx/SnVJQWPPMR8pCBJqHZe3pGV4mw65mzsC8OTz+By6Z2NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgOfEMK5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B1606A338;
	Wed, 11 Nov 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KgOfEMK5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399895;
	b=o1IRacvH8Yj380fdGSAbFHPWcIEo3kI3oPW2e3eqpg9gA90QrJ0MgOYEJqSFIkw3tl68
	 ++3LjWGkchqQ8UvZUu7vO3bBhX1vEtE1A5H+MbIviRHIsvDdRmWI/Gq90K4uASkwCQNWn
	 t5OT44yp3WsZakqUEAwBIhkBdfOHJ80LSq1SAF31MusR5N4VVo8Fb97G0wd4KMjr/B2WP
	 Q8Qbztw1OeEOOvSTvXBqHnPvRrLwvuiCTt52rjS4DO/iilJMikO6UOwDDRJBX9mn0EMoT
	 +RpK/puCuJiaFA8NOCRb1rpN4kIkT+9ewXz6OMg4GyG+saj0dmvkIbZmRJupBEQboOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399895;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wpsDcyDpSi69RutiRKOtmYzv6Iz8lYPokeT9R4GfvUY=;
	b=Ter3i7DuvWFpwu6OxrTyBPd2ElJ7OuKKjYPCA88dALshridLJdO9bDSOR6wTS+4pkE9R
	 SL/c4fx89Ua7ImGdojdnH4tiLJmdrqInQL9oSUi3E+lF50z6naA3mSQXBmWPJqawLo8Ep
	 Rgh2qUBIQSSqbelSo6g/9bUZRAJm/Qc5vonrbw7tJcq2D8ZCtOuSjX4Z9JvABcq/ymM5B
	 ONNtxO8shneiBjo+IR/73elIU5JHNV2HSR2u2v6IWXdULaDdHVqBV8AXinaNTUreoCQs/
	 rtNv/mEsrGCbA80hAI8lYzpqeeX/4LhzymZPVCNjZg4+SySXlgvsWVne+JQLmBHCRug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D25FD1F00A07;
	Wed, 11 Nov 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399895;
	bh=wpsDcyDpSi69RutiRKOtmYzv6Iz8lYPokeT9R4GfvUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KgOfEMK5B++vkuz17LC9aIXt3DF5eB1ukoJ4n3MBODPG8dnfc7F/q7YqMxt3+RAnq
	 1j02jHvDJnt8Knk/6Eg9ZEdD3PF2AdeutI1rflnwdP0XJ5m6wQiCzZm+fot3veAh5D
	 h6krYVpej9S7GJLv5NscZVyPmjuuUXquVUBLro6LocKNVtjoYpXEHigmGlZXiEDxsy
	 m/XCohh1yrtEbk0YMuVTP3c0Vgr9Om1hc/Go0QPWPHg95xyiHJYodiF6/Cw52TQx7c
	 PrFfYfpvrRg3cd2qgp/P8UCxF4+ZOI32sEceJs1vIt8bjqa1fxSy1p17uHo/UICI42
	 JKxJS94dyvjow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 62F5048F9F;
	Wed, 11 Nov 2026 12:24:53 +0000 (UTC)
From: Vishal Balasubramanian via B4 Relay <devnull+vishal.bala.nps.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 17:54:51 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7
 FE LTE
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
Message-Id: <20261111-master-v2-2-5eb864e9f38d@gmail.com>
References: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
In-Reply-To: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vishal Balasubramanian <vishal.bala.nps@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794399891; l=16017;
 i=vishal.bala.nps@gmail.com; s=20261111; h=from:subject:message-id;
 bh=+WLJsFvKBM+TxWDW1ZVuxWmroU2sNLN5/c9ER4YvVdA=;
 b=KxKaXM9XxYsDy+C6opl3ZzIMxeHk2MKlHAqTuTg1pTAB5L1ry6TFreL/zR6BrqZA1XqyUA/P8
 gI+/jqhan+FBQrrmTnERB80EaNwboxrP9wSq4c/y5da7fJGl4qgjP4V
X-Developer-Key: i=vishal.bala.nps@gmail.com; a=ed25519;
 pk=GDcoc+SAK+BHD1Eq17X/BJa9U2HZkBW+dmxS8s1xMAY=
X-Endpoint-Received: by B4 Relay for vishal.bala.nps@gmail.com/20261111
 with auth_id=1486
X-Original-From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
Reply-To: vishal.bala.nps@gmail.com
Content-Transfer-Encoding: 7bit

From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>

Adds initial support for the Samsung Galaxy Tab S7 FE LTE (SM-T735),
a tablet based on the Qualcomm Snapdragon 750G (SM7225) SoC.

The following is supported:
- Framebuffer
- Volume Up, Down and Power Buttons
- UFS Storage and SD Card
- USB
- Modem, ADSP and CDSP
- Wi-Fi and Bluetooth
- Cellular Data and SMS

The reserved-memory layout deviates from sm6350.dtsi. The ADSP
firmware shipped on this device requires a 64 MiB carveout, so the
ADSP, camera, NPU, video and CDSP regions are redeclared at the
addresses used by the vendor firmware. The bootloader also reserves
additional memory (removed_region enlarged to 0x5e00000, plus the
fastuh region); without these reservations the device hangs under
memory pressure.

qcom,msm-id and qcom,board-id are required for the Samsung
bootloader to boot the kernel.

Signed-off-by: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm7225-samsung-gts7xllite.dts    | 586 +++++++++++++++++++++
 2 files changed, 587 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea91ea2132f8d5ff2b971b5f682559..4c6fdaa14347b2d4cd569096bf4467d9ff5c2dc2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -397,6 +397,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-samsung-gts7xllite.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-motorola-dubai.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-motorola-dubai-csot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-motorola-dubai-tianma.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts b/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
new file mode 100644
index 0000000000000000000000000000000000000000..e472e3016cb9e1b3a3b015ce64f53e3896d32d32
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Vishal Balasubramanian <vishal.bala.nps@gmail.com>
+ */
+
+/dts-v1/;
+
+#define PMK8350_SID 6
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm7225.dtsi"
+#include "pm6150l.dtsi"
+#include "pm6350.dtsi"
+#include "pmk8350.dtsi"
+
+/delete-node/ &pil_adsp_mem;
+/delete-node/ &pil_camera_mem;
+/delete-node/ &pil_npu_mem;
+/delete-node/ &pil_video_mem;
+/delete-node/ &pil_cdsp_mem;
+/delete-node/ &ramoops;
+/delete-node/ &removed_region;
+
+/ {
+	model = "Samsung Galaxy Tab S7 FE LTE";
+	compatible = "samsung,gts7xllite", "qcom,sm7225";
+	chassis-type = "tablet";
+
+	qcom,msm-id = <QCOM_ID_SM7225 0x10000>;
+	qcom,board-id = <8 5>;
+
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		framebuffer0: framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_memory>;
+			width = <1600>;
+			height = <2560>;
+			stride = <(1600 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pin>;
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm6350_gpios 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reserved-memory {
+		pil_adsp_mem: memory@84800000 {
+			reg = <0x0 0x84800000 0x0 0x4000000>;
+			no-map;
+		};
+
+		pil_camera_mem: memory@88800000 {
+			reg = <0x0 0x88800000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_npu_mem: memory@88d00000 {
+			reg = <0x0 0x88d00000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_video_mem: memory@89200000 {
+			reg = <0x0 0x89200000 0x0 0x500000>;
+			no-map;
+		};
+
+		pil_cdsp_mem: memory@89700000 {
+			reg = <0x0 0x89700000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		fastuh_mem: memory@b0200000 {
+			reg = <0x0 0xb0200000 0x0 0x200000>;
+			no-map;
+		};
+
+		ramoops@b1b00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb1b00000 0x0 0x100000>;
+			record-size = <0x40000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x40000>;
+			pmsg-size = <0x40000>;
+		};
+
+		removed_region: memory@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x5e00000>;
+			no-map;
+		};
+
+		memory@efe01000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xefe01000 0 0x600000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+	};
+};
+
+&adsp {
+	firmware-name = "qcom/sm7225/Samsung/gts7xllite/adsp.mbn";
+
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm6350-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a: smps1 {
+			regulator-name = "vreg_s1a";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_s2a: smps2 {
+			regulator-name = "vreg_s2a";
+			regulator-min-microvolt = <1503000>;
+			regulator-max-microvolt = <2048000>;
+		};
+
+		vreg_l2a: ldo2 {
+			regulator-name = "vreg_l2a";
+			regulator-min-microvolt = <1503000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-name = "vreg_l4a";
+			regulator-min-microvolt = <352000>;
+			regulator-max-microvolt = <801000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <1503000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-name = "vreg_l6a";
+			regulator-min-microvolt = <1710000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-name = "vreg_l9a";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3401000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a: ldo12 {
+			regulator-name = "vreg_l12a";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a: ldo13 {
+			regulator-name = "vreg_l13a";
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a: ldo14 {
+			regulator-name = "vreg_l14a";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a: ldo15 {
+			regulator-name = "vreg_l15a";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a: ldo16 {
+			regulator-name = "vreg_l16a";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <921000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a: ldo18 {
+			regulator-name = "vreg_l18a";
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1049000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a: ldo19 {
+			regulator-name = "vreg_l19a";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a: ldo20 {
+			regulator-name = "vreg_l20a";
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <801000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a: ldo21 {
+			regulator-name = "vreg_l21a";
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <825000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22a: ldo22 {
+			regulator-name = "vreg_l22a";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s8e: smps8 {
+			regulator-name = "vreg_s8e";
+			regulator-min-microvolt = <313000>;
+			regulator-max-microvolt = <1395000>;
+		};
+
+		vreg_l1e: ldo1 {
+			regulator-name = "vreg_l1e";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e: ldo2 {
+			regulator-name = "vreg_l2e";
+			regulator-min-microvolt = <1170000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e: ldo3 {
+			regulator-name = "vreg_l3e";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1299000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4e: ldo4 {
+			regulator-name = "vreg_l4e";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5e: ldo5 {
+			regulator-name = "vreg_l5e";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-name = "vreg_l6e";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7e: ldo7 {
+			regulator-name = "vreg_l7e";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-name = "vreg_l8e";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9e: ldo9 {
+			regulator-name = "vreg_l9e";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10e: ldo10 {
+			regulator-name = "vreg_l10e";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3401000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11e: ldo11 {
+			regulator-name = "vreg_l11e";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3401000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <5492000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+};
+
+&cdsp {
+	firmware-name = "qcom/sm7225/Samsung/gts7xllite/cdsp.mbn";
+
+	status = "okay";
+};
+
+&dispcc {
+	/* Disable for now to keep framebuffer alive */
+	status = "disabled";
+};
+
+&ipa {
+	firmware-name = "qcom/sm7225/Samsung/gts7xllite/lagoon_ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&mpss {
+	firmware-name = "qcom/sm7225/Samsung/gts7xllite/modem.mbn";
+
+	status = "okay";
+};
+
+&pm6350_gpios {
+	gpio_keys_pin: gpio-keys-state {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-pull-up;
+		input-enable;
+		power-source = <0>;
+	};
+};
+
+&pm6350_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmk8350_pon {
+	status = "disabled";
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&qup_uart1_cts {
+	/delete-property/ bias-disable;
+	bias-bus-hold;
+};
+
+&qup_uart1_rts {
+	drive-strength = <2>;
+	/delete-property/ bias-pull-down;
+	bias-disable;
+};
+
+&qup_uart1_rx {
+	/delete-property/ bias-disable;
+	bias-pull-up;
+};
+
+&qup_uart1_tx {
+	drive-strength = <2>;
+	/delete-property/ bias-pull-up;
+	bias-disable;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&sdc2_off_state {
+	sd-cd-pins {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&sdc2_on_state {
+	sd-cd-pins {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9e>;
+	vqmmc-supply = <&vreg_l6e>;
+
+	cd-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&tlmm {
+	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
+		pins = "gpio61";
+		function = "gpio";
+		bias-bus-hold;
+	};
+
+	qup_uart1_sleep_rts: qup-uart1-sleep-rts-state {
+		pins = "gpio62";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	qup_uart1_sleep_tx: qup-uart1-sleep-tx-state {
+		pins = "gpio63";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	qup_uart1_sleep_rx: qup-uart1-sleep-rx-state {
+		pins = "gpio64";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart1 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 64 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart1_sleep_cts>, <&qup_uart1_sleep_rts>,
+		    <&qup_uart1_sleep_tx>, <&qup_uart1_sleep_rx>;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3991-bt";
+
+		vddio-supply = <&vreg_l11a>;
+		vddxo-supply = <&vreg_l7a>;
+		vddrf-supply = <&vreg_l2e>;
+		vddch0-supply = <&vreg_l10e>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l7e>;
+	vcc-max-microamp = <800000>;
+	vccq2-supply = <&vreg_l12a>;
+	vccq2-max-microamp = <800000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l18a>;
+	vdda-pll-supply = <&vreg_l22a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	maximum-speed = "super-speed";
+	dr_mode = "otg";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l18a>;
+	vdda-pll-supply = <&vreg_l2a>;
+	vdda-phy-dpdm-supply = <&vreg_l3a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l16a>;
+	vdda-pll-supply = <&vreg_l22a>;
+
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l4a>;
+	vdd-1.8-xo-supply = <&vreg_l7a>;
+	vdd-1.3-rfa-supply = <&vreg_l2e>;
+	vdd-3.3-ch0-supply = <&vreg_l10e>;
+	vdd-3.3-ch1-supply = <&vreg_l11e>;
+
+	status = "okay";
+};

-- 
2.47.3


