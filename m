Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099550AC3D;
	Mon,  7 Sep 2026 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796694; cv=none; b=gvHW8KexwIxAlglQxf0Oj+5JTBJb32F8A5YPC4DSitw0jEMuoLcZYwaGCJZd+90yRf7SiiSXv4+3cp5yNTSLsqkQuv/XPxnVxPP30ou629mjE8wm64UJvoUOSN51FwSbgT4QQKJlW8ekInJxnpyQWqeHsNRmtLu1xX9k3VLKmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796694; c=relaxed/simple;
	bh=AOc2K4VwamUM94TEfa+oKoL6HykhmDF3Izsz8mfle/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYko93YR/roK0m40jxl3G7ece5b2bRX0mYvauaDVbN/HgK7HEA7qkNUqFSmXq19xz05fXCRiRxSH0VZ9+4zkwzws9OQNynRfybVQzOA61DbZVizMXIQ0FdhIpxbNyYoUV3WnQqh2+veeZsG4xolJI5NuAk+O44DSAFFXA1zV1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEvCESTy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEvCESTy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8116C2BD01;
	Mon,  7 Sep 2026 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788796693;
	bh=AOc2K4VwamUM94TEfa+oKoL6HykhmDF3Izsz8mfle/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mEvCESTyzwq5Kfn9PYSA5Dl2jxsOQX/XaHCJFajOn7+RhVpJhZYLBYTCggr+36+DE
	 T0p/8SHs6+ESdRCfeAJfYsLZkmsozaDXoprn1FOCTm65Z7c73b8LR7zLee90SeNTvL
	 ONSsEXypUdO1JFd+uWg1rUhlKzLNcByCIN3YzxI4fc/cMIaJGPumeem+C9lWI2b/HL
	 ainwevRclvV0hHap1M2j+50qA+FyRHYRHYkyMmAc7AgQZb1kp+ifR2jLaPLY4vwX/h
	 pTAzbe8uk7BSSrnhXYFF4k+6PfISuKbhvneavDWIiDGV5J2PYrXBMqRVyLeLwU3Xlv
	 eluVMgn7YCzFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA761C79FA7;
	Mon,  7 Sep 2026 15:58:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 07 Sep 2026 17:58:10 +0200
Subject: [PATCH v9 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
In-Reply-To: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Yx/SybZaq/fFXNwrVltyex4wK0gEJtcA1qqJKNjxEuE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnt8TfyuFCcP5aYbqSPgzQYfQBPR9FkuRQn/ok
 SnWVS7LSw6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCap7fEwAKCRBgAj/E00kg
 cvJHD/0ccnYqH7Nbti6rT8NRGsL4HHduXgoHKQUE79irUKznasnXnxaGvAaePpuUKYEaz3OsRcd
 RXF/TGKkrSjOC4E5VewEgrb2NEhsYisSDSMdXAtZWW6O10wGaqd6D7S+WXbzHeNqbD7Tx6+QodM
 /uO+B7Saz8AF+mT22nLt4hxmPB5+0IMLn6NRvWc+dFcZUj1h1BLzVv4T54aGBNfPqEulCOrZ7Vm
 JqSWs6NkcpKq8br24exrveqCFIem8KXEF7p9MseCA8PRGzwF9XP4wtY1rIc5J2faj3Dln83VJ8j
 ZnDbYR6ALXw9mO+kyBUMfOw9rkaysL4bDqmYNIck9L57b4lSWrZSTquXhpn2PzVv2oRwPz3wD+C
 2h+cRZ48bhbjbuRK0w674/gEW9Rbz6gaLDG+mMvr+ZS1NxIGja+8+SzYBiMf8BMwYocKgK0XBZ7
 MDrBDgk/jkee8oR9aNS38r84w9WoiTdpASkCJ0PoxJ8PZqbG4iBJlOzPspE6mqTEbEmIqFSzKdY
 3j726Gqh+SzkoAMC0sXU33Ju8ookzxOSJBoExrRD/1QI5wcaNv8oLYdsO7QeMBsoN0UojVYjWze
 iajPLVQH/wHzSHGLa3Wtng9EeIOKoKe5XS07aOJfHwsgnH4OYE/zN40PyVJzZhDyivlIbjswtaQ
 sGvzEB31uNQDOTw==
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
index 02a392fea7212..1926bbab9395f 100644
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
 #include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
@@ -593,16 +594,42 @@ &pm8998_resin {
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


