Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD04B4025;
	Thu, 17 Sep 2026 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638384; cv=none; b=CLdOA5PnSUQIOa89g3mql219gZfmnM/8vWx9+c7wK2p5zi8VKO/X+AWzcwXqjlpCvUJqjIU0Zhvim7INOP77b2hN5Oyvl6H+4QZpWxgOACYt785OF2Vfw2AQJfGdn7sG2zGAL7BLDNU71P+DZLYlMfXMQDJY9YdMEpnuvLIuRhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638384; c=relaxed/simple;
	bh=CfL9Vvgl0HAJOR4OhvON1ApFoQBqGb2bjbPn+Hf942k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW/ZMS6FszIvEI6qDF4blRbBQYCDQHAUhx9F/VfixLdaUxtMVZCr7aGVrW3RlW5SsD8chCmlow08f4FbMj/3yMpbbFKcE3SDEu2x+hIGdEbzo+H0CculcTJEjEE3Ya5pFAn/MYRW4wmGRCG1Lt7zJ4tp/AH3UiOwiDTZ85z1OUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KexxEXrR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KexxEXrR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 464E8C4AF09;
	Thu, 17 Sep 2026 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789638383;
	bh=CfL9Vvgl0HAJOR4OhvON1ApFoQBqGb2bjbPn+Hf942k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KexxEXrRMXFSYv0atpY+VGopSN1AkL4zFphYbJcI8xT+FqTHEV5XLY3naydpv9Mqg
	 YHOC3P12I8kg8+qr5wZGL3NbyfNrPcODaeSzpT+lswnQRbFq8W+GGV/jZRyznsoGO2
	 rQRiFQ3aocauq5AVKnhqyKREY+osEYERYpV3tZzohutD5LOmqjIxHViRieYNYmb0rS
	 3qvlCaZgJFog/zHmacF0HZ/W/3fkwJMmXWrkC/bGRfxepFM6LAaYk7NxVUeyXKfu0b
	 BDq3KT14/x4VoAu7T0xY4AY583U9WEJIKXRfi/2lTO2qHfFwkyV6ROq1/dK/sDR9/5
	 2kqbDfrUKYp1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B90C88E72;
	Thu, 17 Sep 2026 09:46:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 17 Sep 2026 11:46:21 +0200
Subject: [PATCH v10 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-pixel3-camera-v10-2-df631279b39d@ixit.cz>
References: <20260917-pixel3-camera-v10-0-df631279b39d@ixit.cz>
In-Reply-To: <20260917-pixel3-camera-v10-0-df631279b39d@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=cHGJQST27WPLwUlkNSzkEUOgMKHYsptlnCzlkuUIwyE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqq7bteUn6D31oSkBN2bZksG1/pzGqbcQD++rK9
 M7sv2GgMwyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaqu27QAKCRBgAj/E00kg
 cp6pEACmO1fBW/XrjvHhxfo48EKhX/jxhDOlDDje5zavkW12a7nXHzSWTI4JsJWHMcJbcA8vs1s
 PWB8fGyMnlfVKEGi8HI2T0oZGBx97LsXo7K9Pb3xSKP5TEeoVdZjHmWgZxC0j5WbBirhuP88ji+
 6gfOvOYxHuupEQysScjZrYwE3tDEhXfMtlkk1oQ1iuc1CcHO4iCyazi0izlFnNOMa5lNr6yfeVL
 qwr6914/3ZR7EoqOLM2Viw682YQqeSQSJC2vKzicYyyQ2qpOzMfAxivgxRqUTzEPnZLq58+xpjf
 cHwub1Zn9IkQZcHWagekdm+ElS/dOktQrVFj5EkhzPAJcEx5tbcvawLwVYLBESXrxsPZDPpTB7d
 tnlbGVM9jN2ual3U86HsZMRVIkehpDX5ZrFGPPyYKp6QAylbLYMRyJG7ilAEL7j6l5/yDA7DfHX
 VqWbBE+imTgWgKHn9qiFCxf8QHNO+CLTsx1qM2+R1ogymmxmU/fYhfejYvuTlnj/Qr8YESgBLAG
 zr61WaFjqBYhJT9dnDOhWd2TJOE/FL2phBzFug1zKUhbyKmT0hJM8F8funi91FCeUNMiay7Xlh2
 1xb+ZoSVoCEDbSo6W6UR6euRQpTzExbcPbTShwD+88AV1GRjRk0EONbbarSKfQhP8HxLlJnl90S
 nCavqb1dwHhwO3g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 flash LED block and describe two white flash LEDs
used for the rear camera.

Configure the LED in flash mode with hardware limits matching the
original device configuration, including maximum current and timeout.

In contrary to downstream, we can control both LEDs separately.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 8b430776e8a54..0ee226f0e48e6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -1,16 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
@@ -592,16 +593,42 @@ &pm8998_resin {
 };
 
 &pmi8998_charger {
 	monitored-battery = <&battery>;
 
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	/* upper part of the flash module */
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <0>;
+	};
+
+	/* lower part of the flash module */
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
 };
 

-- 
2.55.0


