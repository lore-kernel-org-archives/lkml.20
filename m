Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686D52378B;
	Tue,  8 Sep 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861000; cv=none; b=m5lEMjk6rF1AMfdYYv2o3XdbwHxY6e4UXn7tuhsJExbfZw0lepL6CS0ZSpxzrkwziHXuAWiEURQ4ljijh8AYk5x9ZeK1bfqcJHeVadp7VwWDkJr01NPhsYlijnYVIJAGkSy/za2CZTnxntGeitxWKBI9iEhbZ94a38bmhCRWj3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861000; c=relaxed/simple;
	bh=5wPNIMHVow6IcqXG5hxEdCFYBFcsMipryVBMs65G4aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIDsZbgQvUW/OKYisFPs6Rv38vLJ3x0yaaeZPaAe9k3mDXJCt2arH6xGbwe3F4YOJLkY1NGZm0REktVpf/PNMN2hvDVN+ImlXnMbIAfTVXkMnMc3ZfdMh+bYWiqDw3JtoOKEVYHbSame28xzbLhERLmuxHFOEo6BjV4WrocL3+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QCWP5cwL; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QCWP5cwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860956;
	bh=ye2+hgCVmV0Etm1pl9xkufUO7A0KrAmi8ijs9rtlA0o=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=QCWP5cwLjXDxyQgk/qT+n00h4w6x++tKlMPqP/Njy4UhgjP3AyfckarqG9vX6MtUc
	 R106hQPavNHddEr93FE1kJg/pFwF61g5kAkgizJKDUvrZHpw/++NYiUiXhNO4AicFl
	 uRjYv6TTTmi2EcFK2/FdTCYmTNCsURWEZJFvWsQU=
X-QQ-mid: zesmtpgz5t1788860949t89de5804
X-QQ-Originating-IP: 6Ndtnxhbk5qMEClSO2NDX9xqhZSsCRHuewa1p8jnSHY=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:49:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16003229966512833213
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:45 +0800
Subject: [PATCH v2 8/9] riscv: dts: spacemit: enable USB2.0 controllers on
 OrangePi RV2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-8-f07342ffa051@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1482;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=5wPNIMHVow6IcqXG5hxEdCFYBFcsMipryVBMs65G4aI=;
 b=AqnMCw2Sn8DMnOe/3+AoncErphhyEiXtEQJJMGbEJfO+dsObsflnctvCA4m3nexAX2dyJoM1c
 1ZjeylKO6MBCLm9qtJbaBEhBiCCOD+wdGEK15Ehcph13gFAViPpI2uD
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OYb98MnhMkFdQedmfe0lf/AKlvnA2XtaMPAJ+w/B9olySAQmy5RLpTuE
	YYfY2yaQMn5MK95lcy42x6drti8ykekPnSlMAYxQpPutEaaUhZaUu8ENgnNKrFr6ulXCJVf
	6xHVO0JDNGDOd2I1xSto0cA0vnPlnxvg07HEMKFooFCHRUmhlF2F1KQlhLp+aJBiswZLn/W
	aIlBoWh5//QeeGNIc4GCq+43fd9BP6pNeEW8rQCsB3gnzrXzo0zqlZFpADOPy3XHOD8sozC
	5wb0EqhVmHWpsPRgDj/uamlI0BdBfB6Iqgoxq779PRkrLx5zi0hBL9zP/NrTkkFsRGYhPho
	biYLw/aF94jNgM1kS8RJOQbjQkqGWw2HI4qB0N1+p6/Yf0vt+/hGuDaRPh/XQHM0tlFh42j
	pwqqXUhM0IkzcY+Z2sqfXgWxB2TFTxZ/SMT+C4aC3L3wPp8gLMJAhNdO4EqKoETV6VNz6OC
	3ChxVjmoBMV35L770sQqIJlvEQUsFYfuSFHEe5E6Xz91zkqBW1VGy0YNGDV9vcjfvXTnFsj
	I3P7/YqYfTY84B6h//UGLkxoWLmHaXMJQsxwW57H6/YMajZ6Nt5ZnubuJRz/AlkYT9uL5p1
	3CF3SHaOX0IPOWVB3DruyiwGqHcSA5xGINcx1e1GasJKTFe497QrGuGTLDMeFDXkICq/UyQ
	JQ9V+4zYY+QEy0IVczP+5ChpOar7HjL8Ti10pt83YqI5Vf4+2142dG3yYj5T3iuGK4Ok0zL
	RJUfkUK04V4dDyLMSyhzC7Q+ZwJDNht+O8sFBhGkr2ScwsKel0WyG6mNhbjeBswo38ez2M3
	Why8IzkR5/NafKgG08GW7HZc+GA+720Ro9ff9HGd+KBRRE3dFuMF8CjRkH0hPlU4f9noODo
	rvYQJ4Mdm8wCS7ls9m2nDtNSD0xbJdtWtY51kqNiIkiMG7LR8PEZcwORJ1sQ0LwEk+14Ia4
	UR3bMb7saPvkNJMin66xvMFMtt7IoDaZrGvWfjSFHXMB9ybgYWbxXqQYbLpuBbGjJbTytRB
	VLlkcjm5pNPQZoRghNuYcYqpUrG6kpVEvz/hPkjM1SVqL3I+ICplRdrQKVNYcJe/Z2A+oxJ
	0ntWauHRKrg+Yp3eI6XwfXbtzjRv+kZIs73Bos8NlW1KIsIHb18uTaDI00H/2eKKbDQ/6TK
	HcnxEQuDUNJbH15v91LFnmnFvBNB4x5axy8LyDMRZ/wLD/c=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
mode, its vbus output is controlled by gpio 126. And the usb2_1 is
connected to the USB2.0 connector pins onboard.

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

