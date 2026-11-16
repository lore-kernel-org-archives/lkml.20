Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869453;
	b=20XVZw04IGyOq6h3g5w5l1U4wWWJ5VhwH+KO8pCGGIbbO9xJdwPPVktismPcpXYy5fRw
	 qnZoYiN7mhtu+D+Pi2fr9nWNFLf8O31TrJrQm7YqAf7Kqz1LlWNa+65HOJ7Vmp7JsWIiG
	 L1JTn/tWhmKPqv5VVbZFm3E/6vaLngUEKYYEEFa+33joLnJbt/6JQTN760FNwQdunq6Z+
	 MDi5l/OZn7+Ety7mhfX0Q3gg3NPdonEeOj+ru+STTUCpe0yqPYs6xz5x/WigUotJhNvlF
	 xO7+Q0I5Ads+cAplPgC6dLG8a6Fwfx+4sKuWwMO8hcxjJ6p3N2QTb3iF0H/jO/8OIjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869453;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+RtW+LO16tzYVoM2ZlYDJzm7Z5KIRm9zqctqyxQAcRQ=;
	b=okVewySNzlaIlymWe6GK+hU3S9T3NV8h7rSGHuwqfT47IRy2o8pXdFdHwQXZ33k/9Lmy
	 PLXwdnd5G7eBUPZ9NeSzjoODNv5zoiw8fAwhy1Ex/1fi6lpIXwIqPcLaX0M9qs3ibB79x
	 S8LyFSw+2Yx78Hv+I4TNCw/nJHz95YKVOjL7lBx7O+10w5ZpiOWNeFqpWmbjyRZHoreJU
	 UHArxuEEmzwHHN9tApYsOafHuTp1Yb5WVwVsA0cYVMRPnQ39T1EETmmssKNV+TugyxzlS
	 SgXoU1ltmJhujTS2iCpdMNZaVlBI9NQLwNRmg1Gsh77rghI7ee/KkZEVJxIEUV8J9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="B0Rv/KY3";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Z4BV9CYp;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BF606A891;
	Mon, 16 Nov 2026 22:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E16BF606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=B0Rv/KY3;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Z4BV9CYp
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869437; bh=+RtW+LO16tzYVoM2ZlYDJzm
	7Z5KIRm9zqctqyxQAcRQ=; b=B0Rv/KY3tQfOqj4m8+kex0co0/pLOPPFVsthYoJP76X5s8vOGK
	G9Oh/JJUICfErrKxMOVnk2NTmYGZJrkhA4Bw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869437; bh=+RtW+LO16tzYVoM2ZlYDJzm
	7Z5KIRm9zqctqyxQAcRQ=; b=Z4BV9CYpQcawQm3qiE/hm52EK9gRAzDJi0pzPCS49cWg/+5oP6
	czOk/KIAi+HlEFus4hv1zGE2XIU+NV5LDOzS0S/IJQdzi20YNOI+5ju/OJw3Yp45ExVivl51nPr
	UD7kTJAX8NoabJEh8wvl42cbWQBdSDb+8qud3kHSDdWROw3588HLN5u04AFjXjsa3yF8raVPRV4
	6/sopRdvglSQFPWixbNRdlqWa7dcSzWE2nRNlsW0bNolcpsyfsFK26JmlU7PDQamIxgAmoiM9iE
	Af+sHp2Qc7BSHpbboKOHVPV8wAnD7QHyU551flOau0r20eIAyhTetNVVpmZRO0luxbA==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:38 +0100
Subject: [PATCH v5 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
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
Message-Id: <20261116-pdx213-upstream-3-v5-8-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=1892;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=DI4Jq2jAvY7a8+ZXuYXyW8kux3TwKsK3kwQyP7qtWL8=;
 b=BfqpVCrLwMudPz6cM3m7Lb3mDbWYTCe8TZ4FIRLB9lMZFAl0wzb414sYv67kotQ4CKyNXA94q
 je2GtCa0+kDA7cKutzii7idvEzx1YTmZ/70CWe6uig9lbxkG9D2veTz
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure and enable nodes for PMK8350 on the Xperia 10 III.

The phone has two PMICs which have a PON block, disable the PMK8350
 PON and keep the PM6350 PON, as only one should be enabled.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 697e1cfae72e0..50a235d6fb6df 100644
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
@@ -420,6 +425,35 @@ &pm7250b_vbus {
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
+&pmk8350_pon {
+	status = "disabled";
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pmk8350_vadc {
+	channel@644 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		label = "xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0

