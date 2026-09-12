Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290348D897
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789245915; cv=none; b=pdEWECSTsGU7NJ+aNm2kdr261SWPhtmpVKb03zK8qVRg23bF9gJ5xz4e0SX/Ph11xgh++yxQ/C9PwB4gIjJUKdolje+JPUp1sOuQKJ6FWdkoul+P6cAjoPLx5/U5WgpAhNoR2Ln3y1ogl3oKi0TyqBTugt1dHeRnLlg4yjGFcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789245915; c=relaxed/simple;
	bh=QZX+R39YfEMz1YW0fT6go5wgSTxtL50Zgg4jwWLHrH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1Pnk8B7iyYIYYtswGIsq/yTZA5CelKfwMVFh8veH43YbAG8JYBujYdGyCXHF3Q7mjgA6laNiH1NVO9ZlC8VgFhw5sTuCZfZITA9B/zjQ+IhePS6pOjJ3V7ka87awl65cGZC/NWIlglkc5GbieT9nD+u3PsL15ZmLQegj3XW4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=OOHWwWvQ; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="OOHWwWvQ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 889CA240027
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245905;
	bh=DQYvhd5nwDF+C0dkDYLe5yPvzGZ32GjjX1tx0SgEwRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=OOHWwWvQ1Buvm0eqMvV/4nQbi9B8c53edxOEqOM/3ScyY4XhEZFeFQIhdNqo911he
	 Fe4bEg7+G1yAe0cM0eSL0BnXpJkkagvJzkMd/CakNaT/PuxmlTEh0AsntSQPQ304yB
	 G0/EVTfHgoOLTyaJlCWBFXq3Npj8Nl1r2gaXk1eaG2VC4LCT55OuDZq3Hi9FlEQDYd
	 ksdKQwrk8DFLUa60kOBGssRqGBoRZFE5UUvhBbXXdfUq+aQ8crDVXZqb/nJhT6luGe
	 l2c37nWPCovKzTmg6OFwUkiK3xDnN8E6i286BVPJAssXXVVqaftyWVjQrPJMVlb11N
	 K89iK6lOpa0Gg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M437p1z9rxL;
	Sat, 12 Sep 2026 22:45:04 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: st: add sdmmc2 pins on stm32mp25
Date: Sat, 12 Sep 2026 20:45:05 +0000
Message-ID: <20260912204454.219606-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
References: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the 8-bit bus pin groups of SDMMC2 on port E, used by the eMMC
on the STM32MP257F-DK.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..ad55791a72fc 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -431,6 +431,75 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b8_pins_a: sdmmc2-b8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8,  AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9,  AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6,  AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7,  AF12)>, /* SDMMC2_D7 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b8_od_pins_a: sdmmc2-b8-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8,  AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9,  AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6,  AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7,  AF12)>; /* SDMMC2_D7 */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <3>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <2>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b8_sleep_pins_a: sdmmc2-b8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8,  ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9,  ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6,  ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7,  ANALOG)>, /* SDMMC2_D7 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* SDMMC2_CMD */
+				 <STM32_PINMUX('E', 14, ANALOG)>; /* SDMMC2_CK */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.55.0

