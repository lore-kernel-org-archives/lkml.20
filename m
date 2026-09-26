Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D537DAA9;
	Sat, 26 Sep 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418039; cv=none; b=YmO0DAvbWRelHne5HYxI9WBdrl0Ei4fa2IogScfAPaI3FgX1aU7HGHrsPLAQ2WpMpVCuq464KbxfktMyeiEsyx2lvzDVctV2Pka7TnCaKI0aK52PqqsGQz+7VMDphWgEM6VBSx5fg0sk+nOfYVTCPaMdWmFQ+8NYzFYm3Wa7qXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418039; c=relaxed/simple;
	bh=KLlHO9g+T+Yj7FycdIZ6x56fp1RhrGOeRrv/Rrarm5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eosk9i+4OzKfSaWkBu7tqaS8CUOtK0zESZvIIem+yoZAlFAThK3DViLc8yAraoWJgW/GGECSbnxyH9PoE3KvTY1mjLGWx2qviC4sT9tyvJ+SV0mjZXUNm/o6+8LJ4S0+7xQzUaRwBjSauJhw05megp6YtuSiK9QoBglFzYyeVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=kcJdxXS+; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=OUrYtfeZ; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="kcJdxXS+";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="OUrYtfeZ"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418024; bh=lVlAnYc883cp2ahIumWV9sy
	JCRy4qAhBeWrjjpiDrd0=; b=kcJdxXS+dW6Brd3cEIU4jILC+ktY26Dv0UhRGtCQrQDsXjnp2w
	X8OHX5wLLIRBEnsvLZ0a0Wv0G0KwlwfQ4zCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418024; bh=lVlAnYc883cp2ahIumWV9sy
	JCRy4qAhBeWrjjpiDrd0=; b=OUrYtfeZnlFFJXL6ipDSzTh79qjtnIznuhWOUpzDzPc/jKG1hO
	LXhdvtw1Thk70gNXKwy6oTHr483K06Yx27PIzqseueVtmNALWDNqPc30Nti4fIxTSGowxCi5h2e
	H+HeRDWexX9MxtkK4G/xaBCwLyjysOvHRsm0TaurH/9xnrgqOmeE6EUIDVMcWWUFa6w8i3pCU4z
	O81Siw1vk2pyCdRGaBAZ3GyZ8e4OTi+Nk5ih7TFNEa8LkD/aX+1jZC7l2MZc2TwvmvlLHe/RU3T
	kocAn7KDZR0DVrewY5pAZpUZI5MGL1UcyCJ+nSH8x2Cu4evr4NszHqLzDPiM9pNrCrg==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 12:20:24 +0200
Subject: [PATCH 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v1-7-1609c18b5c1d@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790418021; l=1972;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=KLlHO9g+T+Yj7FycdIZ6x56fp1RhrGOeRrv/Rrarm5w=;
 b=PPme/hK2x0lvSTxfN7R7zUIWSLBfjnGu6/GBeOtDAu1rnOCe6qR00JlftoOEEeocQnSpxmfhe
 +xmU5cm35bXCqVIg8T+omYUDS5poDR/Eem4EjWXkqR7wMKOq+soGNAK
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable PM7250B and some components on it for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 7c14360cb1838..265400aa945ba 100644
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
@@ -388,6 +393,49 @@ &pm6350_resin {
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


