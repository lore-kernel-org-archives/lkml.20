Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCD49AA5A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633380; cv=none; b=qw6CjKqVs+wic2PEpwMQRZQLr2ob8h/cenJjRvVzNGqSPU/AW+xMHxi6C+EHcF9awvitn5rcONH/Qu3sg+tVROThOqFlQ8OsIfYVYej1LvRBEbSmIs3FopD06JhVf6bdenlNlNIhhoN9wI9zyRBFdKiH5Y2BporWR8GYcDfPBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633380; c=relaxed/simple;
	bh=IJBQElIzm5Wt076Ytkpdk8RoCfkW2kryOy57Girj/r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=toerROwEW6RHjKlaXntU2e0222z3vkkZr+mR2JSbP5AHXnlIPON9x7ecfiyubdeNW99rcRSrVwb579w107gFUrftpzL8opIpAAIrGigoylTPhtofrD1yfY0o1vXCx5k8LAJGqu7GZjU9I+LkhqjAd49wnh8yMEHu1AdwKMVkTJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5f7Ht9w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5f7Ht9w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so6723555e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633377; x=1792238177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=;
        b=V5f7Ht9wiRAzFHrKQ3hQAwgE9gUdxehpanS8Ckvjq6YyNtKjMWd3/VmCbXE38MBlWa
         d1l3yEqMofX/Es2xCGZZG+PZiRE/t5E3XdSA9fn8yLbfLwGDAozJAARAKOWGOtPezx25
         9q1eYfXBzeFdBTX6noBQki0VufIpaOOSeRQ3pVzGjdjpnJt4FKP4DPihAaFnKuxSb1Oj
         +ntZP3OMsbi9TkJmFf00JuuWY2C9CFZSyh73neAXHnRIuUbW50M5gaIARtUjsn623hrU
         2eMJgZV1PZXv+yGwgYM54TRGFvHCqakcjC2QccsLIA+WZJCpLOcAtrrJMX1MzL8LayuV
         7MPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633377; x=1792238177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=;
        b=M5Jz+iTpVoyFdJ//GaatVH6RipJBuVY9b4KUduJAcQr7Oq33DCWmB5nut+x9gmoGiT
         4R6aHxvXPvZ4/HXR1cLzoFBmGU/YC0k6TkAJDFBN1HvuVZlS5INIuJ5ioPAneWQ7vuTq
         p0D96VFOsyjAhr7aVRJLRhOyj1v88oKGbd+50VyoJ0MddLdrlbaGlAIfxkrN9dj27XW9
         IpZ+AicFBVu8QKmnGalHQaklf3N01JlHBgNAv9qB9+nYBzaeLP9Sd1vR/UiobNNOOcQm
         O4aa+BT0AQ+xzO0UQUBh27xR5kvmNeX3qLMBUicqQ+2+bpDTCi9/eDb2JR9ZxFnDbpgU
         I9ww==
X-Forwarded-Encrypted: i=1; AKwUvBwsL6samst2N+iXl3B3tYoDmljaAMKjWtWDmHn4U+yn5g0qZY71wZzTDksvu/45nAJ+xhggLXRsTQUxAJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA5k7NfdRf63hLvaGOOl82Pemvg769S5EZu8JcZaZA6dSn0ajx
	F/XG7IPH7W01GKTzNoCPHyILZVsQhL7wXFiw7u2bZsXM4BWHHkip124i
X-Gm-Gg: AYBFou3a+3oXaeBn25rj88s3jTkzKTg+sCjG6p0Yo0Hj/g5iX+8ahxpxHoJsckopMtN
	QrOGCrA92YTHOpkswKwz0xgNzTRQVPAO8dKRq307jqS3/i3rR4c/o8QYciLgkAT7ARnMP/4BFcA
	beg/eKj7D+IM+3MnCrUz+OyH3v77dOl/jN2OvZdgOBM79L/+5aSksLm60AfC8kz5w2EmsFR7IjV
	l7jVehjRLiOTlixs3gZlwrHY9LmQC5oYXow+T4wbHdvBWJqLpqOiff88CgQNfE+P2+MqNGsa97C
	pq09OjKYSvcoMhEFXjUPENAuuqgW/UnnXTY40bxPaFUn++Rn2w4eqJfDxOzJM9hNFn+OJ52HCOQ
	M/iju7N6JEp6APj+WVmTJyVRhb8ZcF0rC3u7Pl71w218sqC3Bmvu9mVs6SkDuext+FXI4BRIiwW
	BRgB3BwFs/6Ytdo7wMncMwovgkwK06CHx8PyFGUdnqRnJXoUYXsNYkYBxJ9C34bc50Bw==
X-Received: by 2002:a05:600c:820a:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18e4a3f0dmr88323785e9.13.1791633377176;
        Sat, 10 Oct 2026 04:56:17 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:16 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] arm64: dts: mediatek: mt8167: Add HDMI display nodes
Date: Sat, 10 Oct 2026 13:54:07 +0200
Message-ID: <20261010115539.9237-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required nodes to drive HDMI output on the mt8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..ab76e0637eb1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -112,6 +112,27 @@ apmixedsys: apmixedsys@10018000 {
 			#clock-cells = <1>;
 		};
 
+		hdmi_phy: hdmi-phy@10018300 {
+			compatible = "mediatek,mt8167-hdmi-phy";
+			reg = <0 0x10018300 0 0x20>;
+			clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+			clock-names = "pll_ref";
+			clock-output-names = "hdmtx_dig_cts";
+			mediatek,ibias = <0xa>;
+			mediatek,ibias_up = <0x1c>;
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		cec: cec@1001a000 {
+			compatible = "mediatek,mt8167-cec", "mediatek,mt8173-cec";
+			reg = <0 0x1001a000 0 0xbc>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_26M_CEC>;
+			status = "disabled";
+		};
+
 		iommu: m4u@10203000 {
 			compatible = "mediatek,mt8167-m4u";
 			reg = <0 0x10203000 0 0x1000>;
@@ -120,6 +141,15 @@ iommu: m4u@10203000 {
 			#iommu-cells = <1>;
 		};
 
+		hdmiddc: i2c@11011000 {
+			compatible = "mediatek,mt8167-hdmi-ddc", "mediatek,mt8173-hdmi-ddc";
+			reg = <0 0x11011000 0 0x10>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_26M_HDMI_SIFM>;
+			clock-names = "ddc-i2c";
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
@@ -145,6 +175,38 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
+		hdmi: hdmi@1401b000 {
+			compatible = "mediatek,mt8167-hdmi";
+			reg = <0 0x1401b000 0 0x400>;
+			clocks = <&mmsys CLK_MM_HDMI_PXL>,
+				 <&mmsys CLK_MM_HDMI_PLL>,
+				 <&mmsys CLK_MM_HDMI_ADSP_BCK>,
+				 <&mmsys CLK_MM_HDMI_SPDIF>;
+			clock-names = "pixel", "pll", "bclk", "spdif";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi";
+			mediatek,syscon-hdmi = <&mmsys 0x900>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					hdmi0_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+
+					hdmi0_out: endpoint { };
+				};
+			};
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.43.0

