Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C93AAF50;
	Tue,  8 Sep 2026 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854087; cv=none; b=XqSXXij777T7FZc/xZL3I0kA6skMQC9ZoKzQUzBp1gYyRaxwy83ySScG9/wQ5++xuyr6iZp0s72Mxy5xpyn2MeNQkolwqx4tT03m1HPAGSA28EMLYrVwWexNmHItWFRVLwdyVwQOJbDCC/IRBE8bh4T6mHDNypC+HP7oBqAODcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854087; c=relaxed/simple;
	bh=SlQO7rIdYY9yChl+hzFYsm/XNTniMdBGjio63bOFMe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGiGAwUQuV3z7nKQn8Bv1fpYThpBIGZi2io1pXtpcxgsk9XFL2FOi26Cf/+Ls8A6VdisJnP/dWkNWRTtlWWeoGXPhQ2bDwzBRNWWQl4KWO/dDzWHDwJbLoHqlz7QZoLevDHiy8L9qnTQTJscxVB4ipk5GKaX5p1OSxYT2kKHlLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyhNdHaj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyhNdHaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942B81F00A3D;
	Tue,  8 Sep 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854085;
	bh=omC+ADQGhWrV5MgDpbp1XKLolbL8X6xWihEXky/crWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cyhNdHaj6xj+bEH2TkiQWZhfuwTaLD6O7vmNeKruGlcq/r2IRFvICieCn4N7WqmoO
	 hcG0nCCeraWrE2eqDxUC+xwBDkczEkTlO1y5J8jfTGAJ8uANBnhhO8xXUYlC3reT5+
	 T7xoUE7PprtGijQIdMH3KrYwT3TJbeUJzmD5SMLWuuIZ00M+5pmvmdJuEVbVLUIjWd
	 nzlYotIDFr/Gl95hxrNmIBeuaUF2txKk4jmEBEuilOA0Tsccp4gWn2t6OgNCXlO0c1
	 TApbb1/7b6eH+Fn2TR40+S4YNrsAE8eIFAqWshNfOXHb5mbXItBZuDW3c78wt/8ERl
	 WDI3xtxEGA3tQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 08 Sep 2026 09:54:09 +0200
Subject: [PATCH v5 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY description
 for USB4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-topic-usb4phy-v5-5-73aac69578ef@oss.qualcomm.com>
References: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
In-Reply-To: <20260908-topic-usb4phy-v5-0-73aac69578ef@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788854054; l=2316;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=lN4nrDTYMJmLAv8lVb0zQ5OyT2boIMiMRaDRPS2FlMA=;
 b=OULxaJdMiV36Wi43wmfNiyFhIBLDMt1SpTV7xco8S34QpuFOTtsb7sYNmkaHPBGEIKPrUr/SW
 WEfSH8lwJB4BZXjPqsr6mXZDJ8RruhKehjlElaa8J/Ei2G8nzdVjXur
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
successfully. Describe that.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 5e92645c5c3c..4df45d9176f7 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2838,11 +2838,13 @@ usb_1_ss0_qmpphy: phy@fd5000 {
 			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_0_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
 
@@ -2909,11 +2911,13 @@ usb_1_ss1_qmpphy: phy@fda000 {
 			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_1_CLKREF_EN>,
 				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_1_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
 
@@ -2980,11 +2984,13 @@ usb_1_ss2_qmpphy: phy@fdf000 {
 			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
 				 <&tcsr TCSR_USB4_2_CLKREF_EN>,
 				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
-				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
+				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>,
+				 <&gcc GCC_USB4_2_PHY_P2RR2P_PIPE_CLK>;
 			clock-names = "aux",
 				      "ref",
 				      "com_aux",
-				      "usb3_pipe";
+				      "usb3_pipe",
+				      "p2rr2p_pipe";
 
 			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
 

-- 
2.55.0

