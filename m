Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533108;
	b=KmXwIt0Ug8eiA2nNUW/gpzc6sgSTjQ0uYoB/YjIWZUe1NpOcRG8npIl0++/OX/61sL8D
	 x+RuypsTObiUyr5xK3ID39tTgTvtFxefu7xszeMAZ6at9qZBXTyC1jiiMxc0tk/2oLtDZ
	 7+MlkKAjM8tOgijtzE8riMHc/8GsewKvlBbt/Mw7uOt37RDVaXwStRBdyuwOSm3kxnsCV
	 0BEmlvKHWCBPXZ96vvt/ah506BQvmkXfACGCaHPgOidjSwty8FM3wmsASTfvj/zcKpvyW
	 tLR8E0dd3L/kNzn/s8ysEgH3zasfRjeiiGVcfOzAVYJFqMJFWDRPtTdM/JCaBQA8HvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533108;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/hX87uBIgUlae6kgdk1Ge5pgCQlHFUl9tL2kl+CMrxs=;
	b=MgfndwgkNHpnq8hxH0E4zGbZ2SzW2pRmntOK6zjvj7kuXzbLbFbvgkpa/tqorhxR61rV
	 e1d6qG9vYqA6ZTVu5Ayx7CL5COYxBY+dGYsiJk1MnQfC/wMyOvuG5ePMM7qfGjHaNzbEq
	 Woeo6EymCEOIJ9BvzCgb8gdJfwpdvyHKFWEKnIIxukb7B2Mh9ksulltIjoa+5Hxlw+XAj
	 G8uDm4A4q9JygG6xikgI8TA/P3bSdMGUwdv0j5xGoSVHzEwNk5EWgR5DYuvj4K7UE7W6f
	 KZ2v5R3EKtJTNL9U5msYK6Gui0RBD2s++k9qXm7X7ZYo80zwrmXlIpAw8GTq5ocuKXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=UMuMgrCH;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wH2Sg2M8;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A04B606A886;
	Fri, 13 Nov 2026 01:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A04B606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=UMuMgrCH;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wH2Sg2M8
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533097; bh=/hX87uBIgUlae6kgdk1Ge5p
	gCQlHFUl9tL2kl+CMrxs=; b=UMuMgrCH0ICEnS2F8BQzYoHc2sOsSJx/fPDkkdC9HY+8xnJ8xb
	e0yCn7STvKOke2+XIX7lu01bSGrITpV1J9AQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533097; bh=/hX87uBIgUlae6kgdk1Ge5p
	gCQlHFUl9tL2kl+CMrxs=; b=wH2Sg2M8c2U/SgyEkSlMFrRPwKPu7NFy9tBFYV+FwPFb5Xyj5+
	OZs1/jFYkHyC5Aeukwiq7pNeMKz0ouVRhr+Vfy1sTdWaUcmp5d/bvTJr5KyEyqpzmNVpbCDhOnD
	m2bM+uOGKYoNUgJtNzAmn0YsC/0/v3XgDvSSWR3OeNG0/w60oW+T5/cilpajPS7iPP3/9uZK3Do
	6+OC5I0lJN3aaZvSVQZdltBeS7peDQHlXVXyd0+42C7tDzsvbtrBm5ni+qjmkuNt/DIxUhl5oR3
	ViwrMTRE/3fPcaTtcRVVVkXYDNAmC3heV15NdAIvk6dX77aR8208oiUQd4nlC+8gmLQ==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:51 +0100
Subject: [PATCH v4 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
Message-Id: <20261113-pdx213-upstream-3-v4-7-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
In-Reply-To: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
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
 erebion <erebion@erebion.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=2033;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=li9N1SJKnzo+YRah71XW5Howpno4RL0C3KBNzwTy9ZE=;
 b=wuTq9YQpyy/c2leQmT/CV+i4yuw8lqx/YugtmczSAi/W5HUOSXyp67AO8YrkdItMYJhT2l6hX
 HdQ0lcuHfz3B90pYcz+/l67D8SIAhzEnpKsWofXKMwq9xnY+9Ej0/sZ
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable PM7250B and some components on it for the Xperia 10 III.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index becaf226af88c..03af6aaefa66c 100644
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

