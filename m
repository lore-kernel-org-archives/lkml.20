Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2748526A99;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=QjqOQ8G48qtQ+3ao0L28w8ZUS7P/VTvd4FKnistk51FgTuDDSy/CdK6lFNis6VeaZ7m8X71+bpmtb7buR2hBRZ+YUZ3qNONfQ0SVWlWiinCVmSsUyhFRzXgZBLBQM1Bf66BtAqehekrdXmL1eIdQSF464t4zlkynd9MgzElROT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=6Pg056yYXzBCy1r8gHAQMUILwrcGvqIRlccK+SCvndM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSXopOpomK33QX1IPwTM0B1Aq8yuyG8gWD3wvVTZipaZ1tSwZakyqcv+Wf4IjFCNsj614pM/1olGaYEiIW7FPO1Njujm4NBtffuhgHq53CR12ZaF/+xfMzrVjfklcSgUWPnaU8Sr4DxTH+4jk4Vj1Z5UuvnrppOfJdDXQNQkiYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tk+5k8vc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tk+5k8vc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E50BC2BCFD;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=6Pg056yYXzBCy1r8gHAQMUILwrcGvqIRlccK+SCvndM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Tk+5k8vcVCw/8/CAosGKP0PXphlCID9czKlNE8GXPQonMX+qTb816S3FjXyNaQyZS
	 rsL3OYq8F4QijFIb2RzTemb5Jp3Wp6iT92ZvT3QCRpKSR7OKvduTkdsoEEYQqJEFTS
	 peSsaltaM50sBjpkzWCyyU2yEfjx84VFZCLq30Qhx8p4VpDEYr0/WqX+Nj/je1BySE
	 sq82Ja4RO77dA2748IgfmT3yKRz/DgePGOv44Le3+nigOqgE5ai5JyZ8KkC2DVL2Db
	 eZJO4UpWbrD40bPdTsiKO5dFkL3U+x6VE0E96t5/zJEtF5e2N1DHSEctHs9Lqwdic6
	 G83lMKbNyfPug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC02C79FAE;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:41:05 +0400
Subject: [PATCH v4 12/13] arm64: dts: qcom: ipq5018: Add Super-Speed UNIPHY
 to USB node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-12-b789702f0695@outlook.com>
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
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Stanislaw Pal <kuncy7@gmail.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=983;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=EHNPdJoLDki9kvFwibHMHsxbeTT5//UH8U5tcciCAP0=;
 b=6NyqUCjIxQxnKqMl2ofSls4YZVVMbqAgjueSnu2r/2cx+kbOLXCQK/4xF/NN33eQlbp3atfQR
 MU9WnGocuL1BZ7lyxLPkM9kCncekhaIrCNQXtJ6Ydukx44xLJAvUXm2
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add the USB3 UNIPHY to the USB controller node for USB3 support.
In addition, switch to the pipe clock supplied by the USB3 UNIPHY
instead of the UTMI clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index a6e337e137c8..8e5d45a214a5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -627,10 +627,8 @@ usb: usb@8a00000 {
 
 			resets = <&gcc GCC_USB0_BCR>;
 
-			phys = <&usbphy0>;
-			phy-names = "usb2-phy";
-
-			qcom,select-utmi-as-pipe-clk;
+			phys = <&usbphy0>, <&usbphy1>;
+			phy-names = "usb2-phy", "usb3-phy";
 
 			tx-fifo-resize;
 			snps,is-utmi-l1-suspend;

-- 
2.53.0


