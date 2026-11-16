Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814804;
	b=0Bn7Od5r3rXsIhKfjZVjM0waINs8CN3qte98pF1SdjzDXv8c/BUfphvXeOo5p9TIGEk0
	 jduwwVtpWiB5ZmQYXtVA9nE7pse3RF8UToF5HqiOYxsllRpehcjh10O6elyyqHHvTEN/0
	 FDKee0L7P3/9R9utcYNFnPhP8y9rB/1NYyPvEtgtqkMq8hSL/FUj/QKlhPPJ9Vn12DT4O
	 +6c73xLcsPTvEDMeRGyPhrubvuKZayNcKBhLKHG71BndB9rloRkO84UxMZme6akUgx42v
	 I9kaAu5IiKl6KdbP2dC0TpmROlxiCvdf76iaxWJdZE99F4oCboKSc3Phc7mBVQtwkCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814804;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wvEYxJFKhBRmBNHC8aThj1V72Xtc0PKWu5yC+Th//PY=;
	b=FUireh5l5YlY3ZOy/8SgJOovBB5zzWQxzkiSlP8sj7FxprlvspntWdQfoTq8hT60ZeJ7
	 MNPT8kk/jeQ9CAypajEOCfSpu0Ifxo+yNY78WwUR9SlTTzwHvxLslC7DWefPY/w7uMPxL
	 wI45PUTS9IBrEl6OdA8+wx1pycNT/LKX+vHZ2MqUId/aKdgcx60Mz/OAC3N1QC/2zcCGT
	 sJDKsZNzBqEOdjH9NnAq/5fhaTTquGam6McDVBYT35qj3DdQuRdd6H3SEakpw5BqoKpfR
	 4xUrxm93uJdS3Dn12vaOHw0G1ExNJ+qlFSw0X44EjKYRaLManYfLyj8ANGM2fhNCUuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kW7GubKE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB4A60A260F;
	Mon, 16 Nov 2026 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kW7GubKE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814803;
	b=lFmMWBECKPEe/JJ2RcGrsIsuvIBPHbpU/QsMseVrqf8vcEoKtUPzrnra/JF9F4tab9HD
	 GGlhzk9blwbutFoJj/qkWgdoN8QpReTsPT8GYCWEaa/wkQwKlCBljSLVqcmq5SKta+tkl
	 uvFsoDy63tZ3NnowedKDoutvTZSPmmZAFhvVrpIMIB8rADs/++H65Ku5CzEV8NrctGTF3
	 yy5K3bkoXYfnZ+TOTYdbOK4Qs8pk0RJdGLHcwmQVwZY46eDE8wRoEohBaOwtgepne5rMB
	 zmlTmURsEzCifYmhAHN53W7M7deKWGrSlTt8HCioRtakK8esbNN4BF9PyHquIIZe9rA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814803;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wvEYxJFKhBRmBNHC8aThj1V72Xtc0PKWu5yC+Th//PY=;
	b=QSlv278hbM+8N+5cbqUN0FHQC+jRn4EPDhvhL699tXye2AlqWfBPXMkUE3gIbu4cIrV2
	 2Woo5o3RSFPgDJ3JRKSUs28lAt80uS0qJjMv3I3r0bWL7+jPBDuxqIpScou+dF+SYjgl5
	 BClXAeQrVB5ikOnwz87CQgoMPJszRgu676MOfKptbq7QJYS73PbGZjwEm8RItxTXpqpxq
	 2QsdxCVgBJCYqEAcyHWFhrEzf0JHZZqB6Dhao951HKEgl9fm/wHe6m7hI82ciAaXy9ps2
	 Xw7H4BuG0FEgR7sdYRu2bLmcOE3Ds1RNLtdYWfmvU58d9qyODM8JMEkmO3avUEcy54A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39E411F000C7;
	Mon, 16 Nov 2026 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814803;
	bh=wvEYxJFKhBRmBNHC8aThj1V72Xtc0PKWu5yC+Th//PY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kW7GubKESlJbz9xIfuQWwFfEQlalKrB+Bu8Wd2/cpHENdWdRqJ69J54HZGEKEBEKP
	 lZvvA8/hLdEgGzwZRYiORky0OiUEepGcK08ly+GeGKvLABIMdGFyhXteJb5Zv+/skB
	 r4ZPL+T3TJ7xwrCIKPwA6iBgt8OfT/aUxrmNlSb6XWexCVW0gPG3CUScYXJFyUrtzi
	 ksQuyVmFD81jtizD9tzaTA96lu3Js5PddvtrqXuPW4YZ2TQoFsFxtn4+TIIHHJN13y
	 rZCBywtrFPYjgd0q/zBAeOPRTeE/4MUctbQ+0d0RPWjdKqjNVxDYFBMsLbzmJkYoNb
	 fSLFY2nS7yWnA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA50E4A3B5;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:06 +0530
Subject: [PATCH v2 08/11] arm64: dts: qcom: kaanapali: Add the second DSI
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
Message-Id: <20261116-molokai-soc-v2-8-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=3419;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=U/kAZqJinyFM9ks7miQ2Li5YKnjDiymSoxhtLfY6dPU=;
 b=USxX83FTE/cCI7b8j3+4hKBDZ5x4UvM4lk+YapuwWxjKr9fWuQ9EwfRzMoXuEeZ5cfHThMUz6
 NnR69yMnKTLBVh/Il7k3PflFYbPmD6JnIK88xZOP9MFSyZnlF7HOjoT
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
2.56.1


