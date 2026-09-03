Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C8B47CC74;
	Thu,  3 Sep 2026 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445585; cv=none; b=SYFkrOVShCYHG68Q2y1YEtY/lJ4yOkO0rZMU6fzSS1KIgNhI14jx84MYSuo4XFL8fDI0ParRrzB8SmRGTaI42b+IC7hNJU53PyqFgly7/jzyOsKRNY78GYSt55IXGmft6q28wdZtPtmqld1m7IV78yRCKNkeek9zvLV/nkLydBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445585; c=relaxed/simple;
	bh=JlSMYZ+4V4OpSGriq7gNtX0StDzqhXwIpNiq1DF+AyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kim2kVBbpCjGuggnPClObOVfvtDXX4E3WT3kduk14NpwugigrqIkpmIeke+UkZBFLtTcI8zP6aX0Qatgy1bxtDI+70NemMjk2/+XjDoNEiEy0o4mriJHGdj8K+DG4YyrN0eRSmLe3rM8e37dc2aoPSMxRj5G/bmzUV2ZFAYPi7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsfmEqql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsfmEqql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AA31F00A3D;
	Thu,  3 Sep 2026 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445572;
	bh=neRbU9LB3Xemki7gzCW5yXCFDaWy8dIX25VeagDVLmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lsfmEqqlxSeJ7faIAfwyZGPVcWq1w/O1ch81KPFoKeNfzAJJHV89W6wwQnv9+eKkJ
	 WFPfkVP1tsHuvF/4Te2bORFgqAo/1sqHVLLENTPgT70eTNvvuwqaa/znuaeiNv0Nod
	 6tqNNCoUf0JWi5fLiy0+QIMwWEGbyjJsgqty5CFm/tRQ9zXlGzVCnVIPBFIhm/WeFG
	 +8OswQhQlMqXWwLa8pEyS78S9QnsL/seCcpU/+CyJST9r/GBifI4gKM5JRy/TQXWij
	 TodE5eQqh+sX1nGmjvEJ3RDbt12dPfYVnSDAVuKr3wot2nbUGTA5V5CvrnMThOujNo
	 F0o69tWErlhxw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 03 Sep 2026 16:25:31 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-8996_61x5_qusb2phy-v2-4-4c3f980a4560@oss.qualcomm.com>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788445548; l=1162;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=72aq6zdogIVPhFTOVVc3SSaAPJKqzNxzekc641wndko=;
 b=L/IVNJHtX8+XZYw855/myqRIYs1Y21XX5/1bTi7uFAbIdUpSTzBGtEBS0LPa1YpNW1JAEH92/
 yR/R49TZSIzCRI79aIGtxp8EHs/nZ2SgjLPqL6qxsX6lUtF0wzAzhtK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
Describe that in the DT.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 818e5660df91..cf17dbbacad0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3216,7 +3216,12 @@ hsusb_phy1: phy@7411000 {
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			power-domains = <&rpmpd MSM8996_VDDMX>;
+			required-opps = <&rpmpd_opp4>;
+
 			nvmem-cells = <&qusb2p_hstx_trim>;
+
 			status = "disabled";
 		};
 
@@ -3230,7 +3235,12 @@ hsusb_phy2: phy@7412000 {
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+
+			power-domains = <&rpmpd MSM8996_VDDMX>;
+			required-opps = <&rpmpd_opp4>;
+
 			nvmem-cells = <&qusb2s_hstx_trim>;
+
 			status = "disabled";
 		};
 

-- 
2.55.0

