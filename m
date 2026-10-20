Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484378;
	b=m7ewHBN52HerJe9/HDO2X5A66ez82uejthAoilU/pusTndENkUZQ+KpdMCyhRsp/Zi1s
	 RVzquWS/F5k8YxqJfLcNXKKRxiHARVjnxsJf4Itp0fVgRHdG8L0VeRaTYr0823EBYB0vb
	 aMB3itH1efpjBdMaMbp8BxEO9Jv6pzrMDtU4jQPJyPserQlniBRyc7AoFNwO/5pHB8zkF
	 QqAPHXUV7MsCMBblyc62u2SkwrfvY8UpvZsDT5850S5vSHtoGLy3jhHcpERsASaz4lfMt
	 3mAf5CgjYN/VBL/ajfP1FkHJat/RzIXSE2L5SWRcWS3R+Nfvre0BDJTR5Jfcx41y1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484378;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:
	 Content-Transfer-Encoding:References:Cc:X-Lms-Return-Path:Message-Id:
	 From:In-Reply-To:X-Original-From:To:X-Mailer:Received:Content-Type:
	 Subject;
	bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
	b=hPFJ0DJpvUsk31VyyFUOVdw+TOWLlJl4pPQOn1Cx3F0BWSFRcep/ex21S5THWjC5lQZF
	 TRvCceU7zCYMuGRgrVJ+Mlc58X/MwPA1J4Koq+0P1JCVaLfR+TrjBwRZDOixZRD6TsCA4
	 AT/AZsxUCOja1u7MIBOOkR7gMJwPV2ftyrNRjXroqK/6Zn0AJ7JY4TpXp23c5TKHLnhQ6
	 sW2kFz/rbIi67L9weaGgoyM+DTMV6K58cUSViwmpuWCsTyMdaCrzLWMiIbbLLWRONG6xd
	 5U+OMzNW9ehJMgGF3pmA4WcIY0gemze/a2gU4TFK4MPNQ/RdPj2EBClWEDeDGPj+MrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=DQgYM5wY;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE4606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFE4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=DQgYM5wY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484372;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
 b=DQgYM5wYRIkcmuEFSPNxr8YPFQ1VeTl5alcGcTIWWZCR6A1eYSfl4m0O/uKA6HE5SpETfi
 AuwJtBQIY6EgHjowr+Rrtm//aud37Aa1ovZcSc1f9PYgs5IhvgTYypL33P2q8hqGOXo5DZ
 nqdLFTolg19USOYa5LcrbQRY0Uki9wWw94qvYEd0cWNxJ9lq6Rlp1dmP+UfVvC8bzQVll3
 8va+m99R79pjyOKwxuoBoDsOKe62hOqtPxreXIS0PDZPUkpE85zLmPW8MPu4l6UAOTDnnQ
 TnwOYfCn7hzKGEIxet3Ubqu2p56hU2QQk+kJT/zIdUYC/SCnCb+Duvh/7Pxdvw==
Date: Tue, 20 Oct 2026 16:19:16 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26ad72412+7bc888+vger.kernel.org+sandie.cao@deepcomputing.io>
Message-Id: <20261020081916.3673743-1-sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:19:29 +0800
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v2 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support

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
