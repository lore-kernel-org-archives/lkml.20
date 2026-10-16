Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED255C322;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171014; cv=none; b=r1GPjlICQ8MrAE2m/dEpc+ob12LMry2EADQkjVPo8pTNhI297B8cwBIze2hew7Zo5kBArZf378C/x1ZOgY4h/9IxHIj9Mh9/+viS6hIUCvmvpC+cnhp4idsFjztxC611i0G8Dv5cT6PaNhgZCjQ9GtFFNBuTW4VFyTYBvfPF3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171014; c=relaxed/simple;
	bh=N8NEwzojQLQla3jklAl3N85hxfcgpsBNXfZR/hJZlhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbUZqB4BBmFYHe6upqL2oIjcNnzdnMuD+8oCQ/EVU8fQWQUSwlh6m8S20NUx3rqemAXGfH8hu77Ye3FBL9Bu7buXrP2wHKuoDpphmsXeTGOaASOen0U2O0zt1k73Z2JZ3lsg2hZ2m5Pi3aOJLhQl2muLac6qxsPtdsNsA7mrg6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZNy3kvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZNy3kvd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0593C2BCFB;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171013;
	bh=N8NEwzojQLQla3jklAl3N85hxfcgpsBNXfZR/hJZlhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WZNy3kvdk9rjaubTdFjrB3M+jaV03tomFfvC/t3Jb/uVwh6aoKwTeGskC/Mvs8o4H
	 LPRCX+o5EqaxKq+X0RwTITSB/iJG2683GpGWFyWakLn41LEdVjswHJeW6xw4xJAJXQ
	 4FVyysetUBhbuTGb2DJLyX7eH9M+m1/JF6iAgyVs6RPEae8NKlkmulb9VUurwvi5OY
	 LaAg3QAntgbmwa0Q2/gCsScsmb2P9ZJC//OXmSrJDQ6efcVvF8+SXjuf3Wbz7xc3p1
	 Qf2NCvxBd4hAOGIGtMcN8mxqFkNS9J8BhAms9rgA1ovW20tUBTnTkeb1SGK4G5Mnmt
	 KAcsfNOjKzYrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8D9CCA462;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 16 Oct 2026 19:16:08 +0200
Subject: [PATCH v7 2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=rtWuGUHxUnyMFKCauIYV7dFBkIsewyYeUUnSeGS6n8c=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9al6L9xesu5MirzSo6qR09S27CcNdhW2ED5m/SB+z+3u
 R/ZOcOvo5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZhIOwfDf8+XkrzCQQn/m49f
 XtS+bvnupQ3r5TY9+p31ZrLP06ZbyVyMDOu3+ThrVf197at6tUjRYsE5/4YTO1deTLGViJrbzyC
 wlxsA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add six temperature sensor nodes using the amlogic,t7-thermal compatible:
a73, a53, gpu, nna, vpu, and hevc. Each sensor retrieves its calibration
data from the secure monitor via the amlogic,secure-monitor phandle with
the corresponding tsensor_id argument.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 66 +++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8aa85aab30469..c81632d3984e8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -696,6 +696,26 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			a73_tsensor: temperature-sensor@20000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_A73>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 1>;
+			};
+
+			a53_tsensor: temperature-sensor@22000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x22000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_A53>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 2>;
+			};
+
 			pwm_ao_ef: pwm@30000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x30000 0x0 0x24>;
@@ -818,6 +838,52 @@ sd_emmc_c: mmc@8c000 {
 				assigned-clock-parents = <&xtal>;
 				status = "disabled";
 			};
+
+			gpu_tsensor: temperature-sensor@94000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x94000 0x0 0x50>;
+				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_GPU>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_MALI_TOP_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 3>;
+			};
+
+			nna_tsensor: temperature-sensor@96000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x96000 0x0 0x50>;
+				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_NNA>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_NNA_TOP_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 4>;
+			};
+
+			vpu_tsensor: temperature-sensor@98000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x98000 0x0 0x50>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_SYS_TS_VPU>, <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_VPU_HDMI_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 6>;
+			};
+
+			hevc_tsensor: temperature-sensor@9a000 {
+				compatible = "amlogic,t7-thermal";
+				reg = <0x0 0x9a000 0x0 0x50>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =
+					<&clkc_periphs CLKID_SYS_TS_HEVC>,
+					<&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				power-domains = <&pwrc PWRC_T7_DOS_HEVC_ID>;
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 5>;
+			};
 		};
 
 	};

-- 
2.49.0


