Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B912AAF1;
	Fri, 11 Sep 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120637; cv=none; b=qzLVkHtWSKBXYNTZeSGx2nYp4ZXVPkD8shrlEvSrW/haZLGoWwb6gR5DQCEjSOvqVorG+5yhKTrvtx5k8JELjRjMdWJXcOnGVvHOZ4u8erYjH4/8xlyr32PYiCLQqO/cCf/V+4hUbtjsGDFOJLSp5lUH/VeD4BHQ6gxUyMBZs8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120637; c=relaxed/simple;
	bh=0Mb2jec7SC/M2jGZ8yCvAiTQM3VLRz8n562F616cniU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cz+XQKL1FUOAoEyfrgYZqfL69KFtsgSExh2ok8DuGVKPafTOilUkC28nLx3PIMrdmc+Yg48GTyccNj3kZKraOnTagNNp9Fb+nI9JdtBhoa1qga1itOxydJrB1Uy6+c0kE2+Jcyu5W180w8YV2476olRED65Rn5XuuuYE+0hITJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mebtXxCf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mebtXxCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC931F00893;
	Fri, 11 Sep 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789120635;
	bh=8P2Yw1kZDR+cr2UnfAN0wqpuuU89nW1sv8/eiS1R53o=;
	h=From:Date:Subject:To:Cc;
	b=mebtXxCfiWhdPcfHCAS53tpaRBtXhOCKse8AtKiHcK/d38aYXjplfjhjKfIElr6EZ
	 K/J1ckW6962153sNc29KyfHmoxMSfnvqWgwAQRcvqVM5OXBXJyelOzW1UjWr7Tjfzt
	 zFCnmYPYOba1LXs4ubVesIedaOqJZEZKmmWcFmPSNe7vptrKe+bafbDMIRshqKUx31
	 Wnw1DqwBQaDj2HN7pBg1wNkHoGvf7REIQOzhMWwSImkWjFm5R/o+DY6dJa7RD1RCkU
	 5mBHBN4CsulrpCvqF0kD+0sVlKc0OmhzRVZXyn5E6Ol1+fco4VovNLH2s5s6FaF9X8
	 3rmW8vGkxd8qQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 11 Sep 2026 11:57:08 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-tama: Enable RGB and flash LEDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-topic-tama_leds-v1-1-863badcf5ac5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrA0kCmntVUQkJpN2xD8yUYTg3
 U3b5bd4LwFjIGR4FQkCHsS0LhmqLMB+zPJGQS4bKllp2Sgl4rqRFdHMpp/QsWi0GvTDP2tnJeR
 qC+jp/B3b7m/ehxFt/G7gum4L/EOEcwAAAA==
X-Change-ID: 20260911-topic-tama_leds-961b67f83dc0
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789120632; l=2038;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/JF6095MFfLX7dBYa9Gw/FT+t9CO981tE8qLl1dYW6o=;
 b=Pv4bHSD6tRa3uwojyj7JkGOTI5IbfzBstggudIesCQPA/BpnCxulD9luuqdr0vO4H7gaoB6rF
 0+9IWDKESiACWbHzoHCRqHqnBYeg19jb/wzqtNlL4bMDY88tHssd76S
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

All of the XZ2/3 series devices have a front RGB notification LED and
a single rear camera flash LED. Describe them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 05e5a3674e5f..dd38ed73da1f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
@@ -618,6 +619,19 @@ snapshot_n: snapshot-n-state {
 	};
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <100000>;
+		flash-max-microamp = <625000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pmi8998_gpios {
 	cam_io_en: cam-io-en-state {
 		pins = "gpio12";
@@ -629,6 +643,35 @@ cam_io_en: cam-io-en-state {
 	};
 };
 
+&pmi8998_lpg {
+	qcom,power-source = <1>;
+
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
+
 &pmi8998_wled {
 	default-brightness = <800>;
 	qcom,switching-freq = <800>;

---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260911-topic-tama_leds-961b67f83dc0

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

