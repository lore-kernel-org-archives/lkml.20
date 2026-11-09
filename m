Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262564;
	b=fyE8QfONXjYgjbggApBzlOgDz5qTaJu7CdknJbjZAHLD/Ix6g7J8kY06EsF/rTi48LN7
	 QgxsgzLDLw9Ew9JCrny2C/Ri//l2nshZrmaBk6mtzK/u7gRMDQdUsrllOwkQVhMEkp1m1
	 Dk3UWuaQOT1MMJ8XO6+LmoS5DO/vD94KNXOw9f0U6x8EJE6J6P9V/26TJyTtucZHNxO2k
	 zh7uYgvkEn+zkrpQxjH5HIypmGHXNvWHEmKWVX4aJnNwm3mx21LGcvzS6yPPW3dzR8G4u
	 r/SI1rnKyQP9+GyE2AOOpI+YY/PmtlFSCgF6sSpn5X+H0r7N8jx31qfqFgLcGr5Ec0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262564;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fQORXvgvG4aCbdP7l51ZXh7a55jz29dKJoEdTRVzxws=;
	b=dQL7qMIYVfh3yE2tKp6cwsI1/1jMHTy08kCZR48U2DzGmZVL8kIS4dYJmKrZWa2RIgdn
	 PjjwuYtoAEU8jhmxmLXNSRVANCXI6/59KIFSlfaR6i5l48mnI6YHeHHNUpB0Ei7ZuJJw2
	 /amTU7zsJdiCcoGR3B9ua5pH40rJ40XUWxxSSrFXeAMkgHCATMFXx9IybN/TpWzbJ/Zpq
	 q8l4cFZ1yhMFjjcCEtFJS2kV7Lnyr+n/6p6Goe0U0/IJSKorhWr10/0rP1IdYC/5QckFW
	 7lI2bGoxEdbO5gXO9sjn3H/15nT2Xk5KZX73LnN5uTcI5kDBeFs0JdIW7ddKny8yqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=tZYvvlWa;
	arc=none smtp.remote-ip=91.218.175.153
Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78E606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F78E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=tZYvvlWa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n25vX4zWRxlR8Mbf8CuplgD2Mzpe9LK+fA/gl9ql/KQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262561; v=1; x=1794867361;
 b=tZYvvlWawWGJMN6nQ/3m8h7Bk8VfHOtO6yXTX8YsRSrkYdPVpQwa1LFmKbYKKRZtxBPKz4pS
 miJcteaPNyu8Io5gNcdKEs+Alt1iKJdQMvUyUT6zqn4n5qUN51EG1LVRgMWjE/KRaYtyCjUX9jF
 q/E4+p7+8GJUBXjhxUHbtpRxE74fuicji7nsU1uDeVAULO11gIMov7+Kaq+637ArrM9z1UvnQLB
 LbvVhud6+dG2oIBfzKUWKVNJlinqcwzT7SrBmdPP6IHF6kfmHR9/qHFFB4YBETwewcgN93/QbCi
 Q4+WqxNuKVNccIDXtDlrBqhtKj5PI5iC/Op7VLcSplBjQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec4ace8070c67486;
	Mon, 09 Nov 2026 22:16:01 +0000
X-Mizu-Trace-ID: ec4ace8070c67486
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: sm6115: Add Motorola Moto G9 Play (guamp)
Date: Mon,  9 Nov 2026 19:14:34 -0300
Message-ID: <20261109221453.658316-6-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add a device tree for the Moto G9 Play with the Holitech display panel
based on the Himax HX83102 DDIC.

Signed-off-by: Val Packett <val@packett.cool>
---

pm8008 is not consumed by anyone yet (camera drivers missing welp)
but just having it described helps with power consumption due to
shutting down the regs

---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sm6115-motorola-guamp-holitech.dts   |  36 +++++
 .../boot/dts/qcom/sm6115-motorola-guamp.dtsi  | 127 ++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index dcaf74dc876b..6365f0ed0406 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -390,6 +390,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-xiaomi-lemon.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-motorola-guamp-holitech.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-ginkgo.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
new file mode 100644
index 000000000000..f8e1f9de7e99
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp-holitech.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Val Packett <val@packett.cool>
+ */
+
+/dts-v1/;
+
+#include "sm6115-motorola-guamp.dtsi"
+
+/ {
+	model = "Motorola Moto G9 Play (Holitech)";
+	compatible = "motorola,guamp-holitech", "motorola,guamp", "qcom,sm6115";
+};
+
+&panel {
+	compatible = "holitech,htf065h045", "himax,hx83102";
+
+	enable-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+	pp1800-supply = <&pm6125_l9a>;
+
+	status = "okay";
+};
+
+&pmi632_lcdb {
+	status = "okay";
+};
+
+&pmi632_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pmi632_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi
new file mode 100644
index 000000000000..7eba684867fb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-guamp.dtsi
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2026, Val Packett <val@packett.cool>
+ */
+
+#include "sm6115.dtsi"
+#include "sm6115-motorola-common.dtsi"
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6115/Motorola/guamp/a610_zap.mbn";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 25 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&pm6125_s6a>;
+		vdd-l3-l4-supply = <&vph_pwr>;
+		vdd-l5-supply = <&vph_pwr>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&pm8008_int_default>, <&pm8008_reset_n_default>;
+		pinctrl-names = "default";
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1056000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm6115/Motorola/guamp/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm6115/Motorola/guamp/cdsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm6115/Motorola/guamp/modem.mbn";
+	status = "okay";
+};
+
+&tlmm {
+	pm8008_int_default: pm8008-int-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
+
+	pm8008_reset_n_default: pm8008-reset-n-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&venus {
+	firmware-name = "qcom/sm6115/Motorola/guamp/venus.mbn";
+	status = "okay";
+};
+
+&wifi {
+	qcom,calibration-variant = "Motorola_guamp";
+};
-- 
2.56.0

