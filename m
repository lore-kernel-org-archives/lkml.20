Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284074A99B2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475289; cv=none; b=e+QPZcGgtARaZLbkiSK3pMgLaTX9SurFXKlplPWlFS8yPZKWy7nyj3+WJOubs0WGdcw0VlugP+ewYLV4eNGJ0TGh7z73SeyLa/WQbWW3w6emYwy5XI+SoLKupg8yYZEiuJZ02zD/Uh+BZ6gYPa7rO2aOuN+TkeW+dxBHKXlTGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475289; c=relaxed/simple;
	bh=ts6YghVyA/zyzel5doEzGL1L/0VfbhJhUqB26M/V22k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPCZFA+PkKDuoDotNpcggjcoPEAf93vXC6dk9aH8c9Of8z1IVNEKmJdRfZofXn0MQg1G6GnHRFZ8A1Ndv2kCg3bfpEB1FNiZBrPf5tcfF8b+SuFt+0oK3AJFqLZtapFK/YfJcA4P4pX6ReT9m7X2Qgs0jxtovp8Uuy5SSqdzblQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geaQb5T6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geaQb5T6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so2317155e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475285; x=1790080085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGVlAiXSUMIP2F6e2acD3g4t6CrjKoFWSLsHsqDHE4o=;
        b=geaQb5T6dK1pxNal0kk5kbZPfJq6M9TPkFg24RvWdLVxJ/zDsO87/G5wga1nAZsn2o
         vOC3YoQEN1kKB742rnFBCIrsN0Iy2dO7gnFz4wbAha0U1MfjN7WYzNhCc4U9JWb4G/lH
         pkN+TJ4+OIcaOpLMj7sTCVFjIgw6HxqGdpbDTfIYDLQ2/9I982jpZVNlFjsPlGpQ1soy
         9s7sdUbzosILfFEUGSy0rvFhcBwx3nwUrk/ewmkrE67UU4s1Z2+ycnPBwtNHgaSRjCta
         tJjKspS1CPRWWRkwJLc+kaWyDEPIng19qhTsnSy2bpIMHLefIliNA+FquJI9Ub8qFBqk
         voTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475285; x=1790080085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGVlAiXSUMIP2F6e2acD3g4t6CrjKoFWSLsHsqDHE4o=;
        b=miaBaLtWEdmmw9+qKVv6RGzLchYODRQTVhfqBbdIrsUzU7HgY61ybWZLBLR+G3bEYd
         wpA5VaJuO3aj/2r0hNfW3lJ/WhghFPywzLiRUmyhBUIjO9ucFeQHT4+lpHn0qHmT3L+w
         B9p5go0PiN1F3DuWjf6lwqHlBScIBme8XMDbqD1gTNMvwAVTagFLOCFHqt6MpgSU7U8j
         mwn2JUAit864rRFMvtU+LtkJm2GYA0HGcP2f3UVKUTEZXvIRP2DKHGQ41lM5nPgmRK1D
         +cqmvLqYyjEi6AF6l9OyaYgQZYB+/bHbSNWsrF+73Tzp3fs5c4NyZluWBt2bIar3YdS6
         aFZg==
X-Forwarded-Encrypted: i=1; AKwUvBxigAk0+aXmW8Sz/hvVAdkfBdkO+eL6qfhG2ru6Tff/aZRaXK+u881QwSVUTmoVi9dP/HfjrubmALGSXME=@vger.kernel.org
X-Gm-Message-State: AFuF++lgTXUEoKFY17H2AxrBYdU4cLDF6JqAZbUJFjZJbE1p4mOTFy1b
	CX5qY8dVWo2Ui13ZPBpY1U5iycRE/KtTcK9Wcd2+eoPlHpdoNj13WIWR
