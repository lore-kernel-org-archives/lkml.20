Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195218;
	b=qQA1P0pG6xPcndSNCEkNv2P9P07GYnv1O7KlDVzseuZi9dHOO5E/uFQTUSw0j9JvMJCD
	 EEFA5Lt7uEyL4EBapItgRPUnxOZZe+3SFiudIyNBr6V8HyHiEkPtqh60FeoEJO2WALvci
	 LDMOeZiLhUe4atUT1R9duaw9mVgeT8GsTLdrRxcfltgrKqRvSOvWeWgoQ+VIP6aQHn+54
	 mOVY+D2nqsNwkHlqLHxyT1yDHZ/JlUAee/I020LYrW38QpeOKaG8h5OUKeomm1uPOOyGf
	 uZFCcmIRGKGbAiDPTJgKWsOm8iODem0n+0/K9h4Squ+n7htglnaSfPHLhJAT3u9F3Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195218;
	h=DMARC-Filter:DKIM-Signature:Date:Content-Type:Message-Id:
	 Mime-Version:Received:Content-Transfer-Encoding:Cc:From:Subject:
	 X-Mailer:X-Lms-Return-Path:To:In-Reply-To:X-Original-From:References;
	bh=VBxjSeMIQblJqurQ7NVd7kOa1gruW2oug+/iX2zAqdk=;
	b=vVMrd15WK3G7Nx7r3zcM0VlCWPohR7CIeEUTXT/53aIzOlm7f63gmWrC37xsnNVUbhkU
	 ZkSayBIvkRu1emuJKm5bg4sH5qg9tI3Zdo1YUykYJkEEhzSPuDIl9ioPVP5Jk/44521+S
	 6dt9nRVu1EPfrfBQqsvI1JcPpFeUAu/3ZZGU6Zj5YvWetwmLo8MQoi1rSRs4Y4MMA+a7P
	 sW5R9d35Yru8AsqKLaekfIv59WZ1K7QEKwKr/1O4L4j8gTmV1Pn5Bk/Yd+qeMnWIJVNI5
	 mGyKl1/gkYYd+RhPv50nLdyWG4MdcQM7N/co8h9byH2sESESHZlrwvN3zwWRqb0sYDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=HnRVv5EA;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090AB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=HnRVv5EA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195215;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VBxjSeMIQblJqurQ7NVd7kOa1gruW2oug+/iX2zAqdk=;
 b=HnRVv5EAfHTtUtUWqqniKmE6iCWXjTtEMYtt00z+c+gaHSBex+wBK6dbHf7L58Ui9QoEbq
 gU8lGq8iCt4rqQTXUAtl7+Imei+euBCjI8dWW/BqVYXjcOip9CS18xgKa1sLfH+RtIvL6S
 ZYIideJAU9dIMKcXSlBh92cOx28BDKm2fItbbVF+1J6FXWocpN8hQlrq/eEtTom+lmjnwc
 gyfk+WJFp56WLWC8RMm6V2tg+DGieDWpCMwgdvsJVn0se1JAuiu9OLeqQW9vAFP2okPxK+
 Q/qHfGlQGbRhFNlAtCqwqTXsb0OP/PV39Oq3HTWWGWFB/ZCYdWIPlkfTCjgI4g==
Date: Mon,  9 Nov 2026 11:33:10 +0800
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:33:22 +0800
Content-Transfer-Encoding: 7bit
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26af13f03+6d3b75+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
In-Reply-To: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>

Add USB device node (b, c, d) to DeepComputing FML13V05 board.
USB A works on otg mode, it isn't configured currently.
- 4 USB-C Ports
     - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
     - Port 3 & 4: USB 3.2 Gen 1

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index e061233c15a3..bcd533484a73 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -172,8 +172,58 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x17>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb5e3,608";
+		reg = <1>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	phys = <&usb3c_u2phy>, <&combophy 3 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
-- 
2.43.0
