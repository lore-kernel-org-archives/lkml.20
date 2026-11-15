Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774014;
	b=U4GIogWGyvtlAeRFtUf7/6NFcDIe7K2Py1NhFWDerc+EI2wnnOwpY1hhKSyghzDvlxj9
	 boTx0VYHQvhrGKfEssSFbzslQIzpQ9wbPVEl03Ajjyfw6+19HMxwtDSNNAKjwZ70CQJqs
	 smzaA98AGU9Rp4wsTPAaB6H/ADuMGFeOQgS9hR4496597COORUsQ13fHodJyjl4ujl/jV
	 dHgjnFmMCf6rPdEwo21UIEJy72cjKNVxEC1YeGpA5ChzQ2w5eZh1G/DFWfXh3Z80JM19Q
	 fpbsmGmn4d6N8vi+v3HUDlowPNr2ipjEZFIsVvHUPDVkKkI2R89NyYNQOrUqW5LgcbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774014;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3WANse1/Z4SybM8Y8UxojMm+DxgrNUcUWGP7RNLgmuE=;
	b=j2RwHrV9Bj+1mSYKkc9hAKoBnQg8wMnc/emcknuW5yYz3ktl/UlDQO1rjbD6eCF9oOdM
	 uUnmWymrRLbuYfpr1X8hv8ewwWY2w01qBAAjy+3uqC8ByyPmUH4n9v3ikC4x3zhkiVphS
	 ngirF0b8ZRw3OId6YBkZgAtwTCv0VwkCNYyxu2PyzXc2uTtSjWWEtNNPMG8Vp1hZIdW2v
	 g3rUMeBbYgADh53BHdYAZYqVt2zqyaMhtSP5SHYbAruOKFMXNnH4jlSSQfi1Pzn0KrgRC
	 V3QF1UgjVJtGKX5r3JOFhQ/mScN/7b0rh5UrOZ96YKMJhoP8+IlfZX6EuOCWXDgt/TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCkDklwu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E8B60A2622;
	Sun, 15 Nov 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UCkDklwu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774014;
	b=j6plzu2EBoWwunu3s6Sb0kKpECFIK6QSFtwgwU0VruWsf20xwGNP1Irh2n11h3406DcG
	 pL5fFwDdmDd7JJtd/Isi7Sa9SYiJMYaAO0hwLXzPRGb+1EqvSsse1wip4r+wHdwv3EJoQ
	 nxcLTTBFURZPvw7/7eBQ9vjnfZbr3+5FLLbe0swXgbvD+sFH2wadLCzd10Rxy9xxakuXp
	 BPKiorzPNBBpVuSTc59zw8TOIJ3g8lduZytyJhXBlLJqjOJQ+Dovt0JGRVQfHpVys7wLa
	 sv4jkYLInf3hwZHv97xIsFPRaYcoaihjYNU0pxw6klSiJDs9XlPy73Pig+TRCPR4sgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774014;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3WANse1/Z4SybM8Y8UxojMm+DxgrNUcUWGP7RNLgmuE=;
	b=WGpxpt8JKZSpFqB1k3eFVYAN8Y8y+hLCmt9ZHVfsEZNEu2l8D/YhTMk9vGgMSbVTSxsj
	 MJntH5r/cFjU+Fg90LP1aY0BxxHOnMID9+8jiLyw22R5QPrQ89UF/685yJ5HPJCLLTuX/
	 gbXn/eo2OOjW8Y8lY5EWtddUvWP0nIVrT4c408c8PiBH60s/7MFQOU4EFIvAlnTtBXGtO
	 atefw6DMweuMel8/XSBttibH6fGb0NPsAI7QT9tCcDdhKtKglJYI4rF1nshLTEXgdW1G3
	 FZEDcMVMTREq+WKGaluZ6rMVTW/LKl7Gdf8hOmQVZfS6MmOP3l0kOezWjWo/l01kH+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6134B1F000C4;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774014;
	bh=3WANse1/Z4SybM8Y8UxojMm+DxgrNUcUWGP7RNLgmuE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UCkDklwumcRjrbFkzRuPwMrbMsvJIL1o4hz8DYCuuyEGfnK5rK/QdNfLAbTd2mt7l
	 Ld903xmw0LaD9g+M81XjYP7l7/6P06RURTGqjFP8UNImFvWHdZ38dHcu9NpkHDZnSW
	 UZ7bpFIqPuVk1xkFz/1J2cyXUTl5scy9obsvI6nrovn0+r5ykOR3sbO7ZIm4u9/FoS
	 lLpHtMjabJuqftofNNaXVMLioM22MQxHopUXwX7JOjbxAtIFVF5fx4RPBYu6jgYTAQ
	 /4+nATc/AHqp9MYdu5CMqt3s1xIfYOjTUYJCnhuZLIywq8NJR/iGIori9WDPS0+vCE
	 Rr9tEV3Rurtwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CFA134A1C3;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:16 +0530
Subject: [PATCH 08/11] arm64: dts: qcom: kaanapali: Add the second DSI
 controller and PHY
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-molokai-soc-v1-8-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=3419;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=wDrkI008dcg+rEeG2NLpRAqFPENUTgne41W7xuCrccg=;
 b=pOYL3Z9pT/dLbf6y+4qfDT79SLRc4suCRY/bSaeg6bulqbDO6b9pFb6O63H/VGRp/rtqhxeD1
 eE6mr40f1qCCYjRZ2fYVlpKz+kNmeZEiDp/gGfJVCwSyjiC6CEQFL6I
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Kaanapali has two DSI controllers. Describe DSI1 and its PHY next to
DSI0, connect it to the INTF2 output of the display processor and feed
the PHY's byte and pixel clocks to the display clock controller.

Assisted-by: LLM
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..0c4b6a8b32b5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3709,6 +3709,7 @@ port@1 {
 						reg = <1>;
 
 						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
 
@@ -3868,6 +3869,91 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dsi1: dsi@9ac3000 {
+				compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x09ac3000 0x0 0x1000>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC1_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@9ac4000 {
+				compatible = "qcom,kaanapali-dsi-phy-3nm";
+				reg = <0x0 0x09ac4000 0x0 0x1cc>,
+				      <0x0 0x09ac4200 0x0 0x280>,
+				      <0x0 0x09ac4500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3887,8 +3973,8 @@ dispcc: clock-controller@9ba2000 {
 				 <0>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;

-- 
2.56.0


