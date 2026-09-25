Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98681455601
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338652; cv=none; b=jBB/22ncR2sHe52ad9uutuRGMbyUVwH45vFMegaRkdO0TPrg6wCknNNIyIVaLiVdjPZ7UlbEOvBs8EheRMA2LeV0x32wfCG3aJ6gtTZADH2kN1rswKmKISSwHarRsj8h4yBl4ptyAcCwT7PY9IU3r087U5z7shofTZfFrre0aCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338652; c=relaxed/simple;
	bh=xN7v3X7hesRZVMkOlUzapj4+LgE0eflnCea4UWZu/Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j6SQVUvmiFyMdoX7oWYRGXBxvOAr2r6wao2HJFt2BTjicl/Yim4+FJhnxU+9K2nCDcg1p/spytLKEa6uu6JxV+uaSAB2rhHgNy4L67z2QBEPcteMXY8NI4oc9nDZXkAg+UO+A9dE5MH1znnCbb3t4S+1k/uXGLJc5XdxX1ZVA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKqiIFvf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKqiIFvf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so5021055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790338649; x=1790943449; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnLLA/1flpR0LOs70Cy40hhdZUyQOq32+JwGKeb+HsY=;
        b=bKqiIFvfOIHbYlzq6LdxCLPnDMvC5foMgrjbMgHUZoXQu9q8VViG4GfTva3uqlRt0q
         S1OURe3yKUSXoor7y6UyCZP/4qKEK+6nD0p+YkCtmCa8In7m/YE3dCpNt1Wbph3W1qsV
         uuOEL2hSxYUFoiHLMf9EKDn25oh+eKVwDemGnzxzQvjnMbdLZvnPZsxvPc4i5ehd9gl+
         uANES0r2cBUouvLSKjJ7o6DO4tiohG8SFt5Z3L2/5Mf5VCNyjp1+i5NAEyJYV5XE/SdR
         GSOYyYL9c6ieFkreOgbfZxUV3notYjQbajgJhEdJq/XLnDmJ1cyUXcn1OFe+2I1WytZB
         88mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338649; x=1790943449;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pnLLA/1flpR0LOs70Cy40hhdZUyQOq32+JwGKeb+HsY=;
        b=I9vD5yWUTotEwAXGYHQ36eaAmBOzEZvbtFhfhMGV6uDbZy/6FvhHHkmTy/ajydJOQM
         BLt21vn9MnK57cfYn7ztQWNs07WgyNVCSbbKM7gpRvl1692z0Edbtpi3+nXr0sloqE8V
         KTjQ50OSqhcpLZ9rEy5kxQKyuhq3IngmE0Zb0v397JjlUpRLOBznJ39pPJ8Oln+kw7EE
         wU6C2IAtnJU9eBCRY4M0U2ORG7D7wE6EUujXOMBVwUprzERyvfdENgRgCX0TPAwrYhD4
         VQslQPEK1wyjddUO/F75Tix0UFskLUdBjKrvf5NPlvY4Hjnzh5ZlQ3n4ZYMhNLRC1AmU
         MQvg==
X-Forwarded-Encrypted: i=1; AKwUvBx7WejTGMUo9wy3NdCKuzHTOuS0AKR+tBgi1tjGNLmn6gduH3GiyHeTeswAVqlLKSfh9WmQPMilL7dMMZo=@vger.kernel.org
X-Gm-Message-State: AFuF++k/MCXMCIu3APDqw2m+SwcUSRXjAUko9Svhabyazmvpp8sl23nl
	kOH2RGTe43q5e1zzqQDqBgrOO7i0ZVYKPfilCVbCP9xPJi3TI/o4DzKv
X-Gm-Gg: AYBFou0enXiIz7RU1XXx8hsLnEY7HgcOUz4GZeXLsENTNPf4zXw2Yqx7hXlyCcNTStB
	0rIBr6sxAnA/tub+MeWeeaXVEwC5iyJDk+w2tLhKSkavQh/pBL8NzosAGQXWaqZamr1dn2P4/sr
	UnEFCTHNEeIE0DcsFdu5ZRZnTdxTO7pGVMoMj0GlBndYKnrB+t7XKSP+o+nq3AsJ9a2Pz2vQmT/
	OtxecRV62SJh2/RxIozG5roV+XkjD8G3itQHojs/zSiffreq2ZW3qLS1n4fRe2Y6TrgsnDeAvT2
	lt5WOWwUvF1DoKIuifHXsHS2e5QHY9dd2RvFRoJnFsieT+6lDY9S9/sfbphI894pV9LIxvqVjX4
	tycuhnFnuxHhJFuM4XsLmg2qJVebNAreefsrXNnK6wYuP7RiexyGXcSDliagWNSuS8VSaYbj5RK
	kbOUOBsV+njmZv/665or6S1cUxyLLySffLKqMALb2IR8zYa7GBjeAKaLGNaQgGr0eQE0SE38CGs
	2lY13e9R/nk+ZQ795jYw6ffuiIRIs2EAxPdJ7Q0pDCRNCx2EZRq3oK5
