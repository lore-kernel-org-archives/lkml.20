Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA243F0B6;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426434; cv=none; b=YlNZgFMjPOGTerFgiFjByYHyeE5GgAVu2M54Q8c3KTreXp4BsTgVsHLe0fK8ojb/SvPHVT5A0NKq89VVyQ5pj0UqtDeWziEMyzL6U1GnpLGcL3uhLa0aayLuIG4n/XrxYfHYmM9wKVyBu4tFrT5QMjPlxEBq2zW1EaopslS/ieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426434; c=relaxed/simple;
	bh=68Xo+7AbOTjtfo8IuA3Hr7KPjXQFLlOeewWxpvBQVgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2IDqWEAtewbiayatgoheJtsyxyX4zl9ykTU9ue2MrmNfGb6zyle+BU9okPRmX1Pgzwxi1OIZx9AcPl4PPnfKiY+EclI/Hpr2WkC95KQKWIyK78ozZH16scglvoYWriV15+fc9XhyDwovat4mv8G90I8oVlSTrADxBCXKRe/cBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqt5xZgn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqt5xZgn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C95D9C2BCFD;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=68Xo+7AbOTjtfo8IuA3Hr7KPjXQFLlOeewWxpvBQVgE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jqt5xZgnHJOa3OxB1/BVrQ7LoUoWcm/2e7BmzfqFS/mb8s1jMN0RYAI08ZvRemgnz
	 sq37C6X6AN65iwaIywFM5Cf1Gyf7320+3cCwblowkZBrHxBxiMl5P82/lhv7i/r1Ik
	 us9X7gASb5KnoXNvG1Vn9t/AV9VnmIeI2kFhrbp5fAufm2w12r7XliBrKgJZioysdk
	 gHNyewXmw0xWCJrp2v3tQfSRMm4DmY/0G6Q0lhMQ81oaLRi8l1v5N5rXV1v88nXGvk
	 f0P6iMcgSsmgUk2GtIRfZrKcEUMR8/4Os1PPiO4Rcapqq60fYpBJWijfpsgJokwZiS
	 ye2xbSvweTKBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3377C98338;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:26 +0200
Subject: [PATCH RFC 07/12] arm64: dts: qcom: pm660: Add USB Type-C port
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, mfd@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=nfUfneQHFyPXoTLQ2iDCROlyx0D+c7Q2EAHBttmHuPo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+kPL94BUUjOGf4dU2jnzEuweWBFTQyYS1b
 HYZ1UvtVlyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 cqVREACz+DbVUSwKhcqkKE4OxwCx4JSHA1cEOJA49V4LAZx/la2dL4AiUV3IlxIFYTbqLfKPpRR
 eIaXAYKkUUnmXwNsEPZdpqPuruUdkhWm0phR28T7BRg4V+xf6d5euRn4MKo0OyErAAmsQbyxNPA
 Xgxy0vCVrIybsEQwoNvK6UiSXbRlDyj1FZcc+fGmw+br9xRysgXO2ucMfeYlfWROW8d1Jg+zkqr
 SU5/sVC0l60Oof+kgzSki+rrdc4FL+FPaeIfz1gUydnS2FCRZOPMVRB9vZ64E4bdENd6YvoLb6Y
 S0G0MV7BJZRsdGFqt9joe/i8M2ZUrH0GJ7dFsk9zyKSqn7nwZS+5RQnWrjPWqddxV1uSSmWmqZp
 Z1S1DPPVg0fQXxUCctvsN1+lNzkXNmVqsfDxjIIZkl3KYil4EdpwD5+xhOTmv6BuqVH4tJXjApx
 s6V/BJkSUwmfocC09nYr2bdS9wGqQQ4N3Hmb4E++/jw8C6DPb45WBrv7lsC7ofo7axuPHG3ZR4i
 8jgGB2fwINzKdsN1GGWrqMw5BJnVScWmmE4kqDFoaBlBcPAUV0jpRmW76LwRIPFHOuoCRk/qPa9
 aSBijLscrdMObCOLrHYFMS1ockbiHDiUqWzyZmDugImCaodL56lrSlY9/GlsMn5c0zarR3DxeHM
 5LMkgFXkKssTOyA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Alexey Minnekhanov <alexeymin@minlexx.ru>

Add the PM660 Type-C port controller and PD PHY device node.

As on PMI8998, the Type-C CC logic is part of the charger's USBIN
peripheral at 0x1300, the PD PHY is at 0x1700. The node uses the
'type-c-change' interrupt from the USBIN peripheral for CC state
notifications, plus the 8 PD PHY interrupts, including fr-swap.

The node is disabled by default; individual boards enable it and provide
the USB-C connector description with PD capabilities and port graph.

Assisted-by: LLM
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index 156b2ddff0dcb..37965a3607417 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -85,16 +85,43 @@ pm660_charger: charger@1000 {
 
 			io-channels = <&pm660_rradc 3>,
 				      <&pm660_rradc 4>;
 			io-channel-names = "usbin_i", "usbin_v";
 
 			status = "disabled";
 		};
 
+		pm660_typec: typec@1300 {
+			compatible = "qcom,pm660-typec";
+			reg = <0x1300>,
+			      <0x1700>;
+
+			interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "type-c-change",
+					  "sig-tx",
+					  "sig-rx",
+					  "msg-tx",
+					  "msg-rx",
+					  "msg-tx-failed",
+					  "msg-tx-discarded",
+					  "msg-rx-discarded",
+					  "fr-swap";
+
+			status = "disabled";
+		};
+
 		pm660_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;
 			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
 			io-channels = <&pm660_adc ADC5_DIE_TEMP>;
 			io-channel-names = "thermal";
 			#thermal-sensor-cells = <0>;
 		};

-- 
2.55.0


