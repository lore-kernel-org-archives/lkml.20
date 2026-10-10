Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F545562A;
	Sat, 10 Oct 2026 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626417; cv=none; b=A84Ckoe7ZnRZBvxl941eGL1u6+aOOXSEC9cN9JeMF0FkBF2zPJcBzUr/56WWGvziHMjmXiJqQHl/pg6B8NrA5WKImXMPHgGpvLMj+EkvwwbaT9qj+xXirE3mVKfqA7iQ65xy8y7WY+EXu6DrbbsVNpbi6mF2waDEmTXIZ02oZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626417; c=relaxed/simple;
	bh=ayZJau9OFqjACQBWnIZS/ybDW5M52l2tK1j010eNrTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bJ0D39oAg6XftGJdTo7YT5yvDrCEBPmx/bPGMULL8+ArDnnJFe3hJnobpkX+PikLQqNif4wSndL/B/HgGIpyqaYWzfglWvbEAc40rRWspLqDiP5cwgDhcJYr1VvAIiO2KVrm6O54c1XxqL7VBr8X9Ua9rGqSWmho5+ZNQbNQ20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 508f731cf;
	Sat, 10 Oct 2026 18:00:06 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
Date: Sat, 10 Oct 2026 18:00:00 +0800
Message-Id: <20261010100000.2236931-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa125416a5a03a2kunmbe14e65c40c299
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUMfVh5PH0pJGRhKSkpJGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+

According to the schematic [1], the 100ASK DshanPi A1 board does not
have an hdmi_tx_on_h pin, so removed the non-existent FRL GPIO.

[1] https://dl.100ask.net/Hardware/MPU/RK3576-DshanPi-A1/DshanPi-A1-RK3576-SCH_V1.1.pdf

Fixes: 2cd97880fbc4 ("arm64: dts: rockchip: Add frl-enable-gpios to rk3576 boards")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index 05fb4a7f9a16..41c90414e898 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -278,9 +278,6 @@ &gpu {
 };
 
 &hdmi {
-	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
-	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
-	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -741,12 +738,6 @@ hp_det: hp-det {
 		};
 	};
 
-	hdmi {
-		hdmi_tx_on_h: hdmi-tx-on-h {
-			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
 	pcie {
 		pcie_reset: pcie-reset {
 			rockchip,pins = <1 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.34.1