X-Gm-Gg: AYBFou11d+u54GTHqODWbxgY6YjcxZb8Vgsjh47ExjHNbLwm7s7KDH8AYj8yVive637
	OrRSvvV33rSBfjayfQV3hNT/YoC+Y1sOAGoqtodwhj7djGP+iJmbWRES94U6ZlT/iLTEJXgzqSu
	MGR+gon2yfTYUtShH/QSJXvGga3wOwo68b8SlpDdx5qXuMD7ZKNACw7h3lzbO92yfy5odTV47n/
	KTirIIuU0E34p2qJtS0ZW3Em5eyvJ1DYk9ZZqY54r1tWJ7IK6xlGWGLcJl3wHoVVLWrMot9QIR6
	Pbnjeu0uLjtmvNFbklm0v+JY1I1RRU2CsKTiobkskBGb63h79PuksmovsWtePMuJQV3yKbiusLF
	uGfhPg4++vgBUmSCIqKatGNmJ02jUT8K5MZWnDt6yPO8qZ4BbTUU8uvIgF8V4FLg2UmtxKq2UfP
	KH510grPuwpdOM2Hq3zSXvTX0GCU/+NVdrMddi79aVo9R0LU4d31hVxWAyq2pC32xO2Wq7KQrAK
	FCerc6lfH+08lM1LF+9Nc4IuSjZigKjeROMsvKSE7pCoiwigXLH2SnBq1rtW37M05E=
X-Received: by 2002:a05:600c:4f87:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49e7a66ac24mr76568825e9.20.1789475284877;
        Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:04 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 14:27:58 +0200
Subject: [PATCH 3/3] arm64: dts: rockchip: add vicap node to rk3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
In-Reply-To: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=3278;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=ts6YghVyA/zyzel5doEzGL1L/0VfbhJhUqB26M/V22k=;
 b=0fgklDILhS6+qpSp5w+qn6nL6tcjMbDA8a1JI/kKqs5AIOzSjV0gLt0i/KY3bs2HtZsfvqwtT
 u37tMDJ/EqVClUfq89iDRaOQ1FHFpJdy2qmzB5sbxVb9dE217e1xVcs
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the device tree node for the Video Capture (VICAP) unit of the
RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index cbf8b70cc15a..0c46accf5657 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1323,6 +1323,81 @@ vdec_mmu: iommu@27b00800 {
 			rockchip,disable-mmu-reset;
 			#iommu-cells = <0>;
 		};
+		vicap: video-capture@27c10000 {
+			compatible = "rockchip,rk3576-vicap";
+			reg = <0x0 0x27c10000 0x0 0x800>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+				 <&cru DCLK_VICAP>,
+				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
+				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
+				 <&cru CLK_VICAP_I4CLK>;
+			clock-names = "aclk", "hclk", "dclk",
+				      "iclk", "iclk1", "iclk2", "iclk3", "iclk4";
+			iommus = <&vicap_mmu>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+				 <&cru SRST_D_VICAP>,
+				 <&cru SRST_VICAP_I0CLK>, <&cru SRST_VICAP_I1CLK>,
+				 <&cru SRST_VICAP_I2CLK>, <&cru SRST_VICAP_I3CLK>,
+				 <&cru SRST_VICAP_I4CLK>;
+			reset-names = "arst", "hrst", "drst",
+				      "irst0", "irst1", "irst2", "irst3", "irst4";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vicap_dvp: port@0 {
+					reg = <0x0>;
+				};
+
+				vicap_mipi0: port@1 {
+					reg = <0x1>;
+				};
+
+				vicap_mipi1: port@2 {
+					reg = <0x2>;
+
+					vicap_mipi1_input: endpoint {
+						remote-endpoint = <&csi1_output>;
+					};
+				};
+
+				vicap_mipi2: port@3 {
+					reg = <0x3>;
+				};
+
+				vicap_mipi3: port@4 {
+					reg = <0x4>;
+
+					vicap_mipi3_input: endpoint {
+						remote-endpoint = <&csi3_output>;
+					};
+				};
+
+				vicap_mipi4: port@5 {
+					reg = <0x5>;
+				};
+
+				vicap_toisp0: port@10 {
+					reg = <0x10>;
+				};
+			};
+		};
+
+		vicap_mmu: iommu@27c10800 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27c10800 0x0 0x100>;
+			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VI>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+			status = "disabled";
+		};
 
 		csi1: csi@27c90000 {
 			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
@@ -1346,6 +1421,10 @@ csi1_in: port@0 {
 
 				csi1_out: port@1 {
 					reg = <1>;
+
+					csi1_output: endpoint {
+						remote-endpoint = <&vicap_mipi1_input>;
+					};
 				};
 			};
 		};
@@ -1372,6 +1451,10 @@ csi3_in: port@0 {
 
 				csi3_out: port@1 {
 					reg = <1>;
+
+					csi3_output: endpoint {
+						remote-endpoint = <&vicap_mipi3_input>;
+					};
 				};
 			};
 		};

-- 
2.43.0

