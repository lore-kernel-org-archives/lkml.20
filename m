Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8133385AC;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743501; cv=none; b=qrG7Prb8eTpGrOKFWtuxohQWHWyk0VMkD23M8P+OkIqFOrrtq9qIvCwmIn45E5sr84QA4Qgukl9t5WPnNjBXsBvZSUoRRos6WXseXl8JpA5F2/CJv8tCsiIsCRGt5C0z6PgwzVxkhxxPM9FdxI9t/PvclnAuRUlrYIFCOgdYg0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743501; c=relaxed/simple;
	bh=EnrtUgMZak3dNHMxblUywFdD5dZea2Y3SQfFyIrdgXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFpVqzIUj3t22dOAnRcnjs3OuPbd1cCEEXXD6Iy24duITiEgZ8+mxX6uMT5gji1nXVVSMlVb/JWi/Fi3/0qh4gm8e7g+2murB3ae8maw5OnZc6NfS90S8WBP6Sh/psiSa7SHaLbsu2jNB3tHfmFcpMEgeyaTtIirYQe/Wa0w7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUb6v8cn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUb6v8cn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D3B0C2BCFF;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791743501;
	bh=EnrtUgMZak3dNHMxblUywFdD5dZea2Y3SQfFyIrdgXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hUb6v8cnyJ21kucOhNlczSWsCz93/UdI3VkyqkvvmNrJH7i4Y1kQRke/nSwu58BYP
	 E3AIx40UEt2mw3T/aZB+oTD4jC82hcsOlBKIABchBdjBxToPXnwXwNKLWWa2MtsjO4
	 WCKQ89yRbN5i8Dz1f/+J0lehN6s+oSbIWdzW2xbzTuNKDnCVdZCalV6jAbf0e59XHK
	 EGUXHP6Iw6REzO4XdHNRSqKtZk+KuPCvAUt5A0wVaVoufMctUNxn2EBGioLYpKc5X0
	 RAmwTctUsfsuJM+oJgUGuSnY6Nf3IxfVVarHM7kUCqhOAd+HUzSfTeUuL/SZZ3rvNs
	 DuQVlnH4n611g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F33BCA9ED0;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 21:31:41 +0300
Subject: [PATCH v2 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791743499; l=1222;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Hz95Iy8nIc6uFv4KH+mxgM+RktM0NZGoY9tzMOzVYjw=;
 b=piMSgDud16tR23/aforCb+aarsQE65WEYEn8Q/Yr1GvvoXd4aL0k0CZxaDKKPhuHUoPp4P0wM
 hE0AF05Kh9cAhJ2QI0xEhCnCikwphs+8bqw9WTHvzqpjNAjUbVkL2jD
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
index 3b74528ef..722dc906d 100644
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


