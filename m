Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533108;
	b=pxnDMfuKAekGRVyky1WddmW6372VMT0hAkIHfPbF66qVbagUdCOE71CiDB+dq55+ah3T
	 uwXK+3BNPW6cslqEDZU1aIton55DVjmv43gHyOPAfwWExQz3TlX7UsXpKBs4yN2P/PGla
	 TqHTV/JeVzZ8V/GMCBPwdog7udLVUPyV7Ga+nMsp+fWjj2Cnzqfruu6+14jKJPAthlvtZ
	 SXXN7A594gKIHdgW3ujZyENZKNibLLazIQdnlizad8N3gWU1sFeUCShIbMAjICCsuxLTh
	 hsMTXguxQJtHzMGCnylhYe1Zfm7rPv6tizS05s327yfDpwL7U7KgXgtiAZ2PXur0Ubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533108;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=a66E86rAcp38D3oY0zXcxr4XYi9ndLWFLIhpUs/ZZ60=;
	b=B6exR52rRJ2tvvSTOFK2iFeNStn3MZGJxVo3AKfh6T2IAqreyU8nPjk3o3oJMi2NUOsB
	 m+Jlvs+IpzEBYKUkaoPCikTrsq4me9IHeF1ui44yzogNSWwEI+Z/cSe4KuAKjY6kvBEE5
	 ic2ZNuWMKRmJtnN13wo2fxx3bv/yEEnyNn/5hAaoRGsPS5oxSRt2rbfGodc7kbNpK4/iI
	 yuf7U8LQ6DQOTR9dZ23cDCn9DB79RaH0pPgxuAxD2RK/WEPGY7GIR7n4LIbsAiyCh01Jq
	 i4j51ikQHojZnGMKCrfPT4rEezYvXF75YE+YaWHOeXsQeGuabrzV2XfgEG2mpuFtTbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=vKxDd6fc;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wFvoFpMx;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3BD60A2605;
	Fri, 13 Nov 2026 01:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3BD60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=vKxDd6fc;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=wFvoFpMx
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533097; bh=a66E86rAcp38D3oY0zXcxr4
	XYi9ndLWFLIhpUs/ZZ60=; b=vKxDd6fcqRqxifckRhCYMKh/aPMFAHLs2EECZPRgQievpQ24z5
	0U1FnV2GgisWy5TqIkQTNY8qecW4kRscGOAg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533097; bh=a66E86rAcp38D3oY0zXcxr4
	XYi9ndLWFLIhpUs/ZZ60=; b=wFvoFpMx6l3/i0FbmSBmidFeBZ7Q9G3w4vWL4K6RuHxMJdrNKK
	0Z89NrDSguqP0A62DwvwlEUL8/dsJ+8LWWPLTTHyk3dv9XK1njOGqykq3T74CnKGcoO/AuGGnqk
	1xi8VN7LI2y+H8B5DnJIImZgFXW74+KhlKJeB6OEHCBQ6omZnWdQtirgpCtsMlf72ArjJ3uTLaX
	aTWFHHTNqb+hfHPjZg2lzKiapLEOjiPPnMMWFZUHZvMc8wHX4kjwL4gHBDdnIxoTMdsQxCgojTF
	zYuHzefCey0XxKrgE6iAQr2ibu6sl3zjfKotNz3RmZXiYbqCnp99/wZWarCE4OvqB5Q==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:52 +0100
Subject: [PATCH v4 08/12] arm64: dts: qcom: sm6350-lena: Enable PMK8350
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
Message-Id: <20261113-pdx213-upstream-3-v4-8-4b01c50a821c@erebion.eu>
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
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=1892;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=Co7ncsPve7DsMhknI862eUhv0x+tk7FSVQGT0I4f3Qk=;
 b=dXJKUxVc7MucHE/syown2P0ypz7boG8Pf2D2PeV0mSjoArtaMoLVwSs2/XlM/+MXsrDqQivjd
 oEq2lxYAfvRDcVgCIO4AkC4GEV/s4EeDXC6bqZjQ9PElSsg5Fd0uNTU
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
index 03af6aaefa66c..361ed8ec96c81 100644
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

