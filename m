Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919205;
	b=txCi057Syxy8gFLNWwiXrfVfljhlA7h1XqjT6mv6NZd/amx4MaAej1JTGtqvTtaLuDQ+
	 wo09Kxg2lEN9N31vyho/6ObHPuxdvZyo75btpch/8Te2U5gc/mrwbPjZkWmI9ukobjPxH
	 YXO2AzgJT+QZSPsXArKfk4AqnV6TjPFcvaTuDxjlYPFd3RERhkW83qtU8TOAWcx1CfvP4
	 UZC3YFu3IXEsD9UNKy8pmhwAymgQG1Ni4wIWPbVPS0BqYBolNkHlSJ63EgkmLS+A/tlvt
	 Oa9BHz+oI7KtM8F1Tp1tNW4qAm3xGk2Hccp14WgfAgIdSGID+7bV+CfKIV6fD6rLo4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919205;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=0rrc6yitlg3N1pLwaw+QmLd+KXVWfDzTO1188MqwdCw=;
	b=WFqPnjVQQPidZodF8KKoRUgagZkTaEIpCcXhZNz6ym651ZFVoW1zget5FTyBDHPVwAmT
	 DZnyWgPPo+W7CpJCcl/CwQG9IjyFq7Ssehok8H7G/bczL0mAadbea+cyNPl/F45bxcJDU
	 N4+4gicZOoFj12raYdBPBNGit440VqJJfEIO+T8Omsx7D1dkT6rib4RDGdtWaZG4CvzlX
	 xTJLhHM8uZ647M+49UvJqv824fUAKu2u0WSKlzLmTDLIWAiaWuXIRV/++bfbgkZXxtaZx
	 3tTUAJd/PxMYR7GGgU02gY5b/ZR5pe5iy5hcAciwfkar0kshA0ctldIXADYe7PawKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c2ivbERx;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75E606B462;
	Tue, 17 Nov 2026 12:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D75E606B462
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c2ivbERx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919163;
	bh=0rrc6yitlg3N1pLwaw+QmLd+KXVWfDzTO1188MqwdCw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=c2ivbERxNx8nC9elirXtOQB+bbNzkoE1XloPLuTjaAjxAvBDCXr20kOGU+boZH7he
	 YyyrPvJ4Cfegjc5NGPQorKacfjrWenE4zYnG5b6QneuLTq8kEl62f4yLgm+qZK3fRW
	 DSqYnNujqGW/WBTIU3xBKjYrY61XbynoWW6iGrHE=
X-QQ-mid: zesmtpsz6t1794919157te1ed1c3a
X-QQ-Originating-IP: ZFf2qHqP7RisJtMpV56HPT32knSUlElPmSfmDLZpxso=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:39:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16000574265018229481
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:50 +0800
Subject: [PATCH v5 8/9] riscv: dts: spacemit: enable USB2.0 controllers on
 OrangePi RV2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-8-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1584;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=uu5uKljJfa42eiLZB42IVMHS1wiDxAgRiYVIiQnevkY=;
 b=JzG18KJVb/s05Gol9l2+y4Q3xvN3ebpD82OuoWT7fCktQZeLzn+bD1JSVzxLzwVAqM7AJkkCz
 G80gctPNEuuDVEZrHEwV61BZYyLV37gGtDcV+DNvYgKub2LqnwNqX85
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OLGeby/1Q+87ktHETSuO++mUneTU43A2nxApoGEdAV9B14S2Ra8/Ts+4
	V/hGZ7Rmbnz0P1o/rdX4GUVovtjyClqPKW1b6gXAxrzx/meuQBfPp5+0LjDT2/0sPr/ovlZ
	Hs5ypO6Kp3VejZ8N1EwbYo14t8K0pfVi/iUlgHeXhFNloGOc+feUju2RqaqknUO7Z+H1uQZ
	ejZmR7YaFVHAbE4wIxkYbDiPIy9D7yDGLWC4880kvbkLvUgulo7UAHIfwvVhApjD5mCXzYQ
	adgPksh2yctryzs2XibGQUPKO/rDx915HasGQF6hUxZazk9LDT34MMgzAhciIZO5xnoaE+n
	46Uw3SuCRyeDgeEHlGaGONcbbrWVO2GgjgImIqUDwbS9OBHwfXXWcAX1o6gBl14j1p5D7r9
	l8AJS2j1l/hqyRtKsYM2nG7sjTAbTxmoYFfgQxjuC0FxDtiSSR8tiU9IJKlotV5xgwu5r3L
	iBs/WbyzIFpgDNrXq6I5P5BcNDJ5maJstnNLhPUZqs9n875WSgFVL/Huz/xxoIcybIZleLT
	nmiRbx66bGRLcVP0O1eCWrQwlQiGr+v7tPXoNELc5Vga65ACdjsAeiu4JC3Qud5LzHtOrUB
	33FmvFzJj7UJOs9dy/7+IJdK4pYfN2u4eREZSgKIu2xJQj000OijWG3ZOfMEGDq299NclxZ
	OB1Yq99d9s84p2LYE+QBytfWHPnbFjJJpvWlCF/a3C6oYWYzKz3vGKOu1mabyy8g2/yJVw2
	koeUdob40HpDUo7C5pfD59ROdsWt9y68EFfcNDtN/2l7I7R/encEAq0zwpiT8v97FzCLkSD
	/SGBRdrmCweGHL1QjSgGsMAG2Na5IOPCAymTFT00G9Un4eZCx/FyEauqdzom2utj0kqYsFD
	vHif6ywGTVgkL68tyAkLtReYHnD3Ne6pD4RNbkuHwzbzlSwYrS5cUbyPujHBL0McPqY9fCo
	6ujtA/6bmf4w9DVuSaw6/ZaFzllqFGriGrnjdKB5blR6QeV2+NDLm3zM/Jvi0ZgR8Iz45wE
	T89+kQyeU6FGDHiWN12I4dDdv9ks/cdkEq+LNPqiO8duDoBB45uWA3veNhaBs/KxyOGYF5B
	VB/KebXzTd5jzet4jdbU8kX4UQZfoP3lPdEDnquK4NBfwGHVMkTOM+orRqVd8e5lTfWhs3+
	w4ZfOjVlF6W+Dhb69VY3XRpTPKl7a2LnR/aP
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
mode, its vbus output is controlled by gpio 126. And the usb2_1 is
connected to the USB2.0 connector pins onboard.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f3550a..53ecf4826005 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -77,6 +77,16 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc_5v0>;
 	};
+
+	vcc5v0_usb20: regulator-vcc5v0-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
 };
 
 &combo_phy {
@@ -427,10 +437,28 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	vbus-supply = <&vcc5v0_usb20>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2_1 {
+	status = "okay";
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

-- 
2.34.1

