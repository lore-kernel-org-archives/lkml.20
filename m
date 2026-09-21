Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB94EDCC8;
	Mon, 21 Sep 2026 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012602; cv=none; b=hcg/Zc24zomcI10suX9G8ySBVRaH8tZokffo3sNbxDOznwoV0J0YBStYDUWbzNtVl0gitWZ9W2eQJr6ZJF07arfxPRF6q5onrqv7nz17TVO2JqIxM88CXf8y/SyErX3drrUt+vB4SnJgITh02k5oY59e2nZ9Kt0SjLs1rrGGW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012602; c=relaxed/simple;
	bh=P++/C3omP5oXTxehlSkghnlzlWs44iaAHu1PLIfmpZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMI8nk1YxmWAVBlYXYOhdYSLQTjEbzYuQY69jsnkiJK4IQWKVdxZUoPfZ3adGOsdsh35N6FG2lNI2+zs3GHKyloJinU414Lnd/4iM5OJK6jzPG6FAnMgoAU2XiEdYZ9tt9Xe8lwdnZUvRa7CywrGvFjDvZIV8T1Cgp/nyimkx1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lxS3teYB; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=E9H+lHZN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lxS3teYB";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="E9H+lHZN"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012591; bh=RjxwbYex8GEzjt1av++2E9e
	ONQiJ+25wVtZoQz33Ttg=; b=lxS3teYB2afCO2QpKtkoZgADLl7hq0223rP+xlueXLv6apKAoI
	pw3VSet+FRPvb65/roCTvH6ytjeOxbZ5JHrTRe1jc5FP4NzGrZhVTQouXA/NEXL4hFeej3R8OSQ
	eMtsY5agK7y4ZUvJt6tz6WYShaDA5dyd7Xg0tJAkIqa/Lz1yJGo5/bHM2rtn/CvPYrz4FpJijGr
	4P8V/pg8bwYwHK9p7SLekh5CYbUBnBIjPMFL4PXWbFiO9cCoBvXzP9Rh21kYKweJBcmhNQR+6dc
	umSJR1HpYBAP1WuwpBfPD09xxf9Xixq95VZQ8k1aCYyBxOiEOt2GBBGQ/+ATW2DMhnA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790012591; bh=RjxwbYex8GEzjt1av++2E9e
	ONQiJ+25wVtZoQz33Ttg=; b=E9H+lHZNQ50K0M2mb9PCTrLIPE3+zxlBxC6vrfYAEbdN9cRU3x
	SLg2eczvuVIrIu96+Yqx4AwKw9ZeDzIO2GDg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Sep 2026 19:43:05 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: msm8917-xiaomi-wingtech: move GPIO
 haptic vibrator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260921-xiaomi-aw2013-v1-4-a0c3084076de@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790012584; l=1479;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=P++/C3omP5oXTxehlSkghnlzlWs44iaAHu1PLIfmpZA=;
 b=Ti2LT5phN9L0USssmr9ppclC5IZdYgcQ9020QVJojXFFxkMiwdWOF05W+aRBOAmT73GISiR26
 Pbl8T8N2pCTCK99dwOhWb8pJJ64sOOp9WIhgdkvaMXQ0+Fm8pSTVR9X
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Move out vibrator node from Redmi 5A devicetree because
Redmi 4A and GO are also using the same GPIO haptic vibrator.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts      | 6 ------
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 8ea8ef80fb38..253ae479bd16 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -27,12 +27,6 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
-
-	vibrator {
-		compatible = "gpio-vibrator";
-		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
-		vcc-supply = <&vph_pwr>;
-	};
 };
 
 &aw2013 {
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
index cdbf2d4fa92c..1b067c43b9c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
@@ -85,6 +85,12 @@ framebuffer_mem: memory@90001000 {
 			no-map;
 		};
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vph_pwr>;
+	};
 };
 
 &blsp1_i2c2 {

-- 
2.55.0

