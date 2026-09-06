Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94D3E00B4;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670022; cv=none; b=mYl02Iar0If/VhuV7u0Vc9LaI1eLKrca1mW+4yaj4mXz3O3CWj+XXirMNAzTdHkwpxZDrjwIg/BN9TqrjNnlop89qwsfE3cLP5Wv/okKN02bpPKmx7yrCn4i/4wQbwI8ZZzY1se669WZse1fIwPF3SgAixZuIAFy6mcDxmKA56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670022; c=relaxed/simple;
	bh=yePW7swJKp/CoAXYJIlRrxTJvJHLYrZ5g7dI2UeDTAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNWKFlOcH4zovH8Joum1wSK4xxKT+sy4g963CGUIzW7N/zpNJIdJRKTy2E+7pEkH6w8DqyHIG22d0AYTvk6x8iZiK8tmp8lIKTFIrQjOf3RK1lTp60xDxAUv62t3pj/Dohnv8mXzsJiLPGSH5ul/6vpxMllLQFFtVAhbK6ySnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=soi5SNDF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="soi5SNDF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C65C4AF0F;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788670021;
	bh=yePW7swJKp/CoAXYJIlRrxTJvJHLYrZ5g7dI2UeDTAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=soi5SNDFh/trvsmHLVZ76ty370tAJh8AzmfD39kbQyaqKZ0ca5kEuXTmDwXfN8W3T
	 mPzQYgYReIdgnN56dCGg5OaM2a6mwQe4jCq31KMbOmxGrmBbzc5Kjq3fyuuiKFe6u3
	 7QYGX5ncvQnVHTxOYpq/nmwpTI7axMkmwRdP35P4MoDSwf/EZDmuYK0aqeHATOTbwr
	 Y1AJXn4TgplBIE8wgWTsGxv1WNlbskH8sd4GzZiATRRbbbwNqMebSPA4DGbAthNidF
	 Z0ynexfVhW8Oa8GRvN8Awm9+gFIPK7tsT4+E5aLxs0sqd1ewYnmHXe/mdEANC431Xg
	 Re0LV1ALJx3oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FADC79F9F;
	Sun,  6 Sep 2026 04:47:01 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 08:46:47 +0400
Subject: [PATCH v3 08/10] arm64: dts: qcom: ipq8074: move DR mode to board
 DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788670018; l=1442;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=e2bv63iiEX2vz7ZO+5BDlb9OpNBUY7Sx/1y6B5CVxhA=;
 b=tdvDgmtfQNfTNjTOU8XvzRd+3v/W49bvVzIlI1XsYR/iaw9NxHZFMcU+cU5m1y27CHi0F12XS
 erP6HDk2bIkBsF+fEWtJY0jXnskvcCDAtaQgAXNVWr6pwyoSWd48wX2
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


