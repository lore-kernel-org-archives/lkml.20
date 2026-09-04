Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACC03D7D75
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508599; cv=none; b=lMvH1ECs5ZJcbCwSUFifmJlwEnmijWV4POwKdsh8p4nzpHZlUaMTDeIEhhSCSsokGkyXZQoLxn09iYCKVdwkoK3TKbh6BdRsSxMgxH0FvU814pI9vq+aPdpyOKVn1F0e/hy17W7EvDMmgphKiSXc6zVORNHFNDldrNIlL1eLlJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508599; c=relaxed/simple;
	bh=zQ8cn2/0tyjAicXEdtJIFavfOEkBK8rsVVbLFP9RnSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEDedB5JM6wfPX160P5IJ0zmAGMjryL1QB6+oSgZYI+eceo8qikvJWNEZZjBxJMhMxbhzbVQ3oqmZWslcnXRF4BQ8zenzpBm5wCMHjEsXP41fomiSSsttKXrEfVtLwdyM/zr3Q0rDcXzB4+a69SjNsMJGPRkVLfa6P+JNg42Uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHVBu64I; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHVBu64I"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so57977a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788508598; x=1789113398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLyFekJ0N8Lq/xlKUVCeo3LPrbIlgpH48f7aKuVq5pE=;
        b=bHVBu64I5JWrHTYDHHDRXkonfnKSA9Z44SDQFQKH7QAC+hG9Nod4Am2URddmv/5O+0
         7DbUGIS/QmQRLQzcRbejWNaWoj12lpNlboL8kjq08Q+kg5ZEKyqBx/+dT0WRKkRT5/RZ
         iiPXXj9d5JQlNz1pMZjm25AQQ0S8oGpzwZlEuBB6p2O64574sRFaknGk6lr++YWg+DYT
         wcc5Wl53yLPzP8cdToq7eR2yjQiGON4YFpXwyN1wsJ//5OuiZJEGX9NaC1LbrX28qquw
         v5OBm3DTO/iJTAM8lNB9PXebl2QeL0mCHgN+124PxdgXKDSY/wj/UTsCiNf5lDihfq/a
         ZTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508598; x=1789113398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLyFekJ0N8Lq/xlKUVCeo3LPrbIlgpH48f7aKuVq5pE=;
        b=k/F1h3MuohW5fi1UDEYQ6O5ee1V1S69BKCdpY/Kv00DrAhiobeKepQaXTLJC60gSea
         ddxKiBnD2jvAzJVDlAE+KdaSj3Y51rr72+OJe74GYkYY+8vDPapmIygI6q3AxmJYNRoR
         O5MU+OHITG/gQN4SdCON8carFcq4gTyGz7ycYLj7LDzRWmhMy/9Fw3uGCHvbYiLZxh8t
         FJTd8y5XoViS5AsuTFiTK8QcJpk6rpwxwe3DEMtBCmGPXFbW1ljV2Vg8zP/akxjVRWgb
         8T1a4MQybX/ClBm1RUSutjmT2rk3w1P3ceQkKaQVzlaOmSDPmgjh3NI/I6rErwRFvDWs
         HT9A==
X-Forwarded-Encrypted: i=1; AKwUvBxcSVfDsebIOiwh4x3jnCBqcFJFnbG/1UTtXWUn41Snzo3nFueszxzX05pHuXLpRH8suv9wCK219lgb/y0=@vger.kernel.org
X-Gm-Message-State: AFuF++le/cy1fZmzxzYlfLF7kl4mv13ib/c3fIXuplAn//tAY+HUCFMi
	tECbPg829+v0rlFNxJxNis3Oi/iP5M5btp6V4mGcyBaZAsJqF4FRiLZY
X-Gm-Gg: AYBFou3v929Aws8TgPJciNzhCLyyNZc6ibGyak8YOI5FhxekMxnaiHX/cE3CLTuPToN
	aPUUvSWJ9c37cZpRSACIvZIabfltGDPaxhK/jVo+8ktiI2ZZFanEaydFFiYgi9GurVOWb7/IE/x
	39pAoK18RTwZLHGDf+Vbnf4HgUmZLHCQtfkTk6pNNO0pnpUkUczzLUfeQLFbUz7Awbwc6vkezuz
	D7mJs30VBrJJ5YH6r7pkSFNitPQPHJq5aLPpCRM6jfHtarBJKc7t7gxNlPUtKk15sXVGVx+WIxd
	FTan/MC5XN8Knihe4yP0aVWLcV0w0WL5EtH6rNiWM3Y37p2leQjhvBtzqyIagorHeeNDZvcMpKd
	ZvBJKL1B9gMJmaniHgI6QNI2QpkjHFW1ILMzAvFaqiqXYuVC7zjNvsw3Eo7xUq0R/Lr+CWwvu7q
	dHjwv5FZ2CzPhwy9Ynr83yXEz1CLUs5lzfPelVQob8CPCXvi4anCmCCXH8dW/1b85DmCiAkYAMz
	GtanhymXYypDw==
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id 98e67ed59e1d1-39b268ce386mr3923722a91.3.1788508597140;
        Fri, 04 Sep 2026 00:56:37 -0700 (PDT)
Received: from jason.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm9356695a91.8.2026.09.04.00.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:56:36 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jason Yang <jason98166@gmail.com>
Subject: [RFC PATCH] arm64: dts: rockchip: add mipi csi-2 receiver nodes for the dcphys on rk3588
Date: Fri,  4 Sep 2026 15:55:34 +0800
Message-ID: <20260904075534.574037-1-jason98166@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8e10a8c0-3648-47b5-9131-a1abdd7eb8c5@kernel.org>
References: <8e10a8c0-3648-47b5-9131-a1abdd7eb8c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is test patch, contains the following 3 changes:
  - raise #phy-cells to 2
  - add PHY_TYPE_DSI to the dsi nodes
  - add mipi csi0 and csi1

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
Hi Michael, Krzysztof,

Here is the test patch for
https://lore.kernel.org/r/20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com

I have tested imx219/ov5640 stream with csi0 and meanwhile stream on
rpi panel with dsi0, both using mipidcphy0.

Related commits:
  2e177b85541d ("arm64: dts: rockchip: add mipi dcphy nodes to rk3588")
  0d0947766d87 ("arm64: dts: rockchip: add dsi controller nodes on rk3588")
  5052c99cf052 ("arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588")

Best regards,
Jason

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 76 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..dd2bbc02f8d8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_TYPE_CSI>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;
@@ -1788,7 +1856,7 @@ dsi0: dsi@fde20000 {
 		resets = <&cru SRST_P_DSIHOST0>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -1816,7 +1884,7 @@ dsi1: dsi@fde30000 {
 		resets = <&cru SRST_P_DSIHOST1>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy1 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_TYPE_DSI>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -3429,7 +3497,7 @@ mipidcphy0: phy@feda0000 {
 			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY0>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
@@ -3445,7 +3513,7 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
-- 
2.43.0

