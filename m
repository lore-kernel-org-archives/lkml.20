Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533096;
	b=ZMk2WZXHNmZf7VAdVtHe1udHxiqnYQH+f4kAEYCplAGZwySxa2Fkyqoc2b+OjkDyDoj2
	 zJXaAVKwp8DRDAH5oMMTF0nPQHOuiZL0gv/csYGzVKqWe1dxg0tk7OLUlqSrnbm1aGRlU
	 xLBx92Q02UTnqEURR3WbQiXMzgD3TmcjTgN5Pl3LGT3xyWIdArF413awYGKGM30cirk4p
	 Izlm3gVWpv4MDaw7VQhzyDM6ho888vUZQftT9qzWvcJ6y36BMfp0iumeUcV6ex7nZy57+
	 G7alVRuo+EvNb9DUx85e3a8zwocX5j+Mv46+uWeDnFcAkBKIH0qNP7L699cyH53KXDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533096;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+4P4Dm+xK1c98QYgMrw5FigS7aFhLx8xQAD0TH21CzY=;
	b=BTbWfM7s335QDD3/53tLctchbcpMM8e8gQCZv6HA8u9T32/sVbvQXM+gN9uWZzZcxj9O
	 8hv69ums390VCV94P4P1zHiaR+3RD+22GRK3XzgObUQoCsqH3UPNyVIwvQ4h+1zxxP7k3
	 PtHrnEZieia88tU6K6IuYCIaRqDy+oDyEClZsPf4fXr8cXbscjKBu5U4iT4um1Pz79Srb
	 EZnSzYK+jB7PVu4cpe4GM42OAjhqwga+eRChaZXbICO/xAi/SU/SnB9xmHz/2gv0yxwys
	 q33j5cYcmwTea84uvdoaGFP38RKSJOff0wRFSb12LVhelbguz9JcmmbAOtKE4ijPBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=xZOnmuUN;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b="LvR/BsuD";
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33895606A321;
	Fri, 13 Nov 2026 01:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33895606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=xZOnmuUN;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=LvR/BsuD
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533094; bh=+4P4Dm+xK1c98QYgMrw5Fig
	S7aFhLx8xQAD0TH21CzY=; b=xZOnmuUNMrn4uYebfUJwAshahpli7K+B9saQ2G00sOwFIb17xI
	5sEGnhfoyr4JOKfItQmB4A6Z9++bVPs4ZPAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533094; bh=+4P4Dm+xK1c98QYgMrw5Fig
	S7aFhLx8xQAD0TH21CzY=; b=LvR/BsuDP4eAY/Q+fYIrenVHSsG4NbdPPePawJQcJGxWQ2yHus
	J4PQ71T1Hsgb0blw/huosASDuBQz4IvItaxRoq0eAcWc+zJjU43stJV5aXOZ4N3gdGPmbAvfj1B
	xH+2ju0Ty/dOXExVXX9tIXX/YJFil6+NCXKfyqBENiTiIowo+7lDiZR/QxOJyNza44DJ0LkqTe7
	TZksjq23ddBIOqCcksXnwB1YUv4Jl5+wHHRKy8OOnBKV9BLTjesk79goo2KZR5oZTRorHZikR+6
	vCzc6tL9yy2AjPZY5ayO8DnOeWQpZ7CiwVkI7cFIy+tRSa6lbPzYBFuPlALynBTwGrA==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:45 +0100
Subject: [PATCH v4 01/12] arm64: dts: qcom: sm6350-lena: Add flash LED
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
Message-Id: <20261113-pdx213-upstream-3-v4-1-4b01c50a821c@erebion.eu>
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
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=1275;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=2S3plW7dluTLpAtgNGakeiDdnyfiuLDdowoj7EPiQuQ=;
 b=3wD0rgI3zhmA/zKkeecaAkKpCPJ1NWlMFnLshmcUIqbOTrWHD0ApmLIpxaI6rTquxNtJbYB0F
 KzHLNrA3pXdBSgwpK34uLHYbiqO5uUxcBmmhkQ5BuKC+CoR6HWfrK1Y
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

