Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB9A3DDB1F;
	Sun, 27 Sep 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509288; cv=none; b=EzUd4ncNso2QWaRJiutk76aH6kvb/HfzhvIzKcRBByGTg4aSJv+TfGpr3EcI+uxVuu/iz9ynxPryfBp6CbciTjULWJDAK7NI9BUV2Xy8ehJsTVESWQNd74tn89WHnM5AJKjTCvgWyrDu1sjw41nvd1ysnnKnptSxz+DHRL2wo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509288; c=relaxed/simple;
	bh=7V2sCrOXsm3hdCkEQkfRa7vLu5JS5k/AqoPTQm3Idak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chbS0hw9+9kHjAUDk1TZ1QAasVLWfDHPF7y5Sl++5707L6+QecE1NPcfpL4b6ZnR+Aj9ZRYoZpSA9eH43S8faHH9ir9Mq5pS+bZoP7zoEJnZXE6EB1HPztupFPEWlc1J5rhnK5MrydU2ynEX7hChjOgquDCd5MDhsFaNB9JrKjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kvMxIItq; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kvMxIItq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790509228;
	bh=Zp0jR+ttGiC9kR0lE5ZKHD9MI/6rhTQKpS8mPg9WYWg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kvMxIItq+uCHvy6CWIQr3D6on23hVyEjAzEgJpDmN7fr3HZjsxegSunR7MC4ArSDk
	 SgOGB0jghenftoClkpvG/0Hysz8Aof7a4+5gu6MgZcR+DaV5FgnUA6J/s7FnIkkKqf
	 +hQBPrLecFOokJ2WJIosZn3grtCRuRuRTQ4URgeQ=
X-QQ-mid: esmtpgz12t1790509222t47b5b8c5
X-QQ-Originating-IP: wPI0p+8Q3T6Xn2HOLVlbiDL+ewJ7o/DtqBTtpkrZQko=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 27 Sep 2026 19:40:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 217542278909221661
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Sun, 27 Sep 2026 19:40:07 +0800
Subject: [PATCH v3 5/8] riscv: dts: spacemit: add USB2.0 controller nodes
 for K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-b4-spacemit-k1-usb2-v3-5-ce7095896039@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790509204; l=2144;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=7V2sCrOXsm3hdCkEQkfRa7vLu5JS5k/AqoPTQm3Idak=;
 b=EZd/8KWwrGxH1cI8pqaqlMXoQWziuC6nhT67dF1ArK0437+8pTl7aOaOPW4IzE4zGbyqaO7ws
 ujQXpInRLxLA8cNEqKijl7flB8qjF23ASDHu5T/VDxHDy96d3wcB6zg
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MnDLfP0IFnF4cCM8f2WVnoLLWeuYp1nGLD21dQTfnZpK/viihu5E9bc/
	KNEBn7SvyKjcM8su6yxBX3GNA1+UVun0VS0x5vI7iS+EncaxOyHelglJrhZoUEtM91gT7UP
	O34NkWbdzOnFbEnX2dZTAf6uPVGoP6W4yYZdMkfXivF5Bfc1VH4jIRGW2hvjBwXLXPumjpu
	xTihxqZct7azWeWbqotDeKr1+zw56HiZPuaJNPmhWKVoGLvNsL+zRP2vWgf85zNBPoU1CFC
	hOvjZ4vt+nhnjyJurLfYh4UsndklhTb/GMb0lbHuomr3tQuC9YxlF52RhvEqB0oYo8ouqZA
	4jh5b33xSmyDNrrj/3B/6imqxydbnCIZ864CdN8iuY9azBH4WoyrU/rwy8KdrSeXqMw15Er
	wGVGkTLtlV5U4SBY33lbw3LFB7+UFw5gKPcLEIjxGUIXKxBsM8D5c75osMdIOdiLaMy2KlL
	OoKUh6FGvxYEHjFQm2DwEfArhVSmiQe64xcYc7sl9NtpjxX4zYCMcsVwY/vsO7GLED8pq6w
	8ysrx7ZHcALnNKgtj/w7vaJkN4bFAwX5EJw/uA+ZA5fme/GC5ppfdsxzpaBFzSvPWJDuK2/
	Y6aSgR9yUnRiObLYkg3MeMVfJvxEjKcWFpm8bNIO6F0Y65Qb0pU8joBgFUNYA8yNlIZ61Th
	whN3A1tyaABtLrHnlC+G5mUuAwu2snsgbe55bq7zPooGxbG7xDKz0GYV8g/xhZEmSJFs25S
	oQFk9naMBAZJHmmEVICo+mWbctoJPyqOYFlKg3w+5m3eRLN9VG/S8o4OeccMUgcQeKWB1z+
	oEKqWcEHJ9QFHO+v4Bj3jfu5h0a4HNMmTjF/u1dWkAJ2RVeQkAMYzN2RF4q/PTEzH1SYX2e
	hmquHjddc+4n9nGVsczyzN0D4ud9yhS8Cqf5B+cu7LoMrMH06mUuWZ9PviMNeWOrvpjLk4i
	pC4jCLGffgDssgCkuRs6t2K4N6QrFKn11iKk0oWZDoJ+syvJ7pByNBPj+8nEelJHdZ0e1Zy
	T7nsWU542rj6nPf25WKter7nQlZ5a8p37Q1OxG38y4sIJs+mITN8YCGQJYtAQyndjI9qWKj
	GLhgvwoqv8Mem8EjT+sWorn8mbGeLudYK2rDYxUlLReQ4w8SjfIn/JrWdZIyU0h4YjYtS3T
	+pC/tKpVM6Q3QPMqOMErOnFrrRTscfCA6ofQ
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
- USB2.0 Dual-Role
- usb2.0 Host Only

Add the controller and PHY nodes.

Tested-by: Ze Huang <huang.ze@linux.dev>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..22896e757dbb 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,22 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usbphy2: phy@c0a30000 {
 			compatible = "spacemit,k1-usb2-phy";
 			reg = <0x0 0xc0a30000 0x0 0x200>;
@@ -1301,6 +1317,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb2_0: usb@c0900000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0900000 0x0 0x4100>;
+				interrupts = <105>;
+				clocks = <&syscon_apmu CLK_USB_AXI>;
+				resets = <&syscon_apmu RESET_USB_AXI>;
+				phys = <&usbphy0>;
+				phy-names = "usb-phy";
+				dr_mode = "otg";
+				status = "disabled";
+			};
+
+			usb2_1: usb@c0980000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0980000 0x0 0x4100>;
+				interrupts = <118>;
+				clocks = <&syscon_apmu CLK_USB_P1>;
+				resets = <&syscon_apmu RESET_USBP1_AXI>;
+				phys = <&usbphy1>;
+				phy-names = "usb-phy";
+				dr_mode = "host";
+				status = "disabled";
+			};
+
 			usb_dwc3: usb@c0a00000 {
 				compatible = "spacemit,k1-dwc3";
 				reg = <0x0 0xc0a00000 0x0 0x10000>;

-- 
2.34.1

