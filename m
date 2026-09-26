Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742E43F0B9;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426434; cv=none; b=YadQZtwbM1+7bIDnibIZtTKxaIYLeMqH69QyDd29b3eB0cDH2rp7YaZiWBkz+b3tB6UoEH+joWcIs5iLQ4DqxiLP9lP4mUXHxDjyXs4jxQqvPQ8r1zGuGU8YmvFnfqaWAgGLaoqp+XoGaK6xK8hdrC/tgN9l4z2TZ+mjDAc/HLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426434; c=relaxed/simple;
	bh=LLyswk7NKb2yaS7ZWh+Mum5Z3Tsg6nYRqsHAkNeDZ+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uzof55dQrGBRnQfE8OHBviLWKOuaIgDkBLfrmR9yy1wh8iDWlPjJi8PIb7CRIfZz8hufVDaFDEuDobzb0QK+pY/X7auXDv1e+YIfyF4Mn3bnSSXZVtRP5wQqAIGmK/ocpnbISD7FW4JFHxH7TTGV6x3VftCVLxU6F+nDe74TWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5mgu/hY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5mgu/hY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6B6BC2BCFA;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=LLyswk7NKb2yaS7ZWh+Mum5Z3Tsg6nYRqsHAkNeDZ+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y5mgu/hYlPnobuZuSbvd41yPRkUg3AORFKZp5IMXLWBja7/YSitWi94GM3nkAQtMo
	 9UqQNIQowZ3E0kBH9IOuRThSc5vTy6ydMku1KioZor16tjEN0ICf9J8E/JguLp5mSb
	 iXZ9EazOILS1WcKcg9W1+o+fDL/5sXIHPU9DAEfGM8HH9jEw8BBnP6bsbdIBZWPW4R
	 oD5L3uKX4R1j3yx7/PNDWll9WKfeRcPnGFA3wuSryQINXpKpMT34dUcolRcAGUF4Cr
	 8rBWUXEwUfNZGUO3Fixn8BG0tPY9ilAQobXbWB3pglHqhi4RxhOWJj6o4R3tVs9FUI
	 IxjzlyKQ1mJ4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D61C98328;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:27 +0200
Subject: [PATCH RFC 08/12] arm64: dts: qcom: pmi8998: Add USB Type-C port
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-8-31adc19f32c6@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=RieyzNgTb75VGeJsjq62hPOrIsikmavlqM7+JXkr+qg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+hRgy8KUAH4mpYNQGJAeTLLsf1WXpUNnqL
 U2lph0zExGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 csT5EACstGo4EK8/PM5YY9feak3r3qMK+hB2xbrMeNEW8ItM8IQd3sen0VXPFVcGzL7XzKbQ/EN
 tDREYBfiN4pfXeZWfXTCr9z3rbv3xT3/jCo/0KYT1dOcOMo6U9M002lq0ZlltL4MMi/bi4N5ykf
 Q/sVh1H82IITWcqriljTQl+4JSzISseeIiIeP/m4kiv3NJ3Fb5wZ/ql1nkqk8MXwJENZAc0aGbM
 /s0gOShQxNEkGUqKSl5owXD60auXbNLnqvWTMmY4krRp0HV9aD8eiQXv+N4F39wCJPPcerJXcJW
 EoLhT9P89LPO1oiWerKUjeNhM0AuigruCZJUJE97xD2JAWimVAvfN24erXzlQuRIN1fEGIEnfMI
 JK1dkMVfDlmuV3m96qe4X1AZ+6xOyCa+8FDFKOHtcrOsLK31PqjMXDRuPuVL+IiwFdFlVNOg1SU
 3tNY3MhhzlcgyU3TuP8og9vnKfWXLyE02r9UeGjtH+Ght36QUW3Dgnp2leEuZM4xJ+evi7vw4ED
 V//UYxzhmJhbGkSDi4FnUG8G9/vdVwzm9ykX1Sl0jFIn4V0Qh0gZ0ohJcVjQ+g1aJCFQrmDbah/
 UmXHkdhVcoFtSmRsEnQXItwZ1rMzvYChAJklsDEPAJioAqWH/ViXc4W3kai+LuO3QRJ2Uf00ynA
 KZ/ZPZYQd+5lE6A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Add the pmi8998 Type-C port controller and PD PHY device node.

The Type-C CC logic is at USBIN base 0x1300 and the PD PHY is at 0x1700.
The node uses the 'type-c-change' interrupt from the USBIN peripheral
for CC state notifications, plus the 8 PD PHY interrupts, including
fr-swap.

The node is disabled by default; individual boards enable it and provide
the USB-C connector description with PD capabilities and port graph.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index cd3f0790fd420..878e577c667d0 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -24,16 +24,43 @@ pmi8998_charger: charger@1000 {
 
 			io-channels = <&pmi8998_rradc 3>,
 				      <&pmi8998_rradc 4>;
 			io-channel-names = "usbin_i", "usbin_v";
 
 			status = "disabled";
 		};
 
+		pmi8998_typec: typec@1300 {
+			compatible = "qcom,pmi8998-typec";
+			reg = <0x1300>,
+			      <0x1700>;
+
+			interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
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
 		pmi8998_gpios: gpio@c000 {
 			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			gpio-ranges = <&pmi8998_gpios 0 0 14>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;

-- 
2.55.0


