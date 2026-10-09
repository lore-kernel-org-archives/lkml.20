Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC948FF6E;
	Fri,  9 Oct 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531117; cv=none; b=V/x/GBjbycV0qCqzvwn8PE1K3RR5zxv+JEiEVC26QpjKBqEVVzsLmiNHs4HOABT93kdcspTjOK1R5vVh41mnDSULJRjGhoPwy/Mxpmy0sSMpJ1L4ikYYDemsgB380U+5yY82/x8GIx3rBFDMo1drB3m+jcNhsnueZuiekNJCEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531117; c=relaxed/simple;
	bh=y/B1RSsy7tlAOLET8kj9GHqSu1aC5ooeahP+mbPB0a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9S443iFK8X63Gzzya4Wjq32a5RlhG4hDyan5NMXUlYlipHnlwqWby/tHdgCt20BkKIjlqknLCweFzefXOLQ4T0kHuLKhhTOnkew6GCNMYM+HDrnNBY1v9LmHAwIm8K/r1fJYKgy2oO1KPS5qfW9UwHyfQGwtfj+s2vbNhSEtMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=RCFOPzEo; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="RCFOPzEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531057;
	bh=joI2WMr41hOkehyb7KUO+7R9JLtNCIosIbqVuckiFuU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=RCFOPzEoQ+s3LuWAUnNCGkP16yyCw87YFMVomTlTHQADNym7Msu6TNGzldf1GdQaY
	 uYNguVPkq2f4Wtmt5CHp6qI/1DWagw9XlN4pFrhixTJ9bjJ2YGEPNwm7yf9zzdI+nk
	 2REjotAEXNFaontLtEAa2vINW58INlkUSEhkGwVM=
X-QQ-mid: esmtpgz13t1791531050tb92eed5a
X-QQ-Originating-IP: CJ5gNwYev9eoHPM9JGw16LFFmldaXoYX2ObG+eSo5pI=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5461651069293598010
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:30 +0800
Subject: [PATCH v4 7/8] riscv: dts: spacemit: enable USB2.0 controllers on
 OrangePi RV2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-7-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1566;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=y/B1RSsy7tlAOLET8kj9GHqSu1aC5ooeahP+mbPB0a4=;
 b=FyFQZ7GmOsAHoMJhL9sD+hzTiOy9kYYrlEHhaRpifkSh+o8rHcjJ/glJDVnJzEMUvPNdy4MHx
 24Bgs4raj/tAT3cCLEphMYXRUCuLDuLiZTyW5zGj/8g2ag79ig+zw2I
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: M+TNhCsuoqP40dPUhJ4fjo6TbNK3LgiqyiFoZ61VJY2eW5XjQx27th1i
	huTP2WFvOJJK0nG9WbCK6h+3lKM6BCqb135z2jkReRc22n/eJdIwkkaffdzvrKtGGUob76R
	N2JW4PFTiKC7FRFWGLHR3nMCBr6eByjIK8P8X2Wh3MyUDoXgGEK5t/3z7HTGVwoVbFSdQmD
	e9St9Nh8Y5f3/df+QgkP8bZY/Xz+e6EOMDfA9awzS6OSkMoM1oKFoE6KClner2QuNeExr1w
	Px+/PlZXdlBjaTq//CJfeE0/vpi5Pf6Q8kXawITLVp0SIzkExfVVH2GI0Vn6fMU9JgFn83h
	bVW0q7ZY4aR0SvKxJTcf0ugsRoFyi6OUsojLNQNDDR+7ebjiMRQ4wPWt8S/kI3eZUd7kd2C
	arL6cIgt+Z+SMw/XIJpqKwqzqYMj8a1/Eo3vveSwy71Tbzo//Ed+PBOo/vrrx5RUK9RMzBu
	gmT/bYCxi/X2YYPAjZzY5Td/hKRCGWvbBjaeyNhIJRavnIlu2U93G70Erdn+6BgPT3m1P1X
	meiuWKiIdxj++h0C4NFRokUuJ6SW1wr69Q9n4Bp4nIU/MnZN23ymto8AceJ9xIKmKt/aX3T
	XuDKIwGTwdSHDNStDR/bcPkBzFdcKZfRg9atOsm/hX/Tnv9/NEwlj9/2y6J8yBvke7XuEMh
	Q1x3pyHb/GzXPY8HGHOkIn1JUepZiQzKOODFUCky4EMBI95/ou2ETuaiiZVb6cy1cGHloeY
	z+sGvo0czPI4vu6rE8D1Mmovsf4IFTe6q3/W7B0NLysxfvogJoTQExJPuxlpc0WlXn+9jBr
	3izODl0u5G6ayUKstiYTdx1nZTvZRm1hqTUUmbYQtTyo8awmQziMIqIpT4bvRsvynVXW+8E
	1z6ozmJ2mdxqVt/UXY7M4PaqrnmsNbrvOuM54PctcCo1Xd/fIFkjAX8GdIBHAiOjuvfup9p
	v/YZ5ba66GW87wBlDw+zZfBb0gb1FncZvFIQLdBepA6hG+nq2Hgy68RW7fXDsp01CMpxRQX
	LEfvS2Sae4hahl6p7n4M8X9TXBR9cMZgqUE3dbvVfKUQAgtfwvXTfNgDMJFTbiPD7ZxbyEz
	QH+RaM9+jq42CAkfRlMJM0UYGPilC7reqReZ+aND8ytZPe6nPqM2R3XR6PKlGe+DdQ4jmsf
	Wuf+
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
index b907a1396b21..32d1aafc88f7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -64,6 +64,16 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
 		vin-supply = <&vcc_5v0>;
 	};
 
+	vcc5v0_usb20: regulator-vcc5v0-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v0>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -341,10 +351,28 @@ &uart0 {
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

