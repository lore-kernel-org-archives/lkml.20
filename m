Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894365;
	b=VYSk4KIt16kWkPmjP+iSmP5+ReXT9OCitpLXCy38Skdte86vzqigi66lGZ0ogYhtsRsM
	 6aFh3Igb5C/uFW9umEAoWKER17xttfPAqZXmqdG4WCnIjnEr+0lDNuAojpDvShvP24VXN
	 RCxTXFdMpWRATU1Lzkk56/Z5j0sg3aOKQ0KRJBFnMOU2r41IAgAoZbWZw8K6AP0P2sSUA
	 UWmi433Wv4apIQI2wgBs5AJ6fvfQVIrB4COA3O661GeRrWbTInyxYinVdxkY2zMVjnDHB
	 JnqtNKo1b+q29iwFgrGOVrLeE3auRdR0nEKtGa9Z5ogox1JnZiFbkWQGRWbBMkY5Wiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894365;
	h=DMARC-Filter:DKIM-Signature:To:From:Subject:Message-Id:
	 X-Lms-Return-Path:In-Reply-To:Date:Mime-Version:Cc:X-Mailer:
	 Content-Transfer-Encoding:Received:Content-Type:References:
	 X-Original-From;
	bh=hDxJlFjhA2xRUr2x1bmOReaNiq2zOT9aXD0eY3fwdsI=;
	b=PR+sNA0mydyZLZz157cXGMs2twXKOv+GSUcGLiiv8Xor2ENFQ0ZFANv1IAJ5CZFeETa0
	 DK8TQg6eMQB1ake6YSUNlZvgwlf5rOevHAQ7SEHcC2PiKUrH88aRqW4ews6rbcX0LOXlc
	 N1KHkX0dhiOynQi+XGQnYpfx8nKuqirL+186TesEdkE/S/88ukZmL/G4EB/Bsr1R8fYSV
	 fSXIOe3uQLW2yuzypggqpVYLFbLpKZbMVZNVqcK9dpZLauF4GkE7vEGyMf5K3uZppo7Pp
	 nZ4KkJurhunbRv+HLTTmIBLoX4qvR1Cf829ESP7111TClI5s+ljBDxU6bqsXlmtPndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=0l3gt0RT;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1129606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1129606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=0l3gt0RT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894360;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=hDxJlFjhA2xRUr2x1bmOReaNiq2zOT9aXD0eY3fwdsI=;
 b=0l3gt0RTg0KqTKecsXluooHrvyDXvMsfs1Z5fFcj7Ksq2qK8/g6PXrEaj9uRqatoEpML4K
 gcJ/2+d6cy2clxeLACIsk67aFYn6ExYwJKkat0q/UKp2tive2+6vkaku6/BgneF7bpTlZ6
 btwfHPWGKrc9p6lpu7cxDopEus3v0SGWQTf7TjdNvqcbYc2hlnybuvYf9lF6qxf9MJ8nBc
 vrNGXkgzZy+8UFzyh+ayw2rDjcrvXQsq2pu0AeYPneVTQX8SbS/blaEdaBzD0IltenTOB1
 1NKErhbgMLGVMfm3bThc9oVZhlEHZZHyeeN/ikzXDlzpXhdBKWR10MPVAi8bKw==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v5 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Message-Id: <20261117054551.1048819-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afbea16+27c7dc+vger.kernel.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
Date: Tue, 17 Nov 2026 13:45:50 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:45:57 +0800
Content-Type: text/plain; charset=UTF-8
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>

Add a USB 2.0 hub under the USB 2.0 controller node, to which devices such
as the USB Bluetooth, USB fingerprint and USB camera are attached.

Add USB 3.0 device node (b, c, d).
     - Port b: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port c: USB 3.2 Gen 1
     - Port d: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)

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
