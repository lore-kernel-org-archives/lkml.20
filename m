Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869437;
	b=3wjjpiqa1S56s9TRxbzRc1UAJdZ80gZa84+G7AO6jddxNHCVSFxFKVyB1aTkuX5JMC80
	 b8/lMfvf6SEn9I0RdQn/AV0qNomMKbGS9aXjhWFzVKl8RWwmSDASPc5glV0JrHz7klsK5
	 YfXbytGVWsMQzuiPFUWhJO91eylSa2ww583tntroCVIgwftPaXjxg//77Z6o4J+43FlPJ
	 1ztxy2o3l3xSdXiEgU9wPnTaUPezORKhR0dwKXAZoaXsEDAu/SRoc1ewYKZ2jVcnolNEA
	 EyvLLHlCDRdRLY2sIYvzEXA1ar6kmkNIJjPiaI6UdkaTlf7x7NlVhuUbGocyPOKXa6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869437;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+4P4Dm+xK1c98QYgMrw5FigS7aFhLx8xQAD0TH21CzY=;
	b=WGYmRZKy7SHABrpZt7gxQdsQVweLA3O2QvoeEJ9Cd46wbev4V1p6vGMOl4cCR//eZiVq
	 qbRT2f4C9VvDo/tRI0CaqqT5jlguXKcY1yiI0MYbcW/i5iYloMDdAHqpStR2pQypjqi7v
	 0z/0+pYYUso5fGnhMQ/CCgQ1g1fuG7HCLBxp0S8QCGixqr9yKP9g1g0IL48+T2xqIOsgp
	 8lA4z4qDETGS2ipF4eUIe9EmwjzQtFceGHCkbqDKMpDZZcHfraS3AYeUe8gZH58MMJzNO
	 Nmh8aZrep4DC+Dq2z4hXnP6uxZ3tY4zRmCfvtYFxqJZm844gXa++zZvq+6IYi7HNulw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=OeUibqBp;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=aDtIygVc;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD365606A885;
	Mon, 16 Nov 2026 22:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD365606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=OeUibqBp;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=aDtIygVc
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869433; bh=+4P4Dm+xK1c98QYgMrw5Fig
	S7aFhLx8xQAD0TH21CzY=; b=OeUibqBp1FGobU4rL1KnFUKcYmJx4d3LVzU/OvGb3/jYS/CEKv
	HakHj1M6oIc/Px39qY1XY8KfnZoJuGqs59Dw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869433; bh=+4P4Dm+xK1c98QYgMrw5Fig
	S7aFhLx8xQAD0TH21CzY=; b=aDtIygVcQIAOvd+YK9LifI6L+qtCGdIJS6A8CutNHhNqWRoVLS
	IVRKB3gQt0tsbud2SC9Dhc26aV4IpJe85uGdqa1Kfqh7XfOSg8rZ4RpFaT/EMDg9DRMVp8zL74g
	T7xuW1n3q1elia/5Dg79MT7hfuqg+XL77/Il4crMVIFfyI+djRN2NVDLYwBDzzSagtEc+Pd+lbb
	IoKOGXIOkLqWgAYMW3xgf7KHLmMArQPA3lOFnKdKULJzj7MJVUkueXe03gy1AIwZJzL9prBN9QS
	SZr9l/rTtK9N+IbfpoGBi6OL1yiaiW2qRmjUhDnbgHEsMWZsG1ibXLdZg5NEb8azG4A==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:31 +0100
Subject: [PATCH v5 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
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
Message-Id: <20261116-pdx213-upstream-3-v5-1-7318a19806eb@erebion.eu>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=1275;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=2S3plW7dluTLpAtgNGakeiDdnyfiuLDdowoj7EPiQuQ=;
 b=J3ZxGYQkQjrLTyvO2X2AdOiZ26ckC+vzNayNwdiHXSj9p5ro8OXuCqEQsSWxxcPDzDdfzNo0T
 Ojdej78y5jbDyKCP1Cu9d2la265ke0JUR8UspGS7WrO/hSVG4VSmwzs
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Add a node for the camera flash LED found on the Xperia 10 III

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6e2bbf4f060ac..4d78c500d00d3 100644
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
+		led-max-microamp = <150000>;
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

