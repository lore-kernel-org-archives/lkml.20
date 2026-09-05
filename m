Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99C3E3178;
	Sat,  5 Sep 2026 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600558; cv=none; b=cHa27PBnJsyDSab4ChnZk66u6QOCMto8W0MaGLgO/Qvn5sAkCbjRUuBFMtbOaPXmMWqN+Dr/9fcq6sBuYAEyGLQKZ2W1iTFNGW7ojHUG+fEZLEXf1MOzJkqP/6czS72Bb/oidB2BHHqWArL4Knaxj+he8+TTNf06xsoxiiiP2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600558; c=relaxed/simple;
	bh=0Q3NMx4h8ekFF0U5EJMaT2ZMWe2pcv1R7lB2wLbM5d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=subNOZO/Fbkr26na9+zNGS77D7nIQmnYOKj/AMbwGDmXCGDoaWV4XRy0u99O6LhCXSZIZ6pFh7EELmli8nGhQOXSSvOw985pE50woNOP+0ZAlEQtOHCmi708lM91RW3DKYLfFXSQmDV85Kpgmy/QgXKLMV2tyQyDWyP+/bz+8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USqDLKsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USqDLKsh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D64DAC4AF10;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788600557;
	bh=0Q3NMx4h8ekFF0U5EJMaT2ZMWe2pcv1R7lB2wLbM5d0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=USqDLKshZR+crxRQklNYmEZPNFFjJQgjMx/WLbnebP9EjZ6W640gKNkutltsuZpQ5
	 WLaPdGTw3J6l7m7CmbkQ2IS2+ECLh9vjYBoirJrV6cseRnjdRurBnRaxG0Jdl4OYLC
	 ezhaL2lfvmujWuD5LITFCmR2mSmF98X5ZW2KH89D3Fe7ODnq+RWY7yMOqnYj2MtXJu
	 ieZckmde+enJ55n85UJTcfqNsYvKwBmlgdH9RjoFWjNpo9oGzSlJhaXoaI79d8H47e
	 gERh7ibH61yDIRdH4iE9YnhYCPlSwiIr7HJgWYeReQkMHCpc2DYyl8EmBnl6SUIyd7
	 jpN+ZdnOI5Gdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA83C79F91;
	Sat,  5 Sep 2026 09:29:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Sep 2026 11:29:00 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: ideacentre-mini: Fix the second M.2
 3V3 rail
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-x1-ideacentre-mini-prettify-v1-5-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788600555; l=2236;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Mbc9hxbkPkS0pdjVkRDoJOizEKE/npezL/nBqRXTsNU=;
 b=+BL58zAwMzRiORd2z1LMluqU0QVNK0eSQQJ2sTt8ZyMBllVj1jm5Uios4gLhDLfVoWhbTAjde
 +DrIZIA6PvTA912pSPmYeZxl8pBJ8hoyL6GaQh3NelGBIw9KwJAAb8w
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

TLMM18 only enables M.2-1 on pcie6a. The second slot (pcie3) is gated
by PMC8380_3 GPIO5; both regulators previously pointed at the same
TLMM pin, so the DT had no effect on that rail.

Switch vreg_nvme2_3p3 to the PMIC GPIO, add its pinctrl state, and
keep a 2 s startup delay plus always-on. Without the delay the pcie3
slot fails to probe; always-on is a stand-in until an M.2 power
sequencer exists. Both slots work on Purwa with NVMe SSDs.

Tested-on: IdeaCentre Mini 01Q8X10, Purwa (X1-26-100)

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
index 1af97c5f86fd3..76a9f745b279d 100644
--- a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -173,13 +174,16 @@ vreg_nvme2_3p3: regulator-nvme2-3p3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		gpio = <&pmc8380_3_gpios 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
-		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-0 = <&nvme2_reg_en>;
 		pinctrl-names = "default";
 
+		startup-delay-us = <2000000>;
+
 		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	vreg_v0p9: regulator-v0p9 {
@@ -788,6 +792,19 @@ &pcie6a_port0 {
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
 };
 
+&pmc8380_3_gpios {
+	nvme2_reg_en: nvme2-reg-en-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";

-- 
2.53.0


