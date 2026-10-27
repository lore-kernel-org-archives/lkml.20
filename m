Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099886;
	b=3kA6aLLsz1QbgMTs5gCNWhdROwnfaQh4g69POQzzuAsFKOLNLs6hhP5mOoYVRTJeZNg9
	 2K5AM91fozQqSxMorx8eEOOY7Uv4bNs9D1ImItyss1aLetDq3oFw9vifilVL+wQeKi3jh
	 2iwmtLy/NhB6tjzMNUkHYV+jJUJDPSDrHry7XKmsvSeSVdUA2d2haNO5BEslck2yNaicw
	 GpYyKO0MmohJDo3kLrMI9Sgo3yztao5zO2XpdwpY23uoK1NF3VWfNdVC8bjdrDpT7qFOW
	 rZGitmYeGOGsu/a7NXXuksZcYIb1H+o73QEGYF5dBYp7zGM42VSIk725qqQpZnxdS4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099886;
	h=DMARC-Filter:DKIM-Signature:From:To:CC:Subject:Date:Message-ID:
	 X-klartext:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Cz+uk2hR6yCGHtN1VfGttHBuW/qw2YpAIGGSpByVGN8=;
	b=JbSywxDWU2xcI7fuMrmgM9m+gbcMDoeHOI8xpJlyvi1YZKqpsECPfxOR48enTVsMoxbR
	 IfWeD5cIiPd9yZYiw2ZjBuZ0x5KHRYz544l1UnxkZm9es1KvZOSXcJnZW0l1tkbneJcwJ
	 laqzKxTmgcQXHsA8I2/STbzuquU6HdPkcIrzWVulrTDpIkQu/9wXmgaAGSj72XFMIr4rb
	 fPQdNQ6VewaZjwYihtByXqtnahKbHitma1T6UFuJw/k/8ZW/YeflKcZ+JC5EylarHp/ie
	 XPLAiJ9G4wYxMgHUc55LQi2sRnS7EnObUZPJ+2jJ3iBopB2waNvgIlJ56clsh4MYx+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=wziq8Nkk;
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA478606A31B;
	Tue, 27 Oct 2026 11:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA478606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=wziq8Nkk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1793099857;
	bh=Cz+uk2hR6yCGHtN1VfGttHBuW/qw2YpAIGGSpByVGN8=;
	h=From:To:CC:Subject:Date:From;
	b=wziq8NkkQGHKOkhhVT8bsvyWzJSKCswS0POnp+rBUtwdm421caCVLCK8r3O8NBCSd
	 pP3lkvT4ODs+q/dtQ+KMAnRgXWdo9FWtHDP1mZrZIV/v+v6jh2AA92G4Dw5XbNuqoI
	 CPXeXfuQTjlmWoSykEyNE7v54ae6H7abUB4QR5VU7Y1F0CN72eomRzZmv573L25nOg
	 f3Szja+QJs/Ucx7hpBLpzDBD2d18XSzxo9uYbjwPA68LuOnhfUEDid+eJg+VOPrbhP
	 NF2Mh8LWTIyTrJ45tLQmEb9ulEZdL5zW1arm493tiFqvwqfirlRUUMrm/QSblxJRRb
	 ynRYusSiqUeIg==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI device
Date: Tue, 27 Oct 2026 12:12:00 +0100
Message-ID: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
X-klartext: yes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On the maveo box, the SPI pins are connected to connector X10,
but no device is connected. The device "dhcom-board" was used
only to test the hardware, but was not removed afterward. So
remove this device to accurately represent the current hardware
configuration here. Also remove the okay status, since there
are no longer any devices defined in the interface.

Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
V2: - Remove also okay status
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index 047f7b2d8526..0b48de79c595 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -59,15 +59,6 @@ &ecspi4 {
 	cs-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pinctrl_ecspi4>;
 	pinctrl-names = "default";
-	status = "okay";
-
-	spidev@0 {
-		compatible = "dh,dhcom-board";
-		reg = <0>;
-		spi-cpha;
-		spi-cpol;
-		spi-max-frequency = <54000000>;
-	};
 };
 
 &gpio1 {
-- 
2.30.2

