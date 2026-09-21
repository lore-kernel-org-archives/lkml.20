Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A204EF121;
	Mon, 21 Sep 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012602; cv=none; b=DOibd8FwDXijiuOcsrgMFIlyq1DI7hVL0rzCpoMCuejJsB9Pd8D8/fA/m/NjX6+wvXDrZgRFOjJxOSjcRqhpFkJUsZdZb5NnvsGtjBUis/JIl5N1/erpMVFcrkTsfgDjxeP/4k8QhuHUDjQdVrJBzQgIYvcht4q1iddB6LaLtDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012602; c=relaxed/simple;
	bh=dHTybrL+RMP1hKkMN9c0Iz7OJiE275d2OWdGdUab7ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGdzhFNpOypt1GUBTjGre4hztRTgm05MjoHFfxl8Rtp9hmVuhBq9GadT0IkvWvXRbsiGUEArsqPf+yzdkVJsxaHho2jDNuGFNmAPL06jZKDiASHfJXjq3L3ljY02gNIwM+R2Jr6fGTSUVyRfQyx7xBYnI7KDQUEh3P67sB+jV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OUCmQzJE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dBeniGXQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OUCmQzJE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dBeniGXQ"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012588; bh=RZqRdr1U5nr/ovFdxgKlGjo
	2cPnR/81TfxbwVC4+jic=; b=OUCmQzJE058oW/2R8CJgGVYE9MzbXAWtjTeAh7qFnU9BGjGH2W
	188PAYpaR8ar48seCPHIFfs6PmaKJQ63lnnzkfsclsUzd1Qp22jno2rqdjS/a5vCDf4aWdH6esA
	/SnmS24rHBZL5OOqpCQfIb7Fvj+2xlCtlizwuGaVAwygaVOYXt/2DbLGLieh3VwhxBllQn170r6
	4ddzXodflbM6eA74eFgsjmo7lw/AK4id+kT1+F6pKmwPfqA+2cw2aCHMgPQk4gRQsaKmkSL7hvj
	avBNUnwgWNq47VpOjgZ9d1hibvlnYqapMLRQpG2ItBhbVkZQTYjuPa8K+AV8lBnO+8g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012588; bh=RZqRdr1U5nr/ovFdxgKlGjo
	2cPnR/81TfxbwVC4+jic=; b=dBeniGXQC3090uUQqTaXg5UOVUXz8qIFgJtLgsE+j4Od/mwB60
	cEAs0fkI2ygw1vqxtIFtLN5xOfq4goQO19DQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Sep 2026 19:43:03 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: msm8917-xiaomi-rolex: enable
 notification led
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-xiaomi-aw2013-v1-2-a0c3084076de@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790012584; l=1324;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=dHTybrL+RMP1hKkMN9c0Iz7OJiE275d2OWdGdUab7ak=;
 b=owpw/NoZuGnhCUmgT9bKZVAMUkw9B3KYKiioDFSOBpsiG3wbSwAv/pC8wiC5JSnALMRw1dZ6N
 bZ3JcVcxvnJCOladrpnbuT7jKUp4Fm3iJs9zc1tVH7ubC7DdtnTTmUu
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Enable aw2013 notfication led. Redmi 4A have RGB notification
led since aw2013 driver is not supporting multi color grouping
use leds-group-multicolor for it.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
index f0b72d9878c4..a8dba85cb352 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
@@ -12,4 +12,37 @@ / {
 	compatible = "xiaomi,rolex", "qcom,msm8917";
 
 	qcom,board-id = <0x1000b 1>;
+
+	multi-led {
+		compatible = "leds-group-multicolor";
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+		leds = <&led0>, <&led1>, <&led2>;
+	};
+};
+
+&aw2013 {
+	status = "okay";
+
+	led0: led@0 {
+		reg = <0>;
+		led-max-microamp = <5000>;
+		color = <LED_COLOR_ID_RED>;
+	};
+
+	led1: led@1 {
+		reg = <1>;
+		led-max-microamp = <5000>;
+		color = <LED_COLOR_ID_GREEN>;
+	};
+
+	led2: led@2 {
+		reg = <2>;
+		led-max-microamp = <5000>;
+		color = <LED_COLOR_ID_BLUE>;
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
 };

-- 
2.55.0

