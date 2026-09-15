Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59FA4A1E1D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473410; cv=none; b=Zatd2m9iHmzqlrSuWYQr6D7UgQnVobi6GxpSdGTkgqyFOTqDdG9uYjHph8qS/6eosPenonmDhNpFQBjrnHul5hKCc8j8cQvaKHS+mUj6zY4VBN02LYTNmwPFk8rkeb0XqEBG1S2ScC/TwFZc24CDaPENprmSbFfOf6XVJrkISs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473410; c=relaxed/simple;
	bh=hz7ecKJMlWN4w7YByidxbnhsifV5HkA2kX05eT5H6SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGIc5jTnu24fsmjzagy4ID4d6q7QdNaxQZSg8UaxmLcDaW8I8gHP4GkB6eWcoFCTMS2k4wbKDGNFirbHWQNCCKW/SN/18Dmps+dN+L2YqDWUSozQTKAcDghkvvmvggCJtkWDufx1+BdW1H13Yg2XFNKGyBLs9iOfjHowffAlcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBh/S1C+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBh/S1C+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso36355535e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473407; x=1790078207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=;
        b=rBh/S1C+njeQtcATYq9sSnfPHPIutabhRLULOnt5CgmCDAkzOebXz3ANXkGCxUXDr9
         uLJo4rPM9Xi8H3eVqT8Yii2pANjBWFfX90uG7v4OqOYv95ECS1dfVg3DIbyXr9Ffuj4z
         4jeT41r84bEBP+EtxZZZv3OuJq5s3Ii4/Su7JISa1mwmw/RgiGaPB2zQL1778+I/n31V
         RDI+RTM66bT/5kGCcuE0zE/I2cAM1kU5uGo/ZQmxZ37zu86KzkWg8tBfTygDtGiLX79B
         nQEqWoeVbTRuzqhM6B28Mx6Eg/0KZ3ppvHNdagWNv9wjnMVvYSBqAYnml5z2sYIhAYJe
         DIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473407; x=1790078207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=;
        b=qimEGLaM0QUyHO0VjDrkDrQFqXOtz0+TppWn1dg+T6c2VgDT1tQYr7un25zefmcJ5D
         y0rmUxwqmnAetKeu/i41tp+rf385cF7A/pcQcUTY+967QQ0Rh37rQfEErNVOOfysui4i
         38TPF3Ki5CYuh6bwdUHrfqxbPRAlCNRo63AMaasPIHBmqfTdKfKkdLbk87nuzmA8xl4w
         mHgM9mALj0T9p2iVAHWuIfu52hliZ6d/f/XsuGpNWIZ5Cp/5KDapySYlTBaEeuD+uVMD
         2JzBLTP3qvX5y2KzNaUt7o3tMk6Sv+6xMjSH8b1d5YYH3n6MUNRJLQLztik86nbJVtEJ
         RtzQ==
X-Forwarded-Encrypted: i=1; AKwUvByI4aero6FHLZpLa7sRLWRh9BxrkxwICm+kSwy9HNu0O/qCUSHZCQ93l9bvySkkwiFLDsQ7PfQD6ic9E7w=@vger.kernel.org
X-Gm-Message-State: AFuF++lhUki3AjsDS3LsiTYxue+y3TXbHvAKyysV6JAcl4LgxIGrXoF7
	aNfTCHU0wpQ6UNk8FZxTr5e1TBqd9VWe8092djlvQsobbYoa6B3qVDsb
X-Gm-Gg: AYBFou1OL20I1wI4EptFXXniyTvd7jos1JcdtGnFBS80YeBjn/8DPG0tOcld9ecvCUu
	VsrZ2WHKV1Gu/JoDYF0IDDFZka1aGDut2zmf7nJ43WpIMLW8LTpQfluDT5SieH8sZkDaODsSR0X
	yPlP7rbgAw0U0ujQQRYBYikauEgvri3RxNgIiWFa8CFpe02q/92rKoUErLm5NNHV2zS7+MLIUqB
	wzacacEc0E0mxqum+26HfhRpdMpijLxko2il6DYlZX29f+lfLr/VzapGOU/YcUHsqEYGcDhaU6N
	8kbrlqX7vuL2eECCTI1QuU4XhPvHmctNdbWJtDLPIOkR00vHLUSE/ZHZ2ODXpkh05J6sWzdrI0d
	VVP0a522efi0GCoD78aYJ0LPTtlGn6MaEiiYCGZQLHCn5E3QMu2yZ+45nPvDKmKLHgnBxjH9t7Q
	BspV8gZFiEH2bC4ufYQ8B3RRMgrk01JZaw52laBfr1THyuudTizzQg4oUoDjuDrG6Sq2Hph3Ufz
	wwNa12MnfaeWqtXh8Ce08hMQfBwBoKq33W1WECh7sDfgAsrAsnJwPacSjy1IotSUd61
X-Received: by 2002:a05:600c:3487:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49e7a66af92mr186642285e9.9.1789473406677;
        Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:41 +0200
Subject: [PATCH v2 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 to rk3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-2-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=2691;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=hz7ecKJMlWN4w7YByidxbnhsifV5HkA2kX05eT5H6SA=;
 b=tj68X/IcmWZX/XZiXkGeeRk0CFzYyPr/Y7qcNgyol3bOUZ7O2Jnd8YAYI2xuhQ50+w+iMS1+r
 8idipYTKQdOAh89PeeC1du381r95I3oTVoV/s0oBkv93JJ63M6jymvM
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The Rockchip RK3576 features five MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0 (not supported)
 - MIPI1: connected to MIPI DPHY0
 - MIPI2: connected to MIPI DPHY0 lanes 2-3 in split mode (not supported)
 - MIPI3: connected to MIPI DPHY1
 - MIPI4: connected to MIPI DPHY1 lanes 2-3 in split mode (not supported)

The PHY to receiver routing is fixed. Only the full/split mode of each
DPHY is selectable, via SYS_GRF_SOC_CON5 bits 1 and 2, whose reset value
selects full mode, so no software configuration is required.

As the MIPI DCPHY as well as the split DPHY mode are not yet supported,
add only the device tree nodes for the MIPI1 and MIPI3 units.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b7a527614243..cbf8b70cc15a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1324,6 +1324,58 @@ vdec_mmu: iommu@27b00800 {
 			#iommu-cells = <0>;
 		};
 
+		csi1: csi@27c90000 {
+			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+			reg = <0x0 0x27c90000 0x0 0x10000>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "err1", "err2";
+			clocks = <&cru PCLK_CSI_HOST_1>;
+			phys = <&csi_dphy0>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_P_CSI_HOST_1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi1_in: port@0 {
+					reg = <0>;
+				};
+
+				csi1_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csi3: csi@27cb0000 {
+			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+			reg = <0x0 0x27cb0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "err1", "err2";
+			clocks = <&cru PCLK_CSI_HOST_3>;
+			phys = <&csi_dphy1>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_P_CSI_HOST_3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi3_in: port@0 {
+					reg = <0>;
+				};
+
+				csi3_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;

-- 
2.43.0

