Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019939A7F6;
	Sat, 26 Sep 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412094; cv=none; b=KugojvAK8SqNu79nvQlQP2c6y9NKlSGpMfsY3X+v4cX9k44qMHdjy8fONxe7LqrnEGBGDIh2Kn8A7pQvI+j+U4+0frDTdYqxN3Phw7uXlblgIsjCGH5BHI0HTuKRvzUF4t4enDgyrUgQjp0QXBcKqb6aIuMwZfYFbyS5mmX9ZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412094; c=relaxed/simple;
	bh=g+EB1wjoNEnqjJC3WrqySm0REtyLNj4JLPDu4gJwruw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CtzespSxSTJ0ZvzvPyuFuRl9VdYwdquT752bb0blvmK3RV3QTYRDLcJ4O5l/f5jU75RCQOEgiYtSWk6WQr/QL2cNaPJCxMw/BMxCKG14ZVskf5G7aVWMoNERNSn7g65eYEmQ4DaQpbLBkr/i6Vkg0Ipsxar9Z5mU8BxGsvan/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3WUf6qq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3WUf6qq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EE61C2BCFB;
	Sat, 26 Sep 2026 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790412094;
	bh=g+EB1wjoNEnqjJC3WrqySm0REtyLNj4JLPDu4gJwruw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o3WUf6qqt1231F7jLTR/ZAbjJzR9whaLIixfreDh9GojMEGAbU2tsxpJReUvxOzEy
	 fA69UOcV/hEksoiYsliulvR6lp8UfYG+mS+/gqK5CIC4wRrMvIu3UzEdvHby8ZLZnP
	 CcPuJMjgQzT97N0khX4y4tCnQ58nyQLtoNoMwcA8HJqoCwPUMM7YGw676SUXq/vKix
	 UH/iO6hqhtKV31EBAVlYO+BbVY7ajQ6lNAGr/21MMi1mY2YcDVdic1T/X7ZGcbMHcQ
	 ytI9KKS7w55DbWIjUv7Q39ekbjhN8hqv1oOjCE0654aaVpAdz6RBgbqMxsxz1nhvRm
	 PURj+2YFVRsog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DA7C98328;
	Sat, 26 Sep 2026 08:41:33 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Sat, 26 Sep 2026 18:41:33 +1000
Subject: [PATCH v5 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-2-db74ff64a7e7@samcday.com>
References: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
In-Reply-To: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790412092; l=1396;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=9CQfuWOlFNnOp0D4+o8CnpcPvZdqy3Z04YUVtMuwdKs=;
 b=YI68qATKfOBH+HfpdAGyr8KMA3c3iHD58TG9YQ7dUzyFtTZbWrST7TyAbnBtw0tGCaMpTXRu4
 oF+eyJTGSw5AsQpPc1O3L+Sz/7heNBoJniybw0EjNXPSV6gV7x5wVRc
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

Values are taken from the other geni nodes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
Signed-off-by: Sam Day <me@samcday.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 09e9d5afa6f65..966ad40ea61df 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1060,6 +1060,21 @@ i2c12: i2c@a90000 {
 				status = "disabled";
 			};
 
+			uart12: serial@a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart12_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
 			i2c13: i2c@a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a94000 0 0x4000>;

-- 
2.55.0


