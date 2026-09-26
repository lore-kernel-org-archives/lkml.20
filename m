Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA545D19D;
	Sat, 26 Sep 2026 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431276; cv=none; b=XAj/6t9birL2JXscD1v5NOioA/DhlTpmBTJ9P01KfPgYq+4XO3mNa8CeX0LK8JWOB2QZg3MpIDidtrUuaE1VYicJuYeUl7QVlMqJ9XGd4V81/QPi6ZtlIG7MZnIkvZ81a2+oXzcbZYxOivzqF5OkUahcImfF6faYwVx1sI64lNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431276; c=relaxed/simple;
	bh=vk2GPq7qsEA/L4uDnPpI1cOC2gwiuDW0uR2knzJ9WXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g++1jAet2ATraZYPzEwiaSTRK47er5gsHQhfYWFzbEYFc9rjWJefLJvZ6//KxGZk4yyhP0fge0opXmW8WwbHXUIT4hCYAylVatBuMQCLt26rqEC53CjGEdlN6AfbuevYBSaaV0iQMsu1atEQIUkg6/QrZ9/GT72xb5PcKEyrZ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=rb3Qn0Ah; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=HpiUrq3Z; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="rb3Qn0Ah";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="HpiUrq3Z"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431257; bh=b3sZd1ykxk9GXbHiEiBdMWw
	9RTheY88Isn5UVJrCHKs=; b=rb3Qn0AhRtwAED2T0FwoAfx2Lci40ICI4nRvhF7qc3n5fYEx9N
	33vIPhJ7OIpYJ+qt0ymYMdl5prWnpvIfC0Bg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431257; bh=b3sZd1ykxk9GXbHiEiBdMWw
	9RTheY88Isn5UVJrCHKs=; b=HpiUrq3Zzrjuw0j7+jQaSo4U0atmOY7rv1AtAQBTvnTaGz1Y15
	o4z+azxZSYJDuNW+sLTTciDsKW039NwkWtdkyZk/s/M4SjuEtccqxFSWJEsSLtzhja7vCRv5uDa
	VI34haC6EskvbxD+6guNJO9pz6wOGhMairU4L6Ex5YzDPfyHqeyFxuZd311s/GqfSB3cnWaazaD
	G0Eev6ygYkCCaMWTsWFgJ4IIBPRORirRJq6b9dTPIpwE/d8kMMAH9BxnMJPsCDAH6fJ7I9pcPJb
	xJ/LyNQtCBlDMtoIjgjeG0xLG/RqJm9fqhnSvuuY36Jcdg/MX7wejxPgpB3xNQpgQRQ==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 16:00:57 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790431254; l=1710;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=vk2GPq7qsEA/L4uDnPpI1cOC2gwiuDW0uR2knzJ9WXg=;
 b=p5vx5luSVUdetoA1RwAY5SSZ71F94UGiyTAtTyOBwzlzA4w/ZC2gti5s/Vr4tg1e3Agc+/6Qq
 NBrgICP9mnNDvNWgZbvyTsyVG+BOyz3QIvb61TSy1HfdQmpd4lZW2QB
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure and enable nodes for PMK8350 on the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 08ad5613cb6de..0f0e81683f2e5 100644
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
@@ -425,6 +430,31 @@ &pm7250b_vbus {
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
+	channel@644 {
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


