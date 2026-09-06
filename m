Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C183C2796;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666767; cv=none; b=MaQZTojqg4JL3OOohMKgzzeIADyzAUFCekRTdA/6GQkaBO2S59/KMeZeB1wnz7et2XEWXjhfzswyyVPf9JszktOvixfqKgA8crnxdKqo1EDm6wZbcrcbOByaQ6Fsdwxf65aerVkpp6mkgSuxV+G/iOORebFIqY5R3xPqFOoQi5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666767; c=relaxed/simple;
	bh=XU/WWn6wXEnjfkMrNJ55MXZyduZW1YwOpLbOtLkSfNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeYykZgRdwID7kJ+KXuKE0dsL/n47zz5wzqTGjjcfGRlil28dRG9ecr5UGSbzwOHkEfUhbCIsDuUDTrqKKEP457I5A/mVw1ZJwig2OYcKj+8Dvb6QH+pqMh4SBWnt4J+jA9qHx7nL991MH+HXF2XJu24Vs6A7z7GRLOkhWf1edE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwN3SV0A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwN3SV0A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEEFC32782;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788666766;
	bh=XU/WWn6wXEnjfkMrNJ55MXZyduZW1YwOpLbOtLkSfNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kwN3SV0AHP0rq+WGUrARGzaYyjjTrU1ZrNQdi6KUd+qbTHkv91zdZSx/PDcB0p51Y
	 lecNwCRePQJomafyKuvSkL1oev7yQp+1gnZR4cC62H+bSwAF2aoQuKkky3VyS+ON3m
	 ytwlbHpjOc7rFxaWgQ2qCUVXnlF4SnjvCRMZ+TBJe+ei17nwXD0k3gFG6Rdhl4HKec
	 cf5ihheu1b/trwjQnfeRVS8zVAhBQhryI1RVoLCExWni65EjE0vK+OAe5OruzIz3Jt
	 seNQXl4cUp0Pse86P9tU1P7bwxQgIxID45QLK/61OSKIrIdmzyl0XZ7Sz/9E6jXhx8
	 B05TKMpBF0wSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81324C79F8C;
	Sun,  6 Sep 2026 03:52:46 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 06 Sep 2026 07:52:45 +0400
Subject: [PATCH v2 06/10] arm64: dts: qcom: ipq6018: move DR mode to board
 DTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ipq-flatten-usb-v2-6-dab83120b10a@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788666763; l=1428;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=aGVdbmVqvLfMC/B1qmTc6oe5SvSsjf2fzGsuzsOSZC8=;
 b=pU0XsMbU5kHa5qlEPqBb36gmSFBGQ+/VDqKxjy1m/4Ui6ObpiyfoxjxcrNHvHWAUdy/hcoQXJ
 zA5OjZoTRsmB4UgEs8lCzZY2GOpGQiRzN3YRWqzgzJkDRETIYZDjalb
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


