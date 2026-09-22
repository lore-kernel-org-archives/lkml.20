Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BE53B341
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076530; cv=none; b=Zy8NL4EJKoCrYvLM/0x0sZbdfj/yBw1Bc62QwfvMbHfyQQ8JtrBXryE8oIquCg59aRzGVT58AEiWUh7GTnAWlI+UAkbjNLOXZ8Jomz6fZ7nfS4AXmtU8ICZfN1bADfBcMARY1TGdmgbO/O3aiBl3PUq6cIWvavPFTVPBQnLjkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076530; c=relaxed/simple;
	bh=SRkeW7cD/ZkeXoXmI/qxQUCkmC9F831vI9OA0zDFSQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kM6xG71MEghQLd40O1NnVdU6wHSCD70zGv59GxfIoDzTwDaX+P6je5e2W6++onovJ5yh/utyz3bR+qhbhBvXCaATEaZXJZD6ABLu4/Qu+7KSDO4JoYfZGhEJDS6DCilDygi58gKaqfEajO6s7uyiG1Erln+asHxXIIcL20uzhwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNNPhcZU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNNPhcZU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so34138685e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790076521; x=1790681321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjpa7EptOv7WHBDxjsrYlJ5SdseWg2Hw5ulyaYg9L3E=;
        b=FNNPhcZUJHKPrhuvRR+JbCGJH+1IJ0fabDIkNSFd58s14Dz2Q2quGS9D8F/yFNhO11
         R29xTK3L73X62YwZ1ltuGnqEbbaOd601UHevJ/Z/yNRUNV4q12b/u6RemSzTMKDAgxup
         /I3MxCDE4/NoMTZPCn+S4W017nN0BeEd6vWwzJUZ3EPofxO/XTXAiP1VMzLlhwhSIcM8
         iKyA5ZZfdph22je++ldc7Cl1L00vg4zQLtB7w+AV/qm6DeBBS0YqTnhswNnjBZZF2+B/
         dtKaPuoqKfNHh8cv3TZUvUkDjcCbPEV6bTtEMWJsqCiuB4cCYVYezhH4qSgb3JbiFiDq
         ckxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076521; x=1790681321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjpa7EptOv7WHBDxjsrYlJ5SdseWg2Hw5ulyaYg9L3E=;
        b=s9/JHBJm6CziEyV77i9FnVUy0uz6UjEzjeMRmqL4ycZFs7cueB4CoCzhhr+O8wFpSg
         khLYmDlvJC4RxY9Ukteq325QaK0Mo1NhQENSCulagxXIeclvR/t9SO0IiM4r/zlxNIGx
         gbagfbUwne9NMy0LVfxJOJ0A903R5qNdTlidIFdjUICgigzwBEGlyezJsC05JTwdLm2k
         Bg9SU0z8YBK65n3HEVUIe5W/jr8HOtxdoOvkgEnQqEOMK1sx4/g61of3qGmrZmcWdM+L
         XIPmuKwqEWfvnW3DygJ6hjuXUxr/+5fizBnas/w/bySMipDrfjxrbUBnylqXptjGnW6o
         ParA==
X-Forwarded-Encrypted: i=1; AKwUvBx0cKk1bAPb3cmeGGHfAZuEVcWxvsAXM1grtjPFkEnDRVow1gfFb3VCgMGFIPl23d52Y4PZIbNEWWhvce0=@vger.kernel.org
X-Gm-Message-State: AFuF++nt4mLUCbpcvOi2ddH4o40J1yQvbgw2xk+9BbsUbtBlHrenSlDb
	ZcYf73qbAC1FpBuPcQwbHMiDy0yd8HH7CFNXngCZ73FDqSQAuigbENjzNtmKmuGt7SQ=
X-Gm-Gg: AYBFou3SOc2up/xkuE/Dg8LXPgD0GSqMFkuPILlef3w5nDqNq8X3W+LvgQICvKnPH5s
	6doGOACjtoJjqLUh0ZCUi8eF8PHLyfj/A/sGNerHCtpt0qxjJWeRU2CMK329NGn3cEla73Im/Uc
	AHW9C+J8KYMSGwxv5hoxGMVAuPq+glVb2q1vdd+e8btVMwbCcCDKOtHA0XkPAVodNWFa2787CoI
	XJjf7KNjuSvUNV3O+Jkk/JwLaVMmbOjbXYBuM9bX5KrTd9bRII2UN+9F1FxRLPB15hoL6ellJf9
	yBmjAsco4dqP8UyjJBae1LBwkTEFhTF96WmIUkrdFWpmvWxFsn0tqNgx0YtsO42dcXL+Nxg1DXm
	GgR2BmF+QrEnkI5OuBU/EzDNBgop1UnShXu5Fdt9B2+gvKHweMVkKJBUDsLd4o9qfVB/lr3fgE8
	wtamTjKASRMjrzoRCGQQF3vMexlLi6IX9Y0XBvrLHMwvH+ZNDfxGUvtxFyyGhAy7NHBteRR0DYg
	6bkTyBtWC/jRb0586Ky
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr213283795e9.31.1790076520375;
        Tue, 22 Sep 2026 04:28:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm6687485e9.3.2026.09.22.04.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 22 Sep 2026 13:28:36 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
