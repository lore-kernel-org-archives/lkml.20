Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31443C2B82;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666767; cv=none; b=P//WaLIv+pERRHZFXkhMudS6I89b81HX05SIfiTltt+Vy0KUaZAhdzT6teC86f7HUQrqsQPu7pNSjaJJZlIpPRc2bWp1TF1WnV0ODiBQaDAJLDC1736oFoM4nIvNG40rh6JYoEqifNHK16Fq928EXlgZRBCcGGtR4OIVdpGQrqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666767; c=relaxed/simple;
	bh=yePW7swJKp/CoAXYJIlRrxTJvJHLYrZ5g7dI2UeDTAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9qk6QrximIUoQLpT7ia1anDp1uEwaxduYQA9jQRmRsH7g99oyX4q+UPdsGu2xEhANzgzb2AxJA1SIefuG183oDROLUkREgs1nYliILuu8BYqeb7Yns42th7O66YmPUcQbJKRpzO7gVWpxDYYrmeE58m5Cme7mTvzI7ySSDHSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVOGJkjT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVOGJkjT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1E12C2BD05;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788666766;
	bh=yePW7swJKp/CoAXYJIlRrxTJvJHLYrZ5g7dI2UeDTAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NVOGJkjTSe7zrqAsZWbWrLRfZxMjlL5Eb6hl/1G3dGC2zR67jxFSnuj7OW1xBm91s
	 U3lSlkgLcnQhzVM4ZHE5HF3G5Iwi1AcUa56KXbTAT8FF/pa25Vwpma6nP919veqOoL
	 wNyj7AzWjIr9YAbqQuUrj3PJ5MF0hCkHszcmVVv5Jq03xoMhtRL8d2gfCj8L0pEw9m
	 Inu3wNGrxWMdCRVYbK/CVKAqdLFqHpr25JatQkdqR9RfAfFFcA56qZNF/HvBsP3cpU
	 UPN7SU4n0vGgJkDaRDflQl1otAA6bB2bbEKXEsx5Y/2x64EbGJjRVv14qCihYRU/Lj
	 3jQludKMeGaUQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFF8C79F9E;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 07:52:47 +0400
Subject: [PATCH v2 08/10] arm64: dts: qcom: ipq8074: move DR mode to board
 DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v2-8-dab83120b10a@outlook.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788666763; l=1442;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=e2bv63iiEX2vz7ZO+5BDlb9OpNBUY7Sx/1y6B5CVxhA=;
 b=awhmJK0WkTBNEITZA3WInbCpwJZGXBfTGtJXBZErRwIMc5nvzUO/j49DVivooSLA4rV1czXcJ
 E36w67eqmwYB5v99mG9qWgIapUdL8va1/5ywp0kJul/CfI33VOQjUlN
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


