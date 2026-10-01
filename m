Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853449BD67;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841227; cv=none; b=K0lrSf/RzQMLuoKOspOdaqvIcrOunIaj5hR1cogSW2Sh/9OGxwSRNrMrlhtKLzB+8F04yP8gArg7aYvcL4KungIXKpXEtylEwB7rbkFdqIec9aw98qjh1mpNz0LFSapbc8MIZV/Z2cTOqcMlHd3BDs8bGxuSmfgx1g/blFI1QSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841227; c=relaxed/simple;
	bh=mXVxe6b6xew+DvrrFuaxHs23vSnFiVuLIlCSziONU5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hz2H2dQ4IwjTo+w4ArDrrHK1bWK1QQr4hFATUJTtth10ceuDPywCC2LXR/zn0k2iAnVggAUgHGsn4Rod8sFvQpPXLwV+2kn98i2+h/yj1U5WXIx7f+9BI5t0t2/8FEFUixSGxkBkKG57vs0OOyZfndPXJuHsu0fWFurhLomykMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ls66d3Uc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls66d3Uc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CE33C2BCC7;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790841227;
	bh=mXVxe6b6xew+DvrrFuaxHs23vSnFiVuLIlCSziONU5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ls66d3UcGB2iA7iFBvxaytvtTaeBNltLQd+Vy7YUEOjoAA5b2h7cgbhqZVRSkKZWJ
	 DOh7qykpMrxmnABrWCpx9G9Kn3XmXO2vz577rvbIHEVBOcM2LdYKtUo2BNCQk8SJP2
	 QeUaVARDwlrket5mWSraTqx5vTrnDWf5i/jHGBh/lVOctZXgo+atMgVa2mZWD+vM29
	 ubCEpa47NrNE4nsBwiLZHjJtx5sZ6WjdHEwxFQh785OF433LvPE4RLRC3GYhL6NlQE
	 eMNtC/eF479Sxr220ssjlCoYeFs/Qj0H2Jp/qGD8rvMLM0g7w+XQX5A5TCeXHQgfCb
	 n/VGUNjJzG8tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69286CA5FCE;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 01 Oct 2026 11:53:49 +0400
Subject: [PATCH v4 6/8] arm64: dts: qcom: ipq8074: move DR mode to board
 DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-ipq-flatten-usb-v4-6-486a4d5ede30@outlook.com>
References: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
In-Reply-To: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790841224; l=1503;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=qmM2R7+OM68/+nLOf39C4WPiUO7NnJg4JhHjsYPC0lY=;
 b=iUbAuX8e+2VZRuBoYhyee06yuAO8e/3lJNsSuQCnnxm1nXghhFKoyujES6mqe4yWhO7aiEui6
 JpN+USm1HfABdpggWzDle60BwDyg0KXLHaDb5t+uz5uDA9S4RiE7V3j
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Both controllers are DRD capable, but DR mode currently set to host mode
in the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
hk01 board DTS file.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index dea5ece600d4..75827676bde9 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -52,6 +52,14 @@ &blsp1_uart5 {
 	status = "okay";
 };
 
+&dwc_0 {
+	dr_mode = "host";
+};
+
+&dwc_1 {
+	dr_mode = "host";
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..5c57d9cd72fc 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -671,7 +671,6 @@ dwc_0: usb@8a00000 {
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
 			};
 		};
 
@@ -721,7 +720,6 @@ dwc_1: usb@8c00000 {
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
 			};
 		};
 

-- 
2.53.0


