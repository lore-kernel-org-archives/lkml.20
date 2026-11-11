Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794369936;
	b=aKzPHURtK5MyFlYB9c3xUp66y7iwei4a7Po1c6TPksASq+jPu9D/oqd/HdYRc+n2Tuya
	 aXs3gGboDjbCgoxmhA5fm3yY9+mGfAJu0rSx1e+kGCai/9zYfirtnhzwz4KPpvEF749YQ
	 lu8+AFhz/rR+UVxCCVOI/XHBks7IAh4Dmisd+v6DMn35/Vh8vfMKxiP3BB1u/xzZl3ZYw
	 wOAOoEAh2Fd/ZrsTrKt7GzmjLNWadcSULg9ic7Np/BCG2uYzNGOPUwFFgNgHZmLP3KfrP
	 ivPp35sKHcyF2i4AzngXKRFAGiLDD6diuqfom5lgCnGsU9ix/R9UWxiXeht9WuRtT8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369936;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gAl3uKNNrLCPmzztuQYjp7M14PtvPXf36Egd9q08Kug=;
	b=1Lqo7vQDoCKHUJhB/zJa/v5RCFw3nHD1jKpbTYmS0YluhKtSXDbLgbAVoWSWpR3G4LUl
	 NLVI6fWHm5dTkB87yiojDE3UiOojp28pNzM3cyzbB/qKcyBoHuBu5STNDo5/pSg0KRERV
	 lJ7nO1bjYrFyngNozXbgAzH0Ls6dbDAIqItyyCCLt1G243xSfenHkTzAen1EAamLqmiTV
	 dS3+XbPt/lsD/kEGKPujDgDF0M1WWdRsdaIaYNmGd7wvHWbEZyOmziCsP9FR8w5nKJyyJ
	 ZLrmuGE3Y4FNAHYWsEqXLt3O8poZKAq5T2NWvkZnVX3GwpkJR5aPjRKq7Fgi4Vw8tow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIzjq7gY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2D606A332;
	Wed, 11 Nov 2026 04:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIzjq7gY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794369936;
	b=gklqwpgM9Sa6BpTjYy+GpsoyiHt0BBUpBFOfrEzXaWBw1YNe99rhLLaSIiCy5EX9XQSI
	 arfR8M4RxvJNJJG2jXKy+2YUGP+wFTDUvyAtXoPnqc+QZFyrYL63ItWr/nmFsipA6dPZZ
	 bCOz6EJzs4q/SuapaG56VCbeBMj9s2RK/Y2No8sigBNcZ7Na0A+hhG2WAmfc0806d6w2o
	 Ff79q4S1Tm58GlhF3iKt0blVCFWBW7AjJwaC16U7U+NX91MqZhc0C34Yo+YbWREWweHxP
	 74UklPfnRbBUNXW1r7hA3TL4xV8a3xJ9wE1hZqGXMcw9/qKQ+dRUNGpozBKwbRocNMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794369936;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gAl3uKNNrLCPmzztuQYjp7M14PtvPXf36Egd9q08Kug=;
	b=Dr+5kmkz2t5AC/9hCrvdwat7wl1uRl1wfDHubPtfiux/mDfZY2KYH/02R28OiMZONIow
	 woiQ6xLiX+kJbmwA+ouc7vYVI5c//xwUGX8UQvcSuRaZ4e9K7JSj0sfcSs1svGt9Taxby
	 IEGJ8k+MP/HwuR3Kn5RWTQXi6bjKy9Xr20eps4lyC+bdwQJeEWTt+NKw165qYHK3nM/6I
	 FaHjDZMDXoBB+7J9hNUBHlteQOJaEN7HhKOzBIoTQEvq85422QUbP2vLet2lpQkZVl4vG
	 GsCGPvadeE09eE8H3LSDG0tnZSqfFJF1mp5KzVMXLqcqkmgjeqwUt82pCJF+auH3Xtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9BE11F00A00;
	Wed, 11 Nov 2026 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794369936;
	bh=gAl3uKNNrLCPmzztuQYjp7M14PtvPXf36Egd9q08Kug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YIzjq7gY5224ohO0t5Rx3T80lRWikKC3rI21tPhPsCvDvRGix8h6sda4nKmvUXYvW
	 NBZys6zHtuf29h5MRieQ4syrtIa710yqMSFtudaMujwLjIjgM+IjmiJy2KzsPqQJHm
	 p2ru3oaAeKqGdCxFIRhk1J/8eqbiv78CPCdfy0kYfUczpfEXsdD5zfFnuvTVWpl4P0
	 sWcc80vB+WIoDQp2dQv10bWqYYN3MIjNacYBsph0WOvIB2o3EiSxEdzMr4XvDw6ffv
	 qquPhMRsxrlCT9LCnS9y4mj1xQ8+L/Q15UfWVMhv88/i1c6teefdxRAaH++KYp6LfZ
	 6tWR5cor8055A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32DFC48D67;
	Wed, 11 Nov 2026 04:05:34 +0000 (UTC)
From: Vishal Balasubramanian via B4 Relay <devnull+vishal.bala.nps.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 09:35:33 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7 FE
 LTE
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
Message-Id: <20261111-master-v1-2-07b4f06a9dd5@gmail.com>
References: <20261111-master-v1-0-07b4f06a9dd5@gmail.com>
In-Reply-To: <20261111-master-v1-0-07b4f06a9dd5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794369932; l=15943;
 i=vishal.bala.nps@gmail.com; s=20261111; h=from:subject:message-id;
 bh=EsSIbl7TimOfDSVQy99MlMEiRu2Ac+c9ywmXD0O/dUQ=;
 b=0x9gL5GzQD7Z5cQuYf+LifiJZfUCvy4RiBMgeZLN15fCCHYELgLZIDC+3BlrVWFdyf3OSSxy7
 hTomWIFF7C6AZeT1FLcbs9mXKf2pfgz4uRqLDUJttJ/2PKDft2LIvYg
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
 .../boot/dts/qcom/sm7225-samsung-gts7xllite.dts    | 575 +++++++++++++++++++++
 2 files changed, 576 insertions(+)

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
index 0000000000000000000000000000000000000000..f3e3529277414a9f3d72d247a121f4379cfcd91c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7225-samsung-gts7xllite.dts
@@ -0,0 +1,575 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Vishal Balasubramanian <vishal.bala.nps@gmail.com>
+ */
+
+/dts-v1/;
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
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "framebuffer0";
+
+		framebuffer0: framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_mem>;
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
+		framebuffer_mem: memory@a0000000 {
+			reg = <0 0xa0000000 0 (2560 * 1600 * 4)>;
+			no-map;
+		};
+
+		knox_reserved: memory@b0200000 {
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
+	qcom,gsi-loader = "self";
+	memory-region = <&pil_ipa_fw_mem>;
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
+	vdda-phy-supply = <&vreg_l22a>;
+	vdda-pll-supply = <&vreg_l16a>;
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


