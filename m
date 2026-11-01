Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575938;
	b=GZctf+vpVGEl899tpRnZOMynkRKlwkkPInacwE9Bz/tkPPuoGSuw6PFej93MqOBGc82W
	 QREnujB/u9xvyyTfPk4/rRKIenPsE0L09DSyxN+OL8eKTkiVQI7lptYz/uXnV2f8qovyh
	 jgo4ZfTmHI8CML3e/0f0vqrPcRNQGCB8OashosKmt3vJbhNEGIOBvxS6MaP+UuwwxPx7H
	 oyNQPk/1obbJ84c1RFn1sTx30GOrJYP9K/XCvQVisTojENCOcCeGan6zSqPMILhjriszo
	 6jY4lPYY306MV9FWa8aK4v9ka0C+C+AoifGYzOuh0kDVZf+Sgy1VKJaGNiK4CF3qlnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575938;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tPY1VUUUvKvKxXJBd53NPjAOYb7Ez0czGbxjGbaB96Q=;
	b=h/iDIicD9hCvrx1zY0zcRxulpL7kkeTbQ2rQsY5De4UxhCWI1IQcaPEy4pctVOKwZkjr
	 FyLZsEnELu5uOa6ZaIhcXEFJuY2m9TXSfhVnt1YGJDTgSPdDPrbtM5nm1NMKWKSbQA6HH
	 FSUWuRqkkxReRakJ4d894mUJcok4/fD4ZxyuapJMtDlhf7fAp3E21UY0ResXhbpmrXoIt
	 /uIeU9DlvoJhJMglxPE1otdG8dkGTZNEqIj+JGvBxHXnLxQOwsMJLZ3jRvcOGU0ch+W3Z
	 c0f2aAV0OYgvzJ98JYd+YuD/Qs6SbHxsz/qvjX3QdFcky4R9pjq95nzv/5FqzMQQaJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=22sYFVNX;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=JKt3Bknb;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A6606A330;
	Sun,  1 Nov 2026 23:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924A6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=22sYFVNX;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=JKt3Bknb
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575930; bh=tPY1VUUUvKvKxXJBd53NPjA
	OYb7Ez0czGbxjGbaB96Q=; b=22sYFVNXKmWUBk0XJGiWoaV3Un3/1BBr/qlGwdCVUpgqkkBlFb
	saBfRXmuUAIIsK8bNkzzhgCHhJtfrk7sBaBQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575930; bh=tPY1VUUUvKvKxXJBd53NPjA
	OYb7Ez0czGbxjGbaB96Q=; b=JKt3BknbJjFw0fqAXpwp6VviE219y0LoYU1R9PGuO+4/P8AnoU
	goFKxRw8V9OBhUioJ3jnBdP8ElN/hmA42bIj/Pn0DDAkeLL7OSJoOt5haECc2NLtlODfnkMiLGc
	4DyI4jKNJtgWiJMUn5Pwq8Gkq93EMMW5nirnmZfk/Z5Z9jeRlrD0XcUzgVRPjx9U8eSwmF78Jjh
	/WtunNwyEzFO1y80XDhe+7EJZcousGJp+FdHBRs/rTvmzeyQ0TmEW2YVPBMBh9clH8nE2+vdPs3
	8Cb/fomLGOy8CZ6X0PUN5dtRquvluDDEVHHNAC787SoHfXUc93l8H08dCVT/V9Wpy/w==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:05 +0100
Subject: [PATCH v3 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
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
Message-Id: <20261102-pdx213-upstream-3-v3-1-cdc3be96d257@erebion.eu>
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
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1276;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=znEuS5td4+QiMYX6lk/5TgTERO7/mo88HSojyifn6JE=;
 b=FZHP8wHe0KF+8zMlUvJqTtptUCLUd6LI2pTElXu7VDcyCaXlcMX2JIZHQPjMXoc10mW6hZIoE
 EIFyM+BH2z/CamY9eqSBYxHNTWWJdiVqhed3DHnB4kPkvVKJ+hgi+f+
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Add a node for the camera flash LED found on the Xperia 10 III

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6e2bbf4f060ac..6942a117d41cf 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,9 +4,11 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm6350.dtsi"
+#include "pm6150l.dtsi"
 #include "pm6350.dtsi"
 
 / {
@@ -302,6 +304,19 @@ touchscreen@48 {
 	};
 };
 
+&pm6150l_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <1500000>;
+		flash-max-microamp = <1000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pm6350_gpios {
 	vol_down_n: vol-down-n-state {
 		pins = "gpio2";

-- 
2.53.0

