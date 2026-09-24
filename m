Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D1243F4A6;
	Thu, 24 Sep 2026 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236525; cv=none; b=qkYBM0EWMy2d0yiEoBWyezq/dgYJVq+uYiYqY8zwl/r4a21+Ua6yZNf95kNSkTh8Of9nGcwy+twvVp6OOaKGcMzMZGJ3fyMWKeDV3lGOf3KU3bdXz5kHjRM0E14IE4u408tFYBCT2j3jCXdQVTf7EpmKjEVqGFzmbIycHuC+II8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236525; c=relaxed/simple;
	bh=N7Lv5ZvVnfmc8YhjtdO0ynxxHEUuhEVfylq50/tI/yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsAGEvLhuouAmZibzt+PJs7HtTOvL5QeDPiT5WClpH2vZXztOdmn6HJCZy8PsPe8ppWVyDzbk4JmZ5a6kMaSw5Q9Mjog+uUVeVB6CTbZzi3jsn57yT4y0oA8usKzQE/rHSJnUoPDXupD9WgvRhuIfl8myEiAK5qHwU3N9TE6ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmMHAHab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmMHAHab"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ADC3C2BD01;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790236523;
	bh=N7Lv5ZvVnfmc8YhjtdO0ynxxHEUuhEVfylq50/tI/yA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PmMHAHabQ3Z92hA2f5WVGj/GOx3FUqqKgoSIRP1GD1EU83P97O6u7FLzjBzwJKRqs
	 jnlFE6ddDDk9eOthU03GPvDKuOzHiK9yEwA1QrAsMCjUiX3NdudSPsKng0zLvbsibk
	 WLxqG8iabbxPDKYDtXBnb80mvhlPvEj1Pep3oWci2J5wMu8rWheb3Qkjo1uF1MloHk
	 qmdFQWir29NDaJkbkQ3phE3RBW6HPpoufuCL3dUR7EtosJ9veSY7SPaiIclIj7y7eP
	 iUgM7o3uyHnLR8g69+O/W1OyI79i/b2lDv4VQkVxuzkQWuhvK2IzS6Hh+7yPWSze8o
	 7qp9P6P3S+dCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18145C98318;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 15:55:12 +0800
Subject: [PATCH v10 5/6] arm64: dts: amlogic: Add video decoder driver
 support for S4 SOCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-s4-vdec-upstream-v10-5-1289303a58a4@amlogic.com>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790236515; l=1805;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=6mvln4gF/Xr6GIzNj9H9+pGxV5CsOeJcJGZ1vZicQxY=;
 b=faBz9U3pQ3gGMhcO6UDvCnuCBusZ+3DrvKrGcCQ10HES5y5h1GFXUm0EjHNcZlwKk1q1maxdK
 niCyYZcD/oxCoMztV7guvSswihBOsokNYeRxbdrNKST9o4gGXEBgc+1
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
index 2a6fbd530836..7a1dcb3951c8 100644
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
+				      "vdec",
+				      "hvdec";
+			power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+					<&pwrc PWRC_S4_DOS_HEVC_ID>;
+			power-domain-names = "vdec",
+					     "hvdec";
+			resets = <&reset RESET_DOS>;
+			amlogic,canvas = <&canvas>;
+			amlogic,secure-monitor = <&sm>;
+		};
 	};
 };

-- 
2.42.0


