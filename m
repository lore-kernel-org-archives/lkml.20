Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575954;
	b=nhRnPWxJhRH9E2RNbYjnhW+pMjnRIhsDqbKmwspFafQDee/oC2wfotuBPzL0EvuGIkEx
	 RuHCe2yV6RHEpbrLGoV8bdK+ECtphG7eSysKXLZwq+zj43AgUg0xdAOxVVmu0Cq61yXQI
	 uFQRXk9vgl18tOuzvqq2GupXwa0okcirIwMbIy7XSvzroAFnGOtAoHHtdeXuTF924KqNJ
	 sgaFEHcT8n5ZTN3apAPpugXuPmEwuLDmAgwIGvXcmGQdDqQBLwikJuzZVyKLGU0pXAyIy
	 tQBpYsVxvlxuTu9sTM/MmhOOfbOZ0jnyHMzQE+q1KihI5vMoe0drzJDRD8evdZu+SPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575954;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jbA84etbBKalUUE2Wld4P0tYZPV8fMyIYLIQyDnt3ko=;
	b=YMs1AsXpNgLyDjJrpuDXL5zNxgIbkrela2/SUB+h/ZHFhM5tsI32DwugjVPCtM/U57Wu
	 cOvgIaX5FLiJbDcu6rN3bGj3BjuBTulf9cJvrB2QI4zhu487DjXN7iTeJ+dpe6KwpPUoH
	 mIi57Hbz7mVZcD+Dp7OscA2H1d+yAAX33BOct8u4sgwiB9KFjCKCGHvr47BxXQ4SOHFqS
	 +fuPOZYYBsyHp9+TJpExhJmEI3rCZxupSh8z1aPeff2eY/DtRu2uz66+pT/EQJvXoKZMn
	 2OS1GyzntstY6LXwy5ANWfbx6Nh5li9ndFnj8WJ6ebZa6MgtER6mS2igfaofw5k/UjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=cc9YN9jG;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=OHRF7uDv;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCC60A2636;
	Sun,  1 Nov 2026 23:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBCC60A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=cc9YN9jG;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=OHRF7uDv
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575934; bh=jbA84etbBKalUUE2Wld4P0t
	YZPV8fMyIYLIQyDnt3ko=; b=cc9YN9jGB1qAl/SWs3ys5vBR7nyL8VpEfrWlhw/WtQHLNg/P6R
	7uQ6k+fXU4kKiDC94jxuX9WfsUI/GJEzi5Cg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575934; bh=jbA84etbBKalUUE2Wld4P0t
	YZPV8fMyIYLIQyDnt3ko=; b=OHRF7uDvV5SFICjy4QUDH6rwTSFcdTjQ6HNXfVG7HgS89x6RvY
	w4/HD3WzVDqsqHL7fYau/srvteOIc7DO+ZdsfJurR8vjmS+SlvrZXZ0/eQS4oxthlWJL+lQ3mM0
	1BkGeZ/cBWcIJZS5wOXhsEYsRKx6lwB2jQ7u3NEepT22E9VBlvkF9FQIbw5XrNf4zQ7k+BI0Nv4
	f8+uqPWXVYDhqO2mRyO+4pe6eUe3hlgzGWI7FU9zZCVzi4GCMTb4Q0nvYDEQ4N/X3TSqvjQ07N0
	dZ76edn1gQl5myjmvjTr7bmnDmwqJRrDzvFG7l+O0ZvseutA3kgpgH4QodXRS5olVYg==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:11 +0100
Subject: [PATCH v3 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
Message-Id: <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
In-Reply-To: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1972;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=WcyUIFeFahnXsTx4eTBNQrS1+nOI72s2eNJVDez+n7w=;
 b=bFyeMGZOdDouSYyi4MY1OzGYE81t9wjYvot1nHyoj7tEu7+lO3cztiGfvt7zX8Nk1kwN2GPM7
 1jKGR7DX09GB2X6LkCSv4S/eh0eT6R64szfLxY4kuFKzDyM5m60MTth
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable PM7250B and some components on it for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 1b54d9869855e..61e191133cb4f 100644
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
@@ -383,6 +388,49 @@ &pm6350_resin {
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

