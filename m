Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68F74BFE81
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277793; cv=none; b=MkN7Qb6a0+SA4MQyO92zGNChlRa20titCzjQ+8ywyCJhdHwhLFcZGyKW6uGWOkJtyV8VjFTXjI4kF8jd8yytPdOQL4htOdCcuCmCxXGazmfeW3xTtslyK3ATSHhS3XymGoS+fucuDLTjFcdECI3z6EBb+9EKL51netFxACrHvhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277793; c=relaxed/simple;
	bh=puiG2nQO2NiKtI2i3SCIox7+bFUJyLgqxlP56CaERkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et4WlEo5Ehla70eocbKhcZMTTaHVtGe8TGJDwJ9A0qsIaYi1+Nhude1eGolW56QCeaEBdlOF5ttpKALal1eDrWgpuSJu5h16NnUHt7sqgk7rpCbTSRwBSIwX+xzWJfUCPzv6yrTUA6eMoM/PPUu8pHpLaLZgaLyXC9wkyJmIIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=AMRTLQD/; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="AMRTLQD/"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5AA40240029
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790277790;
	bh=L/egdCFWIbRkzpbcmj+WbRyQ1f5zUTpRIZSZMmMFc10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=AMRTLQD/HHa75B53Yg9ApKoUKCEdOzB9/b5EDO+qTvwkiWojhNlhlHbcUTjpsgPGB
	 u3afWRkDmryXZG/BXyeJ6mfnhPczVk2wfy+u0SLHooJaGwTnPH5jl1eELWS+692I9g
	 JU2e25HAoKvonF8FJEDTAxTWngDboU6mVos8cJfV/g0jvfPvLjFmGPq3Bf/LBtzDMJ
	 ggMXTOvonsf29gkqTzJ10VHzP7xDTF5edPCGNSsfHnObeGvKCgUm+b2sHTbG8JI/3O
	 yka9N/wpi+CXCqnCd3BS7I9owCHYEY0Hi1/y5HFqAh0JgeQN5yimE6/aLhLBi37L/9
	 NwA6tY5ja6zDQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrNz108fYz9rxN;
	Thu, 24 Sep 2026 21:23:08 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 1/2] arm64: dts: st: add digital temperature sensor on stm32mp251
Date: Thu, 24 Sep 2026 19:23:10 +0000
Message-ID: <20260924192259.20517-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
References: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The digital temperature sensor (DTS) of the STM32MP25 is a Moortec
MR75203 PVT controller with two temperature sensors, handled by the
mr75203 hwmon driver.

The reference manual does not document the process detector and
voltage monitor blocks that the controller reports and the driver maps.
They were found at offsets 0x180 and 0x400 on the STM32MP257F-DK.

Use the temperature coefficients from the STM32MP25 datasheet, as the
driver defaults read about 1 degree Celsius too high.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 44938c036e30..d57ae0c5574d 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1800,6 +1800,21 @@ package-otp@1e8 {
 			};
 		};
 
+		dts: thermal-sensor@44070000 {
+			compatible = "moortec,mr75203";
+			reg = <0x44070000 0x80>,
+			      <0x44070080 0xc0>,
+			      <0x44070180 0x80>,
+			      <0x44070400 0x400>;
+			reg-names = "common", "ts", "pd", "vm";
+			clocks = <&rcc CK_KER_DTS>;
+			resets = <&rcc DTS_R>;
+			#thermal-sensor-cells = <1>;
+			moortec,ts-coeff-g = <58500>;
+			moortec,ts-coeff-h = <201200>;
+			moortec,ts-coeff-j = <0>;
+		};
+
 		hdp: pinctrl@44090000 {
 			compatible = "st,stm32mp251-hdp";
 			reg = <0x44090000 0x400>;
-- 
2.55.0

