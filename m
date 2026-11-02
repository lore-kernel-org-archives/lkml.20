Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599318;
	b=kg3AamZvZx+CBergWLJCsHGMBp2eVtqcr2Ib8qHecrPTNAjSIBgREEU8UXhRW7iwDDPy
	 CSCOFpgTq7CsI99yM5hohZCLahksUuw3KH/3eOe8HrOOAQQcBv08FxQYP6YACL7mLwu8/
	 A7lcOoE1bN5Pb94c11ZZcqOrbc2Mzh6xzbGxQWHA1GCZEoV5VuSma0lgEjqyc8BYHPwcg
	 cm1l4s8TAl5i4WnD/yZ1ayUliEg4YGyHkUz29DLSI5pRDFqpsj1pTKnTWxPjyueYPsXiE
	 VewL1iJv5Msy0TnEBMzJYMF34oAjZHMxHtSw8OBclHlsR9wLaVMR209P/PCzAx0Q1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599318;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Content-Transfer-Encoding:
	 Date:References:X-Lms-Return-Path:To:Received:Mime-Version:From:
	 Subject:X-Mailer:X-Original-From:In-Reply-To:Content-Type:Cc;
	bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
	b=bi2idJdglnVfW4UDpTAnnHNFsrqPoEpSeDVp09vbl6o8l8fyc5wqCJSixW78nLDqN1A/
	 RgtZbCd6UfujdsQZDUnExwtq2LTlPHl8E6nV46daGHdQnwan/OH/rgQLfUHIU1AkHMSc8
	 4sZwC5+oFFxa0NP1uiqCZFZIW3Nq6kxefHlzAxXHpPKuBDq5B4I/0ZmIu1zLAlXRqC8sV
	 X073GblLEn8ZHxL2B24n4treFb8qFR9hvPR9vozzNb3jkE31ngZv68V+W3rcp7Zif6PRf
	 8HipbO4FRLPRPWZNOWy42SDRx0MAE6aZomCWIT4XgBJLD+qlz/s6euOGOQi4X0lvDtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=s5kSpnna;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D97606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D97606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=s5kSpnna
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599314;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
 b=s5kSpnnaybmpc72FeGZtv1zKgHkm+M2ulWXyT07VaBKJx/G0r0LkYU4xT4LdtfIDwKp7z6
 FkWNxCgLx0lFQK8Awac4XXYgutsAZYDdjoHUgXpKR3F5jbiSTYlV6PNNOxgo4WnVtW1CNU
 KG5mvLa7mbalzBokyppKbvbHiQW4Zk3FH61P36kPO9U2QtG/NS3GZayBVbuFPvTjMV3pUv
 AUfo8mDd6ySFyd6zuA2Zx6YHcDRVRsUrs6umIN7yRbF9okdO95wiD4ZGLJSF6tnP+2UFSN
 j8qhO4jseKNXnjFioIBlZj0XAOa5tSyO5rYSEJK4avTWjN5TX8xmFSmGQQ1Lxg==
Message-Id: <20261102060136.100662-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Date: Mon,  2 Nov 2026 14:01:36 +0800
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ae82746+ab27af+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:01:41 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>

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
index 804abc85602a..84f66dd8f962 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -179,8 +179,58 @@ dldo7: dldo7 {
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
