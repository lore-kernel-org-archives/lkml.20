Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794227543;
	b=jtD5937eTBW1tSQTi7KjrCg0yv1Z5u0BLHWfEgRcO8XHG7+Am2kAyfMad2mW+ofBUQHq
	 B9xlwD9VSTL6MEB9OaEuyoLJ7J8Qq3aL7Y8t9lpM3xxSVnNcOUOVUjLO+mPCj8IU21RzH
	 sJatrtOa+A4uputxkfdbm8HVPc3ZGPtAmpH2dCZRcI3yD+Z7fMsEC5q0fVoSLnTTCX0FY
	 r33ZL6khdaFwrCVlLgAxxOG41pXX7fChfgdKRm9b5UaEPliOSQUJVTmSpZxqM2yp3A1Qt
	 dc+lhlWXNQM5L4elm29yUatyICQo9SRBa2buEZyoNu3kTR4E33PNHLl1ssgKtco1LsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227543;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oNBOr9Fl9UP7SFyfuHX8El2KnK1VN4sDlWPHvFmEe+A=;
	b=AbDrL8aUom3v5aLfSsWjT48NxCvNv71rQxrvFmNYBWdEYqia9p0ry+STi49EbfbOemdS
	 8j7scuO3hNV6eDX8byaZhbu7IShbzA6QC9GPRGJsex9f7XQUA1a6pwVOoqyxXa9hoA4wh
	 2v6+awSVOSya0Q25jVCh4RhxF3OOyBY1Ylw8L5YmaPpDJV/v4DuC55IeCNNY2rjLNMxsT
	 oVE/Nw6e8Elaj91jEpbLsHk5REwGkrYQZaz26j1hJztuZ1wTt/YtAExXo8bxvJ9AASzlq
	 p9yYzMeoY1qcLDb1XYVx/e6uGtBzTIgspeOwZbqA8WG8U6F9OCdKNdYqk/znChqDtvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUayY9KT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D7606D813;
	Mon,  9 Nov 2026 12:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUayY9KT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794227542;
	b=ia8gJuRUEiuMW3XLTxT97mi5ZnXTz8uIYkl+8cP4sbeUmaMQPUAnOOHJ4Ng0ZlJv01pj
	 wUQlIwoPF6Kblq5w57tjAwIdQlwW3l+LKadtJ4R87BDlLCk9wlciEfOscLqTcYR43ISvI
	 cO/fsRISn8BuNZOIaBAMGo+6vgrf3+z77Nhgtl3DN0m76LKhfu1vZircPn1zQ9q69JWnM
	 zzVgSeumoswlKJmmleURSZDUIcXJ+YlHRLSQaHiF9hJ0dPOA/tnU7jOKkW4/jiu6IGUvj
	 cg0Sku5aZ6N7QIgTWtXOqRE1oMLlBK0BdEUwoPjmBe47Y+UiTMT7Eiwwrj3tHkxYcUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227542;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oNBOr9Fl9UP7SFyfuHX8El2KnK1VN4sDlWPHvFmEe+A=;
	b=n1t/Hbfc8suTDhZZiEiXjazy5mvE5S41BXOFJTbRbTdcT1sxlzGahNoxkF9zILlE/f9K
	 bhAQulT17kkBXXkswfwgJgbILXvl9qc5mBgAMByVVZTEYsdnYBZmgub64xIDd8WKsjcHa
	 JIV9mEt5L/+Ey7n84ZhtQEmJ/B/yZKdII9qGp6KtqAv+4aYTs2j3NV+m3uZj6l7ogRDiF
	 70o1fgeWJb25Tt84rbsy8jS+V+3VC32ysX9xK0QCj7RtgvlxJw1I2K9mD0tUDKvdHf8wu
	 vIwqMKowYvWUfSRU70HW+bxpTI4CWco+BT1bZTcw0lWep8gCshEvChEL6YayeJCBOew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C03631F008BD;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227542;
	bh=oNBOr9Fl9UP7SFyfuHX8El2KnK1VN4sDlWPHvFmEe+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gUayY9KTU6VMHvW/s3F1McmcfA1JrWSKXaq0JblTTCDJkg6zoL+f/lSmWN1pCOj2t
	 dM5r/kVlj3u9+/h3ZD4teojOXayrt0Voc+Lr1zBnzQwlwDyQxRuPf8VORVJvYzn/ve
	 +jyTZ0jbd/SsZvbs8knz/tTmbOHILr5eBcUiapPKkNRrdN/l2ZEzec9IQtfiyi4ENo
	 QSgtEECODdcmhbTnlnnTfLHRyRiWXNQEHVTA5wJkr1ZhqtKEfzSPmI4Q74ywzRryE7
	 yn0AdwM5f4FE1YpBEs1a9M20MqipMIF7+KuMFuDm1ylRP077N2C7MK1Nkbmr2lZ7J1
	 yYK4Pfy1zbQtg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5098B48496;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 09 Nov 2026 13:32:19 +0100
Subject: [PATCH v6 4/6] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPi R5S
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
Message-Id: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-4-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=9Qdpul39fnmAarjmMc25c0t/ABrJ0d7zNPsppxOnomA=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq8b1S7P1PUZdxHS2z05B6fB1U5Ut+tiA2yKi97
 SsemaqOQCSJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCavG9UgAKCRA7Xj/jnsft
 6XRPB/973BDOvDuQjjo4E+7kB3Rtk8TZCHbP9KLq0ooMDtoPhj/HuVOL/3B8/c3V8iBSZLnzjyh
 WBokNxOVmJt2WdYrPcDt/yCkULPlBTBffjHCdylVZodF4z1QhyciKsUqFkUdGLm5HkVaP0VI2p8
 tn93L7W4jrMGlZD09xTd0+OVFQBV9hwZh4g4X7KhZoVdyIAThNR5LN2QnmRZdDCI8q28J0oAqBs
 /Je2wNpo2zvlvSqY1m5dZC+v6YnkIkerhtLIP8lmQlnxDUpxDIWM7fgLzR8ESOV0e748igqhNId
 ds9tATm4dG2oA1vYugT69W5uUo9getW6K9ilsfqLZEGc1SQS
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net
Content-Transfer-Encoding: 7bit

From: Ricardo Pardini <ricardo@pardini.net>

The FriendlyElec NanoPi R5S carries two on-board Realtek RTL8125
NICs behind pcie2x1 and pcie3x1.

Describe the PCI function nodes and attach ethernet1/ethernet2
aliases, so that U-Boot's fdt_fixup_ethernet() can fill in their MAC
addresses from its eth1addr/eth2addr environment.

ethernet0 stays mapped to the on-SoC gmac0.

Note that mainline U-Boot's rockchip_setup_macaddr() derives only
ethaddr and eth1addr from the CPU ID, so ethernet2 only gets a stable
MAC if eth2addr is set in the U-Boot environment.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 90ce6f0e1dcf..e588ee7fadc5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -15,6 +15,8 @@ / {
 
 	aliases {
 		ethernet0 = &gmac0;
+		ethernet1 = &rtl_eth1;
+		ethernet2 = &rtl_eth2;
 	};
 
 	gpio-keys {
@@ -107,6 +109,20 @@ &pcie2x1 {
 	num-lanes = <1>;
 	reset-gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x000000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x01 0x0f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x010000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {
@@ -119,6 +135,20 @@ &pcie3x1 {
 	reset-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x100000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x11 0x1f>;
+
+		rtl_eth2: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x110000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie3x2 {

-- 
2.47.3


