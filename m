Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DF447CA99;
	Sat, 26 Sep 2026 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431296; cv=none; b=MXGt5nXQCH+BNHrXAlJIcKETmTqWaNS5R1p07KDORAMV939C3D/vb3ZOE3iqw3AVRWsz1+XSHMBViOx1VhBigYbekIrD2Fd8AgzRtZtgZNOBR+1SSnGYKm9CqhQ2ava+w+LxfzvTaj46gFkkSkJDEVFRvcSXPENf2S6g55yLI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431296; c=relaxed/simple;
	bh=Q0J+IaUkXnJEKSAr2gMc8Re/wOwUzPozadAH3pDX578=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3/oG2lmBgfAcn7xERn0aqSZIqXBkGLIJE6LmRFtaHl57GT/PTVdJVxatyuDwIgZYFmAQvRe9agOgzdKzdfWXSlVzeO7zpOFP4CefN3gyezU0b9Wdku2VofaRJx5PDQkfZw0Du0raumqj2SEMMeS25kx8h8nOJSO0v6S5SUdtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=LFzAaVQZ; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=MXhCF4aT; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="LFzAaVQZ";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="MXhCF4aT"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431256; bh=0Yv51w/1a0vbvgWrrrdWhNx
	4ox11eMa1S5j4wM6YBGA=; b=LFzAaVQZO5i6oAJZn2ZMbTi0tXgPazBhDHzTfY7JC0Ig4u3skN
	9sM8tvkYco0t23EbkcJC/9D4gTY4bLZPc8Bg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431256; bh=0Yv51w/1a0vbvgWrrrdWhNx
	4ox11eMa1S5j4wM6YBGA=; b=MXhCF4aTJut98TRrdSRpSiFKMlog5jNQDtKb+YmeNFzb7VS9RU
	Tl7sBHfz/HqVfqgyZQhdORVsrEDHjG2Z/9MGr3o/CIpKQij+9C7qxER9TPgSThlqCdcyEj3ScW/
	t3EErGhDQ0qfIjJNLupCmBLSYXgJeZwrAxQVxQL01YZ8l93VbWt17ZAe/C0bpTFfDanDKYiLp4F
	Rzbk663022N7VCrFhFi5uIv4Pw0kR8bERbvjT2ynKLRXM+stJGZemQbizgWZuaUG8ormJHraZUa
	vUZacpkMIuGyGRB3/O3ZYU4haTyCq/B24HTtD8Sy1bugidGFPyEGd8xCECyQ4A5uWIg==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 16:00:56 +0200
Subject: [PATCH v2 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790431254; l=1972;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=Q0J+IaUkXnJEKSAr2gMc8Re/wOwUzPozadAH3pDX578=;
 b=SEcx+BJXXcwanUjdVy4Uh55TgtWuc25yEl3hx/8DAYY0RKnB3bgDbh7R0sbY8kgb0vC2AnPYv
 E28jnKQ1EOWAF0l4giD/Lb5XgthLMZN9Sml1o4qncbCep25CoR+eh+P
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable PM7250B and some components on it for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index b234919c301f0..08ad5613cb6de 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,6 +4,10 @@
  */
 /dts-v1/;
 
+/* PM7250B is configured to use SID2/3 */
+#define PM7250B_SID 2
+#define PM7250B_SID1 3
+
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
@@ -11,6 +15,7 @@
 #include "sm6350.dtsi"
 #include "pm6150l.dtsi"
 #include "pm6350.dtsi"
+#include "pm7250b.dtsi"
 
 / {
 	model = "Sony Xperia 10 III";
@@ -377,6 +382,49 @@ &pm6350_resin {
 	status = "okay";
 };
 
+&pm7250b_adc {
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "charger_skin_therm";
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "conn_therm";
+	};
+};
+
+&pm7250b_adc_tm {
+	status = "okay";
+
+	charger-skin-therm@0 {
+		reg = <0>;
+		io-channels = <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	conn-therm@1 {
+		reg = <1>;
+		io-channels = <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pm7250b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1500000>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0


