Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5948097D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469016; cv=none; b=QCmtwEFOqPDsk4hE9SZ2RSJjw8Fi/y0b4Meg3FfLYLIt65GIV4/K/2XgeUbFtoGWr04ypARt8R2ncoB6w84u3vBIw2gw7Vf7fuKHCOhgTvoMgevM6f0E9LvGp2/V6bPfOLo+uy0PP2zbKIIs5WMFtDK78uxPhabQAgVVYV2N8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469016; c=relaxed/simple;
	bh=bGK8ht4ZsYBRwxHCHXvcjD3xAuJ63yHglUCiy5arzTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XS1pnEVaEeMrhSv/9NRgcXfSxUAIg6bg2/EnP0G1CWSoijcTyYQF+x4LjaftbskGM29vHus2SCnMphh4docnp/xwQRIy+aCh19ONji2vHcMb7p0ZGbhqKAyIcBxuqAPC1AkGJmzsRsbaYQ2yBgyckf3ok8lSDWDEZUEHjXztvOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH9PFfXu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH9PFfXu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so1460115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469013; x=1790073813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=JH9PFfXuZEhfRXGu60QS8Ohm0DpTJOuQ2WX1d6gw/wGcW4AAfISZfeIDPfdBlVn03F
         ljyiYM3hgicudV+qS2PvsGAGbFbA8geSGUPzWHX1vRvSyg8pIfVcya981Vbh/+gXinbS
         cOBjrITtzLHjIAcwwL/J1uF5S4NRZTOy3pab7uzZ7+h+bkBwSEcS7DAUN5pX6dlnEEuB
         V8uqqxtLgc5rOWfV78WoEViK4xhf5ZWJnCtN3YWtvQTCviMRCQNUj8vs8zi+cabXepT+
         PAaT/SwJt3EmhIqxzxnpMGoy0TU8roMHnTfxOb5YmzMNXPzaSFmVRqOC6nDbbrm7YHYW
         seaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469013; x=1790073813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czoOrQkTCM70VZKBNhJxXyCegI+z86opj24pXPk8LIQ=;
        b=ByHv5RYGdpS3b2BibGXEnscudY8eKwzkinzIPpCaNKgM+MMUTMsLMQSui2kUi9DudF
         jZqD5IddZeTLFIrqU2pT3FWLIOOlPco38knph3jGm408nG93Wf3NGenokmdQohyIDLoe
         ZTMcg+5R8wBZXsR/iTduNlYqmwxUAkuasxyWhBowT2il8aeySxJc8t76kEja+VclTNrr
         cHhthzwj9ISQJQmWCnjkJawb2/lJbtWRTEKWsr2Ti6nDLKxSWykSnEX7X8Gka2hSGVPA
         6KiKIDdT418Q/6MFzCwkkEuKu95zBZD25+BIdrWkA0kHUvAdCGY3OaH3gos2wprOa1EM
         EEhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxld9T6UeeEx0pISLeuMc0UgyXj0bEA+h7YG4UErIGE+sUT7oYi34SXG18Rv4aIZiD2pAYl/MNqHhX7UB0=@vger.kernel.org
X-Gm-Message-State: AFuF++k82yRVZimx+SyE0OS67FHB83izzWpke6m2wIUwHuydBYzpMZ8s
	AUZ+pEv2y/oK3GN0Pxt8Hj4n7F6zz9rsnQsF5Sx1RGQ6SzvRHyOpWSP/
X-Gm-Gg: AYBFou36cTTwiT+Q6gm0OFn50teJ9vrbmt+jq9NKNfDbhRALJiTHx+NVWusk+5MkU8X
	HV6Zuk+a5gMQnzar8StnPWYt44uBjoud6qBaGpunmlyKcYSdquN6pG1OB8njHmBpFRVfmSplIm8
	UV4HAZSWRbU8ImrMeE5NlhIINkw7GRfpAP2G5x0zTXcQCBQh6V/lLIyd/uurUHkXKEjpZeL8sxZ
	p/forLJNwEoJ0giPlA0NG5P4cvQf/x0t5Zs+NcjXTPS1dth7xq+KOLfr3w4QGdMvU05dfl9XT9M
	Fhv0+5xxPhOZQMiT5EeUb5opi5cy5d/b2FEOI1gxjWOgUlTROYmZthpYLNWtvmVFo/ei3hOnofy
	dPbiJ21XjdA4JBvmRVx3QvY8NQCgKjExSpNY1KBOETHDfd4UQO0WcZ7Me9i9WKVgSrbmOVFyo5C
	vT2i4g7+zypdp4MJoqKnDJr7NTvsfvowgqOCoXP02H3xBD267iEMNTQzR5uFt6gfGYbASIUpTrq
	DsDNcUqoteR1PLxHNnROP+At9puhpc0IJi8DT9klZrMAHA/EIWBchSHIdoAbPAALOM3O5gomyik
	LQ==
X-Received: by 2002:a05:600c:3548:b0:49e:6ac4:b76e with SMTP id 5b1f17b1804b1-49e822a6d43mr7233625e9.30.1789469012386;
        Tue, 15 Sep 2026 03:43:32 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:32 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 12:42:49 +0200
Subject: [PATCH v2 4/4] arm64: dts: rockchip: add csi dphy nodes to rk3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rk3576-dphy-v2-4-b56e68b54b8c@gmail.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
In-Reply-To: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=2044;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bGK8ht4ZsYBRwxHCHXvcjD3xAuJ63yHglUCiy5arzTU=;
 b=yeWXeDtjlbYXnbnHo+rBAMifURbyetkigWkciYlnmz2Njk1RBaH1wo4bBYUGlJC6lwRWoDU9b
 tW+D2K+PqmFCxhdXa68gYb5iLmkYhzprkayLva/21NsCifePTjlEZH3
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. Add the device
tree nodes for them.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..b7a527614243 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -973,11 +973,21 @@ sdgmac_grf: syscon@26038000 {
 			reg = <0x0 0x26038000 0x0 0x1000>;
 		};
 
+		csidphy0_grf: syscon@2603a000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2603a000 0x0 0x2000>;
+		};
+
 		ioc_grf: syscon@26040000 {
 			compatible = "rockchip,rk3576-ioc-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26040000 0x0 0xc000>;
 		};
 
+		csidphy1_grf: syscon@2604c000 {
+			compatible = "rockchip,rk3576-csidphy-grf", "syscon";
+			reg = <0x0 0x2604c000 0x0 0x2000>;
+		};
+
 		cru: clock-controller@27200000 {
 			compatible = "rockchip,rk3576-cru";
 			reg = <0x0 0x27200000 0x0 0x50000>;
@@ -2848,6 +2858,30 @@ hdptxphy: hdmiphy@2b000000 {
 			status = "disabled";
 		};
 
+		csi_dphy0: phy@2b030000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b030000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIPHY>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy0_grf>;
+			status = "disabled";
+		};
+
+		csi_dphy1: phy@2b070000 {
+			compatible = "rockchip,rk3576-csi-dphy";
+			reg = <0x0 0x2b070000 0x0 0x10000>;
+			clocks = <&cru PCLK_CSIDPHY1>;
+			clock-names = "pclk";
+			#phy-cells = <0>;
+			resets = <&cru SRST_P_CSIDPHY1>;
+			reset-names = "apb";
+			rockchip,grf = <&csidphy1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;

-- 
2.43.0

