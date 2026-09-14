Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E4E3F787E;
	Mon, 14 Sep 2026 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373426; cv=none; b=ZDex6hmmRDt+RHNeMLHkQIY7pgzSNegxiRwHgRwKwRHHsU/TbMB7L72PPziAtZSXcQCoz3ojlEdPeP3QGNPDqnpwcYKThYfskJGxsAOY8nT9PwLvxt+Gu4p49Zx0Oa/q9FSobD1/B+o7ff6AyCPeMZl/GrtWNUwN2Vrl2hiVgM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373426; c=relaxed/simple;
	bh=lwJXVr3wc26b+3DxMp3usk6z4LJrnsg7CkkD3KcfV3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i6rIR+9PtQ+Xt0opHqJchiL/KFIFpMXrzL6a2MZ3Yfp/6HtAd7EerxqXIDfjRgE+RViV5dpyTX13kmH0Cpo4ca++P/mHTu3+b0+HLDm7rvD/KZzWcmWVSRuyh30hGvTnoYCa7eJszTue7aECJoCkjP2oXKizsa7OjG9OYtorcCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsKN2WzV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsKN2WzV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08BBFC32786;
	Mon, 14 Sep 2026 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789373426;
	bh=lwJXVr3wc26b+3DxMp3usk6z4LJrnsg7CkkD3KcfV3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UsKN2WzVRq3Cbb1cdnLE/EmusX2BsRxlJoLLUvBUDsw7/RD67kfC9VTu4xymlXrKK
	 B3yGMKtAZ3/Ezlh/AirikIB0D1hTIHp4xMRArDd+UE989GXii/wv7fnsCM1rebMB0M
	 OAtDmBaYnx8z8/RzXS4hQ+sfQb/O6vcJDqlb3sYOcQ6baBKeb9TRLA4wIQ/t+6v7qy
	 F54DAJHvGTkWy5twd7PbwIyU6L+C8uGvEewzKmHHenmai4R9jy42vSZor4TCt8A10g
	 Ni737HApULR3m4cjUNhzWvorJldFhM2cQd+KqEayyGzoMRs9nubuSS1J3pLTbp4qNE
	 QdcCl/uOcTkXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9679C88E6C;
	Mon, 14 Sep 2026 08:10:25 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 14 Sep 2026 16:10:22 +0800
Subject: [PATCH v9 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-s4-vdec-upstream-v9-5-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789373423; l=1809;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=H9IyUCO85svTK//eBl/nrcLMkGvELMBTFbFDRfZO4Og=;
 b=TyFJRBe//V50cIkGl76mxLDD3OV0/mV8Q6EPSUGAt0ND8X2dA1JaB94rRd3+2h0YMC4hK9zYt
 OhAJtBbcoNTAQxewrFAwExWEe8IJO6+NMmQEilSSpIoYp0lWGnThJ6p
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add vdec node to enable Amlogic V4L2 stateless video decoder
support. Since the video fw needs to be loaded via TEE helpers,
enable the optee node in this patch.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..d62e93a28098 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -80,6 +80,11 @@ pwrc: power-controller {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	saradc: adc@fe026000 {
@@ -907,5 +912,33 @@ emmc: mmc@fe08c000 {
 			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
 			assigned-clock-rates = <24000000>;
 		};
+
+		canvas: video-lut@fe036048 {
+			compatible = "amlogic,canvas";
+			reg = <0x0 0xfe036048 0x0 0x14>;
+		};
+
+		video-codec@fe320000 {
+			compatible = "amlogic,s4-vdec";
+			reg = <0x0 0xfe320000 0x0 0x10000>,
+			      <0x0 0xfe036000 0x0 0x20>;
+			reg-names = "dos",
+				    "dmc";
+			interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc_periphs CLKID_DOS>,
+				 <&clkc_periphs CLKID_VDEC_SEL>,
+				 <&clkc_periphs CLKID_HEVCF_SEL>;
+			clock-names = "dos",
+				      "core_v",
+				      "core_h";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "dos_v",
+					     "dos_h";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			amlogic,secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0


