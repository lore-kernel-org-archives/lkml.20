Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE73E022C;
	Tue,  8 Sep 2026 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861005; cv=none; b=RMi0O0FzAhJV81LKWBwt5zbMlnwCRx8h84/+MfYseHC3+8VCgloxM2N7GGITAvXQMrN8LxOQxnM/iA8qvs4I4uhfZ7V1xlx16VqeXvP+PG51JVNW5QmDjEdS+r3HEhQEsb5jIPdPP2SyEnIQszuk5KtjOca8KybYs8mElvvGnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861005; c=relaxed/simple;
	bh=7V2sCrOXsm3hdCkEQkfRa7vLu5JS5k/AqoPTQm3Idak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccePLra+huyKipS31ap6qO+fE9N8KpBZwRMkn87decj9IaPrrAofORTPllv8KL2+VSuN1UZW1uF4AL9EqZVrpJlqZRRx6w0G7XyXEq1VpPDb/j6+OuntBsm66dp3DGa/w9Tmm1FJnxUbHua+r0j7HhH+uwAgw2CGqxTzeYeDRro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GBY7IXn+; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GBY7IXn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860949;
	bh=Zp0jR+ttGiC9kR0lE5ZKHD9MI/6rhTQKpS8mPg9WYWg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GBY7IXn+0u5nSLkzHiBMXUX5/lZhHhSk6YRiYXPHZKzUA1zi5P3cZmnBL2ynHCx8x
	 1XTLBTFtwclXGfeEQ15OH0xsBHu6Z4XyDqedPIfhbpl7Cx68nh+SrK/KfA6Pf8oilP
	 x2WM7s/LPXi7xgvSOU0bQaDY+324RqYechMOE2y0=
X-QQ-mid: zesmtpgz5t1788860942tec2aa3ff
X-QQ-Originating-IP: HtX6zyX2pzMGwi20jWZDcgIEbBe86DF+3wgT1sKBZG4=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:49:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4771292410545852391
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:43 +0800
Subject: [PATCH v2 6/9] riscv: dts: spacemit: add USB2.0 controller nodes
 for K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-6-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=2144;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=7V2sCrOXsm3hdCkEQkfRa7vLu5JS5k/AqoPTQm3Idak=;
 b=VJywLSUJYPJnvtO9/a4Z4oJSfeAYGZIUdDEVoUFz/EyqzDA/EhIRrgeqLj133VitVMC+b2xC9
 iq9PMMQGCbHCRnkEaDBnSZRzXJr4m61zPuJftG5O4RPwOMN7s4Lpjkc
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NSegwrIO7C6EVlJjdehajp11BgvTzu5qXYWrQ8KX0sNiwpkYrwJE3a62
	BBFr5wXuMzdG3Uk9fj+zI2pn2AQyWc3uQjZtf5ZPfhwd0TkErWT5RGstExNAtRom6o2PTYE
	yVcVBd4O/sxAhfdMsKnVrHcu9WejxQESzpVqzXMJl44Y7+L6teBsv78lxTCirD51BVE9V/t
	jsmM6+6DGFHgzYuN8f79FIEsqDUenGtB4SUzrfh6cLbMld77dRV23Ih4tLgDkGVsniNusPO
	otmWEhT/epbY0A/pOvHocBMIWA8rhfAFgS6Lp7x8S9EbA3p2NLhkW2Cg3FkJ2j+Vhn+dk6O
	ARutYuytzRgtLFtmRSrnQBxtShqSH/iEJAGmWniiMEMTWrV3a9ElViWamJsmmQXMkkXUUrE
	hUcqmr1GooS3Xl0ODC7inivr6/UCvCSz+xDB0hQFaRXOyYdau2QNnCbEhEHJsyOIYMl1lTT
	tPcsCik9Cna1XMwhPXtUjq+bEWLwJjL9exKFVflIQWsgGtCYYyb0KhOzHuKCahmc6b0TAYw
	jsm4r3AijNumjgeXn6eIAK+/p0xrRsQubLjmNQJTR6+jexy0gwFBfJ9c7wS6MCPAquOTzAx
	fNMomuHxhHnlGUa7MokeedphwT2DflrO7jsPZ4/1ukjS9a7vDkxbII1GXVN6o2ujS6WI5Iw
	rSWveIADU0boKmxvUBcg9xEwWD6d4jES3fqQ9Wsuysm2M+Dd11c2oKFOjKkoDGEmQ7tdSID
	KfAChwimXyfXBlXBHF8xoQedzm8/Oaups1ZxWt1cyw3Hg/jw1/ya7jOP6w+aZVfVO2p1yEO
	zJZOa931GtoftoWtT3QRchTJZwkTZxO1dEjXvGYzGue4YF0c0zKCzMQ30NZXv5NcZsDSCrO
	EaAbOPlDAUFmvTTPUu6IVj2Qv1BR/uS34youFEKUvxy0FmN+yjf1IHmaEDk3uq/lOQndIQS
	fOQHOcn9V0/CXJRmr1aG8MYEChGqD8g/f7nn4wpF3p0gnh8oY5rGa0BtgmYA61GWxh6z6aO
	HAV5D0ywYcBaxKMZVUhUXgRlORB+IJkeRRCnONI4hiGMG4YBCN+yJwL0O/QXuMdMDloRdxE
	wf+TAFmES+Pf6zI73UZ3catEOU3tqLO+jDb1gA5KmarwgOvV67yzVvYJI0nwpiA8zaARfqm
	42Ipc//6GoFwqeWzQ79lU+vAW+OXlHSK0AxCzbWNNJ+s6j7K29Wez4dWNg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
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

