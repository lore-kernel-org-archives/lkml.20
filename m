Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AD3ACA5A;
	Sat, 26 Sep 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418045; cv=none; b=oYSN7Jrck8oeas1XgRmiYgF96dFSb6phoos41i7WWmBFYCs7g+rhjiLBwGIEgl63EgailSz3z19WYM01/wFPRuPA8B7EsG4//0vSePjpCQhotOemEIydXcZe4oqGeAUjXkYVabIwh6aFS+Ot8n7Skgca+ViFF10Qqyc9q68CTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418045; c=relaxed/simple;
	bh=olU+xxIscM+HlyqEJLgNXFLvi4mBhSyTkRgTeNBW4VY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+ThVqkeialZXRSoEG8nj3Vw9rE9neKsBvk7DkWJO2zPsZUAPJ7eaOoUdNgrgzmFKzbZR+yBpvP5hxscCSlgsj59vzuNPSikMyXfNk6agyCa9uWizwqJKHnJrldrE06KGV317g8dFq520BEVzbzx/jdDTdPGfWp2GXvM151maTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=oMuXoCs7; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=YVjhn0/q; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="oMuXoCs7";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="YVjhn0/q"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418024; bh=CyaE/Z55sIrh8dTUdXwmSXF
	X1IfMnX6+m5lvehLfMjc=; b=oMuXoCs71rsqGCnfRa4UjQ5ARNjDvo2tTgd4scM/p9ihoQjA+6
	OvkzwlOEgE64gdyAfLh5RONHclGCgK9VZmBQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418024; bh=CyaE/Z55sIrh8dTUdXwmSXF
	X1IfMnX6+m5lvehLfMjc=; b=YVjhn0/qEYd8buvjL1HlmZ4DYmwyyho3jwRjJpizcv19uFMMNM
	lB9CusYiMsWuxKB/ibDFSRIRc9r8GrMvT3doTOn1MFryhe82AMOV1r9WQQAiSijCj46HXtYwSYM
	vyOdKy7AK3e+/vl+o02177GfOPACvDUuIxZw3rp/1pg+yFLIGvM9ctCqqTtK3aAkJ4AVOE3yAt9
	MCrTi5VruwGyOiQ1/sCWJ+DIIXmMr+FDhlK2gT4YgUa3DeR9KQna5Z10qVQc82DVCBC/34hNr6h
	mxAt+EwWR/7HSfCTEaL9ehLSpTkfCVjq1D+Xz7CJ4MyRVTafz8eTQ9/9vOrHWP0ZBHA==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 12:20:25 +0200
Subject: [PATCH 8/8] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v1-8-1609c18b5c1d@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790418021; l=1711;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=olU+xxIscM+HlyqEJLgNXFLvi4mBhSyTkRgTeNBW4VY=;
 b=5d27LJrNAvXZ+jzvGINLu+vq+V5ObTAmDWYtbKNzyyNAatoVCtz47MNW3rEmEnzvnSVPNlI+P
 Taun5fmZjF5DVi3doQVpeoa30507mSS74gd55Ub3aKn9oNXLcldxIgZ
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure and enable nodes for PMK8350 on the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 265400aa945ba..ddca3caf4a4e5 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -8,7 +8,11 @@
 #define PM7250B_SID 2
 #define PM7250B_SID1 3
 
+/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0 */
+#define PMK8350_SID 6
+
 #include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -16,6 +20,7 @@
 #include "pm6150l.dtsi"
 #include "pm6350.dtsi"
 #include "pm7250b.dtsi"
+#include "pmk8350.dtsi"
 
 / {
 	model = "Sony Xperia 10 III";
@@ -436,6 +441,31 @@ &pm7250b_vbus {
 	status = "okay";
 };
 
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,ratiometric;
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pmk8350_vadc {
+	channel@3100 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "xo_therm";
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0


