Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DCD472076;
	Mon, 21 Sep 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012598; cv=none; b=DBu8YvoqaOlVNMxGO8vuH5pRB5ONUjs6TS6rvABUpq009rSLOPl9QPA6RitnKbaeMWjJzN5C5VwyTctZjKrSPS7WmZpMiLSmgtATLQ12iflNRie19JVsJrW6lCiGrFwyIfj59Vb3t/W7aL3ctkbhD3VToE9MyL8JrVkJGPfI7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012598; c=relaxed/simple;
	bh=ts3SGfoYgDGEjdP4CgWylwBY5zqFnwUmk4GDhX33tYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZthjG46+2smED848hglj2uohvbfZhJ3/ia0fEyG2mXhx4lfwMgrmmvFJrwF3YkgNpmJahWXY/hXdUWpLemzUOCaeQDOEbprXvscUOaVlEvrh45lWrFrRRtTRKtoGqJxpN2Kw4jCHwW1qOD37Nkvs4bscX2LkaKkpKwpAPcV0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RbRITSIv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=2owwHg34; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RbRITSIv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="2owwHg34"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012587; bh=3oSwz5Zy6nXS6A8/l4jcI14
	ITh4f4paNeE4tpHkpxOA=; b=RbRITSIvxu7PW06a9RPqJy9zce5ylLFVFJdmgihdc6EKOc/dOL
	rrtRo4K2NKj885xIAMkBSIOHRp1Gi/HAoJK/ee0yZERJf9zteR7YY231SshgTLLez1fvhBqytc9
	PYxry0wGpzzA1yyI8ZXhNkWysrMRyG3kWL00aEGAv+rZcLlW9y4yXZglh0gG3pVRFk4u1tVBsuK
	n5sWvb3j+WLk6LO17vR6VNzm+3oYCQGuoW9ubQ+5Yjeg/ROWi2kJWiMIUOyKlMiqRuWZgky+ai1
	3fLpSKfGoYv1p+qoifmPEmwu1pu/N1jkeemAQ31yPnBB1hNQxJo6cVRbV6q6Cuk9KuQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012587; bh=3oSwz5Zy6nXS6A8/l4jcI14
	ITh4f4paNeE4tpHkpxOA=; b=2owwHg34QWVsXMZgDu7V6Fc3Ab7jJLLTLwon1jzPdBgpytaz4X
	jCgBXLL9GGpJQ0DGuB/P0HV6QkHqUQhnO9Dg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Sep 2026 19:43:02 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: add
 notification led
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-xiaomi-aw2013-v1-1-a0c3084076de@mainlining.org>
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
In-Reply-To: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790012584; l=2397;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ts3SGfoYgDGEjdP4CgWylwBY5zqFnwUmk4GDhX33tYg=;
 b=948sjmebBYLMGdM1WCvcGjdp84U8zOITq4uh3Ue5YwyNsvgXqlTagq1yuZZpFPWPFk1T9uwUv
 +t8sAvwD5M1ACZUmfseFcAQ17aIx7qc/5Jkur19X/qb3h+tnvA7jL94
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the aw2013 led-controller node for controlling the notification LED.
The same led controller is in use for Redmi 4A and Redmi 5A the
only difference is Redmi 4A have RGB leds attached to the controller.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 26 +++++++++-------------
 .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     | 15 +++++++++++++
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 7c323214abf1..8ea8ef80fb38 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,7 +5,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -36,26 +35,21 @@ vibrator {
 	};
 };
 
-&blsp1_i2c2 {
+&aw2013 {
 	status = "okay";
 
-	led-controller@45 {
-		compatible = "awinic,aw2013";
-		reg = <0x45>;
-		vcc-supply = <&pm8937_l10>;
-		vio-supply = <&pm8937_l5>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		led@0 {
-			reg = <0>;
-			led-max-microamp = <5000>;
-			function = LED_FUNCTION_INDICATOR;
-			color = <LED_COLOR_ID_WHITE>;
-		};
+	led@0 {
+		reg = <0>;
+		led-max-microamp = <5000>;
+		function = LED_FUNCTION_STATUS;
+		color = <LED_COLOR_ID_WHITE>;
 	};
 };
 
+&blsp1_i2c2 {
+	status = "okay";
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
index 69eda5f42c06..cdbf2d4fa92c 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
@@ -7,6 +7,8 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
 #include "msm8917.dtsi"
 #include "pm8937.dtsi"
 
@@ -85,6 +87,19 @@ framebuffer_mem: memory@90001000 {
 	};
 };
 
+&blsp1_i2c2 {
+	aw2013: led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
 &blsp1_i2c3 {
 	status = "okay";
 

-- 
2.55.0

