Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869446;
	b=Rgx4YCEI/P/8FWCCpVw/k0iNqZ+Y5YGdVllAeSpEYgxrIejtXQGjtyse4o2ybZSIuy/n
	 QSweaWFpKKMmbDQvugfiyUCESUabRTljyEix4curWL/M+SoM5e2CwKEJShE8XnMX7Db8b
	 PP6GvZpWTq5R43Djeu7VFIXAaFqQfybIF1tyDDilKRY/dkd+N9Tpp/zzbYOdcFKge8E5o
	 WEYWUX1+AVuHoSkIIzgb8WMMqCQJyrkXNev50E//bVxSOrpPI2/kpM9QhTMiWZC6mDlYX
	 /Iv3LRmDXZ2s7RyQiAl1JTDwNWkPpSRWUxRTGGRKQ5SY8d95Y94d6JroQuz0+l1g8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869446;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Hu4fVHQm7QlwlurO5+wn1NcL7fJwgjxjYPZSkelbG9M=;
	b=pOSCtA/nZBn2GlTN8VA/OXkWRYfT1Is8/BT6hI/RfV0kWQC/swOT3Oq/aEFCpXaZTYI5
	 jsmf98Vy++sCXR0Zb/ENFZeQSPWL8/ep+iuJ03QjUXPBQYOziEWoLMQEzYox4HgSsdi/m
	 AKna3ER31I+8YSWHs5tkaZEw2GG27E2P7IBgfpZy5D7HFrtnnvg2KhjLsORW/kY1luRXA
	 qtVJz3xlWUw7s8s2K3gdygsD/a5j31NzX1mX0YoLrgE9qLqPJlo7mQ7gDj2YyjDaYSIMd
	 k/xgo2+s8GpDI9fjxGe883yXzISr+FrZGs2GCiUWzysP/OCtFxhXVVW3+mRib3/dpwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=8ic+gXe6;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=SJXiBs5h;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88170606A888;
	Mon, 16 Nov 2026 22:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88170606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=8ic+gXe6;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=SJXiBs5h
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869436; bh=Hu4fVHQm7QlwlurO5+wn1Nc
	L7fJwgjxjYPZSkelbG9M=; b=8ic+gXe632Cac7buy6P8esqkKjs8D5QwDjfxFXQ9t/WTs1plr4
	DuDEjEWnrMPLccW389k1xiI9S1ArKwivLcCA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869436; bh=Hu4fVHQm7QlwlurO5+wn1Nc
	L7fJwgjxjYPZSkelbG9M=; b=SJXiBs5hAjywV9lwtWm61xNYcu5LvIJwEipkPvCQijQootLpX5
	uKdseVT+rNDJOTPG9HtB+UJGfVkx2YhyNTiS7Y47A4rB4AUKV6SZa3jD4Yjz9qRzjoKSnOfi2M8
	DfLjDwcUo0ggkLvat1GhMNCkwCA97gvKYICkIY7/PSP3MMHehXRFaPVdM7FzAGrPhmv/uVoo8WI
	nu4n+stGylMFhvhjO7JznPcvhskNhPklCTon9fVj3+zUVeAi7iRJIrmui1OooaioL/sxapHUaMd
	8zVzDTqkJ8XkYUzNnelTLf3cTyHdtYzbLIaX5lJkFznxc48Q6tv2P+av1NguZv9omzg==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:37 +0100
Subject: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=2033;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=PoxSL0Phe2Ugx4ghyI4vVKtvyDj9tnIgZSRn34Os36E=;
 b=n3kSN/cx1468TEc8wW7gfIHNspzTuwVBI6A+NlXkuVCzfrybfCwi9iAOTS9TYAq27F7ELqwW2
 9TGCk2KoFVtCsU9zU0J+ce6Ps8gcQeMNeVcYBwkCpWYKotAPFS7pAHV
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable PM7250B and some components on it for the Xperia 10 III.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 9d880f6baa531..697e1cfae72e0 100644
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
@@ -372,6 +377,49 @@ &pm6350_resin {
 	status = "okay";
 };
 
+&pm7250b_adc {
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "charger_skin_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "conn_therm";
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,ratiometric;
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
+	regulator-max-microamp = <1000000>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0