X-Received: by 2002:a05:600c:a4c:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49fe67060cemr95925545e9.31.1790338648585;
        Fri, 25 Sep 2026 05:17:28 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm218658205e9.14.2026.09.25.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:17:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Fri, 25 Sep 2026 14:16:34 +0200
Subject: [PATCH] arm64: dts: rockchip: add radxa camera 4k on rock 4d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
X-B4-Tracking: v=1; b=H4sIACJmtmoC/3WOwW7DIBBEf8Xi3JXMmgXsX6lyMLA01HLigGO1i
 vLvpUmt9tLjSPPmzU0UzomLGJqbyLylks6nGuRLI/xxPL0xpFCzwBZ12yNBPvtJBfDjrCbQ3BF
 Kr6UjEhVZMsf08Zh7PTxzubp39uv3xk8j8+VaPeuz9qsZmofEyh7y1JHREJbjJ2DXqmiVRUlu2
 FD8fbYj9ZcvCRCy3yCsBYyR6ILtVGD9L2RhS35cdptmI6XlsUW1M24sDP48z2kdGhcoKkuxixV
 HJGc1mY6J+jG2ziApjkpaJQ73+xet8b0GWAEAAA==
X-Change-ID: 20260925-rock4d-cam4k-6e3521c61b55
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790338647; l=6138;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=xN7v3X7hesRZVMkOlUzapj4+LgE0eflnCea4UWZu/Yw=;
 b=OZchep/qy+LSg8lzxIh8Oj+wqfBHRnzl1TZKe6K5u/RJr37st+QIladMmca8auY7IK+tvcofI
 kElz53+u8kLBlH+4eMmDLXVseU7JPr6FViJoY0U5hfCJ31WX/YilG5Q
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add a device tree overlay for the Radxa Camera 4K (featuring the Sony
IMX415 image sensor) to be applied on the Radxa ROCK 4D camera
connector. The camera connects to CSI HOST1 through the MIPI D-PHY0
in full mode.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso   | 105 +++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c118..82b2afd420d5 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -183,6 +183,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-cam4k.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
@@ -311,6 +312,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtb
 rk3576-evb1-v10-pcie1-dtbs := rk3576-evb1-v10.dtb \
 	rk3576-evb1-v10-pcie1.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-4k-cam.dtb
+rk3576-rock-4d-radxa-4k-cam-dtbs := rk3576-rock-4d.dtb \
+	rk3576-rock-4d-radxa-cam4k.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
 rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
 	rk3588-edgeble-neu6a-wifi.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
new file mode 100644
index 000000000000..613a3e351500
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 4K attached to the camera
+ * connector of the Radxa ROCK 4D.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/rockchip,rk3576-cru.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	savdd_cam: regulator-savdd-cam {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <2900000>;
+		regulator-max-microvolt = <2900000>;
+		regulator-name = "savdd_cam";
+		vin-supply = <&vcc_3v3_s0>;
+	};
+
+	sdvdd_cam: regulator-sdvdd-cam {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-name = "sdvdd_cam";
+		vin-supply = <&vcc_5v0_device>;
+	};
+
+	siovdd_cam: regulator-siovdd-cam {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "siovdd_cam";
+		vin-supply = <&vcc_3v3_s0>;
+	};
+};
+
+&i2c5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5m3_xfer>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx415: camera-sensor@1a {
+		compatible = "sony,imx415";
+		reg = <0x1a>;
+		assigned-clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
+		assigned-clock-rates = <37125000>;
+		avdd-supply = <&savdd_cam>;
+		clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
+		dvdd-supply = <&sdvdd_cam>;
+		orientation = <2>; /* External */
+		ovdd-supply = <&siovdd_cam>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rstn &cam_clk1m0_clk1>;
+		reset-gpios = <&gpio3 RK_PC7 GPIO_ACTIVE_LOW>;
+
+		port {
+			imx415_output: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <445500000>;
+				remote-endpoint = <&csi1_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam {
+		cam_rstn: cam-rstn-pinctrl {
+			rockchip,pins = <3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi1 {
+	status = "okay";
+};
+
+&csi1_in {
+	csi1_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <445500000>;
+		remote-endpoint = <&imx415_output>;
+	};
+};
+
+&csi_dphy0 {
+	status = "okay";
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};

---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260925-rock4d-cam4k-6e3521c61b55
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
prerequisite-change-id: 20260828-vicap-rk3576-6e7118ea0246:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
prerequisite-patch-id: d4120ad9def5effeda632f831b6fd0cd59295285
prerequisite-patch-id: e0c7e587fcaffe58b61fe78508efccec86dc7c79
prerequisite-patch-id: 6a87bd22798d58cc8f9b30733f5b28a2fced05c1
prerequisite-patch-id: a94c687ac3f648079b18dbb5109657fb038bd516
prerequisite-patch-id: 76e36df1aab8a9853440aa28b4bda528ce2adfd7

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