In-Reply-To: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=32347;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SRkeW7cD/ZkeXoXmI/qxQUCkmC9F831vI9OA0zDFSQ4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsmZlE/GqokgrucG3sCoQ6Ltf6ryZzL9X379SPped
 Trh60cOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarJmZQAKCRB33NvayMhJ0Y+CD/
 sG2UI1k0L1fEURfMibJ9OL0fa+wBKE0LrwCP2rRBqvWDf5O7ItTtM0jRVKCojkrY8uHQ1ZvDRyFvQB
 HbwM+IR24In/yFPaMTkf2ox2hfx9Y+LZ29uiMlG4NiMtBgzWCYLTbDxExVeiQDA8WweX5P8T/h/qJo
 u838oN3hOnkXwqvQN6zkK21vOvhk0WormkEOjXdpxngvBiGgP2grJdQELTBQvBi7+jGYR+F6X4kiSE
 h0lMHWAoKXRcRjEopKknGsUCrcHMus2Rlky8IUFprBharlQCd9t886yWD8BpN75GNbqYAgG3jxWl0k
 LJ9jEQw+o8tIrWaSsm4GmAGHiqW21RXH5sZj8cuwQy1zpY/rKEQRGOS1rFLkrsGVuocZzduA+tamEB
 k9SoKM/aoxefw3cIh4EX/CnPSSS3o1u8QEvjhGN2Lkl6mcEo3Emb4+lLUEDSzL0PXq3C4ar9ZdvZjz
 VegGr5Gi5RO7UHmAzquBRkXjb/lvGd9K/xLFD6V/v3pgSVM+Flaa0xQrFOL2if+r2EuywzPLFcKomG
 Yj+H60UI4LSVxGDQJT0r645SrFZ0s+xmZorV+8lnDORp8XH/S8qmz9dJJ8YdJA8FtnI17+L6LtIweu
 kZHctzywzI65EVIENDBfEcEUDemM0P0KyQO7G0NCsjRslFL1Y7Ceb990TR9g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add an initial DeviceTree for the Valve "Steam Frame"
codename Deckard. The Steam Frame is a virtual reality headset
based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Providing initial support for:
- System reserved memory, regulators, gpio keys, PMIC functions..
- PMIC ADC Channels
- UFS Storage
- USB Gadget
- WCN7850 Wifi7 + Bluetooth
- I2C + basic peripherals
- SDCard slot

The bootloader starts Linux in EL2, thus a bunch of EL1 & DSP related
nodes needs to be removed and the reserved-memory mapping must
be defined.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile                 |    1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1290 +++++++++++++++++++++
 2 files changed, 1291 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..3de6d95135a7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -406,6 +406,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
