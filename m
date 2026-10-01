Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A340B372;
	Thu,  1 Oct 2026 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876981; cv=none; b=S+1pbAVpC66ZXue5gccT3rPFLOEFfHs9zKE1/S/sA3PsAbw3L5+vI5s/Ux00tWYJBFu9HA3zwOUw/sGUYRT6YeIfqPMYivrHCESho+bx8JnL+XtnOZojaGKteO/y2Let4qzido5e2OXathewxUqU2+b18xpoKoFOjGyZ01alyIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876981; c=relaxed/simple;
	bh=TGxycnIVrQjnoDjHTB1GRBo3X2MK/JsObKecauI+dU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPPtkjnMyHKXnH6RuOC7PKq6lbf2t8Gh5mt+B+bD7AXr1ANN/49LV7t21FTBw7yhaE6vTQTrjaGLBODvJ/77dM0+gqKkHLsCUlRK4xvFERBY+bYL4+OdaizQ6BgysdZVdWseLOue3kBu1iErrLgdkDFHSu0tUhI2g8C6Rj4AbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Ui3qd7hF; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Ui3qd7hF"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CAB5F1FFE3;
	Thu,  1 Oct 2026 19:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876972;
	bh=DHDxTGbIRNcqIvihMU0zQVGbd/spHZ4Yk1yDhbc3g/c=; h=From:To:Subject;
	b=Ui3qd7hFncWyvvZTnAVk75/pg4MLR0hznhWHvejoyIeecg98Cxi5T65XaZPk0BW3P
	 /sDB60Qm9A8KJL7AWFWNVA0Ea16/drZApJccXIQVJFHHnvrkEKZIMFQa3SzdKbtvjM
	 rArCd0TaG20IsgTaY8IPhEMFTqsf7CKKd5rsZvsYOwLoaVYUiLf0ZlO6vfrjOa5C7o
	 W3eZaXqdlCnE2PTmkZn2FBE/v1Khd537ZeQ7+dcPNQRpCAzOP0GXpIopjPJ9nJXKGj
	 HVUyvfEZYfavv/vOkQi94yiq7ixLlHXACFvDJipH5iEgXYlLrmiR+uV7sIm6vC+eN0
	 QKWnSPwtCCoIg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/7] ARM: dts: imx7d-colibri-emmc: Enable the VGA DAC
Date: Thu,  1 Oct 2026 19:49:10 +0200
Message-ID: <20261001174924.3831455-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

On the Colibri Evaluation Board and Aster carrier board, the BL_ON signal
on SODIMM 71 controls the active-low power-save input of the ADV7125 VGA
DAC. The VGA overlay does not drive this signal, leaving the DAC disabled.
The monitor receives the sync signals but displays a black image.
On the Iris carrier board, the DAC power-save input is pulled high
so the missing GPIO configuration does not prevent the VGA output from
working.

Add the pinctrl configuration and an active-high enable GPIO to the VGA
bridge so that the simple-bridge driver takes the DAC out of power-save
when enabling the output.

Fixes: cc6c96f0bdd7 ("ARM: dts: imx7d-colibri-emmc: Add VGA overlay")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
index cda214c13876..363c0c2cc43e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
@@ -12,9 +12,14 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 &{/} {
 	vga-encoder {
 		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.47.3

