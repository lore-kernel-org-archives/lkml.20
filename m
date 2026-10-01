Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C994848AE;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841227; cv=none; b=FWa5wN4CKgvAilyIRbgg1OLBXuCrCIajF+Vq6HYaZHYP2q7Ssznf8GsbetfS5vV5eifxojvzXse+ubbb8JKHQmZArXMqUAS9ta4jloQ9OdObLHf3qeNgdKjPzhoa7hYrpJQBs8oC7eZEGMj8Hl/2sPVdynG4a82j6uzGrLQfkBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841227; c=relaxed/simple;
	bh=9pmRrRaam6uEO70GJ2x0UYYo3WY1EcxCPvDft4ZE35k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWWBnizm6SOctpRm1LNZ88LwGC2EYtvUJ36ZB/aa8+oyRMzmOuFA783smzba5W+TWvNyYVILiU7SO0zTT+4BmIa8fnBH18vTAwphOAV9EZbn0Hi2m+JCoahaoFSQeCSKbpW6yBfftHozMfy6/ye1KCjkdP9W/DvhuT/RvYpRUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgG56o+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgG56o+W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53DA2C4AF15;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790841227;
	bh=9pmRrRaam6uEO70GJ2x0UYYo3WY1EcxCPvDft4ZE35k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CgG56o+WEhrNwJ6W/R5pP8sKlUl7EkmlNbGio8npN5c/m95gh4XLZg6Dba2gEGnHG
	 Bu8q+Qmi2KXlss76hcfiDYgV+YoUAoLx9xo0ZetRPXYS+neFzdGvmDhZlfHVG9+/e4
	 86mFSvNOfUck1NVxrFjzitQL8UPz+IO27qnIotL9h6/1xqfVMivuGGbjKa3t3Pbbm8
	 QSdwem+eWjABCZq6YR3ACeomQgvuqu/i/UCNWXFFRqMe8q5vmaisSZxmHxRfz5gAbO
	 45lAZboC3JMzRYgCmIcortFUY3N1M2OfPMV7P88YucTorg7wexP12WIjZq79oISJ0H
	 w3/K4DzkCAgIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D300CA5FCF;
	Thu,  1 Oct 2026 07:53:47 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 01 Oct 2026 11:53:47 +0400
Subject: [PATCH v4 4/8] arm64: dts: qcom: ipq6018: move DR mode to board
 DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-ipq-flatten-usb-v4-4-486a4d5ede30@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790841224; l=1489;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=izI5IcQk6NKbrqzHGrnCk168sTzcVUyTXS4Zk6Lx0GY=;
 b=/a6MJvhoJuRDDhmzvzqWyacVUACg184zaP/cx7mzsN2clofo2IEWGO8WEo0ZzvVrmk59TJUyW
 mb5hMtc8RjlCkZ4ZBbGLQWszH+yJTmflCH2s0e3rmdfzE/R0S1mqqZb
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The controller is DRD capable, but it's currently set to host mode in
the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
cp01-c1 board DTS file.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 4 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 9c69d3027b43..a366be17c251 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -48,6 +48,10 @@ flash@0 {
 	};
 };
 
+&dwc_1 {
+	dr_mode = "host";
+};
+
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio42", "gpio43";
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 0701517275d4..c02110ad9cb0 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -460,7 +460,6 @@ dwc_1: usb@7000000 {
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
 			};
 		};
 
@@ -716,7 +715,6 @@ dwc_0: usb@8a00000 {
 				snps,hird-threshold = /bits/ 8 <0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
-				dr_mode = "host";
 			};
 		};
 

-- 
2.53.0


