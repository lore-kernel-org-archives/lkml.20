Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B847C107;
	Sat, 12 Sep 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220498; cv=none; b=KyKERcIwXjdU+xM2qhx781eSyHnvauPqT+j2xyRlxb+x9Bf4X2pUoKIXd2LNYYg9E+nTSjV3jTp4G2ovAhvgk0l/ICeK/L29v+BV4YAkc0UBQ5ixLJMHWrUQyTp+yGPtCTw6oV6k14ER8oy/dfevdhCfZnlSD+S9YAeKuwWdz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220498; c=relaxed/simple;
	bh=sFsCH8XysqDEg1LSVkE9x/UFUMp31MIAyt5dqKW58dM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Y2+GLkbd8Egn7+UqGhYfCyvNiZWCp6XyQDAW+s2v9qxIB5wjI5Xa2xY2lf0v3helGga9O91J1SpbXHL89X5hlgQlcLK/zfxbAE4JDZ7SQQ4VRpBYs7ri+Dh/dhGdahFKqv5GSj45mjU2BGcdjQ+jjqGNVM/W+hLu+1tAYZ6Y5/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ldbr/Ra+; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ldbr/Ra+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789220489; x=1789479689;
	bh=hMFZ/DhTLbyMTJSv5E5VJ6nGgBCir088xR8Ufmezdsk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ldbr/Ra+ZFurW1tIaYoVumFDWIdyon7YQm9cPKWdvGRcMAAI1tUsq37nIJip2UAXr
	 Yd2lumChW/FwcGOl4OSdfaZGO8dfViVDpFalwcrPKseu2KLsAKuGp4e2AParwrSgPp
	 Aw2CPn7rVLL6EKs+gV468n1J1j/XuF4dvbHJjKmKrJ2zjbSQcuKXQ6xLCtby9/7crr
	 M1VV86JJa7CTlQpWZV5PStSEazfBPcsNsg8RocGQ76Tna7JOV5/8SZJgXcBQnyalzi
	 WPUbAShp91zp6mrlGg7nvcLHhwRyXE+Q0jprYXtlyP5cafStjeU4rXCvRW6s+jr5du
	 pTcGYJA/a+bOw==
Date: Sat, 12 Sep 2026 13:41:23 +0000
To: "andersson@kernel.org" <andersson@kernel.org>, "konradybcio@kernel.org" <konradybcio@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
From: Martin <hemisputnik@proton.me>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hemisputnik <hemisputnik@proton.me>
Subject: [PATCH] arm64: dts: qcom: msm8917-xiaomi-wingtech: enable flash LED
Message-ID: <20260912134056.3347741-1-hemisputnik@proton.me>
Feedback-ID: 150620256:user:proton
X-Pm-Message-ID: 8452db8322bfa719371867a2bc3565e112cfd1ae
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: hemisputnik <hemisputnik@proton.me>

Add SGM3780 flash LED controller to msm8917-xiaomi-wingtech device tree.

Although the devices this device tree describes have a SGM3780, the
existing driver for SGM3140 is compatible with it, hence why there is a
fallback for it.

While there is no camera suppport in the device tree at the moment, having
this allows using the LED as a torch.

Tested on Xiaomi Redmi 5A (xiaomi-riva).

Signed-off-by: hemisputnik <hemisputnik@proton.me>
---
 .../dts/qcom/msm8917-xiaomi-wingtech.dtsi     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi b/arch/a=
rm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
index 69eda5f42c06..c0b5094efced 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
@@ -7,6 +7,7 @@
=20
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "msm8917.dtsi"
 #include "pm8937.dtsi"
=20
@@ -25,6 +26,20 @@ pwm_backlight: backlight {
 =09=09default-brightness-level =3D <128>;
 =09};
=20
+=09flash-led-controller {
+=09=09compatible =3D "sgmicro,sgm3780", "sgmicro,sgm3140";
+=09=09enable-gpios =3D <&tlmm 93 GPIO_ACTIVE_HIGH>;
+=09=09flash-gpios =3D <&tlmm 90 GPIO_ACTIVE_HIGH>;
+
+=09=09pinctrl-0 =3D <&flash_led_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09led {
+=09=09=09function =3D LED_FUNCTION_FLASH;
+=09=09=09color =3D <LED_COLOR_ID_WHITE>;
+=09=09};
+=09};
+
 =09chosen {
 =09=09#address-cells =3D <2>;
 =09=09#size-cells =3D <2>;
@@ -306,6 +321,14 @@ tsp_int_rst_default: tsp-int-rst-default-state {
 =09=09drive-strength =3D <8>;
 =09=09bias-pull-up;
 =09};
+
+=09flash_led_default: flash-led-default-state {
+=09=09pins =3D "gpio90", "gpio93";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09=09output-high;
+=09};
 };
=20
 &wcnss {
--=20
2.55.0