new file mode 100644
index 000000000000..cd801359d2b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -0,0 +1,1290 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Valve Software
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/phy/phy.h>
+#include "sm8650.dtsi"
+#include "pm8010.dtsi"
+#include "pm8550.dtsi"
+#include "pm8550b.dtsi"
+#define PMK8550VE_SID 8
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/* Remove nodes */
+/delete-node/ &ipa;
+/delete-node/ &gpu_zap_shader;
+/delete-node/ &lpass_wsa2macro;
+/delete-node/ &lpass_rxmacro;
+/delete-node/ &lpass_txmacro;
+/delete-node/ &lpass_wsamacro;
+/delete-node/ &lpass_vamacro;
+/delete-node/ &lpass_tlmm;
+/delete-node/ &remoteproc_adsp;
+/delete-node/ &remoteproc_cdsp;
+/delete-node/ &remoteproc_mpss;
+/delete-node/ &reserved_memory;
+/delete-node/ &swr0;
+/delete-node/ &swr1;
+/delete-node/ &swr2;
+/delete-node/ &swr3;
+
+/ {
+	model = "Valve Deckard";
+	compatible = "valve,deckard", "qcom,sm8650";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart14;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+
+		framebuffer {
+			compatible = "simple-framebuffer";
+			width = <4320>;
+			height = <2160>;
+			stride = <(4320 * 4)>;
+			format = "a8r8g8b8";
+			memory-region = <&framebuffer_mem>;
+
+			/* Bootloader will enable the node */
+			status = "disabled";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>, <&select_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+
+		key-select {
+			label = "Select";
+			linux,code = <KEY_SELECT>;
+			gpios = <&pm8550b_gpios 5 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reserved-memory {
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		aop_mem: aop-region@81c00000 {
+			no-map;
+			reg = <0x0 0x81c00000 0x0 0x60000>;
+		};
+
+		ramoops: ramoops-region@84a00000 {
+			compatible = "ramoops";
+			reg = <0 0x84a00000 0 0x100000>;
+			record-size = <0x40000>;
+			console-size = <0x40000>;
+			pmsg-size = <0x1000>;
+			ecc-size = <16>;
+		};
+
+		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
+			compatible = "qcom,cmd-db";
+			reg = <0x0 0x81c60000 0x0 0x20000>;
+			no-map;
+		};
+
+		/* merged aop_config, tme_crash_dump, tme_log */
+		aop_config_merged_mem: aop-config-merged-region@81c80000 {
+			reg = <0x0 0x81c80000 0x0 0x75000>;
+			no-map;
+		};
+
+		smem: smem-region@81d00000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x81d00000 0x0 0x200000>;
+			hwlocks = <&tcsr_mutex 3>;
+			no-map;
+		};
+
+		cpucp_fw_mem: cpucp-fw-region@d8040000 {
+			reg = <0x0 0xd8040000 0x0 0x1b2000>;
+			no-map;
+		};
+
+		video_mem: video-region@9bb00000 {
+			reg = <0 0x9bb00000 0 0x800000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat-region@82700000 {
+			reg = <0 0x82700000 0 0x100000>;
+			no-map;
+		};
+
+		/* 2MB, 8 clocks to power on each 256KB block */
+		lpass_lpi_tcm: lpm-region@6000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x06000000 0 0x00200000>;
+			no-map;
+		};
+
+		/* 64KB, 4 clocks to power on each 16KB block */
+		lpass_audio_lpm: lpm-region@6c80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x06c80000 0 0x10000>;
+			no-map;
+		};
+
+		/* 12KB, 1 clock */
+		lpass_va_lpm: lpm-region@6d40000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x06d40000 0 0x3000>;
+			no-map;
+		};
+
+		lpass_lpm: lpm-region@7c10000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x07c10000 0 0x8000>;
+			no-map;
+		};
+
+		framebuffer_mem: framebuffer-region@af400000 {
+			reg = <0 0xaf400000 0 0x03000000>;
+			no-map;
+		};
+	};
+
+	/delete-node/ smp2p-adsp;
+	/delete-node/ smp2p-cdsp;
+	/delete-node/ smp2p-modem;
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_en>, <&bt_default>;
+
+		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4i_0p85>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddio1p2-supply = <&vreg_l3c_1p2>;
+		vddaon-supply = <&vreg_s2c_0p8>;
+		vdddig-supply = <&vreg_s3c_0p9>;
+		vddrfa1p2-supply = <&vreg_s1c_1p2>;
+		vddrfa1p8-supply = <&vreg_s6c_1p8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s6c_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l12-supply = <&vreg_s6c_1p8>;
+		vdd-l15-supply = <&vreg_s6c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		qcom,pmic-id = "b";
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2720000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5b_3p1: ldo5 {
+			regulator-name = "vreg_l5b_3p1";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_1p8: ldo8 {
+			regulator-name = "vreg_l8b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p8: ldo12 {
+			regulator-name = "vreg_l12b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1c_1p2>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "c";
+
+		vreg_s1c_1p2: smps1 {
+			regulator-name = "vreg_s1c_1p2";
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1348000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2c_0p8: smps2 {
+			regulator-name = "vreg_s2c_0p8";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1036000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3c_0p9: smps3 {
+			regulator-name = "vreg_s3c_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4c_1p2: smps4 {
+			regulator-name = "vreg_s4c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1280000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5c_0p7: smps5 {
+			regulator-name = "vreg_s5c_0p7";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6c_1p8: smps6 {
+			regulator-name = "vreg_s6c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-name = "vreg_l3c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p9: ldo1 {
+			regulator-name = "vreg_l1d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "e";
+
+		vreg_l3e_0p9: ldo3 {
+			regulator-name = "vreg_l3e_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l2-supply = <&vreg_s1c_1p2>;
+		vdd-l3-supply = <&vreg_s3c_0p9>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g_0p9: ldo1 {
+			regulator-name = "vreg_l1g_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2g_1p1: ldo2 {
+			regulator-name = "vreg_l2g_1p1";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g_0p91: ldo3 {
+			regulator-name = "vreg_l3g_0p91";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3c_0p9>;
+		vdd-l2-supply = <&vreg_s3c_0p9>;
+		vdd-l3-supply = <&vreg_s1c_1p2>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "i";
+
+		vreg_s4i_0p85: smps4 {
+			regulator-name = "vreg_s4i_0p85";
+			regulator-min-microvolt = <852000>;
+			regulator-max-microvolt = <1004000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_0p88: ldo1 {
+			regulator-name = "vreg_l1i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_0p88: ldo2 {
+			regulator-name = "vreg_l2i_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_1p2: ldo3 {
+			regulator-name = "vreg_l3i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+
+		vdd-l1-l2-supply = <&vreg_s1c_1p2>;
+		vdd-l3-l4-supply = <&vreg_bob2>;
+		vdd-l5-supply = <&vreg_s6c_1p8>;
+		vdd-l6-supply = <&vreg_bob2>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		qcom,pmic-id = "m";
+
+		vreg_l1m_1p1: ldo1 {
+			regulator-name = "vreg_l1m_1p1";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_2p8: ldo3 {
+			regulator-name = "vreg_l3m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_2p8: ldo4 {
+			regulator-name = "vreg_l4m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_1p8: ldo5 {
+			regulator-name = "vreg_l5m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6m_2p8: ldo6 {
+			regulator-name = "vreg_l6m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_3p3: ldo7 {
+			regulator-name = "vreg_l7m_3p3";
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			regulator-always-on;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+
+		vdd-l1-l2-supply = <&vreg_s1c_1p2>;
+		vdd-l3-l4-supply = <&vreg_bob2>;
+		vdd-l5-supply = <&vreg_s6c_1p8>;
+		vdd-l6-supply = <&vreg_bob2>;
+
+		qcom,pmic-id = "n";
+
+		vreg_l1n_1p1: ldo1 {
+			regulator-name = "vreg_l1n_1p1";
+			regulator-min-microvolt = <1104000>;
+			regulator-max-microvolt = <1104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2n_1p2: ldo2 {
+			regulator-name = "vreg_l2n_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3n_2p8: ldo3 {
+			regulator-name = "vreg_l3n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4n_2p8: ldo4 {
+			regulator-name = "vreg_l4n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5n_1p8: ldo5 {
+			regulator-name = "vreg_l5n_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6n_2p8: ldo6 {
+			regulator-name = "vreg_l6n_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&dispcc {
+	status = "disabled";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&i2c_hub_8 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	right_spkr_i2s: speaker@38 {
+		compatible = "maxim,max98390";
+		reg = <0x38>;
+
+		reset-gpios = <&tlmm 73 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&r_spkr_irq_default>;
+		pinctrl-names = "default";
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Speaker Right";
+
+		maxim,temperature_calib = <1024>;
+		maxim,r0_calib = <100232>;
+	};
+
+	left_spkr_i2s: speaker@3d {
+		compatible = "maxim,max98390";
+		reg = <0x3d>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&l_spkr_irq_default>;
+		pinctrl-names = "default";
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Speaker Left";
+
+		maxim,temperature_calib = <1024>;
+		maxim,r0_calib = <100232>;
+	};
+
+	light-sensor@60 {
+		compatible = "vishay,vcnl4040";
+		reg = <0x60>;
+
+		vin0-supply = <&vreg_l2b_3p0>;
+		vin1-supply = <&vreg_l15b_1p8>;
+
+		proximity-near-level = <220>;
+	};
+};
+
+&i2c_master_hub_0 {
+	firmware-name = "qcom/sm8650/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible  = "atmel,24c32";
+		reg = <0x50>;
+
+		label = "strap_eeprom";
+		vcc-supply  = <&vreg_l15b_1p8>;
+	};
+
+	eeprom@51 {
+		compatible  = "atmel,24c04";
+		reg = <0x51>;
+
+		label = "strap_v2_eeprom";
+		vcc-supply = <&vreg_l15b_1p8>;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	magnetometer@6c {
+		compatible = "allegromicro,als31300-500";
+		reg = <0x6c>;
+
+		vcc-supply = <&vreg_l2b_3p0>;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible  = "atmel,24c64";
+		reg = <0x50>;
+		label = "core_v2_eeprom";
+		vcc-supply  = <&vreg_l15b_1p8>;
+		pagesize = <32>;
+		size = <8192>;
+		address-width = <16>;
+		wp-gpios = <&tlmm 78 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1i_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	sdc2_card_det_n: sdc2-card-det-state {
+		pins = "gpio12";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8 V */
+	};
+
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <1>;
+	};
+};
+
+&pm8550_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+		default-state = "keep";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pm8550_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550b_gpios {
+	detect_n: detect-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	select_n: select-n-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
+&pm8550b_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(7)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_c_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_d_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_e_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
+&pm8550vs_g_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550ve_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+	io-channel-names = "thermal";
+};
+
+&pmk8550_rtc {
+	allow-set-time;
+
+	status = "okay";
+};
+
+&pmk8550_vadc {
+	/* PMK8550 Channel nodes */
+	channel@44 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
+		label = "pmk8550_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@49 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(0)>;
+		label = "display_left_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <15>;
+	};
+
+	/* PM8550 Channel nodes */
+	channel@100 {
+		reg = <ADC5_GEN3_REF_GND(1)>;
+		label = "pm8550_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@101 {
+		reg = <ADC5_GEN3_1P25VREF(1)>;
+		label = "pm8550_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@103 {
+		reg = <ADC5_GEN3_DIE_TEMP(1)>;
+		label = "pm8550_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@144 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		label = "pcba_at_fan_exhaust";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@145 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		label = "pcba_at_40pin_connector";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@146 {
+		reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		label = "pcba_at_wifi";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@147 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		label = "pcba_at_flash";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@148 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		label = "pcba_at_nrf";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@18e {
+		reg = <ADC5_GEN3_VPH_PWR(1)>;
+		label = "pm8550_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	/* PM8550VS_C Channel nodes */
+	channel@203 {
+		reg = <ADC5_GEN3_DIE_TEMP(2)>;
+		label = "pm8550vs_c_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_D Channel nodes */
+	channel@303 {
+		reg = <ADC5_GEN3_DIE_TEMP(3)>;
+		label = "pm8550vs_d_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_E Channel nodes */
+	channel@403 {
+		reg = <ADC5_GEN3_DIE_TEMP(4)>;
+		label = "pm8550vs_e_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VE Channel nodes */
+	channel@503 {
+		reg = <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+		label = "pm8550ve_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_G Channel nodes */
+	channel@603 {
+		reg = <ADC5_GEN3_DIE_TEMP(6)>;
+		label = "pm8550vs_g_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550B Channel nodes */
+	channel@700 {
+		reg = <ADC5_GEN3_REF_GND(7)>;
+		label = "pm8550b_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@701 {
+		reg = <ADC5_GEN3_1P25VREF(7)>;
+		label = "pm8550b_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@703 {
+		reg = <ADC5_GEN3_DIE_TEMP(7)>;
+		label = "pm8550b_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@711 {
+		reg = <ADC5_GEN3_USB_SNS_V_16(7)>;
+		label = "pm8550b_usb_sns_v_div_16";
+		qcom,pre-scaling = <1 16>;
+	};
+
+	channel@712 {
+		reg = <ADC5_GEN3_VIN_DIV16_MUX(7)>;
+		label = "pm8550b_wls_vin_div_16";
+		qcom,pre-scaling = <1 16>;
+	};
+
+	channel@744 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(7)>;
+		label = "battery_temp";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@747 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
+		label = "pcba_at_heat_sink_fins";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+
+	channel@78e {
+		reg = <ADC5_GEN3_VPH_PWR(7)>;
+		label = "pm8550b_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@78f {
+		reg = <ADC5_GEN3_VBAT_SNS_QBG(7)>;
+		label = "pm8550b_vbat_sns_qbg";
+		qcom,pre-scaling = <1 6>;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/sm8650/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/sm8650/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&tlmm {
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio17";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio18";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	i2c4_default: i2c4-default-state {
+		pins = "gpio48", "gpio49";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	i2c5_default: i2c5-default-state {
+		pins = "gpio52", "gpio53";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	l_spkr_irq_default: l-spkr-irq-state-state {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	r_spkr_irq_default: r-spkr-irq-default-state {
+		pins = "gpio186";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1c_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p9>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	/* USB 2.0 only */
+	qcom,select-utmi-as-pipe-clk;
+	maximum-speed = "high-speed";
+
+	/* Remove USB3 phy */
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1i_0p88>;
+	vdda12-supply = <&vreg_l3i_1p2>;
+
+	phys = <&pm8550b_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};

-- 
2.34.1

