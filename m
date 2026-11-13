Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581749;
	b=5faK4YEIZjTrnferNLPVyYUCNCf/wC9dDgWsU5A59AcMxjxqV6hMqXBLqkH+UBrv23Sr
	 XOrgJ2LNhpYGcw8mS9NQGGr/Nw1R9kMUQWnN9+gNzmK5IZ/5C9c0eYs7dmcGErmkgmTCG
	 SXpKTNEcTB1y2GX//pN+GFEAxN1axXZ/UagiIH2VTavfQ4/Aa4s8+XxDdata1OLiAkyy7
	 K35rxS9Vb/e9cUrESZ2jFNu6Lr4IaecWVbyJ0F7M3hq5Pez/EPVRbcOri0I4fEOaqn7E/
	 sXg4lwHzD8r0VOL6rjW9WyPa7Ab33oeo3QqpRkVwQkVsU3G+WKXoTc7ZpKBhLcKjrdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=9SHVJ3ztCnSJ27zC/+zhu0OPeKjyVFzIDEXKL3ZFpaM=;
	b=Fy+0sjc1XvnFat4gbo7nju+TXAHSzWK8droIih4z5AGbefLTxIX9gGihD35MTAsjDOPG
	 aS/THFcqhHtiGwlHWxSyYXOm/8ZvaSuYnPZao5YvsLK4hzRVzqKVjxOwdQnHIC+QytRsp
	 UGfoFb4AKQ8E8UnDnNkuaib4XX7VHqQLi8G25PsUwb577bLL6gs7q17Z+zhHmy0fevcLr
	 DKi3z710H/CfK8Nbf/PcW/T2m0XsNPR92RXNnUMTDB/kfC09T3+tL/nW6xHUqYpRnWTgC
	 4whB/kvagx4w7BYYG9DH+s1NF8N0fE8cnZi+wuRzRXJ4T7udaEfafbW9mPQmrZcFjmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=RR6557OX;
	arc=none smtp.remote-ip=83.166.143.171
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FB4606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FB4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=RR6557OX
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jR0gK0t2CzHPN;
	Fri, 13 Nov 2026 15:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1794581740;
	bh=9SHVJ3ztCnSJ27zC/+zhu0OPeKjyVFzIDEXKL3ZFpaM=;
	h=From:Date:Subject:To:Cc:From;
	b=RR6557OX7nqTqnRLnpCH/gRxUYBPmETC/asPEUMkD7oDnhbpzqMxEMp3CinARlePr
	 WSrNRWdDCc0dW23DOC1GPxutrNZVYBDwFGe+UETNdKfwXnjpdp/kL4ra+fjDrsZy5J
	 r+LJvnGE7EJiiPPh+L5365SCQfahJjAfVai3T06f8pNW0pZ4qPEZJ881dPiU8akezD
	 +wsFj8GCUYi3kS4O3t+xg8rN/qQQ8T9BT6bRbVgXGudSajukI1mRc/MRJzT2e8EE+Q
	 +sNSsrx5trlCoXL606uzwnFh4E8PfyqFeq30Q4i7FMUnKuFyAoepm9s3DVTCHfzZvO
	 H0xZ04yOeMxbg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jR0gH4tFTzqcg;
	Fri, 13 Nov 2026 15:55:39 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 13 Nov 2026 15:55:28 +0100
Subject: [PATCH v2] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on RK3399 Puma
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
Message-Id: <20261113-rk3399-puma-haikou-video-demo-cam-v2-1-e71acf307f92@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOQQ6CMBBFr9LM2jGUKlJW3sOwKO0oI4GSFhoJ4
 e4GPIHLn7z891aIFJgiVGKFQIkj+wEqkZ8E2NYML0J2UAnIs7yQMlMYOqW0xnHuDbaGOz9jYkc
 eHfUerenRlUVDhdJGS4KTgDHQkz+H41H/dpybN9lpP96JluPkw3JEJLlz//iSRInaXLTTt1Lp5
 nq3LYWwnB1BvW3bF0/XkrbkAAAA
X-Change-ID: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou Video Demo adapter has a proprietary connector for a camera
module which has an OV5675 camera sensor and a companion DW9714 focus
lens driver.

This adds support for the camera module on RK3399 Puma module fitted on
a Haikou devkit with the Haikou Video Demo adapter.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Camera only works once the ov5675 driver is adapted[1] to work with
24MHz MCLK. With the similar work done for RK3588 Tiger[2], we now have
all our modules supporting the same set of features when used in
conjunction with Haikou Video Demo.

Same request as made in [2], please only merge this once the OV5675
series[1] is merged.

[1] https://lore.kernel.org/linux-media/20261026101646.2450051-1-heiko@sntech.de/
[2] https://lore.kernel.org/linux-rockchip/20261026102027.2451025-1-heiko@sntech.de/
---
Changes in v2:
- added missing #address-cells and #size-cells to &isp1/ports,
- Link to v1: https://patch.msgid.link/20261103-rk3399-puma-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de
---
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
index 141a921a06e47..013920d9a3392 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
@@ -16,6 +16,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -100,6 +101,12 @@ &i2c1 {
 	/* OV5675, GT911, DW9714 are limited to 400KHz */
 	clock-frequency = <400000>;
 
+	focus: focus@c {
+		compatible = "dongwoon,dw9714";
+		reg = <0xc>;
+		vcc-supply = <&cam_afvdd_2v8>;
+	};
+
 	touchscreen@14 {
 		compatible = "goodix,gt911";
 		reg = <0x14>;
@@ -122,6 +129,53 @@ pca9670: gpio@27 {
 		pinctrl-names = "default";
 		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;
 	};
+
+	camera@36 {
+		compatible = "ovti,ov5675";
+		reg = <0x36>;
+		assigned-clocks = <&cru SCLK_CIF_OUT>;
+		assigned-clock-rates = <24000000>;
+		clocks = <&cru SCLK_CIF_OUT>;
+		avdd-supply = <&cam_avdd_2v8>;
+		dvdd-supply = <&cam_dvdd_1v2>;
+		dovdd-supply = <&cam_dovdd_1v8>;
+		lens-focus = <&focus>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cif_clkouta>;
+		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
+		rotation = <180>;
+
+		port {
+			cam_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&mipi_in_cam>;
+			};
+		};
+	};
+};
+
+&isp1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			mipi_in_cam: endpoint@0 {
+				reg = <0>;
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <450000000>;
+				remote-endpoint = <&cam_output>;
+			};
+		};
+	};
+};
+
+&isp1_mmu {
+	status = "okay";
 };
 
 &mipi_dsi {
@@ -145,6 +199,10 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_dsi1 {
+	status = "okay";
+};
+
 &mipi_out {
 	mipi_out_panel: endpoint {
 		remote-endpoint = <&mipi_in_panel>;

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261103-rk3399-puma-haikou-video-demo-cam-d86be639a91e

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

