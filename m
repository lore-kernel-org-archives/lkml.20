Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86674E1C99;
	Mon, 21 Sep 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012599; cv=none; b=uppD9wXrAF42GJcdmkOg6yVptM5xb2A/IIHjFQvSCEngf3T4ew3lE8/cCNRu1hd/Odw/ebKxm12HUUP1edhvNXZbUfvwPsqrqSj0jdvXcrG7hC/8HlLf7DTTe+FMOpvW9JyDz8B6CFYpahLPFy5pComN514squPrtK9seCqxH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012599; c=relaxed/simple;
	bh=11m1D1lJKiQ3dtLCxpbphaKV0DgtaEtvCT0JD/1sfp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDgeDqTeurRGBD3hhj85W7RVkAV2fo4QKwsn2iHG9D6V2lQjZ4T9g6BWuHi1cu0oftDFM/y78mjFWModFwUiNASCxA4143bgsWXNiJOL0csmXKRVYgouZZJgGrW/QmE2WsbrPmNzQA4tMOccfrPYf4h+CTnIqHSaOJWkHKRPY2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GgQQDkNn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=knvzWwIu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GgQQDkNn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="knvzWwIu"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012590; bh=UBHVFUBU2rVrPaL0huOGrsr
	yRElw5EP3yZMmr8zzBvI=; b=GgQQDkNn3f83Qz51KsoEXPRpk0fi92XdMEcARjnN9s7q3DWoi9
	sjPgI+UTg2xezM+fKwxpEp6umBMISVbXNidIWYya6XboWJ3LB6uRthjmsKA97Jt5nqkjJYJBp89
	Jv/DLPjXkRKp3rzAhK6IQtEz6093DpaxFP9C0Lo7uGV1XBHZ/gobgunTsaOst3iP2akEFcOesqM
	qu8F5QWJFGJaOSSsWSCVPoRt742ZvOSL2fnHaJ0jSIbk7904IfyO9HQhVZzp2Od5WkUCevCv5IZ
	dS1jkGNvHQXAljJ1b/DO7c0FzJOt/R44iQoi/9qmd2wvbQqaJJwvqMhfxYC27K1WUOQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012590; bh=UBHVFUBU2rVrPaL0huOGrsr
	yRElw5EP3yZMmr8zzBvI=; b=knvzWwIultdUjeRnwPxEAGZfM6DQuZvPtx+tBTBbbJ4LEjHs1k
	gvl8MKyUdV5UfIEtg9YJ+JE/HPM+kQdSyrDw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Sep 2026 19:43:04 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: msm8937-xiaomi-land: group status
 leds
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-xiaomi-aw2013-v1-3-a0c3084076de@mainlining.org>
References: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
In-Reply-To: <20260921-xiaomi-aw2013-v1-0-a0c3084076de@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790012584; l=1481;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=11m1D1lJKiQ3dtLCxpbphaKV0DgtaEtvCT0JD/1sfp0=;
 b=qDh0fAlrFqvg8wSly/4r1s/bO03XXQNGz1UM83/+Pqj5+HM2VuTFiS0LDzrKOhF9syJWq7D3Q
 Q6dTed4Mb7ZDDom/9wAmQSPQsiw7/9lLbKokECEbJaEVCjsvmHfOJ0Z
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Use leds-group-multicolor for handling the RGB notification leds
together.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
index 4f301e7c6517..10aea044f787 100644
--- a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
+++ b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
@@ -81,6 +81,13 @@ irled {
 		gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
 	};
 
+	multi-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+		leds = <&led0>, <&led1>, <&led2>;
+	};
+
 	reserved-memory {
 		reserved@84a00000 {
 			reg = <0x0 0x84a00000 0x0 0x1900000>;
@@ -115,23 +122,20 @@ led-controller@45 {
 		vcc-supply = <&pm8937_l10>;
 		vio-supply = <&pm8937_l5>;
 
-		led@0 {
+		led0: led@0 {
 			reg = <0>;
-			function = LED_FUNCTION_STATUS;
 			led-max-microamp = <5000>;
 			color = <LED_COLOR_ID_RED>;
 		};
 
-		led@1 {
+		led1: led@1 {
 			reg = <1>;
-			function = LED_FUNCTION_STATUS;
 			led-max-microamp = <5000>;
 			color = <LED_COLOR_ID_GREEN>;
 		};
 
-		led@2 {
+		led2: led@2 {
 			reg = <2>;
-			function = LED_FUNCTION_STATUS;
 			led-max-microamp = <5000>;
 			color = <LED_COLOR_ID_BLUE>;
 		};

-- 
2.55.0

