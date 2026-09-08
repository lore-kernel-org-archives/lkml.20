Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEA2526A8F;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=jCpE0siG/olkSE/+Ez/guKSF8n+LypETG0RDYf6Ey6g6Uuq4HyzLcFT1EDZjSs16Dcs9SGHA/bnESKzaG4kfMbP22fjYzIilGRKxXIBvla0mrzqfsp8LGZN7MhYV2N939a7EaTTkclcc+sXJ0Iu40sidYcalprfgFJQvzMVKI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=wjWHYMGGPiiY5KFppAP+tjkV0njxtlntuGZteZN1CqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrSyvBAo/7/8nOPIDHDuVgsmkphTIRmEOV9SFXL0sk5+Sva6AII32fIj9z8wgP2avGwiecjNPS6ApIlozO60Ajn4TZmXTGHC7CMJILA6wqVbujvEIJHFDwPOJpjNK54D149Z9VajS0uBtdqHDpEOT4onLQFhOLD0JCl2V7vw/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWU8I6if; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWU8I6if"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C734C2BCB8;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=wjWHYMGGPiiY5KFppAP+tjkV0njxtlntuGZteZN1CqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MWU8I6if7WrGOfNj0KWzg75xB3JadxVhOZJ8IO9ybxsqlJdw/QRqf5UR9FErLWjie
	 iy6yt1aozd45Z645UEB7mcLFS32aH4N/8JlZvC4/7trf4xvL1BG++xE0lgq3DLXAhg
	 PI8OjV29PIENrdWbbAooXZ8Y2QgNENeTKgwk06pnIxqA6GuBWXJmlqR+Fg+9cKHkoF
	 qqpQIMV47HOrnZDY0/JDQLQbjXu8+VAC/Z68K7xxY7en1jSQi34kN7dYRwYrVpdNnZ
	 XXrE6IUrUlYp7ekrh9BU3LsDoVpGoLdJyXpubVboW7yOmBlb+alDo+2/X9LXVfRQrX
	 Sdk1E+w0dO0lA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B093C79FA1;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:41:04 +0400
Subject: [PATCH v4 11/13] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-11-b789702f0695@outlook.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Stanislaw Pal <kuncy7@gmail.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=1434;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=I4jm4NWYfCMkGfNzx/usV/Xj+0IxIcI5RxXPlEHXCyw=;
 b=92bG5hFNoqxnQJvD9S7r7KVqQKonFMOwhrB8+3T0BhQ6xGpaEM1ImTkG3Xunqsd4ep6jd5DWY
 voG1iyJ4eFZCaMGP3b5ZbXyU7ohU3al1rSWF2dBZmvpjcnreN5YW3mx
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add aux and lfps clocks to USB controller node for Super-Speed support.
These clocks are required for USB3 mode only and are not needed for USB2
mode.

In addition, set UTMI clock frequency to ensure it's parented correctly
and override the clock rate potentially set by the bootloader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 34d882b047bc..a6e337e137c8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -604,11 +604,15 @@ usb: usb@8a00000 {
 			clocks = <&gcc GCC_USB0_MASTER_CLK>,
 				 <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
 				 <&gcc GCC_USB0_SLEEP_CLK>,
-				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB0_AUX_CLK>,
+				 <&gcc GCC_USB0_LFPS_CLK>;
 			clock-names = "core",
 				      "iface",
 				      "sleep",
-				      "mock_utmi";
+				      "mock_utmi",
+				      "aux",
+				      "lfps";
 			assigned-clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <60000000>;
 

-- 
2.53.0


