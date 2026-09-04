Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BCF43FD09;
	Fri,  4 Sep 2026 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513878; cv=none; b=DZl+FqWecrfYbePxpKwifb+UwdifX8Vqhgmhl2K33gOg3I5d4/6sOhiQ0RG48Zai53JRhNePFThiWSKv3S3oqWDrDrSJULdrTv+mjvdS41rPbUD52wt37K9QZwyuPpDZ/7tspg++CJCpdh4LpqHfk2zN/EW4ByBZGQyEffZ5ouA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513878; c=relaxed/simple;
	bh=o5iSOI7M/lthq0a5VG6OAVfUQXjNS9w7x0iv3wmBH4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uNRCHq6C/YMtH27bB9p6oF2jx8LiGUcQLwancR2roYh9J7+XkXbVyihDTZsdgGVLyT095rOTwwIN5UWkTuJhhiSgpkP95qNDjuK46cm4MVxGLx8CxYKPFL43tteoWFxsTaNIaECUtGzXw4PMBl8GBclUEG8Tev1KC2+lhhA68XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OA4bB5V2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yDfu2oAZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OA4bB5V2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yDfu2oAZ"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788513871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uRcOLGshUwMubr13sEH22itNKo4w87gkUAg3RBs8XTQ=;
	b=OA4bB5V25fI+w4ai7W7aokYoIrX/nQl+0naRsjtCoXRNjmEuuTFq1PuWdizMPoClS1FqLY
	lVu+cM7k0zNSdsccXWtay++qOZS+kiMtYduivc0XDPY3xdAy1QfQ/wTUof+WEasrjRt3RK
	hwtM96pj7/VCtERby0OcKR/kFRZHXNpJ6+kauu1QT9/p779xzATS9Ulw5ro6jrbJxl0LF9
	G+E146o2iAeupwtuCCQLG1YuLnb7AZAk8h93sCnSTwsQJqSMn+fPxT33uyvtLGVLwfwN1c
	DkwMKHLJfYfUsyeq52G5XF4dlHLV4zH51dgj9XjGA52K7DWlaSeHtlRrfyRX7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788513871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uRcOLGshUwMubr13sEH22itNKo4w87gkUAg3RBs8XTQ=;
	b=yDfu2oAZvECB0128kbj5Vdz9Z3FA9krI/MsoYFD24//pc6aOM5W+D77sJeTuZDBX0EfgDu
	ZzZAUQEVIGkvUCAA==
Date: Fri, 04 Sep 2026 11:24:24 +0200
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAEeOmmoC/22NwQ6CMBAFf4Xs2Zq2VEo88R+Ggy1bWaMtaQvBE
 P5dwKvHSebNWyBhJExwLRaIOFGi4DeQpwJsf/cPZNRtDJLLitdCMGPfUgvJ0kCsUspo7hBL42B
 bDBEdzUft1v44jeaJNu+J3egp5RA/x90kdu9/eRKMM2WF5nVXXpQxzYv8mGPwNJ87hHZd1y/0p
 1+evAAAAA==
X-Change-ID: 20260811-bcm2712-spi-644b70fee3bf
To: Andrea della Porta <andrea.porta@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788513871; l=2137;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=o5iSOI7M/lthq0a5VG6OAVfUQXjNS9w7x0iv3wmBH4Q=;
 b=nYsKLuV/n3m1wF05Y1Z3yx+f9hUSqV8pKBK/zWzHzGy/jt4PhwKDzV8spWRiZ0hXu21KP16p6
 IepOf1ACcl1D/UrrZwnDpOMFidcRjVkuc/CGN26Y5pVqe6r/7mXaLZn
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
the spi interface.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
The RP1 chip, found on the raspberry Pi 5, has nine spi controllers. The
spi0 is routed to the pin header. Add the rp1 nodes and enable it for
the Raspberry Pi 5.
---
Changes in v2:
- Drop first patch as it got already applied: https://lore.kernel.org/lkml/20260903194624.2038562-1-florian.fainelli@broadcom.com/
- add cs gpios to rp1_gpio for pinctrl
- Link to v1: https://patch.msgid.link/20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..0de3d78100a5d 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -69,6 +69,20 @@ usb_vbus_default_state: usb-vbus-default-state {
 		groups = "vbus1";
 	};
 
+	rp1_spi0_default_state: rp1-spi0-default-state {
+		function = "spi0";
+		groups = "spi0";
+		bias-disable;
+		drive-strength = <12>;
+		slew-rate = <1>;
+	};
+
+	rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
+		function = "gpio";
+		pins = "gpio7", "gpio8";
+		bias-pull-up;
+	};
+
 	rp1_i2c4_default_state: rp1-i2c4-default-state {
 		function = "i2c4";
 		groups = "i2c4_2";
@@ -94,6 +108,14 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_spi0 {
+	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
+	pinctrl-names = "default";
+
+	num-cs = <2>;
+	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260811-bcm2712-spi-644b70fee3bf

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>

