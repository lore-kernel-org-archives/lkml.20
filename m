Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E0A3ACA5A;
	Sat, 26 Sep 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418050; cv=none; b=iFDwtn2AX6hbNFoG5BzLrjellaq4Y6AubM7WuHRuXLRrJzDBDY8sSnVYf9NUBflcVK/C1wJFHDai3hX4DrqligyRR+MnLNz/j6LDhCdlGQRNdWJa9lQcSGskmpc/5qltODg67Scr6jbwrEdNjirWVoSW8vAaboTg3hMgYKPAP1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418050; c=relaxed/simple;
	bh=DJ1dxK1GELDY5ZlRiLvI8OSGqq+He7Dg4xxbJfSuF9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJBrk4mGYRRYarsndE21WmESoCXAfsQe7QRM4/I9rUe40wWQyqy1X2ngj0WjuzGloIbqr0uiiSgXZHAQ1WcB3lfxZ/YQYlMYojy8hZCPnv/JfGbVXxwMk7XDST7o0Jmm1fSs4s5Mcee0b9zb+HATxN9TV9NsLkRB0M/4MKF/Pf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=r7cBzFOA; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=jAQDE/3H; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="r7cBzFOA";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="jAQDE/3H"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418022; bh=Ntgs4rTq5WE2/T4imdk8hB1
	k32TtcjLvKOL5CjpFwmY=; b=r7cBzFOAqkLEXl0nRs37xOSibNRp1cYgJV58hI+Anvepw1Nv1e
	LrbfrP+WzXgYriDy5MSCvoXzw8kwjXYQ0GCg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418022; bh=Ntgs4rTq5WE2/T4imdk8hB1
	k32TtcjLvKOL5CjpFwmY=; b=jAQDE/3Hi21W5WNPozApYy9llDkMpcqZ/kAawiaJB8XcH8LKi8
	ZdKsRmeP5erHpnvv01VWfdfZSg8mkbre4QlECIiF9i9pq9jdAS8LB5MoAFU4se6PLfgXKYLMN7u
	BoRzxhMhk84Mna4F6bcgj45VhxWLnRy8+RH+Dej4ROwYsjTaxRJDj3VDknLnlPabKvNH47OJK3Q
	qyUucVhuFqCZ6Izeo8FJidF4a7f9Ah66yRiZmCvZccdIHQGtfJLGNU/e2VbyXWdx1jHqBCBvcpD
	0Ihpd6hM1KLv/Im3VJBmQRz42vVrb7XvaT9CMNWjhVzdnp1ztjs8vLAtlrPTLavQn+A==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 12:20:18 +0200
Subject: [PATCH 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v1-1-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790418021; l=1398;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=DJ1dxK1GELDY5ZlRiLvI8OSGqq+He7Dg4xxbJfSuF9E=;
 b=+ACwNkpZS8it7xpeNO5kjJSy1ya0FuK0NiCKN+ktI/hEFrdojWyNiWNCFaH/rnXJIvsypupKk
 GSqTwWEWFIeAPZtupRGwtUiCvHsdIemE7z9kvf0cb/TVtJY6Ti3QbHn
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Add a node for the camera flash LED found on the Xperia 10 III

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6e2bbf4f060ac..c72ccb5544589 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,9 +4,11 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm6350.dtsi"
+#include "pm6150l.dtsi"
 #include "pm6350.dtsi"
 
 / {
@@ -302,6 +304,29 @@ touchscreen@48 {
 	};
 };
 
+&pm6150l_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <180000>;
+		flash-max-microamp = <1000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pm6150l_gpios {
+	panel_reset_pin: panel-reset-state {
+		pins = "gpio9";
+		function = "func1";
+		power-source = <1>;
+		bias-disable;
+		output-low;
+	};
+};
+
 &pm6350_gpios {
 	vol_down_n: vol-down-n-state {
 		pins = "gpio2";

-- 
2.53.0


