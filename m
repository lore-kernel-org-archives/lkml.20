Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02C4657C2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766562; cv=none; b=fnZNIY6vPxlNFJORumT/J1yaVuhmz7cvOrocqE/7XKbm+7jFkcSJVcZcFy5dRVTVIxEuMUUJjEQGgpu4kIRT+zLEH/Is+7vdRnI+OMTdzpVEOXZF3zhLj6rA+uKcMEV/yBpfJfdP7Wh8EgMbzrcZdgCQqeUrmGDPoYFMqAXkT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766562; c=relaxed/simple;
	bh=3TCVRpyMtLBUwXhD4LAjcMa96g1JsE/uEZ4sxjKr0EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la41gZ1ZrnWgftZE+s1403O3KCSSuV8v8M7DpXd1RN6P1ipJAuEsnlXZ4FiWIIuu/iY32B97x2ROaa5CpItFd5gPOgT9J+qLMEdEt6J30jGhkFlyTv0HbblWFAFo0P6uNSXVAJMeW7DpN3tUAtufaqd+mJ8LJsjGRSC7p6peTxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYARXxtf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYARXxtf"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c25366c9b42so13132666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766548; x=1788371348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoBaynn1vHYZ74QoHXFsVGgkHF9Le9ACndSMTCi52n8=;
        b=DYARXxtfeCIn3/HZ4T7JuH2Zwp472bZK/MvIyngedbHAAnAEr/TrWr7ZVoU2hGrAcr
         iwILUeQNH9Yj1pIfBo753cvxLKThvXVoeJ0J0gY3a6gFb85ipXKimtFgGYls92PXLMsz
         aMR3ENEp5jC97Lrjc/YtR8J0GCmfiaG3MZkOOIlg9+FvejfQw+tAijGQCx/aELVQK0Jr
         P4nxFk+PgJCoI+WxyX2uTAenvG3114SspHeggZ7v/BAeiuivqpuUiXcMS+OG9DjkyDGj
         sx3Q4yzQpg4MLGi+JYvXCxZ1JbbnIqFW5sEVf37VDcI5sMb81ZinvZmi92LXwVs67LM0
         CJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766548; x=1788371348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoBaynn1vHYZ74QoHXFsVGgkHF9Le9ACndSMTCi52n8=;
        b=Cuaihvm9x8P6y2zYfGAL4/rSCWVpZnc3qds5SdEF+EYbZf1wrL9N6ixHoAeTvLAYNe
         bVTh85s4rhyy0d3dILLBYJyY1xWhB6vCM4iemh1FXrKLL26MJOjhH0p4OXdj/YpWzybj
         ZkCb4vDudFhrt9w5/mtLD3WF9/pEYg6Qh+EkDpHyImZrkDKQdc3szGlms/eENHBKx+7t
         oGl9mCvnd87iHUAsHLne3DxzzyNqBxYrCoXugikW5cnHr4yZ2l3IJAOXvCao59HobV/Y
         iBWqQj2ljiburwbZZgagDKE+txePNak9vSEuh+JfPnwz+pjWpjNub//OKiTx0ZrjfO39
         o1QA==
X-Forwarded-Encrypted: i=1; AHgh+RoHuSoDfA5TFDTs08Mnwa0Q/QjsycjwlgyeomXk5IerIE0vtJSfovnPj7N5bN6bchXFojd8I2M3SAar0wY=@vger.kernel.org
X-Gm-Message-State: AFuF++mTk1V7bhI6mnaqfEYN5AU7bJOPD3QYi0aoHWEWw0KO3/XKweVF
	+9CWyJpcEjkOs0WM8jyOkYh7aXOtB7uPPqP2plLAn4Y0nKjxRH/iNahv
X-Gm-Gg: AR+sD10088pcxlWui55lqOoGN+Hv36zVzvUiDfnx+opiNgorGSRKUALnfLdT/8j1cqp
	gK9d74MuvFRQycR2g9XK+4Aqfgp1Ke9u0U3748xRr5S4BhwjFu3O7h/J7cwA6jXch4CwPVoJQs3
	62sgfP3017eczKWUcnpAuyH40g1WY0zHXzgrMhRf/JS0QTVxzJSHwKLrVeoFtCnHCqXWWieITMt
	gFVr+g1/D30zcxyYLtyT0YAoxzm2C8c+xHOsiNDMxQ5ZI0YCbMEV6ts/ZePZzFCBSHZcdZkg9nc
	WFAN+9MVq7x3VUsf0BnaXwsCFTyRW8IQbDeh2jhH7ij5fYqgMDotHOV+G1wMCO2tKQylgT+teY5
	8YlTutYdjqVy04oZM8cNF9EWVYmctm6wBCwdIpEC/32M3WkdSLXOe8gTOI2LSzA1IVBvllR5qG/
	JTOt7bweRKDLN8Q/kViJNnFvOIO5Eqr6AlHlaq0Y6DY4rGpuz1NYU6eJshpoZTwgwNEPYwY+nSy
	QsVdtARVbUSAQ==
X-Received: by 2002:a17:906:eecb:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c250c3935b3mr1143856366b.17.1787766548026;
        Wed, 26 Aug 2026 10:49:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
Date: Wed, 26 Aug 2026 18:48:44 +0100
Message-ID: <20260826174854.199139-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add DU and DSI nodes to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Dropped renesas,sysc-pwrrdy from dsi node.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 6ff145dc81fa..cc8bfb24da87 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,49 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		dsi: dsi@10850000 {
+			compatible = "renesas,r9a08g046-mipi-dsi";
+			reg = <0 0x10850000 0 0x20000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_CORE R9A08G046_MIPI_DSI_PLLCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_SYSCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_ACLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_VCLK>,
+				 <&cpg CPG_MOD R9A08G046_MIPI_DSI_LPCLK>;
+			clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+			resets = <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>,
+				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>;
+			reset-names = "rst", "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&du_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		vspd: vsp@10870000 {
 			compatible = "renesas,r9a08g046-vsp2",
 				     "renesas,r9a07g044-vsp2";
@@ -721,6 +764,40 @@ fcpvd: fcp@10880000 {
 			power-domains = <&cpg>;
 		};
 
+		du: display@10890000 {
+			compatible = "renesas,r9a08g046-du";
+			reg = <0 0x10890000 0 0x10000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0

