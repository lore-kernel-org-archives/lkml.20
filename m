Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1430F52B;
	Sun, 11 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739042; cv=none; b=VfaMfTNH3lrbSkG9s2sskSd+bzTpxXPsEYUwYW13g0T9TmNYttSwFBn8z/uGTOWk/IauXojHJqz2nNB/k8eGAFyPGiMPHc4+SY0b7NNuOBrmjMhSkbmNF5n4zLtqg9+6qWGjNflAvfsLZjzgCeKLOLoivDQoHU3/NEuraKxcSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739042; c=relaxed/simple;
	bh=JMjVtMuhkqAXxXbMMWX7PhhLtkEr322l/UDHApXDSCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3RqKu6q84JAKlXCwrZjeQqB7uQrk8/iH5+tCe6qHhc+o23nlEYE+kT6z3I2bxN3ytr0Owa/Id0axc3pteDs9JdGIFUEYiS5DzEx7oSVZLw0++iiZKorMESusJgozibbRSOS6bQrJ0NaM+ILmQ33qBe6whgkq4KTukJwAO/I6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxZa1T1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxZa1T1m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC8ADC2BCFD;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791739042;
	bh=JMjVtMuhkqAXxXbMMWX7PhhLtkEr322l/UDHApXDSCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CxZa1T1m/e5Qmj5OAs0jjM7ikLlVNPmVBWVuVyCv9i6/rti0mfR7cZ3Urs1TsaktQ
	 3dajAV61PMN3qJ5xw00hIBQReVoyuA8u51zyjWfDnxRlrOPrIShsWx7h6YIJhbkVrw
	 TvMxs0+vqoaovIK08t+1JO1Or/eG29wlJTNMMT/ZZSEnEwWQGGwaa20JADG4ItwMgH
	 R2ffs9n0wg4Vh/vmLXxcsNfJJhk6XVCLbK8P+cSIoNPqMZhPgNxRdbjdf5XYhiL4GZ
	 OuCOssCNt22Hxv2YYjCcIRYcjfMFUuFEgpTqiqyBBPl6PFPVSgebDfd1l6UnZy1Gvz
	 Hzu2J0cc6oknQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7E1CA9ED0;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 20:17:22 +0300
Subject: [PATCH 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v1-2-f9f0e779af88@gmail.com>
References: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791739040; l=1222;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=/X8gBi1JgR7x/35zsuv/f2r5evaENU8kz27T1XRV5c4=;
 b=ifRRKlIhKdzl/MOSg5AU5UAIBcV15SVmr7R7gl2lmCLrchc7kLLnZOKbgHL/YqIpNU+r37HAk
 MtCI9Mx7cZ5BuAcGL9sZRXhqAasl1ush8+pyf4HsIVFvMgv3PxAz9U0
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

From: Fil Dunsky <filipp.dunsky@gmail.com>

Replace the legacy label on the blue status LED with the standard
color and function properties, following what the other Amlogic boards
already do.  The LED then shows up with a generic blue:status name
instead of the board-specific c2:blue:alive.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 639b97ad5..5f0cd2a71 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -9,6 +9,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/meson-aiu.h>
 
 / {
@@ -51,7 +52,8 @@ usb_otg_pwr: regulator-usb-pwrs {
 	leds {
 		compatible = "gpio-leds";
 		led-blue {
-			label = "c2:blue:alive";
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 			default-state = "off";

-- 
2.53.0


